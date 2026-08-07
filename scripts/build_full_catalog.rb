#!/usr/bin/env ruby
# frozen_string_literal: true

require "json"
require "set"
require "time"

ROOT = File.expand_path("..", __dir__)
WORKSPACE = File.expand_path("..", ROOT)
OUTPUT = File.join(ROOT, "FULL_REFERENCE_CATALOG.md")
DATA_OUTPUT = File.join(ROOT, "data", "reference_catalog.json")
README_OUTPUT = File.join(ROOT, "README.md")

SOURCES = {
  "AD" => {
    name: "HaoranZhuExplorer/World-Models-Autonomous-Driving-Survey",
    url: "https://github.com/HaoranZhuExplorer/World-Models-Autonomous-Driving-Survey",
    path: File.join(WORKSPACE, "World-Models-Autonomous-Driving-Survey", "README.md")
  },
  "ARV" => {
    name: "ChaofanTao/Autoregressive-Models-in-Vision-Survey",
    url: "https://github.com/ChaofanTao/Autoregressive-Models-in-Vision-Survey",
    path: File.join(WORKSPACE, "Autoregressive-Models-in-Vision-Survey", "README.md")
  },
  "LMD" => {
    name: "LMD0311/Awesome-World-Model",
    url: "https://github.com/LMD0311/Awesome-World-Model",
    path: File.join(WORKSPACE, "Reference-Awesome-World-Model", "README.md")
  }
}.freeze

PAPER_LABEL = /\A(?:paper|pdf|technical report|report|journal)\z/i
RESOURCE_LABEL = /\A(?:code|torch code|jax code|tf code|project|project page|website|page|demo|data|dataset|model|hugging face)\b/i

VENUES = %w[
  AAAI ACL BMVC CoRL CVPR ECCV ICCV ICLR ICML ICRA IROS ISSRE IJCAI NeurIPS
  NIPS RSS SIGGRAPH TMLR WACV arXiv
].freeze

# Only these cross-source method aliases are safe enough to merge without a shared identifier.
DUPLICATE_METHODS = %w[think2drive marl-cce iso-dream].freeze

FULL_TEXT_AUDITED = %w[
  ad-l-jepa copilot4d drive-occworld drive-wm drivedreamer driveworld drivingworld
  gaia-1 gump hermes law mile occworld think2drive trafficbots vidar vista
].freeze

REPRESENTATION_OVERRIDES = {
  "ad-l-jepa" => "3.3 Latent-space prediction",
  "copilot4d" => "3.1.2 Observation-level: future point clouds",
  "drive-occworld" => "3.2.2 Scene-level: BEV, occupancy, and geometry",
  "drive-wm" => "3.1.1 Observation-level: future images and video",
  "drivedreamer" => "3.1.1 Observation-level: future images and video",
  "driveworld" => "3.3 Latent-space prediction",
  "drivingworld" => "3.1.1 Observation-level: future images and video",
  "gaia-1" => "3.1.1 Observation-level: future images and video",
  "gump" => "3.2.1 Scene-level: entities and interactions",
  "hermes" => "3.2.2 Scene-level: BEV, occupancy, and geometry",
  "law" => "3.3 Latent-space prediction",
  "mile" => "3.3 Latent-space prediction",
  "occworld" => "3.2.2 Scene-level: BEV, occupancy, and geometry",
  "think2drive" => "3.3 Latent-space prediction",
  "trafficbots" => "3.2.1 Scene-level: entities and interactions",
  "vidar" => "3.1.2 Observation-level: future point clouds",
  "vista" => "3.1.1 Observation-level: future images and video"
}.freeze

MECHANISM_OVERRIDES = {
  "ad-l-jepa" => "4.2 Latent dynamics / state-space / JEPA",
  "copilot4d" => "4.3 Diffusion and flow-matching rollout",
  "drive-occworld" => "4.2 Latent dynamics / state-space / JEPA",
  "drive-wm" => "4.3 Diffusion and flow-matching rollout",
  "drivedreamer" => "4.3 Diffusion and flow-matching rollout",
  "driveworld" => "4.2 Latent dynamics / state-space / JEPA",
  "drivingworld" => "4.3 Autoregressive rollout",
  "gaia-1" => "4.3 Hybrid generative rollout",
  "gump" => "4.3 Autoregressive rollout",
  "hermes" => "4.3 Autoregressive rollout",
  "law" => "4.2 Latent dynamics / state-space / JEPA",
  "mile" => "4.2 Latent dynamics / state-space / JEPA",
  "occworld" => "4.3 Autoregressive rollout",
  "think2drive" => "4.2 Latent dynamics / state-space / JEPA",
  "trafficbots" => "4.2 Latent dynamics / state-space / JEPA",
  "vidar" => "4.2 Latent dynamics / state-space / JEPA",
  "vista" => "4.3 Diffusion and flow-matching rollout"
}.freeze

# Preserve upstream provenance in `raw`, but publish stable replacements for
# links that have moved or that systematically block automated paper access.
PAPER_URL_OVERRIDES = {
  "https://openreview.net/pdf?id=fd2u60ryG0" => "https://arxiv.org/abs/2406.08481",
  "https://openreview.net/pdf?id=NEu8wgPctU" => "https://arxiv.org/abs/2501.13072",
  "https://openreview.net/pdf?id=rCX9l4OTCT" => "https://arxiv.org/abs/2502.07309"
}.freeze

RESOURCE_URL_OVERRIDES = {
  "https://github.com/chaytonmin/UniWorld" => "https://github.com/whuhxb/UniWorld",
  "https://github.com/SCP-CN-001/ramble" => "https://github.com/SCP-CN-001/rambler"
}.freeze

DROPPED_RESOURCE_URLS = Set.new([
  "https://metadrivescape.github.io/papers_project/DrivePhysica/page.html"
]).freeze

REPRESENTATIVE_DETAILS = {
  "gaia-1" => {
    team: "Wayve; technical report 2023",
    contribution: "Large-scale multimodal driving model that tokenizes video, text, and actions and generates controllable future driving video.",
    state_action: "Future video tokens; conditioned on video, text, and ego actions.",
    mechanism_role: "AR world model + diffusion decoder; neural simulator / data engine.",
    evidence: "4,700 h private driving video; generation quality, controllability, and qualitative long rollouts."
  },
  "drivedreamer" => {
    team: "GigaAI + Tsinghua; ECCV 2024",
    contribution: "Builds a real-world-data-driven model for structured, text- and action-controllable driving video and action prediction.",
    state_action: "Future video and driving action; traffic structure, text, and action conditions.",
    mechanism_role: "Two-stage diffusion; data engine / visual rollout.",
    evidence: "nuScenes; video quality, structural controllability, and downstream perception/action experiments."
  },
  "drive-wm" => {
    team: "CASIA + CAIR, HKISI, CAS; CVPR 2024",
    contribution: "Connects controllable multiview video forecasting to planning by imagining and scoring futures under candidate maneuvers.",
    state_action: "Multiview future video; historical cameras and candidate ego trajectories/maneuvers.",
    mechanism_role: "Latent video diffusion; planning-internal rollout / simulator.",
    evidence: "nuScenes; FID/FVD, multiview consistency, controllability, and planning evaluation."
  },
  "vista" => {
    team: "HKUST + OpenDriveLab/Shanghai AI Lab + Tübingen + HKU; NeurIPS 2024",
    contribution: "Improves high-resolution, long-horizon visual rollout, cross-dataset generalization, and control from commands to trajectories.",
    state_action: "Future video; command, goal point, trajectory, steering angle, and speed controls.",
    mechanism_role: "Latent diffusion with history replacement; simulator / action evaluation.",
    evidence: "Large-scale mixed driving data; FID/FVD, human comparison, controllability, and action reward evaluation."
  },
  "drivingworld" => {
    team: "HKUST + Horizon Robotics; arXiv 2024",
    contribution: "Introduces an efficient video-GPT design with spatial-temporal tokenization for controllable long driving-video generation.",
    state_action: "Future video tokens; short video context and trajectory conditions.",
    mechanism_role: "Autoregressive next-token rollout; visual simulator.",
    evidence: "nuScenes and OpenDV-2K; generation fidelity, temporal coherence, and trajectory control."
  },
  "vidar" => {
    team: "OpenDriveLab + Shanghai AI Lab; CVPR 2024",
    contribution: "Uses future point-cloud forecasting from historical camera images as a scalable predictive pretraining task.",
    state_action: "Future LiDAR point clouds rendered from predicted BEV features; no substantive ego-action input.",
    mechanism_role: "Iterative latent BEV prediction and rendering; predictive pretraining.",
    evidence: "nuScenes; point forecasting plus detection, tracking, mapping, occupancy, motion, and planning transfer."
  },
  "copilot4d" => {
    team: "Waabi + University of Toronto; ICLR 2024",
    contribution: "Tokenizes LiDAR observations with a VQ-VAE and predicts diverse future point clouds using discrete diffusion.",
    state_action: "Future point-cloud observations; past LiDAR and estimated ego motion/action.",
    mechanism_role: "Discrete diffusion with temporal rollout; observation-level world modeling.",
    evidence: "nuScenes, KITTI Odometry, and Argoverse 2; Chamfer distance at 1 s and 3 s and multi-future quality."
  },
  "trafficbots" => {
    team: "ETH Zürich + MPI Informatics + KU Leuven; ICRA 2023",
    contribution: "Formulates configurable multi-agent traffic simulation as a reactive entity-level world model.",
    state_action: "Agent states and actions; player plan plus destinations and latent personalities for surrounding agents.",
    mechanism_role: "Shared recurrent/attention policy and dynamics update; neural traffic simulator.",
    evidence: "Waymo Open Motion Dataset; motion prediction, joint rollout realism, diversity, and controllability."
  },
  "gump" => {
    team: "Horizon Robotics; ECCV 2024",
    contribution: "Provides scalable full- and partial-autoregressive agent simulation for scenario generation, policy evaluation, and planning.",
    state_action: "Tokenized scene and agent states/actions; scene prompts and candidate policies.",
    mechanism_role: "Autoregressive entity/action rollout; simulator / planner evaluator.",
    evidence: "Waymo Open Motion and nuPlan; simulation realism, generation, planning, and closed-loop evidence."
  },
  "occworld" => {
    team: "Tsinghua University; ECCV 2024",
    contribution: "Introduces joint semantic occupancy and ego-motion forecasting as a self-supervised 3D world-model objective.",
    state_action: "Future 3D semantic occupancy and ego pose; historical occupancy observations.",
    mechanism_role: "Discrete occupancy token autoregression; geometry rollout / pretraining.",
    evidence: "nuScenes and Occ3D-style occupancy data; mIoU/IoU, planning, and scene-understanding transfer."
  },
  "drive-occworld" => {
    team: "Zhejiang University + Huawei; AAAI 2025",
    contribution: "Adds flexible ego-action control and occupancy-based trajectory scoring to 4D occupancy forecasting.",
    state_action: "Future occupancy and flow; velocity, steering, trajectory, and command conditions.",
    mechanism_role: "Memory-conditioned recurrent forecasting; planning-internal rollout.",
    evidence: "nuScenes, nuScenes-Occupancy, and Lyft Level 5; mIoU/VPQ, controllability, and planning."
  },
  "hermes" => {
    team: "HUST + MEGVII + Mach Drive + HKU; ICCV 2025",
    contribution: "Unifies 3D scene understanding and action-conditioned future scene generation through shared geometric tokens and an LLM.",
    state_action: "Future 3D scene tokens plus language understanding; images, geometric tokens, and action sequences.",
    mechanism_role: "Autoregressive token generation; unified understanding / generation.",
    evidence: "nuScenes and OmniDrive-nuScenes; generation metrics and language/scene-understanding benchmarks."
  },
  "mile" => {
    team: "Wayve + University of Cambridge; NeurIPS 2022",
    contribution: "Jointly learns a compact stochastic driving dynamics model and policy from offline expert demonstrations.",
    state_action: "Future latent state/action, decodable to BEV semantics; cameras, route, speed, and ego actions.",
    mechanism_role: "Action-conditioned RSSM-style latent dynamics; planning / imitation learning.",
    evidence: "CARLA; driving score, route completion, infractions, latent imagination, and out-of-town/weather generalization."
  },
  "think2drive" => {
    team: "Shanghai Jiao Tong University; ECCV 2024",
    contribution: "Uses a compact latent simulator to train a neural planner efficiently for corner-case-heavy CARLA Leaderboard v2.",
    state_action: "Latent environment transition and reward; compact observations and driving controls.",
    mechanism_role: "Dreamer-style latent dynamics and model-based RL; planner training.",
    evidence: "CARLA Leaderboard v2 and CornerCaseRepo; route completion, infractions, scenario density, and training efficiency."
  },
  "driveworld" => {
    team: "Peking University-led multi-institution team; CVPR 2024",
    contribution: "Pretrains a 4D driving representation with dynamic memory and static-scene propagation in a memory state-space model.",
    state_action: "Future latent BEV/occupancy state and action reconstruction; historical multiview images and expert actions.",
    mechanism_role: "Memory state-space latent prediction; predictive pretraining.",
    evidence: "OpenScene and nuScenes; detection, mapping, tracking, forecasting, occupancy, and planning transfer."
  },
  "law" => {
    team: "CASIA + UCAS; ICLR 2025",
    contribution: "Adds an ego-trajectory-conditioned future-feature prediction objective to end-to-end driving planners.",
    state_action: "Future scene latent feature; current feature and ego trajectory.",
    mechanism_role: "Latent feature transition; planning / predictive representation learning.",
    evidence: "nuScenes, NAVSIM, and closed-loop CARLA; planning error, collision, and driving performance."
  },
  "ad-l-jepa" => {
    team: "New York University; arXiv v2 2025",
    contribution: "Introduces non-generative JEPA pretraining that predicts masked BEV embeddings from automotive LiDAR.",
    state_action: "Masked BEV latent embeddings; LiDAR input, without ego-action-conditioned rollout.",
    mechanism_role: "JEPA latent prediction; predictive pretraining / methodological boundary.",
    evidence: "KITTI3D, Waymo, and ONCE; 3D detection transfer, GPU time, and memory efficiency."
  }
}.freeze

def method_key(entry)
  title = entry["title"].downcase
  FULL_TEXT_AUDITED.find { |name| title.match?(/\A#{Regexp.escape(name)}(?:\s|:)/) }
end

def full_text_admission_override(entry)
  case method_key(entry)
  when "ad-l-jepa", "vidar"
    "Inclusive candidate - criterion audit"
  when "gump"
    "Core candidate - explicit driving world model"
  when "mile"
    "Core candidate - outline representative"
  end
end

def source_revision(readme_path)
  repo = File.dirname(readme_path)
  revision = `git -C #{Shellwords.escape(repo)} rev-parse --short HEAD 2>/dev/null`.strip
  revision.empty? ? "unknown" : revision
end

def extract_links(text)
  text.scan(/\[([^\]]+)\]\((https?:\/\/[^)\s]+)\)/).map do |label, url|
    { "label" => label.gsub(/^[\[]|[\]]$/, "").strip, "url" => url.strip }
  end
end

def clean_title(raw, paper_url)
  prefix = raw.split(/\[[^\]]*(?:Paper|paper|PDF|Technical report|Journal)[^\]]*\]\(#{Regexp.escape(paper_url)}\)/, 2).first
  title = prefix.sub(/^\s*[-*]\s+/, " ")
  title = title.gsub(/<br\s*\/?\s*>/i, " ")
  title = title.gsub(/\[\*\*([^\]]+)\*\*\]/, '\\1')
  title = title.gsub(/__[^_]+__\s*;?/, " ")
  title = title.gsub(/\*\*`?[^*]+`?\*\*\s*;?\s*\z/, " ")
  title = title.gsub(/\*\*|__|`/, "")
  title = title.gsub(/\[([^\]]+)\]\((?:https?:\/\/[^)]+)\)/, '\\1')
  title = title.gsub(/[[:space:]]+/, " ").strip
  title = title.sub(/^\s*\[(?:#{VENUES.join('|')})[^\]]*\]\s*/i, "")
  title = title.sub(/^\s*(?:19|20)\d{2}\s*[-:]\s*/, "")
  title = title.gsub(/\s+(?:#{VENUES.join('|')})(?:W|\s*\d{2,4}|\s*'\d{2})[^;]*;?\s*\z/i, "")
  title = title.sub(/\.?\s+(?:arxiv|openreview|techrxiv)(?:\s+\d{2}(?:\.\d+)?)?(?:\s*;.*)?\s*\z/i, "")
  title = title.gsub(/\s+\[(?:Paper|paper)[^\]]*\].*\z/, "")
  title = title.gsub(/\s+/, " ").strip
  title = title.sub(/[;,.:\-]+\s*\z/, "").strip
  title.empty? ? paper_url : title
end

def normalized_arxiv(text)
  match = text.match(%r{arxiv\.org/(?:abs|pdf)/([0-9]{4}\.[0-9]{4,5})(?:v\d+)?(?:\.pdf)?}i)
  match && match[1]
end

def normalized_title(title)
  clean = title.gsub(/^\s*([A-Za-z0-9^+._-]+)\s+\1\s*:?\s*/i, '\\1: ')
  clean = clean.sub(/^\s*([A-Z0-9^+._-]{2,20})\s*:?[ ]+(?=[A-Z])/, "")
  clean.downcase
       .gsub(/\[[^\]]+\]/, " ")
       .gsub(/\b(?:19|20)\d{2}\b/, " ")
       .gsub(/[^a-z0-9]+/, " ")
       .gsub(/\s+/, " ")
       .strip
end

def identity(entry)
  all_text = ([entry["paper"]] + entry["resources"].map { |link| link["url"] }).join(" ")
  arxiv = normalized_arxiv(all_text)
  return "arxiv:#{arxiv}" if arxiv

  if (match = entry["paper"].match(%r{openreview\.net/(?:forum|pdf)\?id=([^&#]+)}i))
    return "openreview:#{match[1]}"
  end
  if (match = entry["paper"].match(%r{doi\.org/(.+)}i))
    return "doi:#{match[1].downcase}"
  end

  title_key = normalized_title(entry["title"])
  return "title:#{title_key}" if title_key.length >= 18

  "url:#{entry['paper'].downcase.sub(%r{^https?://(?:www\.)?}, '').sub(/\.pdf\z/, '')}"
end

def parse_source(code, source)
  abort("Missing source README: #{source[:path]}") unless File.file?(source[:path])

  headings = []
  entries = []
  current = nil

  flush = lambda do
    if current
      links = extract_links(current[:text])
      paper_link = links.find { |link| link["label"].match?(PAPER_LABEL) }
      if paper_link
        title = clean_title(current[:text], paper_link["url"])
        resources = links.reject { |link| link.equal?(paper_link) }
                         .select { |link| link["label"].match?(RESOURCE_LABEL) }
        entries << {
          "title" => title,
          "paper" => paper_link["url"],
          "resources" => resources,
          "sources" => [code],
          "source_sections" => { code => current[:headings].dup },
          "raw" => { code => current[:text] }
        }
      end
    end
    current = nil
  end

  File.foreach(source[:path]) do |line|
    if (heading = line.match(/^(\#{1,6})\s+(.+?)\s*$/))
      flush.call
      level = heading[1].length
      headings = headings.take(level - 1)
      headings[level - 1] = heading[2].gsub(/[*_`]/, "").strip
    elsif line.match?(/^\s*[-*]\s+/)
      flush.call
      current = { text: line.strip, headings: headings.compact }
    elsif current && !line.strip.empty? && !line.match?(/^\s*(?:>|```|\|)/)
      current[:text] << " #{line.strip}"
    elsif line.strip.empty?
      flush.call
    end
  end
  flush.call
  entries
end

def merge_entries(entries)
  merged = {}
  title_aliases = {}
  method_aliases = {}

  entries.each do |entry|
    key = identity(entry)
    title_key = normalized_title(entry["title"])
    key = title_aliases[title_key] if title_aliases.key?(title_key)
    method = entry["title"][/^\s*([A-Za-z]*[A-Z0-9][A-Za-z0-9^+._-]{2,20})\s*:?\s+/, 1]
    if method && DUPLICATE_METHODS.include?(method.downcase) && method_aliases.key?(method.downcase)
      candidate_key = method_aliases[method.downcase]
      candidate = merged[candidate_key]
      if candidate && (Set.new(normalized_title(candidate["title"]).split) & Set.new(title_key.split)).length >= 4
        key = candidate_key
      end
    end

    if merged.key?(key)
      target = merged[key]
      target["sources"] |= entry["sources"]
      target["source_sections"].merge!(entry["source_sections"])
      target["raw"].merge!(entry["raw"])
      combined = target["resources"] + entry["resources"]
      target["resources"] = combined.uniq { |link| link["url"] }
      # A normalized-title merge can expose an incorrect upstream URL. Keep the
      # established scholarly identifier unless it is only a non-scholarly file link.
      if target["paper"].include?("drive.google.com") && !entry["paper"].include?("drive.google.com")
        target["paper"] = entry["paper"]
      end
      target["title"] = entry["title"] if entry["title"].length > target["title"].length && entry["title"].length < 240
    else
      merged[key] = entry
      title_aliases[title_key] = key unless title_key.empty?
      method_aliases[method.downcase] = key if method && DUPLICATE_METHODS.include?(method.downcase)
    end
  end
  merged.values
end

def source_driving_collection?(entry)
  entry["source_sections"].any? do |code, sections|
    joined = sections.join(" / ")
    (code == "LMD" && joined.match?(%r{Papers / (?:20\d{2})}) && !joined.include?("Other World Model Paper")) ||
      (code == "AD" && joined.include?("Papers") && !joined.include?("Other General World Model Papers"))
  end
end

def driving_specific?(entry)
  title = entry["title"].downcase
  title.match?(/autonomous driv|self-driving|driving world|driving scene|driving video|end-to-end driv|vehicle|traffic|road scene|street scene|roadside|nuplan|nuscenes|carla|lidar.*driv|ego[- ]vehicle|motion planning.*driv/)
end

def survey?(entry)
  title = entry["title"].downcase
  title.match?(/\bsurvey\b|review and outlook|roadmap|tutorial|multi-agent embodied autonomous driving: from v2x information exchange to shared world models/)
end

def evaluation_or_safety?(entry)
  entry["title"].downcase.match?(/benchmark|\bbench\b|evaluat|metric|safety|safe |robust|uncertaint|attack|backdoor|audit|certif|trust|failure|risk|security/)
end

def dataset_resource?(entry)
  entry["title"].downcase.match?(/\bdataset\b|data collection|data engine benchmark/)
end

def admission_for(entry)
  title = entry["title"].downcase
  return "Boundary / review / evaluation" if survey?(entry) || evaluation_or_safety?(entry) || dataset_resource?(entry)

  override = full_text_admission_override(entry)
  return override if override

  return "Core candidate - outline representative" if title.match?(/\bmile\b|ad-l-jepa/)
  return "Inclusive candidate - criterion audit" if title.match?(/\bdrivegpt\b|\bmagicdrive\b|\bwam-flow\b/)

  explicit_world_model = title.match?(/world model|world-model|world modeling|world modelling|model-based/)
  action_evidence = title.match?(/action|controll|planning|policy|ego|trajectory|end-to-end|reinforcement|imitation|interactive/)
  rollout_evidence = title.match?(/future|forecast|predict|rollout|dynamics|simulation|temporal|long-horizon|world model|world-model/)

  if driving_specific?(entry) && explicit_world_model && rollout_evidence
    "Core candidate - explicit driving world model"
  elsif source_driving_collection?(entry) && (driving_specific?(entry) || action_evidence) && rollout_evidence
    "Inclusive candidate - criterion audit"
  elsif entry["sources"] == ["ARV"]
    "Adjacent autoregressive-vision method"
  elsif driving_specific?(entry) || source_driving_collection?(entry)
    "Boundary candidate - action/rollout unclear"
  else
    "Cross-domain methodological source"
  end
end

def scope_for(entry)
  admission = admission_for(entry)
  return "Driving world models: core and inclusive candidates" if admission.start_with?("Core", "Inclusive")
  return "Driving boundary, reviews, evaluation, and excluded-adjacent work" if driving_specific?(entry) || source_driving_collection?(entry) || survey?(entry) || evaluation_or_safety?(entry)
  return "Autoregressive-vision foundations (adjacent, not driving WMs)" if admission.start_with?("Adjacent")

  "Cross-domain world-model origins and methodological foundations"
end

def representation_for(entry)
  title = entry["title"].downcase
  sections = entry["source_sections"].values.flatten.join(" ").downcase
  text = "#{title} #{sections}"

  override = REPRESENTATION_OVERRIDES[method_key(entry)]
  return override if override
  return "Chapter 2 - Definition, boundary, and surveys" if survey?(entry)
  return "Chapter 6 - Evaluation protocols and metrics" if evaluation_or_safety?(entry) && text.match?(/benchmark|\bbench\b|evaluat|metric|audit|analysis/)
  return "Chapter 7 - Deployment, trustworthiness, and safety" if text.match?(/safety|safe |robust|uncertaint|attack|backdoor|certif|trust|security|sim-to-real|failure detection/)
  return "Chapter 6 - Evaluation protocols and metrics" if text.match?(/benchmark|\bbench\b|evaluat|metric|audit|analysis/)

  core_scope = admission_for(entry).start_with?("Core", "Inclusive")
  unless core_scope
    return "Chapter 2 - Definition, boundary, and surveys" if driving_specific?(entry) || source_driving_collection?(entry)
    return "Chapter 4 - Cross-domain rollout mechanisms" unless entry["sources"] == ["ARV"]
    return "Appendix - Autoregressive visual methodology"
  end

  return "3.3 Latent-space prediction" if text.match?(/ad-l-jepa|\bmile\b|think2drive|driveworld|\blaw\b|latent|jepa|rssm|state space|state-space|feature prediction|predictive representation/)
  return "3.1.2 Observation-level: future point clouds" if text.match?(/lidar|point cloud|range view|point-cloud/)
  return "3.2.2 Scene-level: BEV, occupancy, and geometry" if text.match?(/hermes|unifuture|occupancy|\bbev\b|3d world|4d world|gaussian|geometr|volumetric|world volume|neural field|scene graph/)
  return "3.2.1 Scene-level: entities and interactions" if text.match?(/drivegpt|agent|trajectory|motion prediction|behavior|behaviour|object-centric|instance prediction|pedestrian|trafficbots|symphony/)
  return "3.3 Latent-space prediction" if text.match?(/token|representation|pre-train|pretrain|dreamer/)
  return "3.1.1 Observation-level: future images and video" if text.match?(/video|visual|image|pixel|camera|generation|vista|gaia|drive-wm/)

  "3.3 Latent-space prediction"
end

def mechanism_for(entry)
  title = entry["title"].downcase
  sections = entry["source_sections"].values.flatten.join(" ").downcase
  text = "#{title} #{sections}"

  override = MECHANISM_OVERRIDES[method_key(entry)]
  return override if override

  ar = text.match?(/autoregressive|auto-regressive|next[- ](?:token|frame|scale|block|patch|clip)|video gpt|videogpt|pixelcnn|pixelrnn/)
  diffusion = text.match?(/diffusion|score-based|denoising/)
  flow = text.match?(/flow matching|rectified flow|flow-matching|autoregressive flow|flow autoregressive/)
  return "4.3 Hybrid generative rollout" if [ar, diffusion, flow].count(true) > 1
  return "4.3 Diffusion and flow-matching rollout" if diffusion || flow
  return "4.3 Autoregressive rollout" if ar
  return "4.2 Latent dynamics / state-space / JEPA" if text.match?(/rssm|state space|state-space|jepa|latent|dreamer|feature prediction|predictive representation|recurrent/)
  return "4.3 Generative rollout (unspecified)" if text.match?(/generat|world model|world-model|simulat/)

  "Mechanism not specified"
end

def roles_for(entry)
  text = (entry["title"] + " " + entry["source_sections"].values.flatten.join(" ")).downcase
  roles = []
  roles << "Ch.5 data engine" if text.match?(/synthetic data|data generation|data machine|scenario generation|dataset/)
  roles << "Ch.5 simulator" if text.match?(/simulat|interactive|closed-loop|open-loop|world generation|environment/)
  roles << "Ch.5 planning rollout" if text.match?(/planning|control|reinforcement|policy|imitation|end-to-end|decision|navigation/)
  roles << "Ch.5 predictive pretraining" if text.match?(/pre-train|pretrain|self-supervised|representation|jepa|feature/)
  roles << "Ch.6 evaluation" if representation_for(entry).start_with?("Chapter 6")
  roles << "Ch.7 deployment / assurance" if representation_for(entry).start_with?("Chapter 7")
  roles << "Methodological foundation" if roles.empty?
  roles
end

def year_for(entry)
  text = ([entry["paper"]] + entry["source_sections"].values.flatten + [entry["title"]]).join(" ")
  arxiv = normalized_arxiv(text)
  return 2000 + arxiv[0, 2].to_i if arxiv

  years = text.scan(/\b(20[0-2]\d|19\d{2})\b/).flatten.map(&:to_i)
  years.reject! { |year| year > 2026 }
  years.max || 0
end

def link_markdown(entry)
  links = []
  entry["resources"].first(3).each do |resource|
    label = case resource["label"].downcase
            when /code/ then "C"
            when /data|dataset|model|hugging/ then "D"
            else "W"
            end
    links << "[[#{label}](#{resource['url']})]"
  end
  links.join(" ")
end

def safe_title(title)
  clean = title.gsub(/^\s*([A-Za-z0-9^+._-]+)\s+\1\s*:?\s*/i, '\\1: ')
  clean.gsub("|", "\\|").gsub(/[[:space:]]+/, " ").strip
end

def readme_links(entry)
  links = []
  entry["resources"].first(3).each do |resource|
    label = case resource["label"].downcase
            when /code/ then "Code"
            when /data|dataset/ then "Dataset"
            when /model|hugging/ then "Model"
            else "Project"
            end
    links << "[[#{label}](#{resource['url']})]"
  end
  links.join(" ")
end

def catalog_anchor(representation)
  representation.downcase.gsub(/[^a-z0-9\s-]/, "").strip.gsub(/\s+/, "-")
end

def representative_table(entries, names)
  selected = names.map do |name|
    entry = entries.find { |candidate| method_key(candidate) == name }
    entry && [name, entry]
  end.compact

  lines = []
  lines << "| Paper | Team / venue | Core contribution | Future state and action | Mechanism / role | Data and evidence |"
  lines << "| --- | --- | --- | --- | --- | --- |"
  selected.each do |name, entry|
    details = REPRESENTATIVE_DETAILS.fetch(name)
    links = readme_links(entry)
    title = "[**#{safe_title(entry['title'])}**](#{entry['paper']})"
    title += " #{links}" unless links.empty?
    lines << "| #{title} | #{details[:team]} | #{details[:contribution]} | #{details[:state_action]} | #{details[:mechanism_role]} | #{details[:evidence]} |"
  end
  lines
end

def compact_core_list(entries, representative_names)
  entries.reject { |entry| representative_names.include?(method_key(entry)) }
         .sort_by { |entry| [-entry["year"], entry["title"].downcase] }
         .map do |entry|
    status = entry["admission"].start_with?("Core") ? "Core candidate" : "Inclusive candidate"
    year = entry["year"].positive? ? entry["year"] : "year unverified"
    links = readme_links(entry)
    line = "- [**#{safe_title(entry['title'])}**](#{entry['paper']}) (#{year}) — `#{status}` · `#{entry['audit_level']}` · `#{entry['mechanism'].sub(/^4\.[23]\s+/, '')}`"
    line += " #{links}" unless links.empty?
    line
  end
end

def write_readme_core_taxonomy(entries)
  begin_marker = "<!-- CORE_TAXONOMY_START -->"
  end_marker = "<!-- CORE_TAXONOMY_END -->"
  readme = File.read(README_OUTPUT)
  return unless readme.include?(begin_marker) && readme.include?(end_marker)

  sections = [
    ["### 3.1.1 Observation-level: future image and video", "3.1.1 Observation-level: future images and video", %w[gaia-1 drivedreamer drive-wm vista drivingworld]],
    ["### 3.1.2 Observation-level: future point cloud", "3.1.2 Observation-level: future point clouds", %w[vidar copilot4d]],
    ["### 3.2.1 Scene-level: entities and interactions", "3.2.1 Scene-level: entities and interactions", %w[trafficbots gump]],
    ["### 3.2.2 Scene-level: BEV, occupancy, and geometry", "3.2.2 Scene-level: BEV, occupancy, and geometry", %w[occworld drive-occworld hermes]],
    ["### 3.3 Latent-space prediction", "3.3 Latent-space prediction", %w[mile think2drive driveworld law ad-l-jepa]]
  ]

  core_entries = entries.select { |entry| entry["scope"] == "Driving world models: core and inclusive candidates" }
  lines = []
  lines << begin_marker
  lines << "## Core taxonomy: world models by future-state representation"
  lines << ""
  lines << "All #{core_entries.length} driving-world-model core and inclusive candidates are assigned one primary home below. Representative tables are full-text audited; compact entries retain metadata-based candidate labels pending paper-level verification. Titles link directly to papers. The [full 1,270-paper catalog](FULL_REFERENCE_CATALOG.md) also contains boundary work, evaluation, cross-domain foundations, and autoregressive-vision references."
  lines << ""
  lines << "- **Core candidate:** explicitly presented as a driving world model or selected as a review representative; final manuscript inclusion still follows our action/rollout criteria."
  lines << "- **Inclusive candidate:** retained for coverage, but action conditionality or recursive rollout is incomplete or needs further audit."
  lines << "- **Full-text audited / Metadata classified:** distinguishes paper-level verification from initial title, source-section, and metadata classification."
  lines << ""

  sections.each do |heading, representation, representative_names|
    group = core_entries.select { |entry| entry["representation"] == representation }
    lines << heading
    lines << ""
    lines << "**#{group.length} candidates. Representative papers:**"
    lines << ""
    lines.concat(representative_table(group, representative_names))
    lines << ""
    lines << "**Other core and inclusive candidates:**"
    lines << ""
    lines.concat(compact_core_list(group, representative_names))
    lines << "" unless group.empty?
  end
  lines << "For source provenance, role tags, and generated cross-domain appendices, see the [full catalog](FULL_REFERENCE_CATALOG.md#driving-world-models-core-and-inclusive-candidates)."
  lines << end_marker

  replacement = lines.join("\n")
  readme.sub!(/#{Regexp.escape(begin_marker)}.*?#{Regexp.escape(end_marker)}/m, replacement)
  File.write(README_OUTPUT, readme)
end

def write_catalog(entries, raw_counts, revisions)
  entries.each do |entry|
    entry["paper"] = PAPER_URL_OVERRIDES.fetch(entry["paper"], entry["paper"])
    entry["resources"] = entry["resources"].reject { |resource| DROPPED_RESOURCE_URLS.include?(resource["url"]) }
    entry["resources"].each do |resource|
      resource["url"] = RESOURCE_URL_OVERRIDES.fetch(resource["url"], resource["url"])
    end
    entry["admission"] = admission_for(entry)
    entry["scope"] = scope_for(entry)
    entry["representation"] = representation_for(entry)
    entry["mechanism"] = mechanism_for(entry)
    entry["roles"] = roles_for(entry)
    entry["year"] = year_for(entry)
    entry["audit_level"] = method_key(entry) ? "Full-text audited" : "Metadata classified"
    entry["representative"] = !method_key(entry).nil?
  end

  scopes = [
    "Driving world models: core and inclusive candidates",
    "Driving boundary, reviews, evaluation, and excluded-adjacent work",
    "Cross-domain world-model origins and methodological foundations",
    "Autoregressive-vision foundations (adjacent, not driving WMs)"
  ]
  representations = [
    "3.1.1 Observation-level: future images and video",
    "3.1.2 Observation-level: future point clouds",
    "3.2.1 Scene-level: entities and interactions",
    "3.2.2 Scene-level: BEV, occupancy, and geometry",
    "3.3 Latent-space prediction",
    "Chapter 2 - Definition, boundary, and surveys",
    "Chapter 4 - Cross-domain rollout mechanisms",
    "Chapter 6 - Evaluation protocols and metrics",
    "Chapter 7 - Deployment, trustworthiness, and safety",
    "Appendix - Autoregressive visual methodology"
  ]

  lines = []
  lines << "# Full Cross-Repository Reference Catalog"
  lines << ""
  lines << "> Generated from the three source repositories at the revisions shown below. Do not edit this file manually; run `ruby scripts/build_full_catalog.rb` after updating the source checkouts."
  lines << ""
  lines << "This catalog reclassifies every extractable paper entry from the three requested repositories using the review outline: Chapter 2 admission and boundaries, Chapter 3 future-state representation, Chapter 4 rollout mechanisms, Chapter 5 system roles, Chapter 6 evaluation, and Chapter 7 deployment. Duplicate records are merged by arXiv/OpenReview/DOI identity and normalized title; source provenance is retained on every item."
  lines << ""
  lines << "## Coverage audit"
  lines << ""
  lines << "| Source code | Source repository | Revision | Extracted paper records |"
  lines << "| --- | --- | ---: | ---: |"
  SOURCES.each do |code, source|
    lines << "| `#{code}` | [#{source[:name]}](#{source[:url]}) | `#{revisions[code]}` | #{raw_counts[code]} |"
  end
  lines << "| | **Raw total** | | **#{raw_counts.values.sum}** |"
  lines << "| | **Unique after cross-source deduplication** | | **#{entries.length}** |"
  lines << ""
  lines << "Only entries with an explicit paper/report link are counted. Blogs, videos, researcher profiles, challenges without papers, and code-only bullets are resources rather than reference literature and remain in the main README where relevant. Historical links are preserved for provenance even when an upstream site later disappears; the machine-readable record retains the original source text."
  lines << ""
  lines << "## Classification key"
  lines << ""
  lines << "- **Admission:** core candidates explicitly identify a driving world model or are named representatives in the review outline; inclusive candidates come from the driving-WM collections. Both statuses still require a full-text audit of action conditioning and iterative rollout before final manuscript inclusion."
  lines << "- **Boundary:** pure video/image generation, static reconstruction, generic prediction, perception-only VLMs, action-only VLAs, non-predictive E2E driving, and hand-engineered simulators are not labeled as core driving world models. They remain listed so all source references are traceable."
  lines << "- **Primary Chapter 3 category:** the predicted state and loss determine observation-level image/video, observation-level point cloud, scene-level entity, scene-level geometry, or latent-space prediction."
  lines << "- **Chapter 4 mechanism:** latent dynamics/state-space/JEPA, autoregressive, diffusion/flow matching, hybrid, or unspecified."
  lines << "- **Chapter 5-7 roles:** data engine, simulator, planning rollout, predictive pretraining, evaluation, and deployment/assurance are orthogonal tags; a paper may have several."
  lines << "- **Sources:** `AD`, `ARV`, and `LMD` correspond to the coverage table. Multiple codes indicate a merged duplicate."
  lines << "- **Audit warning:** automatic labels use titles and source taxonomies. Inclusion in the core manuscript must ultimately be confirmed from the method's action input, state/output type, loss, and ability to roll out iteratively."
  lines << ""
  lines << "## Catalog statistics"
  lines << ""
  lines << "| Scope | Unique references |"
  lines << "| --- | ---: |"
  scopes.each { |scope| lines << "| #{scope} | #{entries.count { |entry| entry['scope'] == scope }} |" }
  lines << ""
  lines << "| Chapter 2 admission status | Unique references |"
  lines << "| --- | ---: |"
  entries.group_by { |entry| entry["admission"] }.sort.each do |admission, group|
    lines << "| #{admission} | #{group.length} |"
  end
  lines << ""
  lines << "| Primary representation category | Unique references |"
  lines << "| --- | ---: |"
  representations.each { |rep| lines << "| #{rep} | #{entries.count { |entry| entry['representation'] == rep }} |" }
  lines << ""

  scopes.each do |scope|
    scoped = entries.select { |entry| entry["scope"] == scope }
    next if scoped.empty?

    lines << "## #{scope}"
    lines << ""
    representations.each do |representation|
      group = scoped.select { |entry| entry["representation"] == representation }
      next if group.empty?

      lines << "### #{representation} (#{group.length})"
      lines << ""
      group.sort_by { |entry| [-entry["year"], entry["title"].downcase] }.each do |entry|
        role_tags = entry["roles"].map { |role| "`#{role}`" }.join(" · ")
        tags = "`#{entry['admission']}` · `#{entry['audit_level']}` · `#{entry['mechanism']}` · #{role_tags} · `#{entry['sources'].sort.join('+')}`"
        year = entry["year"].positive? ? " (#{entry['year']})" : ""
        links = link_markdown(entry)
        line = "- [**#{safe_title(entry['title'])}**](#{entry['paper']})#{year} — #{tags}"
        line += " #{links}" unless links.empty?
        lines << line
      end
      lines << ""
    end
  end

  lines.pop while lines.last == ""
  File.write(OUTPUT, lines.join("\n") + "\n")

  data = {
    "generated_at" => Time.now.utc.iso8601,
    "sources" => SOURCES.transform_values { |source| source.slice(:name, :url) },
    "source_revisions" => revisions,
    "raw_counts" => raw_counts,
    "unique_count" => entries.length,
    "entries" => entries.sort_by { |entry| [entry["scope"], entry["representation"], -entry["year"], entry["title"].downcase] }
  }
  Dir.mkdir(File.dirname(DATA_OUTPUT)) unless Dir.exist?(File.dirname(DATA_OUTPUT))
  File.write(DATA_OUTPUT, JSON.pretty_generate(data) + "\n")
  write_readme_core_taxonomy(entries)
end

require "shellwords"

raw = {}
raw_counts = {}
revisions = {}
SOURCES.each do |code, source|
  raw[code] = parse_source(code, source)
  raw_counts[code] = raw[code].length
  revisions[code] = source_revision(source[:path])
end

entries = merge_entries(raw.values.flatten)
write_catalog(entries, raw_counts, revisions)

puts "Generated #{File.basename(OUTPUT)} and #{DATA_OUTPUT.delete_prefix(ROOT + '/')}"
puts "Raw records: #{raw_counts.map { |code, count| "#{code}=#{count}" }.join(', ')}; unique=#{entries.length}"

# Awesome Autonomous Driving World Models

[![Awesome](https://awesome.re/badge.svg)](https://awesome.re)
[![Link Check](https://github.com/thu-vinlab/Awesome-Autonomous-Driving-World-Model/actions/workflows/link-check.yml/badge.svg)](https://github.com/thu-vinlab/Awesome-Autonomous-Driving-World-Model/actions/workflows/link-check.yml)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

A curated collection of **world models for autonomous driving**, organized by how a model represents the future, rolls it out, and contributes to a driving system.

Unlike chronological paper dumps, this list uses a review-oriented taxonomy. It emphasizes representative, reproducible, and evaluation-relevant resources. The list is maintained as a companion resource for our ongoing review, *Autonomous Driving World Models: Representations, Rollout Mechanisms, System Roles, and Deployment*.

> **Last updated:** 7 August 2026. This is a living, field-specific list rather than a claim of permanent completeness. Suggestions and corrections are welcome through [pull requests or issues](CONTRIBUTING.md).

This README is the complete reader-facing collection. Generic autoregressive vision, unrelated robotics, image generation, medical world models, and other source-archive records are deliberately excluded even when they appeared in an upstream list.

## Autonomous driving background milestones

Before the world-model methods, the field evolved through an explicit modular stack, direct end-to-end learning, planning-oriented joint optimization, and VLA/VLM-to-driving systems.

| Paradigm | Representative citation | Main contribution | World-model boundary |
| --- | --- | --- | --- |
| Modular system | [**Paden et al.**, *A Survey of Motion Planning and Control Techniques for Self-Driving Urban Vehicles* (IEEE T-IV 2016)](https://doi.org/10.1109/TIV.2016.2578706) | Canonical explicit planning/control pipeline | Background survey; no learned recursive state transition |
| Modular supplement | [**Badue et al.**, *Self-driving cars: A survey* (ESWA 2021)](https://doi.org/10.1016/j.eswa.2020.113816) | Broader system-level survey of perception, mapping, planning, control, and deployment | Optional background citation, not a world model |
| End-to-end driving | [**Bojarski et al.**, *End to End Learning for Self-Driving Cars* (NVIDIA PilotNet, 2016)](https://arxiv.org/abs/1604.07316) | Direct camera-to-steering policy learning | Policy prediction, not future-state rollout |
| Planning-oriented end-to-end | [**Hu et al.**, *Planning-oriented Autonomous Driving* (UniAD, CVPR 2023)](https://doi.org/10.1109/CVPR52729.2023.01712) | Joint task coordination around planning | Planning-centered precursor; not itself a world model |
| VLA / VLM-to-driving | [**Tian et al.**, *DriveVLM* (2024)](https://arxiv.org/abs/2402.12289) | Language-mediated scene reasoning and hierarchical planning, with DriveVLM-Dual vehicle deployment | VLA/VLM bridge; only predictive iterable components enter the WM scope |

For the compact four-citation introduction route, use Paden, Bojarski, UniAD, and DriveVLM; use Badue when a broader modular-system survey is needed.

## Autonomous driving world model surveys

> **Coverage note (searched 7 August 2026):** this collection combines the three source repositories with independent title/keyword searches of arXiv, OpenAlex, Crossref, Semantic Scholar, and GitHub. It aims for high coverage of public English-language surveys, but no literature search can guarantee permanent completeness; newly indexed and non-English work may still be missing.

The tables below place the related-survey analysis directly before our taxonomy. Titles link to the papers; each row records the team, publication status, authors' own classification, contribution, and difference from our framework.

### Comprehensive surveys

| Year | Survey | Team / status | Authors' classification | Core contribution and relation to our review | Resources |
| ---: | --- | --- | --- | --- | --- |
| 2026 | [**World Models for Autonomous Driving: From Future Generation to Decision Making**](https://doi.org/10.2139/ssrn.6827179) | Tongji-led team; SSRN working paper | future generation / planning / hybrid under an MPC view; cross-comparison by representation and generator | Connects prediction to decision and closed-loop utility; our review separates state, mechanism, system role, and assurance instead of making MPC role the primary axis | [[Preprint](https://doi.org/10.2139/ssrn.6827179)] |
| 2026 | [**Latent World Models for Automated Driving**](https://arxiv.org/abs/2603.09086) | RWTH Aachen + TU Delft; arXiv, under review | target: latent world/action/generator; form: continuous/discrete/hybrid; priors: geometry/topology/semantics; four uses and five mechanics | Unifies latent design and closed-loop evaluation; our review places latent prediction alongside observable and scene-level future states | [[Paper](https://arxiv.org/abs/2603.09086)] |
| 2025 | [**The Role of World Models in Shaping Autonomous Driving**](https://arxiv.org/abs/2502.10498) | HUST + Baidu; arXiv v2 | video / point cloud / occupancy / latent feature / traffic map; applications in simulation, data, driving enhancement, and pretraining | Broad modality-centered map with metrics and quantitative comparisons; our review adds an author-definition rule and separates entity from geometry | [[Paper](https://arxiv.org/abs/2502.10498)] [[List](https://github.com/LMD0311/Awesome-World-Model)] |
| 2025 | [**Research on World Models for Connected Automated Driving**](https://doi.org/10.3390/app15168986) | Shanghai University of Engineering Science; *Applied Sciences* | cooperative perception / prediction / decision / control / human-machine collaboration / scene generation | Extends world models to connected automation; its CAV pipeline categories are broader than learned action-conditioned transitions | [[Journal](https://doi.org/10.3390/app15168986)] |
| 2025 | [**A Survey of World Models for Autonomous Driving**](https://arxiv.org/abs/2501.11260) | Zhejiang University CCAI; arXiv v4, submitted to ACM | future physical-world generation / behavior planning / prediction-planning interaction; image / BEV / occupancy / point cloud subtypes | Consolidates generation, planning, benchmarks, and performance; our review makes state, mechanism, and role orthogonal while respecting authors' WM definitions | [[Paper](https://arxiv.org/abs/2501.11260)] [[List](https://github.com/FengZicai/AwesomeWMAD)] |
| 2024 | [**Exploring the Interplay Between Video Generation and World Models in Autonomous Driving**](https://arxiv.org/abs/2411.02914) | Southeast University-led academic-industry team; arXiv | video: traditional / diffusion; WM: perception-prediction / reinforcement learning; AR and diffusion driving models | Clarifies the video-generation/world-model lineage; our Core includes author-defined driving world models and keeps other generators as related work | [[Paper](https://arxiv.org/abs/2411.02914)] |
| 2024/25 | [**World Models for Autonomous Driving: An Initial Survey**](https://doi.org/10.1109/TIV.2024.3398357) | University of Macau-led team; IEEE T-IV | perception / memory / controller / world-model architecture; driving scenario generation / planning and control | Early consolidated history and driving application map; our review adds the author-definition rule and loss-target-based state hierarchy | [[Paper](https://arxiv.org/abs/2403.02622)] [[Journal](https://doi.org/10.1109/TIV.2024.3398357)] |

### Thematic driving-world-model surveys

| Survey | Team / status | Authors' classification | Core contribution and relation to our review | Resources |
| --- | --- | --- | --- | --- |
| [**Multi-Agent Embodied Autonomous Driving: From V2X Information Exchange to Shared World Models**](https://arxiv.org/abs/2606.13840) | City University of Hong Kong + Lingnan University; arXiv 2026 | information exchange → shared state → cognition → cooperative planning; fusion, communication, MARL/optimization/generative planning | Reframes more than 380 V2X papers around shared predictive state; author-defined driving world models enter our entity, geometry, or latent classes | [[Paper](https://arxiv.org/abs/2606.13840)] [[List](https://github.com/dl-m9/Multi-Agent-Embodied-Autonomous-Driving)] |
| [**Progressive Robustness-Aware World Models in Autonomous Driving**](https://doi.org/10.36227/techrxiv.176523308.84756413/v1) | TechRxiv preprint, 2025 | generation / planning / enhancement × robustness 1.0 / 2.0 / 3.0 | Makes robustness a staged maturity axis from intrinsic metrics to open-world adaptation; our representation taxonomy remains the primary method organization | [[Paper](https://doi.org/10.36227/techrxiv.176523308.84756413/v1)] [[List](https://github.com/MoyangSensei/AwesomeRobustDWM)] |

### Closely related surveys

These surveys supply neighboring literature, but their full scope is broader than this driving-world-model collection.

| Survey | Main scope / classification | Use in this review | Resources |
| --- | --- | --- | --- |
| [**A Survey on Future Physical World Generation for Autonomous Driving**](https://doi.org/10.1145/3769748.3773345) (MMAsia 2025) | image / BEV / occupancy / point-cloud generation, with diffusion, Transformer, and adversarial generators | Observation- and geometry-level generation sources; individual author-defined world models enter Core | [[Paper](https://doi.org/10.1145/3769748.3773345)] |
| [**Foundation Models in Autonomous Driving: Scenario Generation and Analysis**](https://doi.org/10.1109/OJITS.2026.3660686) (IEEE OJ-ITS 2026) | LLM / VLM / MLLM / diffusion / world model × scenario generation / analysis | Data engines, testing, controllability, simulators, and safety resources | [[Paper](https://arxiv.org/abs/2506.11526)] [[List](https://github.com/TUM-AVS/FM-AD-Survey)] |
| [**A Survey on Multimodal Large Language Models for Autonomous Driving**](https://doi.org/10.1109/WACVW60836.2024.00106) (WACV Workshops 2024) | driving / transportation / maps × MLLM tasks and benchmarks | VLM/VLA boundary, semantic reasoning, hallucination, and grounding references | [[Paper](https://arxiv.org/abs/2311.12320)] [[List](https://github.com/IrohXu/Awesome-Multimodal-LLM-Autonomous-Driving)] |
| [**Data-Centric Evolution in Autonomous Driving**](https://arxiv.org/abs/2401.12888) (2024) | big-data systems / data mining / development and post-deployment closed loops | Data-engine and engineering-loop references; its “closed loop” is not necessarily recursive world-model rollout | [[Paper](https://arxiv.org/abs/2401.12888)] [[List](https://github.com/LincanLi98/Awesome-Data-Centric-Autonomous-Driving)] |

## Contents

- [Autonomous driving background milestones](#autonomous-driving-background-milestones)
- [Autonomous driving world model surveys](#autonomous-driving-world-model-surveys)
- [Scope and taxonomy](#scope-and-taxonomy)
- [2026 literature update](#2026-literature-update)
- [Core taxonomy](#core-taxonomy-world-models-by-future-state-representation)
  - [3.1.1 Future image and video](#311-observation-level-future-image-and-video)
  - [3.1.2 Future point cloud](#312-observation-level-future-point-cloud)
  - [3.2.1 Entities and interactions](#321-scene-level-entities-and-interactions)
  - [3.2.2 BEV, occupancy, and geometry](#322-scene-level-bev-occupancy-and-geometry)
  - [3.3 Latent-space prediction](#33-latent-space-prediction)
- [Rollout mechanisms](#rollout-mechanisms)
- [System roles](#system-roles)
- [Related driving literature](#related-driving-literature)
- [Evaluation and benchmarks](#evaluation-and-benchmarks)
- [Datasets](#datasets)
- [Simulators and platforms](#simulators-and-platforms)
- [Safety, robustness, and deployment](#safety-robustness-and-deployment)
- [Workshops and challenges](#workshops-and-challenges)
- [Related collections](#related-collections)
- [Contributing and acknowledgements](#contributing-and-acknowledgements)

## Scope and taxonomy

We use `s(t+1) = F(s(t), a(t))` as an analytical definition of a learned driving world model and examine two desirable properties:

1. **Action conditionality:** `F` accepts an ego action and responds materially; different actions should lead to different future states.
2. **Rollout capability:** the predicted state is compatible with the model input so that `F` can be applied iteratively beyond a single fixed prediction.

These properties are **analysis dimensions, not exclusion criteria**. Because the field still lacks a settled definition, this collection follows an inclusive author-definition rule: if the title, abstract, or paper explicitly presents the work as a driving world model or world-action model, we include it in the Core Taxonomy. The collection then records whether action conditioning and recursive rollout are demonstrated, unclear, or absent; it does not overrule the authors' terminology.

Papers that do not describe themselves as world models can still appear in **Related driving literature** when they directly support the review's discussion of generation, prediction, VLA/E2E planning, data engines, or evaluation. Pure general video generation such as Sora, static NeRF/3DGS reconstruction, unrelated robotics and games, and generic autoregressive vision are not retained. Hand-engineered simulators such as CARLA remain resources rather than learned world models.

Each work has one primary home even when it spans several categories. We use the following compact vocabulary:

| Dimension | Categories | Central question |
| --- | --- | --- |
| Future-state representation | observation (image/video or point cloud), scene (entity or geometry), latent | What state is predicted and where is the loss applied? |
| Rollout mechanism | latent dynamics/state space/JEPA, autoregressive, diffusion/flow, hybrid | How is the future generated? |
| System role | data engine, simulator, planner, pretraining | What does the model do for driving? |
| Readiness | fidelity, interaction, safety, runtime | Can its behavior be evaluated and trusted? |

Resource labels: **P** = paper, **C** = code, **D** = data/model, **W** = website or project page.

## 2026 literature update

This update is a high-coverage snapshot through **7 August 2026**, not a frozen annual bibliography. We searched arXiv full text/metadata, OpenAlex, Crossref, Semantic Scholar, GitHub, the two driving-world-model survey lists, and the general [Awesome World Model](https://github.com/LMD0311/Awesome-World-Model) collection. Query families covered `driving/autonomous vehicle + world model`, `world-action model`, `latent/occupancy/LiDAR/video world model`, `interactive/generative simulator`, and `evaluation/safety/rollout`. Titles and identifiers were deduplicated; abstracts were checked before placement.

**2026 venue audit:** official proceedings or virtual-program pages were checked for [CVPR 2026](https://openaccess.thecvf.com/CVPR2026?day=all), [ICLR 2026](https://proceedings.iclr.cc/paper_files/paper/2026), and [ICML 2026](https://icml.cc/virtual/2026/papers.html). AAAI 2026 proceedings and currently public ECCV/ICRA/IROS/ITSC records were cross-checked through publisher metadata and author pages. NeurIPS 2026 has not yet published proceedings as of the update date, so accepted-paper completeness cannot yet be claimed for that venue.

| 2026 growth line | Representative additions | Why it matters to this review |
| --- | --- | --- |
| Long-horizon visual simulation | [HorizonDrive](https://arxiv.org/abs/2605.11596), [Point as Skeleton](https://arxiv.org/abs/2607.06516), [Fine-flow Distillation](https://doi.org/10.1609/aaai.v40i31.39860) | Explicitly targets autoregressive drift, real-time rollout, and closed-loop sensor simulation |
| Scene and traffic simulation | [VectorWorld](https://arxiv.org/abs/2603.17652), [OccSim](https://arxiv.org/abs/2603.28887), [AutoWorld](https://arxiv.org/abs/2603.28963) | Extends learned rollout from pixels to vector graphs, occupancy, and interacting agents |
| Latent future reasoning | [DynFlowDrive](https://arxiv.org/abs/2603.19675), [DriveFuture](https://arxiv.org/abs/2605.09701), [DriveWorld-VLA](https://arxiv.org/abs/2602.06521) | Makes action-conditioned future features directly useful for planning |
| World-action models | [DriveDreamer-Policy](https://arxiv.org/abs/2604.01765), [DriveVA](https://arxiv.org/abs/2604.04198), [DriveWAM](https://arxiv.org/abs/2605.28544), [UNIVERSE](https://arxiv.org/abs/2607.05133) | Couples future observations and actions; included under the authors' world-action-model definition |
| Evaluation and assurance | [DrivingGen](https://arxiv.org/abs/2601.01528), [ReactSim-Bench](https://arxiv.org/abs/2606.14058), [WM-Cov](https://arxiv.org/abs/2608.00298), [Admissibility for WM Simulators](https://arxiv.org/abs/2607.07196) | Moves evaluation beyond appearance toward interaction, valid evidence, and simulator accreditation |

**Verified 2026 venue highlights:** CVPR 2026 contributes [RAYNOVA](https://openaccess.thecvf.com/content/CVPR2026/html/Xie_RAYNOVA_Scale-Temporal_Autoregressive_World_Modeling_in_Ray_Space_CVPR_2026_paper.html), [VerseCrafter](https://openaccess.thecvf.com/content/CVPR2026/html/Zheng_VerseCrafter_Dynamic_Realistic_Video_World_Model_with_4D_Geometric_Control_CVPR_2026_paper.html), [GenieDrive](https://openaccess.thecvf.com/content/CVPR2026/html/Yang_GenieDrive_Towards_Physics-Aware_Driving_World_Model_with_4D_Occupancy_Guided_CVPR_2026_paper.html), [U4D](https://openaccess.thecvf.com/content/CVPR2026/html/Xu_U4D_Uncertainty-Aware_4D_World_Modeling_from_LiDAR_Sequences_CVPR_2026_paper.html), [DLWM](https://openaccess.thecvf.com/content/CVPR2026/html/Zhu_DLWM_Dual_Latent_World_Models_enable_Holistic_Gaussian-centric_Pre-training_in_CVPR_2026_paper.html), [DriveLaW](https://openaccess.thecvf.com/content/CVPR2026/html/Xia_DriveLaW_Unifying_Planning_and_Video_Generation_in_a_Latent_Driving_CVPR_2026_paper.html), [GaussianDWM](https://openaccess.thecvf.com/content/CVPR2026/html/Deng_GaussianDWM_3D_Gaussian_Driving_World_Model_for_Unified_Scene_Understanding_CVPR_2026_paper.html), [Latent CoT](https://openaccess.thecvf.com/content/CVPR2026/html/Tan_Latent_Chain-of-Thought_World_Modeling_for_End-to-End_Autonomous_Driving_CVPR_2026_paper.html), [GEM](https://openaccess.thecvf.com/content/CVPR2026/html/Wu_GEM_Generating_LiDAR_World_Model_via_Deformable_Mamba_CVPR_2026_paper.html), [MAD](https://openaccess.thecvf.com/content/CVPR2026/html/Rahimi_MAD_Motion_Appearance_Decoupling_for_efficient_Driving_World_Models_CVPR_2026_paper.html), and [SparseWorld-TC](https://openaccess.thecvf.com/content/CVPR2026/html/Du_SparseWorld-TC_Trajectory-Conditioned_Sparse_Occupancy_World_Model_CVPR_2026_paper.html), alongside WM-guided driving methods and evaluation papers indexed in the relevant sections. ICLR 2026 and ICML 2026 venue links are attached to their corresponding Core or evaluation entries rather than duplicated here.

New papers are placed once in the primary taxonomy when their title, abstract, or paper defines them as driving world models or world-action models. Related generation, VLA, prediction, systems, and assurance work that is not author-defined as a world model is retained separately. `Abstract audited` means the abstract explicitly supports the placement but the full paper has not yet completed the repository's full-text audit.

<!-- CORE_TAXONOMY_START -->
## Core taxonomy: world models by future-state representation

The **182 author-defined world-model papers** below are assigned one primary home by future-state representation. Action conditioning and recursive rollout are recorded as properties rather than used to exclude papers. Representative tables are full-text audited; compact entries retain metadata-based labels pending paper-level verification. Titles link directly to papers.

- **Author-defined WM:** the title, abstract, or paper explicitly presents the work as a driving world model or world-action model. This is an inclusion label, not a provisional rejection status.
- **Full-text audited / Metadata classified:** distinguishes paper-level verification from initial title, source-section, and metadata classification.

### 3.1.1 Observation-level: future image and video

**34 papers: 5 representative papers + 29 compact entries.**

| Paper | Team / venue | Core contribution | Future state and action | Mechanism / role | Data and evidence |
| --- | --- | --- | --- | --- | --- |
| [**GAIA-1: A Generative World Model for Autonomous Driving**](https://arxiv.org/pdf/2309.17080.pdf) | Wayve; technical report 2023 | Large-scale multimodal driving model that tokenizes video, text, and actions and generates controllable future driving video. | Future video tokens; conditioned on video, text, and ego actions. | AR world model + diffusion decoder; neural simulator / data engine. | 4,700 h private driving video; generation quality, controllability, and qualitative long rollouts. |
| [**DriveDreamer: Towards Real-world-driven World Models for Autonomous Driving**](https://www.ecva.net/papers/eccv_2024/papers_ECCV/papers/06416.pdf) [[Project](https://drivedreamer.github.io/)] [[Code](https://github.com/JeffWang987/DriveDreamer)] | GigaAI + Tsinghua; ECCV 2024 | Builds a real-world-data-driven model for structured, text- and action-controllable driving video and action prediction. | Future video and driving action; traffic structure, text, and action conditions. | Two-stage diffusion; data engine / visual rollout. | nuScenes; video quality, structural controllability, and downstream perception/action experiments. |
| [**Drive-WM: Driving into the Future: Multiview Visual Forecasting and Planning with World Model for Autonomous Driving**](https://arxiv.org/pdf/2311.17918.pdf) [[Project](https://drive-wm.github.io/)] [[Code](https://github.com/BraveGroup/Drive-WM)] | CASIA + CAIR, HKISI, CAS; CVPR 2024 | Connects controllable multiview video forecasting to planning by imagining and scoring futures under candidate maneuvers. | Multiview future video; historical cameras and candidate ego trajectories/maneuvers. | Latent video diffusion; planning-internal rollout / simulator. | nuScenes; FID/FVD, multiview consistency, controllability, and planning evaluation. |
| [**Vista: A Generalizable Driving World Model with High Fidelity and Versatile Controllability**](https://proceedings.neurips.cc/paper_files/paper/2024/file/a6a066fb44f2fe0d36cf740c873b8890-Paper-Conference.pdf) [[Project](https://opendrivelab.com/Vista/)] [[Code](https://github.com/OpenDriveLab/Vista)] | HKUST + OpenDriveLab/Shanghai AI Lab + Tübingen + HKU; NeurIPS 2024 | Improves high-resolution, long-horizon visual rollout, cross-dataset generalization, and control from commands to trajectories. | Future video; command, goal point, trajectory, steering angle, and speed controls. | Latent diffusion with history replacement; simulator / action evaluation. | Large-scale mixed driving data; FID/FVD, human comparison, controllability, and action reward evaluation. |
| [**DrivingWorld: Constructing World Model for Autonomous Driving via Video GPT**](https://arxiv.org/abs/2412.19505) [[Project](https://huxiaotaostasy.github.io/DrivingWorld/index.html)] [[Code](https://github.com/YvanYin/DrivingWorld)] | HKUST + Horizon Robotics; arXiv 2024 | Introduces an efficient video-GPT design with spatial-temporal tokenization for controllable long driving-video generation. | Future video tokens; short video context and trajectory conditions. | Autoregressive next-token rollout; visual simulator. | nuScenes and OpenDV-2K; generation fidelity, temporal coherence, and trajectory control. |

**Complete list beyond the representative table:**

- [**RAYNOVA: Scale-Temporal Autoregressive World Modeling in Ray Space**](https://arxiv.org/abs/2602.20685) (2026) — `Author-defined WM` · `Abstract audited` · controllable recurrent long-horizon multiview rollout [[Project](https://raynova-ai.github.io/)]
- [**DriveDreamer-Policy: A Geometry-Grounded World-Action Model for Unified Generation and Planning**](https://arxiv.org/abs/2604.01765) (2026) — `Author-defined WM` · `Abstract audited` · future video, depth, and actions; unified generation/planning
- [**DriveVA: Video Action Models are Zero-Shot Drivers**](https://arxiv.org/abs/2604.04198) (2026) — `Author-defined WM` · `Abstract audited` · joint future-video/action diffusion with video continuation
- [**DriveWAM: Video Generative Priors Enable Scalable World-Action Modeling for Autonomous Driving**](https://arxiv.org/abs/2605.28544) (2026) — `Author-defined WM` · `Abstract audited` · autoregressive video-action rollout with bounded KV memory
- [**Fine-flow Distilling Coarse-flow Video Generation for Long-Term Driving World Model**](https://doi.org/10.1609/aaai.v40i31.39860) (AAAI 2026) — `Author-defined WM` · `Abstract audited` · action-conditioned long-term video rollout
- [**HorizonDrive: Self-Corrective Autoregressive World Model for Long-horizon Driving Simulation**](https://arxiv.org/abs/2605.11596) (2026) — `Author-defined WM` · `Abstract audited` · minute-scale autoregressive rollout [[Project](https://zcliangyue.github.io/HorizonDrive)] [[Code](https://github.com/zcliangyue/HorizonDrive)]
- [**LMGenDrive: Bridging Multimodal Understanding and Generative World Modeling for End-to-End Driving**](https://arxiv.org/abs/2604.08719) (2026) — `Author-defined WM` · `Abstract audited` · future driving video and control with autoregressive offline rollout
- [**Point as Skeleton: Accumulated Point Cloud Enhanced Autoregressive Generation for Closed-Loop Autonomous Driving Simulation**](https://arxiv.org/abs/2607.06516) (2026) — `Author-defined WM` · `Abstract audited` · state-updated closed-loop video rollout [[Code](https://github.com/krauwu/point-as-skeleton)]
- [**Uni-World VLA: Interleaved World Modeling and Planning for Autonomous Driving**](https://arxiv.org/abs/2603.27287) (2026) — `Author-defined WM` · `Abstract audited` · interleaved future-frame/action rollout
- [**Toward Physically Consistent Driving Video World Models under Challenging Trajectories**](https://arxiv.org/abs/2603.24506) (2026) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)` [[Project](https://wm-research.github.io/PhyGenesis/)]
- [**UniDrive-WM: Unified Understanding, Planning and Generation World Model For Autonomous Driving**](https://arxiv.org/abs/2601.04453) (2026) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)` [[Project](https://unidrive-wm.github.io/UniDrive-WM)]
- [**X-Mind: Efficient Visual Chain-of-Thought via Predictive World Model for End-to-End Driving**](https://arxiv.org/abs/2606.28758) (2026) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)`
- [**X-World: Controllable Ego-Centric Multi-Camera World Models for Scalable End-to-End Driving**](https://arxiv.org/abs/2603.19979) (2026) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)`
- [**Xiaomi EV World Model: A Joint World Model Integrating Reconstruction and Generation for Autonomous Driving**](https://arxiv.org/abs/2605.18137) (2026) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)`
- [**EOT-WM Other Vehicle Trajectories Are Also Needed: A Driving World Model Unifies Ego-Other Vehicle Trajectories in Video Latant Space**](https://arxiv.org/abs/2503.09215) (2025) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)`
- [**GAIA-2: A Controllable Multi-View Generative World Model for Autonomous Driving**](https://arxiv.org/abs/2503.20523) (2025) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)`
- [**MaskGWM: A Generalizable Driving World Model with Video Mask Reconstruction**](https://arxiv.org/abs/2502.11663) (2025) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/SenseTime-FVG/OpenDWM)]
- [**MiLA: Multi-view Intensive-fidelity Long-term Video Generation World Model for Autonomous Driving**](https://arxiv.org/abs/2503.15875) (2025) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)` [[Project](https://xiaomi-mlab.github.io/mila.github.io/)]
- [**ProphetDWM: ProphetDWM: A Driving World Model for Rolling Out Future Actions and Videos**](https://arxiv.org/abs/2505.18650) (2025) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)`
- [**World model-based end-to-end scene generation for accident anticipation in autonomous driving**](https://arxiv.org/abs/2507.12762) (2025) — `Author-defined WM` · `Metadata classified` · scene generation for accident anticipation [[Journal](https://www.nature.com/articles/s44172-025-00474-7)]
- [**DrivingGPT: Unifying Driving World Modeling and Planning with Multi-modal Autoregressive Transformers**](https://arxiv.org/abs/2412.18607) (2024) — `Author-defined WM` · `Metadata classified` · `Autoregressive rollout` [[Project](https://rogerchern.github.io/DrivingGPT/)]
- [**UniDriveDreamer: A Single-Stage Multimodal World Model for Autonomous Driving**](https://arxiv.org/abs/2602.02002) (2026) — `Author-defined WM` · `Metadata classified` · joint future camera/LiDAR generation
- [**ConsisDrive: Identity-Preserving Driving World Models for Video Generation by Instance Mask**](https://arxiv.org/abs/2602.03213) (2026) — `Author-defined WM` · `Metadata classified` · identity-consistent future video [[Project](https://shanpoyang654.github.io/ConsisDrive/page.html)]
- [**InstaDrive: Instance-Aware Driving World Models for Realistic and Consistent Video Generation**](https://arxiv.org/abs/2602.03242) (2026) — `Author-defined WM` · `Metadata classified` · instance-consistent future video [[Project](https://shanpoyang654.github.io/InstaDrive/page.html)]
- [**ProgressiveDrive: Reconciling Fidelity and Consistency in World Models for Autonomous Driving**](https://doi.org/10.1016/j.eswa.2026.133554) (ESWA 2026) — `Author-defined WM` · `Metadata classified` · driving-video generation
- [**RealWeather: Realistic and Scene-Faithful Weather Translation with Driving World Models**](https://arxiv.org/abs/2608.02953) (2026) — `Author-defined WM` · `Metadata classified` · controllable weather translation and long-tail data generation
- [**Learning Vision-Language-Action World Models for Autonomous Driving (VLA-World)**](https://arxiv.org/abs/2604.09059) (CVPR 2026 Findings) — `Author-defined WM` · `Metadata classified` · next-frame imagination conditioned by action-derived trajectories [[Project](https://vlaworld.github.io/)]
- [**ShareVerse: Multi-Agent Consistent Video Generation for Shared World Modeling**](https://arxiv.org/abs/2603.02697) (2026) — `Author-defined WM` · `Abstract audited` · multi-agent consistent shared-world video generation
- [**VerseCrafter: Dynamic Realistic Video World Model with 4D Geometric Control**](https://openaccess.thecvf.com/content/CVPR2026/html/Zheng_VerseCrafter_Dynamic_Realistic_Video_World_Model_with_4D_Geometric_Control_CVPR_2026_paper.html) (CVPR 2026) — `Author-defined WM` · `Full-text audited` · geometry-driven video world model with controllable camera and multi-object motion [[arXiv](https://arxiv.org/abs/2601.05138)]

### 3.1.2 Observation-level: future point cloud

**6 papers: 1 representative paper + 5 compact entries.**

| Paper | Team / venue | Core contribution | Future state and action | Mechanism / role | Data and evidence |
| --- | --- | --- | --- | --- | --- |
| [**Copilot4D: Learning Unsupervised World Models for Autonomous Driving via Discrete Diffusion**](https://arxiv.org/abs/2311.01017) | Waabi + University of Toronto; ICLR 2024 | Tokenizes LiDAR observations with a VQ-VAE and predicts diverse future point clouds using discrete diffusion. | Future point-cloud observations; past LiDAR and estimated ego motion/action. | Discrete diffusion with temporal rollout; observation-level world modeling. | nuScenes, KITTI Odometry, and Argoverse 2; Chamfer distance at 1 s and 3 s and multi-future quality. |

**Complete list beyond the representative table:**

- [**LiSTAR: Ray-Centric World Models for 4D LiDAR Sequences in Autonomous Driving**](https://arxiv.org/abs/2511.16049) (2025) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)` [[Project](https://ocean-luna.github.io/LiSTAR.github.io/)]
- [**GEM: Generating LiDAR World Model via Deformable Mamba**](https://arxiv.org/abs/2605.07326) (2026) — `Author-defined WM` · `Metadata classified` · future LiDAR generation
- [**Towards Foundational LiDAR World Models with Efficient Latent Flow Matching**](https://arxiv.org/abs/2506.23434) (2025) — `Author-defined WM` · `Metadata classified` · latent-flow future LiDAR generation
- [**LiDARCrafter: Dynamic 4D World Modeling from LiDAR Sequences**](https://arxiv.org/abs/2508.03692) (2025) — `Author-defined WM` · `Abstract audited` · controllable autoregressive 4D LiDAR generation and editing
- [**U4D: Uncertainty-Aware 4D World Modeling from LiDAR Sequences**](https://openaccess.thecvf.com/content/CVPR2026/html/Xu_U4D_Uncertainty-Aware_4D_World_Modeling_from_LiDAR_Sequences_CVPR_2026_paper.html) (CVPR 2026) — `Author-defined WM` · `Full-text audited` · uncertainty-aware diffusion for temporally consistent 4D LiDAR worlds [[arXiv](https://arxiv.org/abs/2512.02982)]

### 3.2.1 Scene-level: entities and interactions

**15 papers: 2 representative papers + 13 compact entries.**

| Paper | Team / venue | Core contribution | Future state and action | Mechanism / role | Data and evidence |
| --- | --- | --- | --- | --- | --- |
| [**TrafficBots: Towards World Models for Autonomous Driving Simulation and Motion Prediction**](https://arxiv.org/abs/2303.04116) [[Code](https://github.com/zhejz/TrafficBots)] | ETH Zürich + MPI Informatics + KU Leuven; ICRA 2023 | Formulates configurable multi-agent traffic simulation as a reactive entity-level world model. | Agent states and actions; player plan plus destinations and latent personalities for surrounding agents. | Shared recurrent/attention policy and dynamics update; neural traffic simulator. | Waymo Open Motion Dataset; motion prediction, joint rollout realism, diversity, and controllability. |
| [**GUMP Solving Motion Planning Tasks with a Scalable Generative Model**](https://arxiv.org/abs/2407.02797) [[Code](https://github.com/HorizonRobotics/GUMP/)] | Horizon Robotics; ECCV 2024 | Provides scalable full- and partial-autoregressive agent simulation for scenario generation, policy evaluation, and planning. | Tokenized scene and agent states/actions; scene prompts and candidate policies. | Autoregressive entity/action rollout; simulator / planner evaluator. | Waymo Open Motion and nuPlan; simulation realism, generation, planning, and closed-loop evidence. |

**Complete list beyond the representative table:**

- [**CounterScene: Counterfactual Causal Reasoning in Generative World Models for Safety-Critical Closed-Loop Evaluation**](https://arxiv.org/abs/2603.21104) (2026) — `Author-defined WM` · `Abstract audited` · interaction-graph counterfactual agent rollout
- [**AutoWorld: Learning Multi-Agent Traffic Simulation with Self-Supervised World Models**](https://arxiv.org/abs/2603.28963) (2026) — `Author-defined WM` · `Abstract audited` · LiDAR-grounded interactive multi-agent simulation
- [**Enactor: From Traffic Simulators to Surrogate World Models**](https://arxiv.org/abs/2603.18266) (2026) — `Author-defined WM` · `Abstract audited` · actor-centric long-horizon traffic rollout
- [**HEAT: Heterogeneous End-to-End Autonomous Driving via Trajectory-Guided World Models**](https://arxiv.org/abs/2605.19631) (2026) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)`
- [**RLFTSim: Realistic and Controllable Multi-Agent Traffic Simulation via Reinforcement Learning Fine-Tuning**](https://arxiv.org/abs/2605.19033) (2026) — `Author-defined WM` · `Abstract audited` · controllable multi-agent simulator rollout
- [**SparseWorld: Enhancing End-to-End Autonomous Driving via World Models with Sparse Scene Representation**](https://arxiv.org/abs/2605.24354) (2026) — `Author-defined WM` · `Abstract audited` · autoregressive map/agent rollout [[Project](https://wryzju.github.io/SparseWorld/)]
- [**VectorWorld: Efficient Streaming World Model via Diffusion Flow on Vector Graphs**](https://arxiv.org/abs/2603.17652) (2026) — `Author-defined WM` · `Abstract audited` · real-time kilometer-scale vector-graph rollout [[Code](https://github.com/jiangchaokang/VectorWorld)]
- [**MARL-CCE Modelling Competitive Behaviors in Autonomous Driving Under Generative World Model**](https://www.ecva.net/papers/eccv_2024/papers_ECCV/papers/05085.pdf) (2024) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/qiaoguanren/MARL-CCE)]
- [**DriVerse: Navigation World Model for Driving Simulation via Multimodal Trajectory Prompting and Motion Alignment**](https://arxiv.org/abs/2504.19614) (ACM MM 2025) — `Author-defined WM` · `Metadata classified` · navigation-conditioned traffic simulation [[Code](https://github.com/shalfun/DriVerse)]
- [**Policy World Model for Collaborative State-Action Prediction**](https://arxiv.org/abs/2510.19654) (2025) — `Author-defined WM` · `Metadata classified` · collaborative agent state-action prediction
- [**World Models as Adversaries: Self-Play Fine-Tuning for Robust Motion Planning**](https://arxiv.org/abs/2607.10630) (2026) — `Author-defined WM` · `Metadata classified` · adversarial agent rollout for robust planning
- [**SafeDrive: Fine-Grained Safety Reasoning for End-to-End Driving in a Sparse World**](https://openaccess.thecvf.com/content/CVPR2026/html/Kim_SafeDrive_Fine-Grained_Safety_Reasoning_for_End-to-End_Driving_in_a_Sparse_CVPR_2026_paper.html) (CVPR 2026) — `Author-defined WM` · `Full-text audited` · trajectory-conditioned sparse world model for agent-level collision reasoning [[arXiv](https://arxiv.org/abs/2602.18887)]
- [**Learning-Based Realistic Traffic Scenario Simulation via Multiagent World Models With Intention-Aware Interactive Transformer**](https://doi.org/10.1109/TMECH.2026.3694680) (IEEE/ASME T-Mech 2026) — `Author-defined WM` · `Metadata classified` · intention-aware interactive multi-agent traffic simulation

### 3.2.2 Scene-level: BEV, occupancy, and geometry

**29 papers: 3 representative papers + 26 compact entries.**

| Paper | Team / venue | Core contribution | Future state and action | Mechanism / role | Data and evidence |
| --- | --- | --- | --- | --- | --- |
| [**OccWorld: Learning a 3D Occupancy World Model for Autonomous Driving**](https://arxiv.org/pdf/2311.16038.pdf) [[Code](https://github.com/wzzheng/OccWorld)] | Tsinghua University; ECCV 2024 | Introduces joint semantic occupancy and ego-motion forecasting as a self-supervised 3D world-model objective. | Future 3D semantic occupancy and ego pose; historical occupancy observations. | Discrete occupancy token autoregression; geometry rollout / pretraining. | nuScenes and Occ3D-style occupancy data; mIoU/IoU, planning, and scene-understanding transfer. |
| [**Drive-OccWorld: Driving in the Occupancy World: Vision-Centric 4D Occupancy Forecasting and Planning via World Models for Autonomous Driving**](https://arxiv.org/pdf/2408.14197) [[Project](https://drive-occworld.github.io/)] [[Code](https://github.com/yuyang-cloud/Drive-OccWorld)] | Zhejiang University + Huawei; AAAI 2025 | Adds flexible ego-action control and occupancy-based trajectory scoring to 4D occupancy forecasting. | Future occupancy and flow; velocity, steering, trajectory, and command conditions. | Memory-conditioned recurrent forecasting; planning-internal rollout. | nuScenes, nuScenes-Occupancy, and Lyft Level 5; mIoU/VPQ, controllability, and planning. |
| [**HERMES: A Unified Self-Driving World Model for Simultaneous 3D Scene Understanding and Generation**](https://arxiv.org/pdf/2501.14729) [[Code](https://github.com/LMD0311/HERMES)] [[Project](https://lmd0311.github.io/HERMES/)] | HUST + MEGVII + Mach Drive + HKU; ICCV 2025 | Unifies 3D scene understanding and action-conditioned future scene generation through shared geometric tokens and an LLM. | Future 3D scene tokens plus language understanding; images, geometric tokens, and action sequences. | Autoregressive token generation; unified understanding / generation. | nuScenes and OmniDrive-nuScenes; generation metrics and language/scene-understanding benchmarks. |

**Complete list beyond the representative table:**

- [**GEM: Gaussian Evolution Model for Occupancy Forecasting and Motion Planning**](https://arxiv.org/abs/2605.17682) (2026) — `Author-defined WM` · `Abstract audited` · continuous 4D Gaussian future states and planning
- [**OccSim: Multi-kilometer Simulation with Long-horizon Occupancy World Models**](https://arxiv.org/abs/2603.28887) (2026) — `Author-defined WM` · `Abstract audited` · ego-action-conditioned 3D occupancy rollout over 3,000 frames
- [**HERMES++: Toward a Unified Driving World Model for 3D Scene Understanding and Generation**](https://arxiv.org/abs/2604.28196) (2026) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/H-EmbodVis/HERMESV2)] [[Project](https://h-embodvis.github.io/HERMESV2/)]
- [**OWMDrive: Causality-Aware End-to-End Autonomous Driving via 4D Occupancy World Model**](https://arxiv.org/abs/2606.30421) (2026) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)`
- [**Unified Driving Tokens: Representation- and Geometry-Guided Discrete Tokenizer for Driving World Models and Planning**](https://arxiv.org/abs/2606.01935) (2026) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)`
- [**GaussianDWM: 3D Gaussian Driving World Model for Unified Scene Understanding and Multi-Modal Generation**](https://arxiv.org/abs/2512.23180) (2025) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/dtc111111/GaussianDWM)]
- [**GenieDrive: Towards Physics-Aware Driving World Model with 4D Occupancy Guided Video Generation**](https://arxiv.org/abs/2512.12751) (2025) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)` [[Project](https://huster-yzy.github.io/geniedrive_project_page/)]
- [**GeoDrive: 3D Geometry-Informed Driving World Model with Precise Action Control**](https://arxiv.org/abs/2505.22421) (2025) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/antonioo-c/GeoDrive)]
- [**NRSeg: Noise-Resilient Learning for BEV Semantic Segmentation via Driving World Models**](https://arxiv.org/abs/2507.04002) (2025) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/lynn-yu/NRSeg)]
- [**PreWorld: Semi-Supervised Vision-Centric 3D Occupancy World Model for Autonomous Driving**](https://arxiv.org/abs/2502.07309) (2025) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/getterupper/PreWorld)]
- [**UniFuture: A 4D Driving World Model for Future Generation and Perception**](https://arxiv.org/abs/2503.13587) (2025) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/dk-liang/UniFuture)] [[Project](https://dk-liang.github.io/UniFuture/)]
- [**OccLLaMA: An Occupancy-Language-Action Generative World Model for Autonomous Driving**](https://www.arxiv.org/abs/2409.03272) (2024) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)`
- [**Self-Supervised JEPA-Based World Models for LiDAR Occupancy Completion and Forecasting**](https://arxiv.org/abs/2602.12540) (2026) — `Author-defined WM` · `Metadata classified` · LiDAR occupancy completion and future forecasting
- [**CascadeOcc: 3D Occupancy World Models with Cascaded VQ Representations**](https://arxiv.org/abs/2606.27644) (2026) — `Author-defined WM` · `Metadata classified` · cascaded discrete occupancy prediction
- [**Infrastructure-Centric World Models: Bridging Temporal Depth and Spatial Breadth for Roadside Perception**](https://arxiv.org/abs/2604.17651) (2026) — `Author-defined WM` · `Metadata classified` · roadside spatiotemporal world representation
- [**T3Former: Temporal Triplane Transformers as Occupancy World Models**](https://arxiv.org/abs/2503.07338) (2025) — `Author-defined WM` · `Metadata classified` · temporal triplane occupancy prediction
- [**DIO: Decomposable Implicit 4D Occupancy-Flow World Model**](https://openaccess.thecvf.com/content/CVPR2025/papers/Diehl_DIO_Decomposable_Implicit_4D_Occupancy-Flow_World_Model_CVPR_2025_paper.pdf) (CVPR 2025) — `Author-defined WM` · `Metadata classified` · decomposed occupancy and flow prediction
- [**OccTENS: 3D Occupancy World Model via Temporal Next-Scale Prediction**](https://arxiv.org/abs/2509.03887) (2025) — `Author-defined WM` · `Metadata classified` · temporal next-scale occupancy prediction
- [**SparseWorld: Sparse and Dynamic 4D Occupancy World Model**](https://arxiv.org/abs/2510.17482) (2025) — `Author-defined WM` · `Metadata classified` · sparse dynamic occupancy prediction
- [**SparseWorld-TC: Trajectory-Conditioned Sparse Occupancy World Model**](https://arxiv.org/abs/2511.22039) (2025) — `Author-defined WM` · `Metadata classified` · trajectory-conditioned occupancy forecasting
- [**Vision-Centric 4D Occupancy Forecasting via Implicit Residual World Models**](https://arxiv.org/abs/2510.16729) (2025) — `Author-defined WM` · `Metadata classified` · residual 4D occupancy forecasting
- [**An Efficient Occupancy World Model via Decoupled Dynamic Flow**](https://arxiv.org/abs/2412.13772) (2024) — `Author-defined WM` · `Metadata classified` · decoupled occupancy and dynamic flow
- [**GaussianWorld: Gaussian World Model for Streaming 3D Occupancy Prediction**](https://arxiv.org/abs/2412.10373) (2024) — `Author-defined WM` · `Metadata classified` · streaming Gaussian occupancy prediction
- [**RenderWorld: World Model with Self-Supervised 3D Labels**](https://arxiv.org/abs/2409.11356) (2024) — `Author-defined WM` · `Metadata classified` · self-supervised geometry prediction
- [**DOME: Controllable Occupancy World Model**](https://arxiv.org/abs/2410.10429) (2024) — `Author-defined WM` · `Metadata classified` · controllable occupancy generation
- [**DeltaMamba: Structure-Aware Spatiotemporal World Model for 4D Occupancy Forecasting**](https://doi.org/10.2139/ssrn.6749443) (2026) — `Author-defined WM` · `Abstract audited` · kinematics-aware state-space forecasting and planning

### 3.3 Latent-space prediction

**98 papers: 4 representative papers + 94 compact entries.**

| Paper | Team / venue | Core contribution | Future state and action | Mechanism / role | Data and evidence |
| --- | --- | --- | --- | --- | --- |
| [**MILE: Model-Based Imitation Learning for Urban Driving**](https://arxiv.org/pdf/2210.07729.pdf) [[Code](https://github.com/wayveai/mile)] | Wayve + University of Cambridge; NeurIPS 2022 | Jointly learns a compact stochastic driving dynamics model and policy from offline expert demonstrations. | Future latent state/action, decodable to BEV semantics; cameras, route, speed, and ego actions. | Action-conditioned RSSM-style latent dynamics; planning / imitation learning. | CARLA; driving score, route completion, infractions, latent imagination, and out-of-town/weather generalization. |
| [**Think2Drive: Efficient Reinforcement Learning by Thinking with Latent World Model for Autonomous Driving (in CARLA-v2)**](https://www.ecva.net/papers/eccv_2024/papers_ECCV/papers/06129.pdf) [[Project](https://thinklab-sjtu.github.io/CornerCaseRepo/)] | Shanghai Jiao Tong University; ECCV 2024 | Uses a compact latent simulator to train a neural planner efficiently for corner-case-heavy CARLA Leaderboard v2. | Latent environment transition and reward; compact observations and driving controls. | Dreamer-style latent dynamics and model-based RL; planner training. | CARLA Leaderboard v2 and CornerCaseRepo; route completion, infractions, scenario density, and training efficiency. |
| [**DriveWorld: 4D Pre-trained Scene Understanding via World Models for Autonomous Driving**](https://arxiv.org/pdf/2405.04390) | Peking University-led multi-institution team; CVPR 2024 | Pretrains a 4D driving representation with dynamic memory and static-scene propagation in a memory state-space model. | Future latent BEV/occupancy state and action reconstruction; historical multiview images and expert actions. | Memory state-space latent prediction; predictive pretraining. | OpenScene and nuScenes; detection, mapping, tracking, forecasting, occupancy, and planning transfer. |
| [**LAW: Enhancing End-to-End Autonomous Driving with Latent World Model**](https://arxiv.org/abs/2406.08481) [[Code](https://github.com/BraveGroup/LAW)] | CASIA + UCAS; ICLR 2025 | Adds an ego-trajectory-conditioned future-feature prediction objective to end-to-end driving planners. | Future scene latent feature; current feature and ego trajectory. | Latent feature transition; planning / predictive representation learning. | nuScenes, NAVSIM, and closed-loop CARLA; planning error, collision, and driving performance. |

**Complete list beyond the representative table:**

- [**CoPhy: Distill to Think, Foresee to Act**](https://arxiv.org/abs/2605.21139) (2026) — `Author-defined WM` · `Abstract audited` · autoregressive candidate-action-conditioned BEV rollout for policy optimization
- [**DLWM: Dual Latent World Models Enable Holistic Gaussian-Centric Pre-training in Autonomous Driving**](https://arxiv.org/abs/2604.00969) (CVPR 2026) — `Author-defined WM` · `Abstract audited` · Gaussian-flow- and ego-planning-guided latent prediction
- [**DriveFuture: Future-Aware Latent World Models for Autonomous Driving**](https://arxiv.org/abs/2605.09701) (2026) — `Author-defined WM` · `Abstract audited` · ego-action-conditioned future latent state for planning
- [**DriveWorld-VLA: Unified Latent-Space World Modeling with Vision-Language-Action for Autonomous Driving**](https://arxiv.org/abs/2602.06521) (ICML 2026) — `Author-defined WM` · `Abstract audited` · action-conditioned latent imagination [[Code](https://github.com/liulin815/DriveWorld-VLA)] [[Venue](https://icml.cc/virtual/2026/poster/61191)]
- [**DynFlowDrive: Flow-Based Dynamic World Modeling for Autonomous Driving**](https://arxiv.org/abs/2603.19675) (2026) — `Author-defined WM` · `Abstract audited` · action-conditioned rectified-flow latent transitions
- [**IDOL: Inverse-Dynamics-Guided Future Prediction for End-to-End Autonomous Driving**](https://arxiv.org/abs/2605.31476) (2026) — `Author-defined WM` · `Abstract audited` · multi-step latent BEV futures and inverse-dynamics planning
- [**ProDrive: Proactive Planning for Autonomous Driving via Ego-Environment Co-Evolution**](https://arxiv.org/abs/2604.25329) (2026) — `Author-defined WM` · `Abstract audited` · candidate-trajectory-conditioned BEV future evolution
- [**Auto-JEPA: A Latent World Model of Continuous Intent for End-to-End Autonomous Driving**](https://arxiv.org/abs/2607.29031) (2026) — `Author-defined WM` · `Metadata classified` · `Latent dynamics / state-space / JEPA`
- [**CausalDrive: Real-time Causal World Models for Autonomous Driving**](https://arxiv.org/abs/2606.15341) (2026) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)`
- [**CoWorld-VLA: Thinking in a Multi-Expert World Model for Autonomous Driving**](https://arxiv.org/abs/2605.10426) (2026) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)`
- [**DreamerAD: Efficient Reinforcement Learning via Latent World Model for Autonomous Driving**](https://arxiv.org/abs/2603.24587) (2026) — `Author-defined WM` · `Metadata classified` · `Latent dynamics / state-space / JEPA`
- [**Driver-WM: A Driver-Centric Traffic-Conditioned Latent World Model for In-Cabin Dynamics Rollout**](https://arxiv.org/abs/2605.05092) (2026) — `Author-defined WM` · `Metadata classified` · `Latent dynamics / state-space / JEPA`
- [**Ego-Dynamics-Augmented World Model for Autonomous Driving with Zero-Shot Cross-Chassis Adaptation**](https://arxiv.org/abs/2607.13410) (2026) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)`
- [**Geographic Diversity Beats Data Volume for Cross-Domain Generalization in Zero-Label JEPA Driving World Models**](https://arxiv.org/abs/2607.04500) (2026) — `Author-defined WM` · `Metadata classified` · `Latent dynamics / state-space / JEPA`
- [**GraphWorld: Long-Horizon Planning with World Models for End-to-End Autonomous Driving**](https://arxiv.org/abs/2606.16274) (2026) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)`
- [**HyWorldVLA: A Vision-Language-Action Model with Hybrid World Modeling for Autonomous Driving**](https://arxiv.org/abs/2607.20988) (2026) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)`
- [**Is Energy Guidance All You Need? Training-Free Norm Injection for Driving World Models**](https://arxiv.org/abs/2607.10781) (2026) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)`
- [**Kinematics-Aware Latent World Models for Data-Efficient Autonomous Driving**](https://arxiv.org/abs/2603.07264) (2026) — `Author-defined WM` · `Metadata classified` · `Latent dynamics / state-space / JEPA`
- [**LWDrive: Layer-Wise World-Model-Guided Vision-Language Model Planning for Autonomous Driving**](https://arxiv.org/abs/2606.29879) (2026) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)`
- [**M4World: A Multi-view Multimodal Driving World Model for Interactive Object Manipulation and Minute-long Streaming**](https://arxiv.org/abs/2607.14005) (2026) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)`
- [**MAD: Motion Appearance Decoupling for efficient Driving World Models**](https://arxiv.org/abs/2601.09452) (2026) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)` [[Project](https://vita-epfl.github.io/MAD-World-Model/)]
- [**NVIDIA OmniDreams: Real-Time Generative World Model for Closed-Loop Autonomous Vehicle Simulation**](https://arxiv.org/abs/2606.03159) (2026) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)`
- [**OmniDrive: An LLM-Choreographed Multi-Agent World Model with Unified Latent Co-Compression for Multi-View Driving Video Generation**](https://arxiv.org/abs/2606.17536) (2026) — `Author-defined WM` · `Metadata classified` · `Latent dynamics / state-space / JEPA`
- [**PLAN-S: Bridging Planning with Latent Style Dynamics for Autonomous Driving World Models**](https://arxiv.org/abs/2606.06014) (2026) — `Author-defined WM` · `Metadata classified` · `Latent dynamics / state-space / JEPA`
- [**ResWorld: Temporal Residual World Model for End-to-End Autonomous Driving**](https://arxiv.org/abs/2602.10884) (2026) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/mengtan00/ResWorld.git)]
- [**AD-R1: Closed-Loop Reinforcement Learning for End-to-End Autonomous Driving with Impartial World Models**](https://arxiv.org/abs/2511.20325) (2025) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)`
- [**AdaWM: Adaptive World Model based Planning for Autonomous Driving**](https://arxiv.org/abs/2501.13072) (2025) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)`
- [**CoIRL-AD: Collaborative-Competitive Imitation-Reinforcement Learning in Latent World Models for Autonomous Driving**](https://arxiv.org/abs/2510.12560) (2025) — `Author-defined WM` · `Metadata classified` · `Latent dynamics / state-space / JEPA`
- [**Dream to Drive: Model-Based Vehicle Control Using Analytic World Models**](https://arxiv.org/abs/2502.10012) (2025) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)`
- [**Dream4Drive Rethinking Driving World Model as Synthetic Data Generator for Perception Tasks**](https://arxiv.org/abs/2510.19195) (2025) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)` [[Project](https://wm-research.github.io/Dream4Drive/)]
- [**DriveVLA-W0: World Models Amplify Data Scaling Law in Autonomous Driving**](https://arxiv.org/abs/2510.12796) (2025) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)`
- [**Epona: Autoregressive Diffusion World Model for Autonomous Driving**](https://arxiv.org/abs/2506.24113) (2025) — `Author-defined WM` · `Metadata classified` · `Hybrid generative rollout` [[Code](https://github.com/Kevin-thu/Epona/)]
- [**InDRiVE: Intrinsic Disagreement-based Reinforcement for Vehicle Exploration through Curiosity-Driven Generalized World Model**](https://arxiv.org/abs/2503.05573) (2025) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)`
- [**InDRiVE: Reward-Free World-Model Pretraining for Autonomous Driving via Latent Disagreement**](https://arxiv.org/abs/2512.18850) (2025) — `Author-defined WM` · `Metadata classified` · `Latent dynamics / state-space / JEPA`
- [**Latent Chain-of-Thought World Modeling for End-to-End Autonomous Driving**](https://arxiv.org/abs/2512.10226) (2025) — `Author-defined WM` · `Metadata classified` · `Latent dynamics / state-space / JEPA`
- [**LongDWM: Cross-Granularity Distillation for Building a Long-Term Driving World Model**](https://arxiv.org/abs/2506.01546) (2025) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://wang-xiaodong1899.github.io/longdwm/)]
- [**MindDrive: An All-in-One Framework Bridging World Models and Vision-Language Model for End-to-End Autonomous Driving**](https://arxiv.org/abs/2512.04441) (2025) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)`
- [**Orbis: Overcoming Challenges of Long-Horizon Prediction in Driving World Models**](https://arxiv.org/abs/2507.13162) (2025) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)` [[Project](https://lmb-freiburg.github.io/orbis.github.io/)]
- [**Raw2Drive: Reinforcement Learning with Aligned World Models for End-to-End Autonomous Driving (in CARLA v2)**](https://arxiv.org/pdf/2505.16394) (2025) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)`
- [**SceneDiffuser++: City-Scale Traffic Simulation via a Generative World Model**](https://openaccess.thecvf.com/content/CVPR2025/html/Tan_SceneDiffuser_City-Scale_Traffic_Simulation_via_a_Generative_World_Model_CVPR_2025_paper.html) (2025) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)`
- [**Think Before You Drive: World Model-Inspired Multimodal Grounding for Autonomous Vehicles**](https://arxiv.org/abs/2512.03454) (2025) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)`
- [**Vehicle Dynamics Embedded World Models for Autonomous Driving**](https://arxiv.org/abs/2512.02417) (2025) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)`
- [**World4Drive: End-to-End Autonomous Driving via Intention-aware Physical Latent World Model**](https://arxiv.org/abs/2507.00603) (2025) — `Author-defined WM` · `Metadata classified` · `Latent dynamics / state-space / JEPA` [[Code](https://github.com/ucaszyp/World4Drive)]
- [**WorldRFT: Latent World Model Planning with Reinforcement Fine-Tuning for Autonomous Driving**](https://arxiv.org/abs/2512.19133) (2025) — `Author-defined WM` · `Metadata classified` · `Latent dynamics / state-space / JEPA`
- [**AdaptiveDriver Planning with Adaptive World Models for Autonomous Driving**](https://arxiv.org/pdf/2406.10714) (2024) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://arunbalajeev.github.io/world_models_planning/world_model_paper.html)]
- [**BEVWorld: A Multimodal World Model for Autonomous Driving via Unified BEV Latent Space**](https://arxiv.org/abs/2407.05679) (2024) — `Author-defined WM` · `Metadata classified` · `Latent dynamics / state-space / JEPA` [[Code](https://github.com/zympsyche/BevWorld)]
- [**CarDreamer: Open-Source Learning Platform for World Model based Autonomous Driving**](https://arxiv.org/abs/2405.09111) (2024) — `Author-defined WM` · `Metadata classified` · `Latent dynamics / state-space / JEPA` [[Code](https://github.com/ucd-dare/CarDreamer)]
- [**Doe-1: Closed-Loop Autonomous Driving with Large World Model**](https://arxiv.org/abs/2412.09627) (2024) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/wzzheng/Doe)]
- [**DriveDreamer-2: LLM-Enhanced World Models for Diverse Driving Video Generation**](https://arxiv.org/pdf/2403.06845) (2024) — `Author-defined WM` · `Metadata classified` · `Latent dynamics / state-space / JEPA` [[Project](https://drivedreamer2.github.io/)] [[Code](https://github.com/f1yfisher/DriveDreamer2)]
- [**DriveDreamer4D: World Models Are Effective Data Machines for 4D Driving Scene Representation**](https://arxiv.org/pdf/2410.13571) (2024) — `Author-defined WM` · `Metadata classified` · `Latent dynamics / state-space / JEPA` [[Project](https://drivedreamer4d.github.io/)] [[Code](https://github.com/GigaAI-research/DriveDreamer4D)]
- [**DrivePhysica Physical Informed Driving World Model**](https://arxiv.org/abs/2412.08410) (2024) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)`
- [**Imagine-2-Drive: High-Fidelity World Modeling in CARLA for Autonomous Vehicles**](https://arxiv.org/abs/2411.10171) (2024) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)` [[Project](https://anantagrg.github.io/Imagine-2-Drive.github.io/)]
- [**InfinityDrive: Breaking Time Limits in Driving World Models**](https://arxiv.org/abs/2412.01522v1) (2024) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)` [[Project](https://metadrivescape.github.io/papers_project/InfinityDrive/page.html)]
- [**LatentDriver Learning Multiple Probabilistic Decisions from Latent World Model in Autonomous Driving**](https://arxiv.org/abs/2409.15730) (2024) — `Author-defined WM` · `Metadata classified` · `Latent dynamics / state-space / JEPA` [[Code](https://github.com/Sephirex-X/LatentDriver)]
- [**Mitigating Covariate Shift in Imitation Learning for Autonomous Vehicles Using Latent Space Generative World Models**](https://arxiv.org/abs/2409.16663) (2024) — `Author-defined WM` · `Metadata classified` · `Latent dynamics / state-space / JEPA`
- [**RAMBLE From Imitation to Exploration: End-to-end Autonomous Driving based on World Model**](https://arxiv.org/abs/2410.02253) (2024) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/SCP-CN-001/rambler)]
- [**ReconDreamer: Crafting World Models for Driving Scene Reconstruction via Online Restoration**](https://arxiv.org/abs/2411.19548) (2024) — `Author-defined WM` · `Metadata classified` · `Latent dynamics / state-space / JEPA` [[Project](https://recondreamer.github.io/)] [[Code](https://github.com/GigaAI-research/ReconDreamer)]
- [**ADriver-I: A General World Model for Autonomous Driving**](https://arxiv.org/pdf/2311.13549.pdf) (2023) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)`
- [**UniWorld: Autonomous Driving Pre-training via World Models**](https://arxiv.org/abs/2308.07234) (2023) — `Author-defined WM` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/whuhxb/UniWorld)]
- [**ExploreVLA: Dense World Modeling and Exploration for End-to-End Autonomous Driving**](https://arxiv.org/abs/2604.02714) (ECCV 2026) — `Author-defined WM` · `Metadata classified` · future RGB/depth latent supervision and uncertainty-driven exploration [[Project](https://zihaosheng.github.io/ExploreVLA/)]
- [**EponaV2: Driving World Model with Comprehensive Future Reasoning**](https://arxiv.org/abs/2605.14696) (2026) — `Author-defined WM` · `Metadata classified` · future geometry and semantic reasoning for planning
- [**DeepSight: Long-Horizon World Modeling via Latent States Prediction for End-to-End Autonomous Driving**](https://arxiv.org/abs/2605.10564) (ICML 2026) — `Author-defined WM` · `Metadata classified` · parallel long-horizon BEV latent prediction [[Code](https://github.com/hotdogcheesewhite/DeepSight)]
- [**UniDWM: Towards a Unified Driving World Model via Multifaceted Representation Learning**](https://arxiv.org/abs/2602.01536) (2026) — `Author-defined WM` · `Metadata classified` · latent geometry, appearance, and dynamics for planning and generation
- [**Reason--Imagine--Act: Closed-Loop LLM Decision Making with World Models for Autonomous Driving**](https://arxiv.org/abs/2605.24004) (ITSC 2026) — `Author-defined WM` · `Metadata classified` · action-conditioned rollout verifies LLM proposals [[Code](https://github.com/pku-smart-city/source_code/tree/main/RIA)]
- [**HanoiWorld: A JEPA-Based World Model for Autonomous Vehicle Control**](https://arxiv.org/abs/2601.01577) (2026) — `Author-defined WM` · `Metadata classified` · recurrent JEPA latent planning
- [**Metis: A Generalizable and Efficient World-Action Model for Autonomous Driving and Urban Navigation**](https://arxiv.org/abs/2606.15869) (2026) — `Author-defined WM` · `Metadata classified` · joint world-action representation learning
- [**PerceptDrive: Perception Prior World-Action Modeling with Adaptive Expert Routing**](https://arxiv.org/abs/2607.20175) (2026) — `Author-defined WM` · `Metadata classified` · future latent prediction for direct planning
- [**Diffusion Transformer World-Action Model for AV Scene Prediction**](https://arxiv.org/abs/2606.12987) (2026) — `Author-defined WM` · `Metadata classified` · diffusion-transformer scene and action prediction
- [**GeoWorldAD: Geometry World Action Model for Autonomous Driving**](https://arxiv.org/abs/2607.17521) (2026) — `Author-defined WM` · `Metadata classified` · geometry-aware world-action representation
- [**Latent-WAM: Latent World Action Modeling for End-to-End Autonomous Driving**](https://arxiv.org/abs/2603.24581) (2026) — `Author-defined WM` · `Metadata classified` · latent world-action modeling
- [**Risk-Aware World Model Predictive Control for End-to-End Autonomous Driving**](https://arxiv.org/abs/2602.23259) (2026) — `Author-defined WM` · `Metadata classified` · risk-aware imagined-rollout control
- [**Discrete-WAM: Unified Discrete Vision-Action Token Editing for World-Policy Learning**](https://arxiv.org/abs/2606.05645) (2026) — `Author-defined WM` · `Metadata classified` · discrete joint vision-action world-policy learning
- [**Orbis 2: A Hierarchical World Model for Driving**](https://arxiv.org/abs/2607.15898) (2026) — `Author-defined WM` · `Metadata classified` · hierarchical driving rollout
- [**ReWorld: Learning Better Representations for World Action Models**](https://arxiv.org/abs/2606.27504) (2026) — `Author-defined WM` · `Metadata classified` · representation learning for world-action models
- [**WorldVLM: World-Model Forecasting with Vision-Language Reasoning**](https://arxiv.org/abs/2603.14497) (2026) — `Author-defined WM` · `Metadata classified` · language-reasoned future forecasting
- [**OmniNWM: Omniscient Driving Navigation World Models**](https://arxiv.org/abs/2510.18313) (2025) — `Author-defined WM` · `Metadata classified` · navigation world modeling
- [**PIWM: Dream to Drive with Predictive Individual World Model**](https://arxiv.org/abs/2501.16733) (2025) — `Author-defined WM` · `Metadata classified` · individualized predictive world modeling for planning
- [**3D-VLA: A 3D Vision-Language-Action Generative World Model**](https://arxiv.org/abs/2403.09631) (2024) — `Author-defined WM` · `Metadata classified` · 3D multimodal generative world-action representation
- [**GEM: Controllable Ego-Vision Multimodal World Model**](https://arxiv.org/abs/2412.11198) (2024) — `Author-defined WM` · `Metadata classified` · controllable multimodal ego-vision modeling
- [**A Multi-stage Predictive World Model for Autonomous Driving**](https://doi.org/10.1007/978-981-92-1635-2_4) (2026) — `Author-defined WM` · `Metadata classified` · metadata-level predictive world model
- [**FactorJEPA: Factorizing Monolithic Futures into Layout-Agent-Interaction Channels for Crowded Urban Worlds**](https://arxiv.org/abs/2608.01049) (2026) — `Author-defined WM` · `Abstract audited` · factorized JEPA future-state prediction on DENSEWORLD
- [**Zero-Label Driving Scenario Complexity Detection via JEPA**](https://arxiv.org/abs/2606.28383) (2026) — `Author-defined WM` · `Abstract audited` · predictive-error scenario mining
- [**CRISP: Camera-Radar Forecasting-Based World-Model Pretraining**](https://arxiv.org/abs/2607.04541) (2026) — `Author-defined WM` · `Metadata classified` · future-LiDAR predictive pretraining
- [**FASTopoWM: Lane-Segment Topology Reasoning with Latent World Models**](https://arxiv.org/abs/2507.23325) (2025) — `Author-defined WM` · `Metadata classified` · latent topology evolution
- [**WCog-VLA: A World-Cognitive VLA for End-to-End Autonomous Driving**](https://arxiv.org/abs/2607.08375) (2026) — `Author-defined WM` · `Abstract audited` · world-cognitive latent reasoning
- [**WorldDrive: Unifying Vision and Motion Representation**](https://arxiv.org/abs/2603.14948) (2026) — `Author-defined WM` · `Abstract audited` · unified scene-generation and planning representation
- [**Adaptive-WAM: Quality-Guided Early-Exit Planning from Intermediate Video-Diffusion Features**](https://arxiv.org/abs/2608.06008) (2026) — `Author-defined WM` · `Abstract audited` · adaptive world-action planning from intermediate video-model features
- [**WAM-Flow: Motion Planning via Discrete Flow Matching**](https://arxiv.org/abs/2512.06112) (2025) — `Author-defined WM` · `Metadata classified` · parallel coarse-to-fine world-action planning
- [**DriveLaW: Unifying Planning and Video Generation in a Latent Driving World**](https://openaccess.thecvf.com/content/CVPR2026/html/Xia_DriveLaW_Unifying_Planning_and_Video_Generation_in_a_Latent_Driving_CVPR_2026_paper.html) (CVPR 2026) — `Author-defined WM` · `Full-text audited` · shared video-world-model latents unify future generation and trajectory planning [[arXiv](https://arxiv.org/abs/2512.23421)]
- [**Planning in 8 Tokens: A Compact Discrete Tokenizer for Latent World Model**](https://openaccess.thecvf.com/content/CVPR2026/html/Kim_Planning_in_8_Tokens_A_Compact_Discrete_Tokenizer_for_Latent_CVPR_2026_paper.html) (CVPR 2026) — `Author-defined WM` · `Full-text audited` · CompACT compresses action-conditioned world-model observations for real-time planning [[arXiv](https://arxiv.org/abs/2603.05438)]
- [**WPT: World-to-Policy Transfer via Online World Model Distillation**](https://openaccess.thecvf.com/content/CVPR2026/html/Jiang_WPT_World-to-Policy_Transfer_via_Online_World_Model_Distillation_CVPR_2026_paper.html) (CVPR 2026) — `Author-defined WM` · `Full-text audited` · distills future-dynamics knowledge from an end-to-end world model into a real-time driving policy [[arXiv](https://arxiv.org/abs/2511.20095)]
- [**CogDriver: Integrating Cognitive Inertia for Temporally Coherent Planning in Autonomous Driving**](https://openaccess.thecvf.com/content/CVPR2026/html/Liu_CogDriver_Integrating_Cognitive_Inertia_for_Temporally_Coherent_Planning_in_Autonomous_CVPR_2026_paper.html) (CVPR 2026) — `Author-defined WM in accepted paper` · `Full-text audited` · sparse temporal memory builds a coherent internal world model [[arXiv](https://arxiv.org/abs/2509.00789)]
- [**WorldSplat: Gaussian-Centric Feed-Forward 4D Scene Generation for Autonomous Driving**](https://proceedings.iclr.cc/paper_files/paper/2026/hash/6fa4a1def9d60b5bf6078e13c900c45c-Abstract-Conference.html) (ICLR 2026) — `Author-defined WM in accepted-paper framing` · `Full-text audited` · feed-forward Gaussian-centric 4D driving-scene generation [[arXiv](https://arxiv.org/abs/2509.23402)]
- [**Enhancing Interpretable World Models for End-to-End Driving via Functional Decomposition**](https://doi.org/10.1007/978-981-95-9366-8_21) (2026) — `Author-defined WM` · `Metadata classified` · functionally decomposed interpretable driving world model

<!-- CORE_TAXONOMY_END -->

## Rollout mechanisms

This is the Chapter 4 cross-index: representation remains the primary home of each paper, while the mechanism records how its future is rolled out. It therefore links back to representative papers without duplicating their full descriptions.

| Mechanism | Representative papers | What the index captures | Recurring long-horizon issue |
| --- | --- | --- | --- |
| Latent dynamics / state space / JEPA | [MILE](https://arxiv.org/abs/2210.07729), [Think2Drive](https://arxiv.org/abs/2402.16720), [DriveWorld](https://arxiv.org/abs/2405.04390), [LAW](https://arxiv.org/abs/2406.08481), [AD-L-JEPA](https://arxiv.org/abs/2501.04969), [ResWorld](https://arxiv.org/abs/2602.10884) | recurrent state-space transitions, feature prediction, predictive embedding objectives | latent collapse, compounding model bias, weak observability of failure |
| Autoregressive | [GAIA-1](https://arxiv.org/abs/2309.17080), [DrivingWorld](https://arxiv.org/abs/2412.19505), [GUMP](https://arxiv.org/abs/2407.02797), [OccWorld](https://arxiv.org/abs/2311.16038), [HorizonDrive](https://arxiv.org/abs/2605.11596), [OccSim](https://arxiv.org/abs/2603.28887) | next-token or next-state causal factorization over visual, entity, geometry, or latent tokens | exposure bias, identity switching, sequential inference cost |
| Diffusion | [DriveDreamer](https://arxiv.org/abs/2309.09777), [Drive-WM](https://arxiv.org/abs/2311.17918), [Vista](https://arxiv.org/abs/2405.17398), [Copilot4D](https://arxiv.org/abs/2311.01017), [DOME](https://arxiv.org/abs/2410.10429) | multimodal denoising in video, point-cloud, occupancy, or latent space | sampling cost, temporal/geometric drift, weakening action response |
| Flow matching | [WAM-Flow](https://arxiv.org/abs/2512.06112), [WorldRFT](https://arxiv.org/abs/2512.19133), [DynFlowDrive](https://arxiv.org/abs/2603.19675), [VectorWorld](https://arxiv.org/abs/2603.17652) | continuous or discrete transport for efficient multimodal generation/planning | limited closed-loop evidence and solver/schedule sensitivity |
| Hybrid / multi-stage | [GAIA-1](https://arxiv.org/abs/2309.17080), [Vista](https://arxiv.org/abs/2405.17398), [HERMES](https://arxiv.org/abs/2501.14729), [UniFuture](https://arxiv.org/abs/2503.13587) | combinations of token prediction, diffusion decoding, geometry, semantics, or planners | interface mismatch and difficult end-to-end attribution |

Fixed-horizon prediction and recursive rollout must be distinguished: a strong one-step metric does not establish a credible rollout horizon. The shared audit targets are accumulated error, distribution shift, geometric drift, identity instability, action-response decay, and the absence of a standardized trustworthy-horizon protocol.

## System roles

### Data engine and scenario generation

- [**SubjectDrive**](https://arxiv.org/abs/2403.19438) - subject-controlled scaling of generative driving data. [[Project](https://subjectdrive.github.io/)]
- [**Cosmos-Drive-Dreams**](https://arxiv.org/abs/2506.09042) - world-foundation-model-based synthetic data generation. [[Project](https://research.nvidia.com/labs/toronto-ai/cosmos_drive_dreams/)]
- [**DrivingDojo**](https://arxiv.org/abs/2410.10738) - interactive, knowledge-enriched driving data for world modeling. [[Project](https://drivingdojo.github.io/)]

### Open-loop and closed-loop simulation

- [**CarDreamer**](https://arxiv.org/abs/2405.09111) - open-source platform for world-model-based driving. [[Code](https://github.com/ucd-dare/CarDreamer)]
- [**Vista**](https://arxiv.org/abs/2405.17398) - controllable visual environment rollouts. [[Code](https://github.com/OpenDriveLab/Vista)]
- [**ReSim**](https://arxiv.org/abs/2506.09981) - reliable and controllable real-world driving simulation. [[Project](https://opendrivelab.com/ReSim)]

### Planning and policy learning

- [**MILE**](https://proceedings.neurips.cc/paper_files/paper/2022/hash/827cb489449ea216e4a257c47e407d18-Abstract-Conference.html) - model-based imitation learning. [[Code](https://github.com/wayveai/mile)]
- [**Think2Drive**](https://arxiv.org/abs/2402.16720) - reinforcement learning through latent imagination.
- [**LAW**](https://arxiv.org/abs/2406.08481) - end-to-end driving with a latent predictive objective. [[Code](https://github.com/BraveGroup/LAW)]
- [**WoTE**](https://arxiv.org/abs/2504.01941) - online trajectory evaluation through a BEV world model. [[Code](https://github.com/liyingyanUCAS/WoTE)]
- [**Raw2Drive**](https://arxiv.org/abs/2505.16394) - reinforcement learning with aligned world models in CARLA.

### Predictive representation pretraining

- [**UniWorld**](https://arxiv.org/abs/2308.07234) - autonomous-driving pretraining through world models. [[Code](https://github.com/whuhxb/UniWorld)]
- [**ViDAR**](https://arxiv.org/abs/2312.17655) - visual point-cloud forecasting for scalable pretraining. [[Code](https://github.com/OpenDriveLab/ViDAR)]
- [**DriveWorld**](https://arxiv.org/abs/2405.04390) - 4D pretraining for scene understanding.
- [**AD-L-JEPA**](https://arxiv.org/abs/2501.04969) - self-supervised spatial predictive learning for LiDAR. [[Code](https://github.com/HaoranZhuExplorer/AD-L-JEPA-Release)]

## Related driving literature

These papers directly support the review but do **not** present the method itself as a driving world model or world-action model in the audited title, abstract, or paper. They remain useful for generation, prediction, planning, data engines, and conceptual comparison. Action conditioning and recursive rollout do not determine whether an author-defined world model enters the Core Taxonomy.

### Related generation and data engines

- [**InfiniVerse: Occupancy Guided Unbounded Scene Generation for Autonomous Driving**](https://arxiv.org/abs/2606.31109) (2026) — trajectory-controlled occupancy/video scene extension
- [**OccDirector: Language-Guided Behavior and Interaction Generation in 4D Occupancy Space**](https://arxiv.org/abs/2604.22240) (2026) — language-controlled occupancy scenario generation
- [**muSync-GS: Physics-Synchronized Driving Video Synthesis for Weather and Geometric Road Hazards**](https://arxiv.org/abs/2608.04412) (2026) — physics-synchronized video/data generation
- [**Closed Loop Dynamic Driving Data Mixture for Real-Synthetic Co-Training**](https://arxiv.org/abs/2605.21372) (2026) — closed-loop data-mixture optimization rather than state rollout
- [**Agent-driven Long-tail Simulation for Autonomous Driving**](https://arxiv.org/abs/2607.04331) (2026) — LLM-driven interactive traffic agents and the SemanticPlan benchmark
- [**World Model-Based Long-Tail and Scenario-Specific Generation for Autonomous Driving**](https://doi.org/10.26599/jicv.2026.9210080) (JICV 2026) — perspective on closed-loop long-tail generation
- [**Risk-Controllable Multi-View Diffusion for Driving Scenario Generation**](https://arxiv.org/abs/2603.11534) (2026) — risk-conditioned multiview long-tail generation
- [**FAR-Drive: Frame-AutoRegressive Video Generation in Closed-Loop Autonomous Driving**](https://arxiv.org/abs/2603.14938) (2026)
- [**ForgeDrive: Bidirectional Cross-Conditioning for Unified Visual-Action Generation in Autonomous Driving**](https://arxiv.org/abs/2606.31226) (2026)
- [**CoGen: 3D Consistent Video Generation via Adaptive Conditioning for Autonomous Driving**](https://arxiv.org/abs/2503.22231) (2025)
- [**DiVE: Efficient Multi-View Driving Scenes Generation Based on Video Diffusion Transformer**](https://arxiv.org/abs/2504.18576) (2025)
- [**DriveX: Omni Scene Modeling for Learning Generalizable World Knowledge in Autonomous Driving**](https://arxiv.org/abs/2505.19239) (2025)
- [**LSD-3D: Large-Scale 3D Driving Scene Generation with Geometry Grounding**](https://arxiv.org/abs/2508.19204) (2025)
- [**OmniGen: Unified Multimodal Sensor Generation for Autonomous Driving**](https://arxiv.org/abs/2512.14225) (2025)
- [**OpenTwinMap: An Open-Source Digital Twin Generator for Urban Autonomous Driving**](https://arxiv.org/abs/2511.21925) (2025)
- [**UniSceneV2: Scaling Up Occupancy-centric Driving Scene Generation**](https://arxiv.org/abs/2510.22973) (2025)
- [**VaViM and VaVAM: Autonomous Driving through Video Generative Modeling**](https://arxiv.org/abs/2502.15672) (2025)
- [**DrivingDojo Dataset**](https://proceedings.neurips.cc/paper_files/paper/2024/file/178f4666a84ecdd61e3b85145ed56484-Paper-Datasets_and_Benchmarks_Track.pdf) (2024)
- [**HoloDrive: Holistic 2D-3D Multi-Modal Street Scene Generation**](https://arxiv.org/abs/2412.01407) (2024)
- [**InfiniCube: Unbounded and Controllable Dynamic 3D Driving Scene Generation**](https://arxiv.org/abs/2412.03934) (2024)
- [**MagicDrive3D: Controllable 3D Generation for Any-View Rendering in Street Scenes**](https://arxiv.org/abs/2405.14475) (2024)
- [**OccSora: 4D Occupancy Generation Models as World Simulators**](https://arxiv.org/abs/2405.20337) (2024)
- [**SimGen: Simulator-conditioned Driving Scene Generation**](https://arxiv.org/abs/2406.09386) (2024)
- [**SubjectDrive: Scaling Generative Data in Autonomous Driving via Subject Control**](https://arxiv.org/abs/2403.19438) (2024)
- [**UniMLVG: Multi-view Long Video Generation for Autonomous Driving**](https://arxiv.org/abs/2412.04842) (2024)
- [**UniScene: Unified Occupancy-centric Driving Scene Generation**](https://arxiv.org/abs/2412.05435) (2024)
- [**DrivingDiffusion**](https://arxiv.org/abs/2310.07771) (2023)
- [**Panacea: Panoramic and Controllable Video Generation for Autonomous Driving**](https://arxiv.org/abs/2311.16813) (2023)
- [**WoVoGen: World Volume-aware Multi-camera Driving Scene Generation**](https://arxiv.org/abs/2312.02934) (2023)

### Related prediction, VLA, and planning

- [**UNIVERSE: Unified Video Action Models for Autonomous Driving with Flexible Mask-Modulated Modality Generation**](https://arxiv.org/abs/2607.05133) (2026) — unified video/action diffusion with optional joint rollout
- [**Drive-JEPA: Video JEPA Meets Multimodal Trajectory Distillation for End-to-End Driving**](https://arxiv.org/abs/2601.22032) (2026)
- [**DynVLA: Learning World Dynamics for Action Reasoning in Autonomous Driving**](https://arxiv.org/abs/2603.11041) (ICML 2026) [[Venue](https://icml.cc/virtual/2026/poster/63736)]
- [**Long-term Traffic Simulation via Structured Autoregressive Modeling**](https://arxiv.org/abs/2606.31209) (2026)
- [**See Tomorrow, Act Today: Foresight-Driven Autonomous Driving**](https://arxiv.org/abs/2605.07195) (2026)
- [**ImagiDrive: A Unified Imagination-and-Planning Framework**](https://arxiv.org/abs/2508.11428) (2025)
- [**ReSim: Reliable World Simulation for Autonomous Driving**](https://arxiv.org/abs/2506.09981) (2025)
- [**UMGen: Multimodal Driving Scenes via Next-Scene Prediction**](https://arxiv.org/abs/2503.14945) (2025)
- [**CarFormer: Self-Driving with Learned Object-Centric Representations**](https://arxiv.org/abs/2407.15843) (2024)
- [**DriveGPT: Scaling Autoregressive Behavior Models for Driving**](https://arxiv.org/abs/2412.14415) (2024)
- [**FipTR: Future Instance Prediction in Autonomous Driving**](https://arxiv.org/abs/2404.12867) (2024)
- [**GenAD: Generalized Predictive Model for Autonomous Driving**](https://arxiv.org/abs/2403.09630) (2024)
- [**SceneDiffuser: Driving Simulation Initialization and Rollout**](https://arxiv.org/abs/2412.12129) (2024)
- [**TOKEN: Object-level Knowledge for Long-tail Autonomous Driving**](https://arxiv.org/abs/2407.00959) (2024)
- [**CTT: Categorical Traffic Transformer**](https://arxiv.org/abs/2311.18307) (2023)
- [**Hierarchical Model-Based Imitation Learning for Planning in Autonomous Driving**](https://arxiv.org/abs/2210.09539) (2022)
- [**Separating the World and Ego Models for Self-Driving**](https://arxiv.org/abs/2204.07184) (2022)

### Related forecasting and generation

- [**Dreaming Across Towns: Semantic Rollout and Town-Adversarial Regularization for Zero-Shot CARLA Driving**](https://arxiv.org/abs/2604.27994) (2026) — Dreamer-style representation/generalization study
- [**SuperOcc: Toward Cohesive Temporal Modeling for Superquadric-Based Occupancy Prediction**](https://arxiv.org/abs/2601.15644) (2026) — occupancy prediction
- [**Not All Points Are Equal: Uncertainty-Aware 4D LiDAR Scene Synthesis**](https://arxiv.org/abs/2606.02510) (2026) — LiDAR future synthesis
- [**Geo-EVS: Geometry-Conditioned Extrapolative View Synthesis for Autonomous Driving**](https://arxiv.org/abs/2604.07250) (2026) — geometry-controlled driving view synthesis
- [**Trajectory-Based Video Generation Model for Autonomous Driving**](https://doi.org/10.1109/ICEAAI68945.2026.11442436) (2026) — trajectory-conditioned video generation
- [**CVD-STORM: Cross-View Video Diffusion for Autonomous Driving**](https://arxiv.org/abs/2510.07944) (2025)
- [**FSDrive: Thinking Visually with Spatio-Temporal CoT**](https://arxiv.org/abs/2505.17685) (2025)
- [**Genesis: Multimodal Driving Scene Generation**](https://arxiv.org/abs/2506.07497) (2025)
- [**LOPR: Self-supervised Multi-future Occupancy Forecasting**](https://arxiv.org/abs/2503.23125) (2025)
- [**MagicDrive-V2: Long Driving-Video Generation with Adaptive Control**](https://arxiv.org/abs/2411.13807) (2024)
- [**ViDAR: Visual Point Cloud Forecasting**](https://arxiv.org/abs/2312.17655) (2024)
- [**AD-L-JEPA: LiDAR Joint-Embedding Predictive Architecture**](https://arxiv.org/abs/2501.04969) (2025)
- [**MagicDrive: Street-View Generation with 3D Geometry Control**](https://arxiv.org/abs/2310.02601) (2023)
- [**Occupancy Prediction-Guided Neural Planner**](https://arxiv.org/abs/2305.03303) (2023)
- [**Symphony: Realistic and Diverse Agents for Driving Simulation**](https://arxiv.org/abs/2205.03195) (2022)
- [**Iso-Dream: Isolating Noncontrollable Visual Dynamics**](https://arxiv.org/abs/2205.13817) (2022)

### Related occupancy and predictive representation

These driving papers provide adjacent forecasting or representation references but do not call their own method a world model in the audited metadata.

- [**FUTURIST: Semantic Future Prediction through Multimodal Visual Sequence Transformers**](https://arxiv.org/abs/2501.08303) (2025) — `Semantic prediction`
- [**I2-World: Intra-Inter Tokenization for Dynamic 4D Scene Forecasting**](https://arxiv.org/abs/2507.09144) (2025) — `4D forecasting`
- [**OccProphet: Pushing Efficiency Frontier of Camera-Only 4D Occupancy Forecasting with Observer-Forecaster-Refiner Framework**](https://arxiv.org/abs/2502.15180) (ICLR 2025) — `Occupancy forecasting` [[Code](https://github.com/JLChen-C/OccProphet)]
- [**DINO-Foresight: Looking into the Future with DINO**](https://arxiv.org/abs/2412.11673) (2024) — `Predictive representation`
- [**OCCVAR: Scalable 4D Occupancy Prediction via Next-Scale Prediction**](https://openreview.net/forum?id=X2HnTFsFm8) (2024) — `Occupancy prediction`
- [**UnO: Unsupervised Occupancy Fields for Perception and Forecasting**](https://arxiv.org/abs/2406.08691) (2024) — `Occupancy forecasting`

### Related sensor generation and simulation

- [**X-Cache: Cross-Chunk Block Caching for Few-Step Autoregressive World Models Inference**](https://arxiv.org/abs/2604.20289) (2026) — `Driving-WM acceleration`
- [**Network-Efficient World Model Token Streaming**](https://arxiv.org/abs/2605.09886) (2026) — `Bandwidth-aware deployment`
- [**A Mechanistic View on Video Generation as World Models**](https://arxiv.org/abs/2601.17067) (2026) — `Video-WM boundary`
- [**DCARL: Autoregressive Long-Trajectory Video Generation**](https://arxiv.org/abs/2603.24835) (2026) — `Long-video generation`
- [**Dreamland: Controllable World Creation with Simulator and Generative Models**](https://arxiv.org/abs/2506.08006) (2025) — `Data engine`
- [**G2Editor: 3D Gaussian-Guided Object Editing for Driving Video Generation**](https://arxiv.org/abs/2508.20471) (2025) — `Driving video editing`
- [**LaGen: Towards Autoregressive LiDAR Scene Generation**](https://arxiv.org/abs/2511.21256) (2025) — `LiDAR generation`
- [**Learning to Generate 4D LiDAR Sequences**](https://arxiv.org/abs/2509.11959) (2025) — `LiDAR generation`
- [**MoVieDrive: Multi-Modal Multi-View Urban Scene Synthesis**](https://arxiv.org/abs/2508.14327) (2025) — `Driving scene generation`
- [**PhiGenesis: 4D Driving Scene Generation with Stereo Forcing**](https://arxiv.org/abs/2509.20251) (2025) — `4D scene generation`
- [**RadarGen: Automotive Radar Point-Cloud Generation from Cameras**](https://arxiv.org/abs/2512.17897) (2025) — `Radar generation`
- [**Seeing Clearly, Forgetting Deeply: Video Generators for Driving Simulation**](https://arxiv.org/abs/2508.16512) (2025) — `Simulator analysis`
- [**STAGE: Stream-Centric Long-Horizon Driving-Scene Simulation**](https://arxiv.org/abs/2506.13138) (2025) — `Long-horizon simulation`
- [**Delphi: Controllable Long-Video Generation for End-to-End Driving**](https://arxiv.org/abs/2406.01349) (2024) — `Driving video generation`
- [**DriveGenVLM: Real-World Video Generation for VLM-Based Driving**](https://arxiv.org/abs/2408.16647) (2024) — `Video/VLM boundary`
- [**DynamicCity: Large-Scale LiDAR Generation from Dynamic Scenes**](https://arxiv.org/abs/2410.18084) (2024) — `LiDAR generation`
- [**Generating Out-of-Distribution Scenarios Using Language Models**](https://arxiv.org/abs/2411.16554) (2024) — `Scenario generation`
- [**LidarDM: Generative LiDAR Simulation in a Generated World**](https://arxiv.org/abs/2404.02903) (2024) — `LiDAR simulation`

### Related closed-loop systems

- [**LIDAR-AD: Latent-Interaction Dreamer with Action-Residual Chains**](https://arxiv.org/abs/2607.11964) (2026) — `Planning / latent dynamics`
- [**SAMoE-VLA: Scene-Adaptive Mixture-of-Experts VLA for Autonomous Driving**](https://arxiv.org/abs/2603.08113) (2026) — `VLA boundary`
- [**Vega: Learning to Drive with Natural-Language Instructions**](https://arxiv.org/abs/2603.25741) (2026) — `Language-driving boundary`
- [**CorrectAD: A Self-Correcting Agentic System for End-to-End Planning**](https://arxiv.org/abs/2511.13297) (2025) — `Agentic planning boundary`
- [**UniUGP: Unifying Understanding, Generation, and Planning for End-to-End Driving**](https://arxiv.org/abs/2512.09864) (2025) — `Understanding / generation / planning`
- [**DriveSim: Probing Multimodal LLMs as World Models for Driving**](https://arxiv.org/abs/2405.05956) (2024) — `VLM evaluation boundary`
- [**SSR: Does End-to-End Autonomous Driving Really Need Perception Tasks?**](https://arxiv.org/abs/2409.18341) (2024) — `E2E boundary`

### Source-completeness entries outside driving-WM scope

These five entries occur in the upstream driving section but are retained only to make the coverage difference explicit; they are not counted as driving world models.

- [**AVD2: Accident Video Diffusion for Accident Video Description**](https://arxiv.org/abs/2502.14801) (2025) — `Accident-video description`
- [**Occ-LLM: Enhancing Autonomous Driving with Occupancy-Based LLMs**](https://arxiv.org/abs/2502.06419) (2025) — `Perception/LLM boundary`
- [**Semi-SD: Semi-Supervised Metric Depth Estimation via Surrounding Cameras**](https://arxiv.org/abs/2503.19713) (2025) — `Depth estimation`
- [**World Models for Autonomous Navigation of Terrestrial Robots from LiDAR**](https://arxiv.org/abs/2512.03429) (2025) — `Non-driving robot navigation`
- [**UMAD: Unsupervised Mask-Level Anomaly Detection for Autonomous Driving**](https://arxiv.org/abs/2406.06370) (2024) — `Anomaly detection`

## Evaluation and benchmarks

No single score establishes that a model is a useful driving world model. This index mirrors Chapter 6 by separating appearance, geometry, action response, rollout, and downstream utility.

| Evaluation target | Metrics / protocol families | Representative resources |
| --- | --- | --- |
| Visual fidelity and temporal quality | FID/FVD, perceptual similarity, human preference, temporal consistency | [WorldSimBench](https://arxiv.org/abs/2410.18072), [WorldModelBench](https://arxiv.org/abs/2502.20694), [DrivingGen](https://arxiv.org/abs/2601.01528) |
| Action controllability and causality | action classification/retrieval, trajectory adherence, counterfactual response, intervention sensitivity | [Terra / ACT-Bench](https://arxiv.org/abs/2412.05337), [MIND](https://arxiv.org/abs/2602.08025), [Omni-WorldBench](https://arxiv.org/abs/2603.22212) |
| Physical and geometric consistency | depth/pose error, epipolar and multiview consistency, collision/kinematics, 3D/4D coherence | [4DWorldBench](https://arxiv.org/abs/2511.19836), [WorldBench](https://arxiv.org/abs/2601.21282), [Physics-grounded multi-agent benchmark](https://arxiv.org/abs/2606.28757) |
| Point cloud and occupancy futures | Chamfer distance, occupancy IoU/mIoU, VPQ, flow, instance/semantic consistency | [Cam4DOcc](https://arxiv.org/abs/2311.17663), [UniOcc](https://arxiv.org/abs/2503.24381), [VISA](https://arxiv.org/abs/2606.13460) |
| Reactive and closed-loop behavior | collision, route completion, infractions, realism, diversity, policy response, credible rollout horizon | [SimWorld](https://arxiv.org/abs/2503.13952), [WorldLens](https://arxiv.org/abs/2512.10958), [ReactSim-Bench](https://arxiv.org/abs/2606.14058) |
| Planning and policy utility | open/closed-loop planning scores, policy ranking, downstream transfer and sample efficiency | [WoTE](https://arxiv.org/abs/2504.01941), [Drive&Gen](https://arxiv.org/abs/2510.06209), [Scalable Policy Evaluation with Video World Models](https://arxiv.org/abs/2511.11520) |
| Test adequacy and simulator admissibility | valid interactive evidence, artifact/duplicate accounting, convergence under budget, action robustness, accreditation level | [WM-Cov](https://arxiv.org/abs/2608.00298), [Validate the Dream Before You Trust Its Verdict](https://arxiv.org/abs/2607.07196), [Decision-Making-Centric Evaluation](https://arxiv.org/abs/2606.15032) |

Additional driving-specific evaluation references include [DrivingGen](https://arxiv.org/abs/2601.01528), [Is Your Driving World Model an All-Around Player?](https://arxiv.org/abs/2605.10858), [StressDream](https://arxiv.org/abs/2606.00267), [World-Model-Driven Multi-Target Distilled Evaluation](https://doi.org/10.1088/1361-6501/ae80ef), [DiST-4D](https://arxiv.org/abs/2503.15208), [ORAD-3D](https://arxiv.org/abs/2510.16500), [NeMo](https://www.ecva.net/papers/eccv_2024/papers_ECCV/papers/02571.pdf), and [MUVO](https://arxiv.org/abs/2311.11762). Appearance-only metrics should not be treated as evidence of action sensitivity, physical correctness, or closed-loop safety.

## Datasets

Datasets are resources, not world models. They are grouped by the evidence they support rather than mixed into the Core Taxonomy.

| Data family | Representative datasets | Most relevant use |
| --- | --- | --- |
| Multimodal driving sensors | [nuScenes](https://www.nuscenes.org/nuscenes), [Waymo Open Dataset](https://waymo.com/open/), [Argoverse 2](https://www.argoverse.org/av2.html), [KITTI](https://www.cvlibs.net/datasets/kitti/), [KITTI-360](https://www.cvlibs.net/datasets/kitti-360/) | video, LiDAR, BEV, geometry, transfer |
| Planning and interaction | [nuPlan](https://www.nuscenes.org/nuplan), [Waymo Open Motion Dataset](https://waymo.com/open/data/motion/), [Argoverse 2 Motion Forecasting](https://www.argoverse.org/av2.html), [Lyft Level 5](https://arxiv.org/abs/2006.14480) | entity interaction, policy learning, closed-loop replay |
| Large-scale driving video | [OpenDV-YouTube](https://github.com/OpenDriveLab/DriveAGI#genad-dataset-opendv-youtube), [DrivingDojo](https://drivingdojo.github.io/) | visual world-model pretraining and long-tail generation |
| Occupancy and 4D geometry | [Occ3D](https://github.com/Tsinghua-MARS-Lab/Occ3D), [OpenScene](https://github.com/OpenDriveLab/OpenScene), [Cam4DOcc](https://github.com/haomo-ai/Cam4DOcc) | 3D/4D occupancy, semantic flow, geometry rollout |
| Synthetic and safety-critical data | [CARLA](https://carla.org/), [MetaDrive](https://metadriverse.github.io/metadrive/), [TeraSim-World](https://arxiv.org/abs/2509.13164) | controllable intervention, corner cases, sim-to-real studies |
| 2026 interaction and sensor additions | [iWorld-Bench](https://arxiv.org/abs/2605.03941), [4DLidarOpen](https://arxiv.org/abs/2605.18074), [DENSEWORLD-115k](https://huggingface.co/datasets/anonymousML123/denseworld-115k) | interaction-centric evaluation, FMCW LiDAR dynamics, dense mixed-traffic prediction |

## Simulators and platforms

| Type | Resources | Repository role |
| --- | --- | --- |
| Physics / traffic simulation | [CARLA](https://github.com/carla-simulator/carla), [MetaDrive](https://github.com/metadriverse/metadrive), [SUMO](https://github.com/eclipse-sumo/sumo), [SMARTS](https://github.com/huawei-noah/SMARTS) | hand-engineered environments and test infrastructure; explicitly outside the learned-WM core |
| Planning / closed-loop evaluation | [nuPlan devkit](https://github.com/motional/nuplan-devkit), [Waymax](https://github.com/waymo-research/waymax), [CARLA-Garage](https://github.com/autonomousvision/carla_garage) | reproducible policy evaluation, log replay, and baselines |
| World-model learning platform | [CarDreamer](https://github.com/ucd-dare/CarDreamer) | CARLA-based environment for world-model RL and driving research |
| Learned / generative simulator | [Vista](https://github.com/OpenDriveLab/Vista), [ReSim](https://opendrivelab.com/ReSim), [SimWorld](https://github.com/Li-Zn-H/SimWorld) | controllable learned rollouts and simulator evaluation |

## Safety, robustness, and deployment

This Chapter 7 resource map separates measurable assurance questions from broad future-work claims.

| Assurance area | Representative papers / resources | Deployment question |
| --- | --- | --- |
| Safe policy learning and constraints | [SafeDreamer](https://openreview.net/forum?id=tsE5HLYtYg), [VL-SAFE](https://arxiv.org/abs/2505.16377), [Safe Planning and Policy Optimization](https://arxiv.org/abs/2506.04828) | Are unsafe imagined states, rewards, and actions detected before policy use? |
| Uncertainty and runtime failure detection | [U4D](https://arxiv.org/abs/2512.02982), [World Models That Know When They Don't Know](https://arxiv.org/abs/2512.05927), [DreamerV3-XP](https://arxiv.org/abs/2510.21418) | Is uncertainty calibrated per horizon, object, geometry, and action? |
| Robustness and distribution shift | [SEM2](https://arxiv.org/abs/2210.04017), [Robustness study of WAMs and VLAs](https://arxiv.org/abs/2603.22078), [Test-time observation interventions](https://arxiv.org/abs/2506.16565) | Does rollout remain valid under weather, domain, sensor, and behavior shifts? |
| Security and adversarial behavior | [BadDreamer](https://arxiv.org/abs/2606.21172), [When World Models Dream Wrong](https://arxiv.org/abs/2602.18739), [Security lifecycle of world-model embodied AI](https://arxiv.org/abs/2607.28226) | Can poisoning, backdoors, physical attacks, or prompt/condition manipulation alter futures silently? |
| Sim-to-real and validation | [DriveCtrl](https://arxiv.org/abs/2605.15116), [TeraSim-World](https://arxiv.org/abs/2509.13164), [WorldLens](https://arxiv.org/abs/2512.10958) | Which simulated improvements survive real sensor, dynamics, and traffic distributions? |
| Runtime engineering and assurance | [Video Generation Models as World Models](https://arxiv.org/abs/2603.28489), [World Models: The Safety Perspective](https://arxiv.org/abs/2411.07690) | Are latency, memory, energy, fallback, traceability, update control, and revalidation acceptable on vehicle hardware? |
| Simulator accreditation and evidence adequacy | [Admissibility for World-Model Simulators](https://arxiv.org/abs/2607.07196), [WM-Cov](https://arxiv.org/abs/2608.00298), [Interpretable World Models for Autonomous Driving](https://doi.org/10.2139/ssrn.7032792) | Is the learned simulator qualified to act as a safety-test oracle, and is its evidence auditable? |

Open engineering evidence still includes calibrated credible horizons, physical-constraint monitors, distribution-shift alarms, deterministic fallback behavior, hardware latency/memory/energy measurements, sim-to-real validation, traceable data/model versions, and post-update safety cases. Additional driving-specific resources include [Model-Predictive Policy Learning with Uncertainty Regularization](https://github.com/Atcold/pytorch-PPUU) and [SEM2](https://arxiv.org/abs/2210.04017); unrelated safety papers from other domains are excluded.

## Workshops and challenges

- **CVPR 2025 Autonomous Grand Challenge - World Model Track**. [[W](https://opendrivelab.com/challenge2025/#1x-wm)]
- **WorldModelBench: The 1st Workshop on Benchmarking World Models, CVPR 2025**. [[W](https://worldmodelbench.github.io/)]
- **CVPR 2024 Autonomous Grand Challenge - Predictive World Model Track**. [[W](https://opendrivelab.com/challenge2024/#predictive_world_model)]
- **CVPR 2023 Workshop on Autonomous Driving - 3D Occupancy Forecasting Challenge**. [[W](https://eval.ai/web/challenges/challenge-page/1977/overview)] [[D](https://www.argoverse.org/av2.html)]

## Related collections

- [LMD0311/Awesome-World-Model](https://github.com/LMD0311/Awesome-World-Model) - extensive chronological coverage of driving, robotics, and general world models.
- [OpenDriveLab/DriveAGI](https://github.com/OpenDriveLab/DriveAGI) - driving foundation models, data, and benchmarks.
- [GigaAI-research/General-World-Models-Survey](https://github.com/GigaAI-research/General-World-Models-Survey) - general world models and video generation.
- [worldbench/survey](https://github.com/worldbench/survey) - 3D and 4D world modeling.
- [MoyangSensei/AwesomeRobustDWM](https://github.com/MoyangSensei/AwesomeRobustDWM) - robustness of driving world models.
- [IrohXu/Awesome-Multimodal-LLM-Autonomous-Driving](https://github.com/IrohXu/Awesome-Multimodal-LLM-Autonomous-Driving) - multimodal LLMs for autonomous driving.

## Contributing and acknowledgements

Please read [CONTRIBUTING.md](CONTRIBUTING.md) before opening a PR. In particular, provide an official paper link, quote where the authors define the work as a world model or world-action model, and place it in one primary category.

This collection was initially cross-checked against [LMD0311/Awesome-World-Model](https://github.com/LMD0311/Awesome-World-Model). We thank its maintainers and all authors who make papers, code, data, and evaluation tools publicly available. Entries here are independently selected and reorganized around the taxonomy of our review.

If you use this list, please cite the original papers. Citation information for our companion review will be added after publication.

# Awesome Autonomous Driving World Models

[![Awesome](https://awesome.re/badge.svg)](https://awesome.re)
[![Link Check](https://github.com/thu-vinlab/Awesome-Autonomous-Driving-World-Model/actions/workflows/link-check.yml/badge.svg)](https://github.com/thu-vinlab/Awesome-Autonomous-Driving-World-Model/actions/workflows/link-check.yml)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

A curated collection of **world models for autonomous driving**, organized by how a model represents the future, rolls it out, and contributes to a driving system.

Unlike chronological paper dumps, this list uses a review-oriented taxonomy. It emphasizes representative, reproducible, and evaluation-relevant resources. The list is maintained as a companion resource for our ongoing review, *Autonomous Driving World Models: Representations, Rollout Mechanisms, System Roles, and Deployment*.

> **Last updated:** August 2026. This is a living list, not a claim of completeness. Suggestions and corrections are welcome through [pull requests or issues](CONTRIBUTING.md).

**Full literature audit:** [1,000+ cross-repository references reclassified by the review outline](FULL_REFERENCE_CATALOG.md), with a machine-readable [provenance dataset](data/reference_catalog.json). See also the [survey-by-survey comparison of teams, publication status, detailed original taxonomies, core contributions, scope, evaluation, deployment, and differences from our framework](SURVEY_COMPARISON.md). The compact README below remains the expert-curated entry point.

## Autonomous driving background milestones

Before the world-model methods, the field evolved through an explicit modular stack, direct end-to-end learning, planning-oriented joint optimization, and VLA/VLM-to-driving systems. The [background milestone guide](AD_BACKGROUND_MILESTONES.md) records the representative teams, venues, milestone significance, and the boundary between these precursors and learned world models.

| Paradigm | Representative citation | Main contribution | World-model boundary |
| --- | --- | --- | --- |
| Modular system | [**Paden et al.**, *A Survey of Motion Planning and Control Techniques for Self-Driving Urban Vehicles* (IEEE T-IV 2016)](https://doi.org/10.1109/TIV.2016.2578706) | Canonical explicit planning/control pipeline | Background survey; no learned recursive state transition |
| Modular supplement | [**Badue et al.**, *Self-driving cars: A survey* (ESWA 2021)](https://doi.org/10.1016/j.eswa.2020.113816) | Broader system-level survey of perception, mapping, planning, control, and deployment | Optional background citation, not a world model |
| End-to-end driving | [**Bojarski et al.**, *End to End Learning for Self-Driving Cars* (NVIDIA PilotNet, 2016)](https://arxiv.org/abs/1604.07316) | Direct camera-to-steering policy learning | Policy prediction, not future-state rollout |
| Planning-oriented end-to-end | [**Hu et al.**, *Planning-oriented Autonomous Driving* (UniAD, CVPR 2023)](https://doi.org/10.1109/CVPR52729.2023.01712) | Joint task coordination around planning | Planning-centered precursor; not itself a world model |
| VLA / VLM-to-driving | [**Tian et al.**, *DriveVLM* (2024)](https://arxiv.org/abs/2402.12289) | Language-mediated scene reasoning and hierarchical planning, with DriveVLM-Dual vehicle deployment | VLA/VLM bridge; only predictive iterable components enter the WM scope |

For the compact four-citation introduction route, use Paden, Bojarski, UniAD, and DriveVLM; use Badue when a broader modular-system survey is needed.

## Autonomous driving world model surveys

> **Coverage note (searched 6 August 2026):** this collection combines the three source repositories with independent title/keyword searches of arXiv, OpenAlex, Crossref, Semantic Scholar, and GitHub. It aims for high coverage of public English-language surveys, but no literature search can guarantee permanent completeness; newly indexed and non-English work may still be missing.

The tables below place the related-survey analysis directly before our taxonomy. Titles link to the papers. A separate [evidence audit](SURVEY_COMPARISON.md) preserves full author lists, affiliations, publication verification, and source-level notes.

### Comprehensive surveys

| Year | Survey | Team / status | Authors' classification | Core contribution and relation to our review | Resources |
| ---: | --- | --- | --- | --- | --- |
| 2026 | [**World Models for Autonomous Driving: From Future Generation to Decision Making**](https://doi.org/10.2139/ssrn.6827179) | Tongji-led team; SSRN working paper | future generation / planning / hybrid under an MPC view; cross-comparison by representation and generator | Connects prediction to decision and closed-loop utility; our review separates state, mechanism, system role, and assurance instead of making MPC role the primary axis | [[Preprint](https://doi.org/10.2139/ssrn.6827179)] |
| 2026 | [**Latent World Models for Automated Driving**](https://arxiv.org/abs/2603.09086) | RWTH Aachen + TU Delft; arXiv, under review | target: latent world/action/generator; form: continuous/discrete/hybrid; priors: geometry/topology/semantics; four uses and five mechanics | Unifies latent design and closed-loop evaluation; our review places latent prediction alongside observable and scene-level future states | [[Paper](https://arxiv.org/abs/2603.09086)] |
| 2025 | [**The Role of World Models in Shaping Autonomous Driving**](https://arxiv.org/abs/2502.10498) | HUST + Baidu; arXiv v2 | video / point cloud / occupancy / latent feature / traffic map; applications in simulation, data, driving enhancement, and pretraining | Broad modality-centered map with metrics and quantitative comparisons; our review adds admission criteria and separates entity from geometry | [[Paper](https://arxiv.org/abs/2502.10498)] [[List](https://github.com/LMD0311/Awesome-World-Model)] |
| 2025 | [**Research on World Models for Connected Automated Driving**](https://doi.org/10.3390/app15168986) | Shanghai University of Engineering Science; *Applied Sciences* | cooperative perception / prediction / decision / control / human-machine collaboration / scene generation | Extends world models to connected automation; its CAV pipeline categories are broader than learned action-conditioned transitions | [[Journal](https://doi.org/10.3390/app15168986)] |
| 2025 | [**A Survey of World Models for Autonomous Driving**](https://arxiv.org/abs/2501.11260) | Zhejiang University CCAI; arXiv v4, submitted to ACM | future physical-world generation / behavior planning / prediction-planning interaction; image / BEV / occupancy / point cloud subtypes | Consolidates generation, planning, benchmarks, and performance; our review makes state, mechanism, and role orthogonal and applies a stricter boundary | [[Paper](https://arxiv.org/abs/2501.11260)] [[List](https://github.com/FengZicai/AwesomeWMAD)] |
| 2024 | [**Exploring the Interplay Between Video Generation and World Models in Autonomous Driving**](https://arxiv.org/abs/2411.02914) | Southeast University-led academic-industry team; arXiv | video: traditional / diffusion; WM: perception-prediction / reinforcement learning; AR and diffusion driving models | Clarifies the video-generation/world-model lineage; our core excludes video generators without substantive action response and iterative rollout | [[Paper](https://arxiv.org/abs/2411.02914)] |
| 2024/25 | [**World Models for Autonomous Driving: An Initial Survey**](https://doi.org/10.1109/TIV.2024.3398357) | University of Macau-led team; IEEE T-IV | perception / memory / controller / world-model architecture; driving scenario generation / planning and control | Early consolidated history and driving application map; our review formalizes the boundary and loss-target-based state hierarchy | [[Paper](https://arxiv.org/abs/2403.02622)] [[Journal](https://doi.org/10.1109/TIV.2024.3398357)] |

### Thematic driving-world-model surveys

| Survey | Team / status | Authors' classification | Core contribution and relation to our review | Resources |
| --- | --- | --- | --- | --- |
| [**Multi-Agent Embodied Autonomous Driving: From V2X Information Exchange to Shared World Models**](https://arxiv.org/abs/2606.13840) | City University of Hong Kong + Lingnan University; arXiv 2026 | information exchange → shared state → cognition → cooperative planning; fusion, communication, MARL/optimization/generative planning | Reframes more than 380 V2X papers around shared predictive state; only qualifying learned transitions enter our entity, geometry, or latent classes | [[Paper](https://arxiv.org/abs/2606.13840)] [[List](https://github.com/dl-m9/Multi-Agent-Embodied-Autonomous-Driving)] |
| [**Progressive Robustness-Aware World Models in Autonomous Driving**](https://doi.org/10.36227/techrxiv.176523308.84756413/v1) | TechRxiv preprint, 2025 | generation / planning / enhancement × robustness 1.0 / 2.0 / 3.0 | Makes robustness a staged maturity axis from intrinsic metrics to open-world adaptation; our representation taxonomy remains the primary method organization | [[Paper](https://doi.org/10.36227/techrxiv.176523308.84756413/v1)] [[List](https://github.com/MoyangSensei/AwesomeRobustDWM)] |

### Closely related boundary surveys

These surveys supply neighboring literature, but their full scope is broader than our action-conditioned, iterable definition.

| Survey | Main scope / classification | Use in this review | Resources |
| --- | --- | --- | --- |
| [**A Survey on Future Physical World Generation for Autonomous Driving**](https://doi.org/10.1145/3769748.3773345) (MMAsia 2025) | image / BEV / occupancy / point-cloud generation, with diffusion, Transformer, and adversarial generators | Observation- and geometry-level generation sources; non-action-conditioned methods remain boundary work | [[Paper](https://doi.org/10.1145/3769748.3773345)] |
| [**Foundation Models in Autonomous Driving: Scenario Generation and Analysis**](https://doi.org/10.1109/OJITS.2026.3660686) (IEEE OJ-ITS 2026) | LLM / VLM / MLLM / diffusion / world model × scenario generation / analysis | Data engines, testing, controllability, simulators, and safety resources | [[Paper](https://arxiv.org/abs/2506.11526)] [[List](https://github.com/TUM-AVS/FM-AD-Survey)] |
| [**A Survey on Multimodal Large Language Models for Autonomous Driving**](https://doi.org/10.1109/WACVW60836.2024.00106) (WACV Workshops 2024) | driving / transportation / maps × MLLM tasks and benchmarks | VLM/VLA boundary, semantic reasoning, hallucination, and grounding references | [[Paper](https://arxiv.org/abs/2311.12320)] [[List](https://github.com/IrohXu/Awesome-Multimodal-LLM-Autonomous-Driving)] |
| [**Data-Centric Evolution in Autonomous Driving**](https://arxiv.org/abs/2401.12888) (2024) | big-data systems / data mining / development and post-deployment closed loops | Data-engine and engineering-loop references; its “closed loop” is not necessarily recursive world-model rollout | [[Paper](https://arxiv.org/abs/2401.12888)] [[List](https://github.com/LincanLi98/Awesome-Data-Centric-Autonomous-Driving)] |

### Cross-domain foundational surveys and methodological sources

These works contribute safety, embodied-AI, simulator, 3D/4D, general-world-model, video-efficiency, or RL foundations. They are indexed separately because not every reviewed method satisfies our ego-action and iterable-rollout admission criteria.

| Year | Scope | Survey / source | Detailed native classification | Main contribution | Resources |
| ---: | --- | --- | --- | --- | --- |
| 2026 | Embodied AI | [**A Comprehensive Survey on World Models for Embodied AI**](https://arxiv.org/abs/2510.16732) | functionality: decision-coupled / general-purpose; temporal: sequential simulation / global difference; spatial: vector / token / grid / decomposed rendering | Formalizes embodied WMs and provides a three-axis taxonomy, resources, metrics, and quantitative comparisons | [[List](https://github.com/Li-Zn-H/AwesomeWorldModels)] |
| 2026 | 3D/4D | [**3D and 4D World Modeling: A Survey**](https://arxiv.org/abs/2509.07996) | VideoGen / OccGen / LiDARGen × generative / predictive × geometric / action / semantic conditions × four functional roles | Establishes a native 3D/4D definition, multi-axis taxonomy, datasets, and metrics | [[Project](https://worldbench.github.io/survey)] [[List](https://github.com/worldbench/awesome-3d-4d-world-models)] |
| 2026 | Video efficiency | [**Video Generation Models as World Models**](https://arxiv.org/abs/2603.28489) | efficient modeling / architecture / inference, including diffusion distillation, AR/hybrid, memory, attention, caching, pruning, and quantization | Makes efficiency a first-class prerequisite for interactive video world simulators | [[Paper](https://arxiv.org/abs/2603.28489)] |
| 2025/26 | Simulators + embodied AI | [**Learning Embodied Intelligence from Physical Simulators and World Models**](https://arxiv.org/abs/2507.00917) | IR-L0–L4; simulators by physics/rendering/sensors; WMs as neural simulators / dynamics / reward models | Unifies external physical simulation and internal learned modeling across robots and driving | [[List](https://github.com/NJU3DV-LoongGroup/Embodied-World-Models-Survey)] |
| 2024 | General WMs | [**Understanding World or Predicting Future?**](https://arxiv.org/abs/2411.14499) | understanding: internal representation / world knowledge; prediction: video generation / embodied environments; four application domains | Introduces the understanding-versus-prediction functional split and maps it across domains | [[List](https://github.com/tsinghua-fib-lab/World-Model)] |
| 2024/25 | General WMs | [**Is Sora a World Simulator?**](https://arxiv.org/abs/2405.03520) | video generation / autonomous driving / autonomous agents; driving split into E2E and 2D/3D neural simulators | Connects generative world modeling to driving and autonomous-agent decision systems | [[List](https://github.com/GigaAI-research/General-World-Models-Survey)] |
| 2024 | Safety | [**World Models: The Safety Perspective**](https://arxiv.org/abs/2411.07690) | RNN / Transformer / diffusion / other techniques; generated-scene and agent pathologies; safety agenda | Centers hallucination, trustworthiness, and high-priority safety problems for embodied agents | [[Proceedings](https://doi.org/10.1109/ISSREW63542.2024.00104)] |
| 2026 | RL methodology | [**Reinforcement Learning: From Algorithms to Foundation Models**](https://arxiv.org/abs/2607.17560) | multi-agent games; diffusion WMs; efficient video generation; generative policies; interactive video WMs; memory | Princeton dissertation linking RL algorithms to foundation-model world modeling; retained as a methodological source, not a survey article | [[Thesis](https://arxiv.org/abs/2607.17560)] |

## Contents

- [Autonomous driving background milestones](#autonomous-driving-background-milestones)
- [Autonomous driving world model surveys](#autonomous-driving-world-model-surveys)
- [Detailed survey comparison](SURVEY_COMPARISON.md)
- [Full cross-repository catalog](#full-cross-repository-catalog)
- [Scope and taxonomy](#scope-and-taxonomy)
- [Core taxonomy](#core-taxonomy-world-models-by-future-state-representation)
  - [3.1.1 Future image and video](#311-observation-level-future-image-and-video)
  - [3.1.2 Future point cloud](#312-observation-level-future-point-cloud)
  - [3.2.1 Entities and interactions](#321-scene-level-entities-and-interactions)
  - [3.2.2 BEV, occupancy, and geometry](#322-scene-level-bev-occupancy-and-geometry)
  - [3.3 Latent-space prediction](#33-latent-space-prediction)
- [Rollout mechanisms](#rollout-mechanisms)
- [System roles](#system-roles)
- [Evaluation and benchmarks](#evaluation-and-benchmarks)
- [Datasets](#datasets)
- [Simulators and platforms](#simulators-and-platforms)
- [Safety, robustness, and deployment](#safety-robustness-and-deployment)
- [Workshops and challenges](#workshops-and-challenges)
- [Related collections](#related-collections)
- [Contributing and acknowledgements](#contributing-and-acknowledgements)

## Full cross-repository catalog

The [full reference catalog](FULL_REFERENCE_CATALOG.md) exhaustively extracts all bullets with explicit paper or report links from these requested sources, then deduplicates and reclassifies them under our paper outline:

- [HaoranZhuExplorer/World-Models-Autonomous-Driving-Survey](https://github.com/HaoranZhuExplorer/World-Models-Autonomous-Driving-Survey)
- [ChaofanTao/Autoregressive-Models-in-Vision-Survey](https://github.com/ChaofanTao/Autoregressive-Models-in-Vision-Survey)
- [LMD0311/Awesome-World-Model](https://github.com/LMD0311/Awesome-World-Model)

Every catalog entry exposes its Chapter 2 admission status, Chapter 3 representation category, Chapter 4 rollout mechanism, Chapter 5-7 roles, source repository, and available paper/code/project links. The accompanying [JSON dataset](data/reference_catalog.json) retains source sections and raw upstream entries for audit and future updates.

## Scope and taxonomy

We define a learned driving world model as an action-conditioned transition function, `s(t+1) = F(s(t), a(t))`, and use two core admission criteria:

1. **Action conditionality:** `F` accepts an ego action and responds materially; different actions should lead to different future states.
2. **Rollout capability:** the predicted state is compatible with the model input so that `F` can be applied iteratively beyond a single fixed prediction.

Because the field still lacks a settled boundary, we also follow an inclusive author-definition rule: a paper that explicitly calls itself a world model and broadly satisfies both criteria is retained as a candidate, with its admission status exposed for audit.

Pure video generation such as Sora, static NeRF/3DGS reconstruction, generic temporal prediction, perception-only VLMs, action-only VLAs, and E2E driving systems without a predictive world-model component are outside the core scope. Hand-engineered simulators such as CARLA are resources rather than learned world models. Robotics, games, Dreamer, V-JEPA, Genie, and autoregressive visual generation are retained as cross-domain origins or adjacent methodology, not mislabeled as driving world models.

Each work has one primary home even when it spans several categories. We use the following compact vocabulary:

| Dimension | Categories | Central question |
| --- | --- | --- |
| Future-state representation | observation (image/video or point cloud), scene (entity or geometry), latent | What state is predicted and where is the loss applied? |
| Rollout mechanism | latent dynamics/state space/JEPA, autoregressive, diffusion/flow, hybrid | How is the future generated? |
| System role | data engine, simulator, planner, pretraining | What does the model do for driving? |
| Readiness | fidelity, interaction, safety, runtime | Can its behavior be evaluated and trusted? |

Resource labels: **P** = paper, **C** = code, **D** = data/model, **W** = website or project page.

<!-- CORE_TAXONOMY_START -->
## Core taxonomy: world models by future-state representation

All 122 driving-world-model core and inclusive candidates are assigned one primary home below. Representative tables are full-text audited; compact entries retain metadata-based candidate labels pending paper-level verification. Titles link directly to papers. The [full 1,270-paper catalog](FULL_REFERENCE_CATALOG.md) also contains boundary work, evaluation, cross-domain foundations, and autoregressive-vision references.

- **Core candidate:** explicitly presented as a driving world model or selected as a review representative; final manuscript inclusion still follows our action/rollout criteria.
- **Inclusive candidate:** retained for coverage, but action conditionality or recursive rollout is incomplete or needs further audit.
- **Full-text audited / Metadata classified:** distinguishes paper-level verification from initial title, source-section, and metadata classification.

### 3.1.1 Observation-level: future image and video

**22 candidates. Representative papers:**

| Paper | Team / venue | Core contribution | Future state and action | Mechanism / role | Data and evidence |
| --- | --- | --- | --- | --- | --- |
| [**GAIA-1: A Generative World Model for Autonomous Driving**](https://arxiv.org/pdf/2309.17080.pdf) | Wayve; technical report 2023 | Large-scale multimodal driving model that tokenizes video, text, and actions and generates controllable future driving video. | Future video tokens; conditioned on video, text, and ego actions. | AR world model + diffusion decoder; neural simulator / data engine. | 4,700 h private driving video; generation quality, controllability, and qualitative long rollouts. |
| [**DriveDreamer: Towards Real-world-driven World Models for Autonomous Driving**](https://www.ecva.net/papers/eccv_2024/papers_ECCV/papers/06416.pdf) [[Project](https://drivedreamer.github.io/)] [[Code](https://github.com/JeffWang987/DriveDreamer)] | GigaAI + Tsinghua; ECCV 2024 | Builds a real-world-data-driven model for structured, text- and action-controllable driving video and action prediction. | Future video and driving action; traffic structure, text, and action conditions. | Two-stage diffusion; data engine / visual rollout. | nuScenes; video quality, structural controllability, and downstream perception/action experiments. |
| [**Drive-WM: Driving into the Future: Multiview Visual Forecasting and Planning with World Model for Autonomous Driving**](https://arxiv.org/pdf/2311.17918.pdf) [[Project](https://drive-wm.github.io/)] [[Code](https://github.com/BraveGroup/Drive-WM)] | CASIA + CAIR, HKISI, CAS; CVPR 2024 | Connects controllable multiview video forecasting to planning by imagining and scoring futures under candidate maneuvers. | Multiview future video; historical cameras and candidate ego trajectories/maneuvers. | Latent video diffusion; planning-internal rollout / simulator. | nuScenes; FID/FVD, multiview consistency, controllability, and planning evaluation. |
| [**Vista: A Generalizable Driving World Model with High Fidelity and Versatile Controllability**](https://proceedings.neurips.cc/paper_files/paper/2024/file/a6a066fb44f2fe0d36cf740c873b8890-Paper-Conference.pdf) [[Project](https://opendrivelab.com/Vista/)] [[Code](https://github.com/OpenDriveLab/Vista)] | HKUST + OpenDriveLab/Shanghai AI Lab + Tübingen + HKU; NeurIPS 2024 | Improves high-resolution, long-horizon visual rollout, cross-dataset generalization, and control from commands to trajectories. | Future video; command, goal point, trajectory, steering angle, and speed controls. | Latent diffusion with history replacement; simulator / action evaluation. | Large-scale mixed driving data; FID/FVD, human comparison, controllability, and action reward evaluation. |
| [**DrivingWorld: Constructing World Model for Autonomous Driving via Video GPT**](https://arxiv.org/abs/2412.19505) [[Project](https://huxiaotaostasy.github.io/DrivingWorld/index.html)] [[Code](https://github.com/YvanYin/DrivingWorld)] | HKUST + Horizon Robotics; arXiv 2024 | Introduces an efficient video-GPT design with spatial-temporal tokenization for controllable long driving-video generation. | Future video tokens; short video context and trajectory conditions. | Autoregressive next-token rollout; visual simulator. | nuScenes and OpenDV-2K; generation fidelity, temporal coherence, and trajectory control. |

**Other core and inclusive candidates:**

- [**Toward Physically Consistent Driving Video World Models under Challenging Trajectories**](https://arxiv.org/abs/2603.24506) (2026) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Project](https://wm-research.github.io/PhyGenesis/)]
- [**UniDrive-WM: Unified Understanding, Planning and Generation World Model For Autonomous Driving**](https://arxiv.org/abs/2601.04453) (2026) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Project](https://unidrive-wm.github.io/UniDrive-WM)]
- [**X-Mind: Efficient Visual Chain-of-Thought via Predictive World Model for End-to-End Driving**](https://arxiv.org/abs/2606.28758) (2026) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**X-World: Controllable Ego-Centric Multi-Camera World Models for Scalable End-to-End Driving**](https://arxiv.org/abs/2603.19979) (2026) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**Xiaomi EV World Model: A Joint World Model Integrating Reconstruction and Generation for Autonomous Driving**](https://arxiv.org/abs/2605.18137) (2026) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**CVD-STORM: Cross-View Video Diffusion with Spatial-Temporal Reconstruction Model for Autonomous Driving**](https://arxiv.org/abs/2510.07944) (2025) — `Inclusive candidate` · `Metadata classified` · `Diffusion and flow-matching rollout`
- [**EOT-WM Other Vehicle Trajectories Are Also Needed: A Driving World Model Unifies Ego-Other Vehicle Trajectories in Video Latant Space**](https://arxiv.org/abs/2503.09215) (2025) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**FSDrive FutureSightDrive: Thinking Visually with Spatio-Temporal CoT for Autonomous Driving**](https://arxiv.org/abs/2505.17685) (2025) — `Inclusive candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/MIV-XJTU/FSDrive)]
- [**GAIA-2: A Controllable Multi-View Generative World Model for Autonomous Driving**](https://arxiv.org/abs/2503.20523) (2025) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**Genesis: Multimodal Driving Scene Generation with Spatio-Temporal and Cross-Modal Consistency**](https://arxiv.org/abs/2506.07497) (2025) — `Inclusive candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Project](https://arxiv.org/abs/2506.07497)] [[Code](https://github.com/xiaomi-research/genesis)]
- [**MaskGWM: A Generalizable Driving World Model with Video Mask Reconstruction**](https://arxiv.org/abs/2502.11663) (2025) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/SenseTime-FVG/OpenDWM)]
- [**MiLA: Multi-view Intensive-fidelity Long-term Video Generation World Model for Autonomous Driving**](https://arxiv.org/abs/2503.15875) (2025) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Project](https://xiaomi-mlab.github.io/mila.github.io/)]
- [**ProphetDWM: ProphetDWM: A Driving World Model for Rolling Out Future Actions and Videos**](https://arxiv.org/abs/2505.18650) (2025) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**World model-based end-to-end scene generation for accident anticipation in autonomous driving**](https://www.nature.com/articles/s44172-025-00474-7) (2025) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**DrivingGPT: Unifying Driving World Modeling and Planning with Multi-modal Autoregressive Transformers**](https://arxiv.org/abs/2412.18607) (2024) — `Core candidate` · `Metadata classified` · `Autoregressive rollout` [[Project](https://rogerchern.github.io/DrivingGPT/)]
- [**MagicDrive-V2: High-Resolution Long Video Generation for Autonomous Driving with Adaptive Control**](https://arxiv.org/abs/2411.13807) (2024) — `Inclusive candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Project](https://gaoruiyuan.com/magicdrive-v2/)]
- [**Iso-Dream: Isolating and Leveraging Noncontrollable Visual Dynamics in World Models**](https://arxiv.org/pdf/2205.13817.pdf) (2022) — `Inclusive candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/panmt/iso-dream)] [[Code](https://github.com/panmt/Iso-Dream)]

### 3.1.2 Observation-level: future point cloud

**3 candidates. Representative papers:**

| Paper | Team / venue | Core contribution | Future state and action | Mechanism / role | Data and evidence |
| --- | --- | --- | --- | --- | --- |
| [**ViDAR: Visual Point Cloud Forecasting enables Scalable Autonomous Driving**](https://arxiv.org/pdf/2312.17655) [[Code](https://github.com/OpenDriveLab/ViDAR)] | OpenDriveLab + Shanghai AI Lab; CVPR 2024 | Uses future point-cloud forecasting from historical camera images as a scalable predictive pretraining task. | Future LiDAR point clouds rendered from predicted BEV features; no substantive ego-action input. | Iterative latent BEV prediction and rendering; predictive pretraining. | nuScenes; point forecasting plus detection, tracking, mapping, occupancy, motion, and planning transfer. |
| [**Copilot4D: Learning Unsupervised World Models for Autonomous Driving via Discrete Diffusion**](https://arxiv.org/abs/2311.01017) | Waabi + University of Toronto; ICLR 2024 | Tokenizes LiDAR observations with a VQ-VAE and predicts diverse future point clouds using discrete diffusion. | Future point-cloud observations; past LiDAR and estimated ego motion/action. | Discrete diffusion with temporal rollout; observation-level world modeling. | nuScenes, KITTI Odometry, and Argoverse 2; Chamfer distance at 1 s and 3 s and multi-future quality. |

**Other core and inclusive candidates:**

- [**LiSTAR: Ray-Centric World Models for 4D LiDAR Sequences in Autonomous Driving**](https://arxiv.org/abs/2511.16049) (2025) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Project](https://ocean-luna.github.io/LiSTAR.github.io/)]

### 3.2.1 Scene-level: entities and interactions

**8 candidates. Representative papers:**

| Paper | Team / venue | Core contribution | Future state and action | Mechanism / role | Data and evidence |
| --- | --- | --- | --- | --- | --- |
| [**TrafficBots: Towards World Models for Autonomous Driving Simulation and Motion Prediction**](https://arxiv.org/abs/2303.04116) [[Code](https://github.com/zhejz/TrafficBots)] | ETH Zürich + MPI Informatics + KU Leuven; ICRA 2023 | Formulates configurable multi-agent traffic simulation as a reactive entity-level world model. | Agent states and actions; player plan plus destinations and latent personalities for surrounding agents. | Shared recurrent/attention policy and dynamics update; neural traffic simulator. | Waymo Open Motion Dataset; motion prediction, joint rollout realism, diversity, and controllability. |
| [**GUMP Solving Motion Planning Tasks with a Scalable Generative Model**](https://arxiv.org/abs/2407.02797) [[Code](https://github.com/HorizonRobotics/GUMP/)] | Horizon Robotics; ECCV 2024 | Provides scalable full- and partial-autoregressive agent simulation for scenario generation, policy evaluation, and planning. | Tokenized scene and agent states/actions; scene prompts and candidate policies. | Autoregressive entity/action rollout; simulator / planner evaluator. | Waymo Open Motion and nuPlan; simulation realism, generation, planning, and closed-loop evidence. |

**Other core and inclusive candidates:**

- [**HEAT: Heterogeneous End-to-End Autonomous Driving via Trajectory-Guided World Models**](https://arxiv.org/abs/2605.19631) (2026) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**DriVerse: Navigation World Model for Driving Simulation via Multimodal Trajectory Prompting and Motion Alignment**](https://arxiv.org/pdf/2504.18576) (2025) — `Inclusive candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/shalfun/DriVerse)]
- [**DriveGPT: Scaling Autoregressive Behavior Models for Driving**](https://arxiv.org/abs/2412.14415) (2024) — `Inclusive candidate` · `Metadata classified` · `Autoregressive rollout` [[Project](https://www.youtube.com/watch?v=-hLi44PfY8g)]
- [**FipTR: A Simple yet Effective Transformer Framework for Future Instance Prediction in Autonomous Driving**](https://www.ecva.net/papers/eccv_2024/papers_ECCV/papers/11758.pdf) (2024) — `Inclusive candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/TabGuigui/FipTR)]
- [**MARL-CCE Modelling Competitive Behaviors in Autonomous Driving Under Generative World Model**](https://www.ecva.net/papers/eccv_2024/papers_ECCV/papers/05085.pdf) (2024) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/qiaoguanren/MARL-CCE)]
- [**Symphony: Learning Realistic and Diverse Agents for Autonomous Driving Simulation**](https://arxiv.org/abs/2205.03195) (2022) — `Inclusive candidate` · `Metadata classified` · `Generative rollout (unspecified)`

### 3.2.2 Scene-level: BEV, occupancy, and geometry

**19 candidates. Representative papers:**

| Paper | Team / venue | Core contribution | Future state and action | Mechanism / role | Data and evidence |
| --- | --- | --- | --- | --- | --- |
| [**OccWorld: Learning a 3D Occupancy World Model for Autonomous Driving**](https://arxiv.org/pdf/2311.16038.pdf) [[Code](https://github.com/wzzheng/OccWorld)] | Tsinghua University; ECCV 2024 | Introduces joint semantic occupancy and ego-motion forecasting as a self-supervised 3D world-model objective. | Future 3D semantic occupancy and ego pose; historical occupancy observations. | Discrete occupancy token autoregression; geometry rollout / pretraining. | nuScenes and Occ3D-style occupancy data; mIoU/IoU, planning, and scene-understanding transfer. |
| [**Drive-OccWorld: Driving in the Occupancy World: Vision-Centric 4D Occupancy Forecasting and Planning via World Models for Autonomous Driving**](https://arxiv.org/pdf/2408.14197) [[Project](https://drive-occworld.github.io/)] [[Code](https://github.com/yuyang-cloud/Drive-OccWorld)] | Zhejiang University + Huawei; AAAI 2025 | Adds flexible ego-action control and occupancy-based trajectory scoring to 4D occupancy forecasting. | Future occupancy and flow; velocity, steering, trajectory, and command conditions. | Memory-conditioned recurrent forecasting; planning-internal rollout. | nuScenes, nuScenes-Occupancy, and Lyft Level 5; mIoU/VPQ, controllability, and planning. |
| [**HERMES: A Unified Self-Driving World Model for Simultaneous 3D Scene Understanding and Generation**](https://arxiv.org/pdf/2501.14729) [[Code](https://github.com/LMD0311/HERMES)] [[Project](https://lmd0311.github.io/HERMES/)] | HUST + MEGVII + Mach Drive + HKU; ICCV 2025 | Unifies 3D scene understanding and action-conditioned future scene generation through shared geometric tokens and an LLM. | Future 3D scene tokens plus language understanding; images, geometric tokens, and action sequences. | Autoregressive token generation; unified understanding / generation. | nuScenes and OmniDrive-nuScenes; generation metrics and language/scene-understanding benchmarks. |

**Other core and inclusive candidates:**

- [**HERMES++: Toward a Unified Driving World Model for 3D Scene Understanding and Generation**](https://arxiv.org/abs/2604.28196) (2026) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/H-EmbodVis/HERMESV2)] [[Project](https://h-embodvis.github.io/HERMESV2/)]
- [**OWMDrive: Causality-Aware End-to-End Autonomous Driving via 4D Occupancy World Model**](https://arxiv.org/abs/2606.30421) (2026) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**Unified Driving Tokens: Representation- and Geometry-Guided Discrete Tokenizer for Driving World Models and Planning**](https://arxiv.org/abs/2606.01935) (2026) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**GaussianDWM: 3D Gaussian Driving World Model for Unified Scene Understanding and Multi-Modal Generation**](https://arxiv.org/abs/2512.23180) (2025) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/dtc111111/GaussianDWM)]
- [**GenieDrive: Towards Physics-Aware Driving World Model with 4D Occupancy Guided Video Generation**](https://arxiv.org/abs/2512.12751) (2025) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Project](https://huster-yzy.github.io/geniedrive_project_page/)]
- [**GeoDrive: 3D Geometry-Informed Driving World Model with Precise Action Control**](https://arxiv.org/abs/2505.22421) (2025) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/antonioo-c/GeoDrive)]
- [**LOPR: Self-supervised Multi-future Occupancy Forecasting for Autonomous Driving**](https://www.roboticsproceedings.org/rss21/p003.pdf) (2025) — `Inclusive candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**NRSeg: Noise-Resilient Learning for BEV Semantic Segmentation via Driving World Models**](https://arxiv.org/abs/2507.04002) (2025) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/lynn-yu/NRSeg)]
- [**PreWorld: Semi-Supervised Vision-Centric 3D Occupancy World Model for Autonomous Driving**](https://openreview.net/pdf?id=rCX9l4OTCT) (2025) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/getterupper/PreWorld)]
- [**SparseWorld-TC: Trajectory-Conditioned Sparse Occupancy World Model**](https://arxiv.org/abs/2511.22039) (2025) — `Inclusive candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**UniFuture: A 4D Driving World Model for Future Generation and Perception**](https://arxiv.org/abs/2503.13587) (2025) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/dk-liang/UniFuture)] [[Project](https://dk-liang.github.io/UniFuture/)]
- [**Vision-Centric 4D Occupancy Forecasting and Planning via Implicit Residual World Models**](https://arxiv.org/abs/2510.16729) (2025) — `Inclusive candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**DOME: Taming Diffusion Model into High-Fidelity Controllable Occupancy World Model**](https://arxiv.org/abs/2410.10429) (2024) — `Inclusive candidate` · `Metadata classified` · `Diffusion and flow-matching rollout` [[Project](https://gusongen.github.io/DOME)]
- [**OccLLaMA: An Occupancy-Language-Action Generative World Model for Autonomous Driving**](https://www.arxiv.org/abs/2409.03272) (2024) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**MagicDrive: Street View Generation with Diverse 3D Geometry Control**](https://arxiv.org/abs/2310.02601) (2023) — `Inclusive candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/cure-lab/MagicDrive)]
- [**Occupancy Prediction-Guided Neural Planner for Autonomous Driving**](https://arxiv.org/abs/2305.03303) (2023) — `Inclusive candidate` · `Metadata classified` · `Generative rollout (unspecified)`

### 3.3 Latent-space prediction

**70 candidates. Representative papers:**

| Paper | Team / venue | Core contribution | Future state and action | Mechanism / role | Data and evidence |
| --- | --- | --- | --- | --- | --- |
| [**MILE: Model-Based Imitation Learning for Urban Driving**](https://arxiv.org/pdf/2210.07729.pdf) [[Code](https://github.com/wayveai/mile)] | Wayve + University of Cambridge; NeurIPS 2022 | Jointly learns a compact stochastic driving dynamics model and policy from offline expert demonstrations. | Future latent state/action, decodable to BEV semantics; cameras, route, speed, and ego actions. | Action-conditioned RSSM-style latent dynamics; planning / imitation learning. | CARLA; driving score, route completion, infractions, latent imagination, and out-of-town/weather generalization. |
| [**Think2Drive: Efficient Reinforcement Learning by Thinking with Latent World Model for Autonomous Driving (in CARLA-v2)**](https://www.ecva.net/papers/eccv_2024/papers_ECCV/papers/06129.pdf) [[Project](https://thinklab-sjtu.github.io/CornerCaseRepo/)] | Shanghai Jiao Tong University; ECCV 2024 | Uses a compact latent simulator to train a neural planner efficiently for corner-case-heavy CARLA Leaderboard v2. | Latent environment transition and reward; compact observations and driving controls. | Dreamer-style latent dynamics and model-based RL; planner training. | CARLA Leaderboard v2 and CornerCaseRepo; route completion, infractions, scenario density, and training efficiency. |
| [**DriveWorld: 4D Pre-trained Scene Understanding via World Models for Autonomous Driving**](https://arxiv.org/pdf/2405.04390) | Peking University-led multi-institution team; CVPR 2024 | Pretrains a 4D driving representation with dynamic memory and static-scene propagation in a memory state-space model. | Future latent BEV/occupancy state and action reconstruction; historical multiview images and expert actions. | Memory state-space latent prediction; predictive pretraining. | OpenScene and nuScenes; detection, mapping, tracking, forecasting, occupancy, and planning transfer. |
| [**LAW: Enhancing End-to-End Autonomous Driving with Latent World Model**](https://openreview.net/pdf?id=fd2u60ryG0) [[Code](https://github.com/BraveGroup/LAW)] | CASIA + UCAS; ICLR 2025 | Adds an ego-trajectory-conditioned future-feature prediction objective to end-to-end driving planners. | Future scene latent feature; current feature and ego trajectory. | Latent feature transition; planning / predictive representation learning. | nuScenes, NAVSIM, and closed-loop CARLA; planning error, collision, and driving performance. |
| [**AD-L-JEPA: Self-Supervised Spatial World Models with Joint Embedding Predictive Architecture for Autonomous Driving with LiDAR Data**](https://arxiv.org/abs/2501.04969) [[Code](https://github.com/HaoranZhuExplorer/AD-L-JEPA-Release)] | New York University; arXiv v2 2025 | Introduces non-generative JEPA pretraining that predicts masked BEV embeddings from automotive LiDAR. | Masked BEV latent embeddings; LiDAR input, without ego-action-conditioned rollout. | JEPA latent prediction; predictive pretraining / methodological boundary. | KITTI3D, Waymo, and ONCE; 3D detection transfer, GPU time, and memory efficiency. |

**Other core and inclusive candidates:**

- [**Auto-JEPA: A Latent World Model of Continuous Intent for End-to-End Autonomous Driving**](https://arxiv.org/abs/2607.29031) (2026) — `Core candidate` · `Metadata classified` · `Latent dynamics / state-space / JEPA`
- [**CausalDrive: Real-time Causal World Models for Autonomous Driving**](https://arxiv.org/abs/2606.15341) (2026) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**CoWorld-VLA: Thinking in a Multi-Expert World Model for Autonomous Driving**](https://arxiv.org/abs/2605.10426) (2026) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**Diffusion Transformer World-Action Model for AV Scene Prediction**](https://arxiv.org/abs/2606.12987) (2026) — `Inclusive candidate` · `Metadata classified` · `Diffusion and flow-matching rollout`
- [**DreamerAD: Efficient Reinforcement Learning via Latent World Model for Autonomous Driving**](https://arxiv.org/abs/2603.24587) (2026) — `Core candidate` · `Metadata classified` · `Latent dynamics / state-space / JEPA`
- [**Driver-WM: A Driver-Centric Traffic-Conditioned Latent World Model for In-Cabin Dynamics Rollout**](https://arxiv.org/abs/2605.05092) (2026) — `Core candidate` · `Metadata classified` · `Latent dynamics / state-space / JEPA`
- [**DynVLA: Learning World Dynamics for Action Reasoning in Autonomous Driving**](https://arxiv.org/abs/2603.11041) (2026) — `Inclusive candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**Ego-Dynamics-Augmented World Model for Autonomous Driving with Zero-Shot Cross-Chassis Adaptation**](https://arxiv.org/abs/2607.13410) (2026) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**Geographic Diversity Beats Data Volume for Cross-Domain Generalization in Zero-Label JEPA Driving World Models**](https://arxiv.org/abs/2607.04500) (2026) — `Core candidate` · `Metadata classified` · `Latent dynamics / state-space / JEPA`
- [**GraphWorld: Long-Horizon Planning with World Models for End-to-End Autonomous Driving**](https://arxiv.org/abs/2606.16274) (2026) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**HyWorldVLA: A Vision-Language-Action Model with Hybrid World Modeling for Autonomous Driving**](https://arxiv.org/abs/2607.20988) (2026) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**Is Energy Guidance All You Need? Training-Free Norm Injection for Driving World Models**](https://arxiv.org/abs/2607.10781) (2026) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**Kinematics-Aware Latent World Models for Data-Efficient Autonomous Driving**](https://arxiv.org/abs/2603.07264) (2026) — `Core candidate` · `Metadata classified` · `Latent dynamics / state-space / JEPA`
- [**Long-term Traffic Simulation via Structured Autoregressive Modeling**](https://arxiv.org/abs/2606.31209) (2026) — `Inclusive candidate` · `Metadata classified` · `Autoregressive rollout`
- [**LWDrive: Layer-Wise World-Model-Guided Vision-Language Model Planning for Autonomous Driving**](https://arxiv.org/abs/2606.29879) (2026) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**M4World: A Multi-view Multimodal Driving World Model for Interactive Object Manipulation and Minute-long Streaming**](https://arxiv.org/abs/2607.14005) (2026) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**MAD: Motion Appearance Decoupling for efficient Driving World Models**](https://arxiv.org/abs/2601.09452) (2026) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Project](https://vita-epfl.github.io/MAD-World-Model/)]
- [**NVIDIA OmniDreams: Real-Time Generative World Model for Closed-Loop Autonomous Vehicle Simulation**](https://arxiv.org/abs/2606.03159) (2026) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**OmniDrive: An LLM-Choreographed Multi-Agent World Model with Unified Latent Co-Compression for Multi-View Driving Video Generation**](https://arxiv.org/abs/2606.17536) (2026) — `Core candidate` · `Metadata classified` · `Latent dynamics / state-space / JEPA`
- [**PLAN-S: Bridging Planning with Latent Style Dynamics for Autonomous Driving World Models**](https://arxiv.org/abs/2606.06014) (2026) — `Core candidate` · `Metadata classified` · `Latent dynamics / state-space / JEPA`
- [**ResWorld: Temporal Residual World Model for End-to-End Autonomous Driving**](https://arxiv.org/abs/2602.10884) (2026) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/mengtan00/ResWorld.git)]
- [**WorldDrive Bridging Scene Generation and Planning: Driving with World Model via Unifying Vision and Motion Representation**](https://arxiv.org/abs/2603.14948) (2026) — `Inclusive candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/TabGuigui/WorldDrive)]
- [**AD-R1: Closed-Loop Reinforcement Learning for End-to-End Autonomous Driving with Impartial World Models**](https://arxiv.org/abs/2511.20325) (2025) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**AdaWM: Adaptive World Model based Planning for Autonomous Driving**](https://openreview.net/pdf?id=NEu8wgPctU) (2025) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**CoIRL-AD: Collaborative-Competitive Imitation-Reinforcement Learning in Latent World Models for Autonomous Driving**](https://arxiv.org/abs/2510.12560) (2025) — `Core candidate` · `Metadata classified` · `Latent dynamics / state-space / JEPA`
- [**Dream to Drive: Model-Based Vehicle Control Using Analytic World Models**](https://arxiv.org/abs/2502.10012) (2025) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**Dream4Drive Rethinking Driving World Model as Synthetic Data Generator for Perception Tasks**](https://arxiv.org/abs/2510.19195) (2025) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Project](https://wm-research.github.io/Dream4Drive/)]
- [**DriveVLA-W0: World Models Amplify Data Scaling Law in Autonomous Driving**](https://arxiv.org/abs/2510.12796) (2025) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**Epona: Autoregressive Diffusion World Model for Autonomous Driving**](https://arxiv.org/abs/2506.24113) (2025) — `Core candidate` · `Metadata classified` · `Hybrid generative rollout` [[Code](https://github.com/Kevin-thu/Epona/)]
- [**From Forecasting to Planning: Policy World Model for Collaborative State-Action Prediction**](https://arxiv.org/abs/2510.19654) (2025) — `Inclusive candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/6550Zhao/Policy-World-Model)]
- [**InDRiVE: Intrinsic Disagreement-based Reinforcement for Vehicle Exploration through Curiosity-Driven Generalized World Model**](https://arxiv.org/abs/2503.05573) (2025) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**InDRiVE: Reward-Free World-Model Pretraining for Autonomous Driving via Latent Disagreement**](https://arxiv.org/abs/2512.18850) (2025) — `Core candidate` · `Metadata classified` · `Latent dynamics / state-space / JEPA`
- [**Latent Chain-of-Thought World Modeling for End-to-End Autonomous Driving**](https://arxiv.org/abs/2512.10226) (2025) — `Core candidate` · `Metadata classified` · `Latent dynamics / state-space / JEPA`
- [**LongDWM: Cross-Granularity Distillation for Building a Long-Term Driving World Model**](https://arxiv.org/abs/2506.01546) (2025) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://wang-xiaodong1899.github.io/longdwm/)]
- [**MindDrive: An All-in-One Framework Bridging World Models and Vision-Language Model for End-to-End Autonomous Driving**](https://arxiv.org/abs/2512.04441) (2025) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**Orbis: Overcoming Challenges of Long-Horizon Prediction in Driving World Models**](https://arxiv.org/abs/2507.13162) (2025) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Project](https://lmb-freiburg.github.io/orbis.github.io/)]
- [**Raw2Drive: Reinforcement Learning with Aligned World Models for End-to-End Autonomous Driving (in CARLA v2)**](https://arxiv.org/pdf/2505.16394) (2025) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**ReSim: Reliable World Simulation for Autonomous Driving**](https://arxiv.org/abs/2506.09981) (2025) — `Inclusive candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Project](https://opendrivelab.com/ReSim)]
- [**SceneDiffuser++: City-Scale Traffic Simulation via a Generative World Model**](https://openaccess.thecvf.com/content/CVPR2025/html/Tan_SceneDiffuser_City-Scale_Traffic_Simulation_via_a_Generative_World_Model_CVPR_2025_paper.html) (2025) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**Think Before You Drive: World Model-Inspired Multimodal Grounding for Autonomous Vehicles**](https://arxiv.org/abs/2512.03454) (2025) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**UMGen Generating Multimodal Driving Scenes via Next-Scene Prediction**](https://arxiv.org/abs/2503.14945) (2025) — `Inclusive candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Project](https://yanhaowu.github.io/UMGen/)] [[Code](https://github.com/YanhaoWu/UMGen/)]
- [**Vehicle Dynamics Embedded World Models for Autonomous Driving**](https://arxiv.org/abs/2512.02417) (2025) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**WAM-Flow: Parallel Coarse-to-Fine Motion Planning via Discrete Flow Matching for Autonomous Driving**](https://arxiv.org/abs/2512.06112) (2025) — `Inclusive candidate` · `Metadata classified` · `Diffusion and flow-matching rollout` [[Code](https://github.com/fudan-generative-vision/WAM-Flow)]
- [**World4Drive: End-to-End Autonomous Driving via Intention-aware Physical Latent World Model**](https://arxiv.org/abs/2507.00603) (2025) — `Core candidate` · `Metadata classified` · `Latent dynamics / state-space / JEPA` [[Code](https://github.com/ucaszyp/World4Drive)]
- [**WorldRFT: Latent World Model Planning with Reinforcement Fine-Tuning for Autonomous Driving**](https://arxiv.org/abs/2512.19133) (2025) — `Core candidate` · `Metadata classified` · `Latent dynamics / state-space / JEPA`
- [**3D-VLA: A 3D Vision-Language-Action Generative World Model**](https://arxiv.org/pdf/2403.09631.pdf) (2024) — `Inclusive candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**AdaptiveDriver Planning with Adaptive World Models for Autonomous Driving**](https://arxiv.org/pdf/2406.10714) (2024) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://arunbalajeev.github.io/world_models_planning/world_model_paper.html)]
- [**BEVWorld: A Multimodal World Model for Autonomous Driving via Unified BEV Latent Space**](https://arxiv.org/abs/2407.05679) (2024) — `Core candidate` · `Metadata classified` · `Latent dynamics / state-space / JEPA` [[Code](https://github.com/zympsyche/BevWorld)]
- [**CarDreamer: Open-Source Learning Platform for World Model based Autonomous Driving**](https://arxiv.org/abs/2405.09111) (2024) — `Core candidate` · `Metadata classified` · `Latent dynamics / state-space / JEPA` [[Code](https://github.com/ucd-dare/CarDreamer)]
- [**Doe-1: Closed-Loop Autonomous Driving with Large World Model**](https://arxiv.org/abs/2412.09627) (2024) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/wzzheng/Doe)]
- [**DriveDreamer-2: LLM-Enhanced World Models for Diverse Driving Video Generation**](https://arxiv.org/pdf/2403.06845) (2024) — `Core candidate` · `Metadata classified` · `Latent dynamics / state-space / JEPA` [[Project](https://drivedreamer2.github.io/)] [[Code](https://github.com/f1yfisher/DriveDreamer2)]
- [**DriveDreamer4D: World Models Are Effective Data Machines for 4D Driving Scene Representation**](https://arxiv.org/pdf/2410.13571) (2024) — `Core candidate` · `Metadata classified` · `Latent dynamics / state-space / JEPA` [[Project](https://drivedreamer4d.github.io/)] [[Code](https://github.com/GigaAI-research/DriveDreamer4D)]
- [**DrivePhysica Physical Informed Driving World Model**](https://arxiv.org/abs/2412.08410) (2024) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://metadrivescape.github.io/papers_project/DrivePhysica/page.html)]
- [**GEM: A Generalizable Ego-Vision Multimodal World Model for Fine-Grained Ego-Motion, Object Dynamics, and Scene Composition Control**](https://arxiv.org/pdf/2412.11198) (2024) — `Inclusive candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/vita-epfl/GEM)] [[Project](https://vita-epfl.github.io/GEM.github.io/)]
- [**GenAD: Generalized Predictive Model for Autonomous Driving**](https://arxiv.org/pdf/2403.09630.pdf) (2024) — `Inclusive candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/OpenDriveLab/DriveAGI)] [[Dataset](https://github.com/OpenDriveLab/DriveAGI?tab=readme-ov-file#genad-dataset-opendv-youtube)]
- [**Imagine-2-Drive: High-Fidelity World Modeling in CARLA for Autonomous Vehicles**](https://arxiv.org/abs/2411.10171) (2024) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Project](https://anantagrg.github.io/Imagine-2-Drive.github.io/)]
- [**InfinityDrive: Breaking Time Limits in Driving World Models**](https://arxiv.org/abs/2412.01522v1) (2024) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Project](https://metadrivescape.github.io/papers_project/InfinityDrive/page.html)]
- [**LatentDriver Learning Multiple Probabilistic Decisions from Latent World Model in Autonomous Driving**](https://arxiv.org/abs/2409.15730) (2024) — `Core candidate` · `Metadata classified` · `Latent dynamics / state-space / JEPA` [[Code](https://github.com/Sephirex-X/LatentDriver)]
- [**Mitigating Covariate Shift in Imitation Learning for Autonomous Vehicles Using Latent Space Generative World Models**](https://arxiv.org/abs/2409.16663) (2024) — `Core candidate` · `Metadata classified` · `Latent dynamics / state-space / JEPA`
- [**RAMBLE From Imitation to Exploration: End-to-end Autonomous Driving based on World Model**](https://arxiv.org/abs/2410.02253) (2024) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/SCP-CN-001/ramble)]
- [**ReconDreamer: Crafting World Models for Driving Scene Reconstruction via Online Restoration**](https://arxiv.org/abs/2411.19548) (2024) — `Core candidate` · `Metadata classified` · `Latent dynamics / state-space / JEPA` [[Project](https://recondreamer.github.io/)] [[Code](https://github.com/GigaAI-research/ReconDreamer)]
- [**SceneDiffuser: Efficient and Controllable Driving Simulation Initialization and Rollout**](https://arxiv.org/abs/2412.12129) (2024) — `Inclusive candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**ADriver-I: A General World Model for Autonomous Driving**](https://arxiv.org/pdf/2311.13549.pdf) (2023) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)`
- [**CTT Categorical Traffic Transformer: Interpretable and Diverse Behavior Prediction with Tokenized Latent**](https://arxiv.org/abs/2311.18307) (2023) — `Inclusive candidate` · `Metadata classified` · `Latent dynamics / state-space / JEPA`
- [**UniWorld: Autonomous Driving Pre-training via World Models**](https://arxiv.org/abs/2308.07234) (2023) — `Core candidate` · `Metadata classified` · `Generative rollout (unspecified)` [[Code](https://github.com/chaytonmin/UniWorld)]

For source provenance, role tags, and generated cross-domain appendices, see the [full catalog](FULL_REFERENCE_CATALOG.md#driving-world-models-core-and-inclusive-candidates).
<!-- CORE_TAXONOMY_END -->

## Rollout mechanisms

This is the Chapter 4 cross-index: representation remains the primary home of each paper, while the mechanism records how its future is rolled out. It therefore links back to representative papers without duplicating their full descriptions.

| Mechanism | Representative papers | What the index captures | Recurring long-horizon issue |
| --- | --- | --- | --- |
| Latent dynamics / state space / JEPA | [MILE](https://arxiv.org/abs/2210.07729), [Think2Drive](https://arxiv.org/abs/2402.16720), [DriveWorld](https://arxiv.org/abs/2405.04390), [LAW](https://arxiv.org/abs/2406.08481), [AD-L-JEPA](https://arxiv.org/abs/2501.04969), [ResWorld](https://arxiv.org/abs/2602.10884) | recurrent state-space transitions, feature prediction, predictive embedding objectives | latent collapse, compounding model bias, weak observability of failure |
| Autoregressive | [GAIA-1](https://arxiv.org/abs/2309.17080), [DrivingWorld](https://arxiv.org/abs/2412.19505), [GUMP](https://arxiv.org/abs/2407.02797), [OccWorld](https://arxiv.org/abs/2311.16038), [HERMES](https://arxiv.org/abs/2501.14729), [RAYNOVA](https://arxiv.org/abs/2602.20685) | next-token or next-state causal factorization over visual, entity, geometry, or latent tokens | exposure bias, identity switching, sequential inference cost |
| Diffusion | [DriveDreamer](https://arxiv.org/abs/2309.09777), [Drive-WM](https://arxiv.org/abs/2311.17918), [Vista](https://arxiv.org/abs/2405.17398), [Copilot4D](https://arxiv.org/abs/2311.01017), [DOME](https://arxiv.org/abs/2410.10429) | multimodal denoising in video, point-cloud, occupancy, or latent space | sampling cost, temporal/geometric drift, weakening action response |
| Flow matching | [WAM-Flow](https://arxiv.org/abs/2512.06112), [WorldRFT](https://arxiv.org/abs/2512.19133) | continuous or discrete transport for efficient multimodal generation/planning | limited closed-loop evidence and solver/schedule sensitivity |
| Hybrid / multi-stage | [GAIA-1](https://arxiv.org/abs/2309.17080), [Vista](https://arxiv.org/abs/2405.17398), [HERMES](https://arxiv.org/abs/2501.14729), [UniFuture](https://arxiv.org/abs/2503.13587) | combinations of token prediction, diffusion decoding, geometry, semantics, or planners | interface mismatch and difficult end-to-end attribution |

Fixed-horizon prediction and recursive rollout are recorded separately in the [full catalog](FULL_REFERENCE_CATALOG.md): a strong one-step metric does not establish a credible rollout horizon. The shared audit targets are accumulated error, distribution shift, geometric drift, identity instability, action-response decay, and the absence of a standardized trustworthy-horizon protocol.

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

The [full catalog evaluation index](FULL_REFERENCE_CATALOG.md#chapter-6---evaluation-protocols-and-metrics) retains all extracted evaluation papers. Appearance-only metrics should not be treated as evidence of action sensitivity, physical correctness, or closed-loop safety.

## Datasets

Datasets are resources, not world models. They are grouped by the evidence they support rather than mixed into the Core Taxonomy.

| Data family | Representative datasets | Most relevant use |
| --- | --- | --- |
| Multimodal driving sensors | [nuScenes](https://www.nuscenes.org/nuscenes), [Waymo Open Dataset](https://waymo.com/open/), [Argoverse 2](https://www.argoverse.org/av2.html), [KITTI](https://www.cvlibs.net/datasets/kitti/), [KITTI-360](https://www.cvlibs.net/datasets/kitti-360/) | video, LiDAR, BEV, geometry, transfer |
| Planning and interaction | [nuPlan](https://www.nuscenes.org/nuplan), [Waymo Open Motion Dataset](https://waymo.com/open/data/motion/), [Argoverse 2 Motion Forecasting](https://www.argoverse.org/av2.html), [Lyft Level 5](https://woven.toyota/en/prediction-dataset/) | entity interaction, policy learning, closed-loop replay |
| Large-scale driving video | [OpenDV-YouTube](https://github.com/OpenDriveLab/DriveAGI#genad-dataset-opendv-youtube), [DrivingDojo](https://drivingdojo.github.io/) | visual world-model pretraining and long-tail generation |
| Occupancy and 4D geometry | [Occ3D](https://github.com/Tsinghua-MARS-Lab/Occ3D), [OpenScene](https://github.com/OpenDriveLab/OpenScene), [Cam4DOcc](https://github.com/haomo-ai/Cam4DOcc) | 3D/4D occupancy, semantic flow, geometry rollout |
| Synthetic and safety-critical data | [CARLA](https://carla.org/), [MetaDrive](https://metadriverse.github.io/metadrive/), [TeraSim-World](https://arxiv.org/abs/2509.13164) | controllable intervention, corner cases, sim-to-real studies |

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

Open engineering evidence still includes calibrated credible horizons, physical-constraint monitors, distribution-shift alarms, deterministic fallback behavior, hardware latency/memory/energy measurements, sim-to-real validation, traceable data/model versions, and post-update safety cases. The [full deployment and assurance index](FULL_REFERENCE_CATALOG.md#chapter-7---deployment-trustworthiness-and-safety) retains all 38 extracted references, including cross-domain methodological work.

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

Please read [CONTRIBUTING.md](CONTRIBUTING.md) before opening a PR. In particular, provide an official paper link, explain why the resource meets the inclusion criteria, and place it in one primary category.

This collection was initially cross-checked against [LMD0311/Awesome-World-Model](https://github.com/LMD0311/Awesome-World-Model). We thank its maintainers and all authors who make papers, code, data, and evaluation tools publicly available. Entries here are independently selected and reorganized around the taxonomy of our review.

If you use this list, please cite the original papers. Citation information for our companion review will be added after publication.

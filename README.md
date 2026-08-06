# Awesome Autonomous Driving World Models

[![Awesome](https://awesome.re/badge.svg)](https://awesome.re)
[![Link Check](https://github.com/thu-vinlab/Awesome-Autonomous-Driving-World-Model/actions/workflows/link-check.yml/badge.svg)](https://github.com/thu-vinlab/Awesome-Autonomous-Driving-World-Model/actions/workflows/link-check.yml)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

A curated collection of **world models for autonomous driving**, organized by how a model represents the future, rolls it out, and contributes to a driving system.

Unlike chronological paper dumps, this list uses a review-oriented taxonomy. It emphasizes representative, reproducible, and evaluation-relevant resources. The list is maintained as a companion resource for our ongoing review, *Autonomous Driving World Models: Representations, Rollout Mechanisms, System Roles, and Deployment*.

> **Last updated:** August 2026. This is a living list, not a claim of completeness. Suggestions and corrections are welcome through [pull requests or issues](CONTRIBUTING.md).

## Contents

- [Scope and taxonomy](#scope-and-taxonomy)
- [Recommended starting points](#recommended-starting-points)
- [Surveys and perspectives](#surveys-and-perspectives)
- [World models by future-state representation](#world-models-by-future-state-representation)
  - [Observation-level: image and video](#observation-level-image-and-video)
  - [Observation-level: point cloud and range view](#observation-level-point-cloud-and-range-view)
  - [Scene-level: objects and agents](#scene-level-objects-and-agents)
  - [Scene-level: BEV, occupancy, and geometry](#scene-level-bev-occupancy-and-geometry)
  - [Latent and unified representations](#latent-and-unified-representations)
- [Rollout mechanisms](#rollout-mechanisms)
- [System roles](#system-roles)
- [Evaluation, safety, and deployment](#evaluation-safety-and-deployment)
- [Datasets, benchmarks, and platforms](#datasets-benchmarks-and-platforms)
- [Workshops and challenges](#workshops-and-challenges)
- [Related collections](#related-collections)
- [Contributing and acknowledgements](#contributing-and-acknowledgements)

## Scope and taxonomy

We include a resource when it studies a learned model of driving-scene dynamics and satisfies at least one of these criteria:

1. predicts a future driving state from past or current observations;
2. conditions that prediction on ego actions, routes, text, or other interventions;
3. supports counterfactual simulation, planning, policy learning, or predictive pretraining;
4. evaluates temporal, geometric, physical, interactive, or safety properties of such a model.

Pure single-frame generation, perception-only methods without a temporal predictive objective, and generic video generators without driving-specific evidence are normally out of scope. Borderline papers should explain their world-model contribution in the PR.

Each work has one primary home even when it spans several categories. We use the following compact vocabulary:

| Dimension | Categories | Central question |
| --- | --- | --- |
| Future-state representation | observation, scene, latent, unified | What state is predicted? |
| Rollout mechanism | autoregressive, diffusion, flow, hybrid | How is the future generated? |
| System role | data engine, simulator, planner, pretraining | What does the model do for driving? |
| Readiness | fidelity, interaction, safety, runtime | Can its behavior be evaluated and trusted? |

Resource labels: **P** = paper, **C** = code, **D** = data/model, **W** = website or project page.

## Recommended starting points

These papers provide a compact route through the landscape:

- **MILE** (NeurIPS 2022) - latent model-based imitation learning for urban driving. [[P](https://proceedings.neurips.cc/paper_files/paper/2022/hash/827cb489449ea216e4a257c47e407d18-Abstract-Conference.html)] [[C](https://github.com/wayveai/mile)]
- **GAIA-1** (2023) - large-scale generative video world modeling for driving. [[P](https://arxiv.org/abs/2309.17080)] [[W](https://wayve.ai/thinking/introducing-gaia1/)]
- **DriveDreamer** (ECCV 2024) - real-world-driven and action-conditioned scene generation. [[P](https://arxiv.org/abs/2309.09777)] [[C](https://github.com/JeffWang987/DriveDreamer)]
- **Drive-WM** (CVPR 2024) - multi-view visual forecasting connected to planning. [[P](https://arxiv.org/abs/2311.17918)] [[C](https://github.com/BraveGroup/Drive-WM)]
- **OccWorld** (ECCV 2024) - 3D occupancy forecasting and planning. [[P](https://arxiv.org/abs/2311.16038)] [[C](https://github.com/wzzheng/OccWorld)]
- **Copilot4D** (ICLR 2024) - unsupervised discrete-diffusion world modeling for LiDAR. [[P](https://arxiv.org/abs/2311.01017)]
- **Vista** (NeurIPS 2024) - generalizable, controllable, high-fidelity visual world model. [[P](https://arxiv.org/abs/2405.17398)] [[C](https://github.com/OpenDriveLab/Vista)]
- **HERMES** (ICCV 2025) - unified 3D scene understanding and generation. [[P](https://arxiv.org/abs/2501.14729)] [[C](https://github.com/LMD0311/HERMES)] [[W](https://lmd0311.github.io/HERMES/)]
- **UniFuture** (ICRA 2026) - a unified 4D model for future generation and perception. [[P](https://arxiv.org/abs/2503.13587)] [[C](https://github.com/dk-liang/UniFuture)] [[W](https://dk-liang.github.io/UniFuture/)]
- **WorldLens** (CVPR 2026 Oral) - broad evaluation of driving world models in real-world settings. [[P](https://arxiv.org/abs/2512.10958)] [[W](https://worldbench.github.io/worldlens)]

## Surveys and perspectives

### Autonomous driving

- The Role of World Models in Shaping Autonomous Driving: A Comprehensive Survey (FCS 2026). [[P](https://arxiv.org/abs/2502.10498)]
- A Survey of World Models for Autonomous Driving (2025). [[P](https://arxiv.org/abs/2501.11260)]
- Exploring the Interplay Between Video Generation and World Models in Autonomous Driving (2024). [[P](https://arxiv.org/abs/2411.02914)]
- World Models for Autonomous Driving: An Initial Survey (2024). [[P](https://arxiv.org/abs/2403.02622)]
- Progressive Robustness-Aware World Models in Autonomous Driving: A Review and Outlook (2025). [[P](https://doi.org/10.36227/techrxiv.176523308.84756413/v1)] [[C](https://github.com/MoyangSensei/AwesomeRobustDWM)]

### General world models and physical AI

- Understanding World or Predicting Future? A Comprehensive Survey of World Models (2024). [[P](https://arxiv.org/abs/2411.14499)]
- Is Sora a World Simulator? A Comprehensive Survey on General World Models and Beyond (2024). [[P](https://arxiv.org/abs/2405.03520)] [[C](https://github.com/GigaAI-research/General-World-Models-Survey)]
- 3D and 4D World Modeling: A Survey (2025). [[P](https://arxiv.org/abs/2509.07996)] [[C](https://github.com/worldbench/survey)]
- World Models: The Safety Perspective (ISSREW 2024). [[P](https://arxiv.org/abs/2411.07690)]

## World models by future-state representation

### Observation-level: image and video

Models in this group predict pixels or multi-view video. They expose appearance and motion directly, but long-horizon consistency and 3D coherence remain central challenges.

- **GAIA-1** (2023) - generative video world model conditioned on video, text, and actions. [[P](https://arxiv.org/abs/2309.17080)]
- **DriveDreamer** (ECCV 2024) - structured-condition-guided driving video generation. [[P](https://arxiv.org/abs/2309.09777)] [[C](https://github.com/JeffWang987/DriveDreamer)]
- **Drive-WM** (CVPR 2024) - multi-view visual forecasting with action-conditioned planning. [[P](https://arxiv.org/abs/2311.17918)] [[C](https://github.com/BraveGroup/Drive-WM)]
- **WoVoGen** (ECCV 2024) - world-volume-aware multi-camera generation. [[P](https://arxiv.org/abs/2312.02934)] [[C](https://github.com/fudan-zvg/WoVoGen)]
- **Panacea** (CVPR 2024) - panoramic controllable driving-scene video generation. [[P](https://arxiv.org/abs/2311.16813)] [[W](https://panacea-ad.github.io/)]
- **MagicDrive** (ICLR 2024) - street-view generation with 3D geometry controls. [[P](https://arxiv.org/abs/2310.02601)] [[C](https://github.com/cure-lab/MagicDrive)]
- **Vista** (NeurIPS 2024) - controllable visual rollouts with transfer across data and actions. [[P](https://arxiv.org/abs/2405.17398)] [[C](https://github.com/OpenDriveLab/Vista)]
- **DrivingWorld** (2024) - video-GPT driving world model with next-token prediction. [[P](https://arxiv.org/abs/2412.19505)] [[C](https://github.com/YvanYin/DrivingWorld)]
- **UniMLVG / OpenDWM** (2024) - controllable multi-view long-video generation. [[P](https://arxiv.org/abs/2412.04842)] [[C](https://github.com/SenseTime-FVG/OpenDWM)] [[W](https://sensetime-fvg.github.io/UniMLVG/)]
- **GAIA-2** (2025) - controllable multi-view generative driving world model. [[P](https://arxiv.org/abs/2503.20523)]
- **Cosmos-Drive-Dreams** (2025) - scalable synthetic data generation with world foundation models. [[P](https://arxiv.org/abs/2506.09042)] [[W](https://research.nvidia.com/labs/toronto-ai/cosmos_drive_dreams/)]
- **ReSim** (2025) - reliable world simulation emphasizing controllability and realism. [[P](https://arxiv.org/abs/2506.09981)] [[W](https://opendrivelab.com/ReSim)]

### Observation-level: point cloud and range view

- **ViDAR** (CVPR 2024) - visual point-cloud forecasting as a predictive pretraining objective. [[P](https://arxiv.org/abs/2312.17655)] [[C](https://github.com/OpenDriveLab/ViDAR)]
- **Copilot4D** (ICLR 2024) - discrete diffusion for unsupervised future LiDAR prediction. [[P](https://arxiv.org/abs/2311.01017)]
- **LidarDM** (2024) - generative LiDAR simulation in generated 3D worlds. [[P](https://arxiv.org/abs/2404.02903)] [[C](https://github.com/vzyrianov/lidardm)]
- **AD-L-JEPA** (2025) - joint-embedding predictive pretraining for LiDAR. [[P](https://arxiv.org/abs/2501.04969)] [[C](https://github.com/HaoranZhuExplorer/AD-L-JEPA-Release)]
- **LiDARCrafter** (2025) - dynamic 4D world modeling from LiDAR sequences. [[P](https://arxiv.org/abs/2508.03692)] [[W](https://lidarcrafter.github.io/)]
- **U4D** (CVPR 2026) - uncertainty-aware 4D modeling from LiDAR sequences. [[P](https://arxiv.org/abs/2512.02982)]

### Scene-level: objects and agents

Object- and agent-centric states provide interpretable interaction structure and efficient long rollouts, while depending on detection, tracking, and map abstractions.

- **MILE** (NeurIPS 2022) - model-based imitation learning in a compact driving state. [[P](https://proceedings.neurips.cc/paper_files/paper/2022/hash/827cb489449ea216e4a257c47e407d18-Abstract-Conference.html)] [[C](https://github.com/wayveai/mile)]
- **TrafficBots** (ICRA 2023) - multi-agent simulation and motion prediction with destination-conditioned policies. [[P](https://arxiv.org/abs/2303.04116)] [[C](https://github.com/zhejz/TrafficBots)]
- **GUMP** (ECCV 2024) - scalable generative modeling for motion-planning tasks. [[P](https://arxiv.org/abs/2407.02797)] [[C](https://github.com/HorizonRobotics/GUMP)]
- **CarFormer** (ECCV 2024) - object-centric representations for self-driving. [[P](https://arxiv.org/abs/2407.15843)] [[W](https://kuis-ai.github.io/CarFormer/)]
- **TOKEN** (2024) - object-level tokenization for long-tail driving events. [[P](https://arxiv.org/abs/2407.00959)]

### Scene-level: BEV, occupancy, and geometry

- **MUVO** (2023) - multimodal generative model with geometric representations. [[P](https://arxiv.org/abs/2311.11762)]
- **OccWorld** (ECCV 2024) - semantic occupancy forecasting with downstream planning. [[P](https://arxiv.org/abs/2311.16038)] [[C](https://github.com/wzzheng/OccWorld)]
- **Drive-OccWorld** (2024) - vision-centric 4D occupancy forecasting and planning. [[P](https://arxiv.org/abs/2408.14197)]
- **BEVWorld** (2024) - multimodal modeling in a unified BEV latent space. [[P](https://arxiv.org/abs/2407.05679)] [[C](https://github.com/zympsyche/BevWorld)]
- **OccSora** (2024) - 4D occupancy generation as a driving world simulator. [[P](https://arxiv.org/abs/2405.20337)] [[C](https://github.com/wzzheng/OccSora)]
- **DOME** (2024) - controllable diffusion-based occupancy world model. [[P](https://arxiv.org/abs/2410.10429)] [[W](https://gusongen.github.io/DOME)]
- **HERMES** (ICCV 2025) - unified 3D understanding and generation. [[P](https://arxiv.org/abs/2501.14729)] [[C](https://github.com/LMD0311/HERMES)]
- **UniFuture** (ICRA 2026) - 4D future generation and perception in a unified model. [[P](https://arxiv.org/abs/2503.13587)] [[C](https://github.com/dk-liang/UniFuture)]
- **GaussianDWM** (CVPR 2026) - 3D Gaussian representation for understanding and multimodal generation. [[P](https://arxiv.org/abs/2512.23180)] [[C](https://github.com/dtc111111/GaussianDWM)]

### Latent and unified representations

These methods learn predictive features without requiring every rollout to be decoded to sensor space, or align multiple state spaces in one model.

- **UniWorld** (2023) - 3D scene pretraining through world-model objectives. [[P](https://arxiv.org/abs/2308.07234)] [[C](https://github.com/chaytonmin/UniWorld)]
- **DriveWorld** (CVPR 2024) - 4D pretraining for scene understanding. [[P](https://arxiv.org/abs/2405.04390)]
- **LAW** (2024) - latent world modeling for end-to-end driving. [[P](https://arxiv.org/abs/2406.08481)] [[C](https://github.com/BraveGroup/LAW)]
- **LatentDriver** (2024) - probabilistic decisions from a latent world model. [[P](https://arxiv.org/abs/2409.15730)] [[C](https://github.com/Sephirex-X/LatentDriver)]
- **Think2Drive** (ECCV 2024) - sample-efficient driving through latent imagination. [[P](https://arxiv.org/abs/2402.16720)]
- **HERMES++** (2026) - extended unified understanding and generation framework. [[P](https://arxiv.org/abs/2604.28196)] [[C](https://github.com/H-EmbodVis/HERMESV2)] [[W](https://h-embodvis.github.io/HERMESV2/)]
- **DriveLaW** (CVPR 2026) - unified planning and video generation in a latent driving world. [[P](https://arxiv.org/abs/2512.23421)]
- **UniDrive-WM** (ECCV 2026) - unified understanding, planning, and generation. [[P](https://arxiv.org/abs/2601.04453)] [[W](https://unidrive-wm.github.io/UniDrive-WM)]

## Rollout mechanisms

This cross-cutting index groups representative models by their main temporal generator. See the representation sections for descriptions and resources.

| Mechanism | Representative methods | Typical strengths | Common failure modes |
| --- | --- | --- | --- |
| Autoregressive | GAIA-1, DrivingWorld, RAYNOVA | causal factorization, flexible conditioning | exposure bias, error accumulation, slow sequential rollout |
| Diffusion | DriveDreamer, Drive-WM, Copilot4D, DOME | multimodality and high visual fidelity | sampling cost, action sensitivity, temporal drift |
| Flow matching | WAM-Flow, recent latent planners | fewer sampling steps and continuous transport | limited closed-loop evidence, solver sensitivity |
| Hybrid or multi-stage | Vista, HERMES, UniFuture, DriveLaW | combines geometry, semantics, and appearance | complex training and evaluation, interface mismatch |

Additional mechanism-focused papers:

- **RAYNOVA** (CVPR 2026) - scale-temporal autoregressive modeling in ray space. [[P](https://arxiv.org/abs/2602.20685)] [[W](https://raynova-ai.github.io/)]
- **WAM-Flow** (CVPR 2026) - coarse-to-fine motion planning through discrete flow matching. [[P](https://arxiv.org/abs/2512.06112)] [[C](https://github.com/fudan-generative-vision/WAM-Flow)]
- **ResWorld** (ICLR 2026) - temporal residual latent world modeling for end-to-end driving. [[P](https://arxiv.org/abs/2602.10884)] [[C](https://github.com/mengtan00/ResWorld)]
- **WorldRFT** (AAAI 2026) - latent planning with reinforcement fine-tuning. [[P](https://arxiv.org/abs/2512.19133)]

## System roles

### Data engine and scenario generation

- **SubjectDrive** - subject-controlled scaling of generative driving data. [[P](https://arxiv.org/abs/2403.19438)] [[W](https://subjectdrive.github.io/)]
- **Cosmos-Drive-Dreams** - world-foundation-model-based synthetic data generation. [[P](https://arxiv.org/abs/2506.09042)] [[W](https://research.nvidia.com/labs/toronto-ai/cosmos_drive_dreams/)]
- **DrivingDojo** - interactive, knowledge-enriched driving data for world modeling. [[P](https://arxiv.org/abs/2410.10738)] [[W](https://drivingdojo.github.io/)]

### Open-loop and closed-loop simulation

- **CarDreamer** - open-source platform for world-model-based driving. [[P](https://arxiv.org/abs/2405.09111)] [[C](https://github.com/ucd-dare/CarDreamer)]
- **Vista** - controllable visual environment rollouts. [[P](https://arxiv.org/abs/2405.17398)] [[C](https://github.com/OpenDriveLab/Vista)]
- **ReSim** - reliable and controllable real-world driving simulation. [[P](https://arxiv.org/abs/2506.09981)] [[W](https://opendrivelab.com/ReSim)]

### Planning and policy learning

- **MILE** - model-based imitation learning. [[P](https://proceedings.neurips.cc/paper_files/paper/2022/hash/827cb489449ea216e4a257c47e407d18-Abstract-Conference.html)] [[C](https://github.com/wayveai/mile)]
- **Think2Drive** - reinforcement learning through latent imagination. [[P](https://arxiv.org/abs/2402.16720)]
- **LAW** - end-to-end driving with a latent predictive objective. [[P](https://arxiv.org/abs/2406.08481)] [[C](https://github.com/BraveGroup/LAW)]
- **WoTE** - online trajectory evaluation through a BEV world model. [[P](https://arxiv.org/abs/2504.01941)] [[C](https://github.com/liyingyanUCAS/WoTE)]
- **Raw2Drive** - reinforcement learning with aligned world models in CARLA. [[P](https://arxiv.org/abs/2505.16394)]

### Predictive representation pretraining

- **UniWorld** - autonomous-driving pretraining through world models. [[P](https://arxiv.org/abs/2308.07234)] [[C](https://github.com/chaytonmin/UniWorld)]
- **ViDAR** - visual point-cloud forecasting for scalable pretraining. [[P](https://arxiv.org/abs/2312.17655)] [[C](https://github.com/OpenDriveLab/ViDAR)]
- **DriveWorld** - 4D pretraining for scene understanding. [[P](https://arxiv.org/abs/2405.04390)]
- **AD-L-JEPA** - self-supervised spatial predictive learning for LiDAR. [[P](https://arxiv.org/abs/2501.04969)] [[C](https://github.com/HaoranZhuExplorer/AD-L-JEPA-Release)]

## Evaluation, safety, and deployment

### Evaluation and auditing

- **WorldSimBench** (2024) - evaluation of video generators as world simulators. [[P](https://arxiv.org/abs/2410.18072)] [[W](https://iranqin.github.io/WorldSimBench.github.io/)]
- **ACT-Bench / Terra** (2024) - action controllability for driving world models. [[P](https://arxiv.org/abs/2412.05337)] [[C](https://github.com/turingmotors/ACT-Bench)] [[W](https://turingmotors.github.io/actbench/)]
- **WorldModelBench** (2025) - perceptual, functional, and physical evaluation of video world models. [[P](https://arxiv.org/abs/2502.20694)] [[W](https://worldmodelbench-team.github.io/)]
- **SimWorld** (2025) - benchmark for simulator-conditioned scene generation. [[P](https://arxiv.org/abs/2503.13952)] [[C](https://github.com/Li-Zn-H/SimWorld)]
- **WorldLens** (CVPR 2026 Oral) - full-spectrum real-world evaluation. [[P](https://arxiv.org/abs/2512.10958)] [[W](https://worldbench.github.io/worldlens)]
- **ReactSim-Bench** (2026) - reactive-behavior evaluation for driving simulation. [[P](https://arxiv.org/abs/2606.14058)]
- **VISA** (2026) - instance-semantic auditing for 3D occupancy world models. [[P](https://arxiv.org/abs/2606.13460)]

### Safety, robustness, and uncertainty

- **SafeDreamer** (ICLR 2024) - safe reinforcement learning with world models. [[P](https://openreview.net/forum?id=tsE5HLYtYg)] [[C](https://github.com/PKU-Alignment/SafeDreamer)]
- **VL-SAFE** (2025) - vision-language-guided, safety-aware world-model reinforcement learning. [[P](https://arxiv.org/abs/2505.16377)] [[W](https://ys-qu.github.io/vlsafe-website/)]
- **U4D** (CVPR 2026) - uncertainty-aware 4D LiDAR world modeling. [[P](https://arxiv.org/abs/2512.02982)]
- **BadDreamer** (2026) - transferable backdoor attacks against video world models. [[P](https://arxiv.org/abs/2606.21172)]

Open deployment questions include calibrated uncertainty, credible rollout horizons, distribution-shift detection, physical constraint violations, latency and memory on vehicle hardware, sim-to-real transfer, fallback behavior, traceability, and post-update revalidation.

## Datasets, benchmarks, and platforms

### Driving datasets frequently used for world modeling

- **nuScenes** - multimodal urban driving data. [[W](https://www.nuscenes.org/)] [[D](https://www.nuscenes.org/nuscenes)]
- **Waymo Open Dataset** - perception and motion data with multiple cameras and LiDARs. [[W](https://waymo.com/open/)]
- **Argoverse 2** - sensor, map, motion-forecasting, and scenario data. [[W](https://www.argoverse.org/av2.html)]
- **KITTI / KITTI-360** - camera and LiDAR sequences for geometry and scene understanding. [[W](https://www.cvlibs.net/datasets/kitti/)] [[W](https://www.cvlibs.net/datasets/kitti-360/)]
- **nuPlan** - large-scale planning dataset and closed-loop benchmark. [[W](https://www.nuscenes.org/nuplan)] [[C](https://github.com/motional/nuplan-devkit)]
- **OpenDV-YouTube** - large-scale driving video data introduced with GenAD. [[D](https://github.com/OpenDriveLab/DriveAGI#genad-dataset-opendv-youtube)]
- **DrivingDojo** - interaction-focused video dataset for driving world models. [[W](https://drivingdojo.github.io/)]
- **Cam4DOcc** - camera-only 4D occupancy forecasting benchmark. [[P](https://arxiv.org/abs/2311.17663)] [[C](https://github.com/haomo-ai/Cam4DOcc)]

### Simulators and research platforms

- **CARLA** - open-source autonomous-driving simulator. [[C](https://github.com/carla-simulator/carla)] [[W](https://carla.org/)]
- **MetaDrive** - lightweight compositional driving simulator. [[C](https://github.com/metadriverse/metadrive)] [[W](https://metadriverse.github.io/metadrive/)]
- **CARLA-Garage** - strong autonomous-driving baselines and evaluation tools. [[C](https://github.com/autonomousvision/carla_garage)]
- **CarDreamer** - world-model-oriented learning platform built on CARLA. [[C](https://github.com/ucd-dare/CarDreamer)]

## Workshops and challenges

- **CVPR 2025 Autonomous Grand Challenge - World Model Track**. [[W](https://opendrivelab.com/challenge25/#1x-wm)]
- **WorldModelBench: The 1st Workshop on Benchmarking World Models, CVPR 2025**. [[W](https://worldmodelbench.github.io/)]
- **CVPR 2024 Autonomous Grand Challenge - Predictive World Model Track**. [[W](https://opendrivelab.com/challenge24/#predictive_world_model)]
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

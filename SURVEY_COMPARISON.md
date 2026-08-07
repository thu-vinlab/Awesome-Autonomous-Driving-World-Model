# Driving World Model Survey Comparison

This document records how each survey organizes the literature in its own words and how that organization differs from the taxonomy used by this repository. It is designed for literature-review writing, not as a citation-count ranking.

> **Audit date:** 7 August 2026. The set is a high-coverage audit of public English-language surveys found through the three source repositories, the supplied local survey library, plus arXiv, Crossref, OpenAlex, Semantic Scholar, and GitHub searches. It is not a claim of permanent completeness.

## How to read this comparison

Our review first applies two admission criteria: a learned transition must be **ego-action-conditioned** and its output state must support **iterated rollout**. Admitted methods are then organized along four independent axes:

1. **Future-state representation:** observation-level image/video or point cloud; scene-level entity or geometry; latent space.
2. **Rollout mechanism:** recurrent/state-space/JEPA dynamics; autoregression; diffusion or flow matching; hybrid mechanisms.
3. **System role:** data engine; open- or closed-loop simulator; planning-internal rollout; predictive representation pretraining.
4. **Evidence and readiness:** metrics, credible rollout horizon, closed-loop behavior, runtime, robustness, sim-to-real transfer, interpretability, and safety assurance.

Coverage marks in the overview are analytical annotations, not claims made by the survey authors: **●** = a major organizing axis or dedicated treatment, **◐** = discussed but not a primary axis, **○** = little or no systematic treatment. “Core” means a survey centered on driving world models; “thematic” means a focused extension; “boundary” means adjacent literature that does not consistently satisfy our two admission criteria.

Every dossier below separates the authors' **original classification** from the paper's **core contributions**. The former preserves how the source organizes prior work; the latter records what the survey itself adds. Cross-domain surveys and methodological sources are not counted as driving-world-model surveys.

## At-a-glance comparison

| Year | Survey and verified status | Lead team / institutions | Authors' principal taxonomy | Scope | State | Mechanism | Roles | Evaluation / deployment |
| ---: | --- | --- | --- | :---: | :---: | :---: | :---: | :---: |
| 2026 | [From Future Generation to Decision Making](https://doi.org/10.2139/ssrn.6827179), SSRN working paper | Tongji-led multi-institution team | MPC functions: future generation / planning / hybrid; then representation and generator comparisons | Core | ● | ● | ● | ● |
| 2026 | [Latent World Models for Automated Driving](https://arxiv.org/abs/2603.09086), arXiv; under review at IEEE T-ITS | RWTH Aachen + TU Delft | latent target / latent form / structural prior; four use families; five internal mechanics | Core | ● | ● | ● | ● |
| 2025 | [The Role of World Models in Shaping Autonomous Driving](https://arxiv.org/abs/2502.10498), arXiv v2 | HUST + Baidu | predicted modality: video / point cloud / occupancy / latent feature / traffic map | Core | ● | ◐ | ● | ● |
| 2025 | [World Models for Connected Automated Driving](https://doi.org/10.3390/app15168986), *Applied Sciences* | Shanghai University of Engineering Science | six CAV application domains | Thematic | ◐ | ◐ | ● | ◐ |
| 2025 | [A Survey of World Models for Autonomous Driving](https://arxiv.org/abs/2501.11260), arXiv v4; manuscript submitted to ACM | Zhejiang University CCAI | future physical world / behavior planning / prediction-planning interaction | Core | ● | ◐ | ● | ● |
| 2024 | [Video Generation and World Models in Autonomous Driving](https://arxiv.org/abs/2411.02914), arXiv | Southeast University-led academic-industry team | video: traditional / diffusion; world model: perception-prediction / RL, with generator subtypes | Core / boundary | ● | ● | ◐ | ◐ |
| 2024/25 | [World Models for Autonomous Driving: An Initial Survey](https://doi.org/10.1109/TIV.2024.3398357), IEEE T-IV | University of Macau-led multi-university team | architecture foundations / broad applications; driving generation / planning-control | Core | ◐ | ◐ | ● | ◐ |
| 2026 | [Multi-Agent Embodied Autonomous Driving](https://arxiv.org/abs/2606.13840), arXiv | City University of Hong Kong + Lingnan University | information exchange → shared world models across communication, perception, cognition, planning, E2E, and simulation | Thematic | ● | ◐ | ● | ● |
| 2025 | [Progressive Robustness-Aware World Models](https://doi.org/10.36227/techrxiv.176523308.84756413/v1), TechRxiv preprint | 13-author team; affiliations not exposed in accessible public metadata | task: generation / planning / enhancement; robustness 1.0 / 2.0 / 3.0 | Thematic | ◐ | ◐ | ● | ● |
| 2025 | [Future Physical World Generation](https://doi.org/10.1145/3769748.3773345), ACM MMAsia | Hefei University of Technology + Chery | output: image / BEV / occupancy grid / point cloud; generator families inside each | Boundary | ● | ● | ◐ | ◐ |
| 2026 | [Foundation Models for Scenario Generation and Analysis](https://doi.org/10.1109/OJITS.2026.3660686), IEEE OJ-ITS | TUM-led academia-industry consortium | model family: LLM / VLM / MLLM / diffusion / world model × generation / analysis | Boundary | ◐ | ● | ● | ● |
| 2024 | [Multimodal Large Language Models for Autonomous Driving](https://doi.org/10.1109/WACVW60836.2024.00106), WACV Workshops | Purdue + Tencent T Lab-led consortium | MLLM tools by driving / transportation / maps; datasets, benchmarks, and workshop evidence | Boundary | ○ | ○ | ◐ | ◐ |
| 2024 | [Data-Centric Evolution in Autonomous Driving](https://arxiv.org/abs/2401.12888), arXiv | UNSW-led academia-industry team | dataset generations / big-data systems / data mining / closed-loop pipelines | Boundary | ○ | ○ | ● | ● |

## Cross-domain overview

| Year | Source and verified status | Team / institutions | Authors' detailed principal taxonomy | Scope label |
| ---: | --- | --- | --- | :---: |
| 2026 | [A Comprehensive Survey on World Models for Embodied AI](https://arxiv.org/abs/2510.16732), arXiv v3 | Nankai-led China-Singapore team | functionality × temporal modeling × spatial representation | Cross-domain |
| 2025/26 | [Learning Embodied Intelligence from Physical Simulators and World Models](https://arxiv.org/abs/2507.00917), arXiv v3 | Nanjing University-led multi-institution team | IR-L0–L4 × robot tasks × simulator capabilities × three WM roles | Cross-domain |
| 2025/26 | [3D and 4D World Modeling](https://arxiv.org/abs/2509.07996), arXiv v4 | WorldBench Team | modality × paradigm × condition × function × objective/application | Cross-domain |
| 2026 | [Video Generation Models as World Models](https://arxiv.org/abs/2603.28489), arXiv v3 | University of Hong Kong + HKGAI | efficient modeling × architecture × inference | Boundary / methodological |
| 2024 | [Understanding World or Predicting Future?](https://arxiv.org/abs/2411.14499), arXiv v4 | Tsinghua BNRist | understanding the world / predicting the future, then application domains | Cross-domain |
| 2024/25 | [Is Sora a World Simulator?](https://arxiv.org/abs/2405.03520), arXiv v2 | GigaAI-led academia-industry team | video generation / autonomous driving / autonomous agents | Cross-domain / boundary |
| 2024 | [World Models: The Safety Perspective](https://arxiv.org/abs/2411.07690), ISSREW 2024 author manuscript | Huawei + TUM + TU Berlin + Grenoble/SUSTech | RNN / Transformer / diffusion / other; pathology; safety agenda | Cross-domain |
| 2026 | [Reinforcement Learning: From Algorithms to Foundation Models](https://arxiv.org/abs/2607.17560), Princeton PhD dissertation | Princeton University | multi-agent games / RL with generative and foundation models | Methodological source |

## Comprehensive driving-world-model surveys

### World Models for Autonomous Driving: From Future Generation to Decision Making

- **Bibliographic status:** Han Huang, Dingkang Yang, Lulu Guo, Jing Cheng, Yang Liu, Victor C. M. L. Leung, and Hong Chen; 2026 SSRN working paper, DOI [10.2139/ssrn.6827179](https://doi.org/10.2139/ssrn.6827179). It is a repository working paper, not a peer-reviewed journal article in the metadata available at the audit date.
- **Team and affiliations:** Tongji University (Huang, Guo, Liu, Chen); Fudan University (Yang and Liu in the deposited affiliation metadata); East China Normal University (Cheng); Shenzhen University (Leung). These affiliations follow deposited metadata because the SSRN full text was not reliably retrievable during the audit.
- **Scope:** driving models that predict traffic evolution, evaluate candidate ego actions, and support closed-loop behavior. It also reviews datasets, simulators, metrics, benchmark protocols, and the open-loop/closed-loop evidence gap.
- **Original classification:** an MPC-centered primary split into **future world generation**, **planning with world models**, and **hybrid prediction-planning world models**. It then cross-compares visual, BEV, occupancy, LiDAR, and latent representations and diffusion, autoregressive, latent-dynamics, and hybrid mechanisms.
- **Core contributions:** connects prediction and decision through an MPC interpretation; compares state representations and generator families within that functional view; and foregrounds the gap between visually plausible futures and planning-effective, closed-loop rollouts.
- **Evaluation and deployment:** explicitly discusses rollout reliability, uncertainty, efficiency, scalability, generation-to-planning transfer, and whether generated futures improve planning rather than realism alone.
- **Difference from our review:** this is the closest functional comparison, but its top-level organizing principle is the MPC role. Our framework first enforces action conditionality and iterative rollout, separates state representation from rollout mechanism, distinguishes four system insertion roles, and adds runtime trust and safety certification as a dedicated layer.
- **Evidence used:** Crossref abstract and bibliographic record; OpenAlex deposited affiliations. Full-text section-level details remain to be audited if an accessible author copy appears.

### Latent World Models for Automated Driving: A Unified Taxonomy, Evaluation Framework, and Open Challenges

- **Bibliographic status:** Rongxiang Zeng and Yongqi Dong; [arXiv:2603.09086](https://arxiv.org/abs/2603.09086), submitted 10 March 2026. The author manuscript says it is under review at *IEEE Transactions on Intelligent Transportation Systems*; it should therefore be cited as a preprint, not an accepted T-ITS paper.
- **Team and affiliations:** RWTH Aachen University (Zeng) and Delft University of Technology (Dong).
- **Scope:** latent representations used for neural simulation, planning and reinforcement learning, synthetic-data generation and editing, and cognitive reasoning/VLA interfaces.
- **Original classification:** three nested design axes: **target** (latent worlds, latent actions, latent generators), **form** (continuous states, discrete tokens, hybrids), and **structural priors** (geometry, topology, semantics). Representative work is grouped into **spatiotemporal world modeling and neural simulation**, **latent-centric planning and RL**, **generative data synthesis and scene editing**, and **cognitive reasoning and latent chain-of-thought**. Five cross-cutting mechanics are then analyzed: structural isomorphism, long-horizon temporal stability, semantic/reasoning alignment, value-aligned objectives and post-training, and adaptive computation/deliberation.
- **Core contributions:** proposes a unified latent-world-model design space and an evaluation framework that links latent structure to closed-loop safety, deliberation cost, and long-horizon stability; it also consolidates latent simulation, planning, synthesis, and VLA reasoning in one account.
- **Evaluation and deployment:** unusually strong treatment of open-loop fidelity versus closed-loop stability, benchmark environments, a proposed Closed-loop Safety Gap and resource-aware deliberation cost, long-horizon hallucination, real-time efficiency, sim-to-real generalization, interpretability, causal reasoning, and rare-event safety.
- **Difference from our review:** it deliberately makes latent space the universal computational substrate and includes VLA/cognitive latent interfaces. Our representation taxonomy places latent prediction alongside observable sensor and scene states, applies stricter action/rollout admission tests, and separates entity-level from geometry-level scene states. Our scope is therefore broader in representation but narrower in what qualifies as a world model.
- **Evidence used:** arXiv record and full author PDF.

### The Role of World Models in Shaping Autonomous Driving: A Comprehensive Survey

- **Bibliographic status:** Sifan Tu, Xin Zhou, Dingkang Liang, Xingyu Jiang, Yumeng Zhang, Xiaofan Li, and Xiang Bai; [arXiv:2502.10498](https://arxiv.org/abs/2502.10498), v2 dated 1 February 2026. No journal DOI or acceptance statement was verified, so this entry is treated as a preprint.
- **Team and affiliations:** Huazhong University of Science and Technology (Tu, Zhou, Liang, Jiang, Bai) and Baidu (Zhang, Li).
- **Scope:** a broad driving-world-model ecosystem: simulators, datasets, metrics, predicted modalities, applications, quantitative performance, limitations, and future directions. Companion collection: [LMD0311/Awesome-World-Model](https://github.com/LMD0311/Awesome-World-Model).
- **Original classification:** predicted-scene modality is the main taxonomy: **visual/video space**, **point cloud**, **occupancy**, **latent space**, and **traffic map**, with multimodal/unified models discussed across categories. Applications are separately grouped as **simulation**, **data generation**, **enhancing driving**, and **pre-training**.
- **Core contributions:** supplies a broad modality-centered map of driving world models, aligns each modality with datasets and task metrics, summarizes quantitative results, and connects generation models to four major system uses and open deployment problems.
- **Evaluation and deployment:** tabulates image/video, occupancy, point-cloud, open-loop planning, and closed-loop planning metrics; compares representative generation and driving results; discusses long-horizon consistency, physical constraints, inference efficiency, dataset imbalance, and unified architectures.
- **Difference from our review:** its modality axis is close to our future-state representation axis, but traffic maps combine entity/road-structure abstractions that we separate analytically. It does not use our action-conditioned and iterable admission gate, nor does it systematically distinguish generator mechanism from output representation. Our four system roles are also stricter: “enhancing driving” is decomposed into planning-internal rollout versus representation pretraining.
- **Evidence used:** arXiv record and full author PDF.

### Research on World Models for Connected Automated Driving: Advances, Challenges, and Outlook

- **Bibliographic status:** Nuo Chen and Xiang Liu; *Applied Sciences* 15(16):8986, published 14 August 2025, DOI [10.3390/app15168986](https://doi.org/10.3390/app15168986).
- **Team and affiliations:** School of Electronic and Electrical Engineering, Shanghai University of Engineering Science.
- **Scope:** learned world models in connected autonomous vehicles, emphasizing multi-source and cooperative information rather than only ego-vehicle modeling.
- **Original classification:** six application domains: **cooperative perception**, **prediction**, **decision-making**, **control**, **human-machine collaboration**, and **scene generation**. The discussion within these domains covers methodologies and technology advances rather than imposing one representation taxonomy.
- **Core contributions:** extends the world-model discussion from ego-only driving to connected automation, organizes cooperative use cases across the CAV stack, and synthesizes challenges in heterogeneous fusion, physical knowledge, long-term memory, efficiency, and interpretability.
- **Evaluation and deployment:** discusses heterogeneous data fusion, physical-law mapping, long-term memory, cross-scenario generalization, robustness, efficiency, and interpretability. It is more application-oriented than benchmark-protocol-oriented.
- **Difference from our review:** its top-level categories are CAV pipeline functions and can contain perception or control work that is not an action-conditioned iterable world model. We would admit only the predictive-transition component, then reclassify it by state representation, rollout mechanism, and system role. Its cooperative emphasis complements, but does not replace, our representation-centered taxonomy.
- **Evidence used:** Crossref publication record, publisher metadata, and abstract.

### A Survey of World Models for Autonomous Driving

- **Bibliographic status:** Tuo Feng, Wenguan Wang, and Yi Yang; [arXiv:2501.11260](https://arxiv.org/abs/2501.11260), v4 dated 10 September 2025. The manuscript says “Manuscript submitted to ACM” and contains a placeholder DOI, so it is treated as a preprint rather than a published ACM article.
- **Team and affiliations:** Collaborative Innovation Center of Artificial Intelligence, Zhejiang University. Companion resources: [FengZicai/AwesomeWMAD](https://github.com/FengZicai/AwesomeWMAD) and [WMAD-Benchmarks](https://github.com/FengZicai/WMAD-Benchmarks).
- **Scope:** core tasks, future-state generation, planning, interaction between prediction and planning, training paradigms, applications, and task-specific performance.
- **Original classification:** a three-tier task taxonomy: **generation of the future physical world**, **behavior planning for intelligent agents**, and **interaction between prediction and planning**. Future physical generation is subdivided by output into **image**, **BEV**, **occupancy grid**, and **point cloud**; image generation is further discussed by Dreamer, diffusion, and Transformer families. Training is organized as self-supervised learning, large-scale pretraining, and synthetic data generation; applications are scene understanding, motion prediction, simulation, and end-to-end driving.
- **Core contributions:** formalizes driving world models around generation, planning, and their coupling; provides benchmark and performance tables across multiple physical representations; and releases a companion literature collection and benchmark index.
- **Evaluation and deployment:** compares 4D scene generation, point-cloud forecasting, scene understanding, motion prediction, and planning with task-specific metrics and datasets. It discusses closed-loop scores, self-supervision, multimodal fusion, advanced simulation, training cost, and safety-critical evaluation, but not a certification framework.
- **Difference from our review:** it mixes a state-output category, a downstream task, and a prediction-planning coupling pattern at the same taxonomy level. Our framework makes these orthogonal dimensions, adds entity-level scene prediction and pure latent prediction explicitly, treats architecture/mechanism separately, and excludes generation without substantive ego-action response or iterative rollout.
- **Evidence used:** arXiv record and full author PDF.

### Exploring the Interplay Between Video Generation and World Models in Autonomous Driving: A Survey

- **Bibliographic status:** Ao Fu, Yi Zhou, Tao Zhou, Yi Yang, Bojun Gao, Qun Li, Guobin Wu, and Ling Shao; [arXiv:2411.02914](https://arxiv.org/abs/2411.02914), submitted 5 November 2024. No peer-reviewed publication was verified.
- **Team and affiliations:** Southeast University and its Ministry of Education key laboratory (Fu, Zhou); PCA Lab at Nanjing University of Science and Technology (Tao Zhou); DiDi Chuxing (Yang, Gao, Li, Wu); UCAS-Terminus AI Lab, University of Chinese Academy of Sciences (Shao).
- **Scope:** the architectural and methodological overlap between video generation and driving world models, with JEPA, Genie, Sora, diffusion video generation, driving-scene generation, datasets, and metrics included.
- **Original classification:** video generation is split into **traditional video generation** and **diffusion-based video generation**. World models are split into **perception-prediction structures** and **reinforcement-learning-based structures**, while the driving-focused discussion further separates diffusion-based and autoregressive perception-prediction models. The paper intentionally concentrates on perception-prediction because of its overlap with video generation.
- **Core contributions:** explains the shared architectural lineage of video generators and world models, consolidates driving-specific diffusion and autoregressive developments, and surveys datasets, metrics, compute constraints, sim-to-real issues, and safety implications at that boundary.
- **Evaluation and deployment:** covers video/image fidelity, point-cloud/occupancy metrics, downstream metrics, datasets, compute and memory constraints, long-video consistency, sim-to-real, interpretability, ethics, privacy, and safety at a discussion level.
- **Difference from our review:** it adopts an inclusive and architecture-driven notion of world models and intentionally crosses into non-action-conditioned video generation. Under our admission test, Sora-like generation remains a methodological source or boundary work unless ego actions materially alter an iterable next state. Our taxonomy also adds point cloud, entity, geometry, and latent states as peers rather than viewing them mainly through video-generation interplay.
- **Evidence used:** arXiv record and full author PDF.

### World Models for Autonomous Driving: An Initial Survey

- **Bibliographic status:** Yanchen Guan, Haicheng Liao, Zhenning Li, Jia Hu, Runze Yuan, Yunjian Li, Guohui Zhang, and Chengzhong Xu; *IEEE Transactions on Intelligent Vehicles*, Early Access online 8 May 2024, pages 1-17, DOI [10.1109/TIV.2024.3398357](https://doi.org/10.1109/TIV.2024.3398357). Crossref assigns a 2025 print year without a volume or issue, so the overview reports 2024/25 rather than silently choosing one date.
- **Team and affiliations:** University of Macau (Guan, Liao, Li, Xu); Tongji University (Hu); Tsinghua University (Yuan); Macau University of Science and Technology (Yunjian Li); University of Hawaiʻi at Mānoa (Zhang).
- **Scope:** world-model history and architecture, general applications, driving scene generation, planning and control, performance evidence, challenges, ethics, and future directions.
- **Original classification:** it first describes the canonical architecture as **perception**, **memory**, **controller**, and **world-model** modules, then surveys broad applications such as model-based RL, JEPA-style prediction, and virtual-world generation. Its driving section is functionally split into **driving scenario generation** and **planning and control**, with methods compared by core architecture, task, and dataset rather than by a single formal taxonomy.
- **Core contributions:** provides an early consolidated history of world-model architectures and their transfer into driving, connects scenario generation with planning/control, and identifies memory, generalization, computation, sim-to-real, ethics, and explainability as shared bottlenecks.
- **Evaluation and deployment:** reports heterogeneous task metrics and datasets, discusses long-term memory, generalization, compute, sim-to-real transfer, explainability, privacy, and ethics. As an initial survey, it does not give a unified evaluation protocol or runtime assurance procedure.
- **Difference from our review:** it is foundational and intentionally broad, whereas our review formalizes the admission boundary and uses a loss/target-based representation hierarchy. Its scenario-generation section includes some work that our action-condition and rollout tests would place outside the core, and its architecture description does not separate future-state type from rollout generator or deployment role.
- **Evidence used:** IEEE/Crossref record and full author PDF.

## Thematic driving-world-model surveys

### Multi-Agent Embodied Autonomous Driving: From V2X Information Exchange to Shared World Models

- **Bibliographic status:** Senkang Hu, Zhengru Fang, Yihang Tao, Zihan Fang, Sam Tak Wu Kwong, and Yuguang Fang; [arXiv:2606.13840](https://arxiv.org/abs/2606.13840), submitted 11 June 2026.
- **Team and affiliations:** Hong Kong JC STEM Lab of Smart City and Department of Computer Science, City University of Hong Kong (Hu, Zhengru Fang, Tao, Zihan Fang, Yuguang Fang); Lingnan University (Kwong). Companion collection: [dl-m9/Multi-Agent-Embodied-Autonomous-Driving](https://github.com/dl-m9/Multi-Agent-Embodied-Autonomous-Driving).
- **Scope:** more than 380 publications on V2X communication, collaborative perception, inter-agent cognition, cooperative decision-making and planning, end-to-end cooperative driving, and simulation/data engines.
- **Original classification:** the organizing transition is **Information Exchange → Shared World Models**: exchanged observations become aligned shared state, intent-aware interaction, and coordinated action. Inside it, collaborative perception uses early/raw, intermediate/feature, late/decision, and adaptive fusion; communication progresses from explicit messages and implicit behavior to semantic, language-based, and plan-level exchange; planning covers game theory, MARL, optimization/negotiation, and generative/foundation-model approaches; system evidence covers E2E cooperation and simulation/benchmarks.
- **Core contributions:** reframes V2X research as progression toward a shared predictive world state, audits more than 380 publications across the cooperative-driving stack, and introduces evidence-aware discussion of communication failure, agreement, verification, and closed-loop safety.
- **Evaluation and deployment:** explicitly codes observable artifacts and evidence strength, distinguishes offline/simulation evidence from real-world guarantees, and analyzes communication latency, packet loss, scalability, shared-state verification, plan agreement, safety envelopes, and closed-loop validation.
- **Difference from our review:** shared world models are a multi-agent coordination construct broader than a single learned transition function. Some V2X perception and communication methods do not meet our admission criteria. We retain the survey as a thematic extension and would classify qualifying predictive shared states as entity-, geometry-, or latent-level world models, then identify simulator or planner roles separately.
- **Evidence used:** arXiv record and full author PDF.

### Progressive Robustness-Aware World Models in Autonomous Driving: A Review and Outlook

- **Bibliographic status:** Feiyang Jia, Caiyan Jia, Ziying Song, Zhicheng Bao, Lin Liu, Shaoqing Xu, Yan Gong, Lei Yang, Xinyu Zhang, Bin Sun, Xiaoshuai Hao, Long Chen, and Yadan Luo; TechRxiv preprint posted 8 December 2025, DOI [10.36227/techrxiv.176523308.84756413/v1](https://doi.org/10.36227/techrxiv.176523308.84756413/v1).
- **Team and affiliations:** the accessible Crossref/OpenAlex record and official companion repository expose the author list but not paper-level affiliations. To avoid unreliable author-name matching, institutions are recorded as **not publicly verified in the accessible metadata** pending an accessible full manuscript.
- **Scope:** driving-world-model task families, architectures, downstream applications, evaluation criteria, adaptation, open-world behavior, and progressive robustness. Companion collection: [MoyangSensei/AwesomeRobustDWM](https://github.com/MoyangSensei/AwesomeRobustDWM).
- **Original classification:** a task axis of **generation**, **planning**, and **enhancement**, crossed with **Robustness 1.0**, **2.0**, and **3.0**. The companion repository defines the progression as **self-metrics and evaluation protocols → contributions to autonomous-driving systems → open-world robustness and future directions**; the paper abstract also analyzes model design, task formulation, evaluation criteria, and adaptation.
- **Core contributions:** makes robustness a staged maturity axis rather than a final discussion topic, links intrinsic model quality to downstream driving contribution and open-world adaptation, and curates a robustness-focused companion collection.
- **Evaluation and deployment:** robustness is the central axis rather than an appendix. It connects intrinsic quality, downstream contribution, and open-world adaptation, making this survey particularly useful for our evaluation and deployment chapters.
- **Difference from our review:** its progressive robustness levels provide a maturity lens, while our primary taxonomy starts from the predicted state and rollout mechanism. “Enhancement” is broader than our pretraining role and can include work without an explicit action-conditioned transition. We can reuse the three-stage robustness lens as a comparison dimension without replacing our admission rule or representation hierarchy.
- **Evidence used:** Crossref/OpenAlex abstract and bibliographic records plus the official companion repository. Full-text taxonomy details beyond those public sources are not asserted.

## Closely related boundary surveys

### A Survey on Future Physical World Generation for Autonomous Driving

- **Bibliographic status:** Jianling Chu, Zerun Liu, Huanran Huo, Jinyuan Qin, Yantao Pan, and Lechao Cheng; 7th ACM International Conference on Multimedia in Asia (MMAsia), published 8 December 2025, DOI [10.1145/3769748.3773345](https://doi.org/10.1145/3769748.3773345).
- **Team and affiliations:** Hefei University of Technology (Chu, Liu, Huo, Qin, Cheng) and Chery (Pan), following the publisher-deposited Crossref affiliations.
- **Scope:** generation of future physical states for driving, including inputs/outputs, control conditions, training strategies, architectures, datasets, and open challenges.
- **Original classification:** four output categories: **image-based**, **BEV-based**, **occupancy-grid-based**, and **point-cloud-based generation**. It additionally compares diffusion models, Transformers, and adversarial generators within these state-output tracks.
- **Core contributions:** consolidates future physical-scene generation across four sensor/scene outputs, compares their conditioning and generator choices, and surfaces physical plausibility, spatiotemporal consistency, multimodal fusion, long-tail synthesis, and real-time inference as common problems.
- **Evaluation and deployment:** compares public datasets and generation quality; highlights spatiotemporal consistency, physical plausibility, self-supervision, multimodal fusion, long-tail generation, and real-time inference. Planning and certification are not the primary organizing concern.
- **Difference from our review:** its output taxonomy maps closely to our observation- and geometry-level states, but it has no entity/scene-graph or pure latent category. More importantly, future generation alone is not sufficient for our definition: methods without substantive ego-action response and recursive rollout remain boundary generators.
- **Evidence used:** ACM/Crossref publication and affiliation record plus the deposited abstract. Full text was bot-protected during this audit.

### Foundation Models in Autonomous Driving: A Survey on Scenario Generation and Scenario Analysis

- **Bibliographic status:** Yuan Gao, Mattia Piccinini, Yuchen Zhang, Dingrui Wang, Korbinian Moller, Roberto Brusnicki, Baha Zarrouki, Alessio Gambi, Jan Frederik Totz, Kai Storms, Steven Peters, Andrea Stocco, Bassam Alrifaee, Marco Pavone, and Johannes Betz; *IEEE Open Journal of Intelligent Transportation Systems*, 2026, DOI [10.1109/OJITS.2026.3660686](https://doi.org/10.1109/OJITS.2026.3660686).
- **Team and affiliations:** Technical University of Munich/MIRMI (lead group); Austrian Institute of Technology; Audi; TU Darmstadt; fortiss; University of the Bundeswehr Munich; Stanford University and NVIDIA Research. Companion collection: [TUM-AVS/FM-AD-Survey](https://github.com/TUM-AVS/FM-AD-Survey).
- **Scope:** foundation models for scenario generation and scenario analysis, covering papers from October 2022 through May 2025, plus datasets, simulators, benchmarks, metrics, and safety-testing questions.
- **Original classification:** five foundation-model families—**LLMs**, **VLMs**, **MLLMs**, **diffusion models**, and **world models**—crossed with the two purposes **scenario generation** and **scenario analysis**. Individual tables further annotate input/output modality, execution/augmentation/generation/understanding roles, controllability, and task focus.
- **Core contributions:** unifies generative and analytical foundation-model uses for driving scenarios, records model modalities and operational roles, and gives an evaluation-oriented synthesis of datasets, simulators, controllability, benchmarks, and safety-testing gaps.
- **Evaluation and deployment:** dedicated metric, dataset, simulator, benchmark, open-question, and future-direction sections; strong on scenario controllability and testing utility, less focused on recursive state-transition validity.
- **Difference from our review:** world models are one family inside a broader foundation-model taxonomy, so many included methods are perception, reasoning, or generation tools rather than world models under our definition. We use this survey primarily for data-engine, simulator, metric, and safety-testing references, re-screening every method for action conditionality and rollout.
- **Evidence used:** IEEE/Crossref record and full author PDF.

### A Survey on Multimodal Large Language Models for Autonomous Driving

- **Bibliographic status:** Can Cui, Yunsheng Ma, Xu Cao, Wenqian Ye, Yang Zhou, Kaizhao Liang, Jintai Chen, Juanwu Lu, Zichong Yang, Kuei-Da Liao, Tianren Gao, Erlong Li, Kun Tang, Zhipeng Cao, Tong Zhou, Ao Liu, Xinrui Yan, Shuqi Mei, Jianguo Cao, Ziran Wang, and Chao Zheng; 2024 IEEE/CVF WACV Workshops, DOI [10.1109/WACVW60836.2024.00106](https://doi.org/10.1109/WACVW60836.2024.00106).
- **Team and affiliations:** Purdue University; Tencent T Lab; University of Illinois Urbana-Champaign; University of Virginia; New York University; PediaMedAI; SambaNova Systems; Objective. Companion collection: [IrohXu/Awesome-Multimodal-LLM-Autonomous-Driving](https://github.com/IrohXu/Awesome-Multimodal-LLM-Autonomous-Driving).
- **Scope:** MLLM development and tools for driving, transportation, and map systems; datasets and benchmarks; results from the first LLVM-AD workshop; limitations and research directions.
- **Original classification:** the organizing dimensions are **application domain** (driving, transportation, maps) and **MLLM capability/task**, followed by datasets/benchmarks and workshop evidence. It is not a future-state or rollout taxonomy.
- **Core contributions:** supplies an early systematic map of driving MLLMs, consolidates domain tasks and benchmark resources, reports workshop evidence, and articulates grounding, hallucination, interpretability, compute, data, safety, and deployment challenges.
- **Evaluation and deployment:** covers QA/reasoning benchmarks, hallucination and visual grounding limitations, compute, data, interpretability, safety, and deployment questions for MLLMs, but does not systematically assess closed-loop world-model rollout.
- **Difference from our review:** VLM/MLLM perception and reasoning do not qualify merely because they inform driving decisions. Only systems that explicitly predict an action-conditioned, recursively usable future state enter our core catalog; the rest provide semantic priors, evaluation tools, or VLA boundary context.
- **Evidence used:** CVF/IEEE publication record and full author PDF.

### Data-Centric Evolution in Autonomous Driving: A Comprehensive Survey of Big Data System, Data Mining, and Closed-Loop Technologies

- **Bibliographic status:** Lincan Li, Wei Shao, Wei Dong, Yijun Tian, Qiming Zhang, Kaixiang Yang, and Wenjie Zhang; [arXiv:2401.12888](https://arxiv.org/abs/2401.12888), v2 dated 26 January 2024. No peer-reviewed version was verified.
- **Team and affiliations:** University of New South Wales; CSIRO Data61; BYD Intelligent Driving R&D Centre; University of Notre Dame; University of Sydney; South China University of Technology. Companion collection: [LincanLi98/Awesome-Data-Centric-Autonomous-Driving](https://github.com/LincanLi98/Awesome-Data-Centric-Autonomous-Driving).
- **Scope:** autonomous-driving data systems, acquisition and labeling, data mining, simulation/generation, closed-loop development pipelines, and industry case studies.
- **Original classification:** datasets are categorized by **milestone generation**, modular task, sensor suite, acquisition/labeling setting, and key feature. The system view is organized into **big-data systems**, **data mining**, and **closed-loop technologies**, including development-stage and post-deployment loops.
- **Core contributions:** provides a lifecycle view of autonomous-driving data, connects datasets and mining to industrial closed-loop development, summarizes long-tail discovery and synthetic-data pipelines, and distinguishes development-stage from post-deployment feedback loops.
- **Evaluation and deployment:** strong on pipeline operation, long-tail mining, data generation, automation, industrial empirical evidence, and deployment feedback loops; it does not evaluate learned state rollout as a distinct model property.
- **Difference from our review:** its “closed loop” is primarily the engineering data flywheel, not necessarily recursive environment rollout. We use it to support the data-engine and deployment roles while avoiding the category error of labeling every closed-loop data technology as a world model.
- **Evidence used:** arXiv record and full author PDF.

## Cross-domain foundational surveys

### A Comprehensive Survey on World Models for Embodied AI

- **Bibliographic status:** Xinqing Li, Xin He, Le Zhang, Min Wu, Xiaoli Li, and Yun Liu; [arXiv:2510.16732](https://arxiv.org/abs/2510.16732), v3 dated 25 June 2026. No peer-reviewed publication was verified at the audit date.
- **Team and affiliations:** Nankai University; Tianjin University of Technology; University of Electronic Science and Technology of China; A*STAR Institute for Infocomm Research; Singapore University of Technology and Design. Companion collection: [Li-Zn-H/AwesomeWorldModels](https://github.com/Li-Zn-H/AwesomeWorldModels).
- **Scope:** world models that provide actionable forward or counterfactual rollouts for embodied agents across robotics, autonomous driving, and general video settings; static scene descriptors and purely visual generators without controllable dynamics are explicitly distinguished.
- **Original classification:** three orthogonal axes. **Functionality:** decision-coupled versus general-purpose. **Temporal modeling:** sequential simulation and inference versus global difference prediction. **Spatial representation:** global latent vector, token feature sequence, spatial latent grid, or decomposed rendering representation. Data and evaluation are additionally grouped into robotics, autonomous driving, and general-video resources, with pixel quality, state-level understanding, and task-performance metrics.
- **Core contributions:** formalizes the embodied-world-model problem and learning objectives; contributes a unified three-axis taxonomy; consolidates datasets and metrics across three communities; provides quantitative SOTA comparisons; and isolates unified data, physical-consistency evaluation, real-time efficiency, and long-horizon error accumulation as central open problems.
- **Evaluation and deployment:** explicitly contrasts pixel fidelity with state understanding and downstream performance, and discusses physical consistency, temporal coherence, computational cost, real-time control, and long-horizon rollout stability.
- **Difference from our review:** its three axes strongly complement our framework, but its general-purpose branch remains broader. We first require substantive ego-action conditioning and iterable state transition for the driving core, then distinguish observation, entity, geometry, and latent prediction and four concrete driving-system roles.
- **Evidence used:** arXiv metadata and full author PDF.

### A Survey: Learning Embodied Intelligence from Physical Simulators and World Models

- **Bibliographic status:** Xiaoxiao Long, Qingrui Zhao, Kaiwen Zhang, Zihao Zhang, Dingrui Wang, Yumeng Liu, Zhengjie Shu, Yi Lu, Shouzheng Wang, Xinzhe Wei, Wei Li, Wei Yin, Yao Yao, Jia Pan, Qiu Shen, Ruigang Yang, Xun Cao, and Qionghai Dai; [arXiv:2507.00917](https://arxiv.org/abs/2507.00917), v3 dated 3 September 2025.
- **Team and affiliations:** Nanjing University; University of Hong Kong; Central South University; Horizon Robotics; Institute of Computing Technology, Chinese Academy of Sciences and University of Chinese Academy of Sciences; Shanghai Jiao Tong University; Technical University of Munich; Tsinghua University. Companion collection: [NJU3DV-LoongGroup/Embodied-World-Models-Survey](https://github.com/NJU3DV-LoongGroup/Embodied-World-Models-Survey).
- **Scope:** the complementary roles of physical simulators as external training environments and learned world models as internal cognition/prediction systems, covering robotics, articulated agents, and autonomous driving.
- **Original classification:** a five-level robot autonomy scale, **IR-L0 basic execution**, **IR-L1 programmatic response**, **IR-L2 basic perception and adaptation**, **IR-L3 humanoid cognition and collaboration**, and **IR-L4 full autonomy**, assessed through autonomy, task handling, adaptability, and societal cognition. Robot learning is organized into locomotion, manipulation, and human-robot interaction. Simulators are compared by physical properties, rendering, sensors, and joints. World-model architectures cover RSSM, JEPA, Transformer state-space, autoregressive, diffusion, and hybrid families; their roles are **neural simulator**, **dynamic model**, and **reward model**, reused for driving and articulated robots.
- **Core contributions:** proposes the IR-L0–L4 grading standard; reviews robot-learning techniques and tasks; compares mainstream simulators across physics, rendering, and sensor support; and unifies simulator and world-model roles, including dedicated driving and articulated-robot mappings.
- **Evaluation and deployment:** emphasizes simulator fidelity, scalability and transfer, sim-to-real gaps, controllability, model prediction/planning, and the complementary engineering use of external and internal simulation.
- **Difference from our review:** its subject is embodied intelligence as a whole, and its three world-model roles do not require a single state representation taxonomy. We treat hand-engineered physical simulators as resources, admit only learned action-conditioned iterable dynamics, and subdivide driving states and insertion roles more precisely.
- **Evidence used:** arXiv metadata and full author PDF.

### 3D and 4D World Modeling: A Survey

- **Bibliographic status:** Lingdong Kong, Yu Yang, Jianbiao Mei, Youquan Liu, Ao Liang, Dekai Zhu, Dongyue Lu, Wei Yin, Xiaotao Hu, Mingkai Jia, Junyuan Deng, Kaiwen Zhang, Yang Wu, Tianyi Yan, Shenyuan Gao, Song Wang, Linfeng Li, Liang Pan, Yong Liu, Jianke Zhu, Wei Tsang Ooi, Steven C. H. Hoi, and Ziwei Liu; [arXiv:2509.07996](https://arxiv.org/abs/2509.07996), v4 dated 20 July 2026; WorldBench Team. Project: [worldbench.github.io/survey](https://worldbench.github.io/survey); collection: [worldbench/awesome-3d-4d-world-models](https://github.com/worldbench/awesome-3d-4d-world-models).
- **Team and affiliations:** a 24-author WorldBench collaboration. The accessible PDF front matter identifies the team but does not print an affiliation block; institutions are therefore not inferred from individual author profiles.
- **Scope:** native 3D/4D world modeling and generation using video/RGB-D, occupancy, and LiDAR representations, with definitions, methods, datasets, metrics, applications, challenges, and trends.
- **Original classification:** **modality tracks:** VideoGen, OccGen, and LiDARGen. **Paradigms:** generative and predictive. **Conditions:** geometric (`C_geo`), action-based (`C_act`), and semantic (`C_sem`). **Functional types:** data engine, action interpreter, neural simulator, and scene reconstructor. **Objectives/tasks:** generation, forecasting, reconstruction, action-following, and physical-law modeling. **Applications:** autonomous driving/ADAS, robotics, AR/VR/games, and digital twins/other.
- **Core contributions:** presents the first survey dedicated explicitly to native 3D/4D world modeling; standardizes terminology and a hierarchical multi-axis taxonomy; consolidates modality-specific datasets and evaluation metrics; and identifies physical realism, spatiotemporal coherence, and real-time generation as field-level priorities.
- **Evaluation and deployment:** maps datasets and metrics separately for the three modality tracks and examines physical plausibility, geometry, temporal coherence, action following, downstream utility, and real-time constraints.
- **Difference from our review:** its 3D/4D scope includes reconstruction and unconditional or semantically conditioned generation. Those are valuable methodological resources but fail our core admission test unless ego actions materially alter an iterable future state. Our geometry category also sits alongside entity, observation, and latent states rather than defining the entire scope.
- **Evidence used:** arXiv metadata and full author PDF.

### Understanding World or Predicting Future? A Comprehensive Survey of World Models

- **Bibliographic status:** Jingtao Ding, Yunke Zhang, Yu Shang, Jie Feng, Yuheng Zhang, Zefang Zong, Yuan Yuan, Hongyuan Su, Nian Li, Jinghua Piao, Yucheng Deng, Nicholas Sukiennik, Chen Gao, Fengli Xu, and Yong Li; [arXiv:2411.14499](https://arxiv.org/abs/2411.14499), v4 dated 10 December 2025. The PDF carries an unfilled ACM journal template, so it is recorded as a preprint rather than a published ACM survey.
- **Team and affiliations:** Department of Electronic Engineering and Beijing National Research Center for Information Science and Technology (BNRist), Tsinghua University. Companion collection: [tsinghua-fib-lab/World-Model](https://github.com/tsinghua-fib-lab/World-Model).
- **Scope:** general world-model history, definitions, technologies, and applications spanning games, embodied intelligence, urban intelligence, and societal intelligence.
- **Original classification:** two primary functions. **Implicit representation of the external world** comprises world models for decision-making—model-based RL and language-backbone models—and world knowledge learned by models—global physical, local physical, and human-society knowledge. **Future prediction of the physical world** comprises video-generation world models and embodied environments—indoor, outdoor, and dynamic. Applications are then mapped to game intelligence, embodied intelligence, urban intelligence (driving, logistics, analytics), and societal intelligence/social simulacra.
- **Core contributions:** introduces the understanding-versus-prediction functional taxonomy, uses it to compare how several application domains employ world models, curates representative papers and code, and articulates cross-domain research directions including physical rules, counterfactuals, benchmarks, sim-to-real, efficiency, ethics, and safety.
- **Evaluation and deployment:** discusses benchmarks, goal/subgoal/action/transition evaluation, physical rules, simulation efficiency, sim-to-real transfer, and ethical/safety issues, but does not impose one driving-specific evaluation protocol.
- **Difference from our review:** its understanding branch intentionally includes static knowledge and representations that need not predict an action-conditioned future. Our driving core excludes these unless they implement an iterable transition, while retaining the survey as a source for definitions, origins, and cross-domain comparison.
- **Evidence used:** arXiv metadata and full author PDF.

### Is Sora a World Simulator? A Comprehensive Survey on General World Models and Beyond

- **Bibliographic status:** Zheng Zhu, Xiaofeng Wang, Wangbo Zhao, Chen Min, Bohan Li, Nianchen Deng, Min Dou, Yuqi Wang, Botian Shi, Kai Wang, Chi Zhang, Yang You, Zhaoxiang Zhang, Dawei Zhao, Liang Xiao, Jian Zhao, Jiwen Lu, and Guan Huang; [arXiv:2405.03520](https://arxiv.org/abs/2405.03520), v2 dated 28 October 2025. The PDF uses an unfilled *IEEE Transactions on Pattern Analysis and Machine Intelligence* template, so it is recorded as a preprint rather than a published TPAMI article.
- **Team and affiliations:** GigaAI; Institute of Automation, Chinese Academy of Sciences; National University of Singapore; Shanghai Jiao Tong University; Institute of Computing Technology, Chinese Academy of Sciences; Shanghai AI Laboratory; Mach Drive; Defense Innovation Institute; China Telecom EVOL Lab and Northwestern Polytechnical University; Tsinghua University. Companion collection: [GigaAI-research/General-World-Models-Survey](https://github.com/GigaAI-research/General-World-Models-Survey).
- **Scope:** general world models as future prediction across video generation, autonomous driving, and autonomous agents in games and robotics, followed by domain-specific challenges, future directions, ethics, and safety.
- **Original classification:** three top-level domains. **Video generation:** foundation models and text encoders; GAN, diffusion, autoregressive, and masked-modeling generators; conditional video generation and editing; datasets/metrics; Sora. **Autonomous driving:** end-to-end driving and neural driving simulators, with the latter divided into 2D image/video and 3D scene simulation; tasks include occupancy, action prediction, and data augmentation. **Autonomous agents:** perception/world-model/actor-critic components and VAE, autoregressive, RSSM, and Transformer structures across games, robotics, and diverse environments/tasks.
- **Core contributions:** provides a broad philosophical and technical overview; connects generative video models to driving and autonomous-agent decision systems; consolidates application resources; and compares limitations and future directions across all three domains.
- **Evaluation and deployment:** collects video datasets and perceptual metrics, driving generation/planning evidence, and agent benchmarks; separately discusses generalization, controllability, physical consistency, real-time efficiency, sim-to-real, ethics, and safety.
- **Difference from our review:** its thesis is “understanding the world via predicting the future,” so it includes conditional video generation without required action response and E2E policies without an explicit iterable future state. We retain it as a foundational boundary survey and re-screen every driving work with our two admission criteria.
- **Evidence used:** arXiv metadata, full author PDF, and official companion repository.

### World Models: The Safety Perspective

- **Bibliographic status:** Zifan Zeng, Chongzhe Zhang, Feng Liu, Joseph Sifakis, Qunli Zhang, Shiming Liu, and Peng Wang; [arXiv:2411.07690](https://arxiv.org/abs/2411.07690), submitted 12 November 2024; 2024 IEEE International Symposium on Software Reliability Engineering Workshops (ISSREW), DOI [10.1109/ISSREW63542.2024.00104](https://doi.org/10.1109/ISSREW63542.2024.00104).
- **Team and affiliations:** Huawei Technologies Duesseldorf RAMS Lab; Technical University of Munich; Technical University of Berlin; Univ. Grenoble Alpes/CNRS/Grenoble INP/VERIMAG and SUSTech/RITAS; Huawei Technologies Shenzhen RAMS Lab.
- **Scope:** the technical evolution, failure pathology, and trustworthiness of world models for embodied agents, using autonomous driving as the primary safety-critical case.
- **Original classification:** implementation techniques are organized chronologically into **RNN-based**, **Transformer-based**, **diffusion-based**, and **other techniques**. The safety analysis then separates unreasonable generated traffic scenarios from unsafe behavior of world-model-driven agents. Its research agenda covers uncertainty quantification, symbolic/neuro-symbolic integration, controllable learning, mechanistic explanation, and trustworthiness benchmarks/evaluation.
- **Core contributions:** reviews the technical evolution of world models through a safety lens; documents concrete spatial, rule, and temporal-consistency failures and an interaction crash; and converts those pathologies into a prioritized trustworthy-world-model research agenda.
- **Evaluation and deployment:** foregrounds hallucination, physical and social plausibility, temporal consistency, rare/unseen interactions, uncertainty, guardrails, explainability, and safety benchmarking rather than treating them as secondary limitations.
- **Difference from our review:** its architecture chronology and pathology analysis are inputs to our rollout-mechanism and deployment chapters. Our review additionally defines a driving-specific admission boundary, separates the predicted state from generator design, and connects safety evidence to four system insertion roles.
- **Evidence used:** arXiv record, conference metadata, and full author PDF.

### Video Generation Models as World Models: Efficient Paradigms, Architectures and Algorithms

- **Bibliographic status:** Muyang He, Hanzhong Guo, Junxiong Lin, and Yizhou Yu; [arXiv:2603.28489](https://arxiv.org/abs/2603.28489), v3 dated 4 July 2026. No accepted journal or conference version was verified. The manuscript names an `Efficient-VWM-Survey` repository, but no public repository URL could be verified at the audit date.
- **Team and affiliations:** School of Computing and Data Science, University of Hong Kong; Muyang He and Yizhou Yu are also affiliated with the Hong Kong Generative AI Research and Development Center.
- **Scope:** techniques that reduce the computational and memory cost of video-generation-based world models, plus applications to autonomous driving, embodied AI, games/interactive simulation, and interactive talking-head generation.
- **Original classification:** **efficient modeling:** diffusion distillation (step-reduction, consistency, adversarial), autoregressive modeling, hybrid AR-diffusion, and streaming causal diffusion. **Efficient architecture:** hierarchical/pyramidal generation, efficient VAE/latent compression, long-context and memory (visual, spatial, compressed-context, implicit), efficient attention (sparse, windowed, linear, state-space), and extrapolation/RoPE. **Efficient inference:** parallelism, caching, pruning, and quantization.
- **Core contributions:** makes the intersection of efficiency and video world modeling its central subject; provides a three-level taxonomy spanning paradigm, architecture, and inference; connects these methods to interactive applications; and argues that real-time, long-context, and robust simulation require efficiency as a first-class design constraint.
- **Evaluation and deployment:** focuses on latency, memory, sampling steps, context length, real-time interaction, and fidelity-efficiency trade-offs, alongside physical accuracy and robustness.
- **Difference from our review:** the paper defines actions as optional, so many included video generators fail our ego-action criterion. We use its efficiency taxonomy for rollout and deployment analysis but retain qualifying driving models only when action response and recursive simulation are evidenced.
- **Evidence used:** arXiv metadata, full author PDF, and a direct GitHub repository search on 7 August 2026.

## Methodological reviews, theses, and perspectives

### Reinforcement Learning: From Algorithms to Foundation Models

- **Bibliographic status:** Zihan Ding; Princeton University PhD dissertation, Department of Electrical and Computer Engineering, May 2026; adviser Chi Jin; [arXiv:2607.17560](https://arxiv.org/abs/2607.17560), submitted 20 July 2026. This is a dissertation and integrated research monograph, not a survey article.
- **Team and affiliations:** Princeton University; single-author dissertation.
- **Scope:** reinforcement-learning algorithms in strategic games and RL with generative/foundation models, including learned world models for planning and control.
- **Original organization:** **Part I, multi-agent RL in games:** two-player zero-sum games, large-scale zero-sum video games, and multiplayer general-sum games. **Part II, RL in the foundation-model era:** diffusion world models for model-based RL, RL for efficient video generation, generative models as policy classes, interactive action-conditioned video world models, and memory mechanisms for long-horizon world modeling.
- **Core contributions:** develops original algorithms and systems across game-theoretic RL and foundation-model-assisted RL; demonstrates diffusion world modeling and interactive action-conditioned video simulation; studies generative policies and efficiency; and connects memory to long-horizon modeling. Its value here is as a methodological synthesis and primary-source bundle rather than an independent survey taxonomy.
- **Evaluation and deployment:** includes theoretical analysis and task-specific experiments, with direct relevance to multi-agent interaction, model-based control, video-generation efficiency, interactive rollouts, and long-horizon memory; it is not a cross-paper deployment benchmark.
- **Difference from our review:** only its action-conditioned, recursively usable dynamics belong in our world-model core, and driving relevance must be established paper by paper. The dissertation primarily supplies RL and generative-model foundations for our mechanism chapter.
- **Evidence used:** dissertation front matter, table of contents, abstract, and arXiv metadata.

## What is genuinely new in our classification

The comparison shows that existing surveys usually choose one dominant viewpoint: predicted modality, application/task, architecture, MPC function, latent design, robustness maturity, multi-agent cooperation, or data pipeline. Our review combines the useful parts without putting unlike concepts at the same level:

| Common ambiguity in prior surveys | Resolution in our framework |
| --- | --- |
| Video generators and world models are mixed because both predict frames | Apply action conditionality and iterative rollout before classification |
| Image, occupancy, planning, and pretraining appear as sibling categories | Separate **state representation** from **system role** |
| Diffusion or Transformer labels replace a definition of the predicted state | Treat **rollout mechanism** as an independent axis |
| Traffic maps, objects, BEV, occupancy, and latent features overlap | Use the loss target to distinguish observation, entity, geometry, and latent state |
| “Closed loop” may mean model rollout, simulator feedback, or the data flywheel | Name recursive rollout, interactive simulation, and engineering data loop separately |
| Good FID/FVD is treated as evidence of driving usefulness | Separate perceptual fidelity from action response, long-horizon stability, closed-loop safety, and runtime trust |
| Deployment appears only as a future-work paragraph | Give runtime credibility, engineering constraints, sim-to-real, black-box assurance, and certification a dedicated chapter |

## Evidence and maintenance policy

- Publication status is taken from the publisher/DOI record where available; otherwise the arXiv, SSRN, or TechRxiv record is stated explicitly.
- Team affiliations are transcribed from the paper front page or deposited bibliographic metadata. Institutions are not inferred from author names or unrelated publications.
- “Original classification” paraphrases the authors' abstract, taxonomy figure, table of contents, and relevant section headings. Analytical coverage marks and “Difference from our review” are our own comparison.
- If a full text was inaccessible, the entry says so and does not invent section-level detail. Corrections and newly indexed surveys are welcome through [CONTRIBUTING.md](CONTRIBUTING.md).

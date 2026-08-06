# Driving World Model Survey Comparison

This document records how each survey organizes the literature in its own words and how that organization differs from the taxonomy used by this repository. It is designed for literature-review writing, not as a citation-count ranking.

> **Audit date:** 6 August 2026. The set is a high-coverage audit of public English-language surveys found through the three source repositories plus arXiv, Crossref, OpenAlex, Semantic Scholar, and GitHub searches. It is not a claim of permanent completeness.

## How to read this comparison

Our review first applies two admission criteria: a learned transition must be **ego-action-conditioned** and its output state must support **iterated rollout**. Admitted methods are then organized along four independent axes:

1. **Future-state representation:** observation-level image/video or point cloud; scene-level entity or geometry; latent space.
2. **Rollout mechanism:** recurrent/state-space/JEPA dynamics; autoregression; diffusion or flow matching; hybrid mechanisms.
3. **System role:** data engine; open- or closed-loop simulator; planning-internal rollout; predictive representation pretraining.
4. **Evidence and readiness:** metrics, credible rollout horizon, closed-loop behavior, runtime, robustness, sim-to-real transfer, interpretability, and safety assurance.

Coverage marks in the overview are analytical annotations, not claims made by the survey authors: **●** = a major organizing axis or dedicated treatment, **◐** = discussed but not a primary axis, **○** = little or no systematic treatment. “Core” means a survey centered on driving world models; “thematic” means a focused extension; “boundary” means adjacent literature that does not consistently satisfy our two admission criteria.

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

## Comprehensive driving-world-model surveys

### World Models for Autonomous Driving: From Future Generation to Decision Making

- **Bibliographic status:** Han Huang, Dingkang Yang, Lulu Guo, Jing Cheng, Yang Liu, Victor C. M. L. Leung, and Hong Chen; 2026 SSRN working paper, DOI [10.2139/ssrn.6827179](https://doi.org/10.2139/ssrn.6827179). It is a repository working paper, not a peer-reviewed journal article in the metadata available at the audit date.
- **Team and affiliations:** Tongji University (Huang, Guo, Liu, Chen); Fudan University (Yang and Liu in the deposited affiliation metadata); East China Normal University (Cheng); Shenzhen University (Leung). These affiliations follow deposited metadata because the SSRN full text was not reliably retrievable during the audit.
- **Scope:** driving models that predict traffic evolution, evaluate candidate ego actions, and support closed-loop behavior. It also reviews datasets, simulators, metrics, benchmark protocols, and the open-loop/closed-loop evidence gap.
- **Original classification:** an MPC-centered primary split into **future world generation**, **planning with world models**, and **hybrid prediction-planning world models**. It then cross-compares visual, BEV, occupancy, LiDAR, and latent representations and diffusion, autoregressive, latent-dynamics, and hybrid mechanisms.
- **Evaluation and deployment:** explicitly discusses rollout reliability, uncertainty, efficiency, scalability, generation-to-planning transfer, and whether generated futures improve planning rather than realism alone.
- **Difference from our review:** this is the closest functional comparison, but its top-level organizing principle is the MPC role. Our framework first enforces action conditionality and iterative rollout, separates state representation from rollout mechanism, distinguishes four system insertion roles, and adds runtime trust and safety certification as a dedicated layer.
- **Evidence used:** Crossref abstract and bibliographic record; OpenAlex deposited affiliations. Full-text section-level details remain to be audited if an accessible author copy appears.

### Latent World Models for Automated Driving: A Unified Taxonomy, Evaluation Framework, and Open Challenges

- **Bibliographic status:** Rongxiang Zeng and Yongqi Dong; [arXiv:2603.09086](https://arxiv.org/abs/2603.09086), submitted 10 March 2026. The author manuscript says it is under review at *IEEE Transactions on Intelligent Transportation Systems*; it should therefore be cited as a preprint, not an accepted T-ITS paper.
- **Team and affiliations:** RWTH Aachen University (Zeng) and Delft University of Technology (Dong).
- **Scope:** latent representations used for neural simulation, planning and reinforcement learning, synthetic-data generation and editing, and cognitive reasoning/VLA interfaces.
- **Original classification:** three nested design axes: **target** (latent worlds, latent actions, latent generators), **form** (continuous states, discrete tokens, hybrids), and **structural priors** (geometry, topology, semantics). Representative work is grouped into **spatiotemporal world modeling and neural simulation**, **latent-centric planning and RL**, **generative data synthesis and scene editing**, and **cognitive reasoning and latent chain-of-thought**. Five cross-cutting mechanics are then analyzed: structural isomorphism, long-horizon temporal stability, semantic/reasoning alignment, value-aligned objectives and post-training, and adaptive computation/deliberation.
- **Evaluation and deployment:** unusually strong treatment of open-loop fidelity versus closed-loop stability, benchmark environments, a proposed Closed-loop Safety Gap and resource-aware deliberation cost, long-horizon hallucination, real-time efficiency, sim-to-real generalization, interpretability, causal reasoning, and rare-event safety.
- **Difference from our review:** it deliberately makes latent space the universal computational substrate and includes VLA/cognitive latent interfaces. Our representation taxonomy places latent prediction alongside observable sensor and scene states, applies stricter action/rollout admission tests, and separates entity-level from geometry-level scene states. Our scope is therefore broader in representation but narrower in what qualifies as a world model.
- **Evidence used:** arXiv record and full author PDF.

### The Role of World Models in Shaping Autonomous Driving: A Comprehensive Survey

- **Bibliographic status:** Sifan Tu, Xin Zhou, Dingkang Liang, Xingyu Jiang, Yumeng Zhang, Xiaofan Li, and Xiang Bai; [arXiv:2502.10498](https://arxiv.org/abs/2502.10498), v2 dated 1 February 2026. No journal DOI or acceptance statement was verified, so this entry is treated as a preprint.
- **Team and affiliations:** Huazhong University of Science and Technology (Tu, Zhou, Liang, Jiang, Bai) and Baidu (Zhang, Li).
- **Scope:** a broad driving-world-model ecosystem: simulators, datasets, metrics, predicted modalities, applications, quantitative performance, limitations, and future directions. Companion collection: [LMD0311/Awesome-World-Model](https://github.com/LMD0311/Awesome-World-Model).
- **Original classification:** predicted-scene modality is the main taxonomy: **visual/video space**, **point cloud**, **occupancy**, **latent space**, and **traffic map**, with multimodal/unified models discussed across categories. Applications are separately grouped as **simulation**, **data generation**, **enhancing driving**, and **pre-training**.
- **Evaluation and deployment:** tabulates image/video, occupancy, point-cloud, open-loop planning, and closed-loop planning metrics; compares representative generation and driving results; discusses long-horizon consistency, physical constraints, inference efficiency, dataset imbalance, and unified architectures.
- **Difference from our review:** its modality axis is close to our future-state representation axis, but traffic maps combine entity/road-structure abstractions that we separate analytically. It does not use our action-conditioned and iterable admission gate, nor does it systematically distinguish generator mechanism from output representation. Our four system roles are also stricter: “enhancing driving” is decomposed into planning-internal rollout versus representation pretraining.
- **Evidence used:** arXiv record and full author PDF.

### Research on World Models for Connected Automated Driving: Advances, Challenges, and Outlook

- **Bibliographic status:** Nuo Chen and Xiang Liu; *Applied Sciences* 15(16):8986, published 14 August 2025, DOI [10.3390/app15168986](https://doi.org/10.3390/app15168986).
- **Team and affiliations:** School of Electronic and Electrical Engineering, Shanghai University of Engineering Science.
- **Scope:** learned world models in connected autonomous vehicles, emphasizing multi-source and cooperative information rather than only ego-vehicle modeling.
- **Original classification:** six application domains: **cooperative perception**, **prediction**, **decision-making**, **control**, **human-machine collaboration**, and **scene generation**. The discussion within these domains covers methodologies and technology advances rather than imposing one representation taxonomy.
- **Evaluation and deployment:** discusses heterogeneous data fusion, physical-law mapping, long-term memory, cross-scenario generalization, robustness, efficiency, and interpretability. It is more application-oriented than benchmark-protocol-oriented.
- **Difference from our review:** its top-level categories are CAV pipeline functions and can contain perception or control work that is not an action-conditioned iterable world model. We would admit only the predictive-transition component, then reclassify it by state representation, rollout mechanism, and system role. Its cooperative emphasis complements, but does not replace, our representation-centered taxonomy.
- **Evidence used:** Crossref publication record, publisher metadata, and abstract.

### A Survey of World Models for Autonomous Driving

- **Bibliographic status:** Tuo Feng, Wenguan Wang, and Yi Yang; [arXiv:2501.11260](https://arxiv.org/abs/2501.11260), v4 dated 10 September 2025. The manuscript says “Manuscript submitted to ACM” and contains a placeholder DOI, so it is treated as a preprint rather than a published ACM article.
- **Team and affiliations:** Collaborative Innovation Center of Artificial Intelligence, Zhejiang University. Companion resources: [FengZicai/AwesomeWMAD](https://github.com/FengZicai/AwesomeWMAD) and [WMAD-Benchmarks](https://github.com/FengZicai/WMAD-Benchmarks).
- **Scope:** core tasks, future-state generation, planning, interaction between prediction and planning, training paradigms, applications, and task-specific performance.
- **Original classification:** a three-tier task taxonomy: **generation of the future physical world**, **behavior planning for intelligent agents**, and **interaction between prediction and planning**. Future physical generation is subdivided by output into **image**, **BEV**, **occupancy grid**, and **point cloud**; image generation is further discussed by Dreamer, diffusion, and Transformer families. Training is organized as self-supervised learning, large-scale pretraining, and synthetic data generation; applications are scene understanding, motion prediction, simulation, and end-to-end driving.
- **Evaluation and deployment:** compares 4D scene generation, point-cloud forecasting, scene understanding, motion prediction, and planning with task-specific metrics and datasets. It discusses closed-loop scores, self-supervision, multimodal fusion, advanced simulation, training cost, and safety-critical evaluation, but not a certification framework.
- **Difference from our review:** it mixes a state-output category, a downstream task, and a prediction-planning coupling pattern at the same taxonomy level. Our framework makes these orthogonal dimensions, adds entity-level scene prediction and pure latent prediction explicitly, treats architecture/mechanism separately, and excludes generation without substantive ego-action response or iterative rollout.
- **Evidence used:** arXiv record and full author PDF.

### Exploring the Interplay Between Video Generation and World Models in Autonomous Driving: A Survey

- **Bibliographic status:** Ao Fu, Yi Zhou, Tao Zhou, Yi Yang, Bojun Gao, Qun Li, Guobin Wu, and Ling Shao; [arXiv:2411.02914](https://arxiv.org/abs/2411.02914), submitted 5 November 2024. No peer-reviewed publication was verified.
- **Team and affiliations:** Southeast University and its Ministry of Education key laboratory (Fu, Zhou); PCA Lab at Nanjing University of Science and Technology (Tao Zhou); DiDi Chuxing (Yang, Gao, Li, Wu); UCAS-Terminus AI Lab, University of Chinese Academy of Sciences (Shao).
- **Scope:** the architectural and methodological overlap between video generation and driving world models, with JEPA, Genie, Sora, diffusion video generation, driving-scene generation, datasets, and metrics included.
- **Original classification:** video generation is split into **traditional video generation** and **diffusion-based video generation**. World models are split into **perception-prediction structures** and **reinforcement-learning-based structures**, while the driving-focused discussion further separates diffusion-based and autoregressive perception-prediction models. The paper intentionally concentrates on perception-prediction because of its overlap with video generation.
- **Evaluation and deployment:** covers video/image fidelity, point-cloud/occupancy metrics, downstream metrics, datasets, compute and memory constraints, long-video consistency, sim-to-real, interpretability, ethics, privacy, and safety at a discussion level.
- **Difference from our review:** it adopts an inclusive and architecture-driven notion of world models and intentionally crosses into non-action-conditioned video generation. Under our admission test, Sora-like generation remains a methodological source or boundary work unless ego actions materially alter an iterable next state. Our taxonomy also adds point cloud, entity, geometry, and latent states as peers rather than viewing them mainly through video-generation interplay.
- **Evidence used:** arXiv record and full author PDF.

### World Models for Autonomous Driving: An Initial Survey

- **Bibliographic status:** Yanchen Guan, Haicheng Liao, Zhenning Li, Jia Hu, Runze Yuan, Yunjian Li, Guohui Zhang, and Chengzhong Xu; *IEEE Transactions on Intelligent Vehicles*, Early Access online 8 May 2024, pages 1-17, DOI [10.1109/TIV.2024.3398357](https://doi.org/10.1109/TIV.2024.3398357). Crossref assigns a 2025 print year without a volume or issue, so the overview reports 2024/25 rather than silently choosing one date.
- **Team and affiliations:** University of Macau (Guan, Liao, Li, Xu); Tongji University (Hu); Tsinghua University (Yuan); Macau University of Science and Technology (Yunjian Li); University of Hawaiʻi at Mānoa (Zhang).
- **Scope:** world-model history and architecture, general applications, driving scene generation, planning and control, performance evidence, challenges, ethics, and future directions.
- **Original classification:** it first describes the canonical architecture as **perception**, **memory**, **controller**, and **world-model** modules, then surveys broad applications such as model-based RL, JEPA-style prediction, and virtual-world generation. Its driving section is functionally split into **driving scenario generation** and **planning and control**, with methods compared by core architecture, task, and dataset rather than by a single formal taxonomy.
- **Evaluation and deployment:** reports heterogeneous task metrics and datasets, discusses long-term memory, generalization, compute, sim-to-real transfer, explainability, privacy, and ethics. As an initial survey, it does not give a unified evaluation protocol or runtime assurance procedure.
- **Difference from our review:** it is foundational and intentionally broad, whereas our review formalizes the admission boundary and uses a loss/target-based representation hierarchy. Its scenario-generation section includes some work that our action-condition and rollout tests would place outside the core, and its architecture description does not separate future-state type from rollout generator or deployment role.
- **Evidence used:** IEEE/Crossref record and full author PDF.

## Thematic driving-world-model surveys

### Multi-Agent Embodied Autonomous Driving: From V2X Information Exchange to Shared World Models

- **Bibliographic status:** Senkang Hu, Zhengru Fang, Yihang Tao, Zihan Fang, Sam Tak Wu Kwong, and Yuguang Fang; [arXiv:2606.13840](https://arxiv.org/abs/2606.13840), submitted 11 June 2026.
- **Team and affiliations:** Hong Kong JC STEM Lab of Smart City and Department of Computer Science, City University of Hong Kong (Hu, Zhengru Fang, Tao, Zihan Fang, Yuguang Fang); Lingnan University (Kwong). Companion collection: [dl-m9/Multi-Agent-Embodied-Autonomous-Driving](https://github.com/dl-m9/Multi-Agent-Embodied-Autonomous-Driving).
- **Scope:** more than 380 publications on V2X communication, collaborative perception, inter-agent cognition, cooperative decision-making and planning, end-to-end cooperative driving, and simulation/data engines.
- **Original classification:** the organizing transition is **Information Exchange → Shared World Models**: exchanged observations become aligned shared state, intent-aware interaction, and coordinated action. Inside it, collaborative perception uses early/raw, intermediate/feature, late/decision, and adaptive fusion; communication progresses from explicit messages and implicit behavior to semantic, language-based, and plan-level exchange; planning covers game theory, MARL, optimization/negotiation, and generative/foundation-model approaches; system evidence covers E2E cooperation and simulation/benchmarks.
- **Evaluation and deployment:** explicitly codes observable artifacts and evidence strength, distinguishes offline/simulation evidence from real-world guarantees, and analyzes communication latency, packet loss, scalability, shared-state verification, plan agreement, safety envelopes, and closed-loop validation.
- **Difference from our review:** shared world models are a multi-agent coordination construct broader than a single learned transition function. Some V2X perception and communication methods do not meet our admission criteria. We retain the survey as a thematic extension and would classify qualifying predictive shared states as entity-, geometry-, or latent-level world models, then identify simulator or planner roles separately.
- **Evidence used:** arXiv record and full author PDF.

### Progressive Robustness-Aware World Models in Autonomous Driving: A Review and Outlook

- **Bibliographic status:** Feiyang Jia, Caiyan Jia, Ziying Song, Zhicheng Bao, Lin Liu, Shaoqing Xu, Yan Gong, Lei Yang, Xinyu Zhang, Bin Sun, Xiaoshuai Hao, Long Chen, and Yadan Luo; TechRxiv preprint posted 8 December 2025, DOI [10.36227/techrxiv.176523308.84756413/v1](https://doi.org/10.36227/techrxiv.176523308.84756413/v1).
- **Team and affiliations:** the accessible Crossref/OpenAlex record and official companion repository expose the author list but not paper-level affiliations. To avoid unreliable author-name matching, institutions are recorded as **not publicly verified in the accessible metadata** pending an accessible full manuscript.
- **Scope:** driving-world-model task families, architectures, downstream applications, evaluation criteria, adaptation, open-world behavior, and progressive robustness. Companion collection: [MoyangSensei/AwesomeRobustDWM](https://github.com/MoyangSensei/AwesomeRobustDWM).
- **Original classification:** a task axis of **generation**, **planning**, and **enhancement**, crossed with **Robustness 1.0**, **2.0**, and **3.0**. The companion repository defines the progression as **self-metrics and evaluation protocols → contributions to autonomous-driving systems → open-world robustness and future directions**; the paper abstract also analyzes model design, task formulation, evaluation criteria, and adaptation.
- **Evaluation and deployment:** robustness is the central axis rather than an appendix. It connects intrinsic quality, downstream contribution, and open-world adaptation, making this survey particularly useful for our evaluation and deployment chapters.
- **Difference from our review:** its progressive robustness levels provide a maturity lens, while our primary taxonomy starts from the predicted state and rollout mechanism. “Enhancement” is broader than our pretraining role and can include work without an explicit action-conditioned transition. We can reuse the three-stage robustness lens as a comparison dimension without replacing our admission rule or representation hierarchy.
- **Evidence used:** Crossref/OpenAlex abstract and bibliographic records plus the official companion repository. Full-text taxonomy details beyond those public sources are not asserted.

## Closely related boundary surveys

### A Survey on Future Physical World Generation for Autonomous Driving

- **Bibliographic status:** Jianling Chu, Zerun Liu, Huanran Huo, Jinyuan Qin, Yantao Pan, and Lechao Cheng; 7th ACM International Conference on Multimedia in Asia (MMAsia), published 8 December 2025, DOI [10.1145/3769748.3773345](https://doi.org/10.1145/3769748.3773345).
- **Team and affiliations:** Hefei University of Technology (Chu, Liu, Huo, Qin, Cheng) and Chery (Pan), following the publisher-deposited Crossref affiliations.
- **Scope:** generation of future physical states for driving, including inputs/outputs, control conditions, training strategies, architectures, datasets, and open challenges.
- **Original classification:** four output categories: **image-based**, **BEV-based**, **occupancy-grid-based**, and **point-cloud-based generation**. It additionally compares diffusion models, Transformers, and adversarial generators within these state-output tracks.
- **Evaluation and deployment:** compares public datasets and generation quality; highlights spatiotemporal consistency, physical plausibility, self-supervision, multimodal fusion, long-tail generation, and real-time inference. Planning and certification are not the primary organizing concern.
- **Difference from our review:** its output taxonomy maps closely to our observation- and geometry-level states, but it has no entity/scene-graph or pure latent category. More importantly, future generation alone is not sufficient for our definition: methods without substantive ego-action response and recursive rollout remain boundary generators.
- **Evidence used:** ACM/Crossref publication and affiliation record plus the deposited abstract. Full text was bot-protected during this audit.

### Foundation Models in Autonomous Driving: A Survey on Scenario Generation and Scenario Analysis

- **Bibliographic status:** Yuan Gao, Mattia Piccinini, Yuchen Zhang, Dingrui Wang, Korbinian Moller, Roberto Brusnicki, Baha Zarrouki, Alessio Gambi, Jan Frederik Totz, Kai Storms, Steven Peters, Andrea Stocco, Bassam Alrifaee, Marco Pavone, and Johannes Betz; *IEEE Open Journal of Intelligent Transportation Systems*, 2026, DOI [10.1109/OJITS.2026.3660686](https://doi.org/10.1109/OJITS.2026.3660686).
- **Team and affiliations:** Technical University of Munich/MIRMI (lead group); Austrian Institute of Technology; Audi; TU Darmstadt; fortiss; University of the Bundeswehr Munich; Stanford University and NVIDIA Research. Companion collection: [TUM-AVS/FM-AD-Survey](https://github.com/TUM-AVS/FM-AD-Survey).
- **Scope:** foundation models for scenario generation and scenario analysis, covering papers from October 2022 through May 2025, plus datasets, simulators, benchmarks, metrics, and safety-testing questions.
- **Original classification:** five foundation-model families—**LLMs**, **VLMs**, **MLLMs**, **diffusion models**, and **world models**—crossed with the two purposes **scenario generation** and **scenario analysis**. Individual tables further annotate input/output modality, execution/augmentation/generation/understanding roles, controllability, and task focus.
- **Evaluation and deployment:** dedicated metric, dataset, simulator, benchmark, open-question, and future-direction sections; strong on scenario controllability and testing utility, less focused on recursive state-transition validity.
- **Difference from our review:** world models are one family inside a broader foundation-model taxonomy, so many included methods are perception, reasoning, or generation tools rather than world models under our definition. We use this survey primarily for data-engine, simulator, metric, and safety-testing references, re-screening every method for action conditionality and rollout.
- **Evidence used:** IEEE/Crossref record and full author PDF.

### A Survey on Multimodal Large Language Models for Autonomous Driving

- **Bibliographic status:** Can Cui, Yunsheng Ma, Xu Cao, Wenqian Ye, Yang Zhou, Kaizhao Liang, Jintai Chen, Juanwu Lu, Zichong Yang, Kuei-Da Liao, Tianren Gao, Erlong Li, Kun Tang, Zhipeng Cao, Tong Zhou, Ao Liu, Xinrui Yan, Shuqi Mei, Jianguo Cao, Ziran Wang, and Chao Zheng; 2024 IEEE/CVF WACV Workshops, DOI [10.1109/WACVW60836.2024.00106](https://doi.org/10.1109/WACVW60836.2024.00106).
- **Team and affiliations:** Purdue University; Tencent T Lab; University of Illinois Urbana-Champaign; University of Virginia; New York University; PediaMedAI; SambaNova Systems; Objective. Companion collection: [IrohXu/Awesome-Multimodal-LLM-Autonomous-Driving](https://github.com/IrohXu/Awesome-Multimodal-LLM-Autonomous-Driving).
- **Scope:** MLLM development and tools for driving, transportation, and map systems; datasets and benchmarks; results from the first LLVM-AD workshop; limitations and research directions.
- **Original classification:** the organizing dimensions are **application domain** (driving, transportation, maps) and **MLLM capability/task**, followed by datasets/benchmarks and workshop evidence. It is not a future-state or rollout taxonomy.
- **Evaluation and deployment:** covers QA/reasoning benchmarks, hallucination and visual grounding limitations, compute, data, interpretability, safety, and deployment questions for MLLMs, but does not systematically assess closed-loop world-model rollout.
- **Difference from our review:** VLM/MLLM perception and reasoning do not qualify merely because they inform driving decisions. Only systems that explicitly predict an action-conditioned, recursively usable future state enter our core catalog; the rest provide semantic priors, evaluation tools, or VLA boundary context.
- **Evidence used:** CVF/IEEE publication record and full author PDF.

### Data-Centric Evolution in Autonomous Driving: A Comprehensive Survey of Big Data System, Data Mining, and Closed-Loop Technologies

- **Bibliographic status:** Lincan Li, Wei Shao, Wei Dong, Yijun Tian, Qiming Zhang, Kaixiang Yang, and Wenjie Zhang; [arXiv:2401.12888](https://arxiv.org/abs/2401.12888), v2 dated 26 January 2024. No peer-reviewed version was verified.
- **Team and affiliations:** University of New South Wales; CSIRO Data61; BYD Intelligent Driving R&D Centre; University of Notre Dame; University of Sydney; South China University of Technology. Companion collection: [LincanLi98/Awesome-Data-Centric-Autonomous-Driving](https://github.com/LincanLi98/Awesome-Data-Centric-Autonomous-Driving).
- **Scope:** autonomous-driving data systems, acquisition and labeling, data mining, simulation/generation, closed-loop development pipelines, and industry case studies.
- **Original classification:** datasets are categorized by **milestone generation**, modular task, sensor suite, acquisition/labeling setting, and key feature. The system view is organized into **big-data systems**, **data mining**, and **closed-loop technologies**, including development-stage and post-deployment loops.
- **Evaluation and deployment:** strong on pipeline operation, long-tail mining, data generation, automation, industrial empirical evidence, and deployment feedback loops; it does not evaluate learned state rollout as a distinct model property.
- **Difference from our review:** its “closed loop” is primarily the engineering data flywheel, not necessarily recursive environment rollout. We use it to support the data-engine and deployment roles while avoiding the category error of labeling every closed-loop data technology as a world model.
- **Evidence used:** arXiv record and full author PDF.

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

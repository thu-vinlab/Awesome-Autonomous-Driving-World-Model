# Autonomous Driving Background Milestones

These works are included as **historical context before learned driving world models**, not as core world-model entries. They explain the progression from an explicit modular stack, through end-to-end joint optimization, toward vision-language/action-conditioned driving systems.

## Recommended five-paper route

| Paradigm | Representative work | Team / venue | Why it is a milestone | Relation to our world-model scope |
| --- | --- | --- | --- | --- |
| Modular system | [A Survey of Motion Planning and Control Techniques for Self-Driving Urban Vehicles](https://doi.org/10.1109/TIV.2016.2578706) | Brian Paden, Michal Čáp, Sze Zheng Yong, Dmitry Yershov, Emilio Frazzoli; MIT / Czech Technical University / Decision Systems; *IEEE Transactions on Intelligent Vehicles* 2016 | Canonicalizes the explicit perception-to-prediction-to-planning/control decomposition and reviews planning/control assumptions for urban driving | Background only: a survey of engineered and model-based planning/control, not a learned action-conditioned world model |
| Modular-system supplement | [Self-driving cars: A survey](https://doi.org/10.1016/j.eswa.2020.113816) | Claudine Badue et al.; *Expert Systems with Applications* 2021 | Later, broader survey of perception, localization, mapping, planning, control, datasets, and system-level deployment | Background only; useful when introducing the complete modular pipeline and its engineering interfaces |
| End-to-end driving | [End to End Learning for Self-Driving Cars](https://arxiv.org/abs/1604.07316) | Mariusz Bojarski et al.; NVIDIA; arXiv 2016 (PilotNet) | Establishes direct camera-to-steering learning and the argument for joint optimization instead of hand-designed intermediate labels | Not a world model: it predicts control from current observation and does not model recursively usable future states |
| Planning-oriented end-to-end driving | [Planning-oriented Autonomous Driving](https://doi.org/10.1109/CVPR52729.2023.01712) | Yihan Hu et al.; OpenDriveLab/OpenGVLab, Shanghai AI Laboratory, SenseTime Research, Wuhan University; CVPR 2023 | UniAD shifts end-to-end driving from direct action regression toward task coordination and joint optimization around planning | Still not itself a world model; its predictive and occupancy/trajectory components are useful precursors to planning-aware world-model integration |
| VLA / VLM-to-driving | [DriveVLM: The Convergence of Autonomous Driving and Large Vision-Language Models](https://arxiv.org/abs/2402.12289) | Xiaoyu Tian et al.; Tsinghua MARS Lab / NVIDIA; arXiv 2024 | Introduces scene description, scene analysis, hierarchical planning, and DriveVLM-Dual; reports production-vehicle deployment evidence | VLM/VLA bridge rather than a canonical world model: include its predictive or future-reasoning component only when it satisfies action conditionality and iterative rollout |

## How to cite the progression

Use the following narrative in the introduction:

1. **Modular pipeline:** explicit intermediate representations make interfaces and verification visible, but errors propagate between modules and the system relies on hand-designed abstractions.
2. **Direct end-to-end learning:** PilotNet demonstrates that raw sensory input can be mapped directly to steering, reducing manually specified interfaces but weakening interpretability and explicit future reasoning.
3. **Planning-oriented end-to-end learning:** UniAD restores structured task interfaces and joint optimization, bringing prediction, tracking, mapping, occupancy, and planning into one planning-centered architecture.
4. **VLA/VLM-to-driving:** DriveVLM adds language-mediated scene understanding and hierarchical reasoning, while its Dual version illustrates a hybrid deployment pattern that combines foundation-model reasoning with a conventional driving stack.
5. **Driving world models:** the next step is not simply a larger policy; it is an action-conditioned, recursively iterable transition model that can imagine and compare counterfactual futures before acting.

## Selection note

The list intentionally uses **Paden et al.** as the primary modular-pipeline citation and keeps **Badue et al.** as an optional supplementary survey. If the introduction must stay to four citations, cite Paden, Bojarski, UniAD, and DriveVLM; add Badue when a broader system-level survey is useful.

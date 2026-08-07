# Contributing

Thank you for helping improve Awesome Autonomous Driving World Models.

## What belongs in this list

A Core submission must concern driving and satisfy either the **Author-defined WM** or **Definition-aligned WM** route described below. The route must be named explicitly in the entry.

We separately record two analytical properties:

- **Action conditionality:** ego actions are inputs and materially change predicted future states.
- **Rollout capability:** predicted states can feed subsequent transitions rather than supporting only one fixed prediction.

There are two Core admission routes. A driving paper that the authors explicitly define as a world model remains in Core even when its action response or recursive rollout is absent or unclear; the entry should state that limitation rather than override the authors' terminology. A paper that does not make that claim may still enter as **Definition-aligned WM** when the paper demonstrates a learned future-state transition, material ego/agent-action response, and compatible multi-step rollout or imagination. Cite the supporting sections or experiments because this is an editorial classification. Static reconstruction, ordinary one-step prediction, hand-engineered simulators, generic vision, and unrelated robotics do not belong in Core. A public paper is required, and official code, data, model, and project links are strongly preferred.

## Before opening a pull request

1. Search the README for the paper title, method name, and arXiv identifier.
2. Choose one primary category, even if the work spans multiple categories.
3. Link the paper title directly to an official paper or publisher page, then add the authors' official project or repository when available.
4. Verify that every new link is public and resolves without a login.
5. Keep the description factual and limited to one sentence.

Use this entry format:

```markdown
- [**Paper title**](paper-url) (Venue Year) - concise statement of the world-model contribution. [[C](code-url)] [[D](data-or-model-url)] [[W](project-url)]
```

Omit labels that are unavailable. Use the publication venue when confirmed; otherwise use the public preprint year. Do not describe an unaccepted paper as appearing at a venue.

## Pull request checklist

- [ ] The Core resource is driving-related and is either author-defined as a world model/world-action model or has cited evidence for the Definition-aligned route.
- [ ] The entry is not already present.
- [ ] The title, venue, year, and links match the primary source.
- [ ] The work appears in one primary category.
- [ ] Rollout mechanism and system role are recorded as cross-cutting tags, not duplicate primary entries.
- [ ] The description does not make unsupported comparative claims.
- [ ] The README table of contents still works if a heading changed.
- [ ] The link-check workflow passes, or the PR explains a site that blocks automated checks.

Corrections to metadata, broken links, categorization, and scope are as valuable as new entries. For changes affecting many entries, please open an issue first so the organization can be discussed before substantial work is done.

## Updating the collection

`README.md` is the single literature collection. When adding or correcting a survey, record the authors or team, verified publication status, the authors' own taxonomy, core contribution, and difference from this repository's framework. Preserve the survey authors' taxonomy rather than replacing it with ours. Cite a preprint as a preprint until a publisher or DOI confirms publication.

Historical background citations belong in the milestone table, not in the Core Taxonomy, unless they satisfy one of the two Core admission routes. Generic autoregressive vision, unrelated robotics, image generation, medical world models, and other cross-domain records do not belong in this repository merely because an upstream awesome list included them.

Every core item must retain an audit label:

- **Metadata classified:** initially organized from title, abstract/metadata, and upstream context; this is not a claim of full-paper review.
- **Full-text audited:** the paper's predicted state, action conditioning, rollout procedure, loss, role, and evidence have been checked in the full text.

Only full-text-audited, field-representative papers should enter the detailed representative tables. Other works remain compact entries until audited.

# Contributing

Thank you for helping improve Awesome Autonomous Driving World Models.

## What belongs in this list

A core submission should concern a learned model of driving-scene dynamics and satisfy both criteria:

- **Action conditionality:** ego actions are inputs and materially change predicted future states.
- **Rollout capability:** predicted states can feed subsequent transitions rather than supporting only one fixed prediction.

We inclusively retain papers whose authors explicitly identify them as world models and which broadly meet both criteria, but borderline submissions must state the evidence. Pure generation, static reconstruction, perception-only VLMs, action-only VLAs, non-predictive E2E driving, and hand-engineered simulators do not belong in the core paper list; they may be proposed as boundary or methodological resources. A public paper is required, and official code, data, model, and project links are strongly preferred.

## Before opening a pull request

1. Search the README for the paper title, method name, and arXiv identifier.
2. Choose one primary category, even if the work spans multiple categories.
3. Use an official paper page and the authors' official project or repository.
4. Verify that every new link is public and resolves without a login.
5. Keep the description factual and limited to one sentence.

Use this entry format:

```markdown
- **Method** (Venue Year) - concise statement of the world-model contribution. [[P](paper-url)] [[C](code-url)] [[D](data-or-model-url)] [[W](project-url)]
```

Omit labels that are unavailable. Use the publication venue when confirmed; otherwise use the public preprint year. Do not describe an unaccepted paper as appearing at a venue.

## Pull request checklist

- [ ] The resource meets the scope and inclusion criteria.
- [ ] The entry is not already present.
- [ ] The title, venue, year, and links match the primary source.
- [ ] The work appears in one primary category.
- [ ] The description does not make unsupported comparative claims.
- [ ] The README table of contents still works if a heading changed.
- [ ] The link-check workflow passes, or the PR explains a site that blocks automated checks.

Corrections to metadata, broken links, categorization, and scope are as valuable as new entries. For changes affecting many entries, please open an issue first so the organization can be discussed before substantial work is done.

## Updating the survey comparison

When adding or correcting a survey, update both the compact README index and `SURVEY_COMPARISON.md`. Record the authors, paper-level affiliations, verified publication status, scope, the authors' own taxonomy, evaluation/deployment coverage, companion resources, and the difference from this repository's framework. Cite a preprint as a preprint until a publisher or DOI record confirms publication, and state the evidence limitation when the full text or affiliations cannot be verified.

Historical background citations belong in `AD_BACKGROUND_MILESTONES.md`, not in the core world-model categories, unless the work also provides an action-conditioned and recursively iterable learned transition model.

## Updating the full catalog

`FULL_REFERENCE_CATALOG.md` and `data/reference_catalog.json` are generated files. Clone or update the three source repositories named in the catalog as sibling directories of this repository, then run:

```shell
ruby scripts/build_full_catalog.rb
```

Commit the generator and both generated outputs together. Review changes to admission status and Chapter 3 representation manually; titles and upstream section names cannot replace checking the actual action input, predicted state, loss, and rollout procedure.

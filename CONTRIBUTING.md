# Contributing

Thank you for helping improve Awesome Autonomous Driving World Models.

## What belongs in this list

A submission should concern a learned model of driving-scene dynamics and do at least one of the following:

- predict future observations, scene states, or latent states;
- respond to actions or other interventions;
- support simulation, planning, policy learning, data generation, or predictive pretraining;
- evaluate the temporal, geometric, physical, interactive, safety, or deployment properties of a driving world model.

The list is curated rather than exhaustive. A public paper is required. Official code, data, model, and project links are strongly preferred. Pure single-frame generation and perception-only work without temporal prediction are normally out of scope.

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

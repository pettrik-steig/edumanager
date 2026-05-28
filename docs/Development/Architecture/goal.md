project: EduManager 2026
created: 2026-05-28 (Data)
changed: 2026-05-28 (Data)

# Architecture Process Goal

## Current Goal

The next goal of the architecture process is to investigate several concrete
application scenarios using agile scenario-based information flow analysis.

Instead of designing the whole system top-down, each scenario should begin with
a real practical situation from school work. The first analysis step should
describe the actual situation and avoid premature detail modeling. Actors,
data stores, transferred data, and information flows are identified only after
the real situation is sufficiently clear.

## Agile Relation

This supports agile software development because it derives requirements
bottom-up from real usage situations.

Each analyzed scenario should produce a small, reviewable piece of domain
understanding. The results can later be refined into user stories, acceptance
criteria, domain concepts, data model questions, and architecture decisions.

The approach supports:

- user-centered analysis
- iterative refinement
- incremental domain understanding
- feedback on concrete situations
- YAGNI-oriented modeling
- emergent architecture from recurring patterns

## Domain And Function

Real school terms and their functional role in the application must be
distinguished.

Different school terms can have similar application functions. For example, an
upper-secondary course and a lower-secondary language course may differ in
school organization, but both can create a teaching context where the
`Lerngruppe` is not identical to a `Klasse` or `Jahrgang`.

This distinction is architecturally important. EduManager should not silently
assume Alex's personal school situation as the general model.

For example, in lower-secondary physics, `Klasse` and `Lerngruppe` may often
be identical. An English teacher may still need groups that differ from the
class because language teaching can split, mix, or regroup students. If
`Klasse = Lerngruppe` were hard-coded as the normal structure, supporting such
cases later would not be a small detail but an additional structural layer.

At the same time, the project should avoid starting with a complete top-down
model of every possible school form. The intended compromise is:

- analyze concrete scenarios precisely
- capture relevant real-world details early when they appear
- look for recurring functional patterns across different school terms
- keep the software modular enough to extend when new school structures appear
- postpone generalization until several concrete cases justify it

## Analysis Focus

For each scenario, analyze:

- the concrete application situation
- the real-world trigger or Anlass
- the involved actors
- the real workflow
- existing data stores, if they are already relevant
- transferred data, if the situation is clear enough for that level
- information flow between data stores, if useful
- the medium of data stores and transfers, if useful
- resulting requirements and open architecture questions

At this stage, visualization is optional. Textual analysis is preferred until a
diagram is clearly useful.

## Medium Categories

The first medium categories are:

- human: memory or spoken information
- mechanical: paper or similar physical representation
- electronic: computer, application, file, e-mail, or other electronic form

Electronic media may later need a more precise distinction regarding
persistence, ownership, and synchronization.

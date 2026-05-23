# EduManager Start Notes / Startnotizen

Date: 2026-05-23

## Purpose / Zweck

This document is a practical handover note from the discontinued Sitzplan project
to the planned follow-up project EduManager.

Dieses Dokument dient als praktische Uebergabenotiz vom eingestellten Sitzplan-
Projekt zum geplanten Folgeprojekt EduManager.

The old project remains useful as an architectural reference, but the next step is
not to continue adding features there. EduManager should start from the use cases
and domain lifecycle rules that became clearer during the first project.

Das alte Projekt bleibt als architektonische Referenz wertvoll, soll aber nicht
mehr durch weitere Feature-Erweiterungen fortgefuehrt werden. EduManager soll von
den Use Cases und Lebenszyklusregeln der Domain her neu gedacht werden, die im
ersten Projekt klarer geworden sind.

## Important Lessons From The Old Project

### Domain identity and copies

- A normal constructor of a persistent domain object creates a new object with a
  fresh persistent identity.
- Editor working copies are temporary helper objects. They are not persisted and
  preserve the identities of the copied original object and its copied child
  objects.
- After editing, an editor working copy must write its state back into the
  original object instead of replacing the original object, because replacing it
  would break existing identity references.
- Not every copy has the same meaning. Future code should distinguish use cases
  explicitly instead of relying on one generic copy constructor.

### Raum situation and Sitzordnung

- A `Raumsituation` can exist as an editable persistent template.
- A `Sitzordnung` needs its own independent persistent `Raumsituation` instance
  that belongs to this seating arrangement.
- For persistence, both template room situations and seating-arrangement-owned
  room situations can live in one simple list. The semantic difference comes from
  ownership in the domain model, not from a separate persistence category.
- This is different from an editor working copy: a seating-arrangement-owned room
  situation is persistent and needs its own identity lifecycle.

### References versus owned child objects

- Some domain relations are references and must not duplicate the referenced
  object. Example: when creating a new learning group, existing students should
  be referenced, not copied as new students.
- Other relations are ownership relations. Example: when creating an independent
  room situation for a seating arrangement, owned seats may need to become new
  persistent objects.
- EduManager should define these relation types explicitly per use case before
  implementation.

### Application layer responsibility

- The old project already moved many object lifecycle operations into
  `app/Project` and its sub-project classes.
- This direction should be kept: creating, deleting, moving, assigning and
  persisting domain objects should be coordinated by the application layer, not
  scattered across UI code.
- EduManager should make this clearer by modelling application services or use
  case classes explicitly.

## Architectural Direction For EduManager

EduManager should be designed from use cases first, then mapped to domain objects,
persistence and UI.

Suggested architectural language:

- Domain model: the core concepts such as students, learning groups, rooms,
  timetables, seating arrangements and school context.
- Use cases / application services: operations such as creating a learning group,
  assigning students, creating a seating arrangement, editing a room template, or
  deriving a seating-plan-local room situation.
- Persistence model: storage format and repository logic. Persistence should not
  decide domain ownership semantics.
- UI / editor models: temporary presentation and editing state. Editor models may
  use working copies, but these must be clearly separated from persistent domain
  objects.
- Tooling: Python can be used outside the Java core for import/export,
  validation, migration and development automation.

## Technology Direction

- Main application: Java.
- Development and data tooling: Python.
- Planned file extension for project data: `.edu`.
- Old project as reference: `sitzplan`.
- Follow-up project name: `EduManager`.

This is a deliberate tool split, not language hopping:

- Java should demonstrate robust application architecture, typed domain modelling
  and long-term maintainability.
- Python should support pragmatic automation, data import/export, test data
  generation and migration scripts.

## Suggested First Steps In The New Project

1. Create a new clean project directory, for example
   `C:\Users\Pettrik\Desktop\workspace\EduManager`.
2. Initialize Git in the new directory.
3. Add initial documentation before implementation:
   `README.md`, `docs/architecture.md`, `docs/domain-lifecycle.md`,
   `docs/use-cases.md`, `docs/tooling-python.md`.
4. Install and verify local Python tooling.
5. Decide the initial Java project structure.
6. Define the first domain lifecycle rules before writing UI code.
7. Use the old Sitzplan project only as a read-only reference unless explicitly
   changing it later.

## Open Design Questions

- Which domain objects are aggregate roots?
- Which child objects are owned and copied with fresh identities?
- Which relations are references to existing persistent objects?
- Which use cases need temporary editor working copies?
- Which use cases create new persistent copies from existing persistent objects?
- How should `.edu` project files be structured and versioned?
- Should EduManager start as a desktop app, a library with tests, or an app core
  plus later UI?

## Recommended Starting Principle

Start smaller than the old project, but more explicit:

First define the domain lifecycle and use cases. Then implement the smallest
vertical slice that proves the architecture.

For example:

1. Create students.
2. Create a learning group referencing students.
3. Create a room template.
4. Create a seating arrangement with its own persistent room situation copy.
5. Save and load the project file.

Only after this lifecycle is clear should UI complexity be added.

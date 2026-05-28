project: EduManager 2026
created: 2026-05-28 (Data)
changed: 2026-05-28 (Data)

# Zuweisung Zu Klasse, Lerngruppe Oder Kurs

## Situation

A student is assigned to a school context that matters for teaching work.

This scenario is about the real organizational assignment before detailed data
modeling. The important first step is to understand what kind of assignment
happens and where it comes from.

## Anlass

The teacher learns that a student now belongs to a relevant teaching or school
context.

This is usually externally initiated. The teacher normally does not choose the
student freely.

Possible sources:

- school administration
- a colleague
- timetable or course planning
- official class or course list
- informal but school-relevant communication

## Main Variants

### New Student At School

The student is newly admitted to the school.

In lower secondary school, the student is usually assigned to a `Klasse` first.
Depending on subjects, languages, differentiation, or other school structures,
the student may also be assigned to one or more `Lerngruppen`.

In upper secondary school, the student may not be assigned to a traditional
`Klasse`. Instead, the relevant assignment is usually to several
`Oberstufenkurse`.

### Student Already At School

The student already belongs to the school but changes one or more assignments.

Possible changes:

- change of `Klasse`
- change of `Lerngruppe`
- change of `Oberstufenkurs`
- additional course or learning group
- removal from a course or learning group

## Domain Distinctions

This scenario must distinguish:

- `Klasse`: organizational school class
- `Kurs`: organizational teaching unit
- `Oberstufenkurs`: upper-secondary course as a specific kind of course
- `Lerngruppe`: the students assigned to a course or teaching context

`Klasse`, `Lerngruppe`, and `Kurs` are related but not the same. A student can
be assigned to one without that automatically defining the others.

Some school terms differ organizationally but can have a similar function for
EduManager. For example, an `Oberstufenkurs` and a lower-secondary language
course can both represent a teaching context where the relevant `Lerngruppe`
does not match a `Klasse` or `Jahrgang`.

This is an important architecture point. The app should not assume that the
students relevant to a teaching situation can always be derived directly from a
class or year level.

In lower-secondary physics, `Klasse` and `Lerngruppe` are often identical in
practice. This must be treated as one common case, not as the general model.
For language teaching, such as English, groups may differ from the class
structure. A later change from hard-coded class groups to separate learning
groups would be a structural change, not a minor refinement.

## Ergebnis

At the end of this real-world situation, the teacher knows that a student is
relevant for a concrete class, learning group, or course context.

The scenario is not yet about entering all details into the app. That comes
after the real assignment situation is understood.

## Open Points

- Which assignment types are common enough to model first?
- How should `Oberstufenkurs` relate to the general term `Kurs`?
- Which assignments are official and which are only practical working
  information for the teacher?
- Which assignment changes are frequent during a school year?
- Which different school terms have the same functional role for EduManager?
- Where would a too-simple class-based model make later extension difficult?

// ══════════════════════════════════════════════════════════════════════════
//  University of Auckland Linux User Group
//  Annual General Meeting (AGM) 2026
// ══════════════════════════════════════════════════════════════════════════
//  Compile with:  typst compile main.typ
//  (or `typst watch main.typ` while editing)
//
//  Structure follows the 2025 Extraordinary AGM deck, minus everything that
//  was specific to calling another extraordinary meeting.
//
//  Only the CONFIG block below needs editing year to year.
// ══════════════════════════════════════════════════════════════════════════

#import "theme/theme.typ": *

// ──────────────────────────────────────────────────────────────────────────
//  CONFIG
// ──────────────────────────────────────────────────────────────────────────

// Date and time the AGM starts. Change this one line each year.
// (Typst wants hour, minute and second together when a time is given.)
#let agm-date = datetime(year: 2026, month: 9, day: 21, hour: 18, minute: 0, second: 0)

// The same date and time as plain text, for the title and opening slides.
#let agm-time = "6:00pm"
#let agm-venue = "University of Auckland"

// Notice of motion details. Put the submitter as written on the notice itself;
// while it is `none` the "Submitted by" line stays hidden.
#let notice-submitter = none
#let notice-date = datetime(year: 2026, month: 9, day: 21)

// Links. Swap in the real ones before presenting. These are what the slides
// point at, so each one needs the full address including https://.
#let constitution-link = "https://lug.ac/constitution"
#let site-link = "https://lug.ac"
#let github-link = "https://github.com/lug-uoa"
#let discord-link = "https://discord.gg/lug-uoa" // TODO: current invite
#let minutes-link = "https://tinyurl.com/lug-uoa-2025-eagm-minutes" // TODO: 2025 EAGM minutes
#let annual-report-link = "https://tinyurl.com/lug-uoa-2026-agm-annual-report" // TODO: 2026 Annual Report

#let club-abbr = [LUG\@UoA]

// Every address shown on a slide goes through this, so each one is clickable.
#let weblink(address, name) = link(address)[#name]

// Every vote in the deck is put through this, so they all look and read the
// same: one box, one heading, the motion inside, and any threshold as a note.
#let vote(motion, note: none) = block(width: 100%)[
  #highlight-box(title: [ALL IN FAVOUR RAISE THEIR HANDS])[
    #motion

    #if note != none [#note]
  ]
]

// ──────────────────────────────────────────────────────────────────────────
//  AGENDA
//  The repeated agenda tints the items already covered, so the list fills in
//  as the meeting goes on. `covered` counts the finished items.
// ──────────────────────────────────────────────────────────────────────────

#let agenda-items = (
  [Opening of Meeting & Apologies],
  [Confirmation of Minutes of previous AGM],
  [Annual Report],
  [Treasurer's Report],
  [Election of New Executives],
  [Notice(s) of Motions],
  [Conclusion],
)

#let agenda(covered: 0) = enum(
  ..agenda-items.enumerate().map(((i, item)) => if i < covered { alert(item) } else { item }),
)

// ══════════════════════════════════════════════════════════════════════════

#show: calmly.with(
  config-info(
    title: [Annual General Meeting 2026],

    author: [University of Auckland Linux user Group],
    date: agm-date,
    institution: [University of Auckland],
  ),
  colortheme: "paper",
)

#title-slide(extra: [
  #text(weight: "medium")[#agm-time · #agm-venue]
])

== Agenda
#agenda(covered: 0)

// ──────────────────────────────────────────────────────────────────────────
= Pre-requisites

== Why hold the Annual General Meeting (AGM)?
- Required by law: the Club is an incorporated society and has to hold one every year.
- Transparency and accountability: the Executive reports back to the membership.
- Every member gets a voice: on the reports, the elections and any notice of motion.

== The minutes
The Secretary shall record this AGM's minutes.

What the minutes are for:
- Recording the decisions the meeting makes
- Recording concerns and issues raised by members
- Keeping an attendee list

// ──────────────────────────────────────────────────────────────────────────
= Opening of Meeting

== The Club
- Official name: University of Auckland Linux User Group
- Abbreviation: #club-abbr
- Type of organisation: Incorporated Society
- Objects: to educate students about, and promote, GNU/Linux and its surrounding Free and Open Source Software (FOSS) ecosystem
- Financial year: 1 June to 31 May

== Links
#three-col[
  Constitution \
  #weblink(constitution-link, [lug.ac/constitution])
][
  Website \
  #weblink(site-link, [lug.ac])
][
  GitHub Org \
  #weblink(github-link, [github.com/lug-uoa])
]

#focus-slide[
  #text(size: 0.75em)[University of Auckland Linux User Group]

  #v(0.4em)
  Annual General Meeting (AGM) 2026

  #v(0.4em)
  *We declare this meeting open!*

  #v(0.8em)
  #text(size: 0.5em)[#agm-date.display("[month repr:long] [day], [year]") · #agm-time]
]

// ──────────────────────────────────────────────────────────────────────────
= Voting Rights

== Definitions
- Member: anyone who has registered to be part of the club
- Executive member: a member who has previously been appointed to take on additional roles within the club
- Motion: an issue discussed at the meeting that has been formalised and needs votes from members to move the meeting forward
- Voting: the democratic process of moving a motion forward

== Your right to vote
Every financial member present is entitled to one (1) vote per issue.

$ f("Exec") = f("Non-exec") $

- Raise one physical or Zoom hand to vote
- The President holds a deliberate vote, and a casting vote in the event of a tie

== Quorum and thresholds
- *Quorum:* a minimum of five (5) Management Committee members. If no quorum is present thirty (30) minutes after the time appointed, the meeting stands adjourned for one (1) week.
- *Decisions:* at least two-thirds of the attendees must have voted
- *Constitutional changes:* seventy-five percent (75%) of those present and entitled to vote (Special Resolution)

#soft-divider()

#muted[All of this is in the constitution: #weblink(constitution-link, [lug.ac/constitution])]

// ──────────────────────────────────────────────────────────────────────────
= Apologies

== Apologies
- Missing members: apologies received are recorded in the minutes

#v(0.5em)

#vote([To accept the apologies as recorded.])

// ──────────────────────────────────────────────────────────────────────────
== Agenda
#agenda(covered: 1)

= Confirmation of Minutes

== Previous AGM minutes
The previous Annual General Meeting was the 2025 Extraordinary AGM, held in December 2025.

- Minutes submitted by: the Secretary
- Minutes available at: #weblink(minutes-link, [tinyurl.com/lug-uoa-2025-eagm-minutes])

#v(0.5em)

#vote([To confirm the minutes of the previous Annual General Meeting.])

== What the previous meeting decided
- Amendment A: the AGM must be held within six (6) months of the end of the financial year, before the end of semester date in the university calendar
- Amendment B: the financial year starts on the 1st of June each year
- Amendment C: removal from the Management Committee by a majority vote under a Privileges Accountability Bylaw, and general meetings may be called by members who are not on the Executive Committee
- Amendment D: typo fixes (_honourary_ to _honorary_)

All four are now in the constitution at #weblink(constitution-link, [lug.ac/constitution]).

== Executive confirmed at the previous meeting
#two-col[
  - *President:* Thomas Dickson
  - *Treasurer (Vice President):* Parmjot Singh
  - *Secretary:* Ben Wang
][
  - *General Executive Member:* Dylan Shearer
  - *General Executive Member:* Jiaxin Yan
  - *Auditor:* Jiaxin Yan
]

//──────────────────────────────────────────────────────────────────────────
== Agenda
#agenda(covered: 2)

= Annual Report

== Annual Report 2026
What the report covers:
- Objects of the Club
- Meetings and Events Held
- Board and Officers for the Year
- Financial Summary
- Strategic Planning and Future Outlook
- Acknowledgements

Available at: #weblink(annual-report-link, [tinyurl.com/lug-uoa-2026-agm-annual-report])

#vote([To accept the Annual Report.])

// ──────────────────────────────────────────────────────────────────────────
== Agenda
#agenda(covered: 3)

= Treasurer's Report

== Treasurer's Report
- Statement of Income and Expenditure, Assets and Liabilities for the year
- The auditor's report is attached to the financial report

#vote([To accept the Treasurer's Report.])

// ──────────────────────────────────────────────────────────────────────────
== Agenda
#agenda(covered: 4)

= Election of New Executives

== Positions
The Executive positions are the same as last time:

- President
- Treasurer (Vice President)
- Secretary
- General Executive Member (multiple)

The meeting also appoints the Auditor.

#muted[Amendment A, tabled later today, would formalise more Executive roles (Events, Collaborations and Projects).]

== Motions
- To elect the new Executive
- To appoint the Auditor

#v(0.4em)

#vote(
  [To elect the new Executive and to appoint the Auditor.],
  note: [Each motion is voted on separately.],
)

// ──────────────────────────────────────────────────────────────────────────
== Agenda
#agenda(covered: 5)

= Notice(s) of Motions

== Amendment A

#if notice-submitter != none [
  Submitted by: #notice-submitter \
]
Date submitted: #notice-date.display("[month repr:long] [day], [year]")

Modify clause 4 in section 8 to the following:

```diff
(4) Management of the Club shall be vested in the Management Committee elected by the members at the Annual General Meeting and consisting of:

1. President
2. Secretary
3. Treasurer (Vice President)
4. Events Executive
- 5. General Executive Member (multiple)
+ 5. Collaborations Executive
+ 6. General Executive Member (multiple)
```

#pagebreak()

=== Rationale
_This amendment formalises the Events Executive and Collaborations Executive roles. General Executive Member(s) are currently responsible for both of these tasks, however no single Executive Member is responsible for hosting events or maintaining collaborations with other organisations & the wider open-source community._

== Vote on Amendment A
#vote(
  [To adopt Amendment A as tabled.],
  note: [Changing the constitution needs a seventy-five percent (75%) majority of those present and entitled to vote (section 14).],
)

== Sub-amendment A.1: Projects Executive

Modify point 6, clause 4, section 8 to include the following:

```diff
- 6. General Executive Member (multiple)
+ 6. Projects Executive
+ 7. General Executive Member (multiple)
```

=== Rationale
The same reason as Amendment A, applied to Projects.

== Vote on Sub-amendment A.1
#vote(
  [To adopt Sub-amendment A.1.],
  note: [Same threshold as Amendment A: seventy-five percent (75%) of those present and entitled to vote (section 14).],
)

== Amendment A: final version

With the amendment and the sub-amendment carried, clause 4 in section 8 reads:

```
(4) Management of the Club shall be vested in the Management Committee elected by the members at the Annual General Meeting and consisting of:

1. President
2. Secretary
3. Treasurer (Vice President)
4. Events Executive
5. Collaborations Executive
6. Projects Executive
7. General Executive Member (multiple)
```
// ──────────────────────────────────────────────────────────────────────────
== Agenda
#agenda(covered: 6)

#ending-slide(
  title: [Thank you],
  subtitle: [Please enjoy the food!],
)

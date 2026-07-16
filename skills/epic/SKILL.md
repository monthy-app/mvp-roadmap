---
name: epic
description: Kick off one roadmap epic from its linked PRD section — verify the spec is still true, order the stories, name the shippable artifact the epic exits with, and define the demo that proves it done. Use when the user says "/epic E3", "start epic 2", "kick off E5", "begin the next epic", or asks what to build next against a ROADMAP.md.
---

# Epic kickoff

Start an epic from its spec, never by re-interviewing. The PRD section the epic links to *is* the design; this skill's job is to verify it still holds, turn it into an execution plan, and get building. It never asks what the section already answers.

## Steps

1. **Locate and read.** Find the epic in `ROADMAP.md`. In the single-file layout its stories are inline; in the thin-index layout follow the epic's link to `docs/epics/E<n>-<slug>.md`. Read the epic's stories, its linked PRD section in full, and the roadmap index (dependencies and the MVP line are context). If earlier epics it depends on are unticked, surface that before anything else.
2. **Verify the spec is decision-complete.** For every story the section must answer: what exactly, how it is verified, and what it depends on. List the gaps precisely — a gap is a missing decision, not a missing implementation detail.
3. **Grill only the gaps.** One decision per turn through the structured question tool (plain-text lettered fallback elsewhere), a recommendation every time. Fold each answer into the PRD section non-accretively — rewrite as if it were always the decision — before building on it.
4. **Kick off.** Produce the execution plan:
   - stories ordered by dependency;
   - the artifact this epic exits with — above the MVP line something shippable (pushed repo, published package, live URL, cut release), below it the feedback loop it opens (who uses it, what signal);
   - the demo that proves the epic done (hand to `/demo-ideas` when it ships);
   - which stories are well-specified enough to hand to `/delegate`.
5. **Confirm the plan with the user, then build** — small commits, one story's worth per commit where possible.
6. **Never tick.** When work lands, `/wrap-up` proposes the ticks with evidence; a kickoff changes no checkboxes.

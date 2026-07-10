# Example: Offsites

This is a fully worked instance of the pattern this kit describes — not another abstract template, but what it actually looks like once it's running.

**The scenario:** a small Operations team planning a Q3 offsite, tracked across the same three tools as the rest of this kit:

- **Linear** — Operations team → Offsites project, with three issues: Book venue, Approve budget, Track RSVPs
- **GitHub** (`offsites` repo) — planning documents Claude produces along the way, like [`venue-comparison.md`](venue-comparison.md)
- **Neon** (`offsites` database) — [`schema.sql`](schema.sql) tracks RSVP counts and budget lines; [`seed.sql`](seed.sql) has a few sample rows so the tables aren't empty on first look

**The Claude Project instructions for this example** already exist — see the "Quick start — copy this as-is" section in [`/project-template/claude-project-instructions.md`](../project-template/claude-project-instructions.md). That's the canonical copy; nothing here duplicates it.

**To try this yourself,** paste this into a new chat with Claude:

> I want to set up the "Offsites" example from the Claude, Built In starter kit (github.com/saaswise-cc/claude-builtin/examples/offsites). Walk me through it step by step: a new Linear team called Operations with an Offsites project (issues for booking the venue, approving the budget, and tracking RSVPs), a Neon database called `offsites` for the RSVP/budget numbers, and the Claude Project instructions from the kit's template filled in for this example. Tell me clearly whenever something needs Claude Code instead of this chat, and ask before creating anything — I want to confirm each piece as we go.

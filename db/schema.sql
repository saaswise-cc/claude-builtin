-- claude-builtin: minimal schema for tracking public engagement
-- (shares, reactions, feedback). No user accounts, no auth layer,
-- no speculative analytics. Rationale for these choices lives in
-- the project's Linear workspace, attached to the schema issue —
-- this file is the finalized, ready-to-run artifact.

-- One row per time the project gets shared somewhere public.
create table shares (
    id            bigint generated always as identity primary key,
    shared_at     timestamptz not null default now(),
    platform      text not null,          -- e.g. 'twitter', 'hacker_news', 'reddit', 'linkedin'
    url           text,                   -- link to the share/post itself, if there is one
    note          text                    -- optional free-text context ("posted by X in Y thread")
);

-- One row per reaction (lightweight, anonymous, no user accounts).
create table reactions (
    id            bigint generated always as identity primary key,
    reacted_at    timestamptz not null default now(),
    reaction_type text not null,          -- e.g. 'star', 'like', 'fork', 'thumbs_up', 'thumbs_down'
    source        text not null,          -- e.g. 'github', 'twitter', 'linear_public_view'
    share_id      bigint references shares(id)  -- optional: which share this reaction came from, if known
);

-- One row per piece of feedback (an issue, a comment, a DM someone forwarded, etc).
create table feedback (
    id            bigint generated always as identity primary key,
    submitted_at  timestamptz not null default now(),
    source        text not null,          -- e.g. 'github_issue', 'email', 'linear_comment', 'social'
    body          text not null,          -- the feedback itself
    sentiment     text,                   -- optional, manually tagged: 'positive' | 'negative' | 'mixed' | 'neutral'
    url           text                    -- link back to the original, if there is one
);

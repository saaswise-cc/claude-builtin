-- Offsites example schema
-- Tracks RSVPs and budget for a single offsite event.
-- Distinct from the kit's own root /db/schema.sql, which tracks this
-- project's public engagement (shares, reactions, feedback) — a
-- different purpose entirely.

create table rsvps (
    id serial primary key,
    invitee_name text not null,
    status text not null check (status in ('invited', 'yes', 'no', 'maybe')),
    responded_at timestamptz,
    notes text
);

create table budget_lines (
    id serial primary key,
    category text not null,       -- e.g. 'venue', 'catering', 'travel'
    description text not null,
    estimated_cost numeric(10, 2) not null,
    actual_cost numeric(10, 2),
    approved boolean not null default false
);

-- Simple view for a running RSVP count, since that's the number
-- most often referenced in planning conversations.
create view rsvp_summary as
select
    status,
    count(*) as count
from rsvps
group by status;

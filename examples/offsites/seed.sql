-- Sample data for the offsites example — run after schema.sql.
-- Fictional names and numbers, just enough to make the tables feel real.

insert into rsvps (invitee_name, status, responded_at) values
    ('Jordan Lee', 'yes', now() - interval '5 days'),
    ('Priya Nandan', 'yes', now() - interval '4 days'),
    ('Sam Okafor', 'maybe', now() - interval '3 days'),
    ('Taylor Vance', 'no', now() - interval '2 days'),
    ('Morgan Reyes', 'invited', null);

insert into budget_lines (category, description, estimated_cost, actual_cost, approved) values
    ('venue', 'Riverside conference center, 2-day rental', 4200.00, null, false),
    ('catering', 'Lunch + coffee breaks, 25 people', 1800.00, null, false),
    ('travel', 'Group ground transport', 600.00, null, false);

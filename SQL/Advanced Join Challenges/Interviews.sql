select con.contest_id, hacker_id, name, sum(total_submissions), sum(total_accepted_submissions), sum(total_views), sum(total_unique_views) 
from contests con
join colleges cl on con.contest_id = cl.contest_id
join challenges Ch on cl.College_id = ch.College_id

left join 
(select challenge_id, sum(total_views) total_views, sum(total_unique_views) total_unique_views 
from view_Stats 
group by challenge_id ) vw
on vw.challenge_id= ch.challenge_id

left join 
(select challenge_id, sum(total_submissions) total_submissions, sum(total_accepted_submissions) total_accepted_submissions 
from Submission_Stats group by challenge_id) sub
on sub.challenge_id = ch.Challenge_id
group by con.contest_id, hacker_id, name
order by con.contest_id;

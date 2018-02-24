select h.hacker_id, h.name from hackers h
join submissions s on h.hacker_id = s.hacker_id
join challenges c on s.challenge_id = c.challenge_id
join difficulty d on d.difficulty_level = c.difficulty_level
group by h.hacker_id, h.name
having sum(case when s.score=d.score then 1 else 0 end)>1
order by sum(case when s.score=d.score then 1 else 0 end) desc, h.hacker_id asc;

select h.hacker_id, h.name, sum(scr) total from 

(select s.hacker_id, max(s.score) scr 
from submissions s
group by s.challenge_id, s.hacker_id) mxs

join hackers h on h.hacker_id = mxs.hacker_id
group by h.hacker_id, h.name
having total > 0
order by total desc, h.hacker_id;

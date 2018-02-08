select submission_date sd, unique_hackers, hacker_id top_id, name
    from (select distinct submission_date
        from submissions) dates   
        join (select submission_date, count(distinct hacker_id) unique_hackers
            from submissions
            where hacker_id in (select hacker_id 
                from (select hacker_id, min(submission_date) last_submission_date
                    from submissions s1
                    where hacker_id in (select distinct hacker_id
                        from submissions
                        where submission_date = (select min(submission_date) 
                            from submissions))
                            and not exists(select 1
                                from submissions s2
                                where s2.hacker_id = s1.hacker_id and 1 = datediff(s2.submission_date, s1.submission_date))
                                group by hacker_id) daily
                                where submission_date <= last_submission_date)
                                group by submission_date) dailyunique 
                                using(submission_date)
                                join(select submission_date, min(hacker_id) hacker_id
                                    from(select submission_date, hacker_id, total_submissions
                                        from(select submission_date, hacker_id, count(*) total_submissions
                                            from submissions
                                            group by submission_date, hacker_id) totals
                                            join(select submission_date, max(total_submissions) max_submissions
                                                from (select submission_date, hacker_id, count(*) total_submissions
                                                    from submissions
                                                    group by submission_date, hacker_id) totals
                                                    group by submission_date) MaxSubmissions using(submission_date)
                                                    where total_submissions = max_submissions
                                                    group by submission_date, hacker_id) top
                                                    group by submission_date) top using(submission_date)
                                                        join hackers using(hacker_id)
                                                        order by sd

-- player analysis 
With CTE as (
	Select player_name, sum(won) as wins, count(won) as matches, 
	CASE WHEN sum(svpt) = 0 THEN 0
	ELSE (sum(ace) * 1.0 / sum(svpt)) * 100 END as ace_percentage,
	avg(first_sv_pct) * 100 as first_serve_percentage,
	avg(first_sv_win_pct) * 100 as first_serve_win_percentage,
	avg(second_sv_win_pct) * 100 as second_sv_win_percentage,
	avg(total_sv_win_pct) * 100 as total_serve_win_percentage,
	avg(bp_save_pct) * 100 as break_point_save_percentage
	From cleaned_match_stats cms 
	Group By player_name
)
Select player_name, wins, matches,
round(ace_percentage, 2) as ace_percentage,
round(first_serve_percentage, 2) as first_serve_percentage,
round(first_serve_win_percentage, 2) as first_serve_win_percentage,
round(second_sv_win_percentage, 2) as second_sv_win_percentage,
round(total_serve_win_percentage, 2) as total_serve_win_percentage,
round(break_point_save_percentage, 2) as break_point_save_percentage,
round((cast(wins as float) / matches) * 100, 2) as win_percentage
From CTE

--player surface analysis 
With CTE as (
	Select player_name, surface, sum(won) as wins, count(won) as matches, 
	CASE WHEN sum(svpt) = 0 THEN 0
	ELSE (sum(ace) * 1.0 / sum(svpt)) * 100 END as ace_percentage,
	avg(first_sv_pct) * 100 as first_serve_percentage,
	avg(first_sv_win_pct) * 100 as first_serve_win_percentage,
	avg(second_sv_win_pct) * 100 as second_sv_win_percentage,
	avg(total_sv_win_pct) * 100 as total_serve_win_percentage,
	avg(bp_save_pct) * 100 as break_point_save_percentage
	From cleaned_match_stats cms 
	Group By player_name, surface
)
Select player_name, surface, wins, matches,
round(ace_percentage, 2) as ace_percentage,
round(first_serve_percentage, 2) as first_serve_percentage,
round(first_serve_win_percentage, 2) as first_serve_win_percentage,
round(second_sv_win_percentage, 2) as second_sv_win_percentage,
round(total_serve_win_percentage, 2) as total_serve_win_percentage,
round(break_point_save_percentage, 2) as break_point_save_percentage,
round((cast(wins as float) / matches) * 100, 2) as win_percentage
From CTE



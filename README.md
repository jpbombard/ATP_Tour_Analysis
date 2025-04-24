Analysis of ATP Tour matches over the past 10 years using Jeff Sackman's Github repository
https://github.com/JeffSackmann/tennis_atp
- Built tables in SQL and imported CSVs
- Loaded data into Jupyter Notebook using pandas read_sql_query function
- Cleaned data by removing any rows with missing data, and removing all international tournament matches such as Davis Cup or Olympics
- Split each row which had seperate winner and loser statistics into two individual rows with standardized statistics columns and a win/loss boolean column
- Performed T-Tests and ANOVA testing to determine which service statistics correlated most with winning matches
- Group data by player and surface and analyzed the differences between service statistic rates across different surfaces
- Loaded data into Tableau to create visualizations
  - Tableau Public link: https://public.tableau.com/app/profile/julian.bombard/viz/ATPAnalysis/Story

File Structure
- analysis: jupyer notebooks with win correlation analysis and surface analysis
- csvs: all csvs used for this project, including original files in yearly folder, and transformed data exported from notebooks
- database: database created in SQL
- etl: extract transform load. data wrangling in jupyter notebooks using pandas
- excel: original dataset and exported cleaned data in excel files. Replicated surface analysis using PowerQuery
- scripts: SQLite scripts written to create tables. Exploratory data analysis. Replicated player and surface groupings in SQL
- word: word document required for capstone project submission

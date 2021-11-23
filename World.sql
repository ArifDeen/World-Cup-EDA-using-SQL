# Number of matches played each year from 1930   
SELECT 
    count(Round)
FROM
    worldcupresults; 
    
# Total goals scored for each tournament year
SELECT 
    Year, SUM(HomeGoals) + SUM(AwayGoals) AS TotalGoals
FROM
    worldcupresults
GROUP BY Year;

# All teams who have reached finals and how many times
(SELECT DISTINCT
    HomeTeam, COUNT(HomeTeam)
FROM
    worldcupresults
WHERE
    Round = 'Final'
GROUP BY HomeTeam) UNION ALL (SELECT DISTINCT
    AwayTeam, COUNT(AwayTeam)
FROM
    worldcupresults
WHERE
    Round = 'Final'
GROUP BY AwayTeam);

# All teams who have reached Semifinals and how many times
(SELECT DISTINCT
    HomeTeam, COUNT(HomeTeam)
FROM
    worldcupresults
WHERE
    Round = 'Semi-finals'
GROUP BY HomeTeam) UNION ALL (SELECT DISTINCT
    AwayTeam, COUNT(AwayTeam)
FROM
    worldcupresults
WHERE
    Round = 'Semi-finals'
GROUP BY AwayTeam);

# How many goals and average goals scored in all Semi-finals
SELECT 
    SUM(HomeGoals) + SUM(AwayGoals) AS TotalGoals
FROM
    worldcupresults
WHERE
    Round = 'Semi-finals';
    
SELECT 
    AVG(HomeGoals) + AVG(AwayGoals) AS TotalGoals
FROM
    worldcupresults
WHERE
    Round = 'Semi-finals';    
    
# How many goals and average goals scored in all Quarter-finals  
SELECT 
    SUM(HomeGoals) + SUM(AwayGoals) AS TotalGoals
FROM
    worldcupresults
WHERE
    Round = 'Quarter-finals';  

SELECT 
    AVG(HomeGoals) + AVG(AwayGoals) AS TotalGoals
FROM
    worldcupresults
WHERE
    Round = 'Quarter-finals';  
    
# How many goals and average goals scored in all Finals   
SELECT 
    SUM(HomeGoals) + SUM(AwayGoals) AS TotalGoals
FROM
    worldcupresults
WHERE
    Round = 'Final';  
  
SELECT 
    AVG(HomeGoals) + AVG(AwayGoals) AS TotalGoals
FROM
    worldcupresults
WHERE
    Round = 'Final';  

# How many matches were played outside quarter-finals and above
SELECT 
    count(Round)
FROM
    worldcupresults where Round = 'Semi-finals';
  
SELECT 
    count(Round)
FROM
    worldcupresults where Round = 'Final';  
    
#  New column for each outcome of every match
ALTER TABLE worldcupresults
ADD Outcome CHAR(10);  

SELECT 
    HomeGoals,
    AwayGoals,
    CASE
        WHEN HomeGoals > AwayGoals THEN 'H'
        WHEN AwayGoals > HomeGoals THEN 'A'
        WHEN HomeGoals = AwayGoals THEN 'D'
    END AS Outcome
FROM
    worldcupresults; 
    
    
    


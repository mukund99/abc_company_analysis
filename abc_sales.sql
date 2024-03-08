-- Player Loyalty Points On 2nd Oct 2022 For Slot 1 (12am - 12pm)
SELECT a.User_ID,((0.01*deposit_amount)+(0.005*withdrawal_amount)+
(0.001*GREATEST((deposit_amount-withdrawal_amount),0))+(0.2*total_games)) AS loyalty_points
FROM (SELECT User_Id,SUM(Games_Played) AS total_games FROM abc_sales.user_gameplay_data
WHERE DATE(Date_time) = '2022-10-02' AND TIME(Date_time) BETWEEN '00:00:00'
AND '11:59:00' GROUP BY User_Id) AS a JOIN 
(SELECT User_Id,SUM(Amount) AS deposit_amount,COUNT(*) AS num_of_deposits
FROM abc_sales.deposit_data WHERE DATE(Date_time) = '2022-10-02' AND TIME(Date_time) BETWEEN '00:00:00'
AND '11:59:00' GROUP BY User_Id) AS b ON a.User_Id = b.User_Id JOIN
(SELECT User_Id,SUM(Amount) AS withdrawal_amount,COUNT(*) AS num_of_withdrawals
FROM abc_sales.withdrawal_data WHERE DATE(Date_time) = '2022-10-02' AND 
TIME(Date_time) BETWEEN '00:00:00' AND '11:59:00'
GROUP BY User_Id) AS c ON b.User_Id = c.User_Id ORDER BY loyalty_points DESC;

-- Player Loyalty Points On 16th Oct 2022 For Slot 2 (12pm - 12am)
SELECT a.User_ID,((0.01*deposit_amount)+(0.005*withdrawal_amount)+
(0.001*GREATEST((deposit_amount-withdrawal_amount),0))+(0.2*total_games)) AS loyalty_points
FROM (SELECT User_Id,SUM(Games_Played) AS total_games FROM abc_sales.user_gameplay_data
WHERE DATE(Date_time) = '2022-10-16' AND TIME(Date_time) BETWEEN '12:00:00'
AND '23:59:00' GROUP BY User_Id) AS a JOIN 
(SELECT User_Id,SUM(Amount) AS deposit_amount,COUNT(*) AS num_of_deposits
FROM abc_sales.deposit_data WHERE DATE(Date_time) = '2022-10-16' AND TIME(Date_time) BETWEEN '12:00:00'
AND '23:59:00' GROUP BY User_Id) AS b ON a.User_Id = b.User_Id JOIN
(SELECT User_Id,SUM(Amount) AS withdrawal_amount,COUNT(*) AS num_of_withdrawals
FROM abc_sales.withdrawal_data WHERE DATE(Date_time) = '2022-10-16' AND 
TIME(Date_time) BETWEEN '12:00:00' AND '23:59:00'
GROUP BY User_Id) AS c ON b.User_Id = c.User_Id ORDER BY loyalty_points DESC;

-- Player Loyalty Points On 18th Oct 2022 For Slot 1 (12am - 12pm)
SELECT a.User_ID,((0.01*deposit_amount)+(0.005*withdrawal_amount)+
(0.001*GREATEST((deposit_amount-withdrawal_amount),0))+(0.2*total_games)) AS loyalty_points
FROM (SELECT User_Id,SUM(Games_Played) AS total_games FROM abc_sales.user_gameplay_data
WHERE DATE(Date_time) = '2022-10-18' AND TIME(Date_time) BETWEEN '00:00:00'
AND '11:59:00' GROUP BY User_Id) AS a JOIN 
(SELECT User_Id,SUM(Amount) AS deposit_amount,COUNT(*) AS num_of_deposits
FROM abc_sales.deposit_data WHERE DATE(Date_time) = '2022-10-18' AND TIME(Date_time) BETWEEN '00:00:00'
AND '11:59:00' GROUP BY User_Id) AS b ON a.User_Id = b.User_Id JOIN
(SELECT User_Id,SUM(Amount) AS withdrawal_amount,COUNT(*) AS num_of_withdrawals
FROM abc_sales.withdrawal_data WHERE DATE(Date_time) = '2022-10-18' AND 
TIME(Date_time) BETWEEN '00:00:00' AND '11:59:00'
GROUP BY User_Id) AS c ON b.User_Id = c.User_Id ORDER BY loyalty_points DESC;

-- Player Loyalty Points On 26th Oct 2022 For Slot 2 (12pm - 12am)
SELECT a.User_ID,((0.01*deposit_amount)+(0.005*withdrawal_amount)+
(0.001*GREATEST((deposit_amount-withdrawal_amount),0))+(0.2*total_games)) AS loyalty_points
FROM (SELECT User_Id,SUM(Games_Played) AS total_games FROM abc_sales.user_gameplay_data
WHERE DATE(Date_time) = '2022-10-26' AND TIME(Date_time) BETWEEN '12:00:00'
AND '23:59:00' GROUP BY User_Id) AS a JOIN 
(SELECT User_Id,SUM(Amount) AS deposit_amount,COUNT(*) AS num_of_deposits
FROM abc_sales.deposit_data WHERE DATE(Date_time) = '2022-10-26' AND TIME(Date_time) BETWEEN '12:00:00'
AND '23:59:00' GROUP BY User_Id) AS b ON a.User_Id = b.User_Id JOIN
(SELECT User_Id,SUM(Amount) AS withdrawal_amount,COUNT(*) AS num_of_withdrawals
FROM abc_sales.withdrawal_data WHERE DATE(Date_time) = '2022-10-26' AND 
TIME(Date_time) BETWEEN '12:00:00' AND '23:59:00'
GROUP BY User_Id) AS c ON b.User_Id = c.User_Id ORDER BY loyalty_points DESC;

-- Ranking Players On Loyalty Points For the Month Of October
SELECT a.User_ID,((0.01*deposit_amount)+(0.005*withdrawal_amount)+
(0.001*GREATEST((deposit_amount-withdrawal_amount),0))+(0.2*total_games)) AS loyalty_points
FROM (SELECT User_Id,SUM(Games_Played) AS total_games FROM abc_sales.user_gameplay_data
GROUP BY User_Id) AS a JOIN 
(SELECT User_Id,SUM(Amount) AS deposit_amount,COUNT(*) AS num_of_deposits
FROM abc_sales.deposit_data GROUP BY User_Id) AS b ON a.User_Id = b.User_Id JOIN
(SELECT User_Id,SUM(Amount) AS withdrawal_amount,COUNT(*) AS num_of_withdrawals
FROM abc_sales.withdrawal_data GROUP BY User_Id) AS c ON b.User_Id = c.User_Id ORDER BY loyalty_points DESC,total_games DESC;

-- Average Deposit Amount For the Month Of October
SELECT ROUND(AVG(Amount),0) AS average_deposit_amount FROM abc_sales.deposit_data;

-- Average Deposit Amount Per User For the Month Of October
SELECT ROUND(AVG(total_deposit_amount)/COUNT(*),0) AS average_deposit_per_user FROM
(SELECT SUM(Amount) AS total_deposit_amount FROM abc_sales.deposit_data
GROUP BY User_Id) AS a;

-- Average Number Of Games Player Per User
SELECT ROUND(AVG(total_games),0) as games_per_user FROM (SELECT SUM(Games_Played) AS total_games FROM abc_sales.user_gameplay_data
GROUP BY User_Id) AS a;

-- Top 50 Players
SELECT d.User_ID FROM (SELECT a.User_ID,((0.01*deposit_amount)+(0.005*withdrawal_amount)+
(0.001*GREATEST((deposit_amount-withdrawal_amount),0))+(0.2*total_games)) AS loyalty_points
FROM (SELECT User_Id,SUM(Games_Played) AS total_games FROM abc_sales.user_gameplay_data
GROUP BY User_Id) AS a JOIN 
(SELECT User_Id,SUM(Amount) AS deposit_amount,COUNT(*) AS num_of_deposits
FROM abc_sales.deposit_data GROUP BY User_Id) AS b ON a.User_Id = b.User_Id JOIN
(SELECT User_Id,SUM(Amount) AS withdrawal_amount,COUNT(*) AS num_of_withdrawals
FROM abc_sales.withdrawal_data GROUP BY User_Id) AS c ON b.User_Id = c.User_Id ORDER BY loyalty_points DESC,total_games DESC) AS d
LIMIT 50;
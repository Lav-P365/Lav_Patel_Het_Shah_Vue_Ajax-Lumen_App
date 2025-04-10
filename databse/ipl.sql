-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 07, 2025 at 08:13 PM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: ipl
--

-- --------------------------------------------------------

--
-- Table structure for table owners
--

CREATE TABLE owners (
  id int NOT NULL,
  owner_name varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  bio varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table owners
--

INSERT INTO owners (id, owner_name, bio) VALUES
(1, 'Narayanaswami Srinivasan', 'Narayanaswami Srinivasan is a prominent Indian industrialist and the owner of CSK. He has had a decorated career in cricket administration, having previously served as the Chairman of the International Cricket Council (ICC) and as the President of the Board of Control for Cricket in India (BCCI).'),
(2, 'Mukesh Ambani', 'MI owner Mukesh Ambani is not just known for his involvement in cricket. He is the chairman and managing director of Reliance Industries, India\'s most valuable company with a market capitalisation of over Rs 16 lakh crore.'),
(3, 'Shah Rukh Khan', 'Known for his trademark gelled spiked up crew cut with sunglasses, Shah Rukh Khan (SRK) is an Indian Bollywood movie star, movie producer, magazine model, showman, public speaker, author, philanthropist and television host/personality working predominantly in Hindi cinema.'),
(4, 'Kavya Maran', 'Kavya Maran (born 3 November 1991) is an Indian businesswoman, co-owner and head of Sunrisers Hyderabad in Indian Premier League (IPL) and Sunrisers Eastern Cape in SA20 League, and Executive Director of Sun TV Network Limited. She is the daughter of Kalanithi Maran, the chairman and founder of the Sun Group.'),
(5, 'GMR Group & JSW Sports', 'The Delhi Capitals (DC) are co-owned by two of India\'s leading industrial giants - the GMR Group and the JSW Sports. The GMR Group, known for its expertise in infrastructure and aviation, brings financial muscle and a global vision to the franchise.'),
(6, 'United Spirits', 'United Spirits Limited, abbreviated to USL, is an Indian alcoholic beverages company, and the world\'s second-largest spirits company by volume. It is a subsidiary of Diageo, and is headquartered at UB Tower in Bangalore, Karnataka. USL exports its products to over 37 countries.'),
(7, 'RP Sanjiv Goenka Group', 'Formed in 2014, RPSG Sports came to being with an unwavering goal - breeding excellence within the sporting community of India. Having made multiple investments, the current portfolio of RPSG Sports includes the pathbreaking Lucknow Super Giants, the iconic Mohun Bagan Super Giant football club and the exciting Durban\'s Super Giants.'),
(8, 'CVC Capital Partners and Torrent Group', 'CVC Capital Partners, a global private equity firm, owns the Gujarat Titans (GT). In 2021, CVC Capital Partners acquired the Gujarat franchise for ₹5,625 crore. The company has investments in various industries, including sports, healthcare, and financial services.'),
(9, 'Manoj Badale, Lachlan Murdoch, and RedBird Capital Partners', 'Manoj Badale: A British Indian businessman and venture capitalist, born in Dhule, Maharashtra, and co-founder of Blenheim Chalcot, a venture builder firm. He\'s been associated with Rajasthan Royals since the very first auction and makes most of the major decisions.\r\n\r\nLachlan Murdoch: A key minority stakeholder in the franchise. \r\n\r\nRedBird Capital Partners: Another key minority stakeholder in the franchise. '),
(10, 'Preity Zinta', 'A well-known Bollywood actress, she is also a co-owner of the Punjab Kings, and the owner of the South-African T20 Global League cricket team Stellenbosch Kings. ');

-- --------------------------------------------------------

--
-- Table structure for table teams
--

CREATE TABLE teams (
  id int NOT NULL,
  team_name varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  home_city varchar(200) NOT NULL,
  owner_id int NOT NULL,
  founded_year year NOT NULL,
  team_image varchar(200) NOT NULL,
  created_at timestamp NOT NULL,
  update_at timestamp NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table teams
--

INSERT INTO teams (id, team_name, home_city, owner_id, founded_year, team_image, created_at, update_at) VALUES
(1, 'Chennai Super Kings (CSK)', 'Chennai, Tamil Nadu', 1, '2008', 'csk.png', '2025-04-07 19:56:49', '2025-04-07 19:56:49'),
(2, 'Mumbai Indians (MI)', 'Mumbai, Maharashtra', 2, '2008', 'mi.jpg', '2025-04-07 19:58:58', '2025-04-07 19:58:58'),
(3, 'Kolkata Knight Riders (KKR)', 'Kolkata', 3, '2007', 'kkr.png', '2025-04-07 19:58:20', '2025-04-07 19:58:20'),
(4, 'Sunrisers Hyderabad (SRH)', 'Hyderabad, Telangana', 4, '2012', 'srh.png', '2025-04-07 20:00:48', '2025-04-07 20:00:48'),
(5, 'Delhi Capitals (DC)', 'Delhi', 5, '2008', 'dc.png', '2025-04-07 19:57:43', '2025-04-07 19:57:43'),
(6, 'Royal Challengers Bengaluru (RCB)', 'Bengaluru, Karnataka', 6, '2007', 'rcb.jpg', '2025-04-07 19:59:29', '2025-04-07 19:59:29'),
(7, 'Lucknow Super Giants (LSG)', 'Lucknow, Uttar Pradesh', 7, '2021', 'lsg.jpg', '2025-04-07 19:58:41', '2025-04-07 19:58:41'),
(8, 'Gujarat Titans (GT)', 'Ahmedabad, Gujarat', 8, '2021', 'gt.png', '2025-04-07 19:58:03', '2025-04-07 19:58:03'),
(9, 'Rajasthan Royals (RR)', 'Jaipur, Rajasthan', 9, '2008', 'rr.png', '2025-04-07 20:00:11', '2025-04-07 20:00:11'),
(10, 'Punjab Kings (PBKS)', 'Mohali, Punjab', 10, '2007', 'pbks.jpg', '2025-04-07 19:59:14', '2025-04-07 19:59:14');

-- --------------------------------------------------------

--
-- Table structure for table users
--

CREATE TABLE users (
  id int NOT NULL,
  username varchar(200) NOT NULL,
  password varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table owners
--
ALTER TABLE owners
  ADD PRIMARY KEY (id);

--
-- Indexes for table teams
--
ALTER TABLE teams
  ADD PRIMARY KEY (id);

--
-- Indexes for table users
--
ALTER TABLE users
  ADD PRIMARY KEY (id);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table owners
--
ALTER TABLE owners
  MODIFY id int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table teams
--
ALTER TABLE teams
  MODIFY id int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table users
--
ALTER TABLE users
  MODIFY id int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 3.3.1
-- http://www.phpmyadmin.net
--
-- Host: 10.168.1.56
-- Generation Time: Jun 04, 2014 at 01:17 PM
-- Server version: 5.5.28
-- PHP Version: 5.2.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `molovoco_taken`
--

-- --------------------------------------------------------

--
-- Table structure for table `anchor_categories`
--

CREATE TABLE IF NOT EXISTS `anchor_categories` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `slug` varchar(40) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `anchor_categories`
--

INSERT INTO `anchor_categories` (`id`, `title`, `slug`, `description`) VALUES
(2, 'Blogs', 'blogs', 'Blog Posts'),
(3, 'Portraits', 'portraits', 'Pictures of People');

-- --------------------------------------------------------

--
-- Table structure for table `anchor_comments`
--

CREATE TABLE IF NOT EXISTS `anchor_comments` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `post` int(6) NOT NULL,
  `status` enum('pending','approved','spam') NOT NULL,
  `date` datetime NOT NULL,
  `name` varchar(140) NOT NULL,
  `email` varchar(140) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post` (`post`),
  KEY `status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `anchor_comments`
--

INSERT INTO `anchor_comments` (`id`, `post`, `status`, `date`, `name`, `email`, `text`) VALUES
(1, 3, 'approved', '2013-04-30 22:19:17', 'James Dinsdale', 'hi@molovo.co.uk', 'This is just a test'),
(2, 3, 'approved', '2013-04-30 22:59:32', 'Ted Mosby', 'hi@hi.com', 'Another test'),
(3, 3, 'approved', '2013-04-30 22:59:44', 'Magic McMagicMan', 'hi@hi.com', 'Hello!');

-- --------------------------------------------------------

--
-- Table structure for table `anchor_extend`
--

CREATE TABLE IF NOT EXISTS `anchor_extend` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `type` enum('post','page') NOT NULL,
  `field` enum('text','html','image','file') NOT NULL,
  `key` varchar(160) NOT NULL,
  `label` varchar(160) NOT NULL,
  `attributes` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `anchor_extend`
--

INSERT INTO `anchor_extend` (`id`, `type`, `field`, `key`, `label`, `attributes`) VALUES
(1, 'post', 'image', 'image', 'Image', '{"type":"","size":{"width":"","height":""}}');

-- --------------------------------------------------------

--
-- Table structure for table `anchor_meta`
--

CREATE TABLE IF NOT EXISTS `anchor_meta` (
  `key` varchar(140) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `anchor_meta`
--

INSERT INTO `anchor_meta` (`key`, `value`) VALUES
('auto_published_comments', ''),
('comment_moderation_keys', ''),
('comment_notifications', ''),
('current_migration', '140'),
('date_format', 'jS M, Y'),
('description', 'A photography portfolio theme.&lt;br /&gt;\r\nFor Anchor CMS'),
('home_page', '4'),
('last_update_check', '2013-04-28 13:28:31'),
('posts_page', '1'),
('posts_per_page', '8'),
('sitename', 'Taken'),
('theme', 'taken'),
('update_version', '0.9');

-- --------------------------------------------------------

--
-- Table structure for table `anchor_pages`
--

CREATE TABLE IF NOT EXISTS `anchor_pages` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `parent` int(6) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `name` varchar(64) NOT NULL,
  `title` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `status` enum('draft','published','archived') NOT NULL,
  `redirect` text NOT NULL,
  `show_in_menu` tinyint(1) NOT NULL,
  `menu_order` int(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `anchor_pages`
--

INSERT INTO `anchor_pages` (`id`, `parent`, `slug`, `name`, `title`, `content`, `status`, `redirect`, `show_in_menu`, `menu_order`) VALUES
(1, 0, 'blog', 'Blog', 'My posts and thoughts', 'Welcome!', 'published', '', 1, 1),
(3, 0, 'download', 'Download', 'Download', 'Taken is available on Github.\r\n\r\n<a href="https://github.com/molovo/taken/archive/master.zip" class="button">Download</a>\r\n\r\n<a href="https://github.com/molovo/taken" class="button">View on Github</a>', 'published', '', 1, 2),
(4, 0, 'home', 'Home', 'Home', 'This is the homepage', 'published', '', 1, 0),
(5, 0, 'portfolio', 'Portfolio', 'Portfolio', 'This is my portfolio', 'published', '', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `anchor_page_meta`
--

CREATE TABLE IF NOT EXISTS `anchor_page_meta` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `page` int(6) NOT NULL,
  `extend` int(6) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page` (`page`),
  KEY `extend` (`extend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `anchor_page_meta`
--


-- --------------------------------------------------------

--
-- Table structure for table `anchor_posts`
--

CREATE TABLE IF NOT EXISTS `anchor_posts` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `html` text NOT NULL,
  `css` text NOT NULL,
  `js` text NOT NULL,
  `created` datetime NOT NULL,
  `author` int(6) NOT NULL,
  `category` int(6) NOT NULL,
  `status` enum('draft','published','archived') NOT NULL,
  `comments` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `anchor_posts`
--

INSERT INTO `anchor_posts` (`id`, `title`, `slug`, `description`, `html`, `css`, `js`, `created`, `author`, `category`, `status`, `comments`) VALUES
(2, 'First Past the Post', 'first-past-the-post', 'What I learnt from being beaten to the punch by a bigger, better and more organised rival', 'There have been two exciting new products doing the rounds recently. The first is [ Execute](http://executebook.com/), a fantastic book by [Drew Wilson](http://drewwilson.com/) and [Josh Long](http://joshlong.me/). It is about "executing on ideas immediately when inspired rather than following the normal rules". The second is [ Medium](http://medium.com/). Created by Twitter founder [Ev Williams](http://evhead.com/), it is an online magazine, open to contributions from the public.\r\n\r\nI only managed to pick up Execute this week. I read it cover to cover in under two hours. I *really* wish this book had been written 2 years ago, when I first had the idea for a website very similiar to Medium, called The Branch.\r\n\r\nThe idea was almost the same, anybody can submit articles and assign categories to them. Readers can then subscribe to a category, an author or a group of authors, and each are presented as individual collections or "magazines" within the interface. I even had plans drawn up to give a percentage of advertising revenue back to the authors.\r\n\r\nThe interface for article creation was fairly innovative, and aimed primarily at those with no knowledge of HTML, without resorting to other languages like Markdown or Textile. You can see some screenshots of the interface [on Loviv](http://loviv.com/molovo/5974).\r\n\r\nThe problem? I wasted time. I tried to build this mammoth interface all by myself, around my daily work. I completely redesigned the site three times, as having stared at it for so long I grew bored of it. I strived to create the *perfect* experience, and never finished, rather than concentrating on ensuring that the product shipped.\r\n\r\nWhen Medium was announced publicly and went into private beta, I immediately pulled the plug. The team at Medium managed to pull off exactly the vision I was striving towards, to allow anybody to easily create articles in a beautifully typographic way. They did it with a better design, ethos and infrastructure than I did, and with the traction and publicity that Medium has gained since being announced, there was no way that my product was going to compete.\r\n\r\nWhat I should have done, as suggested in the Execute book, was put aside the time to work towards the goal I had. I should have been unafraid to ask for help, rather than trying to go it alone in secret, for fear of the idea being stolen. Had I done that two years ago, I may have been able to get the site live long before Medium came into existence. Instead, I have two years of wasted evenings, with nothing to show at the end of it.\r\n\r\nSince the day I pulled the plug, I''ve been far more focused when I come up with an idea. I actually ended up reusing the name and domain I had for The Branch for [another exciting project](http://thebran.ch/) which I built in a little under two weeks, and am now immensely proud of and enjoy maintaining.\r\n\r\nSince reading Execute, I now know exactly where I went wrong, and will use the approaches recommended by Drew and Josh when I next come up with a great idea.\r\n\r\nI''d recommend this book to anyone who works on projects in their spare time, it''ll save you a whole lot of headaches. [Go buy it now](http://executebook.com/).', '', '', '2013-04-28 13:35:39', 1, 2, 'published', 0),
(3, 'Stroke Your Ego', 'stroke-your-ego', 'A celebration of the egotistical nature of designers.', 'Designers. We''re an egotistical bunch. And that''s a good thing.\r\n\r\nWe love the sound of our own voice, which means we get fantastic speakers sharing their experiences on stage at conferences, and interesting discussions in the bar afterwards.\r\n\r\nWe all think we are excellent wordsmiths, so there are countless blogs, magazines and articles waiting to be devoured by our eager counterparts.\r\n\r\nWe all have our own techniques and tools, which of course are better than others, so we wax lyrically about them, demonstrating their prowess to all who care to listen.\r\n\r\nWe write the cleanest, most readable, most efficient code possible, and minify it, so that those who want to learn from it are enticed by the mystery hidden behind all that missing white space.\r\n\r\nAnd lastly, when happy accidents occur, we declare that it was all down to following a practiced and perfected design process from which great ideas sprout like roses.\r\n\r\nWithout our egos, best practice would not exist, instead being hidden behind a veil of secrecy in the recesses of the minds of those at the head of our industry. Great ideas would go unnoticed. Boundaries would never be pushed. Friendships, collaborations and cooperatives would not have been formed. Amazing new tools would not be used by those who need them.\r\n\r\nSo please, don''t be ashamed. Stroke your ego. In public, loud and proud. It makes being a designer exciting.', '', '', '2013-04-28 17:51:50', 1, 2, 'published', 1),
(4, 'A picture', 'a-picture', '', 'This is a bunch of text explaining what the picture is about.', '', '', '2013-05-22 15:08:43', 1, 3, 'published', 0),
(5, 'Another Picture', 'another-picture', '', 'MOAR', '', '', '2013-05-22 15:26:37', 1, 3, 'published', 0),
(6, 'MOAR', 'moar', '', 'MOAR MOAR', '', '', '2013-05-22 15:26:50', 1, 3, 'published', 0),
(7, 'Girl With Camera', 'girl-with-camera', '', 'This is a picture. It has a girl in it. The girl has a camera.', '', '', '2013-05-22 19:54:48', 1, 3, 'published', 0),
(8, 'Just One More', 'just-one-more', '', 'Testing Testing Testing', '', '', '2013-05-22 22:18:41', 1, 3, 'published', 0);

-- --------------------------------------------------------

--
-- Table structure for table `anchor_post_meta`
--

CREATE TABLE IF NOT EXISTS `anchor_post_meta` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `post` int(6) NOT NULL,
  `extend` int(6) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post` (`post`),
  KEY `extend` (`extend`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `anchor_post_meta`
--

INSERT INTO `anchor_post_meta` (`id`, `post`, `extend`, `data`) VALUES
(2, 2, 1, '{"name":"article-image.jpg","filename":"article-image.jpg.jpg"}'),
(3, 4, 1, '{"name":"girl_with_camera_960069453.jpg","filename":"girl_with_camera_960069453.jpg.jpg"}'),
(4, 5, 1, '{"name":"exploration.jpg","filename":"exploration.jpg.jpg"}'),
(5, 6, 1, '{"name":"1221026_50746742.jpg","filename":"1221026_50746742.jpg.jpg"}'),
(6, 7, 1, '{"name":"000088de.jpeg","filename":"000088de.jpeg.jpeg"}'),
(7, 8, 1, '{"name":"ws_Brunette_Girl_With_Camera_1920x1080.jpg","filename":"ws_brunette_girl_with_camera_1920x1080.jpg.jpg"}');

-- --------------------------------------------------------

--
-- Table structure for table `anchor_sessions`
--

CREATE TABLE IF NOT EXISTS `anchor_sessions` (
  `id` char(32) NOT NULL,
  `expire` int(10) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `anchor_sessions`
--

INSERT INTO `anchor_sessions` (`id`, `expire`, `data`) VALUES
('2gRuf1Lyu7SKpMJS6aGEGHthEQqctWfr', 1401956892, 'a:2:{s:4:"_out";a:0:{}s:3:"_in";a:0:{}}'),
('7tl85J0CqK4vSLUPQGfTiYTXF672BWrB', 1401955739, 'a:2:{s:4:"_out";a:0:{}s:3:"_in";a:0:{}}'),
('8Q4vQYNuOHmN17kcwAHMkj63fZBXFwYL', 1401914643, 'a:2:{s:4:"_out";a:0:{}s:3:"_in";a:0:{}}'),
('9Cpx2eym4gCNvVK3TqwNb0FvFVoUrlUA', 1401967555, 'a:2:{s:4:"_out";a:0:{}s:3:"_in";a:0:{}}'),
('AjHFcpQSyCuUw4yNWmNDMmoa5v2bHes3', 1401956899, 'a:2:{s:4:"_out";a:0:{}s:3:"_in";a:0:{}}'),
('BfYyUv6eu91GjeKcOJvN8KhJkmaOafn9', 1401912816, 'a:2:{s:4:"_out";a:0:{}s:3:"_in";a:0:{}}'),
('BiuBtYjr4ahbVmZZUXDyOvs5TVW6ZFeY', 1401945326, 'a:2:{s:4:"_out";a:0:{}s:3:"_in";a:0:{}}'),
('DSC3rAYc6gkyyDIHejcNOKpmNYFb4Xsr', 1401883781, 'a:2:{s:4:"_out";a:0:{}s:3:"_in";a:0:{}}'),
('ee4YkirWSEM2rmBZRjCUACxPFVzWwpI1', 1401955722, 'a:2:{s:4:"_out";a:0:{}s:3:"_in";a:0:{}}'),
('fJBkRxmjo5fwXJ1zz24FGVSmALQ2BYhZ', 1401955726, 'a:2:{s:4:"_out";a:0:{}s:3:"_in";a:0:{}}'),
('hCSzYb6porJELq1j7RWSFrULTQQaG22g', 1401910671, 'a:2:{s:4:"_out";a:0:{}s:3:"_in";a:0:{}}'),
('hTGMcFcak515xfXpnvbRbNZwoyuNwj6p', 1401945327, 'a:2:{s:4:"_out";a:0:{}s:3:"_in";a:0:{}}'),
('jJx5Ktp2SWfTzufJ1ONKPZoBUDviqMcM', 1401934874, 'a:2:{s:4:"_out";a:0:{}s:3:"_in";a:0:{}}'),
('k7SxYOsraVkeL0qEUI9N8OKMfNKh9bUN', 1401955733, 'a:2:{s:4:"_out";a:0:{}s:3:"_in";a:0:{}}'),
('KWWaxsQ7eaJulPXqhV1f8yEkM1Qtwbl0', 1401955728, 'a:2:{s:4:"_out";a:0:{}s:3:"_in";a:0:{}}'),
('PwZfJ0AXY1lbQwqAjRFtvTzDYULofnH6', 1401955732, 'a:2:{s:4:"_out";a:0:{}s:3:"_in";a:0:{}}'),
('Q5tQNyDypHlAJci7HzeoOi8zEn4mesfP', 1401955735, 'a:2:{s:4:"_out";a:0:{}s:3:"_in";a:0:{}}'),
('RMuCgKaTtw4jSXOFm2VgoKFrjz3HYUme', 1401955737, 'a:2:{s:4:"_out";a:0:{}s:3:"_in";a:0:{}}'),
('S2nZa8xJvsys0GeXFGfbNMUShao1KPuV', 1401955724, 'a:2:{s:4:"_out";a:0:{}s:3:"_in";a:0:{}}'),
('tIp5ONDgmoAnLU3lHBZWcOqTwayD9210', 1401905447, 'a:2:{s:4:"_out";a:0:{}s:3:"_in";a:0:{}}'),
('UkfecnvoYFXr3z4FOHpCDWwVZKZtq1b0', 1401939911, 'a:2:{s:4:"_out";a:0:{}s:3:"_in";a:0:{}}'),
('UXuxLYm7MKCRqIP1EaVkOj7paNEUQ4fY', 1401896542, 'a:2:{s:4:"_out";a:0:{}s:3:"_in";a:0:{}}'),
('zbphSNiGPWE0p2OQseSYrREIfvjAJtEg', 1401883325, 'a:2:{s:4:"_out";a:0:{}s:3:"_in";a:0:{}}');

-- --------------------------------------------------------

--
-- Table structure for table `anchor_users`
--

CREATE TABLE IF NOT EXISTS `anchor_users` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `email` varchar(140) NOT NULL,
  `real_name` varchar(140) NOT NULL,
  `bio` text NOT NULL,
  `status` enum('inactive','active') NOT NULL,
  `role` enum('administrator','editor','user') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `anchor_users`
--

INSERT INTO `anchor_users` (`id`, `username`, `password`, `email`, `real_name`, `bio`, `status`, `role`) VALUES
(1, 'admin', '$2a$10$yeIgBk8HP0w8ZUxzEPEAzuDcXijAQBoOJu3CY.ox7up3MRTVb/lkS', 'hi@molovo.co.uk', 'James Dinsdale', 'The bouse', 'active', 'administrator');

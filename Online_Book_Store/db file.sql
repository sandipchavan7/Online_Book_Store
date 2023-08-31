-- -----------------------------------------------------
-- Create a new user
-- -----------------------------------------------------
CREATE USER 'ebook'@'localhost' IDENTIFIED BY 'ebook';

GRANT ALL PRIVILEGES ON * . * TO 'ebook'@'localhost';

ALTER USER 'ebook'@'localhost' IDENTIFIED WITH mysql_native_password BY 'ebook';


-- -----------------------------------------------------
-- Schema ecommerce-db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `ebook-db`;

CREATE SCHEMA `ebook-db`;

USE `ebook-db` ;

-- -----------------------------------------------------
-- Table `ebook-db`.`book_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ebook-db`.`book_category` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Table `ebook-db`.`book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ebook-db`.`book` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `sku` VARCHAR(255) DEFAULT NULL,
  `name` VARCHAR(255) DEFAULT NULL,
  `description` VARCHAR(255) DEFAULT NULL,
  `unit_price` DECIMAL(13,2) DEFAULT NULL,
  `image_url` VARCHAR(255) DEFAULT NULL,
  `active` BIT DEFAULT 1,
  `units_in_stock` INT(11) DEFAULT NULL,
  `date_created` DATETIME(6) DEFAULT NULL,
  `last_updated` DATETIME(6) DEFAULT NULL,
  `category_id` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category` (`category_id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `book_category` (`id`)
) 
ENGINE=InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Categories
-- -----------------------------------------------------
INSERT INTO product_category(category_name) VALUES ('Novel');
INSERT INTO product_category(category_name) VALUES ('Science Fiction');


-- -----------------------------------------------------
-- Laptops
-- -----------------------------------------------------
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('Novel-1000', "The Great Gatsby-FINGERPRINT', 'The Great Gatsby is a literary masterpiece that unveils the glitz, glamour, and disillusionment of the Jazz Age. Set in the vibrant backdrop of 1920s America, this captivating novel follows Jay Gatsby's pursuit of the American Dream, entwined with love, wealth, and tragedy. Prepare to be immersed in F. Scott Fitzgerald's exquisite prose and timeless exploration of human aspirations.", 'assets/images/books/novels/Novel-1000.jpeg', 1, 100, 240, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('Novel-1001', 'The Complete Novel of Sherlock Holmes', "Embark on thrilling investigations with The Complete Novel of Sherlock Holmes. This comprehensive collection features all four novels, showcasing the brilliant deductions and captivating adventures of the iconic detective Sherlock Holmes and his loyal companion, Dr. John Watson.The definitive collection of detective masterpieces!", 'assets/images/books/novels/Novel-1001.jpeg', 1, 100, 109, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('Novel-1002', 'You Only Live Once', "Find the answers about your own life in this story about searching for love and discovering yourself. Join a broken but rising YouTube star Alara, a struggling but hopeful stand-up comedian Aarav, and a zany but zen beach shack owner Ricky. Together, take the journey to seek the truth behind the famous singer Elisha's disappearance somewhere by the deep sea in Goa.", 'assets/images/books/novels/Novel-1002.jpeg', 1, 100, 165, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('Novel-1003', 'Ikigai', "It's the Japanese word for ‘a reason to live’ or ‘a reason to jump out of bed in the morning’.It’s the place where your needs, desires, ambitions, and satisfaction meet. A place of balance. Small wonder that finding your ikigai is closely linked to living longer.", 'assets/images/books/novels/Novel-1003.jpeg', 1, 100, 275, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('Novel-1004', 'Touch of Eternity', "Born on the same day and at the same time, Druvan and Anvesha know they are soulmates in every sense of the word. Their parents, however, refuse to accept their 'togetherness' at first and try to tear them apart. Druvan and Anvesha hold on to each other against all odds.In the same timeline, the world is on the brink of a major scientific breakthrough that could make reincarnation possible.This is an opportunity for the two to prove their love and to tell the world that it is love that can make the impossible, possible.Druvan and Anvesha participate in the experiment as if their life depends on it, because it does. Will the dream of a man to control love and life come true? And when the time comes, can one stay true to their soulmate?", 'assets/images/books/novels/Novel-1004.jpeg', 1, 100, 122, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('Novel-1005', 'The Power of Your Subconscious Mind', "This remarkable book by Dr. Joseph Murphy, one of the pioneering voices of affirmative thinking, will unlock for you the truly staggering powers of your subconscious mind. Combining time-honored spiritual wisdom with cutting edge scientific research, Dr. Murphy explains how the subconscious mind influences every single thing that you do and how, by understanding it and learning to control its incredible force, you can improve the quality of your daily life.Everything, from the promotion that you wanted and the raise you think you deserve, to overcoming phobias and bad habits and strengthening interpersonal relationships, the Power of Your Subconscious Mind will open a world of happiness, success, prosperity and peace for you. It will change your life and your world by changing your beliefs.", 'assets/images/books/novels/Novel-1005.jpeg', 1, 100, 105, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('Novel-1006', 'Something I Never Told You', "When in love, you tend to take each other for granted, and sometimes, that can cost you a lifetime of togetherness . . .Ronnie knew that his first crush was way out of his league, and yet he pursued and wooed Adira. Shyly and from a distance in the beginning, and more persuasively later. He couldn't believe it when the beautiful Adira actually began to reciprocate, falling in love with him for his simplicity and honesty.", 'assets/images/books/novels/Novel-1006.jpeg', 1, 100, 182, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('Novel-1007', 'That Night: Four Friends, Twenty Years', "Natasha, Riya, Anjali and Katherine were best friends in college - each different from the other yet inseparable - until that night.It was the night that began with a bottle of whisky and a game of Ouija but ended with the death of Sania, their unlikeable hostel mate. The friends vowed never to discuss that fateful night, a pact that had kept their friendship and guilt dormant for the last twenty years.But now, someone has begun to mess with them, threatening to reveal the truth that only Sania knew. Is it a hacker playing on their guilt or has Sania's ghost really returned to avenge her death?As the faceless enemy closes in on them, the friends come together once again to recount what really happened that night. But when the story is retold by each of them, the pieces don't fit. Because none of them is telling the whole truth . . .That Night is a dark, twisted tale of friendship and betrayal that draws you in and confounds you at every turn.", 'assets/images/books/novels/Novel-1007.jpeg', 1, 100, 166, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('Novel-1008', 'THE SILENT PATIENT', "WITH OVER THREE MILLION COPIES SOLD, read the Sunday Times and No.1 New York Times bestselling, record-breaking thriller that everyone is talking about - soon to be a major film. 'The perfect thriller' AJ FINN 'Terrific' - THE TIMES Crime Book of the Month 'Smart, sophisticated suspense' - LEE CHILD 'Compelling' - OBSERVER 'Absolutely brilliant' - STEPHEN FRY 'A totally original psychological mystery' - DAVID BALDACCI 'One of the best thrillers I've read this year' - CARA HUNTER 'The pace and finesse of a master' - BBC CULTURE Alicia Berenson lived a seemingly perfect life until one day six years ago.When she shot her husband in the head five times. Since then she hasn't spoken a single word.It's time to find out why. THE SILENT PATIENT is the gripping must-read thriller of the year - perfect for fans of THE FAMILY UPSTAIRS by Lisa Jewell, BLOOD ORANGE by Harriet Tyce and PLAYING NICE by JP Delaney.", 'assets/images/books/novels/Novel-1008.jpeg', 1, 100, 220, 1, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('Novel-1009', 'The Power of A Positive Attitude: Your Road To Success ', "Have you ever wondered how your attitude can influence your Success and failure? Have you ever considered the power of saying ‘I Can’, ‘I must’, ‘I will’? “I am not saying a positive attitude can make you successful. I am saying a positive attitude will make you successful.” – Norman Vincent Peale from helping you interpret and understand the true nature of your current attitude to building up self-confidence, which is a must for an affirmative attitude, this book details the dos and don’ts in dealing with your boss, provides handy tips for overcoming negative attitude, managing stress, and coping with burnout, and expounds on how converting negative thinking to positive action can bring about a change in life. Packed with powerful information, The power of a positive attitude will help you uncover your hidden abilities and achieve success.", 'assets/images/books/novels/Novel-1009.jpeg', 1, 100, 122, 1, NOW());


-- -----------------------------------------------------
-- Science Fiction
-- -----------------------------------------------------
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('Science Fiction-1000', 'The Time Machine', "Embark on a captivating adventure with H.G. Wells' The Time Machine. Witness humanity's future, explore the depths of time, and ponder on profound questions. This unabridged edition guarantees an immersive experience.", 'assets/images/books/Science_fiction/Science_Fiction-1000.jpeg', 1, 100, 99, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('Science Fiction-1001', 'The Theory Of Everything', "Seven lectures by the brilliant theoretical physicist have been compiled into this book to try to explain to the common man, the complex problems of mathematics and the question that has been gripped everyone all for centuries, the theory of existence. Undeniably intelligent, witty and childlike in his explanations, the narrator describes every detail about the beginning of the universe. He describes what a theory that can state the initiation of everything would encompass. Ideologies about the universe by Aristotle, Augustine, Hubble, Newton and Einstein have all been briefly introduced to the reader. Black holes and Big Bang has been explained in an unsophisticated manner for anyone to understand. All these events and individual theories may be strung together to create a theory of the origin of everything and the author strongly believes that the origin might not necessarily be from a singular event. He advocates the idea of a multi-dimensional origin with a no-boundary condition to remain true to the theories of modern physics and quantum physics. The book provides a clear view of the world through Stephen’s mind where he respectfully dismisses the belief that the Universe conforms by a supernatural and all-powerful entity. About the Author Stephen Hawking: An English cosmologist, theoretical physicist, author as well as the Director of Research at the Centre for Theoretical Cosmology under the University of Cambridge, Stephen Hawking is a scholar with more than a dozen of honorary degrees. In was in 1963 that Stephen Hawking contracted a rare motor neuron disorder which gave him just two years to live, yet he went to Cambridge to become what he is today.", 'assets/images/books/Science_fiction/Science_Fiction-1001.jpeg', 1, 100, 173, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('Science Fiction-1002', 'The Hidden Hindu: Science-Fiction meets Indian mythology in a nail biting thriller set',"Prithvi, a twenty-one-year-old, is searching for a mysterious middle-aged aghori (Shiva devotee), Om Shastri, who was traced more than 200 years ago before he was captured and transported to a high-tech facility on an isolated Indian island. When the aghori was drugged and hypnotized for interrogation by a team of specialists, he claimed to have witnessed all four yugas (the epochs in Hinduism) and even participated in both Ramayana and Mahabharata. Om's revelations of his incredible past that defied the nature of mortality left everyone baffled. The team also discovers that Om had been in search of the other immortals from every yuga. These bizarre secrets could shake up the ancient beliefs of the present and alter the course of the future. So who is Om Shastri? Why was he captured? Board the boat of Om Shastri's secrets, Prithvi's pursuit and adventures of other enigmatic immortals of Hindu mythology in this exciting and revealing journey.",'assets/images/books/Science_fiction/Science_Fiction-1002.jpeg', 1, 100, 179, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('Science Fiction-1003', 'Children of Time: Winner of the Arthur C. Clarke Award for Best Science Fiction', "Who will inherit this new Earth? The last remnants of the human race left a dying Earth, desperate to find a new home among the stars. Following in the footsteps of their ancestors, they discover the greatest treasure of the past age – a world terraformed and prepared for human life.But all is not right in this new Eden. In the long years since the planet was abandoned, the work of its architects has borne disastrous fruit. The planet is not waiting for them, pristine and unoccupied. New masters have turned it from a refuge into mankind's worst nightmare.Now two civilizations are on a collision course, both testing the boundaries of what they will do to survive. As the fate of humanity hangs in the balance, who are the true heirs of this new Earth?", 'assets/images/books/Science_fiction/Science_Fiction-1003.jpeg', 1, 100, 396, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('Science Fiction-1004', 'Foundation: The greatest science fiction series of all time', "WINNER OF THE HUGO AWARD FOR BEST ALL-TIME SERIESThe Foundation series is Isaac Asimovs iconic masterpiece. Unfolding against the backdrop of a crumbling Galactic Empire, the story of Hari Seldons two Foundations is a lasting testament to an extraordinary imagination, one that shaped science fiction as we know it today.The Galactic Empire has prospered for twelve thousand years. Nobody suspects that the heart of the thriving Empire is rotten, until psychohistorian Hari Seldon uses his new science to foresee its terrible fate.Exiled to the desolate planet Terminus, Seldon establishes a colony of the greatest minds in the Empire, a Foundation which holds the key to changing the fate of the galaxy.However, the death throes of the Empire breed hostile new enemies, and the young Foundations fate will be threatened first.", 'assets/images/books/Science_fiction/Science_Fiction-1004.jpeg', 1, 25, 324, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('Science Fiction-1005', 'Fahrenheit 451: The gripping and inspiring classic of dystopian science fiction', "Guy Montag is a fireman. His job is to burn books, which are forbidden, being the source of all discord and unhappiness. Even so, Montag is unhappy; there is discord in his marriage. Are books hidden in his house? The Mechanical Hound of the Fire Department, armed with a lethal hypodermic, escorted by helicopters, is ready to track down those dissidents who defy society to preserve and read books.The classic novel of a post-literate future, Fahrenheit 451 stands alongside Orwell’s 1984 and Huxley’s Brave New World as a prophetic account of Western civilization’s enslavement by the media, drugs and conformity.Bradbury’s powerful and poetic prose combines with uncanny insight into the potential of technology to create a novel which, forty years on from first publication, still has the power to dazzle and shock.", 'assets/images/books/Science_fiction/Science_Fiction-1005.jpeg', 1, 100, 390, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('Science Fiction-1006', 'Science and Magic - The Search Begins', "In a world where science is everything, humans rule the universe, and people no longer believe in magic. An earthling, Sam, who grew up believing that he is an orphan, dreams of finding true magic and the answer to life. His admission into Volgarth, a mysterious institution in the far-away planet of Tiron, brought hope into his life. He will meet new friends there; new territories and magical lore will be explored. But magic brings with it many mysteries and dangerous secrets. Strange secrets are associated with Sam and his past and it makes him special. but only if he can figure out what they are.", 'assets/images/books/Science_fiction/Science_Fiction-1006.jpeg', 1, 100, 149, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('Science Fiction-1007', 'Dark Matter: The Most Mind-Blowing And Twisted Thriller Of The Year', "'Brilliant. . . I think Blake Crouch just invented something new' Lee Child, author of the Jack Reacher series.From Blake Crouch, the author of the bestselling Wayward Pines trilogy, Dark Matter is sweeping and intimate, mind-bendingly strange and profoundly human ? a relentlessly surprising thriller about choices, paths not taken, and how far we'll go to claim the lives we dream of, perfect for fans of Stranger Things and Ready Player One.'Are you happy in your life?'Those are the last words Jason Dessen hears before the masked abductor knocks him unconscious. Before he awakes to find himself strapped to a gurney, surrounded by strangers in hazmat suits. Before the man he's never met smiles down at him and says, 'Welcome back.'In this world he's woken up to, Jason's life is not the one he knows. His wife is not his wife. His son was never born. And Jason is not an ordinary college physics professor, but a celebrated genius who has achieved something remarkable. Something impossible.Is it this world or the other that's the dream? And even if the home he remembers is real, how can Jason possibly make it back to the family he loves? The answers lie in a journey more wondrous and horrifying than anything he could've imagined ? one that will force him to confront the darkest parts of himself even as he battles a terrifying, seemingly unbeatable foe.", 'assets/images/books/Science_fiction/Science_Fiction-1007.jpeg', 1, 100, 353, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('Science Fiction-1008', 'Relativity:The Special and the General Theory ', "Discover Albert Einstein's groundbreaking theories with 'Relativity: The Special and the General Theory.' This influential work provides a comprehensive exploration of the principles that revolutionized our understanding of space, time, and gravity. A must-read for science enthusiasts and those intrigued by the mysteries of the universe.", 'assets/images/books/Science_fiction/Science_Fiction-1008.jpeg', 1, 100, 139, 2, NOW());
INSERT INTO product (sku, name, description, image_url, active, units_in_stock, unit_price, category_id,date_created) VALUES ('Science Fiction-1009', 'The Science of Getting Rich with The Science of Being Great', "You can become what you want to be.? a combined, modernized, and updated edition of Wallace D Wattles? two bestselling works, the science of getting rich and the science of being great, this book is considered a philosophy of mind Science. With time-tested new thought principles and practices, including the technique of creative visualization, which Wattles himself practiced, it explains how riches come to us and how by simply using our will, acting in a certain way, and thinking The right thoughts, we can become rich and great. A compelling self-help classic, this book will help you understand the secrets to attaining what you truly desire.", 'assets/images/books/Science_fiction/Science_Fiction-1009.jpeg', 1, 100, 109, 2, NOW());

USE `ebook-db`;

SET foreign_key_checks = 0;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `id` smallint unsigned NOT NULL,
  `code` varchar(2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

--
-- Data for table `country`
--

INSERT INTO `country` VALUES 
(1,'BR','Brazil'),
(2,'CA','Canada'),
(3,'DE','Germany'),
(4,'IN','India'),
(5,'TR','Turkey'),
(6,'US','United States');

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;

CREATE TABLE `state` (
  `id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `country_id` smallint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_country` (`country_id`),
  CONSTRAINT `fk_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

--
-- Dumping data for table `state`
--

INSERT INTO `state` VALUES 
(1,'Acre',1),
(2,'Alagoas',1),
(3,'Amapá',1),
(4,'Amazonas',1),
(5,'Bahia',1),
(6,'Ceará',1),
(7,'Distrito Federal',1),
(8,'Espírito Santo',1),
(9,'Goiás',1),
(10,'Maranhão',1),
(11,'Mato Grosso do Sul',1),
(12,'Mato Grosso',1),
(13,'Minas Gerais',1),
(14,'Paraná',1),
(15,'Paraíba',1),
(16,'Pará',1),
(17,'Pernambuco',1),
(18,'Piaui',1),
(19,'Rio de Janeiro',1),
(20,'Rio Grande do Norte',1),
(21,'Rio Grande do Sul',1),
(22,'Rondônia',1),
(23,'Roraima',1),
(24,'Santa Catarina',1),
(25,'Sergipe',1),
(26,'São Paulo',1),
(27,'Tocantins',1),
(28,'Alberta',2),
(29,'British Columbia',2),
(30,'Manitoba',2),
(31,'New Brunswick',2),
(32,'Newfoundland and Labrador',2),
(33,'Northwest Territories',2),
(34,'Nova Scotia',2),
(35,'Nunavut',2),
(36,'Ontario',2),
(37,'Prince Edward Island',2),
(38,'Quebec',2),
(39,'Saskatchewan',2),
(40,'Yukon',2),
(41,'Baden-Württemberg',3),
(42,'Bavaria',3),
(43,'Berlin',3),
(44,'Brandenburg',3),
(45,'Bremen',3),
(46,'Hamburg',3),
(47,'Hesse',3),
(48,'Lower Saxony',3),
(49,'Mecklenburg-Vorpommern',3),
(50,'North Rhine-Westphalia',3),
(51,'Rhineland-Palatinate',3),
(52,'Saarland',3),
(53,'Saxony',3),
(54,'Saxony-Anhalt',3),
(55,'Schleswig-Holstein',3),
(56,'Thuringia',3),
(57,'Andhra Pradesh',4),
(58,'Arunachal Pradesh',4),
(59,'Assam',4),
(60,'Bihar',4),
(61,'Chhattisgarh',4),
(62,'Goa',4),
(63,'Gujarat',4),
(64,'Haryana',4),
(65,'Himachal Pradesh',4),
(66,'Jammu & Kashmir',4),
(67,'Jharkhand',4),
(68,'Karnataka',4),
(69,'Kerala',4),
(70,'Madhya Pradesh',4),
(71,'Maharashtra',4),
(72,'Manipur',4),
(73,'Meghalaya',4),
(74,'Mizoram',4),
(75,'Nagaland',4),
(76,'Odisha',4),
(77,'Punjab',4),
(78,'Rajasthan',4),
(79,'Sikkim',4),
(80,'Tamil Nadu',4),
(81,'Telangana',4),
(82,'Tripura',4),
(83,'Uttar Pradesh',4),
(84,'Uttarakhand',4),
(85,'West Bengal',4),
(86,'Andaman and Nicobar Islands',4),
(87,'Chandigarh',4),
(88,'Dadra and Nagar Haveli',4),
(89,'Daman & Diu',4),
(90,'Lakshadweep',4),
(91,'Puducherry',4),
(92,'The Government of NCT of Delhi',4),
(93,'Alabama',6),
(94,'Alaska',6),
(95,'Arizona',6),
(96,'Arkansas',6),
(97,'California',6),
(98,'Colorado',6),
(99,'Connecticut',6),
(100,'Delaware',6),
(101,'District Of Columbia',6),
(102,'Florida',6),
(103,'Georgia',6),
(104,'Hawaii',6),
(105,'Idaho',6),
(106,'Illinois',6),
(107,'Indiana',6),
(108,'Iowa',6),
(109,'Kansas',6),
(110,'Kentucky',6),
(111,'Louisiana',6),
(112,'Maine',6),
(113,'Maryland',6),
(114,'Massachusetts',6),
(115,'Michigan',6),
(116,'Minnesota',6),
(117,'Mississippi',6),
(118,'Missouri',6),
(119,'Montana',6),
(120,'Nebraska',6),
(121,'Nevada',6),
(122,'New Hampshire',6),
(123,'New Jersey',6),
(124,'New Mexico',6),
(125,'New York',6),
(126,'North Carolina',6),
(127,'North Dakota',6),
(128,'Ohio',6),
(129,'Oklahoma',6),
(130,'Oregon',6),
(131,'Pennsylvania',6),
(132,'Rhode Island',6),
(133,'South Carolina',6),
(134,'South Dakota',6),
(135,'Tennessee',6),
(136,'Texas',6),
(137,'Utah',6),
(138,'Vermont',6),
(139,'Virginia',6),
(140,'Washington',6),
(141,'West Virginia',6),
(142,'Wisconsin',6),
(143,'Wyoming',6),
(144,'Adıyaman',5),
(145,'Afyonkarahisar',5),
(146,'Ağrı',5),
(147,'Aksaray',5),
(148,'Amasya',5),
(149,'Ankara',5),
(150,'Antalya',5),
(151,'Ardahan',5),
(152,'Artvin',5),
(153,'Aydın',5),
(154,'Balıkesir',5),
(155,'Bartın',5),
(156,'Batman',5),
(157,'Bayburt',5),
(158,'Bilecik',5),
(159,'Bingöl',5),
(160,'Bitlis',5),
(161,'Bolu',5),
(162,'Burdur',5),
(163,'Bursa',5),
(164,'Çanakkale',5),
(165,'Çankırı',5),
(166,'Çorum',5),
(167,'Denizli',5),
(168,'Diyarbakır',5),
(169,'Düzce',5),
(170,'Edirne',5),
(171,'Elazığ',5),
(172,'Erzincan',5),
(173,'Erzurum',5),
(174,'Eskişehir',5),
(175,'Gaziantep',5),
(176,'Giresun',5),
(177,'Gümüşhane',5),
(178,'Hakkâri',5),
(179,'Hatay',5),
(180,'Iğdır',5),
(181,'Isparta',5),
(182,'İstanbul',5),
(183,'İzmir',5),
(184,'Kahramanmaraş',5),
(185,'Karabük',5),
(186,'Karaman',5),
(187,'Kars',5),
(188,'Kastamonu',5),
(189,'Kayseri',5),
(190,'Kırıkkale',5),
(191,'Kırklareli',5),
(192,'Kırşehir',5),
(193,'Kilis',5),
(194,'Kocaeli',5),
(195,'Konya',5),
(196,'Kütahya',5),
(197,'Malatya',5),
(198,'Manisa',5),
(199,'Mardin',5),
(200,'Mersin',5),
(201,'Muğla',5),
(202,'Muş',5),
(203,'Nevşehir',5),
(204,'Niğde',5),
(205,'Ordu',5),
(206,'Osmaniye',5),
(207,'Rize',5),
(208,'Sakarya',5),
(209,'Samsun',5),
(210,'Siirt',5),
(211,'Sinop',5),
(212,'Sivas',5),
(213,'Şanlıurfa',5),
(214,'Şırnak',5),
(215,'Tekirdağ',5),
(216,'Tokat',5),
(217,'Trabzon',5),
(218,'Tunceli',5),
(219,'Uşak',5),
(220,'Van',5),
(221,'Yalova',5),
(222,'Yozgat',5),
(223,'Zonguldak',5);

SET foreign_key_checks = 1;


USE `ecommerce-db`;

--
-- Prep work
--
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `order_item`;
DROP TABLE IF EXISTS `orders`;
DROP TABLE IF EXISTS `customer`;
DROP TABLE IF EXISTS `address`;
SET FOREIGN_KEY_CHECKS=1;

--
-- Table structure for table `address`
--
CREATE TABLE `address` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `customer`
--
CREATE TABLE `customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `orders`
--
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_tracking_number` varchar(255) DEFAULT NULL,
  `total_price` decimal(19,2) DEFAULT NULL,
  `total_quantity` int DEFAULT NULL,
  `billing_address_id` bigint DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  `shipping_address_id` bigint DEFAULT NULL,
  `status` varchar(128) DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_billing_address_id` (`billing_address_id`),
  UNIQUE KEY `UK_shipping_address_id` (`shipping_address_id`),
  KEY `K_customer_id` (`customer_id`),
  CONSTRAINT `FK_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK_billing_address_id` FOREIGN KEY (`billing_address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `FK_shipping_address_id` FOREIGN KEY (`shipping_address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Table structure for table `order_items`
--
CREATE TABLE `order_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `unit_price` decimal(19,2) DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `K_order_id` (`order_id`),
  CONSTRAINT `FK_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FK_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


create table admin_details(
 id int ,
 admin_name varchar(255),
 password varchar(255), 
 email varchar(255) , 
 primary key (id)
);

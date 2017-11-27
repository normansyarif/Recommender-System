-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 20, 2017 at 03:34 PM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recommender`
--

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE `movie` (
  `movieId` varchar(3) NOT NULL,
  `title` varchar(150) NOT NULL,
  `year` varchar(4) NOT NULL,
  `description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`movieId`, `title`, `year`, `description`) VALUES
('1', 'Inside Out', '2015', 'After young Riley is uprooted from her Midwest life and moved to San Francisco, her emotions - Joy, Fear, Anger, Disgust and Sadness - conflict on how best to navigate a new city, house, and school.'),
('10', 'The Wolf of Wall Street', '2013', 'Based on the true story of Jordan Belfort, from his rise to a wealthy stock-broker living the high life to his fall involving crime, corruption and the federal government.'),
('100', 'The Wizard of Oz', '1939', 'Dorothy Gale is swept away from a farm in Kansas to a magical land of Oz in a tornado and embarks on a quest with her new friends to see the Wizard who can help her return home in Kansas and help her friends as well.'),
('101', 'The Truman Show', '1998', 'An insurance salesman/adjuster discovers his entire life is actually a television show.'),
('102', 'Groundhog Day', '1993', 'A weatherman finds himself inexplicably living the same day over and over again.'),
('103', 'Duck Soup', '1933', 'Rufus T. Firefly is named president/dictator of bankrupt Freedonia and declares war on neighboring Sylvania over the love of wealthy Mrs. Teasdale.'),
('104', 'The Breakfast Club', '1985', 'Five high school students meet in Saturday detention and discover how they have a lot more in common than they thought.'),
('105', 'Miracle on 34th Street', '1994', 'A lawyer and a little girl must prove that a man claiming to be Santa Claus is the real thing.'),
('106', 'WALL-E', '2008', 'In the distant future, a small waste-collecting robot inadvertently embarks on a space journey that will ultimately decide the fate of mankind.'),
('107', 'Finding Nemo', '2003', 'After his son is captured in the Great Barrier Reef and taken to Sydney, a timid clownfish sets out on a journey to bring him home.'),
('108', 'UP', '2009', 'Seventy-eight year old Carl Fredricksen travels to Paradise Falls in his home equipped with balloons, inadvertently taking a young stowaway.'),
('109', 'Kung Fu Panda', '2008', 'The Dragon Warrior has to clash against the savage Tai Lung as China\'s fate hangs in the balance: However, the Dragon Warrior mantle is supposedly mistaken to be bestowed upon an obese panda who is a tyro in martial arts.'),
('11', 'The Grand Budapest Hotel', '2014', 'The adventures of Gustave H, a legendary concierge at a famous hotel from the fictional Republic of Zubrowka between the first and second World Wars, and Zero Moustafa, the lobby boy who becomes his most trusted friend.'),
('110', 'Cars', '2006', 'A hot-shot race-car named Lightning McQueen gets waylaid in Radiator Springs, where he finds the true meaning of friendship and family.'),
('111', 'Rio', '2011', 'When Blu, a domesticated macaw from small-town Minnesota, meets the fiercely independent Jewel, he takes off on an adventure to Rio de Janeiro with the bird of his dreams.'),
('112', 'Home Alone', '1990', 'An eight-year-old troublemaker must protect his house from a pair of burglars when he is accidentally left home alone by his family during Christmas vacation.'),
('113', 'Home Alone 2: Lost in New York', '1992', 'One year after Kevin was left home alone and had to defeat a pair of bumbling burglars, he accidentally finds himself in New York City, and the same criminals are not far behind.'),
('114', 'A Christmas Carol', '2009', 'An animated retelling of Charles Dickens\' classic novel about a Victorian-era miser taken on a journey of self-redemption, courtesy of several mysterious Christmas apparitions.'),
('115', 'Christmas with the Kranks', '2004', 'With their daughter away, the Kranks decide to skip Christmas altogether until she decides to come home, causing an uproar when they have to celebrate the holiday at the last minute.'),
('116', 'White Christmas', '1954', 'A successful song-and-dance team become romantically involved with a sister act and team up to save the failing Vermont inn of their former commanding general.'),
('117', 'Elf', '2003', 'After inadvertently wreaking havoc on the elf community due to his ungainly size, a man raised as an elf at the North Pole is sent to the U.S. in search of his true identity.'),
('12', 'Guardians of the Galaxy', '2014', 'A group of intergalactic criminals are forced to work together to stop a fanatical warrior from taking control of the universe.'),
('13', 'Whiplash', '2014', 'A promising young drummer enrolls at a cut-throat music conservatory where his dreams of greatness are mentored by an instructor who will stop at nothing to realize a student\'s potential.'),
('14', 'The Revenant', '2015', 'A frontiersman on a fur trading expedition in the 1820s fights for survival after being mauled by a bear and left for dead by members of his own hunting team.'),
('15', 'Star Wars: The Force Awakens', '2015', 'Three decades after the Empire\'s defeat, a new threat arises in the militant First Order. Stormtrooper defector Finn and spare parts scavenger Rey are caught up in the Resistance\'s search for the missing Luke Skywalker.'),
('16', 'Arrival', '2016', 'When twelve mysterious spacecrafts appear around the world, linguistics professor Louise Banks is tasked with interpreting the language of the apparent alien visitors.'),
('17', 'Hacksaw Ridge', '2016', 'WWII American Army Medic Desmond T. Doss, who served during the Battle of Okinawa, refuses to kill people, and becomes the first man in American history to receive the Medal of Honor without firing a shot.'),
('18', 'Logan', '2017', 'In the near future, a weary Logan cares for an ailing Professor X, somewhere on the Mexican border. However, Logan\'s attempts to hide from the world, and his legacy, are upended when a young mutant arrives, pursued by dark forces.'),
('19', 'Captain America: Civil War', '2016', 'Political interference in the Avengers\' activities causes a rift between former allies Captain America and Iron Man.'),
('2', 'Django Unchained', '2012', 'With the help of a German bounty hunter, a freed slave sets out to rescue his wife from a brutal Mississippi plantation owner.'),
('20', 'The Avengers', '2012', 'Earth\'s mightiest heroes must come together and learn to fight as a team if they are going to stop the mischievous Loki and his alien army from enslaving humanity.'),
('21', 'Interstellar', '2014', 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.'),
('22', 'Boyhood', '2014', 'The life of Mason, from early childhood to his arrival at college.'),
('23', 'The Dark Knight Rises', '2012', 'Eight years after the Joker\'s reign of anarchy, the Dark Knight, with the help of the enigmatic Catwoman, is forced from his exile to save Gotham City, now on the edge of total annihilation, from the brutal guerrilla terrorist Bane.'),
('24', 'The Hunt', '2012', 'A teacher lives a lonely life, all the while struggling over his son\'s custody. His life slowly gets better as he finds love and receives good news from his son, but his new luck is about to be brutally shattered by an innocent little lie.'),
('25', 'The Social Network', '2010', 'Harvard student Mark Zuckerberg creates the social networking site that would become known as Facebook, but is later sued by two brothers who claimed he stole their idea, and the co-founder who was later squeezed out of the business.'),
('26', 'X-Men: Days of Future Past', '2014', 'The X-Men send Wolverine to the past in a desperate effort to change history and prevent an event that results in doom for both humans and mutants.'),
('27', 'Edge of Tomorrow', '2014', 'A soldier fighting aliens gets to relive the same day over and over again, the day restarting every time he dies.'),
('28', 'Guardians of the Galaxy Vol. 2', '2017', 'The Guardians must fight to keep their newfound family together as they unravel the mystery of Peter Quill\'s true parentage.'),
('29', 'The Artist', '2011', 'A silent movie star meets a young dancer, but the arrival of talking pictures sends their careers in opposite directions.'),
('3', 'La La Land', '2016', 'While navigating their careers in Los Angeles, a pianist and an actress fall in love while attempting to reconcile their aspirations for the future.'),
('30', 'The Raid: Redemption', '2011', 'A S.W.A.T. team becomes trapped in a tenement run by a ruthless mobster and his army of killers and thugs.'),
('31', 'Skyfall', '2012', 'Bond\'s loyalty to M is tested when her past comes back to haunt her. When MI6 comes under attack, 007 must track down and destroy the threat, no matter how personal the cost.'),
('32', 'Prisoners', '2013', 'When Keller Dover\'s daughter and her friend go missing, he takes matters into his own hands as the police pursue multiple leads and the pressure mounts.'),
('33', 'Big Hero 6', '2014', 'The special bond that develops between plus-sized inflatable robot Baymax, and prodigy Hiro Hamada, who team up with a group of friends to form a band of high-tech heroes.'),
('34', 'Dawn of the Planet of the Ape', '2014', 'A growing nation of genetically evolved apes led by Caesar is threatened by a band of human survivors of the devastating virus unleashed a decade earlier.'),
('35', 'How to Train Your Dragon 2', '2014', 'When Hiccup and Toothless discover an ice cave that is home to hundreds of new wild dragons and the mysterious Dragon Rider, the two friends find themselves at the center of a battle to protect the peace.'),
('36', 'The Lego Movie', '2014', 'An ordinary Lego construction worker, thought to be the prophesied \'Special\', is recruited to join a quest to stop an evil tyrant from gluing the Lego universe into eternal stasis.'),
('37', 'Wreck-It Ralph', '2012', 'A video game villain wants to be a hero and sets out to fulfill his dream, but his quest brings havoc to the whole arcade where he lives.'),
('38', 'The Raid 2', '2014', 'Only a short time after the first raid, Rama goes undercover with the thugs of Jakarta and plans to bring down the syndicate and uncover the corruption within his police force.'),
('39', 'Moana', '2016', 'In Ancient Polynesia, when a terrible curse incurred by the Demigod Maui reaches Moana\'s island, she answers the Ocean\'s call to seek out the Demigod to set things right.'),
('4', 'Gravity', '2013', 'Two astronauts work together to survive after an accident which leaves them alone in space.'),
('40', 'Frozen', '2013', 'When the newly crowned Queen Elsa accidentally uses her power to turn things into ice to curse her home in infinite winter, her sister, Anna, teams up with a mountain man, his playful reindeer, and a snowman to change the weather condition.'),
('41', 'Rogue One', '2016', 'The daughter of an Imperial scientist joins the Rebel Alliance in a risky move to steal the plans for the Death Star.'),
('42', 'Star Trek: Into Darkness', '2013', 'After the crew of the Enterprise find an unstoppable force of terror from within their own organization, Captain Kirk leads a manhunt to a war-zone world to capture a one-man weapon of mass destruction.'),
('43', 'Silver Linings Playbook', '2012', 'After a stint in a mental institution, former teacher Pat Solitano moves back in with his parents and tries to reconcile with his ex-wife. Things get more challenging when Pat meets Tiffany, a mysterious girl with problems of her own.'),
('44', 'War for the Planet of the Apes', '2017', 'After the apes suffer unimaginable losses, Caesar wrestles with his darker instincts and begins his own mythic quest to avenge his kind.'),
('45', 'The Martian', '2015', 'An astronaut becomes stranded on Mars after his team assume him dead, and must rely on his ingenuity to find a way to signal to Earth that he is alive.'),
('46', '12 Years a Slave', '2013', 'In the antebellum United States, Solomon Northup, a free black man from upstate New York, is abducted and sold into slavery.'),
('47', 'Her', '2013', 'In a near future, a lonely writer develops an unlikely relationship with an operating system designed to meet his every need.'),
('48', 'Captain America: The Winter Soldier', '2014', 'As Steve Rogers struggles to embrace his role in the modern world, he teams up with a fellow Avenger and S.H.I.E.L.D agent, Black Widow, to battle a new threat from history: an assassin known as the Winter Soldier.'),
('49', 'Argo', '2012', 'Acting under the cover of a Hollywood producer scouting a location for a science fiction film, a CIA agent launches a dangerous operation to rescue six Americans in Tehran during the U.S. hostage crisis in Iran in 1980.'),
('5', 'Mad Max: Fury Road', '2015', 'A woman rebels against a tyrannical ruler in postapocalyptic Australia in search for her home-land with the help of a group of female prisoners, a psychotic worshipper, and a drifter named Max.'),
('50', 'Spotlight', '2015', 'The true story of how the Boston Globe uncovered the massive scandal of child molestation and cover-up within the local Catholic Archdiocese, shaking the entire Catholic Church to its core.'),
('51', 'Room', '2015', 'A young boy is raised within the confines of a small shed.'),
('52', 'Nebraska', '2013', 'An aging, booze-addled father makes the trip from Montana to Nebraska with his estranged son in order to claim a million-dollar Mega Sweepstakes Marketing prize.'),
('53', '127 Hours', '2010', 'An adventurous mountain climber becomes trapped under a boulder while canyoneering alone near Moab, Utah and resorts to desperate measures in order to survive.'),
('54', 'Rise of the Planet of the Apes', '2011', 'A substance designed to help the brain repair itself gives rise to a super-intelligent chimpanzee who leads an ape uprising.'),
('55', 'Before Midnight', '2013', 'We meet Jesse and Celine nine years on in Greece. Almost two decades have passed since their first meeting on that train bound for Vienna.'),
('56', 'The Intouchables', '2011', 'After he becomes a quadriplegic from a paragliding accident, an aristocrat hires a young man from the projects to be his caregiver.'),
('57', 'Kick-Ass', '2010', 'Dave Lizewski is an unnoticed high school student and comic book fan who one day decides to become a superhero, even though he has no powers, training or meaningful reason to do so.'),
('58', 'Fast Five', '2011', 'Dominic Toretto and his crew of street racers plan a massive heist to buy their freedom while in the sights of a powerful Brazilian drug lord and a dangerous federal agent.'),
('59', 'X-Men: First Class', '2011', 'In 1962, the United States government enlists the help of Mutants with superhuman abilities to stop a malicious dictator who is determined to start World War III.'),
('6', 'Toy Story 3', '2010', 'The toys are mistakenly delivered to a day-care center instead of the attic right before Andy leaves for college, and it\'s up to Woody to convince the other toys that they weren\'t abandoned and to return home.'),
('60', 'Real Steel', '2011', 'In the near future, robot boxing is a top sport. A struggling promoter feels he\'s found a champion in a discarded robot.'),
('61', 'The Jungle Book', '2016', 'After a threat from the tiger Shere Khan forces him to flee the jungle, a man-cub named Mowgli embarks on a journey of self discovery with the help of panther, Bagheera, and free spirited bear, Baloo.'),
('62', 'Tangled', '2010', 'The magically long-haired Rapunzel has spent her entire life in a tower, but now that a runaway thief has stumbled upon her, she is about to discover the world for the first time, and who she really is.'),
('63', 'The Conjuring 2', '2016', 'Ed and Lorraine Warren travel to North London to help a single mother raising 4 children alone in a house plagued by a supernatural spirit.'),
('64', 'IT', '2017', 'A group of bullied kids band together when a shapeshifting monster, taking the appearance of a clown, begins hunting children.'),
('65', 'Don’t Breathe', '2016', 'Hoping to walk away with a massive fortune, a trio of thieves break into the house of a blind man who isn\'t as helpless as he seems.'),
('66', 'Green Room', '2015', 'A punk rock band is forced to fight for survival after witnessing a murder at a neo-Nazi skinhead bar.'),
('67', 'The Canal', '2014', 'A depressed and stressed film archivist finds his sanity crumbling after he is given an old 16mm film reel with footage from a horrific murder that occurred in the early 1900\'s.'),
('68', 'Annabelle: Creation', '2017', '12 years after the tragic death of their little girl, a dollmaker and his wife welcome a nun and several girls from a shuttered orphanage into their home, where they soon become the target of the dollmaker\'s possessed creation, Annabelle.'),
('69', 'A Christmas Horror Story', '2015', 'Interwoven stories that take place on Christmas Eve, as told by one festive radio host: A family brings home more than a Christmas tree, a student documentary becomes a living nightmare, a Christmas spirit terrorizes, Santa slays evil.'),
('7', 'Inception', '2010', 'A thief, who steals corporate secrets through use of dream-sharing technology, is given the inverse task of planting an idea into the mind of a CEO.'),
('70', 'Lights Out', '2016', 'Rebecca must unlock the terror behind her little brother\'s experiences that once tested her sanity, bringing her face to face with an entity attached to their mother.'),
('71', 'Insidious: Chapter 3', '2015', 'A prequel set before the haunting of the Lambert family that reveals how gifted psychic Elise Rainier reluctantly agrees to use her ability to contact the dead in order to help a teenage girl who has been targeted by a dangerous supernatural entity.'),
('72', 'Unfriended', '2014', 'A group of online chat room friends find themselves haunted by a mysterious, supernatural force using the account of their dead friend.'),
('73', 'Creep', '2014', 'When a videographer answers a Craigslist ad for a one-day job in a remote mountain town, he finds his client is not at all what he initially seems.'),
('74', 'The Lure', '2015', 'In Warsaw, a pair of mermaid sisters are adopted into a cabaret. While one seeks love with humans the other hungers to dine on the human population of the city.'),
('75', 'Final Prayer', '2013', 'A team of Vatican investigators descends upon a church in a remote area to demystify the unusual happenings, but what they discover is more disturbing than they had first imagined.'),
('76', 'Ouija: Origin of Evil', '2016', 'In 1967 Los Angeles, a widowed mother and her daughters add a new stunt to bolster their seance scam business, inviting an evil presence into their home.'),
('77', 'I Am Not a Serial Killer', '2016', 'In a small Midwestern town, a troubled teen with homicidal tendencies must hunt down and destroy a supernatural killer while keeping his own inner demons at bay.'),
('78', 'They Look Like People', '2015', 'Suspecting that people around him are turning into evil creatures, a troubled man questions whether to protect his only friend from an impending war, or from himself.'),
('79', 'Late Phases', '2014', 'When deadly beasts attack from the forest, it is up to a grizzled veteran to uncover what the residents of a secluded retirement community are hiding.'),
('8', 'Black Swan', '2010', 'A committed dancer wins the lead role in a production of Tchaikovsky\'s \"Swan Lake\" only to find herself struggling to maintain her sanity.'),
('80', 'Step Brothers', '2008', 'Two aimless middle-aged losers still living at home are forced against their will to become roommates when their parents marry.'),
('81', 'White Chicks', '2004', 'Two disgraced FBI agents go way undercover in an effort to protect hotel heiresses the Wilson Sisters from a kidnapping plot.'),
('82', 'The Hangover', '2009', 'Three buddies wake up from a bachelor party in Las Vegas, with no memory of the previous night and the bachelor missing. They make their way around the city in order to find their friend before his wedding.'),
('83', 'Horrible Bosses', '2011', 'Three friends conspire to murder their awful bosses when they realize they are standing in the way of their happiness.'),
('84', 'Wedding Crasher', '2005', 'John Beckwith and Jeremy Grey, a pair of committed womanizers who sneak into weddings to take advantage of the romantic tinge in the air, find themselves at odds with one another when John meets and falls for Claire Cleary.'),
('85', 'Bad Teacher', '2011', 'A lazy, incompetent middle school teacher who hates her job, her students, and her co-workers is forced to return to teaching to make enough money for breast implants after her wealthy fiancé dumps her.'),
('86', 'Were the Millers', '2013', 'A veteran pot dealer creates a fake family as part of his plan to move a huge shipment of weed into the U.S. from Mexico.'),
('87', 'The Bounty Hunter', '2010', 'A bounty hunter learns that his next target is his ex-wife, a reporter working on a murder cover-up. Soon after their reunion, the always-at-odds duo find themselves on a run-for-their-lives adventure.'),
('88', 'Mr. Bean’s Holiday', '2007', 'Mr. Bean wins a trip to Cannes where he unwittingly separates a young boy from his father and must help the two come back together. On the way he discovers France, bicycling, and true love, among other things.'),
('89', 'The Interview', '2014', 'Dave Skylark and his producer Aaron Rapoport run the celebrity tabloid show \"Skylark Tonight\". When they land an interview with a surprise fan, North Korean dictator Kim Jong-un, they are recruited by the CIA to turn their trip to Pyongyang '),
('9', 'How to Train Your Dragon', '2010', 'A hapless young Viking who aspires to hunt dragons becomes the unlikely friend of a young dragon himself, and learns there may be more to the creatures than he assumed.'),
('90', 'The Lord of the Rings: The Fellowship of the Ring', '2001', 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle Earth from the Dark Lord Sauron.'),
('91', 'The Lord of the Rings: The Return of the King', '2003', 'Gandalf and Aragorn lead the World of Men against Sauron\'s army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.'),
('92', 'The Lord of the Rings: The Two Towers', '2002', 'While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum, the divided fellowship makes a stand against Sauron\'s new ally, Saruman, and his hordes of Isengard.'),
('93', 'Avatar', '2009', 'A paraplegic marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home.'),
('94', 'Big Fish', '2003', 'A frustrated son tries to determine the fact from fiction in his dying father\'s life.'),
('95', 'Pans Labyrinth', '2006', 'In the falangist Spain of 1944, the bookish young stepdaughter of a sadistic army officer escapes into an eerie but captivating fantasy world.'),
('96', 'Life of Pi', '2012', 'A young man who survives a disaster at sea is hurtled into an epic journey of adventure and discovery. While cast away, he forms an unexpected connection with another survivor: a fearsome Bengal tiger.'),
('97', 'Harry Potter and the Deathly Hallows: Part 2', '2011', 'Harry, Ron, and Hermione search for Voldemort\'s remaining Horcruxes in their effort to destroy the Dark Lord as the final battle rages on at Hogwarts.'),
('98', 'Harry Potter and the Deathly Hallows: Part 1', '2010', 'As Harry races against time and evil to destroy the Horcruxes, he uncovers the existence of three most powerful objects in the wizarding world: the Deathly Hallows.'),
('99', 'The Hobbit: An Unexpected Journey', '2012', 'A reluctant hobbit, Bilbo Baggins, sets out to the Lonely Mountain with a spirited group of dwarves to reclaim their mountain home, and the gold within it from the dragon Smaug.');

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `userId` int(11) NOT NULL,
  `movieId` int(11) NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`userId`, `movieId`, `rating`) VALUES
(1, 8, 4),
(1, 14, 3),
(1, 61, 5),
(1, 90, 5),
(1, 91, 5),
(1, 92, 5),
(1, 93, 4),
(1, 94, 4),
(1, 95, 5),
(1, 96, 4),
(1, 97, 5),
(1, 98, 5),
(1, 99, 5),
(1, 100, 5),
(2, 2, 4),
(2, 4, 5),
(2, 5, 5),
(2, 7, 5),
(2, 12, 5),
(2, 13, 3),
(2, 15, 5),
(2, 16, 4),
(2, 17, 4),
(2, 18, 5),
(2, 19, 5),
(2, 20, 5),
(2, 21, 5),
(2, 23, 4),
(2, 25, 3),
(3, 80, 3),
(3, 81, 4),
(3, 82, 4),
(3, 83, 5),
(3, 84, 5),
(3, 85, 4),
(3, 86, 5),
(3, 87, 5),
(3, 88, 5),
(3, 89, 5),
(3, 101, 5),
(3, 102, 3),
(3, 103, 3),
(3, 104, 4),
(3, 105, 4),
(4, 65, 4),
(4, 66, 5),
(4, 67, 3),
(4, 68, 5),
(4, 69, 5),
(4, 70, 5),
(4, 71, 5),
(4, 72, 4),
(4, 73, 4),
(4, 74, 4),
(4, 75, 3),
(4, 76, 5),
(4, 77, 4),
(4, 78, 5),
(4, 79, 3),
(5, 1, 5),
(5, 6, 5),
(5, 9, 5),
(5, 33, 4),
(5, 35, 4),
(5, 36, 4),
(5, 37, 4),
(5, 39, 5),
(5, 40, 5),
(5, 62, 5),
(5, 106, 4),
(5, 107, 4),
(5, 108, 5),
(5, 109, 4),
(5, 110, 4),
(6, 3, 5),
(6, 11, 3),
(6, 22, 4),
(6, 25, 4),
(6, 27, 3),
(6, 29, 5),
(6, 43, 5),
(6, 46, 4),
(6, 47, 5),
(6, 50, 3),
(6, 51, 4),
(6, 52, 3),
(6, 53, 4),
(6, 55, 5),
(6, 56, 5),
(7, 8, 1),
(7, 44, 2),
(7, 54, 2),
(7, 61, 3),
(7, 90, 5),
(7, 91, 5),
(7, 92, 5),
(7, 93, 4),
(7, 94, 4),
(7, 95, 4),
(7, 96, 4),
(7, 97, 5),
(7, 98, 5),
(7, 99, 5),
(7, 100, 4),
(8, 26, 5),
(8, 28, 5),
(8, 30, 5),
(8, 31, 4),
(8, 32, 3),
(8, 34, 4),
(8, 38, 5),
(8, 41, 5),
(8, 42, 5),
(8, 44, 4),
(8, 45, 5),
(8, 48, 5),
(8, 49, 3),
(8, 54, 5),
(8, 57, 4),
(9, 20, 2),
(9, 28, 2),
(9, 43, 1),
(9, 48, 1),
(9, 60, 1),
(9, 80, 4),
(9, 81, 3),
(9, 82, 5),
(9, 83, 4),
(9, 84, 5),
(9, 85, 3),
(9, 86, 5),
(9, 87, 5),
(9, 88, 5),
(9, 89, 5),
(10, 51, 3),
(10, 63, 5),
(10, 64, 5),
(10, 70, 5),
(10, 71, 5),
(10, 72, 5),
(10, 73, 4),
(10, 74, 4),
(10, 75, 4),
(10, 76, 5),
(10, 77, 5),
(10, 78, 5),
(10, 79, 4),
(10, 97, 1),
(10, 98, 1),
(11, 1, 5),
(11, 6, 5),
(11, 9, 4),
(11, 33, 5),
(11, 35, 5),
(11, 36, 4),
(11, 37, 5),
(11, 39, 5),
(11, 40, 5),
(11, 62, 5),
(11, 112, 4),
(11, 113, 4),
(11, 114, 5),
(11, 115, 4),
(11, 116, 5),
(11, 117, 5),
(12, 3, 4),
(12, 8, 4),
(12, 11, 5),
(12, 13, 5),
(12, 22, 5),
(12, 25, 5),
(12, 27, 5),
(12, 29, 3),
(12, 43, 3),
(12, 47, 3),
(12, 51, 5),
(12, 52, 5),
(12, 53, 5),
(12, 55, 3),
(12, 84, 2),
(13, 65, 4),
(13, 66, 3),
(13, 67, 4),
(13, 68, 5),
(13, 69, 5),
(13, 70, 3),
(13, 71, 4),
(13, 72, 4),
(13, 73, 4),
(13, 74, 3),
(13, 75, 3),
(13, 76, 3),
(13, 77, 4),
(13, 78, 5),
(13, 79, 4),
(14, 35, 5),
(14, 36, 4),
(14, 37, 5),
(14, 39, 5),
(14, 40, 5),
(14, 62, 5),
(14, 106, 4),
(14, 107, 4),
(14, 108, 5),
(14, 109, 4),
(14, 110, 3),
(14, 111, 4),
(14, 112, 2),
(14, 113, 3),
(14, 115, 3),
(15, 2, 3),
(15, 5, 4),
(15, 7, 5),
(15, 13, 3),
(15, 15, 5),
(15, 17, 3),
(15, 18, 5),
(15, 19, 5),
(15, 20, 5),
(15, 21, 5),
(15, 23, 3),
(15, 58, 4),
(15, 59, 5),
(15, 60, 5),
(15, 82, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` varchar(3) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userId`, `name`) VALUES
('1', 'Novita'),
('10', 'Batok'),
('11', 'Rodriguez'),
('12', 'Aisyah'),
('13', 'Yulia'),
('14', 'Arde'),
('15', 'Eko'),
('16', 'Norman'),
('2', 'Mala'),
('3', 'Arif'),
('4', 'Yoga'),
('5', 'Zalman'),
('6', 'Bayu'),
('7', 'Miftah'),
('8', 'Adam'),
('9', 'Sinta');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`movieId`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`userId`,`movieId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

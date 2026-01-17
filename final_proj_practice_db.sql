--Final Project - Introduction to PostgreSQL
--CPT 166 - Fundamentals of SQL
--Sylvia Schlotterbeck 12-13-25

--Part A - Database Creation

--Step 1. Create Database
CREATE DATABASE widgetsofconseqence_db;

--Step 2. Create tables (without foreign key bindings for now, to allow simplified initial insertion of records)
CREATE TABLE personnel (
  personnel_id SERIAL NOT NULL PRIMARY KEY,
  name TEXT,
  email_address TEXT,
  founder_status BOOL,
  current_position_1 INT,
  current_position_2 INT,
  current_position_3 INT,
  current_position_4 INT
  );

CREATE TABLE positions (
  position_id SERIAL NOT NULL PRIMARY KEY,
  position_name TEXT,
  position_description TEXT,
  position_dept_id INT
  );
  
CREATE TABLE departments (
  dept_id SERIAL NOT NULL PRIMARY KEY,
  dept_name TEXT NOT NULL,
  dept_description TEXT,
  dept_head INT
  );

CREATE TABLE product_lines (
  product_id SERIAL NOT NULL PRIMARY KEY,
  product_name TEXT,
  prod_descr TEXT,
  product_dept_id INT
  );
  
CREATE TABLE price_list (
  item_id SERIAL NOT NULL PRIMARY KEY,
  item_name TEXT,
  product_line INT,
  unit_descr TEXT,
  price NUMERIC
  );

--Step 3. Populate tables with records  
INSERT INTO personnel (personnel_id, name, email_address, founder_status, current_position_1, current_position_2, current_position_3, current_position_4) VALUES
  (1,'Wrigley Jenkins', 'wrigleyjenkins@widgetsofconsequence.com', TRUE, 2, 9, 8, 1),
  (2, 'Railroad Bill', 'railroadbill@widgetsofconsequence.com', TRUE, 4, 15, 9, 1),
  (3, 'Travis Nelson', 'travisnelson@widgetsofconsequence.com', TRUE, 7, 17, 18, 1),
  (4, 'The Pizza Boy', 'pizzaboy@widgetsofconsequence.com', TRUE, 1, 10, 18, 1),
  (5, 'Rosie Rivetts', 'rosierivetts@widgetsofconsequence.com', FALSE, 3, 15, 9, 1),
  (6, 'Parsnip McGee', 'parsnipmcgee@widgetsofconsequence.com', FALSE, 11, 19, NULL, NULL),
  (7, 'Delicious Aloysius', 'deliciousaloysius@widgetsofconsequence.com', FALSE, 14, 12, 9, NULL),
  (8, 'Pat', 'pat@widgetsofconsequence.com', FALSE, 16, 5, NULL, NULL),
  (9, 'Diamante Pattinson', 'diamantepattinson@widgetsofconsequence.com', FALSE, 13, 12, NULL, NULL),
  (10, 'Francine Pants', 'francinepants@widgetsofconsequence.com', FALSE, 6, 12, NULL, NULL),
  (11, 'Barb Jimenez', 'barbjiminez@widgetsofconsequence.com', FALSE, 15, 20, NULL, NULL),
  (12, 'Mitch Margolin', 'mitchmargolin@widgetsofconsequence.com', FALSE, 15, 18, NULL, NULL),
  (13, 'Pinky Barbarelli', 'pinkybarbarelli@widgetsofconsequence.com', FALSE, 19, 20, NULL, NULL)
  ;

INSERT INTO positions (position_id, position_name, position_description, position_dept_id) VALUES
  (1, 'Pizza Boy', 'Delivers the Pizza', 2),
  (2, 'CEO', 'Chief Executive Officer', 1),
  (3, 'Factory Foreperson', 'Manages factory operations and personnel', 3),
  (4, 'Old Tyme Widgetry Wizard', 'Head of all railroad-era and old tyme widgetery', 6),
  (5, 'Seltzer Quartermaster', 'Ensures consistent company-wide access to bubble water', 2),
  (6, 'Artists Guild Guildmaster', 'Wrangles all the talented painters and craftspeople in the factory artists guild', 3),
  (7, 'Bits & Bytes Primary Product Manager', 'Digital Services department head', 4),
  (8, 'Wriggler in Chief', 'Wriggling and jazzercise personal well-being lead', 2),
  (9, 'Widget Imagineer', 'Member of the R&D Widget Imagination sub-committee', 7),
  (10, 'COOL', 'Chief Operations Officer & Lead', 9),
  (11, 'Chief Notary', 'Supplier of Official Stamp of Budget Approval', 8), 
  (12, 'Painter of Dreams', 'Fine Arts Oil Painter of Bespoke Consequential Widgets', 3),
  (13, 'Artists Guild Assistant Guildmaster', 'Assists Artists Guild Guildmaster', 3),
  (14, 'Digital to Tangible Transformations Lead', 'Oversees the NFT product pipeline', 5),
  (15, 'Factory Craftsperson', 'hands-on woodworking, 3-D printing, riveting, etc. in the factory', 3),
  (16, 'System Administrator', 'Keeping everything running smoothly in IT land', 9),
  (17, 'Webmaster', 'Keeping that website going', 9),
  (18, 'IT Backup Tech', 'On-call IT personnel whose main job lies elsewhere in the company, but can be called in when things get dicey', 9),
  (19, 'Numbers Person', 'Book-keeper and Accountant', 8),
  (20, 'Legal Eagle', 'Very knowledgeable certified paralegal (who also technically is a lawyer but prefers to keep that on the DL)', 8),
  (21, 'Founders Circle Member', 'Has a seat and a vote in the Founders Circle', 1)
  ;

INSERT INTO departments (dept_id, dept_name, dept_description, dept_head) VALUES
  (1, 'Founders Circle', 'Highest level decision-making body at WoC', 1),
  (2, 'Refreshment & Relaxation ', 'Responsible for keeping up personnel morale through keeping the snack bar, kitchen, and spa room in tip-top shape', 4), 
  (3, 'Production ', 'Overseeing operations at our artisanal widget factory', 5),
  (4, 'Digital Services', 'Overseeing our digital offerings, products, and services', 3),
  (5, 'NFTery', 'Cultivating our line of bespoke IRL NFTs', 7),
  (6, 'Planned Obsolescence', 'Overseeing our line of full-spectrum electronic device funeral services', 2),
  (7, 'Research & Development', 'Responsible for envisioning the next generation of consequential widgets', 1), 
  (8, 'Finance & Accounting', 'Oversees the Numbers and the Money', 6),
  (9, 'Operations', 'Responsible for physical and IT infrastructure, including office supplies and networking', 8)
  ;

INSERT INTO product_lines (product_id, product_name, prod_descr, product_dept_id) VALUES
  (1, 'Fridge Art Remix Keepsake Paintings', 'Send us a piece of art made by your child, and we will turn it into an unforgettable memory. We will first scan it into our systems and then process it through our custom generative AI LLM art bot -- the Widgeroo 5000 -- to enhance it in every way. Once our team is satisfied that the stick figure drawn by your child is truly a Widgets of Consequence masterpiece, our guild of highly trained oil painting masters (humans all), will painstakingly handpaint their interpretation of the Widgeroo 500 enhanced version of your original fridge art, and our woodworking artisans will handcraft the perfect frame to show off your new keepsake before shipping it all back to you before Christmas (or the holiday of your choice).', 3),
  (2, 'Real Boy NFTs', 'Inspired by the timeless desire of Pinocchio to become a Real Boy, our visionary wish fulfillment Imagineers are here bring you the ultimate in Non-Fungability: cold, hard physical reality! Bring your NFT to full 3-dimensional sold-state physical life by having our dedicated NFTery department make a truly one-of-a-kind sculpture out of your proprietary NFT investments. Working with wood, metal, wire; and bespoke, in-house-designed and manufactured circuit boards as well as old school animation technologies for your animated NFTs (like flipbook tech!), we will make your wishes come true! Start your Real Boy NFT collection today! (Note: must demonstrate full and legal ownership of your NFT in order to access this service).', 5),
  (3, 'Block/Chain IRL NFT Sculptures', 'Question: what is more Non-fungible than proof of ownership on the Blockchain?? Answer: actual blocks and actual chains! Instead of transforming your digital NFT to physical form, why not come at it from the other direction and have our incredible team of artisans create a one-of-a-kind sculpture for you using the power of the human mind and our advanced prompt randomizers--vintage, half-filled-in Mad Libs booklets from the 90s?? Completely Disrupt the Crypto status quo by going way way old school with your high-risk investments! Just send us a noun, a verb ending in ing, an adjective, another noun, and $5000, and we will send you a unique, never-to-be-repeated IRL NFT Sculpture made out of a big wooden block, thick metal chain, and a custom-painted scene on each face--try hacking that! (choose from Basic--oak block + cast iron chain, and Leet--black walnut block + chrome-plated titanium chain)', 5),
  (4, 'Dead Phone Memorials', 'Planned Obsolescence got you down? Turn the creeping bug of intentionally sub-par electronic devices into a stately and beautiful feature with our comprehensive line of Dead Phone Memorials. Featuring full-spectrum phone funereal services, including ecologically friendly cremation (we remove all of the toxic bits of your phone and then crush the remainder into a pleasing memorial of your choice--choose from Classic (Your phones ashes placed in a tasteful urn), Techy (the ashes of your bricked phone get mixed in with our artisanal bricklayer mix and formed into a literal brick), and Charming (we 3-D print a miniature replica of your phone as a charm bracelet charm using your phones ashes as the substrate for the printer--charm bracelet available to purchase separately)); taxidermy (we remove and responsibly recycle the innards of your phone, fill the inside with archival-quality taxidermy resin, and then mount phone on a charming display stand complete with hand-painted, life-like screen scene and brass plaque listing Model name, Nickname, Cause and Date of Device Demise); and more options upon request--just inquire with our caring and experienced Planned Obsolescence team', 6)
  ;
 
INSERT INTO price_list (item_id, item_name, product_line, unit_descr, price) VALUES
  (1, 'Fridge Art Remix Keepsake Painting - SMALL', 1, '1 - 8x10 inch custom framed oil painting', 800),
  (2, 'Fridge Art Remix Keepsake Painting - MEDIUM', 1, '1 - 11x17 inch custom framed oil painting', 1200),
  (3, 'Fridge Art Remix Keepsake Painting - LARGE', 1, '1 - 3x5 foot custom framed oil painting', 5000),
  (4, 'Real Boy NFT - Static Image - SMALL', 2, '1 - 2x3x2 inch sculpture', 850),
  (5, 'Real Boy NFT - Static Image - LARGE', 2, '1 - 4x6x2 inch sculpture', 1000),
  (6, 'Real Boy NFT - Animated Image - SMALL', 2, '1 - 2x3x2 inch sculpture', 1250),
  (7, 'Real Boy NFT - Animated Image - LARGE', 2, '1 - 4x6x2 inch sculpture', 1500),
  (8, 'Block/Chain IRL NFT - BASIC', 3, '1 - custom 4x4x4 inch oak/iron sculpture', 3500),
  (9, 'Block/Chain IRL NFT - LEET', 3, '1 - custom 4x4x4 inch walnut/titanium sculpture', 5000),
  (10, 'Dead Phone Memorial - CLASSIC CREMATION', 4, '1 - ashes-filled urn', 650),
  (11, 'Dead Phone Memorial - TECHY CREMATION', 4, '1 - standard-sized brick', 500),
  (12, 'Dead Phone Memorial - CHARMING CREMATION', 4, '1 - bracelet charm', 750),
  (13, 'Dead Phone Memorial - CHARM BRACELET', 4, '1 - 18k gold charm bracelet', 550),
  (14, 'Dead Phone Memorial - TAXIDERMY', 4, '1 - taxidermied device w/ stand', 1100)
;

--Step 4. Add foreign key bindings to tables in order to establish and enforce schema relationships 
ALTER TABLE personnel  
  ADD FOREIGN KEY (current_position_1) REFERENCES positions(position_id),
  ADD FOREIGN KEY (current_position_2) REFERENCES positions(position_id),
  ADD FOREIGN KEY (current_position_3) REFERENCES positions(position_id),
  ADD FOREIGN KEY (current_position_4) REFERENCES positions(position_id)
  ;

ALTER TABLE positions
  ADD FOREIGN KEY (position_dept_id) REFERENCES departments(dept_id)
  ;

ALTER TABLE departments
  ADD FOREIGN KEY (dept_head) REFERENCES personnel(personnel_id)
  ;

ALTER TABLE product_lines
  ADD FOREIGN KEY (product_dept_id) REFERENCES departments(dept_id)
  ;

ALTER TABLE price_list
  ADD FOREIGN KEY (product_line) REFERENCES product_lines(product_id)
  ;

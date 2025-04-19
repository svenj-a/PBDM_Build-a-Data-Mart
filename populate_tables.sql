-- Populate reference tables with lookup values --
INSERT INTO `pbdm_booking_platform_db`.`properties` (`property`) VALUES
  ('Free WiFi'),
  ('Breakfast Included'),
  ('Air Conditioning'),
  ('Heating'),
  ('Washing Machine'),
  ('Dryer'),
  ('Dishwasher'),
  ('Bed Sheets'),
  ('Microwave'),
  ('Coffee Machine'),
  ('Refrigerator'),
  ('Oven'),
  ('TV'),
  ('Lake View'),
  ('City Center'),
  ('Mountain View'),
  ('Private Pool'),
  ('Hot Tub'),
  ('Parking'),
  ('Balcony'),
  ('Pet Friendly'),
  ('Fireplace'),
  ('Outdoor Grill');

INSERT INTO `pbdm_booking_platform_db`.`payment_methods` (`method`) VALUES
  ('Credit Card'),
  ('Debit Card'),
  ('SEPA Direct Debit'),
  ('PayPal'),
  ('Bank Transfer'),
  ('Apple Pay'),
  ('Google Pay'),
  ('Cash'),
  ('Cryptocurrency'),
  ('Voucher');

INSERT INTO `pbdm_booking_platform_db`.`ticket_categories` (`category`) VALUES
  ('Payment & Billing'),
  ('Booking & Accommodations'),
  ('Cancellation & Refund'),
  ('Update Personal Data'),
  ('Delete Account & Personal Data'),
  ('Account & Profile'),
  ('Report Accommodation Not As Described'),
  ('Report Fraudulent Offer'),
  ('Report Violation Of Terms Of Service'),
  ('Report Bug'),
  ('Feedback & Suggestions'),
  ('Others');

INSERT INTO `pbdm_booking_platform_db`.`ticket_status` (`status`) VALUES
  ('new'),
  ('open'),
  ('in progress'),
  ('waiting'),
  ('solved'),
  ('duplicate'),
  ('out of scope'),
  ('not reproducible'),
  ('spam'),
  ('withdrawn'),
  ('external support required');

INSERT INTO `pbdm_booking_platform_db`.`account_status` (`status`) VALUES
  ('verification pending'),
  ('active'),
  ('temporarily suspended'),
  ('banned'),
  ('inactive'),
  ('deletion pending');

INSERT INTO `pbdm_booking_platform_db`.`roles` (`role`, `account_type`) VALUES
  ('host', 'user'),
  ('guest', 'user'),
  ('moderator', 'employee'),
  ('administrator', 'employee'),
  ('developer', 'employee'),
  ('customer support', 'employee');

INSERT INTO `pbdm_booking_platform_db`.`permissions` (`permission`) VALUES
  ('create/ edit accommodation listings'),
  ('delete accommodation listings'),
  ('save listings as favorite'),
  ('create booking requests'),
  ('manage booking requests'),
  ('view booking history'),
  ('manage bookings'),
  ('send/ receive messages'),
  ('make payments'),
  ('receive payments'),
  ('request/ receive refunds'),
  ('manage payments/ refunds'),
  ('create/ edit reviews'),
  ('delete reviews'),
  ('read reviews'),
  ('manage all contents/ visibility'),
  ('suspend/ ban user accounts'),
  ('issue warnings/ info messages'),
  ('manage user accounts'),
  ('view platform statistics'),
  ('read access to database'),
  ('write access to database'),
  ('read access to codebase'),
  ('write access to codebase'),
  ('create support tickets'),
  ('update support tickets'),
  ('delete support tickets');

-- Populate entity tables with randomly generated sample data --
INSERT INTO `pbdm_booking_platform_db`.`employees` (`username`) VALUES
  ('t.klein'),
  ('e.braun'),
  ('l.schneider'),
  ('e.wolf'),
  ('o.fischer'),
  ('l.schuster'),
  ('n.weber'),
  ('c.hoffmann'),
  ('l.schmidt'),
  ('a.lange'),
  ('h.koch'),
  ('d.peters'),
  ('l.becker'),
  ('m.richter'),
  ('f.zimmermann'),
  ('m.meyer'),
  ('s.mueller'),
  ('j.hoffmann'),
  ('i.wagner'),
  ('s.schulz');

INSERT INTO `pbdm_booking_platform_db`.`addresses` (`country`, `city`, `postal_code`, `street`, `street_no`) VALUES
  ('Germany', 'Berlin', '10115', 'Hauptstrasse', '12'),
  ('France', 'Paris', '75001', 'Rue de Rivoli', '78'),
  ('USA', 'New York', '10001', '5th Avenue', '154'),
  ('Canada', 'Toronto', 'M5A 1A1', 'Queen Street', '32'),
  ('Italy', 'Rome', '00100', 'Via del Corso', '9'),
  ('Spain', 'Madrid', '28001', 'Gran Via', '115'),
  ('Australia', 'Sydney', '2000', 'George Street', '233'),
  ('India', 'Mumbai', '400001', 'Marine Drive', '100'),
  ('China', 'Beijing', '100000', 'Wangfujing Street', '340'),
  ('Brazil', 'Rio de Janeiro', '01000', 'Avenida Paulista', '81'),
  ('Mexico', 'Mexico City', '01000', 'Paseo de la Reforma', '24'),
  ('United Kingdom', 'London', 'W1A 1AA', 'Oxford Street', '99'),
  ('Russia', 'Moscow', '101000', 'Tverskaya Street', '45'),
  ('Japan', 'Tokyo', '150-0001', 'Shibuya Crossing', '12'),
  ('South Korea', 'Seoul', '04524', 'Teheranno', '64'),
  ('South Africa', 'Cape Town', '8000', 'Long Street', '71'),
  ('Argentina', 'Buenos Aires', 'C1000', 'Avenida 9 de Julio', '200'),
  ('New Zealand', 'Auckland', '1010', 'Queen Street', '50'),
  ('Belgium', 'Brussels', '1000', 'Rue Neuve', '64'),
  ('Netherlands', 'Amsterdam', '1010', 'Kerkstraat', '8'),
  ('Germany', 'Hamburg', '20095', 'Jungfernstieg', '12'),
  ('France', 'Lyon', '69001', 'Rue de la Republique', '154'),
  ('Italy', 'Milan', '20121', 'Corso Vittorio Emanuele', '233'),
  ('Spain', 'Barcelona', '08002', 'La Rambla', '115'),
  ('Australia', 'Melbourne', '3000', 'Collins Street', '45'),
  ('India', 'New Delhi', '110001', 'Connaught Place', '100'),
  ('China', 'Shanghai', '200000', 'Nanjing Road', '9'),
  ('Brazil', 'Rio de Janeiro', '20000-000', 'Avenida Atlantica', '154'),
  ('Mexico', 'Guadalajara', '44100', 'Avenida Vallarta', '81'),
  ('United Kingdom', 'Edinburgh', 'EH1 1BB', 'Princess Street', '64'),
  ('Russia', 'Saint Petersburg', '190000', 'Nevsky Prospect', '99'),
  ('Japan', 'Kyoto', '600-0000', 'Shijo Street', '32'),
  ('South Korea', 'Busan', '48000', 'Haeundae Beach', '8'),
  ('South Africa', 'Johannesburg', '2000', 'Main Street', '200'),
  ('Argentina', 'Cordoba', '5000', 'Calle de la Canada', '78'),
  ('New Zealand', 'Wellington', '6011', 'Lambton Quay', '9'),
  ('Belgium', 'Antwerp', '2000', 'Meir', '115'),
  ('Netherlands', 'Rotterdam', '3011', 'Coolsingel', '50'),
  ('Germany', 'Munich', '80331', 'Marienplatz', '64'),
  ('France', 'Marseille', '13001', 'Vieux-Port', '154');

INSERT INTO `pbdm_booking_platform_db`.`users` (`first_name`, `last_name`, `status_id`, `pref_pay_method_id`, `phone`, `email`, `address_id`) VALUES
  ('Luca', 'Bianchi', 1, NULL, '+39 123 456 7890', 'luca.bianchi@yahoo.com', 15),
  ('Sophie', 'Muller', 2, 2, '+49 234 567 8901', 'sophie.muller@gmail.com', 23),
  ('Mateo', 'Garcia', 2, 4, '+34 345 678 9012', 'mateo.garcia@hotmail.com', 12),
  ('Leila', 'Ahmed', 2, 1, '+44 456 789 0123', 'leila.ahmed@outlook.com', 8),
  ('Nikolai', 'Ivanov', 4, 6, '+7 567 890 1234', 'nikolai.ivanov@mail.ru', 4),
  ('Mia', 'Lopez', 2, NULL, '+34 678 901 2345', 'mia.lopez@aol.com', 19),
  ('Olga', 'Kovacs', 6, 7, '+36 789 012 3456', 'olga.kovacs@webmail.com', 2),
  ('Elias', 'Perez', 2, 8, '+34 890 123 4567', 'elias.perez@gmail.com', 31),
  ('Marek', 'Novak', 2, 3, '+420 901 234 5678', 'marek.novak@yahoo.com', 7),
  ('Camille', 'Dubois', 2, 10, '+33 012 345 6789', 'camille.dubois@outlook.com', 5),
  ('Liam', 'Connor', 5, 4, '+353 123 456 7891', 'liam.connor@gmail.com', 1),
  ('Emma', 'Sanchez', 3, 4, '+34 234 567 8902', 'emma.sanchez@hotmail.com', 6),
  ('Frederik', 'Jensen', 2, 4, '+45 345 678 9013', 'frederik.jensen@yahoo.com', 26),
  ('Katarzyna', 'Wojcik', 2, 6, '+48 456 789 0124', 'katarzyna.wojcik@aol.com', 17),
  ('Anja', 'Koch', 3, 7, '+49 567 890 1235', 'anja.koch@webmail.com', 11),
  ('Giovanni', 'Russo', 2, NULL, '+39 678 901 2346', 'giovanni.russo@gmail.com', 25),
  ('Alicja', 'Zielinska', 2, 6, '+48 789 012 3457', 'alicja.zielinska@yahoo.com', 14),
  ('Dmitry', 'Petrov', 4, 7, '+7 890 123 4568', 'dmitry.petrov@mail.ru', 30),
  ('Hanna', 'Wagner', 2, 1, '+49 901 234 5679', 'hanna.wagner@outlook.com', 21),
  ('Victor', 'Mendez', 2, 2, '+34 012 345 6790', 'victor.mendez@gmail.com', 22),
  ('Jana', 'Kovac', 1, NULL, '+420 123 456 7892', 'jana.kovac@aol.com', 35),
  ('Isabella', 'Ricci', 2, NULL, '+39 234 567 8903', 'isabella.ricci@webmail.com', 28),
  ('Alexis', 'Lemoine', 6, 9, '+33 345 678 9014', 'alexis.lemoine@yahoo.com', 40),
  ('Tomasz', 'Nowak', 2, 7, '+48 456 789 0125', 'tomasz.nowak@hotmail.com', 9),
  ('Viktor', 'Sokolov', 1, NULL, '+7 567 890 1237', 'viktor.sokolov@mail.ru', 27),
  ('Sofia', 'Rossi', 2, 3, '+39 678 901 2348', 'sofia.rossi@gmail.com', 18),
  ('Sebastian', 'Klein', 2, 5, '+49 789 012 3457', 'sebastian.klein@outlook.com', 29),
  ('Lars', 'Berg', 2, 2, '+46 123 456 7890', 'lars.berg@yahoo.com', 3),
  ('Julia', 'Schmidt', 2, 1, '+49 234 567 8902', 'julia.schmidt@gmail.com', 13),
  ('Roberto', 'Martinez', 2, 4, '+34 345 678 9014', 'roberto.martinez@hotmail.com', 9),
  ('Zoe', 'Liu', 2, 6, '+86 456 789 0125', 'zoe.liu@outlook.com', 20),
  ('Francesco', 'Giordano', 1, NULL, '+39 567 890 1236', 'francesco.giordano@mail.ru', 30),
  ('Emma', 'Van Dijk', 2, NULL, '+31 678 901 2347', 'emma.vandijk@aol.com', 28),
  ('Adrian', 'Hernandez', 2, 2, '+34 789 012 3458', 'adrian.hernandez@webmail.com', 6),
  ('Carlos', 'Silva', 2, 4, '+55 890 123 4569', 'carlos.silva@gmail.com', 16),
  ('Klara', 'Petersen', 2, 1, '+45 901 234 5670', 'klara.petersen@yahoo.com', 22),
  ('Marek', 'Nowakowski', 3, 9, '+48 012 345 6789', 'marek.nowakowski@outlook.com', 4),
  ('Lina', 'Jensen', 2, 6, '+45 123 456 7892', 'lina.jensen@hotmail.com', 32),
  ('Oleg', 'Volkov', 2, 7, '+7 234 567 8900', 'oleg.volkov@mail.ru', 34),
  ('Nina', 'Fischer', 2, 1, '+49 345 678 9016', 'nina.fischer@gmail.com', 5);

INSERT INTO `pbdm_booking_platform_db`.`accommodations` (`owner_id`, `address_id`, `title`, `description`, `max_guests`, `bedrooms`, `bathrooms`, `listed`, `updated`) VALUES
  (2, 2, 'Cosy Apartment in Milan', 'A cosy, well-located apartment in the heart of Milan, perfect for small groups.', 4, 2, 1, '2023-04-05 09:00:00', '2025-04-05 09:10:00'),
  (2, 5, 'Beachfront Villa in Barcelona', 'Stunning villa with ocean views, private pool, and direct beach access.', 8, 4, 3, '2024-04-05 10:00:00', '2025-04-05 10:15:00'),
  (1, 33, 'Luxurious Penthouse in Berlin', 'A lavish penthouse with panoramic city views, ideal for a luxurious stay.', 6, 3, 2, '2024-04-05 13:00:00', '2025-04-05 13:10:00'),
  (1, 24, 'Spacious Apartment in Rome', 'A large apartment close to historical sites, great for families or groups.', 8, 4, 2, '2024-04-05 14:00:00', '2025-04-05 14:05:00'),
  (3, 12, 'Charming Cottage in Edinburgh', 'A quaint, traditional cottage with a warm atmosphere and beautiful garden.', 6, 3, 2, '2025-04-05 11:00:00', NULL),
  (4, 16, 'Modern Studio in Paris', 'A modern studio with stylish design, ideal for couples or solo travelers.', 2, 1, 1, '2025-04-05 12:00:00', NULL),
  (6, 7, 'Cozy Flat in London', 'A warm, welcoming flat in a quiet area of London, perfect for a peaceful stay.', 4, 2, 1, '2025-04-05 15:00:00', '2025-04-05 15:30:00'),
  (7, 11, 'Elegant Villa in Lisbon', 'An elegant villa with a private garden, perfect for a relaxing retreat.', 10, 5, 3, '2024-04-05 16:00:00', '2024-04-05 16:25:00'),
  (8, 18, 'Rustic Chalet in the Swiss Alps', 'A rustic yet modern chalet, ideal for winter sports enthusiasts and nature lovers.', 8, 4, 2, '2025-04-05 17:00:00', NULL),
  (9, 21, 'Stylish Loft in Madrid', 'A chic loft located in the city center, with all amenities for a comfortable stay.', 4, 2, 1, '2025-04-05 18:00:00', '2025-04-05 18:05:00'),
  (10, 3, 'Chic Apartment in Vienna', 'A stylish apartment with contemporary design, perfect for urban explorers.', 3, 1, 1, '2023-04-05 20:00:00', NULL),
  (12, 13, 'Traditional House in Greece', 'A traditional Greek house with a beautiful patio, ideal for a family vacation.', 6, 3, 2, '2025-04-05 21:00:00', NULL),
  (13, 4, 'Urban Loft in Amsterdam', 'A trendy loft with modern decor, right in the heart of Amsterdam.', 2, 1, 1, '2025-04-05 22:00:00', '2025-04-05 22:10:00'),
  (14, 6, 'Countryside Cabin in the UK', 'A cozy cabin located in the British countryside, perfect for a retreat.', 4, 2, 1, '2022-04-05 23:00:00', '2025-04-05 23:30:00'),
  (15, 9, 'Beach House in Nice', 'A beautiful beach house located along the Mediterranean coast, ideal for relaxation.', 6, 3, 2, '2024-04-05 00:00:00', '2025-04-05 00:05:00'),
  (16, 17, 'Mountain Lodge in Norway', 'A mountain lodge with breathtaking views of the fjords, perfect for adventure lovers.', 10, 5, 4, '2025-04-05 01:00:00', '2025-04-05 01:20:00'),
  (17, 19, 'Penthouse in New York', 'A luxurious penthouse with skyline views, perfect for a lavish urban experience.', 4, 2, 1, '2024-04-05 02:00:00', NULL),
  (18, 14, 'Rustic Retreat in Canada', 'A rustic retreat in the Canadian wilderness, ideal for nature lovers.', 8, 4, 2, '2024-04-05 03:00:00', NULL),
  (19, 25, 'Minimalist Apartment in Zurich', 'A modern minimalist apartment with high-end finishes, ideal for short stays.', 2, 1, 1, '2024-04-05 04:00:00', NULL),
  (20, 10, 'Charming Bungalow in South Africa', 'A charming bungalow with a view of the ocean, perfect for relaxation.', 6, 3, 2, '2025-04-05 05:00:00', '2025-04-05 05:30:00');

INSERT INTO `pbdm_booking_platform_db`.`pictures` (`accomm_id`, `size`, `format`, `preview`, `uploaded`) VALUES
  (1, 1.254, 'jpg', true, '2024-09-12 10:23:45'),
  (1, 2.110, 'png', false, '2024-09-13 08:42:13'),
  (2, 0.845, 'jpg', true, '2024-10-01 12:18:22'),
  (2, 1.205, 'webp', false, '2024-10-01 12:19:04'),
  (3, 0.734, 'jpg', true, '2024-07-23 09:30:00'),
  (4, 1.012, 'png', true, '2024-08-15 15:45:12'),
  (5, 1.803, 'jpg', true, '2025-06-18 11:22:07'),
  (5, 2.345, 'webp', false, '2025-06-18 11:22:29'),
  (6, 0.989, 'png', true, '2025-07-05 17:10:55'),
  (7, 1.478, 'jpg', true, '2025-08-03 14:00:00'),
  (8, 2.001, 'jpg', true, '2025-09-09 18:12:34'),
  (8, 1.232, 'webp', false, '2025-09-09 18:14:21'),
  (9, 1.056, 'jpg', true, '2025-10-02 09:09:09'),
  (10, 1.772, 'png', true, '2025-07-22 07:45:10'),
  (11, 0.924, 'jpg', true, '2025-05-30 13:20:44'),
  (12, 1.389, 'webp', true, '2025-11-01 10:00:00'),
  (13, 2.053, 'png', true, '2025-06-14 16:15:20'),
  (14, 1.009, 'jpg', true, '2025-08-21 10:10:10'),
  (15, 2.248, 'webp', true, '2025-10-12 14:45:00'),
  (16, 1.680, 'jpg', true, '2025-09-04 11:30:33'),
  (16, 2.145, 'png', false, '2025-09-04 11:31:10'),
  (17, 0.794, 'jpg', true, '2025-07-16 08:55:00'),
  (18, 1.591, 'webp', true, '2025-06-28 12:00:00'),
  (19, 2.000, 'png', true, '2025-10-25 13:37:37'),
  (19, 1.250, 'jpg', false, '2025-10-25 13:38:12'),
  (20, 1.474, 'jpg', true, '2025-11-10 17:50:00'),
  (3, 0.654, 'webp', false, '2025-07-24 09:31:00'),
  (4, 1.321, 'jpg', false, '2025-08-16 15:45:30'),
  (10, 1.129, 'jpg', false, '2025-07-23 07:46:55'),
  (12, 2.300, 'png', false, '2025-11-01 10:01:20');

INSERT INTO `pbdm_booking_platform_db`.`availability` (`accomm_id`, `available_from`, `available_to`, `price`) VALUES
  (1, '2025-05-01', '2025-06-01', 85.00),
  (1, '2025-06-02', DEFAULT, 95.00),
  (2, '2025-04-10', '2025-04-30', 120.00),
  (2, '2025-05-01', DEFAULT, 130.00),
  (3, '2025-06-15', DEFAULT, 110.00),
  (4, '2025-04-01', '2025-04-10', 75.00),
  (4, '2025-04-16', DEFAULT, 80.00),
  (5, '2025-05-10', DEFAULT, 105.00),
  (6, '2025-06-01', '2025-06-10', 95.00),
  (6, '2025-06-11', DEFAULT, 100.00),
  (7, '2025-07-01', '2025-08-15', 150.00),
  (8, '2025-05-01', DEFAULT, 135.00),
  (9, '2025-06-05', DEFAULT, 145.00),
  (10, '2025-04-20', '2025-05-20', 90.00),
  (11, '2025-04-01', '2025-04-12', 80.00),
  (12, '2025-05-15', '2025-06-15', 125.00),
  (13, '2025-06-01', '2025-07-01', 140.00),
  (14, '2025-06-10', DEFAULT, 160.00),
  (15, '2025-05-01', '2025-05-15', 100.00),
  (17, '2025-05-16', DEFAULT, 110.00),
  (16, '2025-04-01', '2025-04-30', 95.00),
  (18, '2025-07-01', DEFAULT, 210.00),
  (19, '2025-08-01', DEFAULT, 250.00),
  (7, '2025-08-16', DEFAULT, 155.00),
  (9, '2025-07-01', '2025-08-01', 130.00),
  (10, '2025-06-01', DEFAULT, 120.00),
  (13, '2025-07-02', DEFAULT, 145.00),
  (12, '2025-06-16', DEFAULT, 135.00),
  (11, '2025-04-25', DEFAULT, 89.99),
  (20, '2025-08-05', DEFAULT, 140.00);

-- Schedule deletion events to keep up query performance --
SET GLOBAL event_scheduler = ON;
CREATE EVENT delete_old_availabilities
ON SCHEDULE EVERY 1 DAY
DO
  DELETE FROM `pbdm_booking_platform_db`.`availability`
  WHERE `available_to` < CURDATE();

INSERT INTO `pbdm_booking_platform_db`.`tickets` (`user_id`, `category_id`, `title`, `ticket_text`, `created`, `last_updated`, `employee_id`, `status_id`) VALUES
  (5, 7, 'Wi-Fi not working', 'The accommodation had no internet access.', '2025-04-01 09:23:00', NULL, 4, DEFAULT),
  (17, 1, 'Wrong payment charged', 'I was charged twice for my stay.', '2025-04-02 10:15:00', '2025-04-03 08:45:00', 9, 2),
  (8, 12, 'Host never replied', 'I sent several messages but got no reply.', '2025-04-02 14:50:00', NULL, NULL, DEFAULT),
  (29, 7, 'Property pictures misleading', 'The apartment did not match the pictures.', '2025-04-03 11:22:00', '2025-04-04 07:00:00', 12, 3),
  (13, 2, 'Check-in instructions unclear', 'The lockbox code was incorrect.', '2025-04-03 16:33:00', NULL, 5, DEFAULT),
  (22, 3, 'Need to cancel booking', 'I have an emergency and must cancel.', '2025-04-03 19:44:00', NULL, 19, 2),
  (33, 10, 'App crashing on iPhone', 'Every time I try to book, it crashes.', '2025-04-04 08:10:00', '2025-04-04 08:30:00', 7, 4),
  (2, 1, 'Payout delayed', 'I was supposed to be paid two days ago.', '2025-04-04 12:55:00', NULL, NULL, DEFAULT),
  (19, 12, 'Lost item', 'I forgot my charger in the apartment.', '2025-04-04 13:45:00', NULL, 1, 5),
  (27, 2, 'Booking disappeared', 'My confirmed booking is gone from dashboard.', '2025-04-04 14:00:00', NULL, NULL, 8),
  (6, 1, 'Discount not applied', 'I had a voucher but it didnt work.', '2025-04-04 15:15:00', NULL, 3, DEFAULT),
  (31, 2, 'How to extend stay?', 'Can I extend my stay without new booking?', '2025-04-04 16:25:00', NULL, 11, 2),
  (40, 2, 'Check-out confusion', 'Do I need to clean before I leave?', '2025-04-04 17:00:00', NULL, NULL, DEFAULT),
  (1, 12, 'Unresponsive support', 'Tried calling for hours.', '2025-04-04 17:45:00', '2025-04-04 18:10:00', 6, 3),
  (12, 10, 'Problem uploading photos', 'Upload keeps failing at 90%.', '2025-04-05 09:00:00', NULL, 16, 2),
  (16, 12, 'Stranger entered property', 'Someone used a duplicate key.', '2025-04-05 10:10:00', '2025-04-05 11:00:00', 14, 4),
  (7, 2, 'Language barrier with host', 'Could not communicate check-in time.', '2025-04-05 11:45:00', NULL, NULL, DEFAULT),
  (24, 5, 'Cant delete account', 'I want to remove all my data.', '2025-04-05 13:30:00', NULL, 10, 5),
  (10, 1, 'Service fee clarification', 'What is the fee on my invoice?', '2025-04-05 14:20:00', NULL, NULL, DEFAULT),
  (20, 3, 'Refund not received', 'I was promised a refund 2 weeks ago.', '2025-04-05 15:15:00', '2025-04-05 16:30:00', 8, 3);

INSERT INTO `pbdm_booking_platform_db`.`ticket_updates` (`ticket_id`, `action`, `updated`, `employee_id`) VALUES
  (1, 'Assigned to support team', '2025-04-01 10:30:00', 4),
  (2, 'Refund issued to the user', '2025-04-02 09:00:00', 9),
  (3, 'Escalated to the manager', '2025-04-02 11:00:00', 5),
  (4, 'Pictures updated to reflect actual accommodation', '2025-04-03 09:30:00', 12),
  (5, 'Sent clarification email to user', '2025-04-03 16:00:00', 6),
  (6, 'User informed about the cancellation process', '2025-04-03 17:10:00', 3),
  (7, 'User given compensation for the issue', '2025-04-04 10:00:00', 11),
  (8, 'Support ticket marked as resolved', '2025-04-04 13:30:00', 8),
  (9, 'Investigated technical issue with booking system', '2025-04-04 14:15:00', 10),
  (10, 'Refund processing started', '2025-04-05 10:20:00', 7),
  (11, 'Notified user of extended stay options', '2025-04-05 14:00:00', 13),
  (12, 'Checked booking history, case resolved', '2025-04-05 15:30:00', 2),
  (13, 'Reported issue to the technical team', '2025-04-05 16:00:00', 14),
  (14, 'Awaiting approval from user for solution', '2025-04-06 09:00:00', 1),
  (15, 'Requested additional details from user', '2025-04-06 12:45:00', 15),
  (16, 'User advised on local laws regarding bookings', '2025-04-06 14:10:00', 16),
  (17, 'User was issued a voucher for inconvenience', '2025-04-06 17:00:00', 17),
  (7, 'Resolved technical issue with app crashing', '2025-04-06 18:00:00', 18),
  (19, 'Removed unauthorized access from user account', '2025-04-06 20:00:00', 19),
  (3, 'Set account to "inactive" as per user request', '2025-04-07 08:00:00', 20);

INSERT INTO `pbdm_booking_platform_db`.`payments` (`payment_method_id`, `amount`, `paid`, `user_id`, `confirmed`, `refunded`) VALUES
  (1, 600.00, '2025-04-01 10:00:00', 1, true, false),
  (2, 450.00,'2025-04-02 11:30:00', 2, true, true),
  (5, 150.00,'2025-04-02 14:15:00', 3, true, false),
  (6, 295.00,'2025-04-03 09:45:00', 4, true, false),
  (1, 188.00,'2025-04-03 12:00:00', 5, false, false),
  (9, 423.55,'2025-04-04 10:30:00', 6, true, false),
  (4, 66.00,'2025-04-04 15:00:00', 3, true, true),
  (6, 850.00,'2025-04-05 13:30:00', 8, true, false),
  (1, 123.00,'2025-04-05 16:00:00', 9, true, false),
  (2, 220.00,'2025-04-06 09:00:00', 10, false, false),
  (4, 150.00,'2025-04-06 11:20:00', 11, true, true),
  (6, 400.00,'2025-04-06 14:30:00', 12, true, false),
  (10, 640.00,'2025-04-07 10:10:00', 22, true, false),
  (2, 300.00,'2025-04-07 13:50:00', 1, true, false),
  (4, 210.00,'2025-04-08 09:30:00', 40, true, false),
  (6, 560.00,'2025-04-08 11:00:00', 23, true, false),
  (1, 630.00,'2025-04-09 14:20:00', 26, true, true),
  (2, 444.00,'2025-04-09 16:00:00', 21, true, false),
  (4, 226.77,'2025-04-10 08:40:00', 5, false, false),
  (3, 456.23,'2025-04-10 13:10:00', 7, true, false);

INSERT INTO `pbdm_booking_platform_db`.`bookings` (`date`, `guest_id`, `accomm_id`, `booked_from`, `booked_to`, `no_guests`, `price`) VALUES
  ('2025-04-01 10:00:00', 1, 1, '2025-04-01', '2025-04-05', 2, 600.00),
  ('2025-04-02 15:30:00', 1, 2, '2025-04-02', '2025-04-06', 1, 300.00),
  ('2025-04-03 09:00:00', 3, 3, '2025-04-03', '2025-04-07', 4, 1000.00),
  ('2025-04-04 12:15:00', 24, 4, '2025-04-04', '2025-04-08', 3, 900.00),
  ('2025-04-05 14:00:00', 5, 5, '2025-04-05', '2025-04-10', 2, 600.00),
  ('2025-04-06 16:45:00', 26, 6, '2025-04-06', '2025-04-11', 1, 350.00),
  ('2025-04-07 11:30:00', 27, 7, '2025-04-07', '2025-04-12', 5, 1500.00),
  ('2025-04-08 13:45:00', 28, 8, '2025-04-08', '2025-04-13', 2, 700.00),
  ('2025-04-09 10:30:00', 29, 9, '2025-04-09', '2025-04-14', 3, 1100.00),
  ('2025-04-10 14:15:00', 30, 10, '2025-04-10', '2025-04-15', 4, 1300.00),
  ('2025-04-11 17:00:00', 31, 11, '2025-04-11', '2025-04-16', 1, 350.00),
  ('2025-04-12 19:30:00', 32, 12, '2025-04-12', '2025-04-17', 2, 750.00),
  ('2025-04-13 11:00:00', 33, 13, '2025-04-13', '2025-04-18', 1, 400.00),
  ('2025-04-14 15:45:00', 34, 14, '2025-04-14', '2025-04-19', 3, 1300.00),
  ('2025-04-15 10:30:00', 35, 15, '2025-04-15', '2025-04-20', 2, 700.00),
  ('2025-04-16 16:00:00', 36, 16, '2025-04-16', '2025-04-21', 4, 1500.00),
  ('2025-04-17 14:15:00', 37, 17, '2025-04-17', '2025-04-22', 5, 2000.00),
  ('2025-04-18 12:00:00', 38, 18, '2025-04-18', '2025-04-23', 2, 800.00),
  ('2025-04-19 10:30:00', 39, 19, '2025-04-19', '2025-04-24', 3, 1200.00),
  ('2025-04-20 13:00:00', 40, 20, '2025-04-20', '2025-04-25', 1, 450.00);

INSERT INTO `pbdm_booking_platform_db`.`ratings` (`date`, `booking_id`, `rtng_count`, `rtng_text`, `guest_id`, `accomm_id`) VALUES
  ('2025-03-15', 1, 5, 'Amazing stay! Everything was perfect.', 21, 1),
  ('2025-03-16', 2, 4, 'Good location but noisy neighbors.', 22, 2),
  ('2025-03-17', 3, 3, 'Okay stay, the place was clean but lacked some amenities.', 23, 3),
  ('2025-03-18', 4, 5, 'Fantastic experience, highly recommend!', 24, 4),
  ('2025-03-19', 5, 2, 'Not as expected, the photos were misleading.', 25, 5),
  ('2025-03-20', 6, 4, 'Nice stay, but the bed was uncomfortable.', 26, 6),
  ('2025-03-21', 7, 5, 'Perfect for a weekend getaway.', 27, 7),
  ('2025-03-22', 8, 3, 'The location was great, but the heating didn’t work.', 28, 8),
  ('2025-03-23', 9, 4, 'Overall good experience but could be improved with more kitchen supplies.', 29, 9),
  ('2025-03-24', 10, 1, 'Very disappointing, not clean and poorly maintained.', 30, 10),
  ('2025-03-25', 11, 5, 'A wonderful place, will definitely come back.', 31, 11),
  ('2025-03-26', 12, 2, 'The house was good, but communication with the host could be improved.', 32, 12),
  ('2025-03-27', 13, 4, 'Had a great time, but the wifi didn’t work well.', 33, 13),
  ('2025-03-28', 14, 5, 'The place was lovely, just like in the pictures!', 34, 14),
  ('2025-03-29', 15, 3, 'It was okay, nothing special about the place.', 35, 15),
  ('2025-03-30', 16, 4, 'Great location, very convenient.', 36, 16),
  ('2025-03-31', 17, 5, 'Perfect! Exactly what we needed for our vacation.', 37, 17),
  ('2025-04-01', 18, 2, 'Good, but we had some issues with the air conditioning.', 38, 18),
  ('2025-04-02', 19, 3, 'Good for the price, but not a luxurious experience.', 39, 19),
  ('2025-04-03', 20, 4, 'Comfortable and clean, would stay again.', 40, 20);

INSERT INTO `pbdm_booking_platform_db`.`conversations` (`guest_id`, `host_id`, `accomm_id`, `created`) VALUES
  (21, 1, 3, '2025-01-15 09:00:00'),
  (1, 2, 2, '2024-12-16 10:30:00'),
  (23, 8, 1, '2025-02-17 11:45:00'),
  (24, 4, 4, '2025-03-18 14:00:00'),
  (25, 5, 5, '2024-11-19 15:30:00'),
  (26, 6, 6, '2025-01-20 16:45:00'),
  (27, 7, 7, '2025-02-21 17:00:00'),
  (1, 8, 1, '2025-03-22 18:30:00'),
  (29, 9, 9, '2024-10-23 19:00:00'),
  (30, 10, 10, '2025-04-24 20:15:00'),
  (31, 11, 11, '2025-03-25 08:45:00'),
  (32, 12, 12, '2024-09-26 09:30:00'),
  (33, 13, 13, '2025-02-27 10:15:00'),
  (34, 14, 14, '2024-08-28 11:00:00'),
  (35, 15, 15, '2025-01-29 12:30:00'),
  (36, 16, 16, '2024-07-30 13:15:00'),
  (37, 17, 17, '2025-03-31 14:00:00'),
  (38, 18, 18, '2024-06-01 15:45:00'),
  (39, 19, 19, '2025-02-02 16:00:00'),
  (40, 20, 20, '2025-04-03 17:30:00');

INSERT INTO `pbdm_booking_platform_db`.`messages` (`conversation_id`, `sender_id`, `message_text`, `sent`, `read`) VALUES
  (1, 1, 'Hello, I am interested in booking your accommodation for next weekend.', '2025-03-01 14:30:00', false),
  (1, 2, 'Hi, thanks for reaching out! Let me know if you need any more details.', '2025-03-01 15:00:00', true),
  (2, 3, 'I have some questions about the amenities. Is the Wi-Fi fast enough for work?', '2025-03-02 09:00:00', false),
  (2, 4, 'Yes, the Wi-Fi is great! I work remotely from there all the time.', '2025-03-02 09:30:00', true),
  (3, 5, 'Can I bring my pet with me? I see its not mentioned in the listing.', '2025-03-03 10:00:00', false),
  (3, 6, 'Sorry, no pets allowed in the house. Let me know if you have other questions!', '2025-03-03 10:15:00', true),
  (4, 7, 'I want to book for two nights, is there a discount for longer stays?', '2025-03-04 11:00:00', false),
  (4, 8, 'We can offer a discount for stays over a week. Let me know if youre interested!', '2025-03-04 11:30:00', true),
  (5, 9, 'Is the place available for the upcoming holidays?', '2025-03-05 12:00:00', false),
  (5, 10, 'Yes, it is! Feel free to book any time.', '2025-03-05 12:30:00', true),
  (6, 11, 'Do you offer airport transfers for guests?', '2025-03-06 13:00:00', false),
  (6, 12, 'We dont offer transfers, but we can recommend some taxi services!', '2025-03-06 13:30:00', true),
  (7, 13, 'Could you send me more pictures of the property? I want to see the kitchen.', '2025-03-07 14:00:00', false),
  (7, 14, 'Sure, Ill send you a few more pictures soon.', '2025-03-07 14:30:00', true),
  (8, 15, 'What time is check-in? I want to arrive early.', '2025-03-08 15:00:00', false),
  (8, 16, 'Check-in is at 3 PM, but if you arrive earlier, I can try to accommodate you.', '2025-03-08 15:30:00', true),
  (9, 17, 'I have a question about the parking situation. Is there a spot for my car?', '2025-03-09 16:00:00', false),
  (9, 18, 'Yes, there is free parking available on-site for all guests.', '2025-03-09 16:30:00', true),
  (10, 19, 'Are there any additional fees I should be aware of?', '2025-03-10 17:00:00', false),
  (10, 20, 'No additional fees, the price is all-inclusive!', '2025-03-10 17:30:00', true),
  (11, 1, 'Can I change my booking dates? I need to shift it by a day.', '2025-03-11 18:00:00', false),
  (11, 2, 'Sure, I can adjust the dates for you. Let me know your preferred day.', '2025-03-11 18:30:00', true),
  (12, 3, 'Whats the cancellation policy?', '2025-03-12 19:00:00', false),
  (12, 4, 'You can cancel free of charge up to 48 hours before your check-in date.', '2025-03-12 19:30:00', true),
  (13, 5, 'I had an issue with the heating system last time I stayed. Is it fixed now?', '2025-03-13 20:00:00', false),
  (13, 6, 'Yes, the heating system has been repaired and fully operational now.', '2025-03-13 20:30:00', true),
  (14, 7, 'Is the area safe at night? Ill be arriving late.', '2025-03-14 21:00:00', false),
  (14, 8, 'The area is very safe, and I can provide you with emergency contacts if needed.', '2025-03-14 21:30:00', true),
  (15, 9, 'Can I rent extra towels for my stay? I have a large group.', '2025-03-15 22:00:00', false),
  (15, 10, 'Yes, I can arrange extra towels for you. No problem!', '2025-03-15 22:30:00', true),
  (16, 11, 'Whats the best way to get to the property from the train station?', '2025-03-16 23:00:00', false),
  (16, 12, 'You can take a bus from the station or grab a taxi. Its only a 10-minute drive.', '2025-03-16 23:30:00', true),
  (17, 13, 'Is there a gym available for guests? I like to work out while Im traveling.', '2025-03-17 00:00:00', false),
  (17, 14, 'Unfortunately, we dont have a gym, but we do have a lovely walking trail nearby!', '2025-03-17 00:30:00', true),
  (18, 15, 'Can I have a late check-out? My flight is in the evening.', '2025-03-18 01:00:00', false),
  (18, 16, 'I can offer a late check-out for an extra charge. Let me know if that works.', '2025-03-18 01:30:00', true),
  (19, 17, 'Do you have any discounts for extended stays? Im thinking of booking for a month.', '2025-03-19 02:00:00', false),
  (19, 18, 'Yes, I offer a discount for monthly bookings. Let me know if you want to proceed!', '2025-03-19 02:30:00', true),
  (20, 19, 'I have a question about the location. Is it close to restaurants and shops?', '2025-03-20 03:00:00', false),
  (20, 20, 'Yes, there are many restaurants and shops within walking distance. Youll love it!', '2025-03-20 03:30:00', true);


-- Populate mapping tables with FK pairs --
INSERT INTO `pbdm_booking_platform_db`.`accommodation_properties` (`accomm_id`, `property_id`) VALUES
  (1, 1), (1, 2), (1, 3), (1, 4), (1, 5), -- Accommodation 1 with 5 properties
  (2, 6), (2, 7), (2, 8), (2, 9), -- Accommodation 2 with 4 properties
  (3, 10), (3, 11), (3, 12), (3, 13), (3, 14), -- Accommodation 3 with 5 properties
  (4, 15), (4, 16), (4, 17), -- Accommodation 4 with 3 properties
  (5, 18), (5, 19), (5, 20), (5, 21), (5, 22), -- Accommodation 5 with 5 properties
  (6, 1), (6, 2), (6, 23), -- Accommodation 6 with 3 properties
  (7, 3), (7, 4), (7, 5), (7, 6), (7, 7), (7, 8), -- Accommodation 7 with 6 properties
  (8, 9), (8, 10), (8, 11), (8, 12), (8, 13), -- Accommodation 8 with 5 properties
  (9, 14), (9, 15), (9, 16), -- Accommodation 9 with 3 properties
  (10, 17), (10, 18), (10, 19), (10, 20), -- Accommodation 10 with 4 properties
  (11, 21), (11, 22), (11, 23), (11, 5), -- Accommodation 11 with 4 properties
  (12, 6), (12, 7), (12, 8), -- Accommodation 12 with 3 properties
  (13, 9), (13, 10), (13, 11), (13, 12), -- Accommodation 13 with 4 properties
  (14, 13), (14, 14), (14, 15), (14, 16), -- Accommodation 14 with 4 properties
  (15, 17), (15, 18), (15, 19), -- Accommodation 15 with 3 properties
  (16, 20), (16, 21), (16, 22), (16, 23), -- Accommodation 16 with 4 properties
  (17, 1), (17, 6), (17, 3), (17, 4), (17, 8), -- Accommodation 17 with 5 properties
  (18, 5), (18, 9), (18, 10), (18, 11), -- Accommodation 18 with 4 properties
  (19, 2), (19, 4), (19, 13), (19, 18), -- Accommodation 19 with 4 properties
  (20, 14), (20, 16), (20, 17), (20, 23); -- Accommodation 20 with 4 properties

INSERT INTO `pbdm_booking_platform_db`.`favorites` (`user_id`, `accomm_id`) VALUES
  (1, 1), (1, 3), (1, 5), (1, 7), -- Guest 1 with 4 favorite accommodations
  (3, 1), (3, 2), (3, 5), -- Guest 3 with 3 favorite accommodations
  (4, 9), (4, 10), (4, 11), -- Guest 4 with 3 favorite accommodations
  (5, 12), (5, 13), (5, 14), (5, 15), -- Guest 5 with 4 favorite accommodations
  (7, 19), (7, 20), (7, 5), (7, 10), -- Guest 7 with 4 favorite accommodations
  (8, 1), (8, 7), (8, 12), -- Guest 8 with 3 favorite accommodations
  (9, 9), (9, 10), (9, 3), -- Guest 9 with 3 favorite accommodations
  (10, 2), (10, 4), (10, 6), -- Guest 10 with 3 favorite accommodations
  (11, 7), (11, 8), (11, 11), -- Guest 11 with 3 favorite accommodations
  (12, 13), (12, 14), (12, 17), -- Guest 12 with 3 favorite accommodations
  (13, 19), (13, 20), (13, 3), -- Guest 13 with 3 favorite accommodations
  (21, 1), (21, 3), (21, 6), (21, 10), -- Guest 21 with 4 favorite accommodations
  (22, 2), (22, 4), (22, 8), -- Guest 22 with 3 favorite accommodations
  (24, 7), (24, 10), (24, 11), (24, 14), -- Guest 24 with 4 favorite accommodations
  (25, 12), (25, 13), (25, 15), -- Guest 25 with 3 favorite accommodations
  (26, 16), (26, 17), (26, 18), -- Guest 26 with 3 favorite accommodations
  (27, 19), (27, 20), (27, 2), -- Guest 27 with 3 favorite accommodations
  (28, 4), (28, 7), (28, 10), -- Guest 28 with 3 favorite accommodations
  (29, 11), (29, 13), (29, 15), -- Guest 29 with 3 favorite accommodations
  (31, 18), (31, 19), (31, 20), -- Guest 31 with 3 favorite accommodations
  (32, 2), (32, 3), (32, 9), -- Guest 32 with 3 favorite accommodations
  (33, 4), (33, 6), (33, 13), -- Guest 33 with 3 favorite accommodations
  (34, 5), (34, 7), (34, 10), -- Guest 34 with 3 favorite accommodations
  (35, 12), (35, 13), (35, 17), -- Guest 35 with 3 favorite accommodations
  (36, 8), (36, 11), (36, 19), -- Guest 36 with 3 favorite accommodations
  (37, 15), (37, 18), (37, 20), -- Guest 37 with 3 favorite accommodations
  (40, 2), (40, 5), (40, 10); -- Guest 40 with 3 favorite accommodations

INSERT INTO `pbdm_booking_platform_db`.`booking_payments` (`payment_id`, `booking_id`) VALUES
  (1, 1),
  (2, 14),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 9),
  (10, 10),
  (11, 11),
  (12, 12),
  (13, 13),
  (14, 2),
  (15, 15),
  (16, 16),
  (17, 17),
  (18, 18),
  (19, 19),
  (20, 20);

INSERT INTO `pbdm_booking_platform_db`.`user_roles` (`user_id`, `role_id`) VALUES
  (18, 1), (18, 2), -- Host and Guest
  (7, 1), (7, 2), -- Host and Guest
  (12, 1), (12, 2), -- Host and Guest
  (2, 1), (2, 2), -- Host and Guest
  (13, 1), (13, 2), -- Host and Guest
  (11, 1), (11, 2), -- Host and Guest
  (3, 1), (3, 2), -- Host and Guest
  (4, 1), (4, 2), -- Host and Guest
  (5, 1), (5, 2), -- Host and Guest
  (6, 1), (6, 2), -- Host and Guest
  (14, 1), -- Host only
  (19, 1), -- Host only
  (9, 1), (9, 2), -- Host and Guest
  (15, 1), -- Host only
  (16, 1), -- Host only
  (8, 1), (8, 2), -- Host and Guest
  (17, 1), -- Host only
  (10, 1), (10, 2), -- Host and Guest
  (1, 1), (1, 2), -- Host and Guest
  (20, 1), -- Host only
  (21, 2), -- Guest only
  (27, 2), -- Guest only
  (22, 2), -- Guest only
  (25, 2), -- Guest only
  (26, 2), -- Guest only
  (23, 2), -- Guest only
  (28, 2), -- Guest only
  (30, 2), -- Guest only
  (31, 2), -- Guest only
  (24, 2), -- Guest only
  (32, 2), -- Guest only
  (33, 2), -- Guest only
  (34, 2), -- Guest only
  (35, 2), -- Guest only
  (36, 2), -- Guest only
  (37, 2), -- Guest only
  (38, 2), -- Guest only
  (39, 2), -- Guest only
  (40, 2); -- Guest only

INSERT INTO `pbdm_booking_platform_db`.`employee_roles` (`employee_id`, `role_id`) VALUES
  (1, 4), (1, 5), -- Admin and Developer
  (3, 4), (3, 6), -- Admin and Support
  (2, 6), (2, 3), -- Support and Moderator
  (4, 5), (4, 6), -- Developer and Support
  (5, 5), (5, 3), -- Developer and Moderator
  (6, 6), (6, 3), -- Support and Moderator
  (9, 6), (9, 3), -- Support and Moderator
  (7, 4), (7, 5), (7, 6), -- Admin, Developer, and Support
  (8, 3), (8, 5), (8, 6), -- Moderator, Developer, and Support
  (10, 5), (10, 6), (10, 3), -- Developer, Support, and Moderator
  (11, 5), -- Developer
  (14, 5), -- Developer
  (19, 5), -- Developer
  (12, 6), -- Support
  (13, 6), -- Support
  (20, 6), -- Support
  (15, 3), -- Moderator
  (16, 3), -- Moderator
  (17, 4), -- Admin
  (18, 4); -- Admin

INSERT INTO `pbdm_booking_platform_db`.`role_permissions` (`role_id`, `permission_id`) VALUES
  -- role permissions are assigned according to permission matrix to implement RBAC--
  (1, 1), (1, 2), (1, 5), (1, 6), (1, 8), (1, 10), (1, 15), (1, 25), (1, 26), -- host permissions
  (2, 3), (2, 4), (2, 8), (2, 9), (2, 11), (2, 13), (2, 14), (2, 15), (2, 25), (2, 26), -- guest permissions
  (3, 6), (3, 15), (3, 16), (3, 17), (3, 18), (3, 19), (3, 26), -- mod permissions
  (4, 2), (4, 5), (4, 6), (4, 7), (4, 12), (4, 14), (4, 15), (4, 16), (4, 17), (4, 18), (4, 19), (4, 20), (4, 21), (4, 22), (4, 26), (4, 27), -- admin permissions
  (5, 6), (5, 15), (5, 20), (5, 21),  (5, 22), (5, 23), (5, 24), (5, 26),-- dev permissions
  (6, 5), (6, 6), (6, 7), (6, 12), (6, 15), (6, 18), (6, 19), (6, 20), (6, 21), (6, 26); -- support permissions

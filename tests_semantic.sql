-- TEST CASE: View Profil Data for User 1 from different perspectives --

-- view guest perspective --
SELECT 
	-- User Info
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    -- Booking Info
    b.booking_id,
    b.booked_from,
    b.booked_to,
    b.accomm_id,
    b.price,
    -- Payment Info
    p.paid,
    p.amount,
    p.payment_id,
    p.confirmed,
    p.refunded,
    -- Conversations
    c.conversation_id,
    c.message_count
FROM users u
-- Bookings made by the user
LEFT JOIN bookings b ON u.user_id = b.guest_id
-- Payments made by the user
LEFT JOIN booking_payments bp on b.booking_id = bp.booking_id
LEFT JOIN payments p ON u.user_id = p.user_id AND bp.payment_id = p.payment_id
-- Conversations involving user as guest
LEFT JOIN conversations c ON u.user_id = c.guest_id AND b.accomm_id = c.accomm_id
WHERE u.user_id = 1;

-- single queries to check result for plasibility--
SELECT * from conversations WHERE guest_id = 1; -- expect conversation 2 and 8
SELECT * from messages WHERE conversation_id = 2 OR conversation_id = 8; -- expect 2 messages per conversation
SELECT * from bookings WHERE guest_id = 1; -- expect booking 1 and 2
SELECT * from payments WHERE user_id = 1; -- expect payments 1 and 14
SELECT * FROM booking_payments WHERE payment_id = 1 OR payment_id = 14; -- expect booking 1 and 2
SELECT * FROM booking_payments WHERE booking_id = 1 OR booking_id = 2; -- expect payment 1 and 14

-- view host perspective --
SELECT 
	-- User Info
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    -- Accommodations Owned
    ac.accomm_id,
    ac.title AS accommodation_owned,
    -- Accommodation Address
    ad.country,
    ad.postal_code,
    ad.city,
    ad.street,
    ad.street_no,
    -- Accommodation pictures
    pic.picture_count,
	-- Accommodation Properties
    p.property_count,
    -- Conversations
    c.conversation_id,
    c.message_count,
    -- Bookings
    b.booking_count
FROM users u
-- Accommodations owned by user
LEFT JOIN accommodations ac ON u.user_id = ac.owner_id
-- Accommodation addresses
LEFT JOIN addresses ad ON ac.address_id = ad.address_id
-- Number of pictures uploaded for the accommodation
LEFT JOIN (
	SELECT accomm_id, COUNT(*) AS picture_count
    FROM pictures
    GROUP BY accomm_id
	) pic ON ac.accomm_id = pic.accomm_id
-- Accommodation properties related to owned accommodations
LEFT JOIN (
    SELECT 
        ap.accomm_id,
        COUNT(ap.property_id) AS property_count
    FROM accommodation_properties ap
    GROUP BY ap.accomm_id
) p ON ac.accomm_id = p.accomm_id
-- Conversations on the accommodations involving user as host
LEFT JOIN conversations c ON u.user_id = c.host_id AND ac.accomm_id = c.accomm_id
-- Number of bookings made for the accommodations
LEFT JOIN (
	SELECT accomm_id, COUNT(*) AS booking_count
    FROM bookings
    GROUP BY accomm_id
	) b ON ac.accomm_id = b.accomm_id
WHERE u.user_id = 1;

-- single queries to check result for plasibility--
select * from accommodations where owner_id = 1; -- expect accommodations 3 and 4 with addresses 33 and 24
select * from addresses where address_id = 33 OR address_id = 24; -- expected accommodation addresses
select * from pictures WHERE accomm_id = 3 OR accomm_id = 4; -- expect two pictures each
select * from accommodation_properties where accomm_id = 3; -- expect 5 properties
select * from accommodation_properties where accomm_id = 4; -- expect 3 properties
select * from conversations where host_id = 1; -- expect conversation 1
select * from messages where conversation_id = 1; -- expect 2 messages per conversation
select * from bookings where accomm_id = 3 OR accomm_id = 4; -- expect 1 booking each

-- view management perspective --
SELECT 
	-- User Info
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    -- User Address
    a.country,
    a.postal_code,
    a.city,
    a.street,
    a.street_no,
    -- Role Info
    r.role_count,
    -- Permission Info
    p.permission_count,
    -- Support Tickets
    t.ticket_id,
    t.title AS ticket_subject,
    t.status_id AS ticket_status,
    t.last_updated,
    -- Ticket Updates
    tu.update_count
FROM users u
-- Address of the user
LEFT JOIN addresses a ON u.address_id = a.address_id
-- Roles of the user
LEFT JOIN (
    SELECT 
        ur.user_id,
        COUNT(ur.role_id) AS role_count
    FROM user_roles ur
    GROUP BY ur.user_id
) r ON u.user_id = r.user_id
-- Permission of the user
LEFT JOIN (
    SELECT 
        ur.user_id,
        COUNT(DISTINCT rp.permission_id) AS permission_count
    FROM user_roles ur
    JOIN role_permissions rp ON ur.role_id = rp.role_id
    GROUP BY ur.user_id
) p ON u.user_id = p.user_id
-- Tickets created by user
LEFT JOIN tickets t ON u.user_id = t.user_id
-- Ticket updates related to those tickets
LEFT JOIN (
	SELECT ticket_id, COUNT(*) AS update_count
    FROM ticket_updates
    GROUP BY ticket_id
	) tu ON t.ticket_id = tu.ticket_id
WHERE u.user_id = 1;

-- single queries to check result for plasibility--
select * from users where user_id = 1; -- expected user data
select * from addresses where address_id = 15; -- expected user address
select * from tickets where user_id = 1; -- expect support ticket 14
select * from ticket_updates where ticket_id = 14; -- expect 1 ticket update
select * from user_roles where user_id = 1; -- expect 2 roles
select distinct permission from permissions p left join role_permissions rp on p.permission_id = rp.permission_id where role_id =1 or role_id = 2; -- expect 15 different permissions

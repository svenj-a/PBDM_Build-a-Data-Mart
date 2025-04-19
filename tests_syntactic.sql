-- test trigger update_tickets_last_updated --
-- if all non-null values are equal, then the trigger works as indented --
SELECT
    t.ticket_id,
    t.last_updated,
    tu.max_updated AS expected_last_updated,
    CASE
        WHEN t.last_updated = tu.max_updated THEN '✅ OK'
        ELSE '❌ MISMATCH'
    END AS trigger_check
FROM
    tickets t
LEFT JOIN (
    SELECT ticket_id, MAX(updated) AS max_updated
    FROM ticket_updates
    GROUP BY ticket_id
) tu ON t.ticket_id = tu.ticket_id;
  
-- test trigger update_conversations_message_count --
-- if all non-null values are equal, then the trigger works as indented --
SELECT
    c.conversation_id,
    c.message_count,
    m.msg_count AS expected_message_count,
    CASE
        WHEN c.message_count = m.msg_count THEN '✅ OK'
        ELSE '❌ MISMATCH'
    END AS trigger_check
FROM
    conversations c
LEFT JOIN (
    SELECT conversation_id, COUNT(conversation_id) AS msg_count
    FROM messages
    GROUP BY conversation_id
) m ON c.conversation_id = m.conversation_id;

-- test event delete_old_availabilities --
-- should return only rows with available_to > today --
SELECT * FROM availability;
-- should return no rows --
SELECT * FROM availability WHERE available_to < NOW();

-- test trigger prevent_conversations_have_same_users --
-- expected to fail with error message: Guest and host cannot be the same user. --
INSERT INTO `pbdm_booking_platform_db`.`conversations` (`guest_id`, `host_id`, `accomm_id`, `created`) VALUES
  (1, 1, 1, NOW());

-- test schema violations (example for user table, could be extended analogously for all tables)--
-- expected to fail because of duplicated email--
INSERT INTO `pbdm_booking_platform_db`.`users` (`first_name`, `last_name`, `status_id`, `pref_pay_method_id`, `phone`, `email`, `address_id`) VALUES
  ('Luca', 'Bianchi', 1, NULL, '+39 123 456 7890', 'luca.bianchi@yahoo.com', 15);

-- expected to fail because of not null first_name--
INSERT INTO `pbdm_booking_platform_db`.`users` (`last_name`, `status_id`, `pref_pay_method_id`, `phone`, `email`, `address_id`) VALUES
  ('Bianchi', 1, NULL, '+39 123 456 7890', 'luca.bianchi@yahoo.com', 15);

-- 8. Transactions & Concurrency

USE hospital_db;

-- Scenario: Booking an appointment and reserving a room/billing slot atomically.
-- If the insert into Appointments succeeds but Billing prep fails, roll back everything.

START TRANSACTION;

INSERT INTO Appointments (patient_id, provider_id, start_time, end_time, reason, status)
VALUES (3, 2, '2023-12-01 09:00:00', '2023-12-01 09:30:00', 'Emergency', 'Scheduled');

-- Simulate a variable to capture the ID
SET @new_app_id = LAST_INSERT_ID();

-- Hypothetical Check: If provider is double booked, rollback (Logic usually in app layer, here simulated)
-- IF (SELECT COUNT(*) FROM Appointments WHERE provider_id = 2 AND start_time = '2023-12-01 09:00:00') > 1 THEN
--    ROLLBACK;
-- ELSE
--    COMMIT;
-- END IF;

COMMIT;

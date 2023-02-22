delimiter //
CREATE TRIGGER user_user_AU
AFTER UPDATE ON user_user
FOR EACH ROW
BEGIN
IF NEW.tokenForgotPassword IS NOT NULL AND OLD.tokenForgotPassword <> NEW.tokenForgotPassword THEN
INSERT INTO incidents_notification (body, user_id, seen, created_at, modified_at) VALUES (CONCAT('Please put a new password.'), OLD.id, FALSE, NOW(), NOW());
END IF;
IF NEW.tokenForgotPassword IS NULL AND OLD.tokenForgotPassword <> NEW.tokenForgotPassword THEN INSERT INTO incidents_notification (body, user_id, seen, created_at, modified_at) VALUES 
(CONCAT('Your new password is updated correctly.'), OLD.id, FALSE, NOW(), NOW());
END IF;
END//
delimiter ;
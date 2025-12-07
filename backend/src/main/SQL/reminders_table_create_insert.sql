CREATE TABLE reminders (
    id BIGINT NOT NULL AUTO_INCREMENT,
    pickup_type VARCHAR(255),
    day_of_week INT NOT NULL,
    reminder_hour INT,
    reminder_minute INT,
    notes VARCHAR(255),
    remind_set_out BOOLEAN NOT NULL,
    remind_bring_in BOOLEAN NOT NULL,
    enabled BOOLEAN NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO reminders 
(pickup_type, day_of_week, reminder_hour, reminder_minute, notes, remind_set_out, remind_bring_in, enabled)
VALUES
('Trash', 1, 19, 30, 'Take trash out Monday night', TRUE, FALSE, TRUE),
('Recycling', 2, 20, 00, 'Blue bin pickup', TRUE, TRUE, TRUE),
('Compost', 3, 18, 45, 'Set out compost bin', TRUE, FALSE, TRUE),
('Trash', 4, 7, 15, 'Bring trash bin back in before work', FALSE, TRUE, TRUE),
('Recycling', 5, 19, 00, 'Paper & plastics pickup', TRUE, FALSE, TRUE),
('Compost', 6, 9, 30, 'Morning compost reminder', FALSE, TRUE, TRUE),
('Trash', 0, 20, 00, 'Sunday night trash reminder', TRUE, FALSE, FALSE),
('Recycling', 1, 6, 45, 'Bring recycling bin in before school', FALSE, TRUE, TRUE),
('Compost', 2, 17, 00, 'Compost goes out today', TRUE, TRUE, TRUE),
('Trash', 5, 21, 10, 'Late reminder to take trash out', TRUE, FALSE, TRUE);

select * from reminders;

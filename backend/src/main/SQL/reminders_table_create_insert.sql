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

SELECT * FROM reminders;

CREATE TABLE users (
    id BIGINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO users (name, email, password_hash) VALUES
('Alice Johnson', 'alice@example.com', '$2a$10$7zvX1F2K3LmN9sPw4YtqUuHjK2Yp3V7eN0DaF3G9hzU0dCTF34p6i'),
('Bob Smith', 'bob.smith@example.com', '$2a$10$9asT6pY2QwL3u1ErT5mCvuwKkR0K2Mb5jsE3qP9J8fM1tX4L2n9qC'),
('Charlie Brown', 'charlie.brown@example.com', '$2a$10$3vBm7T1sP0kS9qWe4mYuHtqV9Lp8sCd3wQk5nGs2LfA7tP9Jh3EoW'),
('Diana Carter', 'diana.c@example.com', '$2a$10$5LpM1rQ2xCvV7zHk2nPqTsG0hWm3BvF4eTr9XgP0KfL2dS1Ys8qEe'),
('Ethan Walker', 'ethan.walker@example.com', '$2a$10$8HtP2mNsK9aF4dQ5gLpVtFsW7zN0bHc3vYj4XfPa2tQ5dRw9Mp6Ke'),
('Fiona Davis', 'fiona.davis@example.com', '$2a$10$2KpV0cX4bN1sR5tW3qLmUfH9dZp2TbC1vMd6AqG8FsH2pQo7Yr9wS'),
('George Miller', 'george.m@example.com', '$2a$10$6XsC7nPmA5tV3rQ8kJmHdSlP1eZtCbV9xWg4PqF2nSr8KkE3tU0Gi'),
('Hannah Lee', 'hannah.lee@example.com', '$2a$10$1RnH3mYtW4pC7aD2bMvJgFfR0xKcTbB8wJp2GsN5tVq4QmS9uY6De'),
('Ivan Martinez', 'ivan.m@example.com', '$2a$10$4KsF5tRwQ3pV1sN6yJmEpCgW2nA9hBrC7xTf4PuL0kM2sNdZy8jTi'),
('Julia Roberts', 'julia.roberts@example.com', '$2a$10$9QwA4nPmT8xS1bY3eKcHuVvM6nRgJzK5pTf1QdF3oB8kHmC2yW7Lt');

SELECT * FROM users;

CREATE TABLE recycling_centers (
    id BIGINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    address VARCHAR(255),
    phone VARCHAR(50),
    website VARCHAR(255),
    hours VARCHAR(255),
    notes VARCHAR(255),
    accepts JSON,
    PRIMARY KEY (id)
);

INSERT INTO recycling_centers
(name, address, phone, website, hours, notes, accepts)
VALUES
('Green Earth Recycling Center',
 '123 Maple St, San Jose, CA',
 '408-555-1200',
 'https://greenearthrecycle.org',
 'Mon–Fri 9am–5pm',
 'City-partnered recycling drop-off.',
 JSON_ARRAY('Plastic #1', 'Plastic #2', 'Glass', 'Aluminum')
),

('EcoDrop Facility',
 '455 Oak Ave, Sunnyvale, CA',
 '408-555-3344',
 'https://ecodrop.com',
 'Tue–Sat 10am–6pm',
 'Accepts limited electronics.',
 JSON_ARRAY('Electronics', 'Batteries', 'Glass')
),

('South Bay Recycling Hub',
 '1999 Blossom Hill Rd, San Jose, CA',
 '408-555-7788',
 'https://southbayhub.org',
 'Daily 8am–8pm',
 'Popular community recycling hub.',
 JSON_ARRAY('Plastic #1', 'Plastic #5', 'Cardboard', 'Paper')
),

('NorCal Reuse & Recycle',
 '87 Industrial Rd, Fremont, CA',
 '510-555-9021',
 'https://norcalreuse.com',
 'Mon–Fri 7am–3pm',
 'Commercial recycling accepted.',
 JSON_ARRAY('Wood', 'Metal', 'Cardboard')
),

('Silicon Valley Waste Center',
 '764 Technology Dr, San Jose, CA',
 '408-555-6612',
 'https://svwaste.org',
 'Mon–Sun 9am–7pm',
 'Accepts hazardous waste on weekends only.',
 JSON_ARRAY('Hazardous Waste', 'Batteries', 'Paint')
),

('WestSide Community Recycling',
 '55 Park Blvd, Santa Clara, CA',
 '408-555-1177',
 NULL,
 'Wed–Sun 11am–5pm',
 'Volunteer-run center.',
 JSON_ARRAY('Glass', 'Aluminum', 'Paper')
),

('EarthCycle Drop-Off',
 '600 Mission St, Santa Cruz, CA',
 '831-555-4433',
 'https://earthcycle.net',
 'Mon–Sat 9am–4pm',
 'Clothing and textile recycling available.',
 JSON_ARRAY('Textiles', 'Shoes', 'Plastic #1', 'Plastic #2')
),

('CleanWaste Depot',
 '12 Depot Dr, Palo Alto, CA',
 '650-555-7281',
 'https://cleanwaste.co',
 'Daily 10am–6pm',
 'Offers e-waste disposal.',
 JSON_ARRAY('Electronics', 'Cables', 'Batteries')
),

('Recycle4Good Center',
 '200 Evergreen Way, Milpitas, CA',
 '408-555-8899',
 'https://recycle4good.org',
 'Mon–Fri 8am–6pm',
 'Partnered with local high schools.',
 JSON_ARRAY('Paper', 'Cardboard', 'Plastic #1', 'Plastic #4')
),

('GreenLoop Recycling',
 '421 Loop Rd, Cupertino, CA',
 '408-555-7474',
 'https://greenloop.io',
 'Mon–Sat 10am–5pm',
 'Accepts compostable materials.',
 JSON_ARRAY('Compostables', 'Organic Waste')
);

SELECT * FROM recycling_centers;
CREATE TABLE item (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    price INTEGER NOT NULL,
    owner VARCHAR(50) NOT NULL,
    bid_count INTEGER DEFAULT 0,
    status VARCHAR(50) DEFAULT 'available',
    PRIMARY KEY (id),
    FOREIGN KEY (owner) REFERENCES users(username)
);

CREATE TABLE photo (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    filename VARCHAR(255) DEFAULT NULL,
    content_type VARCHAR(255) DEFAULT NULL,
    content BLOB DEFAULT NULL,
    item_id INTEGER DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (item_id) REFERENCES item(id)
);

CREATE TABLE comment (
    id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    content VARCHAR(255) DEFAULT NULL,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    username VARCHAR(50) DEFAULT NULL,
    item_id INTEGER DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (username) REFERENCES users(username),
    FOREIGN KEY (item_id) REFERENCES item(id)
);
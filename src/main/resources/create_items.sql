CREATE TABLE items (
    item_id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
    item_name VARCHAR(50) NOT NULL,
    description VARCHAR(255) NOT NULL,
    price DECIMAL(9,2) NOT NULL,
    owner VARCHAR(50) NOT NULL,
    bid_count INTEGER DEFAULT 0,
    status VARCHAR(50) DEFAULT 'available',
    PRIMARY KEY (item_id),
    FOREIGN KEY (owner) REFERENCES users(username)
);

CREATE TABLE photos (
    photo BLOB NOT NULL,
    item_id INTEGER NOT NULL,
    FOREIGN KEY (item_id) REFERENCES items(item_id)
);

CREATE TABLE comments (
    comment VARCHAR(255) NOT NULL,
    comment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_role_id INTEGER NOT NULL,
    item_id INTEGER NOT NULL,
    FOREIGN KEY (user_role_id) REFERENCES user_roles(user_role_id),
    FOREIGN KEY (item_id) REFERENCES items(item_id)
);
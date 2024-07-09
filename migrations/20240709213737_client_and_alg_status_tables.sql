-- +goose Up
CREATE TABLE IF NOT EXISTS client (
    id BIGINT PRIMARY KEY,
    client_name VARCHAR(255),
    version INT,
    image VARCHAR(255),
    CPU VARCHAR(255),
    memory VARCHAR(255),
    priority FLOAT,
    need_restart BOOLEAN,
    spawned_at TIMESTAMP,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS algorithm_status(
    id BIGINT PRIMARY KEY,
    client_id BIGINT,
    vwap BOOLEAN DEFAULT FALSE,
    twap BOOLEAN DEFAULT FALSE,
    hft BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (client_id) REFERENCES client(id)
);


-- +goose Down
DROP TABLE algorithm_status;
DROP TABLE client;

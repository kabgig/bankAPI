-- Create table for transactions
CREATE TABLE transaction (
    id SERIAL PRIMARY KEY,
    user_id SERIAL NOT NULL,
    operation VARCHAR(255) NOT NULL,
    date TIMESTAMP NOT NULL,
    amount DOUBLE PRECISION NOT NULL,
    balance DOUBLE PRECISION NOT NULL
);

INSERT INTO transaction (user_id, operation, date, amount, balance) VALUES
(101, 'PUT', '2023-01-01 08:00:00', 100.00, 445.50),
(101, 'TAKE', '2023-01-02 12:30:00', 50.50, 395.00),
(102, 'PUT', '2023-01-03 10:15:00', 500.00, 12910.00),
(102, 'TAKE', '2023-01-04 15:45:00', 100.00, 12810.00),
(103, 'PUT', '2023-01-05 09:30:00', 200.00, 324.50),
(103, 'TAKE', '2023-01-06 14:00:00', 50.00, 274.50),
(104, 'PUT', '2023-01-07 11:45:00', 20.00, 38.50),
(104, 'TAKE', '2023-01-08 16:30:00', 20.00, 18.50),
(105, 'PUT', '2023-01-09 13:15:00', 500.00, 1745.50),
(105, 'TAKE', '2023-01-10 17:45:00', 300.00, 1445.50),
(106, 'PUT', '2023-01-11 10:00:00', 200.00, 1445.50),
(106, 'TAKE', '2023-01-12 14:30:00', 100.00, 1345.50),
(107, 'PUT', '2023-01-13 12:15:00', 50.00, 1295.50),
(107, 'TAKE', '2023-01-14 15:45:00', 20.00, 1275.50),
(108, 'PUT', '2023-01-15 09:30:00', 100.00, 221.50),
(108, 'TAKE', '2023-01-16 14:00:00', 100.00, 121.50),
(109, 'PUT', '2023-01-17 11:45:00', 10.00, 22.61),
(109, 'TAKE', '2023-01-18 16:30:00', 10.00, 12.61),
(110, 'PUT', '2023-01-19 13:15:00', 400.00, 1640.00),
(110, 'TAKE', '2023-01-20 17:45:00', 100.00, 1540.00),
(111, 'PUT', '2023-01-21 10:00:00', 80.00, 200.00),
(111, 'TAKE', '2023-01-22 14:30:00', 80.00, 120.00),
(112, 'PUT', '2023-01-23 12:15:00', 50.00, 82.56),
(112, 'TAKE', '2023-01-24 15:45:00', 20.00, 62.56),
(101, 'TRANSFER_IN', '2023-02-01 08:30:00', 30.00, 415.50),
(101, 'TRANSFER_IN', '2023-02-02 12:45:00', 15.50, 400.00),
(102, 'TRANSFER_IN', '2023-02-03 10:30:00', 50.00, 12860.00),
(102, 'TRANSFER_IN', '2023-02-04 15:55:00', 10.00, 12850.00),
(103, 'TRANSFER_IN', '2023-02-05 09:45:00', 20.00, 254.50),
(103, 'TRANSFER_IN', '2023-02-06 14:15:00', 10.00, 244.50),
(104, 'TRANSFER_IN', '2023-02-07 12:30:00', 5.00, 33.50),
(104, 'TRANSFER_IN', '2023-02-08 16:45:00', 5.00, 28.50),
(105, 'TRANSFER_IN', '2023-02-09 13:30:00', 50.00, 1695.50),
(105, 'TRANSFER_IN', '2023-02-10 18:00:00', 30.00, 1665.50),
(106, 'TRANSFER_IN', '2023-02-11 10:15:00', 10.00, 1435.50),
(106, 'TRANSFER_IN', '2023-02-12 14:45:00', 5.00, 1430.50),
(107, 'TRANSFER_OUT', '2023-02-13 12:45:00', 5.00, 1290.50),
(107, 'TRANSFER_OUT', '2023-02-14 16:15:00', 2.00, 1288.50),
(108, 'TRANSFER_OUT', '2023-02-15 10:00:00', 10.00, 211.50),
(108, 'TRANSFER_OUT', '2023-02-16 14:30:00', 5.00, 206.50),
(109, 'TRANSFER_OUT', '2023-02-17 11:30:00', 2.00, 20.61),
(109, 'TRANSFER_OUT', '2023-02-18 16:45:00', 1.00, 19.61),
(110, 'TRANSFER_OUT', '2023-02-19 13:30:00', 20.00, 1620.00),
(110, 'TRANSFER_OUT', '2023-02-20 18:00:00', 10.00, 1610.00),
(111, 'TRANSFER_OUT', '2023-02-21 10:15:00', 8.00, 192.00),
(111, 'TRANSFER_OUT', '2023-02-22 14:45:00', 8.00, 184.00),
(112, 'TRANSFER_OUT', '2023-02-23 12:45:00', 5.00, 77.56),
(112, 'TRANSFER_OUT', '2023-02-24 16:15:00', 2.00, 75.56);
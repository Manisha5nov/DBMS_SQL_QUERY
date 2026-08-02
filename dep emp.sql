use oxford;
CREATE TABLE department (
    d_id INT PRIMARY KEY,
    d_name VARCHAR(20)
);

CREATE TABLE employee1 (
    e_id INT PRIMARY KEY,
    e_name VARCHAR(20),
    d_id INT,
    FOREIGN KEY (d_id) REFERENCES department(d_id)
);
insert into department 
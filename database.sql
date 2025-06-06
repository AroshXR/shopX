CREATE DATABASE shopX;

CREATE TABLE users (
       id INT AUTO_INCREMENT PRIMARY KEY,
       username VARCHAR(100) NOT NULL,
       email VARCHAR(100) NOT NULL,
       password VARCHAR(255) NOT NULL,
       gender VARCHAR(20) NOT NULL,
       dob DATE NOT NULL,
        `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
        `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
);


-- changed some columns by Aroshana
CREATE TABLE `products` (
        `product_id` int(11) NOT NULL AUTO_INCREMENT,
        `name` varchar(255) NOT NULL,
        `vendorID` int(11) NOT NULL,
        `price` float(10,2) NOT NULL,
        `productImageFileName` varchar(512) DEFAULT NULL,
        `stock` int(11) DEFAULT 0,
        `additional_details` text DEFAULT NULL,
        `category` varchar(100) DEFAULT NULL,
        `rating` float(2,1) DEFAULT 0.0,
        `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
        `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
         PRIMARY KEY (`product_id`),
         FOREIGN KEY (vendorID) REFERENCES vendors(id)
);

CREATE TABLE cart (
      id INT AUTO_INCREMENT PRIMARY KEY,
      user_id INT NOT NULL,
      product_id INT NOT NULL,
      quantity INT NOT NULL DEFAULT 1,
      price DECIMAL(10, 2) NOT NULL,
      added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

      FOREIGN KEY (product_id) REFERENCES products(product_id),
      FOREIGN KEY (user_id) REFERENCES users(id)
);


-- vendors tables

CREATE TABLE `vendors` (
       `id` int(11) NOT NULL AUTO_INCREMENT,
       `store_name` varchar(100) NOT NULL,
       `username` varchar(50) NOT NULL,
       `vendorDOB` date DEFAULT NULL,
       `email` varchar(100) NOT NULL,
       `password` varchar(255) NOT NULL,
       `vendorAddress` varchar(50) DEFAULT NULL,
       `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
       `imageFileName` varchar(50) DEFAULT NULL,
       PRIMARY KEY(`id`)
);

CREATE TABLE vendorpendingverifications (
        verificationID int(11) NOT NULL AUTO_INCREMENT,
        companyName varchar(50) NOT NULL,
        businessAddress varchar(50) NOT NULL,
        businessEmail varchar(50) NOT NULL,
        businessContactNo varchar(10) NOT NULL,
        businessRegNo varchar(10) NOT NULL,
        vendorID int(11) NOT NULL,
        type varchar(10) NOT NULL,
        requestedAt date NOT NULL DEFAULT current_timestamp(),
        cardType varchar(10) DEFAULT NULL,
        cardNo varchar(25) DEFAULT NULL,
        cardEXP date DEFAULT NULL,
        cardCVN varchar(4) DEFAULT NULL,
        verificationStatus varchar(20) DEFAULT 'none',
        PRIMARY KEY(`verificationID`),
        FOREIGN KEY (vendorID) REFERENCES vendors(id)
);

CREATE TABLE delivery_address (
                                  id INT AUTO_INCREMENT PRIMARY KEY,
                                  user_id INT NOT NULL,
                                  full_name VARCHAR(100) NOT NULL,
                                  street VARCHAR(255) NOT NULL,
                                  city VARCHAR(100) NOT NULL,
                                  zip VARCHAR(20) NOT NULL,
                                  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                                  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE orders (
                        order_id INT AUTO_INCREMENT PRIMARY KEY,
                        user_id INT NOT NULL,
                        address_id INT NOT NULL,
                        payment_method VARCHAR(50) NOT NULL,
                        total DECIMAL(10, 2) NOT NULL,
                        status VARCHAR(50) DEFAULT 'Pending',
                        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                        FOREIGN KEY (user_id) REFERENCES users(id),
                        FOREIGN KEY (address_id) REFERENCES delivery_address(id)
);

CREATE TABLE order_items (
                             item_id INT AUTO_INCREMENT PRIMARY KEY,
                             order_id INT NOT NULL,
                             product_id INT NOT NULL,
                             quantity INT NOT NULL,
                             price DECIMAL(10, 2) NOT NULL, -- price at the time of order
                             FOREIGN KEY (order_id) REFERENCES orders(order_id),
                             FOREIGN KEY (product_id) REFERENCES products(product_id)
);
CREATE TABLE feedback (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          name VARCHAR(100) NOT NULL,
                          email VARCHAR(100) NOT NULL,
                          subject VARCHAR(255),
                          message TEXT,
                          rating INT CHECK (rating >= 1 AND rating <= 5),
                          submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



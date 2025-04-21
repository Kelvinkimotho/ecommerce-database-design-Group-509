-- 1. Brand Table
CREATE TABLE brand (
    brand_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT
);
-- 2. Product Category Table
CREATE TABLE product_category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    parent_id INT,
    FOREIGN KEY (parent_id) REFERENCES product_category(category_id)
);

-- 3. Product Table
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    brand_id INT,
    category_id INT,
    base_price DECIMAL(10,2) NOT NULL,
    description TEXT,
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

-- 4. Product Image Table
CREATE TABLE product_image (
    image_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    url VARCHAR(500) NOT NULL,
    alt_text VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

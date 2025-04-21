# 📦 E-commerce Database Design – Peer Group 509 Assignment

## 🎯 Objective

This collaborative challenge is designed to help your team master the **art of database design** through:

- Crafting an **Entity-Relationship Diagram (ERD)**
- Designing a **relational database** for an e-commerce platform
- Implementing **version control**, **collaboration**, and **team documentation** best practices

---

## 🛠️ Instructions

1. **Design the ERD**
   - Define all tables, their fields (attributes), keys, and constraints
   - Visualize relationships between entities
   - Use tools like dbdiagram.io, Lucidchart, or MySQL Workbench

2. **Plan Data Flow**
   - Define how data flows between entities (orders → customers → products)
   - Think through use cases like browsing, filtering, and checking out

3. **Collaborate as a Team**
   - Discuss, analyze, and review all parts as a group
   - Use GitHub for versioning, communication, and peer review

4. **Submit the Project**
   - Upload the final **ERD** (`/docs/erd.png`)
   - Include your SQL file: `sql/ecommerce.sql`
   - Ensure a public GitHub repo with full documentation

---

## 👥 GitHub Collaboration Workflow

### Step-by-Step Process

```bash
# 1. Clone the Repository
git clone https://github.com/Kelvinkimotho/ecommerce-database-design-Group-509.git
cd ecommerce-database-design

# 2. Create a Feature Branch
git checkout -b feature/add-product-table

# 3. Make Your Changes
# (SQL schema, ERD image, etc.)

# 4. Commit & Push
git add .
git commit -m "Added product table schema"
git push origin feature/add-product-table

# 5. Open a Pull Request on GitHub
## 🗃️ Database Tables & Field Definitions

> Below are all the required tables, including primary keys (🗝️), foreign keys (🔗), and key attributes.

---

### 📦 `product`
Stores general product data.

| Field         | Type           | Constraints                      |
|---------------|----------------|----------------------------------|
| `product_id` 🗝️ | INT            | PRIMARY KEY, AUTO_INCREMENT      |
| `name`        | VARCHAR(255)   | NOT NULL                         |
| `brand_id` 🔗 | INT            | FOREIGN KEY → `brand`            |
| `base_price`  | DECIMAL(10,2)  | NOT NULL                         |
| `category_id` 🔗 | INT         | FOREIGN KEY → `product_category` |
| `description` | TEXT           | NULLABLE                         |

---

### 🏷️ `brand`
Stores brand-related data.

| Field        | Type          | Constraints                   |
|--------------|---------------|-------------------------------|
| `brand_id` 🗝️ | INT           | PRIMARY KEY, AUTO_INCREMENT   |
| `name`       | VARCHAR(100)  | UNIQUE, NOT NULL              |
| `description`| TEXT          | NULLABLE                      |

---

### 🗂️ `product_category`
Classifies products into categories.

| Field           | Type          | Constraints                            |
|------------------|---------------|----------------------------------------|
| `category_id` 🗝️  | INT           | PRIMARY KEY, AUTO_INCREMENT            |
| `name`           | VARCHAR(100)  | UNIQUE, NOT NULL                       |
| `parent_id` 🔗    | INT           | Self-referencing FK (nullable)        |

---

### 🖼️ `product_image`
Stores image references for products.

| Field        | Type          | Constraints                    |
|--------------|---------------|--------------------------------|
| `image_id` 🗝️ | INT           | PRIMARY KEY, AUTO_INCREMENT    |
| `product_id` 🔗 | INT         | FOREIGN KEY → `product`        |
| `url`        | VARCHAR(500)  | NOT NULL                       |
| `alt_text`   | VARCHAR(255)  | NULLABLE                       |

---

### 🎨 `color`
Color options for product variations.

| Field        | Type         | Constraints                    |
|--------------|--------------|--------------------------------|
| `color_id` 🗝️ | INT          | PRIMARY KEY, AUTO_INCREMENT    |
| `name`       | VARCHAR(50)  | NOT NULL                       |
| `hex_code`   | VARCHAR(7)   | (e.g., `#FFFFFF`)              |

---

### 📐 `size_option`
Available sizes (e.g., S, M, 42).

| Field         | Type          | Constraints                      |
|---------------|---------------|----------------------------------|
| `size_id` 🗝️   | INT           | PRIMARY KEY, AUTO_INCREMENT      |
| `size_label`  | VARCHAR(10)   | NOT NULL                         |
| `category_id` 🔗 | INT        | FOREIGN KEY → `size_category`    |

---

### 📏 `size_category`
Groups size options (e.g., clothing, shoes).

| Field                | Type         | Constraints                      |
|----------------------|--------------|----------------------------------|
| `size_category_id` 🗝️ | INT          | PRIMARY KEY, AUTO_INCREMENT      |
| `name`               | VARCHAR(50)  | NOT NULL                         |

---

### 🔄 `product_variation`
Links products to their color/size combinations.

| Field            | Type | Constraints                      |
|------------------|------|----------------------------------|
| `variation_id` 🗝️ | INT  | PRIMARY KEY, AUTO_INCREMENT      |
| `product_id` 🔗   | INT  | FOREIGN KEY → `product`          |
| `color_id` 🔗     | INT  | FOREIGN KEY → `color`            |
| `size_id` 🔗      | INT  | FOREIGN KEY → `size_option`      |

---

### 🧾 `product_item`
Actual stock-keeping unit (SKU).

| Field            | Type           | Constraints                      |
|------------------|----------------|----------------------------------|
| `item_id` 🗝️       | INT            | PRIMARY KEY, AUTO_INCREMENT      |
| `variation_id` 🔗  | INT            | FOREIGN KEY → `product_variation`|
| `sku`            | VARCHAR(50)    | UNIQUE, NOT NULL                 |
| `price`          | DECIMAL(10,2)  | NOT NULL                         |
| `stock_qty`      | INT            | DEFAULT 0                        |

---

### 🧪 `attribute_type`
Types of attributes (text, boolean, number).

| Field         | Type         | Constraints                   |
|---------------|--------------|-------------------------------|
| `type_id` 🗝️   | INT          | PRIMARY KEY, AUTO_INCREMENT   |
| `name`        | VARCHAR(50)  | e.g., `text`, `boolean`       |

---

### 📚 `attribute_category`
Groups attributes (e.g., technical, physical).

| Field            | Type           | Constraints                   |
|------------------|----------------|-------------------------------|
| `category_id` 🗝️  | INT            | PRIMARY KEY, AUTO_INCREMENT   |
| `name`           | VARCHAR(100)   | NOT NULL                      |

---

### 🧵 `product_attribute`
Custom attributes like material, weight.

| Field              | Type           | Constraints                            |
|--------------------|----------------|----------------------------------------|
| `attribute_id` 🗝️   | INT            | PRIMARY KEY, AUTO_INCREMENT            |
| `product_id` 🔗     | INT            | FOREIGN KEY → `product`                |
| `category_id` 🔗    | INT            | FOREIGN KEY → `attribute_category`     |
| `type_id` 🔗        | INT            | FOREIGN KEY → `attribute_type`         |
| `name`             | VARCHAR(100)   | Attribute name                         |
| `value`            | TEXT           | Interpreted based on attribute type    |

## ✅ Submission Checklist

- [x] **ERD uploaded:** `erd.png`
- [x] **SQL file completed:** `ecommerce.sql`
- [x] **Collaboration recorded via GitHub**  
  - Branches used for parallel development  
  - Pull Requests (PRs) reviewed and merged
- [x] **README completed** with all table documentation
- [x] **Repo is public and accessible** for evaluation

---

## 🔧 Resources

- [MySQL Workbench](https://www.mysql.com/products/workbench/)
- [GitHub Issues](https://docs.github.com/en/issues)
- [GitHub Pull Requests](https://docs.github.com/en/pull-requests)

---

## 🚀 Let’s Build a Scalable E-Commerce DB Together!

> Design like engineers.  
> Document like pros.  
> Work like a team. 🤝

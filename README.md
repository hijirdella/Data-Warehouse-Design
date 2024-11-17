# Data Warehouse Design Assignment

## Objective
This project aims to design a **Data Warehouse (DWH)** schema for both the **Sales** and **Employee** domains. The assignment includes:
1. Developing a **Star Schema** for each domain.
2. Creating an **Entity-Relationship Diagram (ERD)** to represent the schema.
3. Generating **Data Marts** with SQL queries to enable analytical and reporting capabilities.

---

## Deliverables

### Sales Domain

#### 1. File Structure
| File Name                                 | Description                                                     |
|------------------------------------------|-----------------------------------------------------------------|
| `Sales Star Schema.sql`                  | SQL script for creating the Sales Star Schema.                 |
| `Sales Star Schema.pgerd`                | ERD diagram for the Sales domain.                              |
| `Sales Data Mart.sql`                    | SQL queries for generating Sales Data Marts.                   |
| `[Deck] Data Warehouse Design - Sales Domain.pdf` | Slide deck for Sales domain schema design and insights.  |

#### 2. Instructions to Run
1. **Create the Schema**:
   - Execute `Sales Star Schema.sql` to generate the schema for the Sales domain.
2. **View the ERD**:
   - Open `Sales Star Schema.pgerd` in tools like pgAdmin or dbdiagram.io to view the schema relationships.
3. **Generate Data Marts**:
   - Run `Sales Data Mart.sql` to create Data Mart tables for analysis.

#### 3. Schema Description
![Sales Star Schema](https://github.com/hijirdella/Data-Warehouse-Design/blob/4a7082572abd2b507337677c802c5d3a366add33/Sales.jpg)
1. **Fact Table**: `fact_sales`
   - Captures transactional data (e.g., quantity, price).
   - Links to dimensions via foreign keys: `store_id`, `sales_name_id`, `time_id`, `product_id`.
2. **Dimension Tables**:
   - **`dim_product`**: Product attributes (e.g., name, category).
   - **`dim_store`**: Store metadata (e.g., location).
   - **`dim_time`**: Time details (e.g., date, day of the week, month).
   - **`dim_sales_name`**: Salesperson details (e.g., age, gender).

---

### Employee Domain

#### 1. File Structure
| File Name                                 | Description                                                     |
|------------------------------------------|-----------------------------------------------------------------|
| `Employee Star Schema.sql`               | SQL script for creating the Employee Star Schema.              |
| `Employee Star Schema.pgerd`             | ERD diagram for the Employee domain.                           |
| `Employee Data Mart.sql`                 | SQL queries for generating Employee Data Marts.                |
| `[Deck] Data Warehouse Design - Employee Domain.pdf` | Slide deck for Employee domain schema design and insights. |

#### 2. Instructions to Run
1. **Create the Schema**:
   - Execute `Employee Star Schema.sql` to generate the schema for the Employee domain.
2. **View the ERD**:
   - Open `Employee Star Schema.pgerd` in tools like pgAdmin or dbdiagram.io to view the schema relationships.
3. **Generate Data Marts**:
   - Run `Employee Data Mart.sql` to create Data Mart tables for analysis.

#### 3. Schema Description
![Employee Star Schema](https://github.com/hijirdella/Data-Warehouse-Design/blob/4a7082572abd2b507337677c802c5d3a366add33/Employee.jpg)
1. **Fact Table**: `fact_employee_performance`
   - Records employee performance metrics.
   - Links to dimensions via foreign keys: `employee_id`.
2. **Dimension Tables**:
   - **`dim_employee`**: Employee demographics (e.g., hire date, gender).
   - **`dim_department`**: Department details (e.g., name).
   - **`dim_education`**: Educational background (e.g., degree).

---

## Conclusion
This project demonstrates the design and implementation of scalable **Star Schema** structures for both Sales and Employee domains. By leveraging **Data Marts**, the schemas enable deep, actionable insights across key performance dimensions, supporting strategic decision-making and efficient analytics.

For further inquiries, please contact **Hijir Della Wirasti** via:
- **GitHub**: [https://github.com/hijirdella](https://github.com/hijirdella)
- **Email**: [hijirdw@gmail.com](hijirdw@gmail.com)
- **LinkedIn**: [https://www.linkedin.com/in/hijirdella/](https://www.linkedin.com/in/hijirdella/)
- **LinkedIn**: [https://www.linkedin.com/in/hijirdella/](https://www.linkedin.com/in/hijirdella/)

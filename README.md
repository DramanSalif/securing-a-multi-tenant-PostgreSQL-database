# Securing a Multi-Tenant PostgreSQL Database with Row-Level Security and Role-Based Access Control
This is a portfolio project in which we create a PostgreSQL database from scratch and secure it with Row-Level Security and Role-Based Access Control. 

### 🧰 Introduction

In my journey as a data and software professional, I’ve come to appreciate that a well-structured database isn't just about tables and relationships — it’s also about security, maintainability, and scalability. This project demonstrates how to design a secure, multi-tenant PostgreSQL database using **role-based access control (RBAC)** and **row-level security (RLS)** policies. The project is fully automated with SQL scripts and intended to serve as both a learning artifact and a production-ready foundation for secure web applications.

---

### 🛠️ Database Design

At the core of the database is an academic journal-like structure under the `afma` schema consisting of:

* **Articles**, **Authors**, and **Classifications**
* **Customers**, **Orders**, and **Order Items**
* Supporting entities like **Affiliations** and **Addresses**

Tables are normalized to at least 3NF, with foreign keys explicitly linking relationships and composite junction tables (like `articles_authors`) managing many-to-many associations.

---

### 🔐 Security Foundation

Security starts with the **principle of least privilege**. I defined database roles as follows:

* `afma_readers`: Can read from the schema
* `afma_editors`: Can read and write
* `afma_admins`: Has full access

These roles are granted to users (e.g., `customer_2`, `customer_3`) and configured via the `roles_and_privileges.sql` script. For safety and reversibility, I also included a `revoke_all.sql` script to clean up permissions during resets or updates.

---

### 🛡️ Enforcing Row-Level Security (RLS)

To protect customer data in a multi-tenant environment, I enabled **Row-Level Security** on:

* `customers`
* `orders`
* `orderItems`

Policies ensure that:

* A customer can only view their own record in `customers`
* They can only access `orders` where they are the buyer
* They can only view `orderItems` tied to their own orders

All RLS policies are defined in `rls_orders_orderItems.sql` using JOIN-based `USING` clauses to ensure scoped access.

---

### 👥 Session Identity Binding

PostgreSQL doesn't natively know which application user is executing queries. So, I created a helper:

```sql
SELECT afma.set_customer_context();
```

This function binds the PostgreSQL session to a `customer_id`, stored via a custom config (`app.current_customer`). RLS policies reference this context, ensuring secure and personalized data access.

---

### ⚙️ Developer Workflow

To ease development and iteration, I included modular scripts:

* `reset.sql`: Wipes and reloads schema and data
* `AFMAdb_schema.sql`: Full DDL initialization
* `demo_data.sql`: Loads demo records for testing

Scripts are CI/CD-friendly and version-controlled, simplifying collaboration and repeatability.

---

### 🔹 Conclusion

This portfolio project demonstrates more than schema design — it brings in real-world security, data governance, and robust engineering practices:

* Fine-grained access control via RBAC
* Tenant-level data isolation with RLS
* Context-aware session logic for secure access

Next steps include:

* Adding audit logging
* Exposing APIs securely
* Containerizing with Docker

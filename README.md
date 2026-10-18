# Ride-Hailing & Logistics Relational Database System (Uber Case Study)

[![Database: Oracle SQL](https://img.shields.io/badge/Database-Oracle_11g_%2F_SQL-red.svg?logo=oracle&logoColor=white)](https://www.oracle.com/database/)
[![Course: Bases de Dados](https://img.shields.io/badge/Course-Databases-blue.svg)](https://www.isec.pt)
[![Institution: ISEC](https://img.shields.io/badge/Institution-ISEC_Coimbra-red.svg)](https://www.isec.pt)

> [!NOTE]  
> **Academic Context & Disclaimer:**  
> Developed for the **Databases (Bases de Dados - BD)** curricular unit in the **BSc in Computer Science (LEI)** at **ISEC - Instituto Superior de Engenharia de Coimbra** (Academic Year 2025/2026).  
> This project is an academic case study analyzing and modeling the operational domain of an on-demand ride-hailing and logistics platform (modeled after *Uber Technologies Inc.*). All trademark references are purely educational.

---

## 📌 Project Overview

This repository contains the end-to-end database engineering lifecycle for an on-demand transport and logistics management system:
1. **Requirements Engineering & Conceptual Modeling:** Entity-Relationship (ER) diagram capturing multi-entity associations, cardinalities, and business rules.
2. **Logical & Physical Relational Modeling:** Relational transformation normalized to the **Third Normal Form (3NF)** to eliminate redundancy and maintain update anomalies integrity.
3. **DDL Implementation:** Comprehensive SQL DDL scripts targeting **Oracle 11g** (compatible with ANSI SQL), featuring strict referential constraints, cascades, and data validation rules.

---

## 🏗️ Domain Architecture & Entities

The relational schema coordinates the full operational workflow of a ride-sharing and logistics enterprise:

* **User Management & Accounts:**
  * `CLIENTE`: Customer demographic data, geolocation, and cumulative rating.
  * `CONTA`: Secure access credentials, contact information, and profile settings.
  * `MOTORISTA`: Driver profiles, assigned vehicle specs, active geolocation, and rating.
  * `VEICULO`: Vehicle registration, capacity, category, make, and model.
* **Order Lifecycle & Dispatch:**
  * `RESERVA`: Ride bookings, assigned driver, distances, route metrics, and status.
  * `PEDIDO`: Associated passenger orders linked to customer accounts.
  * `RECOLHA`: Pickup timestamps, coordinates, and passenger boarding validation.
  * `ENTREGA`: Destination drop-off, timestamps, and completion tracking.
  * `CANCELAMENTO`: Cancellation auditing, reasons, and liability tracking (client vs. driver).
* **Financial Transactions & Reviews:**
  * `PAGAMENTO_CLIENTE`: Fare billing, payment methods, timestamps, and settlements.
  * `PAGAMENTO_MOTORISTA`: Driver payouts, commissions, and transaction logs.
  * `AVALIACAO_CLIENTE` & `AVALIACAO_MOTORISTA`: Dual-sided 5-star rating and feedback mechanism.

---

## 📁 Repository Structure

```text
├── docs/
│   ├── ER_Conceptual_Diagram.pdf      # Conceptual Entity-Relationship model
│   ├── ER_Physical_Schema.pdf         # Physical relational diagram (3NF)
│   └── Relatorio_Final_BD.pdf         # Complete 15-page academic project report
├── schema.sql                         # Complete Oracle SQL DDL script (tables & constraints)
└── README.md                          # Repository documentation
```

---

## 🚀 Deployment & Usage

### Running on Oracle Database (SQL Developer / SQL*Plus / APEX)

1. Clone this repository:
   ```bash
   git clone https://github.com/rodrigoideia19/uber-relational-database.git
   cd uber-relational-database
   ```
2. Open [`schema.sql`](./schema.sql) in **Oracle SQL Developer**, **SQL*Plus**, or **Oracle APEX SQL Commands**.
3. Execute the script to build all relational tables, constraints, foreign keys, and indexes:
   ```sql
   @schema.sql
   ```

---

## 👥 Authors

* **Rodrigo Salgueiro Ideia** — Student ID: `2024140892` ([GitHub](https://github.com/rodrigoideia19))
* **Gustavo Jesus** — Student ID: `2024140853`
* **Miguel Rosário** — Student ID: `2024140881`
* **Tiago Carreira** — Student ID: `2024140909`

*BSc in Computer Science (LEI), Instituto Superior de Engenharia de Coimbra (ISEC)*

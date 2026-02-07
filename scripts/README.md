# 🇬🇧 EN

## SQL Scripts Documentation

This page provides a technical overview of the SQL scripts used in the **Retail Sales Analysis** project. The scripts are divided into two main stages: *data cleaning & preprocessing* and *business analysis*.

---

## 🛠️ 1. Data Cleaning & Preprocessing (`cleaning_queries.sql`)

This script serves as the foundational step to ensure data integrity. The dataset contains several anomalies, including null values, invalid IDs, and inconsistent data formats.

### Key Operations:

* **Data Insertion & Handling Unknowns**
  Added `"Unknown"` reference records (IDs: `P000000`, `S000`, `C000000`) into master tables so that transactions with invalid IDs remain recorded but are clearly labeled.

* **Handling Anomalous IDs**
  Converted invalid or “junk” IDs such as `S999`, `P999999`, and `???` into the predefined `"Unknown"` category.

* **Discount Integrity**

  * Imputed `NULL` discount values with `0` (mode).
  * Added an `is_discount_valid` column as a *flagging mechanism* to support future data audits.

* **Median Imputation**
  Filled `cost_price` and `list_price` for product `P000000` using the **median** value (via `percentile_cont`) to keep revenue calculations as realistic as possible when original product data is missing.

---

## 📈 2. Business Analysis Queries (`business_analysis.sql`)

This script is designed to answer key business questions and generate core performance metrics.

### Query Breakdown:

#### Q1: Revenue Contribution by Category

* **Logic:** Calculates total *net revenue* (after discounts and excluding returned items) for each product category.
* **Insight:** Helps identify the most profitable product categories.

#### Q2: Purchase Behavior by Discount Level

* **Logic:** Groups transactions by discount level and computes each group’s percentage contribution to total transactions.
* **Goal:** Assess customer dependency on promotional discounts.

#### Q3: Customer Segmentation

* **Logic:** Uses `CASE WHEN` to segment customers based on total spending:

  * **High Value:** > 1000
  * **Medium Value:** > 100
  * **Low Value:** ≤ 100
* **Technique:** Applies a `Window Function` (`COUNT(*) OVER`) to display the overall segment distribution within a single result set.

#### Q4: Repeat Customer Analysis

* **Logic:** Utilizes a `CTE` to calculate the number of transactions per customer, then computes the ratio of customers with more than one transaction against the total customer base.

#### Q5: Monthly Revenue Growth

* **Logic:** Extracts the month from date strings using `EXTRACT`, then applies a `Window Function` (`LAG`) to compare current-month revenue with the previous month and calculate the growth percentage.
rite this documentation in a more **academic / research-oriented** style for postgraduate applications or publications.

---
# 🇮🇩 ID 
## SQL Scripts Documentation

Halaman ini menjelaskan detail teknis dari skrip SQL yang digunakan dalam proyek **Retail Sales Analysis**. Skrip dibagi menjadi dua tahap utama: pembersihan data (*cleaning*) dan analisis bisnis (*business analysis*).

---

## 🛠️ 1. Data Cleaning & Preprocessing (`cleaning_queries.sql`)

Skrip ini adalah langkah pertama untuk memastikan integritas data. Dataset ini memiliki beberapa anomali seperti nilai null, ID tidak valid, dan format data yang tidak konsisten.

### Key Operations:
- **Data Insertion & Handling Unknowns:** - Menambahkan kategori 'Unknown' (ID: `P000000`, `S000`, `C000000`) ke tabel master agar transaksi dengan ID tidak valid tetap terdata namun terlabeli dengan jelas.
- **Handling Anomaly IDs:** - Mengonversi ID "sampah" seperti `S999`, `P999999`, dan `???` menjadi kategori `Unknown` yang sudah dibuat.
- **Discount Integrity:** - Mengimputasi nilai `NULL` pada diskon menjadi `0` (mode).
    - Menambahkan kolom `is_discount_valid` sebagai *flagging* untuk keperluan audit data di masa depan.
- **Median Imputation:** - Mengisi `cost_price` dan `list_price` untuk produk `P000000` menggunakan nilai **Median** (melalui `percentile_cont`) agar perhitungan revenue tetap mendekati realita meski data produk asli tidak ditemukan.

---

## 📈 2. Business Analysis Queries (`business_analysis.sql`)

Skrip ini digunakan untuk menjawab objektif bisnis dan menghasilkan metrik utama.

### Query Breakdown:

#### Q1: Revenue Contribution by Category
- Logic: Menghitung total *net revenue* (setelah diskon, mengecualikan barang yang diretur) per kategori produk.
- Insight: Membantu memahami kategori mana yang paling menguntungkan.

#### Q2: Purchase Behavior by Discount Level
- Logic Mengelompokkan transaksi berdasarkan besaran diskon dan menghitung persentase kontribusinya terhadap total transaksi.
- Goal Melihat ketergantungan pelanggan terhadap promo.

#### Q3: Customer Segmentation
- Logic Menggunakan `CASE WHEN` untuk mengelompokkan pelanggan berdasarkan total belanja:
    - High Value: > 1000
    - **Medium Value: > 100
    - Low Value: <= 100
- Technique: Menggunakan `Window Function` (`COUNT(*) OVER`) untuk melihat distribusi segmen secara keseluruhan dalam satu tabel.

#### Q4: Repeat Customer Analysis
- Logic: Menggunakan `CTE` untuk menghitung jumlah transaksi per pelanggan, kemudian menghitung rasio pelanggan dengan transaksi > 1 terhadap total seluruh pelanggan.

#### Q5: Monthly Revenue Growth
- Logic: Menggunakan fungsi `EXTRACT` untuk mendapatkan bulan dari string tanggal, dan menggunakan `Window Function` (`LAG`) untuk membandingkan revenue bulan berjalan dengan bulan sebelumnya guna mendapatkan persentase pertumbuhan.


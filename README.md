# 🇬🇧 EN

## Retail Sales Analysis: Revenue, Growth, Customer & Discount Insights (SQL)

## 📌 Project Overview

This project aims to analyze the business performance of a fashion retail company using **PostgreSQL**. The analysis focuses on *data cleaning*, anomaly detection, customer segmentation, and the extraction of strategic insights to support revenue growth.

The primary objective is to transform “messy” retail data into clear, **actionable business recommendations**.

---

## 🛠️ Tech Stack & Tools

* **Database:** PostgreSQL
* **SQL Editor:** Visual Studio Code
* **Dataset:** [Kaggle Retail Fashion Dataset](https://www.kaggle.com/datasets/vanpatangan/retail-fashion-data)
* **Documentation:** Canva (Presentation)

---

## 📂 Repository Structure

```text
├── analysis_result/          # Query result visualizations (.png)
├── dataset/
│   └── README.md             # Dataset source & description
├── scripts/
│   ├── cleaning_queries.sql  # Data cleaning & anomaly handling
│   └── business_analysis.sql # Core queries for business insights
└── README.md                 # Main documentation (you are here)
```

---

## 🧹 Data Integrity & Cleaning (The “Quality-First” Approach)

Before proceeding to analysis, a lightweight *data engineering* process was conducted to ensure data integrity. This step is critical, as the raw dataset contains anomalies that could potentially distort business decisions.

**Key steps performed:**

* **Anomaly Removal:** Identification and handling of *ghost customers* (ID: `S999`) and invalid products (ID: `P999999`).
* **Flagging System:** Implementation of a valid-data filtering mechanism to ensure only legitimate transactions are analyzed.
* **Missing Value Handling:** Imputation for discount-related fields and categorization of undefined values as `"Unknown"`.

*Detailed cleaning queries can be found in [`scripts/cleaning_queries.sql`](scripts/cleaning_queries.sql).*

---

## 📊 Key Insights

### 1. Revenue Contribution by Category

* Revenue is evenly distributed (≈19–20%) across all major product categories.
* The presence of an `"Unknown"` category highlights an opportunity to improve product classification systems.

### 2. Discount Level & Purchase Behavior

* **63% of transactions** occurred without any discount.
* Indicates strong intrinsic product appeal, with limited dependency on price reductions.

### 3. Customer Segmentation

* The customer base is dominated by the **Medium Value** segment.
* Significant opportunity exists for *upselling* strategies to convert these customers into *High Value Customers*.

### 4. Retention & Repeat Purchases

* A relatively strong retention rate of **66.8%**.
* Future efforts should focus on converting the remaining one-third of customers who are still *one-time buyers*.

### 5. Revenue Trend & Growth

* Revenue growth is non-linear but exhibits clear seasonal patterns.
* Performance spikes are observed in **March, May, July, and October**.

---

## 💡 Strategic Recommendations

1. **“Upgrade Program”**
   Target *Medium Value* customers with loyalty incentives or personalized product bundles to increase *Customer Lifetime Value (CLV)*.

2. **Seasonal Playbook**
   Analyze the success drivers behind peak months (Mar, May, Jul, Oct) and replicate these promotional strategies during lower-performing periods.

---

## 🚀 Conclusion

This analysis demonstrates the ability to:

* Convert raw transactional data into clear and meaningful **business insights**.
* Apply advanced SQL analytics techniques (Joins, CTEs, Aggregations).
* Deliver structured **data storytelling**, from problem identification to strategic recommendations.

---

**Contact Information**
**Rio Liando Anggeri**
LinkedIn: [https://www.linkedin.com/in/rio-liando-748870249/](https://www.linkedin.com/in/rio-liando-748870249/)
Email: [rioliandoa@gmail.com](mailto:rioliandoa@gmail.com)

---
# 🇮🇩 ID 
## Retail Sales Analysis: Revenue, Growth, Customer & Discount Insights (SQL)

## 📌 Project Overview
Proyek ini bertujuan untuk menganalisis performa bisnis retail fashion menggunakan **PostgreSQL**. Analisis difokuskan pada pembersihan data (*data cleaning*), identifikasi anomali, segmentasi pelanggan, dan ekstraksi *insight* strategis untuk mendorong pertumbuhan *revenue*.

Tujuan utama dari proyek ini adalah mengubah data retail yang "berantakan" menjadi rekomendasi bisnis yang dapat ditindaklanjuti (*actionable strategies*).

---

## 🛠️ Tech Stack & Tools
- **Database:** PostgreSQL
- **SQL Editor:** Visual Studio Code
- **Dataset:** [Kaggle Retail Fashion Dataset](https://www.kaggle.com/datasets/vanpatangan/retail-fashion-data)
- **Documentation:** Canva (Presentation)

---

## 📂 Repository Structure
```text
├── analysis_result/         # Visualisasi hasil query (.png)
├── dataset/
│   └── README.md            # Informasi sumber & deskripsi dataset
├── scripts/
│   ├── cleaning_queries.sql # Pembersihan data & penanganan anomali
│   └── business_analysis.sql# Query inti untuk insights bisnis
└── README.md                # Dokumentasi utama (Anda berada di sini)
```

---

## 🧹 Data Integrity & Cleaning (The "Quality-First" Approach)

Sebelum masuk ke tahap analisis, saya melakukan proses *data engineering* sederhana untuk memastikan integritas data. Hal ini krusial karena dataset mentah mengandung anomali yang dapat menyesatkan keputusan bisnis.

**Langkah yang dilakukan:**

* **Pembersihan Anomali:** Mengidentifikasi dan menangani *ghost customers* (ID: S999) dan produk tidak valid (ID: P999999).
* **Sistem Flagging:** Menerapkan sistem filtrasi data valid untuk memastikan analisis hanya menggunakan transaksi riil.
* **Handling Missing Values:** Melakukan imputasi pada kolom diskon dan kategorisasi nilai "Unknown".

*Detail query pembersihan dapat dilihat di folder [scripts/cleaning_queries.sql](https://www.google.com/search?q=scripts/cleaning_queries.sql).*

---

## 📊 Key Insights

### 1. Revenue Contribution by Category

* Revenue terdistribusi merata (19-20%) di seluruh kategori produk utama.
* Adanya kategori "Unknown" menunjukkan peluang perbaikan dalam sistem klasifikasi data produk.

### 2. Discount Level & Purchase Behavior

* **63% transaksi** terjadi tanpa diskon sama sekali.
* Menunjukkan daya tarik produk yang kuat secara *organic* tanpa ketergantungan pada pemotongan harga.

### 3. Customer Segmentation

* Basis pelanggan didominasi oleh segmen **Medium Value**.
* Terdapat peluang besar untuk strategi *upselling* guna mengonversi mereka menjadi *High Value Customers*.

### 4. Retention & Repeat Purchases

* Tingkat retensi cukup solid sebesar **66.8%**.
* Fokus strategi ke depan adalah mengonversi 1/3 pelanggan yang masih berupa *one-time buyers*.

### 5. Revenue Trend & Growth

* Pertumbuhan tidak linear, namun memiliki pola musiman.
* Lonjakan performa signifikan terjadi pada bulan **Maret, Mei, Juli, dan Oktober**.

---

## 💡 Strategic Recommendations

1. **"Upgrade Program"**: Menargetkan segmen *Medium Value* dengan *loyalty perks* atau paket produk personal untuk meningkatkan *Customer Lifetime Value* (CLV).
2. **Seasonal Playbook**: Menganalisis pemicu sukses di bulan-bulan puncak (Mar, Mei, Jul, Okt) untuk mereplikasi strategi promosi yang sama di bulan-bulan dengan performa rendah.

---

## 🚀 Conclusion

Analisis ini mendemonstrasikan kemampuan dalam:

* Mengolah data mentah menjadi *business insights* yang jernih.
* Kemahiran dalam SQL Analytics (Joins, CTEs, Aggregations).
* *Storytelling* data yang terstruktur, dari identifikasi masalah hingga solusi strategis.

---

**Contact Information:**
[Rio Liando Anggeri]
https://www.linkedin.com/in/rio-liando-748870249/ | rioliandoa@gmail.com



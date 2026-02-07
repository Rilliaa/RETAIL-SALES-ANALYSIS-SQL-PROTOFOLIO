# 🇮🇩 ID 
# Retail Sales Analysis: Revenue, Growth, Customer & Discount Insights (SQL)

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



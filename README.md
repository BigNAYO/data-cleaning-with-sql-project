# 🛒 Sales Data Analysis from Kaggle

This project performs deep exploratory data analysis (EDA) on a Kaggle sales dataset to uncover business insights around profitability, customer behavior, and product performance. The goal is to use real-world sales data to answer critical business questions that could inform decision-making for marketing, inventory, and strategy teams.

---

## 📂 Dataset

- *Source:* [Kaggle Sales Dataset](https://www.kaggle.com/) (You can insert the exact URL if available)
- *Records:* ~9,000+ rows of sales transactions
- *Features include:*
  - Order and shipment dates
  - Product category and sub-category
  - Sales, profit, and discounts
  - Shipping mode and customer segment
  - Customer, city, and region information

---

## 🧠 Business Questions Answered

The following business-critical questions were explored in this analysis:

1. 🏆 *Which products generate the most profit?*
2. 🗺 *Which states or regions are the most profitable?*
3. 👥 *Which customer segments contribute the most to sales and profit?*
4. 📈 *What are the monthly or yearly sales trends?*
5. 🚚 *What is the average shipping delay per shipping mode?*
6. 📉 *Which categories or sub-categories are underperforming (losses)?*
7. 🔄 *What are the most frequently ordered products?*
8. 💰 *Who are the top 10 most valuable customers?*
9. 📅 *Is there seasonality in orders or sales?*
10. 🧾 *What are the top 5 most profitable products per category?*
11. 🔁 *Which customers have made more than 3 purchases?*
12. ❌ *Which products have caused overall losses (negative profits)?*

---

## 🛠 Tools Used

- *Python* (Pandas, NumPy, Matplotlib, Seaborn)
- *Jupyter Notebook*
- *Power BI / Excel* (optional for dashboards)
- *SQL* (optional for querying if dataset imported into PostgreSQL/SQLite)

---

## 📊 Key Insights Summary

- Certain product sub-categories like Copiers and Chairs drove the highest profits.
- Western and Central regions were the most consistently profitable across years.
- *Consumer segment* outperformed *Corporate* in both sales volume and profitability.
- Shipping via *Standard Class* had the least delay on average.
- Categories like *Tables* and *Bookcases* often resulted in negative profits.
- Over *20% of products* were loss-making despite high sales volume.
- Seasonal spikes were evident in *November and December*, aligning with major sales holidays.
- *Top 10 customers* accounted for over *15%* of total profit.

---

## 🧪 How to Use This Repo

1. Clone the repository:

```bash
git clone https://github.com/your-username/sales-data-analysis.git
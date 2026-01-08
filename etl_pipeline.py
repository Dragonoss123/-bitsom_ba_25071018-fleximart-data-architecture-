import pandas as pd
import os

# -------------------- FILE PATHS --------------------
BASE_PATH = r"D:\CertificateCourse\Python Projects\Assignment 2"

CUSTOMERS_FILE = os.path.join(BASE_PATH, "customers_raw.csv")
PRODUCTS_FILE = os.path.join(BASE_PATH, "products_raw.csv")
SALES_FILE = os.path.join(BASE_PATH, "sales_raw.csv")

# Report dictionary
report = {}

# -------------------- HELPER FUNCTIONS --------------------
def standardize_phone(phone):
    if pd.isna(phone):
        return None
    phone = str(phone).replace("-", "").replace(" ", "")
    phone = phone.lstrip("0")
    return "'+91-" + phone[-10:]

def standardize_date(value):
    return pd.to_datetime(value, errors="coerce", dayfirst=True).strftime("%Y-%m-%d")

# -------------------- CUSTOMERS CLEANING --------------------
def clean_customers():
    df = pd.read_csv(CUSTOMERS_FILE)
    original_count = len(df)

    df.columns = df.columns.str.strip().str.lower()

    duplicates = df.duplicated().sum()
    df = df.drop_duplicates()

    missing_emails = df["email"].isna().sum()
    df["email"] = df["email"].fillna("unknown@example.com")

    df["phone"] = df["phone"].apply(standardize_phone)
    df["registration_date"] = df["registration_date"].apply(standardize_date)

    df.insert(0, "customer_sk", range(1, len(df) + 1))

    report["Customers"] = {
        "Records Read": original_count,
        "Duplicates Removed": duplicates,
        "Missing Values Handled": missing_emails,
        "Records Loaded": len(df)
    }

    return df

# -------------------- PRODUCTS CLEANING --------------------
def clean_products():
    df = pd.read_csv(PRODUCTS_FILE)
    original_count = len(df)

    df.columns = df.columns.str.strip().str.lower()

    if "stock_quantity" in df.columns:
        df.rename(columns={"stock_quantity": "stock"}, inplace=True)

    duplicates = df.duplicated().sum()
    df = df.drop_duplicates()

    missing_prices = df["price"].isna().sum()
    df["price"] = df["price"].fillna(df["price"].mean())

    missing_stock = df["stock"].isna().sum()
    df["stock"] = df["stock"].fillna(0)

    df["category"] = df["category"].str.strip().str.title()

    df.insert(0, "product_sk", range(1, len(df) + 1))

    report["Products"] = {
        "Records Read": original_count,
        "Duplicates Removed": duplicates,
        "Missing Values Handled": missing_prices + missing_stock,
        "Records Loaded": len(df)
    }

    return df

# -------------------- SALES CLEANING --------------------
def clean_sales():
    df = pd.read_csv(SALES_FILE)
    original_count = len(df)

    df.columns = df.columns.str.strip().str.lower()

    duplicates = df.duplicated().sum()
    df = df.drop_duplicates()

    missing_ids = df["customer_id"].isna().sum() + df["product_id"].isna().sum()
    df = df.dropna(subset=["customer_id", "product_id"])

    df["transaction_date"] = df["transaction_date"].apply(standardize_date)

    df.insert(0, "sales_sk", range(1, len(df) + 1))

    report["Sales"] = {
        "Records Read": original_count,
        "Duplicates Removed": duplicates,
        "Missing Values Handled": missing_ids,
        "Records Loaded": len(df)
    }

    return df

# -------------------- MAIN FUNCTION --------------------
def main():
    customers_df = clean_customers()
    products_df = clean_products()
    sales_df = clean_sales()

    customers_df.to_csv(os.path.join(BASE_PATH, "customers_clean.csv"), index=False)
    products_df.to_csv(os.path.join(BASE_PATH, "products_clean.csv"), index=False)
    sales_df.to_csv(os.path.join(BASE_PATH, "sales_clean.csv"), index=False)

    report_file = os.path.join(BASE_PATH, "etl_processing_report.txt")

    with open(report_file, "w") as f:
        f.write("ETL PROCESSING REPORT\n")
        f.write("-" * 50 + "\n")

        for file, stats in report.items():
            f.write(f"\n{file} File:\n")
            for k, v in stats.items():
                f.write(f"{k}: {v}\n")

        f.write("\nETL process completed successfully.\n")

    print("ETL process completed successfully.")
    print(f"Report generated at: {report_file}")

# -------------------- RUN --------------------
if __name__ == "__main__":
    main()

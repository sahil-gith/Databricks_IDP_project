Intelligent Document Processing (IDP) Using Databricks

📌 Project Overview

This project demonstrates an AI-powered Intelligent Document Processing (IDP) solution using Databricks SQL and AI Functions.

The objective is to automate the processing of unstructured business documents, including invoices, purchase orders, and receipts, and convert their contents into structured, queryable data.

Using Databricks AI capabilities, the project parses documents, classifies them into predefined categories, extracts important information, and stores the results in structured database tables.

🎯 Project Objectives

Automate business document processing using AI.

Extract meaningful information from PDF documents.

Classify documents based on their content.

Convert unstructured document data into structured datasets.

Organize extracted information into separate tables.

Demonstrate practical applications of AI in data engineering.

🛠️ Technologies & Tools Used

Databricks – Data processing and analytics platform.

Databricks SQL – SQL-based data transformation.

AI_PARSE_DOCUMENT – Document parsing.

AI_CLASSIFY – AI-powered document classification.

AI_EXTRACT – Automated information extraction.

Unity Catalog Volumes – Document storage and access.

📂 Project Structure

Databricks_IDP_project/
│
├── new files/
│
├── Final Project.sql
│
├── invoice_10119.pdf
├── invoice_16234.pdf
├── invoice_23433.pdf
├── invoice_34552.pdf
├── invoice_48679.pdf
├── invoice_61552.pdf
├── invoice_93462.pdf
│
├── purchase_order_hawthorne_25.pdf
├── purchase_order_keystone_25.pdf
├── purchase_order_summit_25.pdf
│
├── receipt_17924.pdf
├── receipt_226724.pdf
├── receipt_30676.pdf
├── receipt_41151.pdf
├── receipt_523267.pdf
├── receipt_63355.pdf
├── receipt_715673.pdf
│
└── README.md

⚙️ Project Workflow

The project follows a structured document processing pipeline:

1. Document Ingestion

Reads PDF documents from Databricks Unity Catalog Volumes.

Uses the read_files() function to access document files.

2. Document Parsing

Uses AI_PARSE_DOCUMENT() to extract document content.

Converts parsed document elements into readable text.

3. Document Classification

Uses AI_CLASSIFY() to categorize documents into:

Invoice

Purchase Order

Receipt

Other

4. Information Extraction

Uses AI_EXTRACT() to identify and extract relevant fields from each document.

5. Data Transformation & Storage

Organizes extracted information into structured tables.

Stores the processed results in the idp.finance schema.

📊 Extracted Information

Document Type

Extracted Information

Invoices

Vendor Name, Invoice Number, Invoice Date, Due Date, Payment Method, Total

Purchase Orders

Merchant Name, PO Number, PO Date, Total

Receipts

Merchant Name, Receipt Number, Transaction Date, Total

🗄️ Database Tables

The project creates the following structured tables:

idp.finance.invoices

idp.finance.purchase_orders

idp.finance.receipts

These tables make the extracted business information easier to query and analyze using SQL.

🚀 How to Run the Project

Set up a Databricks workspace with the required AI Functions enabled.

Configure a Unity Catalog Volume for document storage.

Upload the invoice, purchase order, and receipt PDF files to the configured volume.

Open Final Project.sql in a Databricks SQL editor or notebook.

Execute the SQL commands in the appropriate sequence.

Query the resulting structured tables to explore the extracted information.

Note: The SQL script references /Volumes/idp/default/final_project, so configure the volume path accordingly before execution.

💡 Key Learning Outcomes

Through this project, I gained practical exposure to:

Intelligent Document Processing (IDP).

AI-powered document parsing and classification.

Automated information extraction.

Databricks SQL and AI Functions.

Structured data transformation.

Working with unstructured PDF documents.

Organizing extracted data for downstream analytics.

👨‍💻 Author

Sahil Gupta

Aspiring Data Analyst | Data Engineering | Databricks | SQL | Power BI

⭐ If you find this project interesting, feel free to explore the repository and connect with me!

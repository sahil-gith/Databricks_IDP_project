-- Databricks notebook source
select*
from read_files('/Volumes/idp/default/final_project')

-- COMMAND ----------

create or replace table parsed_data as
select path,
ai_parse_document(content) as parsed_content
from  read_files('/Volumes/idp/default/final_project')

-- COMMAND ----------

create or replace table pretty_data as
select path,
concat_ws('/n', 
transform(try_cast(parsed_content:document:elements as array<variant>),
e-> coalesce(try_cast(e:content as string), '')))
as doc_text
 
from parsed_data


-- COMMAND ----------

create or replace table classified_data as
select*,
ai_classify (doc_text, array('Invoice', 'Purchase Order', 'Receipt', 'Other'))as doc_classification
from pretty_data

-- COMMAND ----------

create or replace table invoice_data as
select*,
ai_extract(doc_text,
array('Vendor_Nmae',
     'Invoice_Number',
     'Invoice_Date',
      'Due_Date',
      'Payment_Method',
      'Total')) as extracted
from classified_data
where doc_classification = 'Invoice'

-- COMMAND ----------

create schema if not exists idp.finance

-- COMMAND ----------

create or replace table idp.finance.invoices as
select path,
extracted.Vendor_Nmae as Vendor,
extracted.Invoice_Number as Invoice,
extracted.Invoice_Date as Invoice_Date,
extracted.Due_Date as Due_Date,
extracted.Payment_Method as Payment_Method,
extracted.Total as
from invoice_data

-- COMMAND ----------

select*
from idp.finance.invoices

-- COMMAND ----------

create or replace table purchase_order_data as
select*,
ai_extract(doc_text,
array('Merchant_Name',
     'PO_Number',
     'PO_Date',
      'Total'
      )) as extracted
from classified_data
where doc_classification = 'Purchase Order'

-- COMMAND ----------

create or replace table idp.finance.purchase_orders as
select path,
extracted.Merchant_Name as Merchant,
extracted.PO_Number as PO_Number,
extracted.PO_Date as PO_Date,
extracted.Total as Total
from purchase_order_data

-- COMMAND ----------

create or replace table receipt_data as
select*,
ai_extract(doc_text,
array('Merchant_Name',
     'Receipt_Number',
     'Transaction_Date',
      'Total'
      )) as extracted
from classified_data
where doc_classification = 'Receipt'

-- COMMAND ----------

create or replace table idp.finance.receipts as
select path,
extracted.Merchant_Name as Merchant,
extracted.Receipt_Number as Receipt_Number,
extracted.Transaction_Date as Transaction_Date,
extracted.Total as Total
from receipt_data
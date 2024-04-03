# FraudDetection_Azure_Cloud

## References

This project uses the https://github.com/CloudLabsAI-Azure/azure-synapse-in-a-day-demos/tree/master/fraud-detection The pipeline is inspired by the guidelines provided in "azure-synapse-in-a-day"[^1].

## Project Overview

In recent times, the digital age has seen a sharp uptick in incidents of credit card fraud, especially in non-physical transactions such as online purchases and mail orders. These types of transactions, where the physical credit card is not presented to the seller, have become a fertile ground for unauthorized use. Without effective countermeasures, the repercussions for both consumers and financial institutions could be substantial.

### Addressing Unauthorized Transactions

The ability to detect and anticipate fraudulent activities from transaction details has become paramount for businesses. It is imperative for credit card companies and banks to swiftly identify unauthorized transactions. They must have the capacity to analyze the patterns of fraudulent activities, understand the geographic spread of these incidents, and implement robust preventive strategies.

### Training Objectives

This workshop aims to equip participants with the skills to leverage Azure Synapse Analytics' SQL On-Demand feature for transforming credit card fraud detection and geographic data from CSV files stored in Azure Data Lake Storage Gen2 into actionable insights, without the need for traditional programming. Participants will also gain proficiency in analyzing this data through Power BI reports.

In the first exercise, we will delve into identifying patterns of fraudulent transactions over time using results from machine learning-based fraud detection.

The second exercise will focus on analyzing the geographic distribution of fraud cases by integrating transaction data with city latitude and longitude information.

## Data Overview

Participants will engage with three primary datasets throughout this workshop.

| Data Source | Dataset | File Name |
| --- | --- | --- |
| Kaggle | Detection of credit card fraud | Creditcard.csv |
| Open Weather | City latitude and longitude listing | Citylist.csv |
| ISO3166-1 | Country codes directory | Countrylist.csv |

### Credit Card Fraud Detection Dataset Insights

This dataset comprises anonymized credit card transactions from European cardholders in September 2013, transformed using principal component analysis (PCA) to protect personal information in compliance with GDPR regulations.

| No | Column ID | Column Name | Description |
| -- | --------- | ----------- | ----------- |
| 1 | Time | Time | Elapsed seconds between each transaction and the dataset's first transaction. |
| 2 - 29 | V1 - V28 | PCA Results | Features transformed via PCA to facilitate fraud detection. |
| 30 | Amount | Amount | Transaction amount in the credit card's currency. |
| 31 | Class | Transaction Type | Indicates the transaction's legitimacy (0=Legitimate, 1=Fraudulent). |
| 32 | Id | City ID | Links transactions to city IDs, correlating with the city latitude and longitude dataset for this workshop. |

### City Latitude and Longitude Dataset Description

Sourced from OpenWeather, this dataset provides the geographical coordinates of cities globally.

| No | Column ID | Column Name | Description |
| -- | --------- | ----------- | ----------- |
| 1 | Id | City ID | Unique identifier for each city. |
| 2 | Name | City Name | Name of the city. |
| 3 | State | State | The state or region, when applicable. |
| 4 | alpha2 | Country Code | Two-letter ISO3166-1 country code. |
| 5 | Lon | Longitude | City's longitude. |
| 6 | Lat | Latitude | City's latitude. |

### Country Code Dataset Overview

This dataset provides ISO3166-1 standard country codes and names, aiding in the geographic analysis of the credit card transaction data.

| No | Column ID | Column Name | Description |
| -- | --------- | ----------- | ----------- |
| 1 | companyjp | Country Name (JP) | Japanese name of the country. |
| 2 | companyen | Country Name (EN) | English name of the country. |
| 3 | numeric | Numeric Code | ISO3166-1 numeric country code. |
| 4 | alpha3 | Three-letter Country Code | Three-letter ISO3166-1 country code. |
| 5 | alpha2 | Two-letter Country Code | Two-letter ISO3166-1 country code. |
| 6 | location | Location (JP) | Geographic location in Japanese. |
| 7 | subdivision | Subdivision Code | ISO 3166-2 code for country subdivisions.

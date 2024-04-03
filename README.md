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


## Overview of Cloud Architecture
![architecture](https://github.com/EricFeng20001120/FraudDetection_Azure_Cloud/blob/main/media/Cloud%20Architecture.png)


The process begins within **Azure Machine Learning**, where a machine learning model is created and trained using Jupyter Notebooks. After training, the model is converted to the ONNX format to standardize and optimize it for high-performance inference in various environments. The model is then exported to Azure Blob Storage, a secure and scalable cloud storage solution.

Once stored in **Blob Storage**, the model is ready to be registered with **Azure Synapse Analytics**. A SQL script is executed within Synapse to read the model from Blob Storage and load it into a dedicated SQL pool table. This enables the model to be stored within the Synapse environment for easy access and management.

With the model registered, the **use phase** within Azure Synapse Analytics comes into play. Additional SQL scripts are run to load data for prediction from existing tables, apply the model using the PREDICT function, and then insert the predictions back into the Synapse database. This creates a full loop of training to prediction within the Azure ecosystem.

Finally, **Power BI** connects to Azure Synapse to visualize the prediction results. The powerful data visualization tools in Power BI enable stakeholders to interact with the predictions, extracting actionable insights and identifying trends and patterns critical for informed decision-making.

### Key Components and Features

- **Azure Machine Learning**: Utilized for developing and training the machine learning model with the added capability of easy conversion to ONNX format.
- **Azure Blob Storage**: Acts as an intermediary, providing a secure location for storing the ONNX model.
- **Azure Synapse Analytics**: Facilitates the operationalization of the machine learning model by loading it for batch scoring and managing the data workflow.
- **Power BI**: Offers a sophisticated suite for creating interactive visualizations and reports based on the predictions made by the machine learning model.

This cloud architecture is designed to be scalable and efficient, ensuring that data flows smoothly from model creation to insightful visualizations, all within a cohesive Azure environment.

Certainly! Here's a "Results" section for a README file that discusses visualizations in Power BI, along with a standard license section:

---

## Results

### Power BI Visualizations

The analytics process culminates with a series of insightful visualizations in Power BI, showcasing the findings derived from our machine learning model's predictions.

#### Time vs. Amount of Fraud

One of our primary visualizations is a time series analysis that illustrates the frequency and amount of fraudulent transactions over time. This visualization allows us to detect patterns, such as specific time frames where fraud is more prevalent. By understanding these trends, businesses can allocate monitoring resources more effectively.

![plot1](https://github.com/EricFeng20001120/FraudDetection_Azure_Cloud/blob/main/media/amount_vs_time.png)


#### Location vs. Amount of Fraud

Another critical visualization maps the amount of fraud against geographic locations. This geo-analysis helps to identify regions with higher incidences of fraudulent activities. Recognizing these hotspots is crucial for implementing region-specific countermeasures and for further understanding the geographic distribution of credit card fraud.

![plot2](https://github.com/EricFeng20001120/FraudDetection_Azure_Cloud/blob/main/media/amount%20vs%20time.png)

Both visualizations serve as key tools for stakeholders to understand the nuances of credit card fraud and to make data-driven decisions. The visualizations are interactive, allowing users to drill down into specific times and locations for a more detailed view.

### License

This project is made available under the MIT License. The terms of the license permit you to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the software, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


---


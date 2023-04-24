# analytics-eng-bootcamp
Welcome to the practical part of the analytics engineering bootcamp.
In this hands-on tutorial, we will build dimensional datawarehouse for northwind leveraging hybrid methodology. We will use real-world scenario and data to build dimensional models and practice various use cases, demonstrating the importance of data modelling for efficient data processing, analysis, and reporting. This tutorial will equip you with the skills and knowledge to model data effectively and drive business insights from your data.

### Set up BigQuery:

- Go to Google and create a Google account if you don't already have one.
- Create a new project for your hands-on tutorial. Give your project a unique name and update your Project ID.
- Once the project creation is completed, select the project that you recently created.
- Go to BigQuery.
- Create a dataset by selecting your project, giving the dataset an ID (DL_North_Wind), and selecting where you want to store data (europe-west3).
- To create the necessary tables for the tutorial, copy and paste scripts from the analytics-eng-bootcamp/dl_northwind_sql into a Google BigQuery editor and run them. These scripts will create empty tables, which we will then be populated with data.
Here are the steps to set up a Git repository:

### Set up Version Control:
```shell
mkdir analytics_engineering
git@github.com:TolgoAI/analytics-eng-bootcamp.git
```
### Set up DBT

1. First, make sure you have Python 3 installed on your machine. You can check your Python version by running the command `python --version`.

2. Open your terminal and run the following command to install dbt core with BigQuery provider using pip:
```shell
   pip install dbt-bigquery
```
3. Once the installation is complete, you can verify that dbt is installed correctly by running the command:
```shell
   dbt --version
```
This should display the version number of dbt that was installed.

4. To configure BigQuery credentials for dbt, you can create a file called `profiles.yml` in your `~/.dbt/` directory. Here's an example `profiles.yml` file with BigQuery credentials:

```
 analytics_bootcamp:
  outputs:
    dev:
      dataset: dbt_dataset
      job_execution_timeout_seconds: 300
      job_retries: 1
      location: EU
      method: oauth
      priority: interactive
      project: ae-bootcamp-t
      threads: 1
      type: bigquery
  target: de
```
For debugging and information on configuring dbt with BigQuery, check out the dbt documentation: https://docs.getdbt.com/docs/profile-bigquery
### Build Dimensional Model on BigQuery
Building a data warehouse involve understanding the use case, gathering requirements, defining the architectural design, creating a dimensional model, developing transformation code, and creating a physical dimensional model.
1. *Identify* and understand the use case: The first step in building a data warehouse is to identify and understand the use case. This involves understanding the business problem that the data warehouse is intended to solve, as well as the data sources and data requirements needed to support the use case.

2. *Gather requirements*: Once the use case has been identified, the next step is to gather requirements. This involves working closely with stakeholders to understand their business requirements and what they are trying to achieve. This includes defining the scope of the data warehouse, the data sources that will be used, and the specific data requirements needed to support the business objectives.

3. *Define architectural design*: Once the requirements have been gathered, the next step is to define the architectural design. This involves determining the overall structure of the data warehouse, including the types of data models that will be used, the data sources that will be integrated, and the overall data flow and processing requirements.

4. *Create a dimensional model*: After the architectural design has been defined, the next step is to create a high-level model of a dimensional model. This involves using tools such as ER diagrams to create a logical data model that describes the relationships between the data entities and the attributes of those entities.

5. *Develop transformation code*: Once the dimensional model has been created, the next step is to develop transformation code. This involves using SQL to transform the raw data into the format required by the dimensional model. This can involve cleaning the data, joining data from multiple sources, and aggregating data as needed.

6. *Create physical dimensional model*: After the transformation code has been developed, the next step is to create a physical dimensional model. This involves creating the actual tables and relationships needed to store the data in the dimensional model. This can involve creating staging tables, fact tables, dimension tables, and other supporting tables as needed.

### Use case presentation
The purpose of the use case is to modernize the data and reporting solution of a company called Northwind Traders, which is a specialty food trading company. They currently use a mix of on-premise and legacy systems, with a MYSQL database for transactional and reporting purposes. However, this has led to slow reporting and scalability issues, which prompted the company to seek a new solution. The aim is to phase out the on-premise solution and migrate to the Google Cloud platform, using Google Managed Services Cloud Sequel and building a Dimensional Data Warehouse on BigQuery. The main focus of the hands-on tutorial will be building the dimensional data warehouse.
### Requirement gathering:
The requirement gathering stage involves defining business processes, conducting data profiling to understand the data, creating a buzz matrix and naming convention document, and developing a conceptual model for communication. The output of this stage is a conceptual model. During interviews with business and stakeholders, reporting requirements were identified, including sales overview, sales agent tracking reports, product inventory report, and customer reporting. These reports will help the business make data-driven decisions and improve sales, inventory, and marketing.
### Data profiling:
Data profiling is an essential process in understanding the system and data. It helps to identify data redundancies, the complexity of the data, and the relationship between tables. By doing so, it will help to form the conceptual model and speed up the design solution. The following steps can be taken to perform data profiling in BigQuery:

- Start by looking at BigQuery tables.
- Examine the tables, their relationships, and their schema to understand the data.
- Check the correctness of the data types of the tables and make a note of any potential problems.
- Look at the details column of the tables to see the number of rows available.
- Preview the data to give it a quick scan and make notes of anything that might be helpful in understanding the data.

We will conduct data profiling by writing simple queries.
### Workbook walkthrough

A workbook has been created as a blueprint for the hands-on tutorial, with multiple tabs and columns grouped by color code.
Here are step-by-step instructions for using the Engineer Bootcamp workbook:

Access the workbook by navigating to analytics-engineering-bootcamp-workbook/Analytics Engineering Bootcamp - Excel.xlsx

The workbook is organized into three tabs: "template", "hands-on", and "completed". The first tab is a template that you can use to create your own bus matrix, while the second tab is where you will complete the tutorial exercises.

Start by focusing on the "Bus Matrix High Level Entities" section, which is located in the "Hands-On Tutorial" tab. This section contains several columns, each of which is color-coded for easy reference.

Throughout the tutorial, you will be going through various steps. The Analytivs Engineering Bootcamp workbook is a critical document that you will keep coming back to and using as a reference.

As you work through the tutorial exercises, you can refer to the "Completed" tab to see what the final expected result should look like.

Use the provided tabs to create your own bus matrix, and complete the tutorial exercises in the "Hands-On Tutorial" tab.

Once you have completed the exercises,review your work. You can use the "Completed" tab to check your results and make sure that you have understood everything correctly.

### Create a bus matrix
In order to create a bus matrix, we need to identify high-level entities for all the four business processes. The first process is the Sales Overview Report. Before creating the matrix, we need to review the sales overview requirements and highlight the keywords, such as sales customers, products, and transactions. Based on this, we create a table with a business process as a column and high-level entities as rows. For the Sales Overview Report, we need the orders table containing quantity and transactions, customer and employee tables, and some supply information. We also require a date dimension to create reports like last seven days last month and last quarter sales. Once we have marked all these requirements, we have successfully completed the bus matrix for Sales Overview.

The next process is Sales Agent Tracking, where we need to identify the dimensions based on the keywords, such as sales performance and sales agent. As the main purpose of this report is to identify high achievers, we need to know about employees, sales performance, and customers. Therefore, we need all these dimensions marked in our bus matrix.

After completing the bus matrix for these two processes, we get an idea of what to do next. In reality, we would create a workbook with all the details and use it as a reference throughout the project. An analytics engineering bootcamp workbook is available for this purpose, containing everything covered in this hands-on tutorial. We have various tabs in the workbook, including the bus matrix high-level entities tab. The workbook is organized in three different tabs, including a template, a tab for hands-on work, and a completed tab.

Overall, the bus matrix helps us identify the high-level entities required to build our business processes, and it is an essential step in building a dimensional data warehouse.

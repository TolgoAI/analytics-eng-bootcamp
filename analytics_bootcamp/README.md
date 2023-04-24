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
We'll create a bus matrix with a high level entities for all the four business processes that were discussed earlier.

So let's start with our first sales overview report before we create a bus matrix. Before,let's go back and look at our sales overview requirements.Some obvious keywords, such as sales customers and what is being sold and what was sold can be highlighted. These keywords give us some idea on what dimensions our sales overview report should contain.

Now, for us to build a bus matrix, we create a table with a business process as a column so you can see and the high level entities that we identified earlier.

Please note that we've only brought in the columns that we think is going to be required sometime. You can bring all the columns that you have identified. It's really up to you to see how you want to build this template and how you want to create your bus
matrix.

For now, for the tutorial purpose, I want to keep it fairly simple for everyone to understand this. So I only brought in very few columns, which I think we are going to need it. Next, we mock which entities we think would be required to build our business processes.

Sales Overview Report Since we are interested in sales and what is being sold, we can assume that we need to have products so we can measure sales. Our earlier data profiling indicated that the orders table contains quantity and transactions.

So we will need that. This is an obvious one, as our key would highlights customers, so we'll need a customer and employee tables.
We need employee table because some of our customers can be our employees, too.

So we want to understand all of our customers. We also think it is a good idea to have some supply information as part of our reports, so we will market as required at this point.Everything is high level at this point.

Next will mark the date dimension as a requirement as well. You'll notice that there wasn't a date table in our data late tables earlier. So how come we have a date table here? This is mostly because without a date dimension, we won't be able to create reports such as last seven days last month.

Last quarter sales, usually when we build a dimensional data warehouse, a dim date is almost a requirement. So we are getting ahead of ourselves and just putting a date table here just to be safe.

So now we have successfully completed a bus matrix. High level entities for our sales overview.

let's create a bus matrix for one more requirement.So next one, we had sales agent tracking, same as our previous exercise. Let's try to highlight keywords and see which one stands out as an obvious dimension for our business process.

We have sales performance and sales agent. Main purpose of this report is to identify high achievers. So that we can reward them and help the rest of the sales agent. So generally in this scenario, we need to know about employees. We need to understand sales performance. So it's order related.

And the customers are another dimension which will indicate our performance measures. So again, this is very similar to our previous one. So we know that we are going to need all of these dimensions. Now we have completed our bus matrix for sales agent tracking. This is all high level entities just to give us some understanding of what were you going to do as a next step.

So now it's time for you to try it yourself.

You'll notice that previously all of my bus matrix were done in this slide.

In reality, you wouldn't be doing this in a slide, you would actually be using a workbook.

So what I have done is I have created a workbook for you to use it as a blueprint.

So let me give you a quick walkthrough of this workbook and how you can use this.

Here you can see an Engineer Boot Camp workbook.

This workbook basically contains everything that we would be covering in this hands-on tutorial.

You can see there are quite a few bit of columns here.

Everything grouped by the color code.

So you we have the bus matrix high level entities, which is what we are currently focusing.

But throughout this tutorial, we'll be going through quite a bit of step.

And this workbook is going to be a critical document.

We'll keep on coming back to this and use it as a reference.

Also, in a real life scenario, you will have a document of a similar form or structure that you will

be needing to use it as a guidebook.

So we have we have quite a few bit of tabs here, and as we go through this tutorial, I will take you

guys through everything in detail.

But for now, just make a note of it.

There are many of these tabs in here and we will be needing all of these throughout our hands on tutorial.

So you can access this workbook through two ways.

One is through a resources section and also in the resources section.

You have a URL of this Google Sheet, which you can basically clone it yourself.

If you come to this file menu, you can simply make a copy of this and you can use it and follow the

tutorial.

So now let's go back to our bus matrix high level entities.

Our what book is organized in a three different tabs.

The first would be a template always.

And then the second tab here is something that I usually would use throughout this tutorial to show

you how to do it hands on.

And I would recommend you do the same thing.

You can either duplicate this.

Or you can just use this tab where I have been working and overwrite the content is up to you to decide

how you want to do this.

And then usually we have a completed tab as well.

So once we take a pause and you do it by yourself or you can try it by yourself, you can always come

back to the completed taps to understand what is the final result.

What is the final expected result?

So now let's take a pulse and please go to this workbook and try to complete this two business processes.

The first one is a product inventory in order for us to build product inventory bus matrix.

We need to understand what is the business process for product inventory.

Whenever I'm building a bus matrix, I find it very easy and helpful to go back to my business process

list and to look at what each of these business processes entails and what are the details that I can

use to build the bus matrix.

So take a pause here.

Try to build the bus matrix by yourself, and let's come back and revisit and see if you got everything

right.

All right.

Let's have a look at the product inventory now.

So some important key words here are current inventory, stock and suppliers.

What our business is looking for is to understand better deals.

From here, we can pinpoint some very obvious dimensions since it is to do with stock and suppliers.

We are definitely going to need orders and supplier dimensions.

We also need product dimension to understand what product details such as product name, price of products

and what category do they belong to.

And we will need our date dimension as usual.

Let's have a look at the next one customer reporting.

So our new reporting requirement is customer reporting.

This is where our business wants to find out our most valuable customers in order to do that.

We need to understand how and what they are purchasing and when they're purchasing it.

How much do they have spent in total in our product?

And what we need to use sales data to figure this out.

So let's have a look at our tables and see what we can find here.

We can see we have a table call purchase orders.

And purchase order details.

And you can see in here that in the purchase order details.

We have quantity unit costs associated with it.

The reason I'm showing you this is just to make sure that when we build bus matrix for high level entities,

it's not just about making random guesses.

You still need to go back to your bakery tables by looking at this two table.

We can make a guess here that this could potentially be our effect tables.

So far, we have been thinking from a more of a dimensions and which tables that we associated.

We are not really trying to build a team, in fact at this moment because it is very high level and

conceptual.

But we can also see here we have orders and order details, which we currently have as a table.

We are not really calling them dimensions at the moment, but this could become our effect tables because

again, you can see here we have all the meshes, right?

So let's just make a note of that for now, and we'll complete a high level entities.

And as the next step will need to refine all of our understanding and findings and improve our bus matrix

report.

Let's go back to our findings on our customer reporting.

Again, this is all related to customers and regarding purchase orders and all of their sales information.

So again, we are going to need all of our tables here.

So products, orders employees, customers, suppliers and date.

So here is our completed bus matrix for high level entities.

So hopefully by now you have better understanding of what is a bus matrix and what are the business

processes.

How do you do data profiling to build bus matrix of a high level entities?

So once we have all of these high level entities, what we need to do as a next step is to build our

conceptual model."

Here is the neatly written input you requested:

0:01 / 11:31

Transcript

Now we know our business processes and the high level entities, let's create our bus matrix.

We'll create a bus matrix with high level entities for all the four business processes that we discussed earlier.

Let's start with the first business process.

So let's start with our first sales overview report before we create a bus matrix.

I would like to mention that this is an integrated approach and it is slightly involved to get it correct at the first time. Same as our data profiling step for our hands and purposes.

We'll try our best to explain the process and create a bus matrix.

But in a real life scenario, we might not get the answers so quickly. So just make a note of that.

It might take a little while for you to get everything correct.

So let's go back and look at our sales overview requirements.

We can highlight some obvious keywords, such as sales customers and what is being sold and what was sold.

These keywords give us some idea on what dimensions our sales overview report should contain.

Now, for us to build a bus matrix, we create a table with a business process as a column so you can see and the high level entities that we identified earlier.

Please note that we've only brought in the columns that we think is going to be required sometime.

You can bring all the columns that you have identified.

It's really up to you to see how you want to build this template and how you want to create your bus matrix.

For now, for the tutorial purpose, I want to keep it fairly simple for everyone to understand this.

So I only brought in very few columns, which I think we are going to need it.

Next, we mock which entities we think would be required to build our business processes.

Sales Overview Report

Since we are interested in sales and what is being sold, we can assume that we need to have products so we can measure sales.

Our earlier data profiling indicated that the orders table contains quantity and transactions. So we will need that.

This is an obvious one, as our key would highlights customers, so we'll need a customer and employee tables.

We need employee table because some of our customers can be our employees, too. So we want to understand all of our customers.

We also think it is a good idea to have some supply information as part of our reports, so we will mark it as required at this point.

Everything is high level, so that is OK.

Next, we'll mark the date dimension as a requirement as well.

You'll notice that there wasn't a date table in our data late tables earlier.

So how come we have a date table here?

This is mostly because without a date dimension, we won't be able to create reports such as last seven days, last month, last quarter sales.

Usually when we build a dimensional data warehouse, a dim date is almost a requirement.

So we are getting ahead of ourselves and just putting a date table here just to be safe.

So now we have successfully completed a bus matrix.

High level entities for our sales overview, let's create a bus matrix for one more requirement.

So next one, we had sales agent tracking, same as our previous exercise.

Let's try to highlight keywords and see which one stands out as an obvious dimension for our business process.

We have sales performance and sales agent.

The main purpose of this report is to identify high achievers, so that we can reward them and help the rest of the sales agent.

So generally in this scenario, we need"

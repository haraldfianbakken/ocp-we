![Microsoft Cloud Workshops](/challenge1/media/ms-cloud-workshop.png "Microsoft Cloud Workshops")

<div class="MCWHeader1">
WE OCP TechTeam Offsite
</div>

<div class="MCWHeader2">
App modernization - Whiteboard design session & guide
</div>

<div class="MCWHeader3">
September 2018
</div>

# App modernization whiteboard design session student guide

## Abstract and learning objectives

In this whiteboard design session, you will work with a group to design a solution for modernizing legacy on-premises applications and infrastructure by leveraging cloud services, while adding a mix of web and mobile services, all secured using Azure Active Directory.

At the end of this whiteboard design session, you will be better able to design a modernization plan for organizations looking to move services from on-premises to the cloud.

**Note:** *Before you begin...total planned time for this challenge is 1h20min; 70 minutes for readning customer neeed + planning & design a solution architecture. Last 20 min (10 per team) will be used for teams mutual presenting of crafted solution. We wish to you all - good luck, fun and discovery time with your team!*

## Step 1: Review the customer case study 

**Outcome** 

Analyze your customer’s needs.

Timeframe: 10 minutes 

Directions: all participants in the session, read supplied materials, make notes and engage the challenge. Here are few activites to make your team start: 

1.  Meet your table participants and trainer
2.  Read all of the directions for steps 1–3 in the Student guide
3.  As a table team, review the following customer case study


### Customer situation

Contoso, Ltd. is a new company in a very old business. Founded in Auckland, New Zealand, in 2005 by senior life insurance executives, the ambitious new company provides a full range of long-term insurance services to help people who are underinsured.

Almost from the start, the company grew far faster than anticipated. An avalanche of business meant that the original processes created to manage policy documentation became overloaded. Employees struggled to cope, even as the headcount rose from five to 110 during the first year.

"By the beginning of 2007, we had over 750,000 pages of partly hand-written policy documents filed in our offices," says Mirand Lark, General Manager, Contoso, Ltd. "Customer-facing employees could not retrieve policies quickly, and we faced a service bottleneck. Slow response times impacted customer service, and the ability to locate documents quickly cost us time and money."

With a combined 150 years of industry experience, the founders of Contoso, Ltd. knew exactly what capabilities they wanted: automated document forwarding from brokers, secure access for brokers to Contoso, Ltd., access to policy information, and ready policy retrieval for a dispersed workforce.

To overcome its challenges, executives set about to digitize and file all existing policy documents and find a way to automatically file new policies as soon as brokers submitted them. To accomplish this, Contoso, Ltd. implemented PolicyConnect, a custom Windows Forms application used by its staff to input key metadata that includes policyholder information such as insured amount, beneficiary, policy type, and any deductible and out-of-pocket requirements.

Contoso employees access this application, which ultimately stores its data in a SQL Server 2008 and a file server on their local area network.

Contoso, Ltd. provided the following diagram about its current topology:

![The Contoso topology diagram has a local area network comprised of the on-premise user, Application servers for authentication and authorization, policy management and data access service, database servers, and file servers. A VPN server connects them to the Remote User via PolicyConnect.](images/Whiteboarddesignsessiontrainerguide-Appmodernizationimages/media/image2.png "The Contoso topology diagram has a local area network comprised of the on-premise user, Application servers for authentication and authorization, policy management and data access service, database servers, and file servers. A VPN server connects them to the Remote User via PolicyConnect.")

Contoso's Windows Forms application is a traditional n-tier platform containing a data access layer, which houses the SQL Server data access methods; a business logic layer that handles things like user login (username and password) and policy rules; and a presentation layer comprised of the screens a user views while creating a new policy holder. The design follows a service-oriented architecture, with a series of Windows Communication Foundation (WCF) services representing the services and capabilities required for each tier. Scanned PDFs of policy documents are stored on a file server accessible via a network share and referenced in the solution by a canonical path (customer last name and policy number). The key metadata for each policy document is currently entered manually by Contoso staff members into the application and ultimately stored in a SQL Server.

The application currently supports access via VPN for users outside the Contoso local area network. As such, Contoso brokers are unable to view data or documents unless granted VPN access, which has proven time-consuming and difficult for the brokers.

Contoso employees rely on email as a workflow engine relative to the document management tasks. One group is responsible for scanning and cataloging while another group is responsible for assigning the policies to the specified broker. Manually written emails are sent to brokers when their customer's policies have been scanned and indexed. They are using Office 365.

The company executives have frequent challenges in gauging productivity and throughput given the manual workflow---they feel that they are blocked in quickly getting to the insights they need because each new question seems to need more custom development.

Contoso Insurance wants to make its policyholder system available to its employees and brokers via web and mobile applications without requiring VPN. They also want to store policies in cloud storage for retrieval via the web and mobile applications. Their new web application will permit policyholders to log in, review their information, and retrieve a PDF copy of their policy. The mobile application will permit the same functionality. An Application Programming Interface (API) will drive both the web and mobile applications. The web application, database, and API will all be deployed to the cloud. In addition, they are interested in learning about light weight, serverless architectures that may help them implement some API functionality more rapidly, such as providing access to policy documents in storage. Contoso brokers will be provided a link to the mobile application via the website, which targets iOS and Android devices.

Contoso would like to migrate its SQL Server-based database to SQL Database. According to Contoso, it does not use any of the "fancy" SQL Server features and hopes the migration can be a slam dunk.

Given all these new clients, their databases will become overloaded, so they want to ensure they employ best practices for mitigating the impact of repeated querying of the database. Along these lines, they would like to implement a scoreboard of sorts that tracks the most active users in a 24-hour period, as well approximates the number of operations that user performed with the system in perpetuity. Both metrics are interesting to management to be able to get a cursory understanding of who the heaviest users are and how much they really use the system.

Contoso has multiple development teams that focus on separate business units, e.g. underwriting, sales and brokers, compliance, etc. IT leadership is excited to move as much business logic to APIs as possible, but concerned that, over time, there will be duplication of effort as each team develops new or revises existing APIs. Contoso would also like to open up a subset of APIs to a network of affiliated partners. They are interested in strategies that will help them provide discoverability, security and lifecycle management of an evolving API ecosystem. In the future, they realize they will need advanced analytics and data visualizations of API usage to help manage the API inventory.

According to Mirand Lark, "Mobile applications represent a way to empower our brokers and our employees by bringing our software to the palm of their hands. While we will invest in making the best mobile app version of PolicyConnect possible, we also want to make sure we have a streamlined way for our internal departments to quickly build their own apps to automate their own time-saving micro-processes without having to involve the PolicyConnect development team or ideally even developers." He cited additional examples of these micro-processes, such as enabling employees to set rules, such as when a VIP customer sends an email, they get an application notification on their mobile device; or enabling them to set workflows, like automatically saving attachments in emails with policy documents to the proper location in cloud storage.

With this new system, Contoso would like to improve its security practices. In the previous version, each application tier maintained its configuration settings locally. For example, the data access layer would store the connection strings for SQL Server locally on disk. It would like to take an approach of externalizing secrets such as these from the web apps and APIs, and storing them in an encrypted location accessible only to authorized services.

Cost containment will be achieved through use of cloud-based services. The aging Contoso datacenter can be retired and the hardware therein repurposed or disposed. Additional mail processing costs of approximately \$250,000 will be eliminated through the new cloud-based platform.

"Our directors wanted a document system they could quickly adapt, that would keep costs low, but help them expand very quickly indeed," says Lark. "They did not want to invest in on-site infrastructure if the resources and IT support involved ultimately slowed our growth. The directors had a clear ICT strategy: 'All systems to the cloud.'"

### Customer needs 

1.  Contoso wants to modernize the architecture of its solution, while keeping it .NET-based.

2.  They would like a .NET developer-friendly way to implement its PolicyConnect mobile app for Android and iOS.

3.  They are looking for ways to empower its business users to create their own internal mobile apps that help them streamline their processes without the time and resource investment that goes into implementing full-scale mobile apps.

4.  They would like to improve the management of application secrets.

5.  They would like to make all of its policy documents full-text searchable, with the minimal amount of implementation effort.

6.  They are interested in leveraging serverless technologies to speed up API development and are interested in a POC that can be used to retrieve policy documents from storage.

7.  They would like to migrate to SQL Database.

8.  Contoso wants to understand how to better deploy caching in its solution, both for the purposes of lessening load on the database and for providing scalable scoreboards.

### Customer objections 

1.  We have seen services like IFTTT that let business users automate processes. Does Microsoft Azure offer something similar?

2.  Our developers have heard of Logic Apps. Will these be replaced by Microsoft Flow?

3.  Is there really a way to securely store application secrets in the cloud?

4.  We noticed that Azure SQL Database does not support all the features we are accustomed to in SQL Server, not that we are using them currently. Specifically, we were thinking about Linked Servers, Database Mail, SQL Server Agent Jobs, and Service Broker. What are our options for these in Azure?

5.  Moving everything to APIs sounds great but how can we stay on top of our API inventory and manage discoverability, security, lifecycle, and monitoring into the future? Is there something we could use to easily develop a proof of concept now? 


### Infographic for common scenarios

![The Common scenario for an E-Commerce Website diagram has an Enterprise and an End User connected via an internet tier, a services tier, and a data tier.](images/Whiteboarddesignsessiontrainerguide-Appmodernizationimages/media/image3.png "Common scenario for an E-Commerce Website diagram")

## Step 2: Design a proof of concept solution

**Outcome** 
Design a solution and prepare to present the solution to the target customer audience in a 15-minute chalk-talk format. 

Timeframe: 60 minutes

**Business needs**

Directions: With all participants at your table, answer the following questions and list the answers on a flip chart. 
1.  Who should you present this solution to? Who is your target customer audience? Who are the decision makers? 
2.  What customer business needs do you need to address with your solution?

**Design** 
Directions: With all participants at your table, respond to the following questions on a flip chart.


 *High-level architecture*

1.  Without getting into the details (the following sections will address the particular details), diagram your initial vision for handling the top-level requirements for the mobile and web applications, data management, and extensibility.

    *Mobile and web applications*

1.  How should Contoso implement the PolicyConnect mobile app?

2.  What Azure service would host the website?

3.  What Azure service would host the services supporting the mobile app backend? Would you suggest a Mobile App or an API App? Why?

4.  What Azure service would provide a lightweight, serverless API solution for retrieving policy documents from Azure blob storage?

5.  How would you secure sensitive information used by the website and APIs? Be specific on the Azure Service used, how you would configure it, and how the web or API logic would retrieve its secrets at run time.

6.  What recommendations can you make to help Contoso manage its API inventory as it grows in the future? Are there services in Azure that can provide a proof of concept *API Store* experience now and serve as path to development in the future?

    *Data management*


1.  What tools would you recommend Contoso use to migrate its database? How would you use these? Be specific.

2.  What patterns and services would you use to reduce load on the database? Implement the scoreboards? Be specific on the Azure services used and how the application would take advantage of them.

3.  Given their requirements, how would you enable full-text search on the stored policy documents?

    *Extensibility*


1.  How would you enable its business users to create their own internal mobile apps that help them streamline their processes without the time and resource investment that goes into implementing full-scale mobile apps?

2.  Given your answer to the previous question, how would a Contoso business user implement the scenario where a high-priority email is sent to his Office 365 email and in response an application notification appears on his device?

**Prepare**

Directions: With all participants at your table: 
1.  Identify any customer needs that are not addressed with the proposed solution.
2.  Identify the benefits of your solution.
3.  Determine how you will respond to the customer’s objections.

Prepare a 10-minute chalk-talk style presentation to the customer. 


## Step 3: Present the solution

**Outcome**
 
Present a solution to the target customer audience in a 10-minute chalk-talk format.

Timeframe: 20 minutes total (10 minutes per team)

**Presentation** 

Directions:
1.  Pair with another table
2.  One table is the Microsoft team and the other table is the customer
3.  The Microsoft team presents their proposed solution to the customer
4.  The customer makes one of the objections from the list of objections
5.  The Microsoft team responds to the objection
6.  The customer team gives feedback to the Microsoft team.
7.  Tables switch roles and repeat Steps 2–6


 
##  Additional references

|    |            |
|----------|:-------------:|
| **Description**                             |  **Links**                                                                                               |
| Hi-resolution version of blueprint           | > <https://msdn.microsoft.com/dn630664#fbid=rVymR_3WSRo>                                                   |
| Getting started with Xamarin and Mobile Apps | > <https://azure.microsoft.com/en-us/documentation/articles/app-service-mobile-xamarin-forms-get-started/> |
| Key Vault Developer's Guide                  | > <https://azure.microsoft.com/en-us/documentation/articles/key-vault-developers-guide/>                   |
| About Keys and Secrets                       | <https://msdn.microsoft.com/en-us/library/dn903623.aspx>                                                   |
| Register an Application with AAD             | <https://azure.microsoft.com/en-us/documentation/articles/key-vault-get-started/#register>                 |
| How to Use Azure Redis Cache                 | <https://azure.microsoft.com/en-us/documentation/articles/cache-dotnet-how-to-use-azure-redis-cache/>      |
| Intro to Redis data types & abstractions     | <http://redis.io/topics/data-types-intro>                                                                  |
| Intro to PowerApps                           | <https://docs.microsoft.com/en-us/powerapps/getting-started>                                               |
| Get Started with Flow                        | <https://flow.microsoft.com/en-us/documentation/getting-started/>                                          |
| Indexing Documents in Blob Storage           | <https://azure.microsoft.com/en-us/documentation/articles/search-howto-indexing-azure-blob-storage/>       |
| Working with Azure Functions Proxies         | <https://docs.microsoft.com/azure/azure-functions/functions-proxies>                                       |
| Azure API Management Overview         | <https://docs.microsoft.com/en-us/azure/api-management/api-management-key-concepts>                                       |

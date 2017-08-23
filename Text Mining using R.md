# Text mining using R
Text mining web scraped data is increasingly becoming a go-to method to gather data and analyze trends specially in on social media platforms. Here is an example of my favourite one-Reddit where I've analyzed data from r/RandomActsofPizza and tried to make sense of data that is in JSON style through R

## Background
**"Random Acts of Pizza"** is a subreddit that is very unique to the Reddit fabric. Here a user can put in a request for a pizza to be donated by another user. Some requests are granted, others are not. 

## Data Mining
Using the Reddit API I managed to get pizza_requests.txt which includes requests from approximately 5500 pizza requests. Data for each request includes a statement describing the nature of the request, and various other pieces of information. The other README_pizza.txt is a guide to the data set.

## Methodology
The data in it's unique format was difficult to parse in R. After numerous attempts at combining all the data into 1 workable data table, as is the practise, I started parsing data specifically for the kind of questions I was trying to answer. This exercise clcearly changed the way I not only looked at data but how I analysed it. After many iterations and frustrating coding sessions, I was able to work out a method to parse data based on patterns within the txt file. This required a lot of trial and error. Some fields still required special care because they contained special characters which broke my functions. 

## Objectives and Results
I set out to answer some relevant questions and some fun questions to keep myself interested in this. 
 
**The below 7 are the ones I have finally kept in my analysis.**

1. Proportion of requests that were successful. (The requester received pizza.) 
   24.63% of all requests were successful

2. Mean number of subReddits subscribed to, and how many distinct subReddits are there among all the requests
   The mean number of subreddits subscribed to by the requester was 17.96985
   The distinct number of subreddits are 9404

3. Median account age at the time of request for all requests.
   Median value of age at request was 155.6476

4. 95% confidence interval for the difference in proportion of successful pizza requests between the those below the median and above it. 
   The 95% CI for the difference in Population proportions of successful pizza requests (0.06684119,0.0220477)

5. Number of users who made multiple pizza request(more than one) 
   Each user requested pizza only once

6. Mean number of requester upvotes at retrieval.
   Mean requester upvotes at retriveal was 5171.345

7. Percentage of request texts that mentioned the word "student".
   The word student occurs 7.86% of request_text
   
   ## Conclusion
   
   Text Mining is indeed a great leveler in terms of understanding quality of data. As we hurtle through the age of information, a lot of useful and fun data will be unstructured and in string format. This exercise helps understand how to deal with data sets which are not formatted difficult to parse and large in size

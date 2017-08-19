# Text-mining-using-R
Text mining web scraped data is increasingly becoming a go-to method to gather data and analyze trends specially in on social media platforms. Here is an example of my favourite one-Reddit where I've analyzed data from r/RandomActsofPizza and tried to make sense of data that is in JSON style through R

"Random Acts of Pizza" is a subreddit that is very unique to the Reddit fabric. Here a user can put in a request for a pizza to be donated by another user. Some requests are granted, others are not. 

Using the Reddit API I managed to get pizza_requests.txt which includes requests from approximately 5500 pizza requests. Data for each request includes a statement describing the nature of the request, and various other pieces of information. The other README_pizza.txt is a guide to the data set.

I set out to answer some relevant questions and some fun questions to keep myself interested in this. The below 7 are the ones I have finally kept in my analysis.

1. Proportion of requests that were successful. (The requester received pizza.)
2. Mean number of subReddits subscribed to, and how many distinct subReddits are there among all the requests
3. Median account age at the time of request for all requests.
4. 95% confidence interval for the difference in proportion of successful pizza requests between the those below the median and above it. 
5. Number of users who made multiple pizza request(more than one) 
6. Mean number of requester upvotes at retrieval.
7. Percentage of request texts that mentioned the word "student".

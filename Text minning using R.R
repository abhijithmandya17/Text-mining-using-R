library("tidyverse")
library("stringr")

#This function matches the given string pattern within the data, unlists it, splits it by "," and trims the final output
grep_unlist <- function(x, string){
  y <- sapply(x, function(x) grep(string, x, ignore.case=T, value = T))
  unlisted <- unlist(y)
  split_unlisted <- sapply(strsplit(unlisted, ","), "[", 2)
  split_unlisted_trimmed <- trimws(split_unlisted)
  return (split_unlisted_trimmed)
}

#Read the file with all the data
pizza_requests <- readLines('pizza_requests.txt')

#1

#pass grep_unlist function on pizza_requests to extract useable column for requester_received_pizza 
requester_received_pizza <- grep_unlist(pizza_requests,"requester_received_pizza")

#Calculate % successful requests (true/all) 
Successful_requests <- length((requester_received_pizza)[requester_received_pizza=="true"])/length(requester_received_pizza)
#24.63% of all requests were successful

#2
#pass grep_unlist function on pizza_requests to extract useable column for "requester_number_of_subreddits_at_request" 
subreddits_no <- grep_unlist(pizza_requests,"requester_number_of_subreddits_at_request") 
subreddits_mean <- mean(as.numeric(subreddits_no))
#The mean number of subreddits subscribed to by the requester was 17.96985

#As subreddits are a list within a list, they come within {} 
#thus we can subset the data where none of the below characters match
subreddits <-  subset(pizza_requests, str_detect(pizza_requests,"\",")==FALSE 
                      & str_detect(pizza_requests,"\\}")==FALSE 
                      & str_detect(pizza_requests,"%%%%%%%%%%")==FALSE)

#Replace the internal quotes within the hypothtical list that were left in the subset
subreddits <- trimws(str_replace_all(subreddits,"\"",""))
#call length on the unique values within the subreddits vector 
unique_subreddits <- length(unique(subreddits))
#The distinct number of subreddits are 9404

#3
#pass grep_unlist function on pizza_requests to extract useable column for "requester_account_age_in_days_at_request" 
account_age_request <- grep_unlist(pizza_requests,"requester_account_age_in_days_at_request")

#The grep_unlist returns data in factors/characters thus it will have to be converted to numeric before passing the median function
account_age_request <- as.numeric(account_age_request)
median_age <- median(account_age_request)
#Median value of age at request was 155.6476

#4
#Create data frame of pizza requests and age of the account
pizza_received_age <- data.frame(account_age_request,requester_received_pizza)

#The population proportion for those with an account age less than the median
median_lower <- nrow(pizza_received_age[pizza_received_age$account_age_request<median_age 
                                        & pizza_received_age$requester_received_pizza=="true",])/
                                        length(account_age_request[account_age_request<median_age])

#The population proportion for those with an account age higher than the median
median_higher <- nrow(pizza_received_age[pizza_received_age$account_age_request>median_age 
                                                         & pizza_received_age$requester_received_pizza=="true",])/
                                                        length(account_age_request[account_age_request>median_age])

#The population of those with an account age less than the median
n1 <- length(account_age_request[account_age_request<median_age])
#The population of those with an account age higher than the median
n2 <- length(account_age_request[account_age_request>median_age])

#95% CI for (median_higher -median_lower)
ZSE95 <-qnorm(.975)*sqrt((median_lower*(1-median_lower)/n1) + (median_higher*(1-median_higher)/n2)) 

#Difference in population proportion + ZSE
(median_higher-median_lower + ZSE95)
#Difference in population proportion - ZSE
(median_higher-median_lower - ZSE95)
#The 95% CI for the difference in Population proportions of successful pizza requests (0.06684119,0.0220477)


#5
#pass grep_unlist function on pizza_requests to extract useable column for "requester_username" 
username <- grep_unlist(pizza_requests,"requester_username")

#check if the length of the username vector is equal to of it's own unique after converting to lowercase
length(username)==length(tolower(unique(username)))
#The above line returns TRUE which means each user requested pizza only once. 

#6

#pass grep_unlist function on pizza_requests to extract useable column for "requester_upvotes_plus_downvotes_at_retrieval" 
up_plus_down <- grep_unlist(pizza_requests,"requester_upvotes_plus_downvotes_at_retrieval")

#pass grep_unlist function on pizza_requests to extract useable column for "requester_upvotes_minus_downvotes_at_retrieval" 
up_minus_down <- grep_unlist(pizza_requests,"requester_upvotes_minus_downvotes_at_retrieval")

#As the grep_unlist returns non mumeric characters, we need to convert the 2 vectors before summing and taking  a mean.
#requester upvotes are (up+down+up-down)/2
mean_upvotes <- mean((as.numeric(up_minus_down)+as.numeric(up_plus_down))/2)
#Mean requester upvotes at retriveal was 5171.345

#7

#As the request text column contains a "," within the string we want, we cannot apply grep_unlist directly
#We apply it in phases where we stop at jist unlisting the vector
request_text <- sapply(pizza_requests, function(x) grep('request_text",', x, ignore.case=T, value = T))
request_text_unlisted <- unlist(request_text)

#Apply grep to find instances of "student" in the unlisted vector
student <- sapply(request_text_unlisted, function(x) grep("student", x, ignore.case=T, value = T))

#Find the percentage of the word "student" in all of request_text 
student_pct <- length(unlist(student))/length(request_text_unlisted)*100
#The word student occurs 7.86% of request_text

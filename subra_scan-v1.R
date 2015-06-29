library(ggplot2)           #essential plotting package for R
library(quantmod)          #access to stock return data from various external sources
library(reshape2)              #for the 'dcast' and 'melt' functions
#library(DataAnalytics)     #package created by Professor Rossi which has some cool R functions

#import portfolio holdings for each strategy
setwd("C:/Users/usw47f0/Documents/R/subra_scan/")

df.fscore_portfolio = read.csv("fscore_out_06_16.csv")   #list of tickers

df.subra_ranks = read.csv("subra_ranks.csv", header = TRUE)   #list of tickers

df.merge = merge(x = df.subra_ranks, y = df.fscore_portfolio, by.x = 'ticker', by.y = 'tic', all.x = TRUE)
df.merge = df.merge[,c('ticker','fyear','F_SCORE_adj','quintile')]
df.merge = df.merge[order(-df.merge$fyear, -df.merge$F_SCORE_adj, -df.merge$quintile),]

df.merge[df.merge$ticker == 'ZAGG',]

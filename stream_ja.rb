#!/usr/bin/ruby
#coding:utf-8

require 'rubygems'
require 'tweetstream' 

TweetStream.configure do |config|
  config.consumer_key = 'KTtr7SE6CX0nI4yFg4s3fg'
  config.consumer_secret = '3aBc0kp3wYyQY1tPfjkVMx7tpIJmVbqL5m5belghM'
  config.oauth_token = '458569192-u8sBOurXqUqDdwexz0pt24hqwhw47JDTxckQLU'
  config.oauth_token_secret = 'mRO2xXnhkwuY8B7vnKXlLDVJnriYB57eVPHKZRilwk'
  config.auth_method = :oauth
  config.parser   = :yajl  #using Yajl-Ruby
end
 
TweetStream::Client.new.sample do |status|
    if status.user.lang == 'ja'
        puts "#{status.text}"
        #puts "#{status.user.screen_name} : #{status.text}"
    end
end

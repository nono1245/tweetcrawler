#!/usr/bin/ruby
#coding:utf-8

require 'rubygems'
require 'tweetstream' 

TweetStream.configure do |config|
  config.consumer_key = 'hogehoge'
  config.consumer_secret = 'hogehoge'
  config.oauth_token = 'hogehoge'
  config.oauth_token_secret = 'hogehoge'
  config.auth_method = :oauth
  config.parser   = :yajl	#using Yajl-Ruby
end
 
TweetStream::Client.new.sample do |status|
    #if status.user.lang == 'ja'
        puts "#{status.text}"
        #puts "#{status.user.screen_name} : #{status.text}"
    #end
end

#!/usr/bin/ruby
#coding:utf-8

require 'rubygems'
require 'tweetstream' 
require 'yaml' #txtに書いたkeyなどを呼び出せる
require 'eventmachine' #非同期処理で高速動作

CONF = YAML::load(open("config.yaml")) #API keyを呼び出す
 
TweetStream.configure do |config|
  config.consumer_key       = CONF["consumer_key"]
  config.consumer_secret    = CONF["consumer_secret"]
  config.oauth_token        = CONF["access_token"]
  config.oauth_token_secret = CONF["access_token_secret"]
  config.auth_method        = :oauth
  config.parser   = :yajl  #using Yajl-Ruby
end
 


#TweetStream::Client.new.track('hoge') do |status|

TweetStream::Client.new.sample do |status|
    if status.user.lang == 'ja'
	reply = status.in_reply_to_user_id == nil ? "P" : "R"
        puts "#{status.created_at} : #{reply} : #{status.user.screen_name} : #{status.text}"
    end
end

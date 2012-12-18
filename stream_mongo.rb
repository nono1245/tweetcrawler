#encoding: utf-8
require 'rubygems'
require 'tweetstream'
require 'mongo'
require 'eventmachine'
 
db = Mongo::Connection.from_uri('mongodb://y-iwasaki:shares030@ds045557.mongolab.com:45557/tweetstream121212').db('tweetstream121212')
@items = db.collection('items')
 
TweetStream.configure do |config|
  config.consumer_key = 'KTtr7SE6CX0nI4yFg4s3fg'
  config.consumer_secret = '3aBc0kp3wYyQY1tPfjkVMx7tpIJmVbqL5m5belghM'
  config.oauth_token = '458569192-u8sBOurXqUqDdwexz0pt24hqwhw47JDTxckQLU'
  config.oauth_token_secret = 'mRO2xXnhkwuY8B7vnKXlLDVJnriYB57eVPHKZRilwk'
  config.auth_method = :oauth
  config.parser = :json_pure
end
 
EM.run do
  client = TweetStream::Client.new
 
  def write_to_mongolab(status)
    EM.defer do
      item = {
        :id_str => status.id_str,
        :screen_name => status.user.screen_name,
        :profile_image_url => status.user.profile_image_url,
        :text => status.text,
        :created_at => status.created_at
      }
      @items.insert(item)
    end
  end
 
  client.sample do |status|
    write_to_mongolab(status)
  end
end

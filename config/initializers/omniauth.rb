Rails.application.config.middleware.use OmniAuth::Builder do
  provider :pinterest, ENV['PINTEREST_APP_ID'], ENV['PINTEREST_APP_SERCRET'], scope: "read_public write_public read_relationships write_relationships",  provider_ignores_state: true
  provider :twitter, ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET']
  provider :instagram, ENV['INSTAGRAM_APP_ID'], ENV['INSTAGRAM_APP_SERCRET'], scope: 'basic public_content comments likes'#, more permissions: 'basic public_content follower_list comments relationships likes' 
end





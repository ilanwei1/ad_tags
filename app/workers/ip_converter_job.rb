class IpConverterJob
  include Sidekiq::Worker

  def perform(ad_tag_id)
  	ad_tag = AdTag.find(ad_tag_id)
  	response = HTTParty.get("http://md5.jsontest.com/?text=#{ad_tag.ip}")
  	ad_tag.update_attribute :ip ,response['md5']
  end
end

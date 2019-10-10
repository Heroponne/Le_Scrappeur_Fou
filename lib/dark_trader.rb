require 'nokogiri'
require 'open-uri'
require 'pry'

def crypto_name_extract
  page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
  all_crypto_name = []
  all_crypto_name_class = page.xpath('//*[@class = "currency-name-container link-secondary"]')
  all_crypto_name_class.each do |crypto|
  	all_crypto_name << crypto.text
  end
  all_crypto_name
end

def crypto_value_extract
  page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
  all_crypto_value = []
  all_crypto_value_class = page.xpath('//*[@class = "price"]')
  all_crypto_value_class.each do |crypto|
  	all_crypto_value << crypto.text
  end
  all_crypto_value
end

def hash_crypto_name_value
  hash_crypto = Hash[crypto_name_extract.zip(crypto_value_extract)]
end

puts hash_crypto_name_value

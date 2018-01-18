require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_crypto_price()
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	
	prices = []

	page.xpath('//a[@class="price"]').each do |price|
		prices << price.text.gsub(' ','')

		#prices[0].gsub("\n","")
	end
	 #puts "1 bitcoin vaut : #{prices[0..10]}"
	 #sleep(5)
	 
end


def get_crypto_name()
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	
	prices = []

	page.xpath('//a[@class="currency-name-container"]').each do |price|
		prices << price.text #.gsub(' ','')

		#prices[0].gsub("\n","")
	end
	 #puts "Les crypto s'appelle : #{prices[0..10]}"
	 #sleep(5)
end


#loop { get_btc_course }
#get_btc_course


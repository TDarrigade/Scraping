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
	 return prices[0..100]
end


def get_crypto_name()
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	
	names = []

	page.xpath('//a[@class="currency-name-container"]').each do |name|
		names << name.text #.gsub(' ','')

		#prices[0].gsub("\n","")
	end
	 #puts "Les crypto s'appelle : #{prices[0..10]}"
	 
		
	 return names[0..100]
end

h = Hash[get_crypto_name.zip get_crypto_price]

puts h 
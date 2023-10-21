# gem install httpparty && gem install nokogiri
require "httparty"
require "nokogiri"

response = HTTParty.get("https://www.electronicmusicworks.com/eurorack.html", {

        headers: {                                                                                                                                          "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36"
        },
})

# parsing the HTML document returned by the server 
document = Nokogiri::HTML(response.body)

EurorackEMW = Struct.new(:url, :image, :name, :price)
html_products = document.css("li.item")

emw_products = [] 

html_products.each do |html_product| 
	url = html_product.css("a").first.attribute("href").value 
	image = html_product.css("img").first.attribute("src").value 
	name = html_product.css("h2").first.text 
	price = html_product.css("span").first.text 
	emw_product = EurorackEMW.new(url, image, name, price) 
	emw_products.push(emw_product) 
end

csv_headers = ["url", "image", "name", "price"] 
CSV.open("output.csv", "wb", write_headers: true, headers: csv_headers) do |csv| 
	emw_products.each do |emw_product| 
		csv << emw_product 
	end 
end



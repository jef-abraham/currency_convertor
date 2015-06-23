module Google
  def self.convert(from,to)
    url = URI("https://www.google.com/finance/converter?a=1&from=#{from}&to=#{to}")

    req = Net::HTTP::Get.new(url)
    res = Net::HTTP.start(url.host, url.port, :use_ssl => true) {|http|
      http.request(req)
    }

    doc = Nokogiri::HTML(res.body)
    doc.at_xpath("//div[@id='currency_converter_result']").text.strip.split('=')[1].split(' ')[0].to_f
  end
end

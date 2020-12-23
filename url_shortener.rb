# http_server.rb
require 'socket'
require 'pry'



class URLserver

  attr_accessor :urls

  def initialize(port)
    @server = TCPServer.new port
    @urls = Hash.new
  end

  def listen
    while @session = @server.accept
      @request = @session.gets
      handle_request
      @session.close
    end
  end

  def add_url(url)
    token = ""
    url.chars.each_with_index {|char, index| token += char if index % 3 == 0}
    token = token.chars.shuffle.join.gsub(/\W+/,"").slice(0,5)
    puts token
    @urls[token] = url
    "http://localhost:5678/#{token}"
  end

  private

  def render_404
    @session.print "HTTP/1.1 404\r\n"
    @session.print "\r\n"
  end

  def handle_request
    if @request.to_s.include? "POST"

      new_url = handle_url_creation
      @session.print "HTTP/1.1 200\r\n"
      @session.print "Content-Type: application/json;\r\n"
      @session.print "\r\n"
      @session.print "#{new_url}\r\n"
    elsif @request.to_s.include? "GET"
      path = @request.to_s.split[1]
      path[0] = ''
      unless path == ""
        redirect_to path
      else
        @session.print "HTTP/1.1 200\r\n"
        @session.print "Content-Type: text/html\r\n"
        @session.print "\r\n"
        @session.print %Q(

          <script>
            async function submitForm(){
              let url = document.getElementById('url');
              let response = await fetch(`/?url=${url.value}`, {method: 'post'})
              let short_url = await response.text()
              alert(short_url)
            }
          </script>

          <h1> Hello there <h1>
            <label for="fname">URL to shorten: </label><br>
            <input type="text" id="url" name="url" ><br>
            <input type="submit" value="Submit" onclick="submitForm();">
        )
      end
    end
  end

  def redirect_to(path)
    if @urls[path]
      @session.print "HTTP/1.1 301\r\n"
      @session.print "Location: #{@urls[path]}\r\n"
      @session.print "\r\n"
    else
      render_404
    end
  end

  def handle_url_creation
    url = /\/\?url=(.*?)[ &\n]/.match(@request.to_s)
    unless url.nil?
      return add_url(url[1])
    end
  end

end

url_server = URLserver.new(5678)
url_server.add_url "https://google.com"
url_server.listen

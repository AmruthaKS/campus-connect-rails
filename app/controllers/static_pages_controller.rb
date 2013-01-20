class StaticPagesController < ApplicationController
  require "net/http"
  require "uri"


  @@app_id = "197706077036694"
  @@app_secret = "821d276c9d7ab11d7c04534e600b64fc"

  def home
    #define empty micropost object helps in form construction
    @micropost = current_user.microposts.build if signed_in?
    @feed_items = current_user.feed.paginate(:page => params[:page]) if signed_in?
    #  @feed_items = current_user.feed.all
    store_location
  end

  def help

  end

  def about
  end

  def fblogin
    code = params[:code]
    if (code.nil? || code.empty?)

      #  params[:session][:state] = (0...50).map{ ('a'..'z').to_a[rand(26)] }.join
      dialog_url = "https://www.facebook.com/dialog/oauth?client_id="+@@app_id +"&redirect_uri="+URI::escape(fb_redirect_url)+ "&state=ufghgfyrd&scope=user_birthday,read_stream,email,publish_checkins,user_checkins,user_likes,user_location"
      redirect_to dialog_url
    end
  end

  def fb_redirect
    code = params[:code]
    error_code = params[:error]
    access_token=params[:access_token]
    if !code.nil? && error_code.nil? && access_token.nil?
      puts "*********** i am here bro !!!!"
      token_url = "https://graph.facebook.com/oauth/access_token?client_id="+ @@app_id+"&redirect_uri="+URI::escape(fbredirect_url)+"&client_secret="+@@app_secret+"&code="+code
      #redirect_to token_url
      #puts "********* host ===>" + URI.parse(token_url).host
      #puts "*********** path === >" + URI.parse(token_url).path
      #puts "************** query ====>" + URI.parse(token_url).query
      #  r = Net::HTTP.get_response(URI.parse(token_url).host, URI.parse(token_url).path, URI.parse(token_url).port, URI.parse(token_url).query)

      uri = URI.parse("https://graph.facebook.com")
      req = Net::HTTP::Get.new("/oauth/access_token?client_id="+ @@app_id+"&redirect_uri="+URI::escape(fbredirect_url)+"&client_secret="+@@app_secret+"&code="+code)

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      r = http.start do |http|
        http.request(req)
      end

      # r = Net::HTTP.post_form URI.parse('https://www.facebook.com/dialog/oauth'),
      #                 { "client_id" => @@app_id, "redirect_uri" => URI::escape(fb_redirect_url) , "client_secret" => @@app_secret , "code" => code}


      puts r.body.to_s

      rg = RestGraph.new(:access_token => 'myaccesstokenfromfb')


      #content = open(token_url).read
      #puts content.to_s
      #puts "*****just completed processing"
    else
      redirect_to root_path
    end
  end


end

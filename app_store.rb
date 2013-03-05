# Usage: {% app_store 593160118 %}

require 'cgi'
require 'open-uri'
require 'json'

module Jekyll

  class AppstoreTag < Liquid::Tag

    def initialize(tag_name, text, token)
      super
      @text = text
      @local_folder = File.expand_path "../.app_store", File.dirname(__FILE__)
      FileUtils.mkdir_p @local_folder
    end

    def app_store_url_with_id(app_store_id)
      "http://itunes.apple.com/lookup?id=#{app_store_id}&country=es"
    end

    def render(context)
      if parts = @text.match(/([\d]*)/)
        app_store_id = parts[1].strip
        json = get_app_local_data(app_store_id) || get_app_store_data(app_store_id)
        html_output_for(json)
      else
        ""
      end
    end

    def html_output_for(json)
      json = json['results'][0]

      name = json['trackName']
      icon = json['artworkUrl100']
      link = json['trackViewUrl']
      description = json['description']
      bundleId = json['bundleId'].strip.gsub('.', '-').downcase;

      <<-HTML
<p id='app-widget-#{bundleId}'>
  <h2><a class='#{bundleId}' href='#{link}' target='_blank'>#{name}</a></h2>
  <div>
    <img src='#{icon}' class='app-icon' style='width:100px; height:100px; vertical-align:middle; margin: 0.1em; border: 0em' />
  </div>
  <div>
    <br>
    #{description}
  </div>
</p>
      HTML
    end

    def get_app_store_data(app_store_id)
      app_store_url = app_store_url_with_id(app_store_id)
      json = open(app_store_url).read

      local_file = get_local_file(app_store_id)
      File.open(local_file, "w") do |io|
        io.write json
      end

      JSON.parse(json)
    end

    # Local Copy

    def get_app_local_data(app_store_id)
      local_file = get_local_file(app_store_id)

      json = File.read local_file if File.exist? local_file
      return nil if json.nil?

      JSON.parse(json)
    end

    def get_local_file(app_store_id)
      File.join @local_folder, "#{app_store_id}.json"
    end

  end

end

Liquid::Template.register_tag('app_store', Jekyll::AppstoreTag)

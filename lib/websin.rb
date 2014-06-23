# encoding: utf-8

require 'sinatra/base'
require 'slim'
require 'coffee'
require 'sass'

class WebSin < Sinatra::Base
  enable :sessions
  enable :logging
  
  set :show_exceptions, true

  helpers do
    def render_css_or_js _name, path
      name = File.basename(_name, '.*')
      Dir[File.join(settings.views, path, "#{name}.*")].each do |file|
        ext  = File.extname(file)
        case ext
        when '.sass', '.scss'
          return Sass.compile_file(file)
        when '.js', '.css'
          return File.read(file)
        when '.coffee'
          return CoffeeScript.compile File.read(file)
        else raise RuntimeError, "File #{File.join(path, _name)} no found!"
        end
      end
    end
  end

  get '/*' do
    ext        = File.extname(params[:captures].first).downcase
    if params[:captures].first.end_with?('/')
      path, name = params[:captures].first, 'index'
    else
      path, name = File.split(params[:captures].first)
    end
    
    case ext
    when '.css'
      content_type :css
      render_css_or_js(name, path)
    when '.js'
      content_type :js
      render_css_or_js(name, path)
    when '.png', '.jpg', '.jpeg', '.gif'
      content_type "image/#{ext[1..-1]}"
      File.read(File.join(settings.views, params[:captures]))
    when '' then slim :"#{path}/#{name[0] ? name : 'index'}"
    else
      File.read(File.join(settings.views, params[:captures]))
    end
  end
end



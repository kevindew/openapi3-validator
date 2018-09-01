# frozen_string_literal: true

require "sinatra"
require "openapi3_parser"

helpers do
  def h(text)
    Rack::Utils.escape_html(text)
  end
end

get "/" do
  erb :index
end

post "/validate" do
  openapi = Openapi3Parser.load_url(params[:url])

  if openapi.valid?
    erb :valid, locals: { openapi: openapi, params: params }
  else
    erb :invalid, locals: { openapi: openapi, params: params }
  end
rescue Openapi3Parser::Error::InaccessibleInput
  erb :index, locals: { errors: { url: "This url could not be opened" },
                        params: params }
end

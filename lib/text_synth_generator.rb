require 'uri'
require 'net/http'
require 'net/https'
require 'json'

class TextSynthGenerator
  def initialize(prompt)
    @prompt = prompt
    api_url = 'https://api.textsynth.com'

    # Copy the example file in config/text_synth_example.yml and
    # move it to config/text_synth.yml. Set your API KEY there.
    api_key = Rails.configuration.text_synth[:api_key]

    # engine to us
    api_engine = 'gptj_6B'

    uri = URI.parse("#{api_url}/v1/engines/#{api_engine}/completions")
    @http = Net::HTTP.new(uri.host, 443)
    @http.use_ssl = true
    @http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    @req = Net::HTTP::Post.new(uri.path, { 'Authorization': "Bearer #{api_key}" })
  end

  def call
    @req.body = { 'prompt': @prompt, 'max_tokens': 200 }.to_json
    res = @http.request(@req)

    JSON.parse(res.body)['text']
  end
end

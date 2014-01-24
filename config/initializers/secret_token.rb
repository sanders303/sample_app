# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
    token_file = Rails.root.join('.secret')
    if File.exist?(token_file)
        File.read(token_file).chomp
    else
        token = SecureRandom.hex(64)
        File.write(token_file, token)
        token
    end
end
SampleApp::Application.config.secret_key_base = secure_token
#SampleApp::Application.config.secret_key_base = 'adb353ce2a18cca08fd79d8e530153b88a3bb8d6b3c25a1d62255efcbea47ad45c8244a16c9c2167eb7ac280f86f060a0617f3facd150ba7080a1422224c8563'

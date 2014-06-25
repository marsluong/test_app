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
		# Use the existing token.
		File.read(token_file).chomp
	else
		# Generate a new token and store it in token_file.
		token = SecureRandom.hex(64)
	    File.write(token_file, token)
	    token
	end
end

TestApp::Application.config.secret_key_base = 'ebda21aa585469270475d64d710abebd8b1d2eb723c224c8fe4718b1360d44bdef1c44e4b531fac9ea8db65654e4cf2282f861489333e1f4a9f0bff13f5a627d'

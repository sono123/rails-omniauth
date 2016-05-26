
module Omniauth

	module Mock
		def auth_mock
			Omniauth.config.mock_auth[:twitter] = {
				'provider' => 'twitter',
				'uid' => '12345',
				'user_info' => {'name' => 'mockuser'},
				'credentials' => {'token' => 'mock_token', 'secret' => 'mock_secret'}
			}
		end
	end

	module SessionHelpers
		def signin
			visit root_path
			expect(page).to have_content("Sign In")
			auth_mock
			click_link "Sign In"
		end
	end

end

User.create!(first_name: "Example",
			 last_name: "User",
			 full_name: "Example User",
             email: "user@example.com",
             password: "secret")
Role.create!(name:"admin")
Role.create!(name:"user")
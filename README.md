# devise-api 

## getting started

Gemfile
```ruby
gem 'devise-jwt'
gem 'devise'
```

```
$ bundle installl
```

development.rb
```ruby
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```
bash
```
$ rails generate devise user
$ rails generate devise:controllers user
```

```
$ rails db:migrate
```

## connect JWT

add jwt configuration

user.rb
```ruby
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable
end
```

## Session Controller

```ruby
class SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: resource
  end

  def respond_to_on_destroy
    head :no_content
  end
end
```
This is a gem for API wrapper of Zenti.com

Usage:

- Add this gem to you gem file `gem 'zenti'`
- Run `bundle install`
- Create this file `config/initializers/zenti.rb` and put this inside: `Zenti.security_key = ENV['ZENTI_SECURITY_KEY']`
- Set up that env variable.
- Test it with this with `type=sale`:

```
method = 'post'
params = {:type=>"sale", :payment_token=>"00000000-000000-000000-000000000000", :amount=>3.0}
response = Zenti.request(method,params)
```

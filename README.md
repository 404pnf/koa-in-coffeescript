
# Requirements

1. install latest node with n
1. install latest coffeescript, currently 1.8.0
1. alias coffee with node --harmony in ~/.bash_profile
        alias coffee='node --harmony /usr/local/bin/coffee'

# Example

Because app.use expects generator function only.  We have to fake one with yield even though that doesn't make much sense.

    ``` coffeescript

    koa = require 'koa'
    app = koa()

    app.use (next) ->
      start = new Date
      yield next
      ms = new Date - start
      console.log '%s %s - %s', this.method, this.url, ms

    # ## Use an unreachable yield
    # Because app.use expects generator function only.
    # We have to fake one with yield even though that doesn't make much sense.
    app.use (n) ->
      this.body = 'Hello World' # return content to client
      yield n # won't reach here


    app.listen 3000, console.log "on port 3000"

```
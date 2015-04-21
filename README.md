
# Requirements

1. install latest node with n
1. install latest coffeescript, currently 1.9.2
1. coffee --nodejs --harmony app.coffee

# Example

Because app.use expects generator function only.  We have to fake one with yield even though that doesn't make much sense.

``` coffeescript

'use strict'

koa = require 'koa'
app = koa()
note = console.log

time_logger = (next) ->
    start = Date.now()
    yield next
    note "耗时： #{Date.now() - start} 毫秒"

method_logger = (next) ->
    yield next
    note "#{@method}: #{@url}"

slow_logger = (next) ->
    yield next
    # post something to a log server far far away
    # note ""

app.use time_logger
app.use method_logger

app.use ->
  yield return this.body = 'Hello from coffeescript on koa.'

app.listen 3000, note "at port 3000"

```

# yield in coffeescript

``` coffeescript

gen = do -> yield i for i in [1..3]
# => {}
gen.next()
# => { value: 1, done: false }
gen.next()
# => { value: 2, done: false }
# => gen.next()
{ value: 3, done: false }
# => gen.next()
{ value: [ undefined, undefined, undefined ], done: true }
# => gen.next()
{ value: undefined, done: true }
gen.next()
# => { value: undefined, done: true }

```
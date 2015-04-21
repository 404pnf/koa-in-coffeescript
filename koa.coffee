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

koa = require 'koa'
app = koa()

app.use (next) ->
  start = new Date
  yield next
  ms = new Date - start
  console.log '%s %s - %s', this.method, this.url, ms


app.use (n) ->
  this.body = 'Hello World' # retruned content to client
  yield n # won't reach here


app.listen 3000, console.log "on port 3000"
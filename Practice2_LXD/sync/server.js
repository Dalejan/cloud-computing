const http = require('http')
const fs = require('fs')
const path = require("path")

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'content-type': 'text/html' })
  fs.createReadStream(path.resolve(__dirname, './index.html')).pipe(res)
})

server.listen(process.env.PORT || 3000,"127.0.0.1",()=>{
  console.log("Server running on 3000 port")
})
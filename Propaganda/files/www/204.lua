function handle_request(env)
  uhttpd.send("Status: 307 Moved Temporarily\r\n")
  uhttpd.send("Location: http://propaganda.org/\r\n")
  uhttpd.send("Date: "..os.date("%a, %d %b %Y %H:%M:%S GMT").."\r\n")

  uhttpd.send("\r\n")
end

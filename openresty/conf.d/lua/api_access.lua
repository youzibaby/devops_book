local hd = ngx.req.get_headers()
if hd["x-bnfast-id"] ~= nil then return ngx.exit(ngx.HTTP_FORBIDDEN) end

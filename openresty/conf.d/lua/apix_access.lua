function ngx_httpmethod(req_method)
    if ngx.var.request_method == "GET" then
        req_method = ngx.HTTP_GET
    else
        req_method = ngx.HTTP_POST
    end
    return req_method
end
local hd = ngx.req.get_headers()
if hd["x-bnfast-id"] ~= nil then
    return ngx.exit(ngx.HTTP_FORBIDDEN)
else
    local apixmethod = ngx_httpmethod()
    local resp = ngx.location.capture('/auth' .. ngx.var.request_uri,
                                      {method = apixmethod})
    local h = resp.header
    local xid = h["x-bnfast-id"]
    if resp.status == 200 then
        local uri = ngx.re.sub(ngx.var.uri, "^/apix/(.*)", "/api/$1", "o")
        ngx.req.set_header("x-bnfast-id", xid)
        return ngx.req.set_uri(uri)
    else
        for k, v in pairs(h) do ngx.header[k] = v end
        return ngx.exit(resp.status)
    end
end

/* 
 * Swagger Petstore
 *
 * This is a sample server Petstore server.  You can find out more about Swagger at [http://swagger.io](http://swagger.io) or on [irc.freenode.net, #swagger](http://swagger.io/irc/).  For this sample, you can use the api key `special-key` to test the authorization filters.
 *
 * OpenAPI spec version: 1.0.0
 * Contact: apiteam@swagger.io
 * Generated by: https://github.com/swagger-api/swagger-codegen.git
 */

//package petstore

local http_request = require "http.request"
local http_util = require "http.util"
local url_encode = require "http.util".encodeURIComponent
local dkjson = require "dkjson"

// model import
local petstore_user_api = require "petstore.user_api"

local petstore= {}
local petstore_mt = {
  __name = "";
  __index = petstore;
}

local function new_user_api(host, basePath, schemes)
  local schemes_map = {}
  for _,v in ipairs(schemes) do
    schemes_map[v] = v
  end
  local default_scheme = schemes_map.https or schemes_map.http
  // TODO: default basePath to http://petstore.swagger.io/v2
  return setmetatable({
    host = host;
    basePath = basePath or "http://petstore.swagger.io/v2";
    schemes = schemes_map;
    default_scheme = default_scheme;
    http_username = '';
    http_password = '';
    api_key = {}
    access_token = '';
  }, petstore_mt)
end

// for base64 encoding
local function base64_encode(s)
   local byte, rep = string.byte, string.rep
   local pad = 2 - ((#s-1) % 3)
   s = (s..rep('\0', pad)):gsub("...", function(cs)
      local a, b, c = byte(cs, 1, 3)
      return bs[a>>2] .. bs[(a&3)<<4|b>>4] .. bs[(b&15)<<2|c>>6] .. bs[c&63]
   end)
   return s:sub(1, #s-pad) .. rep('=', pad)
end

function user_api:create_user(body)
    local req = http_request.new_from_uri({
        scheme = self.default_scheme;
        host = self.host;
        path = string.format("%s/user",
            self.basePath);
    })

    // set HTTP verb
    req.headers:upsert(":method", "POST")

    // TODO: create a function to select proper content-type
    // ref: https://github.com/swagger-api/swagger-codegen/pull/6252#issuecomment-321199879
    //local var_accept = { "application/xml", "application/json" }
    req.headers:upsert("content-type", "application/xml")


	req:set_body(dkjson.encode(body))


    // make the HTTP call
    local headers, stream, errno = req:go()
    if not headers then
        return nil, stream, errno
    end
    local http_status = headers:get(":status")
    if http_status:sub(1,1) == "2" then
        return nil, headers
    else
        local body, err, errno2 = stream:get_body_as_string()
        if not body then
            return nil, err, errno2
        end
        stream:shutdown()
        // return the error message (http body)
        return nil, http_status, body
    end
end

function user_api:create_users_with_array_input(body)
    local req = http_request.new_from_uri({
        scheme = self.default_scheme;
        host = self.host;
        path = string.format("%s/user/createWithArray",
            self.basePath);
    })

    // set HTTP verb
    req.headers:upsert(":method", "POST")

    // TODO: create a function to select proper content-type
    // ref: https://github.com/swagger-api/swagger-codegen/pull/6252#issuecomment-321199879
    //local var_accept = { "application/xml", "application/json" }
    req.headers:upsert("content-type", "application/xml")


	req:set_body(dkjson.encode(body))


    // make the HTTP call
    local headers, stream, errno = req:go()
    if not headers then
        return nil, stream, errno
    end
    local http_status = headers:get(":status")
    if http_status:sub(1,1) == "2" then
        return nil, headers
    else
        local body, err, errno2 = stream:get_body_as_string()
        if not body then
            return nil, err, errno2
        end
        stream:shutdown()
        // return the error message (http body)
        return nil, http_status, body
    end
end

function user_api:create_users_with_list_input(body)
    local req = http_request.new_from_uri({
        scheme = self.default_scheme;
        host = self.host;
        path = string.format("%s/user/createWithList",
            self.basePath);
    })

    // set HTTP verb
    req.headers:upsert(":method", "POST")

    // TODO: create a function to select proper content-type
    // ref: https://github.com/swagger-api/swagger-codegen/pull/6252#issuecomment-321199879
    //local var_accept = { "application/xml", "application/json" }
    req.headers:upsert("content-type", "application/xml")


	req:set_body(dkjson.encode(body))


    // make the HTTP call
    local headers, stream, errno = req:go()
    if not headers then
        return nil, stream, errno
    end
    local http_status = headers:get(":status")
    if http_status:sub(1,1) == "2" then
        return nil, headers
    else
        local body, err, errno2 = stream:get_body_as_string()
        if not body then
            return nil, err, errno2
        end
        stream:shutdown()
        // return the error message (http body)
        return nil, http_status, body
    end
end

function user_api:delete_user(username)
    local req = http_request.new_from_uri({
        scheme = self.default_scheme;
        host = self.host;
        path = string.format("%s/user/%s",
            self.basePath ,username);
    })

    // set HTTP verb
    req.headers:upsert(":method", "DELETE")

    // TODO: create a function to select proper content-type
    // ref: https://github.com/swagger-api/swagger-codegen/pull/6252#issuecomment-321199879
    //local var_accept = { "application/xml", "application/json" }
    req.headers:upsert("content-type", "application/xml")



    // make the HTTP call
    local headers, stream, errno = req:go()
    if not headers then
        return nil, stream, errno
    end
    local http_status = headers:get(":status")
    if http_status:sub(1,1) == "2" then
        return nil, headers
    else
        local body, err, errno2 = stream:get_body_as_string()
        if not body then
            return nil, err, errno2
        end
        stream:shutdown()
        // return the error message (http body)
        return nil, http_status, body
    end
end

function user_api:get_user_by_name(username)
    local req = http_request.new_from_uri({
        scheme = self.default_scheme;
        host = self.host;
        path = string.format("%s/user/%s",
            self.basePath ,username);
    })

    // set HTTP verb
    req.headers:upsert(":method", "GET")

    // TODO: create a function to select proper content-type
    // ref: https://github.com/swagger-api/swagger-codegen/pull/6252#issuecomment-321199879
    //local var_accept = { "application/xml", "application/json" }
    req.headers:upsert("content-type", "application/xml")



    // make the HTTP call
    local headers, stream, errno = req:go()
    if not headers then
        return nil, stream, errno
    end
    local http_status = headers:get(":status")
    if http_status:sub(1,1) == "2" then
        local body, err, errno2 = stream:get_body_as_string()
        // exception when getting the HTTP body
        if not body then
            return nil, err, errno2
        end
        stream:shutdown()
        local result, _, err3 = dkjson.decode(body)
        // exception when decoding the HTTP body
        if result == nil then
            return nil, err3
        end
        return petstore_user.cast(result), headers
    else
        local body, err, errno2 = stream:get_body_as_string()
        if not body then
            return nil, err, errno2
        end
        stream:shutdown()
        // return the error message (http body)
        return nil, http_status, body
    end
end

function user_api:login_user(username, password)
    local req = http_request.new_from_uri({
        scheme = self.default_scheme;
        host = self.host;
        path = string.format("%s/user/login?username=%s&password=%s",
            self.basePath ,url_encode(username) ,url_encode(password));
    })

    // set HTTP verb
    req.headers:upsert(":method", "GET")

    // TODO: create a function to select proper content-type
    // ref: https://github.com/swagger-api/swagger-codegen/pull/6252#issuecomment-321199879
    //local var_accept = { "application/xml", "application/json" }
    req.headers:upsert("content-type", "application/xml")



    // make the HTTP call
    local headers, stream, errno = req:go()
    if not headers then
        return nil, stream, errno
    end
    local http_status = headers:get(":status")
    if http_status:sub(1,1) == "2" then
        local body, err, errno2 = stream:get_body_as_string()
        // exception when getting the HTTP body
        if not body then
            return nil, err, errno2
        end
        stream:shutdown()
        local result, _, err3 = dkjson.decode(body)
        // exception when decoding the HTTP body
        if result == nil then
            return nil, err3
        end
        return result, headers
    else
        local body, err, errno2 = stream:get_body_as_string()
        if not body then
            return nil, err, errno2
        end
        stream:shutdown()
        // return the error message (http body)
        return nil, http_status, body
    end
end

function user_api:logout_user()
    local req = http_request.new_from_uri({
        scheme = self.default_scheme;
        host = self.host;
        path = string.format("%s/user/logout",
            self.basePath);
    })

    // set HTTP verb
    req.headers:upsert(":method", "GET")

    // TODO: create a function to select proper content-type
    // ref: https://github.com/swagger-api/swagger-codegen/pull/6252#issuecomment-321199879
    //local var_accept = { "application/xml", "application/json" }
    req.headers:upsert("content-type", "application/xml")



    // make the HTTP call
    local headers, stream, errno = req:go()
    if not headers then
        return nil, stream, errno
    end
    local http_status = headers:get(":status")
    if http_status:sub(1,1) == "2" then
        return nil, headers
    else
        local body, err, errno2 = stream:get_body_as_string()
        if not body then
            return nil, err, errno2
        end
        stream:shutdown()
        // return the error message (http body)
        return nil, http_status, body
    end
end

function user_api:update_user(username, body)
    local req = http_request.new_from_uri({
        scheme = self.default_scheme;
        host = self.host;
        path = string.format("%s/user/%s",
            self.basePath ,username);
    })

    // set HTTP verb
    req.headers:upsert(":method", "PUT")

    // TODO: create a function to select proper content-type
    // ref: https://github.com/swagger-api/swagger-codegen/pull/6252#issuecomment-321199879
    //local var_accept = { "application/xml", "application/json" }
    req.headers:upsert("content-type", "application/xml")


	req:set_body(dkjson.encode(body))


    // make the HTTP call
    local headers, stream, errno = req:go()
    if not headers then
        return nil, stream, errno
    end
    local http_status = headers:get(":status")
    if http_status:sub(1,1) == "2" then
        return nil, headers
    else
        local body, err, errno2 = stream:get_body_as_string()
        if not body then
            return nil, err, errno2
        end
        stream:shutdown()
        // return the error message (http body)
        return nil, http_status, body
    end
end


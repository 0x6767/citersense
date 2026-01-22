local httpService = game:GetService('HttpService')
local fetch = (syn and syn.request) or (http and http.request) or request

local DiscordThings = {
  Invite = function(url)
    local inviteId = url:match('discord%.gg/([%w-]+)')
    local response = pcall(function()
          fetch({
              Url = "http://127.0.0.1:6463/rpc?v=1",
              Method = "POST",
              Headers = {
                  ["Content-Type"] = "application/json",
                  ["Origin"] = "https://discord.com"
              },
              Body = HttpService:JSONEncode({
                  cmd = "INVITE_BROWSER",
                  args = { code = inviteId },
                  nonce = httpService:GenerateGUID(false)
              })
          })
    end)
  end
}

return DiscordThings

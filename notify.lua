local notify = {}

local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/clevsgm/libs/main/notif.lua", true))()

function notify:error(heading, message, timeout)
   local noti = Notification.new("error", heading, message, timeout)
   if timeout then
      noti:deleteTimeout(timeout)
   end
end

function notify:success(heading, message, timeout)
   local noti = Notification.new("success", heading, message, timeout)
   if timeout then
      noti:deleteTimeout(timeout)
   end
end

function notify:info(heading, message, timeout)
   local noti = Notification.new("info", heading, message, timeout)
   if timeout then
      noti:deleteTimeout(timeout)
   end
end

function notify:warning(heading, message, timeout)
   local noti = Notification.new("warning", heading, message, timeout)
   if timeout then
      noti:deleteTimeout(timeout)
   end
end

function notify:message(heading, message, timeout)
   local noti = Notification.new("message", heading, message, timeout)
   if timeout then
      noti:deleteTimeout(timeout)
   end
end

return notify

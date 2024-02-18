require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "android.text.InputFilter"
import "android.media.MediaPlayer"
import "layout"
import "sum"
--activity.setTitle('AndroLua+')
--activity.setTheme(android.R.style.Theme_Holo)
activity.setContentView(loadlayout(layout))

local function empty()
  key.text="  "
  keys.text="\n\n\n\n"
end
empty()

imei.setFilters{InputFilter.LengthFilter(15)}

imei.addTextChangedListener{
  onTextChanged=function(s)
    local IMEI=tostring(s)
    if #IMEI < 6 then
      empty()
     else
      local IMEI=string.sub(IMEI,-6,-1)
      local KEY1=MD5(IMEI.."C4AC")
      local KEY1=string.sub(KEY1,-6,-1)
      local KEY2=MD5(IMEI.."K217")
      local KEY2=string.sub(KEY2,-6,-1)
      local KEY3=MD5(IMEI.."577A")
      local KEY3=string.sub(KEY3,-6,-1)
      local KEY4=MD5(IMEI.."DBC5")
      local KEY4=string.sub(KEY4,-6,-1)
      key.text="\n[POSSIBLE KEYS]"
      keys.text=KEY1.."\n"..KEY2.."\n"..KEY3.."\n"..KEY4
    end
  end
}

xpcall(function()
  mediaPlayer = MediaPlayer()
  mediaPlayer.reset()
  mediaPlayer.setDataSource(activity.getLuaDir().."/vorbis.oga")
  mediaPlayer.prepare()
  mediaPlayer.setLooping(true)
  mediaPlayer.setOnPreparedListener(MediaPlayer.OnPreparedListener{
    onPrepared=function(mediaPlayer)
      mediaPlayer.start()
    end
  });
end,function() os.exit() return 0 end)

import "android.graphics.drawable.BitmapDrawable"
local menuitems = {
  {
    MenuItem,
    title = "BGM",
    icon = "aud",
    id = "music",
  },
}
function onCreateOptionsMenu(menu)
  loadmenu(menu, menuitems, optmenu, 4)
end
function onOptionsItemSelected(item)
  switch item.title
   case "BGM" then
    pcall(function()
      if mediaPlayer.isPlaying() then
        mediaPlayer.pause()
       else
        mediaPlayer.start()
      end
    end)
  end
end

function onKeyDown(code,event)
  if string.find(tostring(event),"KEYCODE_BACK") ~= nil then
    pcall(function() mediaPlayer.stop() end)
    os.exit()
    return true
  end
end



local aly={
  LinearLayout,
  orientation="vertical",
  layout_width="fill",
  layout_height="fill",
  {
    LinearLayout,
    orientation="vertical",
    layout_width="fill",
    layout_height="90%h",
    gravity="center",
    {
      TextView,
      text="DEVICE IMEI",
      layout_width="fill",
      gravity="center",
      textSize="18sp";
      textColor="#ffffff"
    },
    {
      EditText;
      id="imei";--ID
      cursorVisible=false;--隐藏光标
      inputType="number";
      --hint="提示内容";--提示内容
      singleLine="true";--文字内容一行显示
      --Error="Only Last 6 Digits Required";--设置用户输入了错误的信息时的提醒
      --MaxEms=5;--设置每行最大显示宽度为五个字符的宽度
      Hint="Full Or Last 6 Digits";--设置编辑框为空时的提示文字
      --hintTextColor="#99ffffff";--提示文字颜色
      gravity="center",
      --backgroundColor="#009688";--输入框背景色
    },
    {
      TextView,
      text="",
      layout_width="fill",
      gravity="center",
      textSize="16sp";
      id="key";
      textColor="#f1ffffff"
    },
    {
      TextView,
      text="",
      layout_width="fill",
      gravity="center",
      textColor="#99ffffff";
      textSize="15sp";
      id="keys";
    },
  },
  {
    TextView,
    text="made with ❤ by specter",
    layout_width="fill",
    gravity="center",
    id="copyright";
  },
}
return (function()
  if MediaPlayer then
    return aly
   else
    return "made with ❤ by specter"
  end
end)()
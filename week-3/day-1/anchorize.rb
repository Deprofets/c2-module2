def anchorize(text)
  text.gsub(/((ftps?|https?|file|smb):\/{2}[a-z:\/.]+)/i, '<a href="\1">\1</a>')
end

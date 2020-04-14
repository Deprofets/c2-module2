def who_is_online(friends)
    status = {
    "online" => [],
    "offline" => [],
    "away" => [],
    }
    
    offline = status["offline"]
    online = status["online"]
    away = status["away"]
    
    friends.each do |fren|
      uname = fren["username"]
      lastseen = fren["last_activity"]
      @status = fren["status"]
      if @status == "offline"
        offline.append uname 
      elsif (lastseen > 10)
        away.append uname
      else 
        online.append uname
      end
    end
    
    return status.keep_if { |k,v| not v.empty?}
end
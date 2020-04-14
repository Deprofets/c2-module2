def exec_time(proc)
    # your code here
    start = Time.now
    proc.call
    Time.now - start
end
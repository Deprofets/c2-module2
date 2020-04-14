def sum *arr
    arr.inject(0) {|a,x| a+x}
end
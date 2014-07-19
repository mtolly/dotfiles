# Red interactive Ruby prompt.
IRB.conf[:PROMPT][:RED] = {}
IRB.conf[:PROMPT][:DEFAULT].each_pair do |k, v|
  if k == :RETURN
    # Don't color return value
    IRB.conf[:PROMPT][:RED][k] = v
  else
    IRB.conf[:PROMPT][:RED][k] = "\e[31m#{v}\e[m"
  end
end
IRB.conf[:PROMPT_MODE] = :RED

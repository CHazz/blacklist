adservers=newDS()

function preresolve(dq)
	if(not adservers:check(dq.qname)) then
		return false
	end
	
	if(dq.qtype == pdns.A) then
		dq:addAnswer(dq.qtype, "127.0.0.1")
	elseif(dq.qtype == pdns.AAAA) then
		dq:addAnswer(dq.qtype, "::1")
	end
	return true
end

adservers:add(dofile("/etc/powerdns/blocklist.lua"))


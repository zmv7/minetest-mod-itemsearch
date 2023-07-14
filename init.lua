minetest.register_chatcommand("isearch",{
  description = "Search items using RegExp",
  params = "<pattern>",
  privs = {give=true},
  func = function(name,param)
	local out = {}
	for item,def in pairs(minetest.registered_items) do
		local descr = ItemStack(item):get_short_description()
		if item:match(param) or (descr and descr:match(param)) then
			table.insert(out, item..(descr and descr ~= item and " ("..descr..")" or ""))
		end
	end
	return true, table.concat(out, " \n")
end})

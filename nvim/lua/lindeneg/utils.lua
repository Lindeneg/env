OS_NAME = {
    WINDOWS = "Windows",
    UNIX = "Unix/Linux",
    UNKNOWN = "GetFucked"
}

-- no support in lua to get the current arch
-- so we utilize the fact that MS in their infinite 
-- wisdom decided to use the universially accepted
-- symbol for escape, \, as their path seperator.
function GetOS()
    local sep = package.config:sub(1,1)
    if sep == '/' then
        return OS_NAME.UNIX
    elseif sep == '\\' then
        return OS_NAME.WINDOWS
    else
        return OS_NAME.UNKNOWN
    end
end


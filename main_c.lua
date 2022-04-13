coronastar = DxTexture("fx/coronastar.png", "dxt3", true, "clamp")
function load2dFX() 
    local f = fileOpen("2dfx.ide")
    local str = fileRead(f,fileGetSize(f))
    fileClose(f)
    Lines = split(str,'\n' )
	local count = 0
    local readFlag = false
    for i=1,#Lines do
        if string.match(Lines[i],"end") then 
            readFlag = false
        end
        if readFlag then
            local p = split(Lines[i],",")
            local r,g,b,a,x,y,z,size,type,dist,searchlight = unpack(p)
            --createLight (0,x, y,z,size,r,g,b)
            --CMat3DCor:create( coronastar,Vector3(x,y,z),size, Vector3(r,g,b) )
            createMarker(x,y,z,"corona",size,r,g,b,a)
            count = count + 1
        end
        if string.match(Lines[i],"2dfx") then 
            readFlag = true
        end
    end

    print("End, total loaded "..count.." 2dfx.")
end

addEventHandler( "onClientResourceStart",resourceRoot,
    function ()
        load2dFX() 
    end
);

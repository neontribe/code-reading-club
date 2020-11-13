-- Created by IntelliJ IDEA.
-- User: henry
-- Date: 12/11/2020
-- Time: 19:57
-- To change this template use File | Settings | File Templates.
-- Made by following this tutorial https://www.infinitelimit.net/article/tic-80-snake
-- script: lua
-- title: Snakey
-- author: @trelemar
-- palette: 1516184424340059ff4e4a4e854c30346524d9213f7571613898ecd27d2c8595a16daa2cd2aa996dc2cadad45edeeed6

dirs={
    [0]={x= 0,y=-1},
    [1]={x= 0,y= 1},
    [2]={x=-1,y= 0},
    [3]={x= 1,y= 0}
}

function init()
    time=0
    count=0
    body={
        {x=15,y=8},
        {x=14,y=8},
        {x=13,y=8}
    }
    target={x=0,y=0}
    dir=dirs[0]
end

function update()
    return time%5==0
end

function setTarget()
    target.x=math.random(0,29)
    target.y=math.random(0,16)
    for i,v in pairs(body) do
        if v.x==target.x and v.y==target.y then
            setTarget()
        end
    end
end

function hitTarget()
    if head.x==target.x and head.y==target.y then
        return true
    end
end

function draw()
    cls(2)
    for i,v in pairs(body) do
        rect(v.x*8,v.y*8,8,8,15)
    end
    rect(target.x*8,target.y*8,8,8,6)
end

init()
setTarget()

function TIC()
    time=time+1
    head = body[#body]
    join = body[#body-1]
    tail = body[1]
    if update() then
        for i,v in pairs(body) do
            if i~=#body and v.x==head.x and v.y==head.y then
                trace("Total: "..count)
                exit()
            end
        end
        table.insert(body, #body+1, {
            x=(head.x+dir.x) % 30,
            y=(head.y+dir.y) % 17
        })
        if not hitTarget() then
            table.remove(body,1)
        else
            setTarget()
            count=count+1
        end
    end
    local last_dir=dir
    if btn(0) then dir=dirs[0]
    elseif btn(1) then dir=dirs[1]
    elseif btn(2) then dir=dirs[2]
    elseif btn(3) then dir=dirs[3]
    end

    if head.x+dir.x==join.x and head.y+dir.y==join.y then
        dir=last_dir
    end
    draw()
end
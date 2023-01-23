player_1 = {
    Rell = "fill",
    PosX = 10,
    PosY = 200,
    AnchX = 20,
    AnchY = 80,
    Speed = 100,
}

player_2 = {
    Rell = "fill",
    PosX = 770,
    PosY = 200,
    AnchX = 20,
    AnchY = 80,
    Speed = 100,
}

ball = {
    Rell = "fill",
    PosX = love.window.getWidth() / 2,
    PosY = love.window.getHeight() / 2,
    Radio = 10,
}

function love.load()

end

function love.update(dt)
    if (love.keyboard.isDown('w')) then
        player_1.PosY = player_1.PosY - (player_1.Speed * dt)
    elseif (love.keyboard.isDown('s')) then
        player_1.PosY = player_1.PosY + (player_1.Speed * dt)
    end

    if (love.keyboard.isDown('up')) then
        player_2.PosY = player_2.PosY - (player_2.Speed * dt)
    elseif (love.keyboard.isDown('down')) then
        player_2.PosY = player_2.PosY + (player_2.Speed * dt)
    end
end

function love.draw()
    -- Los parametros son ("Esta rellenado", PosX, PosY, AncX, AncY)
    love.graphics.rectangle(
        player_1.Rell,
        player_1.PosX,
        player_1.PosY,
        player_1.AnchX,
        player_1.AnchY
    );

    love.graphics.rectangle(
        player_2.Rell,
        player_2.PosX,
        player_2.PosY,
        player_2.AnchX,
        player_2.AnchY
    );

    love.graphics.circle(
        ball.Rell,
        ball.PosX,
        ball.PosY,
        ball.Radio
    )

    love.graphics.circle(
        "fill",
        10,
        10,
        10
    )
end
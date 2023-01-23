WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720
SPEED = 150

PLAYERS = {
    ONE = {
        mode = "fill",
        x = WINDOW_WIDTH - 30,
        y = WINDOW_HEIGHT / 2 + 10,
        width = 20,
        height = 100,
        speed = SPEED
    },

    TWO = {
        mode = "fill",
        x = WINDOW_WIDTH - WINDOW_WIDTH + 10,
        y = WINDOW_HEIGHT / 2 + 10,
        width = 20,
        height = 100,
        speed = SPEED
    }
}

BALL = {
    mode = "fill",
    radio = 20,
    right_left = false,
    up_down = false,
    speed = 5,
    x = WINDOW_WIDTH / 2,
    y = WINDOW_HEIGHT / 2
}

function love.load()
    love.window.setTitle("Pong")
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

end

function love.update(dt)
    -- Para movimientos del jugador izquierdo
    if love.keyboard.isDown('w') and (PLAYERS.TWO.y + PLAYERS.TWO.height) <= love.graphics.getHeight() then
        PLAYERS.TWO.y = PLAYERS.TWO.y - (PLAYERS.TWO.speed * dt)
    elseif (love.keyboard.isDown('s')) then
        PLAYERS.TWO.y = PLAYERS.TWO.y + (PLAYERS.TWO.speed * dt)
    end

    -- Para los movimientos del jugador derecho
    if love.keyboard.isDown('up') and PLAYERS.ONE.y >= 0 then
        PLAYERS.ONE.y = PLAYERS.ONE.y - (PLAYERS.ONE.speed * dt)
    elseif (love.keyboard.isDown('down')) then
        PLAYERS.ONE.y = PLAYERS.ONE.y + (PLAYERS.ONE.speed * dt)
    end
    
    -- Para el movimiento de la pelota
    if (BALL.right_left) then
        BALL.x = BALL.x + BALL.speed
    else
        BALL.x = BALL.x - BALL.speed
    end
    if (BALL.up_down) then
        BALL.y = BALL.y - BALL.speed
    else
        BALL.y = BALL.y + BALL.speed
    end

    -- Para el rebote de la pelota
    if (BALL.x + BALL.radio) >= WINDOW_WIDTH then
        BALL.right_left = false;
    end
    if (BALL.x + BALL.radio) <= 0 then
        BALL.right_left = true;
    end
    if (BALL.y + BALL.radio) >= WINDOW_HEIGHT then
        BALL.up_down = true;
    end
    if (BALL.y + BALL.radio) <= 0 then
        BALL.up_down = false;
    end
end

function love.draw()
    -- Los parametros son ("Esta rellenado", PosX, PosY, AncX, AncY)
    love.graphics.rectangle(
        PLAYERS.ONE.mode,
        PLAYERS.ONE.x,
        PLAYERS.ONE.y,
        PLAYERS.ONE.width,
        PLAYERS.ONE.height
    );

    love.graphics.rectangle(
        PLAYERS.TWO.mode,
        PLAYERS.TWO.x,
        PLAYERS.TWO.y,
        PLAYERS.TWO.width,
        PLAYERS.TWO.height
    );

    love.graphics.circle(
        BALL.mode,
        BALL.x,
        BALL.y,
        BALL.radio
    )
end
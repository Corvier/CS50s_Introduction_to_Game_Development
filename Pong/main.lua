WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720
SPEED = 60

PLAYERS = {
    ONE = {
        mode = "fill",
        x = WINDOW_WIDTH - 30,
        y = WINDOW_HEIGHT / 2,
        width = 20,
        height = 100,
        speed = SPEED
    },

    TWO = {
        mode = "fill",
        x = WINDOW_WIDTH - WINDOW_WIDTH + 10,
        y = WINDOW_HEIGHT / 2,
        width = 20,
        height = 100,
        speed = SPEED
    }
}

BALL = {
    Rell = "fill",
    Radio = 10
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
    if (love.keyboard.isDown('w') and PLAYERS.ONE.y >= 0 ) then
        PLAYERS.ONE.y = PLAYERS.ONE.y - (PLAYERS.ONE.speed * dt)
    elseif (love.keyboard.isDown('s')) then
        PLAYERS.ONE.y = PLAYERS.ONE.y + (PLAYERS.ONE.speed * dt)
    end
    
    if (love.keyboard.isDown('up') and (PLAYERS.TWO.y + PLAYERS.TWO.height) <= love.graphics.getHeight() ) then
        PLAYERS.TWO.y = PLAYERS.TWO.y - (PLAYERS.TWO.speed * dt)
    elseif (love.keyboard.isDown('down')) then
        PLAYERS.TWO.y = PLAYERS.TWO.y + (PLAYERS.TWO.speed * dt)
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
        "fill",
        10,
        10,
        10
    )
end
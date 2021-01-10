return function ()
    
    local App = require('weblit-app')

    App.bind({
        host = "0.0.0.0",
        port = 8080
    })

    App.use(require('weblit-logger'))
    App.use(require('weblit-auto-headers'))
    App.use(require('weblit-etag-cache'))

    App.route({method = "GET", path = "/invite"}, function (req, res, go)
        res.code = 200
        res.body = "<meta http-equiv=\"refresh\" content=\"0; url=\'https://discord.gg/JjDEPCvj7z\'\" />"
        res.headers["Content-Type"] = "text/html"
    end)

    App.start()

end
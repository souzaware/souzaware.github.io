package main

import "core:fmt"
import "core:log"
import "core:os"
import mustache "./vendor/odin-mustache"

Data :: struct {
    social: []struct {
        site: string,
        page: string,
        icon_url: string,
        url: string,
    }
}

main :: proc() {
    data := Data{
        social = {
            {
                site = "GitHub",
                page = "souzaware",
                icon_url = "res/icons/github.png",
                url = "https://github.com/souzaware/",
            },
            {
                site = "Twitch",
                page = "neraid_live",
                icon_url = "res/icons/twitch.png",
                url = "https://twitch.tv/neraid_live",
            },
            {
                site = "YouTube",
                page = "neraid",
                icon_url = "res/icons/youtube.png",
                url = "https://youtube.com/@neraid",
            },
            {
                site = "StreamLabs",
                page = "neraids",
                icon_url = "res/icons/streamlabs.png",
                url = "https://streamlabs.com/neraids/tip",
            },
            {
                site = "Patreon",
                page = "neraids",
                icon_url = "res/icons/patreon.png",
                url = "https://www.patreon.com/c/neraids",
            },
        }
    }

    os.make_directory("static")
    os.make_directory("static/res")
    os.copy_directory_all("static/res", "res/")

    s, err := mustache.render_from_filename("res/templates/index.html", data)

    if err != nil {
        log.error(err)
        return
    }

    write_err := os.write_entire_file("static/index.html", transmute([]u8)s)

    if write_err != nil {
        fmt.println(err)
    }
}

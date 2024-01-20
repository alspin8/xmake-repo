---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by alspin.
--- DateTime: 20/01/2024 10:36
---

package("orion")
    set_description("The orion package")
    set_homepage("https://github.com/alspin8/Orion")
    set_license("MIT")

    add_urls("https://github.com/alspin8/Orion.git")

    add_versions("1.0a1", "4cffd97e9a2fbef40d3bc58a3183c74bc68ee811")

    --on_fetch(function (package)
    --    local result = {}
    --    result.links = "orion"
    --    result.linkdirs = package:installdir("lib")
    --    result.includedirs = package:installdir("include")
    --    return result
    --end)

    on_install(function (package)
        local configs = {}
        if package:config("shared") then
            configs.kind = "shared"
        end

        --os.cp(path.join(os.scriptdir(), "include"), package:installdir())

        import("package.tools.autoconf").install(package, configs)
    end)
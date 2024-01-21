---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by alspin.
--- DateTime: 21/01/2024 13:34
---

local function create_resource_rule(name)
    rule("resource." .. name)
        on_config(function (target)
            import("core.project.project")

            local orion = project.required_package("orion")
            local orionresourcedir
            if orion then
                orionresourcedir = path.join(orion:installdir(), "resource")
            end

            os.cp(orionresourcedir .. "/" .. name .. "/*", "$(buildir)/$(plat)/$(arch)/$(mode)/resource/" .. name .. "/")
        end)
end

create_resource_rule("shader")
create_resource_rule("texture")
create_resource_rule("model")

rule("resource")
    add_deps("@resource.shader", "@resource.texture", "@resource.model")
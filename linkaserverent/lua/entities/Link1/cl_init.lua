include('shared.lua')  -- Incluye el archivo compartido | Include the shared file

local MAX_USE_DISTANCE = 50  -- Define la distancia máxima para interactuar con la entidad | Define the maximum distance to interact with the entity

hook.Add("PlayerButtonDown", "OpenURLOnEPress", function(ply, button)
    if button == KEY_E then
        -- Trazar un rayo desde el jugador | Trace a ray from the player
        local tr = util.GetPlayerTrace(ply)
        local trace = util.TraceLine(tr)
        
        -- Verificar si el rayo golpeó algo, si es una entidad válida y si es la entidad específica | Check if the ray hit something, if it's a valid entity, and if it's the specific entity
        if trace.Hit and IsValid(trace.Entity) and trace.Entity:GetClass() == "nombre_de_tu_entidad" then
            -- Calcular la distancia entre el jugador y la entidad | Calculate the distance between the player and the entity
            local distance = ply:GetPos():Distance(trace.Entity:GetPos())
            if distance <= MAX_USE_DISTANCE then
                -- Abrir la URL si la distancia es menor o igual a la distancia máxima permitida | Open the URL if the distance is less than or equal to the maximum allowed distance
                gui.OpenURL("https://steam://connect/IP_ADRESS:PORT")
            end
        end
    end
end)
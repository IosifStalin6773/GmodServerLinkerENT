AddCSLuaFile("cl_init.lua")  -- Carga el archivo del cliente | Load the client file
AddCSLuaFile("shared.lua")   -- Carga el archivo compartido | Load the shared file

include('shared.lua')        -- Incluye el archivo compartido | Include the shared file

function ENT:Initialize()
    -- Establece el modelo de la entidad | Set the model of the entity
    self.Entity:SetModel("models/props_doors/door03_slotted_left.mdl")

    -- Inicializa la física de la entidad | Initialize the physics of the entity
    self.Entity:PhysicsInit(SOLID_VPHYSICS)

    -- Establece el tipo de movimiento de la entidad | Set the movement type of the entity
    self.Entity:SetMoveType(MOVETYPE_NONE)

    -- Establece la solidez de la entidad | Set the solidity of the entity
    self.Entity:SetSolid(SOLID_VPHYSICS)

    -- Establece el grupo de colisión de la entidad | Set the collision group of the entity
    self.Entity:SetCollisionGroup(COLLISION_GROUP_NONE)

    -- Activa el disparador para la entidad | Enable the trigger for the entity
    self:SetTrigger(true)

    -- Obtiene el objeto de física de la entidad | Get the physics object of the entity
    local phys = self.Entity:GetPhysicsObject()
    if (phys:IsValid()) then
        phys:Wake()  -- Despierta el objeto de física | Wake up the physics object
    end

    -- Establece valores aleatorios para las variables de rotación | Set random values for the rotation variables
    self:SetDTFloat(0, math.Rand(0.5, 1.3))
    self:SetDTFloat(1, math.Rand(0.3, 1.2))
end

function ENT:SetupDataTables()
    -- Define variables de red para rotación | Define network variables for rotation
    self:DTVar("Float", 0, "RotationSeed1")
    self:DTVar("Float", 1, "RotationSeed2")
end

function ENT:OnTakeDamage(dmginfo)
    -- Maneja el daño físico a la entidad | Handle physical damage to the entity
    self.Entity:TakePhysicsDamage(dmginfo)
end

function ENT:StartTouch(otherEnt)
    if otherEnt:IsPlayer() then
        -- Marca al jugador que puede abrir la URL | Mark the player that they can open the URL
        otherEnt:SetNWBool("CanOpenURL", true)
    end
end

function ENT:EndTouch(otherEnt)
    if otherEnt:IsPlayer() then
        -- Marca al jugador que ya no puede abrir la URL | Mark the player that they can no longer open the URL
        otherEnt:SetNWBool("CanOpenURL", false)
    end
end
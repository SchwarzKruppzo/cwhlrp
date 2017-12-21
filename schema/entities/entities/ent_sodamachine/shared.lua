--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

ENT.Type = "anim";
ENT.PrintName = "Soda Machine";
ENT.Author = "Schwarz Kruppzo";
ENT.Category = "HL1 RP";
ENT.Spawnable = true;
ENT.AdminOnly = true;
ENT.PhysgunDisable = true;
ENT.PhysgunAllowAdmin = true;
ENT.RenderGroup	= RENDERGROUP_BOTH;

function ENT:SpawnFunction(client, trace)
	local entity = ents.Create("ent_sodamachine");
	entity:SetPos(trace.HitPos);

	local angles = (entity:GetPos() - client:GetPos()):Angle();
	angles.p = 0;
	angles.y = angles.y + 90;
	angles.r = 0;

	entity:SetAngles(angles);
	entity:Spawn();
	entity:Activate();

	return entity;
end;

function ENT:GetNearestButton(client)
	client = client or (CLIENT and LocalPlayer());

	if (self.Buttons) then
		local position = self:GetPos();
		local f, r, u = self:GetForward() * -24.4, self:GetRight() * -16.6, self:GetUp() * 53.09;
		local start = client:GetShootPos();
		local dir = client:GetAimVector() * 96;

		for k, v in pairs(self.Buttons) do
			local pos = position + f + r + u + self:GetUp() * -(2 * (k - 1));
			local hit = util.IntersectRayWithOBB(start, dir, pos, Angle(), Vector(-1,-1,-1), Vector(1,1,1));
			if hit then
				return k;
			end;
		end;
	end;
end;

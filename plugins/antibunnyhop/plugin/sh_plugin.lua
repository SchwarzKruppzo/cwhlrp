--[[
	HL1 RP was developed by Schwarz Kruppzo, if you
    have any questions, please send a message to
    http://steamcommunity.com/id/schwarzkruppzo/.
--]]

local PLUGIN = PLUGIN;
local Clockwork = Clockwork;

STAMINA_MAX = 100.0;
STAMINA_COST_JUMP = 25.0;
STAMINA_COST_FALL = 20.0;
STAMINA_RECOVER_RATE = 19.0;

function PLUGIN:PlayerBindPress(ply, bind, pressed)
	if (string.find(bind, "+walk")) then
		if (!IsValid(ply:GetVehicle())) then
			return true;
		end;
	end;
end;

function PLUGIN:ReduceTimers(ply)
	local jumpStamina = ply:GetNWFloat("jumpstamina");

	if !jumpStamina then
		ply:SetNWFloat("jumpstamina", 0) ;
	end;

	local frame_msec = 1000.0 * FrameTime();

	if (jumpStamina > 0) then
		ply:SetNWFloat("jumpstamina", jumpStamina - frame_msec);

		if (jumpStamina < 0) then
			ply:SetNWFloat("jumpstamina", 0);
		end
	end
end
function PLUGIN:CheckJump(ply, mv, velocity)
	if (!ply:Alive()) then
		local buttons = bit.bor(mv:GetOldButtons(), IN_JUMP);
		mv:SetOldButtons(buttons);

		return;
	end;

	if (ply:WaterLevel() >= 2) then
		return;
	end;

	if (ply:GetGroundEntity() == nil) then
		local buttons = bit.bor(mv:GetOldButtons(), IN_JUMP);
		mv:SetOldButtons(buttons);

		return;
	end;

	if (bit.band(mv:GetOldButtons(), IN_JUMP) != 0) then
		return;
	end;

	local jumpStamina = ply:GetNWFloat("jumpstamina");

	if (jumpStamina > 0) then
		local flRatio = (STAMINA_MAX - ((jumpStamina / 1000.0) * STAMINA_RECOVER_RATE))/STAMINA_MAX;
		velocity.z = velocity.z * flRatio;
	end;

	ply:SetNWFloat("jumpstamina", (STAMINA_COST_JUMP/STAMINA_RECOVER_RATE) * 1000.0);

	return true;
end;

function PLUGIN:SetupMove(ply, mv, cmd)
	self:ReduceTimers(ply);

	local velocity = mv:GetVelocity();

	if (bit.band(mv:GetButtons(), IN_JUMP) != 0) then
		self:CheckJump(ply, mv, velocity);
	else
		local buttons = bit.band(mv:GetOldButtons(), bit.bnot(IN_JUMP));
		mv:SetOldButtons(buttons);
	end;

	local jumpStamina = ply:GetNWFloat("jumpstamina");

	if (jumpStamina > 0 and ply:IsOnGround()) then
		local flRatio = (STAMINA_MAX - ((jumpStamina/1000.0) * STAMINA_RECOVER_RATE))/STAMINA_MAX;
		local flReferenceFrametime = 1.0 / 70.0;
		local flFrametimeRatio = FrameTime() / flReferenceFrametime;

		flRatio = math.pow(flRatio, flFrametimeRatio);

		velocity.x = velocity.x * flRatio;
		velocity.y = velocity.y * flRatio;
	end

	mv:SetVelocity(velocity);
end;

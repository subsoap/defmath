-- This module has many useful math functions and shortcuts

local M = {}

-- Angle-Diff (gets the smallest angle between two angles, using radians)
function M.anglediff_rad(rad1, rad2)
	local a = rad1 - rad2
	a = (a + math.pi) % (math.pi * 2) - math.pi
	return a
end

-- Angle-Diff (gets the smallest angle between two angles, using degrees)
function M.anglediff_deg(deg1, deg2)
	local a = deg1 - deg2
	a = (a + 180) % (180 * 2) - 180
	return a
end

-- Round
function M.round(x)
	local a = x % 1
	x = x - a
	if a < 0.5 then a = 0
	else a = 1 end
	return x + a
end

-- Round to decimal point
function M.round_decimal(number, decimal)
	decimal = 10 ^ (decimal or 0)
	return math.floor(number*decimal+0.5)/decimal
end

-- Clamp
function M.clamp(x, min, max)
	if x > max then x = max
	elseif x < min then x = min
	end
	return x
end

--Sign
function M.sign(x)
	if x >= 0 then return 1
	else return -1
	end
end

-- Vect to Quat
function M.vect_to_quat(vect)
	return vmath.quat_rotation_z(math.atan2(vect.y, vect.x))
end

-- Vect to Quat + 90 degrees (perpendicular)
function M.vect_to_quat90(vect)
	return vmath.quat_rotation_z(math.atan2(vect.y, vect.x) + math.pi/2)
end

-- Random float from -1 to 1
function M.rand11()
	return((math.random() - 0.5) * 2)
end

-- Random float in range
function M.rand_range(min, max)
	return math.random() * (max - min) + min
end

-- Linear interpolation
function M.lerp(start, stop, amount)
	amount = M.clamp(amount, 0, 1)
	return((1-amount) * start + amount * stop)	
end

-- Distance between two 2d points
function M.dist2d(x1, y1, x2, y2)
	return ((x2-x1)^2+(y2-y1)^2)^0.5
end

-- Distance betwen two 3d points
function M.dist3d(x1, y1, z1, x2, y2, z2)
	return ((x2-x1)^2+(y2-y1)^2+(z2-z1)^2)^0.5
end

-- Angle in radians of vector between two points
function M.angle_of_vector_between_two_points(x1,y1, x2,y2) 
	return math.atan2(y2-y1, x2-x1) 
end

-- Clears bad RNG and sets seed to be based on OS time
function M.setup_rng()
	math.randomseed(os.time() + math.random())
	math.random(); math.random(); math.random() -- clear bad rng	
end

-- Check if number is within range
function M.is_within_range(number, min, max)
	return number >= min and number <= max
end



return M

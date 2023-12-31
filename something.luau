-- 2D Image Creator class

local Create2D = {}
Create2D.__index = Create2D

-- 2D image constructor
function Create2D.new(imageName: string, imageID: number, ImageSizeX: number, ImageSizeY: number, BeamWidth0: number, BeamWidth1: number)
	-- Class declaration
	local self = setmetatable({}, Create2D)
	
	-- Setup
	self.Model = Instance.new("Model")
	self.Part1 = Instance.new("Part"); self.Part1.Name = "Part1"
	self.Part2 = Instance.new("Part"); self.Part2.Name = "Part2"
	self.Attachment1 = Instance.new("Attachment"); self.Attachment1.Parent = self.Part1; self.Attachment1.Name = "Attachment1"
	self.Attachment2 = Instance.new("Attachment"); self.Attachment2.Parent = self.Part2; self.Attachment2.Name = "Attachment2"
	self.Beam = Instance.new("Beam"); self.Beam.Parent = self.Part1 or self.Part2 -- Beam can be in either part, doesn't matter
	
	-- Model/Part Properties 
	self.Model.Parent = workspace
	self.Part1.Parent = self.Model
	self.Part2.Parent = self.Model
	self.Model.Name =  imageName
	self.Part1.Anchored = true
	self.Part2.Anchored = true
	self.Part1.Transparency = 1
	self.Part2.Transparency = 1
	self.Part1.CanCollide = false
	self.Part2.CanCollide = false
	
	-- Beam Properties
	self.Beam.Width0 = BeamWidth0
	self.Beam.Width1 =  BeamWidth1
	

	-- Set the size of the parts to fit the image
	self.Part1.Size = Vector3.new(4, 1, 2)
	self.Part2.Size = Vector3.new(4, 1, 2)
	
	-- Set the model's position to zero-point
	self.Model.PrimaryPart = self.Beam.Parent
	self.Model:SetPrimaryPartCFrame(CFrame.new(Vector3.new(0, 0, 0)))
	
	-- Set the position of Part1 directly above Part2 with a distance relative to the size of the image (I hope)
	self.Part1.Position = Vector3.new(0, ImageSizeX + (ImageSizeY / 3), 0)
	self.Part2.Position = Vector3.new(0, ImageSizeY + (-ImageSizeX / 3) , 0)

	
	-- More Beam Properties
	self.Beam.Transparency = NumberSequence.new(0, 0)
	self.Beam.Attachment0 = self.Attachment1
	self.Beam.Attachment1 = self.Attachment2
	self.Beam.Texture = "rbxassetid://"..tostring(imageID)
	self.Beam.LightInfluence = 1
	self.Beam.TextureSpeed = 0.1
	self.Beam.FaceCamera = true
	self.Beam.TextureLength = 1
	
	return self
end


return Create2D

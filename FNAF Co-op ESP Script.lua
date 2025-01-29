local function createESP(model)
    if model:IsA("Model") then
        
        if not model.PrimaryPart then
            print("No PrimaryPart found for: " .. model.Name .. ". Attempting to set one...")
           
            for _, child in ipairs(model:GetDescendants()) do
                if child:IsA("BasePart") then
                    model.PrimaryPart = child
                    break
                end
            end

            if not model.PrimaryPart then
                warn("Failed to set PrimaryPart for: " .. model.Name .. ". Skipping.")
                return
            end
        end

        
        local highlight = Instance.new("Highlight")
        highlight.Adornee = model
        highlight.Parent = game:GetService("CoreGui")
        highlight.FillColor = Color3.fromRGB(255, 0, 0)
        highlight.OutlineColor = Color3.fromRGB(0, 0, 0)
        highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    end
end


local function findAndApplyESP(folder)
    if folder:IsA("Folder") then
        for _, child in pairs(folder:GetChildren()) do
            if child:IsA("Model") then
      
                createESP(child)
                return
            end
        end
    end
end


local animatronicsFolder = workspace:FindFirstChild("Animatronics")

if animatronicsFolder and animatronicsFolder:IsA("Folder") then

    for _, animatronicFolder in pairs(animatronicsFolder:GetChildren()) do
        findAndApplyESP(animatronicFolder)
    end
else
    warn("Animatronics folder not found in workspace.")
end

-- Test script to reproduce potential salary issues
local function testSalaryCalculation(charIdentifier)
    print("Testing salary calculation for charIdentifier:", charIdentifier)
    -- Simulation of the query in server/server.lua
    local allRows = MySQL.query.await("SELECT * FROM bank_users WHERE charidentifier = ?", {charIdentifier})
    
    local totalSalary = 0
    if allRows then
        for _, row in ipairs(allRows) do
            local unpaidSalary = row.unpaid_salary or 0
            if unpaidSalary > 0 then
                totalSalary = totalSalary + unpaidSalary
                print("Found unpaid salary in row:", row.name, "=", unpaidSalary)
            end
        end
    end
    print("Total salary found:", totalSalary)
    return totalSalary
end

-- Run test
-- Replace with a known character identifier from your DB if you want to test
local charIdentifier = "12345678" -- Example
testSalaryCalculation(charIdentifier)

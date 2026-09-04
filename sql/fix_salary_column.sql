-- 1. Ensure the column exists
ALTER TABLE `bank_users` ADD COLUMN IF NOT EXISTS `unpaid_salary` DOUBLE(22,2) DEFAULT 0.00 NOT NULL;

-- 2. Update any existing NULL values to 0 to prevent errors
UPDATE `bank_users` SET `unpaid_salary` = 0 WHERE `unpaid_salary` IS NULL;

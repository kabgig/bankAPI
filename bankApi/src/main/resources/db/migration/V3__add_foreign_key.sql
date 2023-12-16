-- Add a foreign key constraint to reference user_balance.id from transaction.user_id
ALTER TABLE transaction
ADD CONSTRAINT fk_user_balance
FOREIGN KEY (user_id)
REFERENCES user_balance(id);

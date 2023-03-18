-----------------------------------------------------------------------------------------------------
-- Learn more: https://docs.sqlc.dev/en/latest/howto/insert.html#returning-columns-from-inserted-rows
-----------------------------------------------------------------------------------------------------
-- name: CreateAccount :one
INSERT INTO accounts (
  owner, balance, currency
) VALUES (
  $1, $2, $3
)
RETURNING *;

--------------------------------------------------------------------------------
-- Learn more: https://docs.sqlc.dev/en/latest/howto/select.html#retrieving-rows
--------------------------------------------------------------------------------
-- name: GetAccount :one
SELECT * FROM accounts
WHERE id = $1 LIMIT 1;

--------------------------------------------------------------------------------
-- Learn more: https://docs.sqlc.dev/en/latest/howto/select.html#retrieving-rows
--------------------------------------------------------------------------------
-- name: ListAccounts :many
SELECT * FROM accounts
ORDER BY id
LIMIT $1 -- number of rows to retrieve
OFFSET $2 -- skip this many rows before starting to return the results
;

------------------------------------------------------------------------------------
-- Learn more: https://docs.sqlc.dev/en/latest/howto/update.html#multiple-parameters
------------------------------------------------------------------------------------
-- name: UpdateAccount :one
UPDATE accounts SET balance = $2
WHERE id = $1
RETURNING *;

-- name: UpdateAccountNoReturnRecord :exec
UPDATE accounts SET balance = $2
WHERE id = $1;


----------------------------------------------------------------
-- Learn more: https://docs.sqlc.dev/en/latest/howto/delete.html
----------------------------------------------------------------
-- name: DeleteAccount :exec
DELETE FROM accounts WHERE id = $1;

$existingSettings = [Environment]::GetEnvironmentVariable("WOMA_SETTINGS", [System.EnvironmentVariableTarget]::User)

if ($existingSettings -ne $null) {
    Write-Host "Existing WOMA_SETTINGS found. Deleting the variable..."
    [Environment]::SetEnvironmentVariable("WOMA_SETTINGS", $null, [System.EnvironmentVariableTarget]::User)
}

$SECURE_KEY = "womaisrealmyfriend"
$SERVER_IP = "121.1.0.0"
$PORT = "3000"
$BASE_URL = "https://${SERVER_IP}:${PORT}"
$LOGIN_PATH = "/users/auth/login"
$REGISTER_PATH = "/users/auth/register"
$UPDATE_PROFILE_PATH = "/users/profile"
$UPDATE_PASS_PATH = "/users/profile/pass"
$OTP_PATH = "/users/auth/2fa"
$DIRECT_LOGIN_PATH = "/users/auth/dl"

$variables = @{
    "SECURE_KEY" = $SECURE_KEY
    "SERVER_IP" = $SERVER_IP
    "PORT" = $PORT
    "BASE_URL" = $BASE_URL
    "LOGIN_PATH" = $LOGIN_PATH
    "REGISTER_PATH" = $REGISTER_PATH
    "UPDATE_PROFILE_PATH" = $UPDATE_PROFILE_PATH
    "UPDATE_PASS_PATH" = $UPDATE_PASS_PATH
    "OTP_PATH" = $OTP_PATH
    "DIRECT_LOGIN_PATH" = $DIRECT_LOGIN_PATH
}

$json = $variables | ConvertTo-Json -Compress

[Environment]::SetEnvironmentVariable("WOMA_SETTINGS", $json, [System.EnvironmentVariableTarget]::User)

Write-Host "WOMA_SETTINGS environment variable has been set:"
Write-Host $json

Read-Host "Press Enter to close this window"
#!/bin/bash

existingSettings=$(printenv WOMA_SETTINGS)

if [ -n "$existingSettings" ]; then
    echo "Existing WOMA_SETTINGS found. Deleting the variable..."
    unset WOMA_SETTINGS
fi

SECURE_KEY="womaisrealmyfriend"
SERVER_IP="121.123.0.0"
PORT="3000"
BASE_URL="https://${SERVER_IP}:${PORT}"
LOGIN_PATH="/users/auth/login"
REGISTER_PATH="/users/auth/register"
UPDATE_PROFILE_PATH="/users/profile"
UPDATE_PASS_PATH="/users/profile/pass"
OTP_PATH="/users/auth/2fa"
DIRECT_LOGIN_PATH="/users/auth/dl"

export SECURE_KEY
export SERVER_IP
export PORT
export BASE_URL
export LOGIN_PATH
export REGISTER_PATH
export UPDATE_PROFILE_PATH
export UPDATE_PASS_PATH
export OTP_PATH
export DIRECT_LOGIN_PATH

variables=$(cat <<EOF
{
	"SECURE_KEY": "$SECURE_KEY",
    "SERVER_IP": "$SERVER_IP",
    "PORT": "$PORT",
    "BASE_URL": "$BASE_URL",
    "LOGIN_PATH": "$LOGIN_PATH",
    "REGISTER_PATH": "$REGISTER_PATH",
    "UPDATE_PROFILE_PATH": "$UPDATE_PROFILE_PATH",
    "UPDATE_PASS_PATH": "$UPDATE_PASS_PATH",
    "OTP_PATH": "$OTP_PATH",
    "DIRECT_LOGIN_PATH": "$DIRECT_LOGIN_PATH"
}
EOF
)

export WOMA_SETTINGS="$variables"

echo "WOMA_SETTINGS environment variable has been set:"
echo "$variables"

read -p "Press Enter to close this window"

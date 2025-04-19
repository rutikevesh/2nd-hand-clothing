#!/bin/bash

echo "🚀 Setting up React Native development environment..."

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "📦 Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "✅ Homebrew already installed"
fi

# Install Node.js and Java
echo "📦 Installing Node.js and Java..."
brew install node
brew install openjdk@17

# Install Android command-line tools
echo "📦 Installing Android command-line tools..."
brew install android-commandlinetools

# Set up environment variables
echo "⚙️ Setting up environment variables..."
JAVA_HOME=/opt/homebrew/opt/openjdk@17
ANDROID_HOME=/opt/homebrew/share/android-commandlinetools

# Add environment variables to shell profile
echo "⚙️ Adding environment variables to ~/.zshrc..."
echo "export JAVA_HOME=$JAVA_HOME" >> ~/.zshrc
echo "export ANDROID_HOME=$ANDROID_HOME" >> ~/.zshrc
echo 'export PATH=$JAVA_HOME/bin:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$PATH' >> ~/.zshrc

# Source the profile to get the new environment variables
source ~/.zshrc

# Install Android SDK components
echo "📦 Installing Android SDK components..."
yes | sdkmanager "platform-tools" "platforms;android-34" "system-images;android-34;google_apis;arm64-v8a" "ndk;25.1.8937393" "cmake;3.22.1"

# Create Android Virtual Device
echo "📱 Creating Android Virtual Device..."
echo "no" | avdmanager create avd -n test_device -k "system-images;android-34;google_apis;arm64-v8a" -d pixel_2

# Install project dependencies
echo "📦 Installing project dependencies..."
cd src/client && yarn install

# Add NDK path to gradle.properties
echo "⚙️ Configuring NDK path..."
echo "android.ndkPath=$ANDROID_HOME/ndk/25.1.8937393" >> android/gradle.properties

echo "✅ Setup complete! Here's how to run the app:"
echo "1. Start the Android emulator:"
echo "   $ANDROID_HOME/emulator/emulator -avd test_device"
echo ""
echo "2. In a new terminal, run the app:"
echo "   cd src/client && yarn android" 
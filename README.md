# Second Hand Clothing App

A React Native application for buying and selling second-hand clothing.

## Development Setup

### Prerequisites

- macOS
- Terminal access
- Internet connection

### Quick Setup (Automated)

1. Clone the repository:
```bash
git clone [repository-url]
cd 2nd-hand-clothing
```

2. Run the setup script:
```bash
chmod +x setup-dev-environment.sh
./setup-dev-environment.sh
```

### Manual Setup (Step by Step)

If you prefer to set up your environment manually or if you encounter any issues with the automated script, follow these steps:

1. Install Homebrew:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Install Node.js and Java:
```bash
brew install node
brew install openjdk@17
```

3. Install Android command-line tools:
```bash
brew install android-commandlinetools
```

4. Set up environment variables (add to your ~/.zshrc):
```bash
export JAVA_HOME=/opt/homebrew/opt/openjdk@17
export ANDROID_HOME=/opt/homebrew/share/android-commandlinetools
export PATH=$JAVA_HOME/bin:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/emulator:$ANDROID_HOME/platform-tools:$PATH
```

5. Reload your shell configuration:
```bash
source ~/.zshrc
```

6. Install Android SDK components:
```bash
sdkmanager "platform-tools" "platforms;android-34" "system-images;android-34;google_apis;arm64-v8a" "ndk;25.1.8937393" "cmake;3.22.1"
```

7. Create an Android Virtual Device:
```bash
avdmanager create avd -n test_device -k "system-images;android-34;google_apis;arm64-v8a" -d pixel_2
```

8. Install project dependencies:
```bash
cd src/client
yarn install
```

### Running the App

1. Start the Android emulator:
```bash
$ANDROID_HOME/emulator/emulator -avd test_device
```

2. In a new terminal, run the app:
```bash
cd src/client
yarn android
```

### Troubleshooting

If you encounter any issues:

1. Make sure all environment variables are properly set:
```bash
echo $JAVA_HOME
echo $ANDROID_HOME
```

2. Verify Android tools are in your PATH:
```bash
which sdkmanager
which avdmanager
which emulator
```

3. If the emulator command is not found, try using the full path:
```bash
$ANDROID_HOME/emulator/emulator -avd test_device
```

4. For NDK-related issues, verify the NDK path in `android/gradle.properties`:
```properties
android.ndkPath=/opt/homebrew/share/android-commandlinetools/ndk/25.1.8937393
```

### Project Structure

```
src/
  └── client/         # React Native application
      ├── android/    # Android-specific code
      ├── ios/        # iOS-specific code
      └── App.tsx     # Main application component
```
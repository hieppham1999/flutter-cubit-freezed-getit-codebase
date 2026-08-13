import java.io.FileInputStream
import java.util.Properties

// Single place to rename the app. `appId` is the base application id; each
// flavor appends its own suffix below so dev / stg / prod can be installed side
// by side on one device.
val appDisplayName = "My Codebase App"
val appId = "com.hieppt.flutter_cubit_freezed_codebase.flutter_cubit_freezed_getit_codebase"

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// Release signing credentials live outside the repo (`android/key.properties`,
// git-ignored). The file is deliberately optional: without it debug and profile
// builds still work, and only `--release` fails — a fresh clone should not need
// the keystore to run the app.
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = appId
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = appId
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            if (keystorePropertiesFile.exists()) {
                keyAlias = keystoreProperties["keyAlias"] as String
                keyPassword = keystoreProperties["keyPassword"] as String
                storeFile = file(keystoreProperties["storeFile"] as String)
                storePassword = keystoreProperties["storePassword"] as String
            }
        }
    }

    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = false
            isShrinkResources = false
        }

        getByName("debug") {
            isDebuggable = true
        }
    }

    // Flavor names must match `Flavor.value` in `lib/core/config/environment.dart`
    // and the `env/<flavor>.json` file names — `flutter run --flavor stg
    // --dart-define-from-file=env/stg.json`.
    flavorDimensions += "default"

    productFlavors {
        create("dev") {
            dimension = "default"
            applicationIdSuffix = ".dev"
            resValue("string", "app_name", "[DEV] $appDisplayName")
        }
        create("stg") {
            dimension = "default"
            applicationIdSuffix = ".stg"
            resValue("string", "app_name", "[STG] $appDisplayName")
        }
        create("prod") {
            dimension = "default"
            resValue("string", "app_name", appDisplayName)
        }
    }
}

flutter {
    source = "../.."
}

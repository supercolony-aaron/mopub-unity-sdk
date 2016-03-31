#!/usr/bin/env bash

cd mopub-android-sdk-unity
./gradlew clean
./gradlew assembleRelease -x javadoc

if [[ $? -ne 0 ]]; then
    echo "Failed building the mopub-android-sdk-unity project, quitting..."
    exit 1
fi

cd ..
cp mopub-android-sdk-unity/build/intermediates/bundles/release/classes.jar unity/MoPubUnityPlugin/Assets/Plugins/Android/mopub/libs/mopub.jar
cp mopub-android-sdk-unity/build/intermediates/exploded-aar/com.mopub/mopub-sdk/4.5.0/jars/classes.jar unity/MoPubUnityPlugin/Assets/Plugins/Android/mopub/libs/mopub-sdk.jar

if [[ $? -ne 0 ]]; then
    echo "Couldn't copy the generated jar into the Unity project, quitting..."
    exit 1
fi
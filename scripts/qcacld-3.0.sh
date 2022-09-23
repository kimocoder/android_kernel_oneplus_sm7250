#!/bin/bash
#
# Import or update qcacld-3.0, qca-wifi-host-cmn, fw-api and audio-kernel.
#

read -p "Please input the tag/branch name: " branch
read -p "What do you want to do (import (i) or update (u)): " option

case $option in
    import | i)
        git subtree add --prefix=drivers/staging/qcacld-3.0 https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource//wlan/qcacld-3.0.git/ $branch --squash
        git subtree add --prefix=drivers/staging/qca-wifi-host-cmn https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/wlan/qca-wifi-host-cmn.git/ $branch --squash
        git subtree add --prefix=drivers/staging/fw-api https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/wlan/fw-api.git/ $branch --squash
        #git subtree add --prefix=techpack/audio https://git.codelinaro.org/clo/le/platform/vendor/opensource/audio-kernel.git/ $branch --squash
        echo "Imported successfully."
        ;;
    update | u)
        git subtree pull --prefix=drivers/staging/qcacld-3.0 https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/wlan/qcacld-3.0.git/ $branch
        git subtree pull --prefix=drivers/staging/qca-wifi-host-cmn https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/wlan/qca-wifi-host-cmn.git/ $branch
        git subtree pull --prefix=drivers/staging/fw-api https://git.codelinaro.org/clo/la/platform/vendor/qcom-opensource/wlan/fw-api.git/ $branch
        #git subtree pull --prefix=techpack/audio https://git.codelinaro.org/clo/le/platform/vendor/opensource/audio-kernel.git/ $branch
        echo "Updated successfully."
        ;;
    *)
        echo "Invalid option."
        ;;
esac

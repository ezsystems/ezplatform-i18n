#!/usr/bin/env bash
# Synchronize translation sources from all packages to ezplatform-i18n
echo '# Translation synchronization';


echo '# Mirror the translation files';

declare -A packages
packages[ezcommerce-order-history]=vendor/ibexa/commerce-order-history/src/bundle/Resources/translations
packages[ibexa-commerce-page-builder]=vendor/ibexa/commerce-page-builder/src/bundle/Resources/translations
packages[ibexa-system-info]=vendor/ibexa/system-info/src/bundle/Resources/translations
packages[ezplatform-content-forms]=vendor/ibexa/content-forms/src/bundle/Resources/translations
packages[ezcommerce-base-design]=vendor/ibexa/commerce-base-design/src/bundle/Resources/translations
packages[ezcommerce-shop-local-order-management]=vendor/ibexa/commerce-transaction/src/bundle/LocalOrderManagement/Resources/translations
packages[ezcommerce-shop-comparison]=vendor/ibexa/commerce-transaction/src/bundle/Comparison/Resources/translations
packages[ezcommerce-shop-voucher]=vendor/ibexa/commerce-transaction/src/bundle/Voucher/Resources/translations
packages[ezcommerce-shop-newsletter]=vendor/ibexa/commerce-transaction/src/bundle/Newsletter/Resources/translations
packages[ezcommerce-shop-quick-order]=vendor/ibexa/commerce-transaction/src/bundle/QuickOrder/Resources/translations
packages[ibexa-commerce-shop-frontend]=vendor/ibexa/commerce-transaction/src/bundle/ShopFrontend/Resources/translations
packages[ezcommerce-fieldtypes]=vendor/ibexa/commerce-fieldtypes/src/bundle/Resources/translations
packages[ezplatform-workflow]=vendor/ibexa/workflow/src/bundle/Resources/translations
packages[ezcommerce-checkout]=vendor/ibexa/commerce-checkout/src/bundle/Resources/translations
packages[ezcommerce-admin-ui]=vendor/ibexa/commerce-admin-ui/src/bundle/Resources/translations
packages[ezplatform-form-builder]=vendor/ibexa/form-builder/src/bundle/Resources/translations
packages[ezplatform-matrix-fieldtype]=vendor/ibexa/fieldtype-matrix/src/bundle/Resources/translations
packages[ezplatform-richtext]=vendor/ibexa/fieldtype-richtext/src/bundle/Resources/translations
packages[ezplatform-connector-dam]=vendor/ibexa/connector-dam/src/bundle/Resources/translations
packages[ezplatform-permissions]=vendor/ibexa/permissions/src/bundle/Resources/translations
packages[ibexa-platform-image-editor]=vendor/ibexa/image-editor/src/bundle/Resources/translations
packages[ezplatform-page-builder]=vendor/ibexa/page-builder/src/bundle/Resources/translations
packages[ezplatform-query-fieldtype]=vendor/ibexa/fieldtype-query/src/bundle/Resources/translations
packages[ezplatform-kernel]=vendor/ibexa/core/src/bundle/Core/Resources/translations
packages[ezplatform-admin-ui]=vendor/ibexa/admin-ui/src/bundle/Resources/translations
packages[ezcommerce-price-engine]=vendor/ibexa/commerce-price-engine/src/bundle/Resources/translations
packages[ezplatform-version-comparison]=vendor/ibexa/version-comparison/src/bundle/Resources/translations
packages[date-based-publisher]=vendor/ibexa/scheduler/src/bundle/Resources/translations
packages[ibexa-taxonomy]=vendor/ibexa/taxonomy/src/bundle/Resources/translations
packages[ezplatform-user]=vendor/ibexa/user/src/bundle/Resources/translations
packages[ezplatform-page-fieldtype]=vendor/ibexa/fieldtype-page/src/bundle/Resources/translations
packages[ezcommerce-shop-eshop]=vendor/ibexa/commerce-shop/src/bundle/Eshop/Resources/translations
packages[ezcommerce-shop-search]=vendor/ibexa/commerce-shop/src/bundle/Search/Resources/translations
packages[ezcommerce-shop-tools]=vendor/ibexa/commerce-shop/src/bundle/Tools/Resources/translations
packages[ezcommerce-shop-specifications-type]=vendor/ibexa/commerce-shop/src/bundle/SpecificationsType/Resources/translations
packages[ezcommerce-erp-admin]=vendor/ibexa/commerce-erp-admin/src/bundle/Resources/translations
packages[ezplatform-search]=vendor/ibexa/search/src/bundle/Resources/translations
packages[ezplatform-site-factory]=vendor/ibexa/site-factory/src/bundle/Resources/translations
packages[ezplatform-segmentation]=vendor/ibexa/segmentation/src/bundle/Resources/translations
packages[ibexa-commerce-shop-ui]=vendor/ibexa/commerce-shop-ui/src/bundle/Resources/translations
packages[ibexa-tree-builder]=vendor/ibexa/tree-builder/src/bundle/Resources/translations
packages[ibexa-personalization]=vendor/ibexa/personalization/src/bundle/Resources/translations
packages[ezplatform-calendar]=vendor/ibexa/calendar/src/bundle/Resources/translations
packages[ibexa-product-catalog]=vendor/ibexa/product-catalog/src/bundle/Resources/translations

for key in "${!packages[@]}";
do
  destinationDir="./vendor/ezsystems/ezplatform-i18n/$key/"
  destinationFiles="./vendor/ezsystems/ezplatform-i18n/$key/*"
  if [ ! -d $destinationDir ]; then
    mkdir $destinationDir
  fi

  sourcePath="./${packages[$key]}"
  sourceFiles="./${packages[$key]}/*"
  if [ -d $sourcePath ]; then
    echo ezsystems/${key}
    rm -f $destinationFiles
    cp $sourceFiles $destinationDir
  fi
done

echo '# Fixing .xlf extensions'
# uncomment this for OSX rename -s '.xliff' '.xlf' vendor/ezsystems/ezplatform-i18n/*/*
rename 's/\.xliff/.xlf/' vendor/ezsystems/ezplatform-i18n/*/*

echo '# Strip english locale suffix from filename';
# uncomment this for OSX  rename -s '.en' '' ./vendor/ezsystems/ezplatform-i18n/*/*
rename 's/\.en//' vendor/ezsystems/ezplatform-i18n/*/*

echo 'Translation synchronization done !';

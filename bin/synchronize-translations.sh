#!/usr/bin/env bash
# Synchronize translation sources from all packages to ezplatform-i18n
echo '# Translation synchronization';


echo '# Mirror the translation files';

declare -A packages
packages[ezplatform-admin-ui]=vendor/ezsystems/ezplatform-admin-ui/src/bundle/Resources/translations
packages[ezplatform-kernel]=vendor/ezsystems/ezplatform-kernel/eZ/Bundle/EzPublishCoreBundle/Resources/translations
packages[ezplatform-user]=vendor/ezsystems/ezplatform-user/src/bundle/Resources/translations
packages[ezplatform-matrix-fieldtype]=vendor/ezsystems/ezplatform-matrix-fieldtype/src/bundle/Resources/translations
packages[date-based-publisher]=vendor/ezsystems/date-based-publisher/bundle/Resources/translations
packages[ezplatform-page-builder]=vendor/ezsystems/ezplatform-page-builder/src/bundle/Resources/translations
packages[ezplatform-page-fieldtype]=vendor/ezsystems/ezplatform-page-fieldtype/src/bundle/Resources/translations
packages[ezplatform-form-builder]=vendor/ezsystems/ezplatform-form-builder/src/bundle/Resources/translations
packages[ezplatform-workflow]=vendor/ezsystems/ezplatform-workflow/src/bundle/Resources/translations
packages[ezplatform-richtext]=vendor/ezsystems/ezplatform-richtext/src/bundle/Resources/translations
packages[ezplatform-calendar]=vendor/ezsystems/ezplatform-calendar/src/bundle/Resources/translations
packages[ezplatform-content-forms]=vendor/ezsystems/ezplatform-content-forms/src/bundle/Resources/translations
packages[ezplatform-site-factory]=vendor/ezsystems/ezplatform-site-factory/src/bundle/Resources/translations
packages[ezplatform-version-comparison]=vendor/ezsystems/ezplatform-version-comparison/src/bundle/Resources/translations
packages[ezplatform-query-fieldtype]=vendor/ezsystems/ezplatform-query-fieldtype/src/Symfony/Resources/translations
packages[ezplatform-connector-dam]=vendor/ezsystems/ezplatform-connector-dam/src/bundle/Resources/translations
packages[ezplatform-permissions]=vendor/ezsystems/ezplatform-permissions/src/bundle/Resources/translations
packages[ezplatform-search]=vendor/ezsystems/ezplatform-search/src/bundle/Resources/translations
packages[ezplatform-segmentation]=vendor/ezsystems/ezplatform-segmentation/src/bundle/translations
packages[ezcommerce-admin-ui]=vendor/ezsystems/ezcommerce-admin-ui/src/bundle/Resources/translations
packages[ezcommerce-base-design]=vendor/ezsystems/ezcommerce-base-design/Resources/translations
packages[ezcommerce-erp-admin]=vendor/ezsystems/ezcommerce-erp-admin/Resources/translations
packages[ezcommerce-fieldtypes]=vendor/ezsystems/ezcommerce-fieldtypes/src/bundle/Resources/translations
packages[ezcommerce-order-history]=vendor/ezsystems/ezcommerce-order-history/src/Siso/Bundle/OrderHistoryBundle/Resources/translations
packages[ezcommerce-price-engine]=vendor/ezsystems/ezcommerce-price-engine/Resources/translations
packages[ezcommerce-shop-eshop]=vendor/ezsystems/ezcommerce-shop/src/Silversolutions/Bundle/EshopBundle/Resources/translations
packages[ezcommerce-shop-newsletter]=vendor/ezsystems/ezcommerce-transaction/src/Siso/Bundle/NewsletterBundle/Resources/translations
packages[ezcommerce-shop-tools]=vendor/ezsystems/ezcommerce-shop/src/Siso/Bundle/ToolsBundle/Resources/translations
packages[ezcommerce-shop-local-order-management]=vendor/ezsystems/ezcommerce-transaction/src/Siso/Bundle/LocalOrderManagementBundle/Resources/translations
packages[ezcommerce-shop-quick-order]=vendor/ezsystems/ezcommerce-transaction/src/Siso/Bundle/QuickOrderBundle/Resources/translations
packages[ezcommerce-shop-specifications-type]=vendor/ezsystems/ezcommerce-shop/src/Siso/Bundle/SpecificationsTypeBundle/Resources/translations
packages[ezcommerce-shop-search]=vendor/ezsystems/ezcommerce-shop/src/Siso/Bundle/SearchBundle/Resources/translations
packages[ezcommerce-shop-comparison]=vendor/ezsystems/ezcommerce-transaction/src/Siso/Bundle/ComparisonBundle/Resources/translations
packages[ezcommerce-shop-voucher]=vendor/ezsystems/ezcommerce-transaction/src/Siso/Bundle/VoucherBundle/Resources/translations
packages[ezcommerce-shop-product-selection-type]=vendor/ezsystems/ezcommerce-shop/src/Siso/Bundle/ProductSelectionTypeBundle/Resources/translations
packages[ezcommerce-checkout]=vendor/ezsystems/ezcommerce-checkout/src/bundle/Resources/translations
packages[ibexa-personalization]=vendor/ezsystems/ezplatform-personalization/src/bundle/Resources/translations
packages[ibexa-platform-image-editor]=vendor/ibexa/image-editor/src/bundle/Resources/translations

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

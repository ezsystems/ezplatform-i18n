#!/usr/bin/env bash
# Synchronize translation sources from all packages to ezplatform-i18n
echo '# Translation synchronization';


echo '# Mirror the translation files';

declare -A packages
packages[ezplatform-admin-ui]=ezplatform-admin-ui/src/bundle/Resources/translations
packages[ezplatform-kernel]=ezplatform-kernel/eZ/Bundle/EzPublishCoreBundle/Resources/translations
packages[ezplatform-user]=ezplatform-user/src/bundle/Resources/translations
packages[ezplatform-matrix-fieldtype]=ezplatform-matrix-fieldtype/src/bundle/Resources/translations
packages[date-based-publisher]=date-based-publisher/bundle/Resources/translations
packages[ezplatform-page-builder]=ezplatform-page-builder/src/bundle/Resources/translations
packages[ezplatform-page-fieldtype]=ezplatform-page-fieldtype/src/bundle/Resources/translations
packages[ezplatform-form-builder]=ezplatform-form-builder/src/bundle/Resources/translations
packages[ezplatform-workflow]=ezplatform-workflow/src/bundle/Resources/translations
packages[ezplatform-richtext]=ezplatform-richtext/src/bundle/Resources/translations
packages[ezplatform-calendar]=ezplatform-calendar/src/bundle/Resources/translations
packages[ezplatform-content-forms]=ezplatform-content-forms/src/bundle/Resources/translations
packages[ezplatform-site-factory]=ezplatform-site-factory/src/bundle/Resources/translations
packages[ezplatform-version-comparison]=ezplatform-version-comparison/src/bundle/Resources/translations
packages[ezplatform-query-fieldtype]=ezplatform-query-fieldtype/src/Symfony/Resources/translations
packages[ezplatform-connector-dam]=ezplatform-connector-dam/src/bundle/Resources/translations
packages[ezplatform-permissions]=ezplatform-permissions/src/bundle/Resources/translations
packages[ezplatform-search]=ezplatform-search/src/bundle/Resources/translations
packages[ezplatform-segmentation]=ezplatform-segmentation/src/bundle/translations
packages[ezcommerce-admin-ui]=ezcommerce-admin-ui/src/bundle/Resources/translations
packages[ezcommerce-base-design]=ezcommerce-base-design/Resources/translations
packages[ezcommerce-erp-admin]=ezcommerce-erp-admin/Resources/translations
packages[ezcommerce-fieldtypes]=ezcommerce-fieldtypes/src/bundle/Resources/translations
packages[ezcommerce-order-history]=ezcommerce-order-history/src/Siso/Bundle/OrderHistoryBundle/Resources/translations
packages[ezcommerce-price-engine]=ezcommerce-price-engine/Resources/translations
packages[ezcommerce-shop-eshop]=ezcommerce-shop/src/Silversolutions/Bundle/EshopBundle/Resources/translations
packages[ezcommerce-shop-newsletter]=ezcommerce-shop/src/Siso/Bundle/NewsletterBundle/Resources/translations
packages[ezcommerce-shop-tools]=ezcommerce-shop/src/Siso/Bundle/ToolsBundle/Resources/translations
packages[ezcommerce-shop-local-order-management]=ezcommerce-shop/src/Siso/Bundle/LocalOrderManagementBundle/Resources/translations
packages[ezcommerce-shop-quick-order]=ezcommerce-shop/src/Siso/Bundle/QuickOrderBundle/Resources/translations
packages[ezcommerce-shop-specifications-type]=ezcommerce-shop/src/Siso/Bundle/SpecificationsTypeBundle/Resources/translations
packages[ezcommerce-shop-search]=ezcommerce-shop/src/Siso/Bundle/SearchBundle/Resources/translations
packages[ezcommerce-shop-comparison]=ezcommerce-shop/src/Siso/Bundle/ComparisonBundle/Resources/translations
packages[ezcommerce-shop-voucher]=ezcommerce-shop/src/Siso/Bundle/VoucherBundle/Resources/translations
packages[ezcommerce-shop-product-selection-type]=ezcommerce-shop/src/Siso/Bundle/ProductSelectionTypeBundle/Resources/translations
packages[ezcommerce-shop-checkout]=ezcommerce-shop/src/Siso/Bundle/CheckoutBundle/Resources/translations


for key in "${!packages[@]}";
do
  destinationDir="./vendor/ezsystems/ezplatform-i18n/$key/"
  destinationFiles="./vendor/ezsystems/ezplatform-i18n/$key/*"
  if [ ! -d $destinationDir ]; then
    mkdir $destinationDir
  fi

  sourcePath="./vendor/ezsystems/${packages[$key]}"
  sourceFiles="./vendor/ezsystems/${packages[$key]}/*"
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

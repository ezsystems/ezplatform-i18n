#!/usr/bin/env sh
# Synchronize translation sources from all packages to ezplatform-i18n
echo '# Translation synchronization';


echo '# Mirror the translation files';

echo "ezsystems/ezplatform-admin-ui"
rm -f ./vendor/ezsystems/ezplatform-i18n/ezplatform-admin-ui/*
cp ./vendor/ezsystems/ezplatform-admin-ui/src/bundle/Resources/translations/* ./vendor/ezsystems/ezplatform-i18n/ezplatform-admin-ui

# the bundle admin-ui-modules moved to admin-ui bundle

# the bundle ezpublish-kernel renamed to ezplatform-kernel
if [ ! -d "./vendor/ezsystems/ezplatform-kernel" ]; then
  mkdir "./vendor/ezsystems/ezplatform-i18n/ezplatform-kernel/"
fi

if [ -d "./vendor/ezsystems/ezplatform-kernel" ]; then
  echo "ezsystems/ezplatform-kernel"
  rm -f ./vendor/ezsystems/ezplatform-i18n/ezplatform-kernel/*
  cp ./vendor/ezsystems/ezplatform-kernel/eZ/Bundle/EzPublishCoreBundle/Resources/translations/* ./vendor/ezsystems/ezplatform-i18n/ezplatform-kernel
fi

# the bundle repository-forms is removed

# bundle has no translation anymore

echo "ezsystems/ezplatform-user"
rm -f ./vendor/ezsystems/ezplatform-i18n/ezplatform-user/*
cp ./vendor/ezsystems/ezplatform-user/src/bundle/Resources/translations/* ./vendor/ezsystems/ezplatform-i18n/ezplatform-user

echo "ezsystems/ezplatform-matrix-fieldtype"
rm -f ./vendor/ezsystems/ezplatform-i18n/ezplatform-matrix-fieldtype/*
cp ./vendor/ezsystems/ezplatform-matrix-fieldtype/src/bundle/Resources/translations/* ./vendor/ezsystems/ezplatform-i18n/ezplatform-matrix-fieldtype

if [ -d "./vendor/ezsystems/date-based-publisher" ]; then
  echo "ezsystems/date-based-publisher"
  rm -f ./vendor/ezsystems/ezplatform-i18n/date-based-publisher/*
  cp ./vendor/ezsystems/date-based-publisher/bundle/Resources/translations/* ./vendor/ezsystems/ezplatform-i18n/date-based-publisher
fi

# the bundle flex-workflow is removed

if [ -d "./vendor/ezsystems/ezplatform-page-builder" ]; then
  echo "ezsystems/ezplatform-page-builder"
  rm -f ./vendor/ezsystems/ezplatform-i18n/ezplatform-page-builder/*
  cp ./vendor/ezsystems/ezplatform-page-builder/src/bundle/Resources/translations/* ./vendor/ezsystems/ezplatform-i18n/ezplatform-page-builder
fi

if [ -d "./vendor/ezsystems/ezplatform-page-fieldtype" ]; then
  echo "ezsystems/ezplatform-page-fieldtype"
  rm -f ./vendor/ezsystems/ezplatform-i18n/ezplatform-page-fieldtype/*
  cp ./vendor/ezsystems/ezplatform-page-fieldtype/src/bundle/Resources/translations/* ./vendor/ezsystems/ezplatform-i18n/ezplatform-page-fieldtype
fi

if [ -d "./vendor/ezsystems/ezplatform-form-builder" ]; then
  echo "ezsystems/ezplatform-form-builder"
  rm -f ./vendor/ezsystems/ezplatform-i18n/ezplatform-form-builder/*
  cp ./vendor/ezsystems/ezplatform-form-builder/src/bundle/Resources/translations/* ./vendor/ezsystems/ezplatform-i18n/ezplatform-form-builder
fi

if [ -d "./vendor/ezsystems/ezplatform-workflow" ]; then
  echo "ezsystems/ezplatform-workflow"
  rm -f ./vendor/ezsystems/ezplatform-i18n/ezplatform-workflow/*
  cp ./vendor/ezsystems/ezplatform-workflow/src/bundle/Resources/translations/* ./vendor/ezsystems/ezplatform-i18n/ezplatform-workflow
fi

if [ -d "./vendor/ezsystems/ezplatform-richtext" ]; then
  echo "ezsystems/ezplatform-richtext"
  rm -f ./vendor/ezsystems/ezplatform-i18n/ezplatform-richtext/*
  cp ./vendor/ezsystems/ezplatform-richtext/src/bundle/Resources/translations/* ./vendor/ezsystems/ezplatform-i18n/ezplatform-richtext
fi

# added
if [ ! -d "./vendor/ezsystems/ezplatform-i18n/ezplatform-calendar" ]; then
  mkdir "./vendor/ezsystems/ezplatform-i18n/ezplatform-calendar"
fi

if [ -d "./vendor/ezsystems/ezplatform-calendar" ]; then
  echo "ezsystems/ezplatform-calendar"
  rm -f ./vendor/ezsystems/ezplatform-i18n/ezplatform-calendar/*
  cp ./vendor/ezsystems/ezplatform-calendar/src/bundle/Resources/translations/* ./vendor/ezsystems/ezplatform-i18n/ezplatform-calendar
fi

# added
if [ ! -d "./vendor/ezsystems/ezplatform-i18n/ezplatform-content-forms" ]; then
  mkdir "./vendor/ezsystems/ezplatform-i18n/ezplatform-content-forms"
fi

if [ -d "./vendor/ezsystems/ezplatform-content-forms" ]; then
  echo "ezsystems/ezplatform-content-forms"
  rm -f ./vendor/ezsystems/ezplatform-i18n/ezplatform-content-forms/*
  cp ./vendor/ezsystems/ezplatform-content-forms/src/bundle/Resources/translations/* ./vendor/ezsystems/ezplatform-i18n/ezplatform-content-forms
fi

# added
if [ ! -d "./vendor/ezsystems/ezplatform-i18n/ezplatform-site-factory" ]; then
  mkdir "./vendor/ezsystems/ezplatform-i18n/ezplatform-site-factory"
fi

if [ -d "./vendor/ezsystems/ezplatform-site-factory" ]; then
  echo "ezsystems/ezplatform-site-factory"
  rm -f ./vendor/ezsystems/ezplatform-i18n/ezplatform-site-factory/*
  cp ./vendor/ezsystems/ezplatform-site-factory/src/bundle/Resources/translations/* ./vendor/ezsystems/ezplatform-i18n/ezplatform-site-factory
fi

# added
if [ ! -d "./vendor/ezsystems/ezplatform-i18n/ezplatform-version-comparison" ]; then
  mkdir "./vendor/ezsystems/ezplatform-i18n/ezplatform-version-comparison"
fi

if [ -d "./vendor/ezsystems/ezplatform-version-comparison" ]; then
  echo "ezsystems/ezplatform-version-comparison"
  rm -f ./vendor/ezsystems/ezplatform-i18n/ezplatform-version-comparison/*
  cp ./vendor/ezsystems/ezplatform-version-comparison/src/bundle/Resources/translations/* ./vendor/ezsystems/ezplatform-i18n/ezplatform-version-comparison
fi

# added
if [ ! -d "./vendor/ezsystems/ezplatform-i18n/ezplatform-query-fieldtype" ]; then
  mkdir "./vendor/ezsystems/ezplatform-i18n/ezplatform-query-fieldtype"
fi

if [ -d "./vendor/ezsystems/ezplatform-query-fieldtype" ]; then
  echo "ezsystems/ezplatform-query-fieldtype"
  rm -f ./vendor/ezsystems/ezplatform-i18n/ezplatform-query-fieldtype/*
  cp ./vendor/ezsystems/ezplatform-query-fieldtype/src/Symfony/Resources/translations/* ./vendor/ezsystems/ezplatform-i18n/ezplatform-query-fieldtype
fi

echo '# Fixing .xlf extensions'
# uncomment this for OSX rename -s '.xliff' '.xlf' vendor/ezsystems/ezplatform-i18n/*/*
rename 's/\.xliff/.xlf/' vendor/ezsystems/ezplatform-i18n/*/*

echo '# Strip english locale suffix from filename';
# uncomment this for OSX  rename -s '.en' '' ./vendor/ezsystems/ezplatform-i18n/*/*
rename 's/\.en//' vendor/ezsystems/ezplatform-i18n/*/*

echo 'Translation synchronization done !';

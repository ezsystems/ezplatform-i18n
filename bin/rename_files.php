<?php
/**
 * @copyright Copyright (C) eZ Systems AS. All rights reserved.
 * @license For full copyright and license information view LICENSE file distributed with this source code.
 */

// because we changed crowdin configuration we need to manualy change existing file names
// in l10n_master branch to follow new standard

try {
    renameFiles();
} catch (Exception $e) {
    echo "An error occurred: " . $e->getMessage() . "\n";
    exit(1);
}

function renameFiles()
{
    $languagesMap = [
        'de' => 'de_DE',
        'el' => 'el_GR',
        'es' => 'es_ES',
        'fi' => 'fi_FI',
        'fr' => 'fr_FR',
        'hi' => 'hi_IN',
        'hu' => 'hu_HU',
        'ja' => 'ja_JP',
        'nb' => 'nb_NO',
        'pl' => 'pl_PL',
        'pt' => 'pt_PT',
        'ru' => 'ru_RU',
        'it' => 'it_IT',
        'hr' => 'hr_HR',
        'nl' => 'nl_NL',
        'he' => 'he',
    ];

    $translationsFilesRenamed = false;

    foreach (glob("translations/*/*/*.xlf") as $filepath) {
        if (!preg_match('|translations/([a-z]{2,3}_[a-z]{2,3})/(.*)\.([a-z]{2,3}_[a-z]{2,3})\.xlf|i', $filepath, $m)) {
            continue;
        }

        if (in_array($m[3], $languagesMap, true)) {
            $newfilepath = preg_replace_callback(
                '|(.*\.)([a-z]{2,3}_[a-z]{2,3})(\.xlf)|i',
                function ($matches) use ($languagesMap) {
                    [, $dirName, $locale, $extension] = $matches;
                    return $dirName . str_replace(array_values($languagesMap), array_keys($languagesMap), $locale) . $extension;
                },
                $filepath
            );

            $command = "git mv $filepath $newfilepath";
            system($command);
            $translationsFilesRenamed = true;
        }
    }

    if ($translationsFilesRenamed) {
        system('git commit -m "Rename translations files."');
    }
}

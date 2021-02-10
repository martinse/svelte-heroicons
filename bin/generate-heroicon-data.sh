#!/usr/bin/env bash

#
# A bit hacky script to:
#   - Download Heroicons
#   - Parse optimized icons
#   - Generate icon data exports
#

src_path="/app/src"
heroicons_tmp_path="/tmp/heroicons"
heroicons_build_path="/tmp/heroicons/build"
heroicons_archive_name="v${HEROICONS_VERSION}.zip"
heroicons_svg_source_path="${heroicons_tmp_path}/heroicons-${HEROICONS_VERSION}/optimized"

echo "Clean..."
rm -rf ${heroicons_tmp_path}/
mkdir -p ${heroicons_tmp_path}
mkdir -p ${heroicons_build_path}

echo "Download Heroicons..."
cd ${heroicons_tmp_path}
curl -LO "https://github.com/tailwindlabs/heroicons/archive/${heroicons_archive_name}"
unzip ${heroicons_archive_name}


cd ${heroicons_svg_source_path}
for icon_type in */; do
  icon_type=$(echo ${icon_type} | tr -d '/')

  mkdir -p ${src_path}/${icon_type}/
  : > ${src_path}/${icon_type}/index.js
done


echo "Generating icon exports..."
for path in */*.svg; do
  icon_type=$(echo ${path} | cut -d "/" -f1)

  icon_name=($(echo ${path} | cut -d "/" -f2 | cut -d '.' -f1 | tr '-' " "))
  icon_name=$(echo ${icon_name[@]^} | tr -d ' ')

  svg_json=$(cat ${path} | svgson | jq -rc '. | {svg: .attributes | del(.xmlns), paths: [.children[] | select(.name == "path") | .attributes] }')

  echo "export const ${icon_name,} = ${svg_json};" >> "${src_path}/${icon_type}/index.js"
done

echo "All done."

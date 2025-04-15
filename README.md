Topic: PDB rename
Time: Apr 10, 2025 08:30 AM Pacific 

Single click URL to join Zoom: https://oracle.zoom.us/j/5621983658?pwd=YnBac2tiZVAxell4Q2ZlSTRvTE9WZz09&omn=98043563933

 
find . -name "*.tf" -exec grep -H 'source *= *' {} \; | while IFS=: read -r file line; do
  source_path=$(echo "$line" | sed -n 's/.*source *= *"\(.*\)".*/\1/p')
  abs_path=$(realpath "$(dirname "$file")/$source_path")
  echo "In $file"
  echo "  uses module from $abs_path"
  echo ""
done



curl -LO https://github.com/opentofu/opentofu/releases/download/v1.9.0/tofu_1.9.0_windows_amd64.zip
If this command fails, try opening the URL directly in a browser to download manually: https://github.com/opentofu/opentofu/releases/download/v1.9.0/tofu_1.9.0_windows_amd64.zip
curl -LO https://github.com/terraform-linters/tflint/releases/latest/download/tflint_windows_amd64.zip
Or grab it manually from here:
https://github.com/terraform-linters/tflint/releases/latest




oci  identity-domains user create \
  --domain-ocid ocid1.domain.oc1..aaaaaaaabn6436zhyo34dfj4ttgyscssk2joc3w37ghdtbpa625pclq4behq\
  --user-name "john.doe" \
  --display-name "John Doe" \
  --schemas '["urn:ietf:params:scim:schemas:core:2.0:User"]' \
  --name '{"givenName":"John","familyName":"Doe"}' \
  --emails '[{"value":"john.doe@example.com","primary":true}]' \
--endpoint https://idcs-7b841dd4db2147d389ea8ca2d93be8f3.us-phoenix-idcs-3.identity.us-phoenix-1.oci.oraclecloud.com:443 \
 --emails '[{"value":"john.doe@example.com","type":"work","primary":true}]'
Here is the zoom link that will open at that time.

Single click URL to join Zoom: https://oracle.zoom.us/j/5621983658?pwd=YnBac2tiZVAxell4Q2ZlSTRvTE9WZz09&omn=91260445855

Meeting ID: 562 198 3658 
Password: 65599134

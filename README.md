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




$ oci identity-domains api-key create \
>   --endpoint https://idcs-xxx.identity.us-phoenix-1.oci.oraclecloud.com \
>   --domain-ocid ocid1.domain.oc1..aaaaaaaabn6436zhyo34dfj4ttgyscssk2joc3w37ghdtbpa625pclq4behq \
>   --key oci_api_key_public.pem \
>   --fingerprint "3a:88:2b:5d:7a:1e:94:23:cb:91:13:45:0f:e5:0d:92:7f:cf:1c:77" \
>   --user '{"value": "ocid1.user.oc1..aaaaaaaaf7pvdirqvn6lmvwzd75pwilfzzylrqrah4ye247kex4to67g4uma"}' \
>   --schemas '["urn:ietf:params:scim:schemas:oracle:idcs:extension:apiKey:User"]'



oci identity-domains users list \
  --endpoint https://idcs-7b841dd4db2147d389ea8ca2d93be8f3.us-phoenix-idcs-3.identity.us-phoenix-1.oci.oraclecloud.com \
  --domain-ocid ocid1.domain.oc1..aaaaaaaabn6436zhyo34dfj4ttgyscssk2joc3w37ghdtbpa625pclq4behq




  oci identity-domains api-key create \
--endpoint https://idcs-7b841dd4db2147d389ea8ca2d93be8f3.us-phoenix-idcs-3.identity.us-phoenix-1.oci.oraclecloud.com:443 \
--domain-ocid ocid1.domain.oc1..aaaaaaaabn6436zhyo34dfj4ttgyscssk2joc3w37ghdtbpa625pclq4behq \
--key "-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArh/DIHra7E9I+49wMBwF4KjeSZQWt/AdQn8EzshyQodUA3zR2qyVPZ2iQFVGZywGDfG/JQooASDiyN032PIABeDqE6XS9kXkvziesqlrGqG97cJtS+A8gATfSiBYs3zRyHlTCU/1uUi7DNf8jP2942MPCg9XqC9e0UwQWsmMCuB8yuvoLKM6rnQDT9szOkpB+kDLnNI/9++WQ6y0pWrvTZSmbWPVSINe1ZcktsDcK3GXuN4UNJcOKqkvsCaAC94zeEbDJW0dhzZiJdQ1FtrRYKuXtYzj4CoMogdmBiI/X2HYOJH15eVEsKa8S7LJqvZZJwPMxmxRtF7ypcrFGW3GDQIDAQAB
-----END PUBLIC KEY-----" \
--fingerprint "f4:db:be:7b:c9:6e:40:0f:4f:c5:db:58:c1:9b:0f:15" \
--user '{"value": "c81936ecb01b465eb7383f0da9e4a8b0"}' \
--schemas '["urn:ietf:params:scim:schemas:oracle:idcs:APIKey"]'


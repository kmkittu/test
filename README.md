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







#!/bin/bash
 
# Variables
USER_OCID="ocid1.user.oc1..aaaaaaaas3hfymzutu3dqqwgzuyyz5xdt5i6isvlpprcqr3bwr4xklvbayqa"
DOMAIN_ID="ocid1.domain.oc1..aaaaaaaaiefixls7ka27nihtmbxqjfwejppiayhvzmwe6sr7gkhwzswhxovq"
TENANCY_OCID="ocid1.tenancy.oc1..aaaaaaaayhlzwx4nxan2uv4lm6dydhwrgzbppwvacq4g2oexdafz2ndhvaza"
COMPARTMENT_ID="ocid1.compartment.oc1..aaaaaaaamalrh277nou454ys2vwvv5iwsxyblgu7dc6bfo6nv4dkghczpqoa"
VAULT_ID="ocid1.vault.oc1.phx.eft7kd4baaax4.abyhqljsbuzf5wh7j2qcv7larlousneiybedinnq4bjii3xsbmzfudzekm2a"
KEY_ID="ocid1.key.oc1.phx.eft7kd4baaax4.abyhqljt3a6m6h7jbbkpeuzkd5p5u5hfldhhaqjztekjambu633jbxyufdxa"
REGION="us-phoenix-1"
ENDPOINT="https://idcs-5dde0530f253443185531a0f35e7e1c8.us-phoenix-idcs-3.identity.us-phoenix-1.oci.oraclecloud.com:443"
PASSPHRASE="admin@12345"
SECRET_ID="ocid1.vaultsecret.oc1.phx.amaaaaaamialooiar5rpfyf5twrflo3mzrtolnev5ojfeybp3ay4fzgzdzzq"
 
# Key paths
KEY_DIR="$HOME/.oci"
mkdir -p "$KEY_DIR"
PRIVATE_KEY_PATH="$KEY_DIR/new_private.pem"
PUBLIC_KEY_PATH="$KEY_DIR/new_public.pem"
SECRET_PAYLOAD="$KEY_DIR/secret.txt"
 
# Generating API keys
openssl genrsa -aes128 -passout pass:$PASSPHRASE -out "$PRIVATE_KEY_PATH" 2048
openssl rsa -pubout -in "$PRIVATE_KEY_PATH" -passin pass:$PASSPHRASE -out "$PUBLIC_KEY_PATH"
 
# Extracting the fingerprint
FINGERPRINT=$(openssl rsa -in "$PRIVATE_KEY_PATH" -pubout -outform DER | openssl md5 -c | awk '{print $2}')
echo "Fingerprint: $FINGERPRINT"
 
# Uploading public key to Identity domain user
oci identity-domains api-key create \
  --endpoint "$DOMAIN_ENDPOINT" \
  --domain-ocid "$DOMAIN_OCID" \
  --key "$(cat $PUBLIC_KEY_PATH)" \
  --fingerprint "$FINGERPRINT" \
  --schemas '["urn:ietf:params:scim:schemas:oracle:idcs:ApiKey"]' \
  --user '{"value": "e4b98c6896f54af29ef76d45b39c3880"}'
 
# Create Ordered Secret Content file
{
echo "user=$USER_OCID"
echo "fingerprint=$FINGERPRINT"
echo "tenancy=$TENANCY_OCID"
echo "region=$REGION"
echo -n "private_key="; cat "$PRIVATE_KEY_PATH" | tr -d '\r'
echo -n "public_key="; cat "$PUBLIC_KEY_PATH" | tr -d '\r'
} > "$SECRET_PAYLOAD"
 
# UPLOADsecret content to vault
oci vault secret update-base64 \
  --secret-id "$SECRET_ID" \
  --secret-content-content "$(base64 < "$SECRET_PAYLOAD")" \
  --secret-content-name "api_key" \
  --secret-content-stage CURRENT
 
echo "API key uploaded and secret stored in OCI vault successfully"


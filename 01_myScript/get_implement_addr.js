require("dotenv").config({ path: ".env" });
const ethers = require("ethers");

const ALCHEMY_HTTPS = process.env.ALCHEMY_HTTPS;
const IMPLEMENTATION_SLOT =
  "0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc";

async function getImplementationAddress(proxyAddress) {
  const provider = new ethers.JsonRpcProvider(ALCHEMY_HTTPS);

  const implAddress = await provider.getStorage(
    proxyAddress,
    IMPLEMENTATION_SLOT
  );

  return ethers.getAddress(implAddress.slice(-40));
}

// Specify the proxy contract address
const proxyAddress = "0x210d2F2396C7993a7621E81ADFE4f63649C339c5";
getImplementationAddress(proxyAddress).then(console.log);

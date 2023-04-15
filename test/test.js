//test.js
const main = async () => {
  // コントラクトがコンパイルします
  // コントラクトを扱うために必要なファイルが `artifacts` ディレクトリの直下に生成されます。
  const orderBookContractFactory = await hre.ethers.getContractFactory("OrderBook");
  // Hardhat がローカルの Ethereum ネットワークを作成します。
  const orderBookContract = await orderBookContractFactory.deploy();
  // コントラクトが Mint され、ローカルのブロックチェーンにデプロイされるまで待ちます。
  await orderBookContract.deployed();
  console.log("Contract deployed to:", orderBookContract.address);

  const addOrder = await orderBookContract.addOrder(100,100,0);
  // console.log("Contract")
  // await orderBookContract.addOrder();

};
// エラー処理を行っています。
const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};
runMain();
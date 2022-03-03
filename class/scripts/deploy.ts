/* eslint-disable no-process-exit */
import { ethers } from "hardhat";
import { Hard } from "../typechain";

async function main() {
  const Hard = await ethers.getContractFactory("Hard");
  const hard = (await Hard.deploy()) as Hard;
  await hard.deployed();

  hard.on("Alert", (_, person) => {
    console.log(person.name);
    // stop process since we're only listening for one event
    process.exit(0);
  });

  const transaction = await hard.addPerson(0, {
    age: 12,
    height: 53,
    name: "John Doe",
  });

  await transaction.wait();

  await hard.viewPerson(0);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

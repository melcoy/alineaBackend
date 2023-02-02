import db from "../db";
const { main } = db;

async function mainSeed() {
  // seeders here
}
mainSeed()
  .then(async () => {
    await main.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);
    await main.$disconnect();
    process.exit(1);
  });

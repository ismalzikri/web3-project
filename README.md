# Pixel8Labs Front-end Engineer Take-home Test

Thanks for your interest in working with us as a web3 front-end engineer.
This take-home test is for us to gauge your engineering capabilities and determine
whether we can move to the work trial phase. It's not a test per se but rather a
way for Pixel8Labs to know more about your abilities and also for you to see if
you would like the kind of work we do, before we spend more time together in the
work trial.

This test should not take you more than 10 hours but you are allowed to spend more
than 10 hours within the given 2 days just in case you want to touch things up and
submit a polished piece of work.

## Tasks

Here are the requirements for the take-home project

### Basic tasks

- [ ] Implement [this website](https://pepedoods-com.vercel.app/) in React (with correct metadata and favicon). We hope that you would know how to extract static assets like images, fonts from an existing website.
- [ ] Replace "Minting Soon" text with a minting widget that consists of:
  - a number picker for the number NFTs to mint (including but not limited to dropdown or number input)
  - 2 separate mint button for Allowlist mint and Public mint
  - a sub-text showing how many NFTs have been minted
- [ ] Make use of the modal component to show users feedback about their mint transaction status, and show the minted NFTs to them after transaction has been confirmed

### Stretch (optional) tasks

These tasks are optional but we would encourage you to give them a try to demonstrate more of your skills

- [ ] Deploy your own version of [the smart contract](./contracts) to Sepolia
  - [ ] Set the merkle tree root so your address will be whitelisted
- [ ] If you are using our public smart contract `0x9030ce12Bd719AE1988CeaE21cD8dc8B94d3E44a`, provide us your merkle root in your PR in case it conflicts with another candidate's
- [ ] Web3 integration with the contract that you've just deployed for NFT minting and showing current mint number
- [ ] Implement a mint button disable/enable depending on whether the wallet is whitelisted or not
- [ ] Setup Github Actions for lint check
- [ ] Setup Github Actions for deployment on PRs to `master`
- [ ] Setup Github Actions to deploy on pushes to `master`
- [ ] Deploy this website on your favorite hosting provider

## Tips

- Checkout these React libraries that we use in the boilerplate:
  - [Reactstrap](https://reactstrap.github.io/)
  - [styled-components](https://styled-components.com/)
- Generate your own merkle root and execute a `setAllowlist` transaction to whitelist your own address (please mind that the contract is public, so your merkle root might accidentally be replaced)
- Get some SepoliaETH from [this faucet](https://sepoliafaucet.com/)
- Last but not least, remember to **have fun**!!

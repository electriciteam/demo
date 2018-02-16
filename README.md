## STROMSACK: BIOTS2018 Hackathon



This is a Project created for the BIOTS 2018 hackathon, that tackles the Virtual Energy Storage challenge proposed by EWZ.

This project aims to enable 100% green, home-made electricity, to be consumed __anywhere__ and __anytime__.
This is done by tracking your production of energy (from any solar PV or windmill you may have in your home), and your consumption of energy at home and out of it. A *raspberry pi* is the IoT device that allows the tracking, using Emonpi to access the prosumer data.

This is backed up by an Ethereum Smart Contract 'Contract.sol', which tracks and ensures that all transactions are safe. For further reference, the address of the contract is `0x0710f1f272ffa3219952ce599ee6c08dc6c9ad53`, in the Ropsten Test Network.

## Hot to use the demo
*Online Demo:* https://electriciteam.github.io/demo/index (You need to have MetaMask installed and set up)

Please, go to `Register` and `Login as a very cool blockchain user` to show the MetaMask login. Please click `submit` in the MetaMask, and then click on `Token` and create the Token by stating the token contract address `0x385c9fb8164bce3491f7a75ae8bf37621a781043`, and name the token `ELC`. You will then receive 5000 ELC to play around with. One you are registered you will find the transaction hash on the website. Feel free to copy it and to insert it into https://ropsten.etherscan.io/.

Afterwards, please go to https://electriciteam.github.io/demo/dashboard.

To check your current balance, click on `Check Balance`. For demo reasons we included the account `settlement` function which is usually done automatically. What you can do here is simulating buying energy with your ELC tokens. Again, MetaMask will pop up and ask for your permission. You will then receive a transaction hash which you can insert into etherscan.

## Team members

- Ananja Joshi
- Liliane Ableitner
- Sandro Schopfer
- Arne Wulff
- Li Wei Yap
- Adrian Sarbach
- Marti Perez Canyelles

## Further information

- About: https://electriciteam.github.io/demo/about.html
- FAQs: https://electriciteam.github.io/demo/faq.html

## 环境搭建

### 运行

1.  切换开发链
    查看本地链 sui client envs

````╭─────────┬─────────────────────────────────────┬────────╮****
  │ alias │ url │ active │
  ├─────────┼─────────────────────────────────────┼────────┤
  │ devnet │ https://fullnode.devnet.sui.io:443 │ \* │
  │ testnet │ https://fullnode.testnet.sui.io:443 │ │
  ╰─────────┴─────────────────────────────────────┴────────╯

  切换命令 sui client switch --env devnet

2.  切换钱包

  sui client addresses
  ╭─────────────────┬────────────────────────────────────────────────────────────────────┬────────────────╮
  │ alias │ address │ active address │
  ├─────────────────┼────────────────────────────────────────────────────────────────────┼────────────────┤
  │ thirsty-coral │ 0x6ce504e4aa58e3ea54031311204bfd908b14a8f2aa1a009974f3e4fdf6a8850d │ \* │

  切换命令 sui client switch --address thirsty-coral

3.  充值测试币
  ```
    curl --location --request POST 'https://faucet.devnet.sui.io/gas' \
  --header 'Content-Type: application/json' \
  --data-raw '{"FixedAmountRequest":{"recipient":"0x6ce504e4aa58e3ea54031311204bfd908b14a8f2aa1a009974f3e4fdf6a8850d"}}'
  
  ```
4.  修改本地的依赖包
  1. 从 https://github.com/MystenLabs/sui 获取源码
  2. 修改 Move.toml 文件 Sui = { local = "/Users/xxxx/Documents/GitHub/sui/crates/sui-framework/packages/sui-framework" }
5.  运行 sui client publish --gas-budget 200000000

## 报错

````

Failed to publish the Move module(s), reason: [warning] Local dependency did not match its on-chain version at 0000000000000000000000000000000000000000000000000000000000000002::Sui::object

This may indicate that the on-chain version(s) of your package's dependencies may behave differently than the source version(s) your package was built against.

Fix this by rebuilding your packages with source versions matching on-chain versions of dependencies, or ignore this warning by re-running with the --skip-dependency-verification flag.

```

1. 处理 sui_jack % sui client publish --gas-budget 200000000 --skip-dependency-verification

## 运行结果

INCLUDING DEPENDENCY Sui
INCLUDING DEPENDENCY MoveStdlib
BUILDING sui_jack
Total number of linter warnings suppressed: 1 (filtered categories: 1)
Skipping dependency verification
Transaction Digest: 5hwWcxNr6oFH8QbazZBknetjujFJ93Cpc5ej5Y9d3dk6
╭──────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Data │
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Sender: 0x6ce504e4aa58e3ea54031311204bfd908b14a8f2aa1a009974f3e4fdf6a8850d │
│ Gas Owner: 0x6ce504e4aa58e3ea54031311204bfd908b14a8f2aa1a009974f3e4fdf6a8850d │
│ Gas Budget: 200000000 MIST │
│ Gas Price: 1000 MIST │
│ Gas Payment: │
│ ┌── │
│ │ ID: 0x1868a440ababd33aea90bbc7f2dcfde824611595e12b4f31c37dcde60114ee02 │
│ │ Version: 34 │
│ │ Digest: 7BwZW9j6hbXqT1FvVACaBemAv2XfPsr7neL17eMFHuqs │
│ └── │
│ │
│ Transaction Kind: Programmable │
│ ╭──────────────────────────────────────────────────────────────────────────────────────────────────────────╮ │
│ │ Input Objects │ │
│ ├──────────────────────────────────────────────────────────────────────────────────────────────────────────┤ │
│ │ 0 Pure Arg: Type: address, Value: "0x6ce504e4aa58e3ea54031311204bfd908b14a8f2aa1a009974f3e4fdf6a8850d" │ │
│ ╰──────────────────────────────────────────────────────────────────────────────────────────────────────────╯ │
│ ╭─────────────────────────────────────────────────────────────────────────╮ │
│ │ Commands │ │
│ ├─────────────────────────────────────────────────────────────────────────┤ │
│ │ 0 Publish: │ │
│ │ ┌ │ │
│ │ │ Dependencies: │ │
│ │ │ 0x0000000000000000000000000000000000000000000000000000000000000001 │ │
│ │ │ 0x0000000000000000000000000000000000000000000000000000000000000002 │ │
│ │ └ │ │
│ │ │ │
│ │ 1 TransferObjects: │ │
│ │ ┌ │ │
│ │ │ Arguments: │ │
│ │ │ Result 0 │ │
│ │ │ Address: Input 0 │ │
│ │ └ │ │
│ ╰─────────────────────────────────────────────────────────────────────────╯ │
│ │
│ Signatures: │
│ kbCjMddiFqTaz4/l/FGBLKp7D+o1o8mRQnx/zXFTSj3KsZ71u32CGJkwBPK3SVZU96qHRA0T7BJ4OdCvSFGPCA== │
│ │
╰──────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Transaction Effects │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Digest: 5hwWcxNr6oFH8QbazZBknetjujFJ93Cpc5ej5Y9d3dk6 │
│ Status: Success │
│ Executed Epoch: 625 │
│ │
│ Created Objects: │
│ ┌── │
│ │ ID: 0x128644a6ab540cb8c04db557faf519ca3bc2f5c66f32ad5aebf716beed5a3b37 │
│ │ Owner: Immutable │
│ │ Version: 1 │
│ │ Digest: MyYuu1thEauj2zuKMvdEpKfHyoioVxJrs8xbKfjukDG │
│ └── │
│ ┌── │
│ │ ID: 0xc0ad331bcf419c047db1956e40ffc141692bd52664838b92a853d47f12a4abee │
│ │ Owner: Account Address ( 0x6ce504e4aa58e3ea54031311204bfd908b14a8f2aa1a009974f3e4fdf6a8850d ) │
│ │ Version: 35 │
│ │ Digest: DnUJmdyN9d5JTr5Fn5nWHQfUjQkqzq794yjprEfcURxL │
│ └── │
│ Mutated Objects: │
│ ┌── │
│ │ ID: 0x1868a440ababd33aea90bbc7f2dcfde824611595e12b4f31c37dcde60114ee02 │
│ │ Owner: Account Address ( 0x6ce504e4aa58e3ea54031311204bfd908b14a8f2aa1a009974f3e4fdf6a8850d ) │
│ │ Version: 35 │
│ │ Digest: 3MB5HkRRh61VMV8SUAPXoXnmrbxgh4adi4pbtWUeTAxV │
│ └── │
│ Gas Object: │
│ ┌── │
│ │ ID: 0x1868a440ababd33aea90bbc7f2dcfde824611595e12b4f31c37dcde60114ee02 │
│ │ Owner: Account Address ( 0x6ce504e4aa58e3ea54031311204bfd908b14a8f2aa1a009974f3e4fdf6a8850d ) │
│ │ Version: 35 │
│ │ Digest: 3MB5HkRRh61VMV8SUAPXoXnmrbxgh4adi4pbtWUeTAxV │
│ └── │
│ Gas Cost Summary: │
│ Storage Cost: 7790000 │
│ Computation Cost: 1000000 │
│ Storage Rebate: 978120 │
│ Non-refundable Storage Fee: 9880 │
│ │
│ Transaction Dependencies: │
│ Cr2VkBmny9cB5p9SRHKW3uh9sMpgJWJdA4htNfkrevsZ │
│ G99qEEBjZRvnGTESxk6yPGEbZLFbygCYgpQHS5BcfqYB │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
╭─────────────────────────────╮
│ No transaction block events │
╰─────────────────────────────╯
╭──────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Object Changes │
├──────────────────────────────────────────────────────────────────────────────────────────────────┤
│ Created Objects: │
│ ┌── │
│ │ ObjectID: 0xc0ad331bcf419c047db1956e40ffc141692bd52664838b92a853d47f12a4abee │
│ │ Sender: 0x6ce504e4aa58e3ea54031311204bfd908b14a8f2aa1a009974f3e4fdf6a8850d │
│ │ Owner: Account Address ( 0x6ce504e4aa58e3ea54031311204bfd908b14a8f2aa1a009974f3e4fdf6a8850d ) │
│ │ ObjectType: 0x2::package::UpgradeCap │
│ │ Version: 35 │
│ │ Digest: DnUJmdyN9d5JTr5Fn5nWHQfUjQkqzq794yjprEfcURxL │
│ └── │
│ Mutated Objects: │
│ ┌── │
│ │ ObjectID: 0x1868a440ababd33aea90bbc7f2dcfde824611595e12b4f31c37dcde60114ee02 │
│ │ Sender: 0x6ce504e4aa58e3ea54031311204bfd908b14a8f2aa1a009974f3e4fdf6a8850d │
│ │ Owner: Account Address ( 0x6ce504e4aa58e3ea54031311204bfd908b14a8f2aa1a009974f3e4fdf6a8850d ) │
│ │ ObjectType: 0x2::coin::Coin<0x2::sui::SUI> │
│ │ Version: 35 │
│ │ Digest: 3MB5HkRRh61VMV8SUAPXoXnmrbxgh4adi4pbtWUeTAxV │
│ └── │
│ Published Objects: │
│ ┌── │
│ │ PackageID: 0x128644a6ab540cb8c04db557faf519ca3bc2f5c66f32ad5aebf716beed5a3b37 │
│ │ Version: 1 │
│ │ Digest: MyYuu1thEauj2zuKMvdEpKfHyoioVxJrs8xbKfjukDG │
│ │ Modules: init │
│ └── │
╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
╭───────────────────────────────────────────────────────────────────────────────────────────────────╮
│ Balance Changes │
├───────────────────────────────────────────────────────────────────────────────────────────────────┤
│ ┌── │
│ │ Owner: Account Address ( 0x6ce504e4aa58e3ea54031311204bfd908b14a8f2aa1a009974f3e4fdf6a8850d ) │
│ │ CoinType: 0x2::sui::SUI │
│ │ Amount: -7811880 │
│ └── │
╰───────────────────────────────────────────────────────────────────────────────────────────────────╯
```

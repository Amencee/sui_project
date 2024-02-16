module sui_nft::nft {

    use std::string::utf8;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};
    use sui::display;
    use sui::package;

    struct NFT has drop{}

    struct Counter has key{
        id:UID,
        count:u64,
    }

    struct JackNFT has key,store{
        id:UID,
        tokenId:u64,
        name: std::ascii::String,
        prefix_url:  std::ascii::String,
    }


    fun init (witness:NFT, ctx:&mut TxContext){
          let keys = vector[
            utf8(b"tokenId"),
            utf8(b"name"),
            utf8(b"collection"),
            utf8(b"image_url"),
            utf8(b"description")
        ];

        let values = vector[
            utf8(b"JackNFT #{tokenId}"),
            utf8(b"JackerGroup #{name}"),
            utf8(b"Jacker Collection"),
            utf8(b"{prefix_url}/{name}"),
            utf8(b"use github avatar create nft")
        ];
        let publisher = package::claim(witness,ctx);
        let display = display::new_with_fields<JackNFT>(&publisher, keys, values, ctx);
        display::update_version(&mut display);
        transfer::public_transfer(publisher, tx_context::sender(ctx));
        transfer::public_transfer(display, tx_context::sender(ctx));
        transfer::share_object(Counter{
            id: object::new(ctx),
            count: 0
        });
    }

    entry public fun mint(counter:&mut Counter,name:std::ascii::String,ctx:&mut TxContext){
        let sender = tx_context::sender(ctx);
        counter.count = counter.count + 1;
        transfer::public_transfer(create(counter.count,name,ctx),sender);
    }

    public fun create(count:u64,name:std::ascii::String,ctx:&mut TxContext):JackNFT{
        JackNFT{
            id: object::new(ctx),
            tokenId: count,
            name: name,
            prefix_url: std::ascii::string(b"https://avatars.githubusercontent.com/"),
        }
    }


    public entry fun update(nft: &mut JackNFT,name:std::ascii::String){
        nft.name = name;
    }





}
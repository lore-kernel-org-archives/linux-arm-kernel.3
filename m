Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A71F3095C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 13:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=12ucEdAFXfC6E20WpVMMZDujwQClNo1zj9TEZw+WEZQ=; b=UBNGmiPcQUriCSOzL8FfzMLTDG
	+BwGsAyUSXuP2OjwkGMWuPYfaeE9pUSoj5X1mqiwu+4ycz92zJK55HwDasUCITTeLXRuebG81/SoM
	s/MkqmppgJTZlaNApLKfdMBtK4ns31+fpl83hF5hw63TVcWjZ8t7YELawou6CpoNfE1cgNQx3jXoK
	wKzuwtplORDaBKa0rwYGoXTLlP/YseSg0Gljj12pLD6xirXmNNDe9WWwrCz3xkdLqEGkGbZq0Ysu+
	UQcObaUi42oDAly1gDG+JIMSdGOt/q25VZShJQgM9kKqaLL9VJLTiVdJw3h6xnp2B7prhkMLX9oYx
	n4rXftIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8ZX-00000001s1I-2nW3;
	Thu, 05 Mar 2026 13:16:59 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8ZV-00000001s0t-0uAg
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Mar 2026 13:16:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=12ucEdAFXfC6E20WpVMMZDujwQClNo1zj9TEZw+WEZQ=; b=YdMPzGwQjzs9orfbGdraZz/fUu
	/EUEj0gfu/V/wFGybLpOfDkuoLM8/jk4EhjlBiX3X0KokJqOuvxF3zvi1DZreaR4G8vnGQU6ftgxD
	+QgUXJ2hvQOOVptPy060AUxa2oFvovU9hxH1bE2WQ2wiAGkIgskJGSGA+Q5DHrO2B5vRdjphlHdxF
	abdZeY5esPpda9Sphu8bVveaHOh58wn8+VYkSYfTtUORsEHmSo3lPoPr3pxgvsGAXYNLjg0Ks9uyf
	39WhIgEk+0IgCKE1aC7hNx/TgR7Q0rIYm1GUcrYJ1x2FBT9DVG9cHXP4NmGRBZ0+uQ3bOWTBOPpbM
	F1C6kbfQ==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy8ZS-0000000F2Uo-1S0i
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 13:16:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=12ucEdAFXfC6E20WpVMMZDujwQClNo1zj9TEZw+WEZQ=; b=Z7
	PFjdGzuNOxxgbi7rXc+QGGG1TooRwb7XHvOaOXpw/tlJOv5pAlEHE2vg3AYFGI6cK4gtTWDmL9vwV
	nr6rLbxAy3vyUsp42wOSZxCl6aUVnPdzotD8P/pf3Bk2t2+fzfVA9Mlnpw35GsxeCvAA9HXCd3cAi
	HRL5I4pGs2tstA8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vy8Yl-00AJih-0P; Thu, 05 Mar 2026 14:16:11 +0100
Date: Thu, 5 Mar 2026 14:16:10 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Po-Yu Chuang <ratbert@faraday-tech.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"taoren@meta.com" <taoren@meta.com>
Subject: Re: [PATCH net-next v6 5/5] ARM: dts: aspeed: ast2600-evb: Configure
 RGMII delay for MAC
Message-ID: <70ed84fd-ac9d-4157-ad20-36deec0c5f82@lunn.ch>
References: <20260302-rgmii_delay_2600-v6-0-68319a4c4110@aspeedtech.com>
 <20260302-rgmii_delay_2600-v6-5-68319a4c4110@aspeedtech.com>
 <d38f54b2-4a99-4a54-8403-e4f4a9704386@lunn.ch>
 <SEYPR06MB5134AE0B0042E05E8E58A5239D7DA@SEYPR06MB5134.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SEYPR06MB5134AE0B0042E05E8E58A5239D7DA@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_131654_439215_419B6261 
X-CRM114-Status: GOOD (  30.86  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Mar 05, 2026 at 05:05:03AM +0000, Jacky Chou wrote:
> Hi Andrew,
> 
> Thank you for yor reply.
> 
> > On Mon, Mar 02, 2026 at 06:24:32PM +0800, Jacky Chou wrote:
> > > This change sets the rx-internal-delay-ps and tx-internal-delay-ps
> > > properties to control the RGMII signal delay.
> > > The phy-mode for MAC0–MAC3 is updated to "rgmii-id" to enable TX/RX
> > > internal delay on the PHY and disable the corresponding delay on the
> > > MAC.
> > >
> > > Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
> > > ---
> > >  arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts | 20
> > > ++++++++++++++++----
> > >  1 file changed, 16 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
> > > b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
> > > index 3f2ca9da0be2..a2a1c1dbb830 100644
> > > --- a/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
> > > +++ b/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dts
> > > @@ -123,42 +123,54 @@ ethphy3: ethernet-phy@0 {
> > >  &mac0 {
> > >  	status = "okay";
> > >
> > > -	phy-mode = "rgmii-rxid";
> > > +	phy-mode = "rgmii-id";
> > >  	phy-handle = <&ethphy0>;
> > >
> > >  	pinctrl-names = "default";
> > >  	pinctrl-0 = <&pinctrl_rgmii1_default>;
> > > +
> > > +	rx-internal-delay-ps = <0>;
> > > +	tx-internal-delay-ps = <0>;
> > 
> > In the binding, you said these default to 0. So you don't need them.
> > 
> > It is also odd that rgmii-rxid becomes rmgii-id, yet both delays are 0?
> > 
> > What was the bootloader doing? This is worth a comment in the commit
> > messages.
> > 
> 
> Before this patch, aspeed-ast2600-evb.dts is an existed old dts in mainline kernel.
> In this series, ftgmac100 for AST2600 will configure the MAC RGMII internal delay
> via SCU register, so this patch is changing this dts as a NEW dts for driver to configure
> RGMII delay from the properties of MAC nodes.
> 
> Old dts: generally, leak tx/rx-internal-delay-ps -> Calculate the RGMII delay that is configured
> from bootloader and decide whether keep the original value
> 
> New dts: In AST2600, we expect the MAC node includes the rx/tx-internal-delay-ns properties
> and the driver directly uses these properties to configure RGMII delay.

You did not answer my question...

> It is also odd that rgmii-rxid becomes rmgii-id, yet both delays are 0?

I could understand "rgmii" becoming "rgmii-id" with both delays being
0. But that is not what you have here. It is starting as
"rgmii-rxid". So the PHY is being asked to insert the RX delay, but
not the TX delay. Where is the TX delay coming from?

I assume the MAC? Has the bootloader configured the MAC to insert the
TX delay? But look at all the board vendors who have been submitting
DT patches, and i've been rejecting them. They all seem to use rgmii,
not rgmii-rxid.

Why is this different to all the other boards? This is what i would
like to see in the commit message, an explanation of this oddness.

> We hope this series can keep the old dts works fine

Hope is not sufficient. Backwards compatibility is required. You need
to convince the reviewer the code changes are backwards
compatible. You can use the commit messages and comments in the code
to explain how backwards compatibility is maintained, while adding
this new functionality.

And once you have convinced me, i will probably ask you to post the
changes to the BMC mailing list, and ask for a few board vendors to
test the patches with old DT blobs, current DT blobs and updated DT
blobs.

And this is why i think fixing the issue in the bootloader is
better. It is much easier to convince a reviewer the changes are
backwards compatible.

	Andrew


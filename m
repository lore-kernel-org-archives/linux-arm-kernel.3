Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF096CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 21:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o6w4t3UC27bwnN6JWA8ZdKSrOmat1bxK0b+u8I2fnrs=; b=HMzox+wP27TeRjSEHM+zcpjazd
	Csnsol3IwXOlrnAAIVnZQbzcv+518RAScnQXehchFUSP5IPkMUuCKk4ViMGUR4VQPqbf7apRHOND1
	K22QYXWzUl2Dpp0ssGAPb+8dyV2scJlnGnvOyxayuw4G3/9wvgrzbDjtnOe0TQpgVzzaNVJsDzKJ1
	ntQqBFgKEmUb1C/Tj7BuVqwvbdpY47SM4gMYxo3ibdFEwZ8m88nh4sV6fEE08386Ip09FQ00FAl0x
	Do7OXpjbB57oSB4GpXHcBiAT1VAdsV9mBGYmhgDILMs9jyOKYexwcQN9yaWgrt7lXKxFUSEhbNBRw
	EX/lQgVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyzKm-0000000ElFp-48EL;
	Wed, 17 Sep 2025 21:05:00 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyzKj-0000000El9Q-3wp2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 21:04:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=o6w4t3UC27bwnN6JWA8ZdKSrOmat1bxK0b+u8I2fnrs=; b=jzmqQ6yIl7UUKBiq97RnIjKZj7
	p34gFEmXC9MwDRV9+6uLT4qFjXNHIf76KL5Y84EFWs4Uce2LBIombd4RQtFq40iJbn+w9qMGhBElA
	cU4fBSc1/vemnhXbuckLVN2/RGWKQr/p3rb9O2IsS03Toq0H5cgnRB7R52igr/ntkn8o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uyzKX-008jg4-51; Wed, 17 Sep 2025 23:04:45 +0200
Date: Wed, 17 Sep 2025 23:04:45 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Rebecca Cran <rebecca@bsdio.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: add device tree for ASRock Rack
 ALTRAD8 BMC
Message-ID: <8b5625a5-56bf-49bc-b4cf-82c60460db65@lunn.ch>
References: <20250917180428.810751-1-rebecca@bsdio.com>
 <20250917180428.810751-3-rebecca@bsdio.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917180428.810751-3-rebecca@bsdio.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_140457_994175_4A61C021 
X-CRM114-Status: GOOD (  17.61  )
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

Hi Rebecca

> +// Connected to host Intel X550 (ALTRAD8UD-1L2T) or
> +// Broadcom BCM57414 (ALTRAD8UD2-1L2Q) interface
> +&mac0 {

Thanks for the comments.

> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rmii1_default>;
> +
> +	clocks = <&syscon ASPEED_CLK_GATE_MAC1CLK>,
> +		 <&syscon ASPEED_CLK_MAC1RCLK>;
> +	clock-names = "MACCLK", "RCLK";
> +
> +	use-ncsi;
> +
> +	nvmem-cells = <&eth0_macaddress>;
> +	nvmem-cell-names = "mac-address";
> +};
> +
> +// Connected to Realtek RTL8211E
> +&mac1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
> +
> +	nvmem-cells = <&eth1_macaddress>;
> +	nvmem-cell-names = "mac-address";
> +};

I see you did not manage to get phy-handle to work.

The problem i have is the lack of phy-mode = "rgmii-id".

Aspeed has a long history have getting phy-mode wrong. This has mainly
affected 2600, but as far as i understand, this is a 2500?

I've been pushing back on any 2600 DT using phy-mode = "rgmii". This
is 99% of the time wrong, since it indicates that the PCB has extra
long clock lines.

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

What aspeed get wrong is that they configure the MAC to insert 2ns
delay. And this is hidden way, in the bootloader. As a result,
PHY_INTERFACE_MODE_RGMII gets passed to phy_connect(), when
PHY_INTERFACE_MODE_RGMII_ID should be passed. Its a case of two wrongs
combine to give a working system.

I've been pushing aspeed to clean up this mess. And to do that, i've
been rejecting DT with phy-mode = "rgmii". Most submissions has ended
up dropping ethernet support, and are now twiddling their thumbs
waiting for aspeed to cleanup the mess. Or anybody actually, there is
enough public information anybody could fix it, and probably end up
with a crate of beer/box of wine, etc.

Now, it is slightly different here. You don't have a phy-mode at
all. And all the other 2500 i looked at also don't have phy-mode
properties. You are relying on

        /* Default to RGMII. It's a gigabit part after all */
        err = of_get_phy_mode(np, &phy_intf);
        if (err)
                phy_intf = PHY_INTERFACE_MODE_RGMII;

This is equally wrong :-(

Now, there was somebody who tried getting around my push back on 2600
by simply deleting the phy-mode, and relying on this fallback code. I
said don't do that. Its just going to cause more problems when the code
gets cleaned up, and we have to remember there is an oddball platform.

At the time, i did not know 2500 was different, and none of the DTs
use phy-mode. So, i'm humming and harring. I set a precedent, no
phy-mode should get a patch rejected. But this is 2500, not 2600.

O.K. I will accept it, for 2500. Since none of the 2500 boards have
it, this is not an oddball platform. If the cleanup breaks it, it will
break all 2500 and that should get noticed pretty quickly.

So, for these two nodes only:

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew


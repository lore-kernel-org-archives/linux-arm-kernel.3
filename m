Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0828CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 17:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9bh8Zf1/wCgm7hCKKwuFvGGD46PcOxs/1JrfZAt/c2U=; b=tZB16AnXuC8zkSHjfehDs4A4Yj
	ZSxadM7DRTqBTfUQw76gh14mMgck9Nn40dVLdue8F/FZETwCw552v0T834hnjei0QGQa62RMjUUc6
	4RMccgXxlirDYzDg/ulD7Dx92ksZqzq42tJr5lDIDEPJbGTMdPBlenCF0dR/bLoRv6QzWIPLmp/La
	qAGa1ti0ubD4XeNT0H5MRA11EJIqokEq8XgH8BiAJpmlehDwj2Xy86E6kf/q+or2nWmOjkf95zA7l
	mz16qoFxvkq7EmfNlG1oQ5FMft+uYn9CXRo3ijUoS5T6Zsl2ckR6POrY4AANZ6ZW4i3VjhDDvSHk8
	yeTP672Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOhCP-00000005huK-2hcT;
	Fri, 20 Dec 2024 17:54:05 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOggr-00000005cGG-3MeL;
	Fri, 20 Dec 2024 17:21:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9bh8Zf1/wCgm7hCKKwuFvGGD46PcOxs/1JrfZAt/c2U=; b=b9J04bGwUCd2FcF0KG/NwT5FSW
	PBst32IBsF8Ad5i9PCNMzrbqNL2UG5fQMdcPbMjSb1gO3aAyzWTJGthxtLqFP2k7ojtEN+GViKEkZ
	j4nrDTLKP1HhQQgH7BZH9Ku4/A2CgElfqcAh8AqONeYRicEUQ3Hi8SA/dXFJYwTrf0M0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tOggl-0023lP-Vc; Fri, 20 Dec 2024 18:21:24 +0100
Date: Fri, 20 Dec 2024 18:21:23 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Alicja Michalska <alicja.michalska@9elements.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: ROCK3B: Correct clock rates for
 Ethernet PHYs
Message-ID: <f3c6fd86-1fd8-4540-a4f4-0c6e3a0e2583@lunn.ch>
References: <20241220163227.1501912-1-alicja.michalska@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220163227.1501912-1-alicja.michalska@9elements.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_092129_840017_3A374154 
X-CRM114-Status: GOOD (  21.86  )
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

On Fri, Dec 20, 2024 at 05:32:27PM +0100, Alicja Michalska wrote:
> Built-in ethernet PHYs did not work on mainline kernel:

Builtin, as within the SoC?
> 
> fe010000.ethernet eth0: Register MEM_TYPE_PAGE_POOL RxQ-0
> fe010000.ethernet eth0: __stmmac_open: Cannot attach to PHY

Not being able to find the PHY has nothing to do with RGMII delays.
If the RGMII delays are wrong, packets will not be
received/transmitted, or they will be corrupt and thrown away with
checksum errors. But the PHY will be found and you can attach to it.

So please leave everything to do with RGMII delays alone, at least
until you have a patch which causes the PHY to be found and attached.
It is likely not broken.

> According to the board design, they need to be configured as output with
> static TX/RX delay. This patch sets it accordingly.
> 
> Signed-off-by: Alicja Michalska <alicja.michalska@9elements.com>
> ---
>  .../boot/dts/rockchip/rk3568-rock-3b.dts      | 68 +++++++++++--------
>  1 file changed, 38 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> index 3d0c1ccfaa79..5350158302e4 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> @@ -183,37 +183,65 @@ &cpu3 {
>  &gmac0 {
>  	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>, <&cru SCLK_GMAC0>;
>  	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>, <&cru CLK_MAC0_2TOP>;
> -	clock_in_out = "input";
> -	phy-handle = <&rgmii_phy0>;
> -	phy-mode = "rgmii-id";
> +	assigned-clock-rates = <0>, <125000000>;
> +	clock_in_out = "output";
>  	phy-supply = <&vcc_3v3>;
> +	phy-mode = "rgmii";

This is wrong. RGMII requires a 2ns delay between the data and clock
lines. One way you can achieve this is by having extra long clock
lines on the PCB. If you have that, you use phy-mode rgmii. If there
are not extra long clock lines, you use rgmii-id, which indicates the
MAC/PHY pair need to insert the delays.

Now vendors very frequently get this wrong, monkeys typing Shakespeare
until something works, with no idea why it works, or if it is correct.
Using the wrong phy-mode, combined with wrong tx_delay and rx_delay
settings cancel each other out and it works. But its just "Two wrongs
make a right". We don't want mainline kernel code working like this.

> +	phy-handle = <&rgmii_phy0>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&gmac0_miim
>  		     &gmac0_tx_bus2
>  		     &gmac0_rx_bus2
>  		     &gmac0_rgmii_clk
> -		     &gmac0_rgmii_bus
> -		     &gmac0_clkinout>;
> +		     &gmac0_rgmii_bus>;
> +	snps,reset-gpio = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
> +	snps,reset-active-low;
> +	snps,reset-delays-us = <0 20000 100000>;

You are adding this here and removing the equivalent from the PHY
node. Using the PHY node properties is the recommended way to do this,
since it is the same for all PHYs, where as the vendor snps,
properties only work for this device.

So, now you have something that works, slowly undo all the changes,
and find what actually made it work. But you need to undo stuff in
pairs. Remove all the RGMII delay related changes and test. Remove the
reset GPIO changes and test, etc.

	Andrew


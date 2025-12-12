Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0568D59F50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 22:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5hB/xgi8wkQ2IXSB8CEixUZsLKng335tdHLW4IL6cEQ=; b=bQ0UnDbnHrFpUA3zjoc5wjbe0W
	L/caZdteKVpRS8mq2bS5666CXv+/qNot40FoMPHyl1IqEN81KOuBBFBT9Lyq0rj3Oo611gWsrUe3/
	p4e3KvSrgKkPj1+0kKGPkvId4VVqW3EDhyZhER4eJJWDePSOjyZ36XspUWy8lMbz9qaMhY1635kmF
	JexZ/Uc5ecI8rLZU2yK4b9s+FjWdChYc7T45o6M9bdkZkRddhq4d+psu2GuHQyhSm35EQvePlVumw
	AXORloxZLYAkPT5nuAbognYqhy4/p2pxAgxlEr+N1pdUmRYfMj6Zn4WA0DWCvBukp22hhiia0baaf
	DqvUup+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUBaB-000000019lg-1aET;
	Fri, 12 Dec 2025 22:25:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUBa5-000000019cj-2OfF;
	Fri, 12 Dec 2025 22:25:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5hB/xgi8wkQ2IXSB8CEixUZsLKng335tdHLW4IL6cEQ=; b=bRf38v9Dq/IgsTZNH8Cr1xcg3k
	REVAA7pjWYHtSUB6SkUzsiynj/AUL6jb7xfjL0VbUktp3EPYh7s4uu9e/snOX1MrJzkMNeU0btS+d
	XePz/oFfZfKwLwMcg4HA7X84G6rNUqL4Qcl54d4gBTp4s0hQPwEYpvEVa7oH5oxyA2Os=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vUBZv-00Go4B-8Q; Fri, 12 Dec 2025 23:25:35 +0100
Date: Fri, 12 Dec 2025 23:25:35 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Adrian Kossmann <adrian.kossmann@posteo.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: Adjust RGMII TXD/RXD delays for
 the Rock Pi E
Message-ID: <57e99fa1-0e59-4129-bcae-b94df46447e7@lunn.ch>
References: <20251212220151.574860-1-adrian.kossmann@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212220151.574860-1-adrian.kossmann@posteo.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_142546_639231_D8DF761C 
X-CRM114-Status: GOOD (  17.12  )
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

On Fri, Dec 12, 2025 at 10:02:24PM +0000, Adrian Kossmann wrote:
> Current RGMII TXD/RXD delay results in link instability
> under load, with throughput eventually dropping to zero.
> Adjust the RGMII TXD/RXD delay values for stable link
> under load and stable Gigabit throughput
> 
> Signed-off-by: Adrian Kossmann <adrian.kossmann@posteo.de>
> ---
> Changes in v2:
> - Changed the patch subject as the last one contained
>   incorrect changes
> - Drop incorrect PHY compatible string change from v1
> - Adjustments to RGMII RX/TX delay values
> - Link to v1: https://lore.kernel.org/linux-rockchip/20251209210658.458506-2-adrian.kossmann@posteo.de/
> 
>  arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts b/arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts
> index a4bdd87d0729..29ff0b8b8f18 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts
> @@ -153,8 +153,8 @@ &gmac2io {
>  	phy-supply = <&vcc_io>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&rgmiim1_pins>;
> -	tx_delay = <0x26>;
> -	rx_delay = <0x11>;
> +	tx_delay = <0x1a>;
> +	rx_delay = <0x14>;
>  	status = "okay";

You cannot see it here, it appears before this context:

&gmac2io {
        assigned-clocks = <&cru SCLK_MAC2IO>, <&cru SCLK_MAC2IO_EXT>;
        assigned-clock-parents = <&gmac_clkin>, <&gmac_clkin>;
        clock_in_out = "input";
        phy-handle = <&rtl8211>;
        phy-mode = "rgmii";

rgmii means the PCB provides the delay. I doubt that is the
case. Please try changing this to rgmii-id, as recommended here:

https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/net/ethernet-controller.yaml#L287

and then try out different rx_delay and tx_delay values.

    Andrew


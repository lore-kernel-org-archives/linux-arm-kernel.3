Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7D2E7DEE0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 13:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WGi/A54YejTHQzh/fZBfu89v313LcQrf2k4eo/rCf0=; b=RZVl3IgGtQU0s0+Gh7NsLr4V6C
	bnCBW3jEUhSXs6BJxrYlL+V0jmnlZWKc54/c1zfoh9YToD09Hxrlyw3LL0VFoqcoZC8phyvEi4c4l
	6cM3wf9WiGP5Gv+w/UDfV2Odzs83CiIefFk7gQFFQkaE5vnmJhq3X/dpOulALIH4AK6aRUVrABif3
	DYGMKsSVNfyaH2aspyFMLfBJZUTz07Xuuo8Kit1Aj+9+fcLJdhNX7G8/uiCRe/wix2XVqAVV9OvRW
	s06YlkHK/NAr8PcCWvgnnIJKa68I0AU6eKrgNVs/pQUZWW6JSlB7qWnQg+TKlZHpakmBzIZ2ebaCX
	ebyzE6EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmuSk-000000053jn-3MkI;
	Mon, 02 Feb 2026 13:59:34 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmuSZ-000000053eu-1g9C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 13:59:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6WGi/A54YejTHQzh/fZBfu89v313LcQrf2k4eo/rCf0=; b=srHzf0q28APUNFsImOjs13e8c/
	eB59sWM2qyWGTXxakwYOFsU6ixk6hzbPiDrvMm1542ZLjns1VLGggDMDnOGOYw0ofoQLMf30sHCZj
	leot7h8AD9/2eVqo0T1YGoAU630yDWtkBy8hivB2ME79j/h3cyMmk5ljrw8TMfQ2rURs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vmuSW-005pd1-JZ; Mon, 02 Feb 2026 14:59:20 +0100
Date: Mon, 2 Feb 2026 14:59:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Mihai Sain <mihai.sain@microchip.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	varshini.rajendran@microchip.com, cristian.birsan@microchip.com,
	balamanikandan.gunasundar@microchip.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, ryan.wanner@microchip.com
Subject: Re: [PATCH 4/5] ARM: dts: microchip: sam9x7: Remove the tx_clk from
 gmac node
Message-ID: <87e0938c-20da-48bc-9bb7-8ca963800dae@lunn.ch>
References: <20260202104025.3781-1-mihai.sain@microchip.com>
 <20260202104025.3781-5-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202104025.3781-5-mihai.sain@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_055923_469268_9921F829 
X-CRM114-Status: GOOD (  16.69  )
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

On Mon, Feb 02, 2026 at 12:40:24PM +0200, Mihai Sain wrote:
> The gmac controller on sam9x7 has no internal pll to generate
> the 125MHz clock source for rgmii mode.
> This clock is generated on external board by eth-phy or
> clock oscillator.
> This change drops the tx_clk entry from gmac node.
> 
> Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/sam9x7.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/microchip/sam9x7.dtsi b/arch/arm/boot/dts/microchip/sam9x7.dtsi
> index 46dacbbd201d..da94865c57e9 100644
> --- a/arch/arm/boot/dts/microchip/sam9x7.dtsi
> +++ b/arch/arm/boot/dts/microchip/sam9x7.dtsi
> @@ -991,7 +991,7 @@ gmac: ethernet@f802c000 {
>  				     <63 IRQ_TYPE_LEVEL_HIGH 3>,	/* Queue 4 */
>  				     <64 IRQ_TYPE_LEVEL_HIGH 3>;	/* Queue 5 */
>  			clocks = <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_PERIPHERAL 24>, <&pmc PMC_TYPE_GCK 24>, <&pmc PMC_TYPE_GCK 67>;
> -			clock-names = "hclk", "pclk", "tx_clk", "tsu_clk";
> +			clock-names = "hclk", "pclk", "tsu_clk";

You drop a clock name, but not a clock?

    Andrew


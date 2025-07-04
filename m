Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036D7C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 22:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qXgDfa2Yyu4j+0+czTszQj2AKnTHBfo9c8a3miXid4s=; b=kioCPf3RO4qy2PJAecGs27J+2B
	a4RmdUNwckxO2iSbMB7m67aZASKDQQjXMTyg7+Z9GEuPKb+7c9slq5ga42Ubr2qrec5SGpc5q+not
	ZPe03kogAj+8bTeyD8fl/JuYh83WJgUDDWuV3flFaY8u5iObtvv6fUZpiYWeI5g+77E3axGUNUJVz
	peSN05UBCWeBH5I1bviMis0frGJ6Fcj3GMg/X+FnK8Kaya/0H81Nz2qEHzI5potiZrPiu8Oo243rb
	Krb7Dr5YBBNTYUrWykFu9cPU6+W7vmKya7MwYpdrl5E4LPSGSTTvbnML5hBllG9MMdSqYAV3AICfT
	4WgyxATQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXp4J-0000000FcGx-1rdW;
	Fri, 04 Jul 2025 22:39:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXp1v-0000000Fc2b-2HJT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 22:37:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CDBB153B;
	Fri,  4 Jul 2025 15:36:58 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E15A83F63F;
	Fri,  4 Jul 2025 15:37:09 -0700 (PDT)
Date: Fri, 4 Jul 2025 23:35:35 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: Fix a100 emac pin function name
Message-ID: <20250704233535.4b026641@minigeek.lan>
In-Reply-To: <20250626080923.632789-2-paulk@sys-base.io>
References: <20250626080923.632789-1-paulk@sys-base.io>
	<20250626080923.632789-2-paulk@sys-base.io>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_153715_673476_CB8D5C87 
X-CRM114-Status: GOOD (  19.40  )
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

On Thu, 26 Jun 2025 10:09:19 +0200
Paul Kocialkowski <paulk@sys-base.io> wrote:

Hi Paul,

> The Allwinner A100/A133 only has a single emac instance, which is
> referred to as "emac" everywhere. Fix the pin names to drop the
> trailing "0" that has no reason to be.

Sorry, but this is wrong. There *is* a second EMAC on the A133 die: it's
indeed not mentioned in the manual, but you can probe its MMIO
registers (@0x5030000), and there is a second syscon register
(@0x03000034). It's mentioned in several BSP code places ([1]).
It seem like no suitable pins are connected on the A133
package, but that should not affect the A100 .dtsi (we use a similar
approach for the H616 and A523).

So I think we should keep the emac0 name.

Cheers,
Andre


[1]
https://github.com/qiaoweibiao/T507_Kernel/blob/main/arch/arm64/boot/dts/sunxi/sun50iw10p1.dtsi


> 
> Fixes: 473436e7647d ("pinctrl: sunxi: add support for the Allwinner A100 pin controller")
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 32 ++++++++++-----------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> index b97de80ae2f3..95b764ee1c0d 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> @@ -546,33 +546,33 @@ static const struct sunxi_desc_pin a100_pins[] = {
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "i2c0"),		/* SCK */
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD1 */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD1 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 0)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "i2c0"),		/* SDA */
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD0 */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD0 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 1)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "i2c1"),		/* SCK */
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXCTL */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* RXCTL */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 2)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "i2c1"),		/* SDA */
>  		  SUNXI_FUNCTION(0x3, "cir0"),		/* OUT */
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* CLKIN */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* CLKIN */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 3)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "uart3"),		/* TX */
>  		  SUNXI_FUNCTION(0x3, "spi1"),		/* CS */
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD1 */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD1 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 4)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> @@ -580,14 +580,14 @@ static const struct sunxi_desc_pin a100_pins[] = {
>  		  SUNXI_FUNCTION(0x2, "uart3"),		/* RX */
>  		  SUNXI_FUNCTION(0x3, "spi1"),		/* CLK */
>  		  SUNXI_FUNCTION(0x4, "ledc"),
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD0 */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD0 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 5)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "uart3"),		/* RTS */
>  		  SUNXI_FUNCTION(0x3, "spi1"),		/* MOSI */
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXCK */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* TXCK */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 6)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> @@ -595,7 +595,7 @@ static const struct sunxi_desc_pin a100_pins[] = {
>  		  SUNXI_FUNCTION(0x2, "uart3"),		/* CTS */
>  		  SUNXI_FUNCTION(0x3, "spi1"),		/* MISO */
>  		  SUNXI_FUNCTION(0x4, "spdif"),		/* OUT */
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXCTL */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* TXCTL */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 7)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> @@ -611,7 +611,7 @@ static const struct sunxi_desc_pin a100_pins[] = {
>  		  SUNXI_FUNCTION(0x2, "dmic"),		/* DATA0 */
>  		  SUNXI_FUNCTION(0x3, "spi2"),		/* CLK */
>  		  SUNXI_FUNCTION(0x4, "i2s2"),		/* BCLK */
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* MDC */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* MDC */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 9)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> @@ -619,7 +619,7 @@ static const struct sunxi_desc_pin a100_pins[] = {
>  		  SUNXI_FUNCTION(0x2, "dmic"),		/* DATA1 */
>  		  SUNXI_FUNCTION(0x3, "spi2"),		/* MOSI */
>  		  SUNXI_FUNCTION(0x4, "i2s2"),		/* LRCK */
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* MDIO */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* MDIO */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 10)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> @@ -642,33 +642,33 @@ static const struct sunxi_desc_pin a100_pins[] = {
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x3, "i2c3"),		/* SCK */
>  		  SUNXI_FUNCTION(0x4, "i2s3"),		/* MCLK */
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* EPHY */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* EPHY */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 13)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 14),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x4, "i2s3"),		/* BCLK */
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD3 */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD3 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 14)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 15),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x4, "i2s3"),		/* LRCK */
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD2 */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD2 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 15)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 16),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x3, "i2s3_dout0"),	/* DOUT0 */
>  		  SUNXI_FUNCTION(0x4, "i2s3_din1"),	/* DIN1 */
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXCK */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* RXCK */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 16)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 17),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x3, "i2s3_dout1"),	/* DOUT1 */
>  		  SUNXI_FUNCTION(0x4, "i2s3_din0"),	/* DIN0 */
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD3 */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD3 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 17)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 18),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> @@ -676,7 +676,7 @@ static const struct sunxi_desc_pin a100_pins[] = {
>  		  SUNXI_FUNCTION(0x2, "cir0"),		/* OUT */
>  		  SUNXI_FUNCTION(0x3, "i2s3_dout2"),	/* DOUT2 */
>  		  SUNXI_FUNCTION(0x4, "i2s3_din2"),	/* DIN2 */
> -		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD2 */
> +		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD2 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 18)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 19),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),



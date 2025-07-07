Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB41DC71130
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 23:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4fXxig7uK3XsDhK/3Q8pc+xwglw6d8lX2d6acBNTEI=; b=p9To0SC2LXx6dzVMJnVF/8xEFu
	GmlkINtJB8x3ycFAogC1LqvuaZy6SO1vNflLWRYVdfep6EStOS+OLmx3aFNqpvVF0qesUJhuWzD0x
	bcZd+NJlq3t62L5qvbYKh1bIymf35F6MYq4i4vhNIT15w7u7oi76hwx3DWRkpkifVD06tfDNjBmVf
	iUw2Rm2D8ohUsmCuv1vs2GnxyF4PO8pvHp/bSapfg62cpIGlVVMx5X83TIzwR8bQyZIwSd/CxwC2Q
	qX+mHGOon9s4Qg9i8vDf2tvG/02rCR8e/tMLn43hFqNn+cjAB7cHrKzyOq40xs8fK40oiY7qcFf1w
	R7l2ZgJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYvOp-00000003n4S-1Mwo;
	Mon, 07 Jul 2025 23:37:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYvMV-00000003mo2-0ykl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 23:35:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D41201595;
	Mon,  7 Jul 2025 16:34:49 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57B293F66E;
	Mon,  7 Jul 2025 16:35:00 -0700 (PDT)
Date: Tue, 8 Jul 2025 00:33:19 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/4] Revert "pinctrl: sunxi: Fix a100 emac pin
 function name"
Message-ID: <20250708003236.059ba94d@minigeek.lan>
In-Reply-To: <20250707165155.581579-2-paulk@sys-base.io>
References: <20250707165155.581579-1-paulk@sys-base.io>
	<20250707165155.581579-2-paulk@sys-base.io>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_163503_367578_5D7C25F6 
X-CRM114-Status: GOOD (  23.13  )
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

On Mon,  7 Jul 2025 18:51:52 +0200
Paul Kocialkowski <paulk@sys-base.io> wrote:

Hi Paul,

> While the A100/A133 chips only expose a single EMAC, the sun50iw10 die
> that they share actually has two such controllers.
> 
> One specific package, the T509 is reported to expose both ports.
> 
> Since we want to keep the pinctrl function names unique accross
> packages of the same die to share a single common base dtsi, keep the
> emac0 naming in order to allow the introduction of the emac1 function
> in the future.
> 
> Note that the original commit also breaks the ABI between the driver
> and the device-tree. It's however unlikely that anybody would have
> complained about that since the a100/a133 port is still very early
> and experimental.
> 
> Fixes: d4775ba60b55 ("pinctrl: sunxi: Fix a100 emac pin function name")
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>

many thanks for sending this, it looks good to me now. I just wonder if
the original patch can be still backed out, I think it would be still
time before the v6.17 PR?

Good to have an explicit revert anyway, to make this case clear.

Cheers,
Andre

> ---
>  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 32 ++++++++++-----------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> index 95b764ee1c0d..b97de80ae2f3 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> @@ -546,33 +546,33 @@ static const struct sunxi_desc_pin a100_pins[] = {
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "i2c0"),		/* SCK */
> -		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD1 */
> +		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD1 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 0)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "i2c0"),		/* SDA */
> -		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD0 */
> +		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD0 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 1)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "i2c1"),		/* SCK */
> -		  SUNXI_FUNCTION(0x5, "emac"),		/* RXCTL */
> +		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXCTL */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 2)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "i2c1"),		/* SDA */
>  		  SUNXI_FUNCTION(0x3, "cir0"),		/* OUT */
> -		  SUNXI_FUNCTION(0x5, "emac"),		/* CLKIN */
> +		  SUNXI_FUNCTION(0x5, "emac0"),		/* CLKIN */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 3)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "uart3"),		/* TX */
>  		  SUNXI_FUNCTION(0x3, "spi1"),		/* CS */
> -		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD1 */
> +		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD1 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 4)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> @@ -580,14 +580,14 @@ static const struct sunxi_desc_pin a100_pins[] = {
>  		  SUNXI_FUNCTION(0x2, "uart3"),		/* RX */
>  		  SUNXI_FUNCTION(0x3, "spi1"),		/* CLK */
>  		  SUNXI_FUNCTION(0x4, "ledc"),
> -		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD0 */
> +		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD0 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 5)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "uart3"),		/* RTS */
>  		  SUNXI_FUNCTION(0x3, "spi1"),		/* MOSI */
> -		  SUNXI_FUNCTION(0x5, "emac"),		/* TXCK */
> +		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXCK */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 6)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> @@ -595,7 +595,7 @@ static const struct sunxi_desc_pin a100_pins[] = {
>  		  SUNXI_FUNCTION(0x2, "uart3"),		/* CTS */
>  		  SUNXI_FUNCTION(0x3, "spi1"),		/* MISO */
>  		  SUNXI_FUNCTION(0x4, "spdif"),		/* OUT */
> -		  SUNXI_FUNCTION(0x5, "emac"),		/* TXCTL */
> +		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXCTL */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 7)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> @@ -611,7 +611,7 @@ static const struct sunxi_desc_pin a100_pins[] = {
>  		  SUNXI_FUNCTION(0x2, "dmic"),		/* DATA0 */
>  		  SUNXI_FUNCTION(0x3, "spi2"),		/* CLK */
>  		  SUNXI_FUNCTION(0x4, "i2s2"),		/* BCLK */
> -		  SUNXI_FUNCTION(0x5, "emac"),		/* MDC */
> +		  SUNXI_FUNCTION(0x5, "emac0"),		/* MDC */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 9)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> @@ -619,7 +619,7 @@ static const struct sunxi_desc_pin a100_pins[] = {
>  		  SUNXI_FUNCTION(0x2, "dmic"),		/* DATA1 */
>  		  SUNXI_FUNCTION(0x3, "spi2"),		/* MOSI */
>  		  SUNXI_FUNCTION(0x4, "i2s2"),		/* LRCK */
> -		  SUNXI_FUNCTION(0x5, "emac"),		/* MDIO */
> +		  SUNXI_FUNCTION(0x5, "emac0"),		/* MDIO */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 10)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> @@ -642,33 +642,33 @@ static const struct sunxi_desc_pin a100_pins[] = {
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x3, "i2c3"),		/* SCK */
>  		  SUNXI_FUNCTION(0x4, "i2s3"),		/* MCLK */
> -		  SUNXI_FUNCTION(0x5, "emac"),		/* EPHY */
> +		  SUNXI_FUNCTION(0x5, "emac0"),		/* EPHY */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 13)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 14),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x4, "i2s3"),		/* BCLK */
> -		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD3 */
> +		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD3 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 14)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 15),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x4, "i2s3"),		/* LRCK */
> -		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD2 */
> +		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD2 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 15)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 16),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x3, "i2s3_dout0"),	/* DOUT0 */
>  		  SUNXI_FUNCTION(0x4, "i2s3_din1"),	/* DIN1 */
> -		  SUNXI_FUNCTION(0x5, "emac"),		/* RXCK */
> +		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXCK */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 16)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 17),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x3, "i2s3_dout1"),	/* DOUT1 */
>  		  SUNXI_FUNCTION(0x4, "i2s3_din0"),	/* DIN0 */
> -		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD3 */
> +		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD3 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 17)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 18),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> @@ -676,7 +676,7 @@ static const struct sunxi_desc_pin a100_pins[] = {
>  		  SUNXI_FUNCTION(0x2, "cir0"),		/* OUT */
>  		  SUNXI_FUNCTION(0x3, "i2s3_dout2"),	/* DOUT2 */
>  		  SUNXI_FUNCTION(0x4, "i2s3_din2"),	/* DIN2 */
> -		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD2 */
> +		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD2 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 18)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 19),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),



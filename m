Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC474E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 16:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YkkA5HSd8oa0/bYcck7zTmN8WUtQscBIW9xJmyRvRmQ=; b=xUotXyv42zCXgnucsOaxkNMRQS
	587Eg1iVp9o1TYkKJzVzcY6jDhNpQXU9CE7wkgERG8J5MTrcHYkluvUzVTAD+HjMAravf4flZUK0P
	fwnvueyUHwXux/okkNFEJxfyTJG/y/hGiE+Qphhj1L92pDUSuhIqg7pqU4sJ2S1oFFwvk88wk6jmn
	stpBdyfqOup1oR9kitGmJRcPKsPIEggfGyTrPH40p3smFAo5wNvv4TkQb0Cz6946HxpvKlBVfvlFJ
	FLSFaJhZP/0wN8Zg6sGni7h8lYI4IVJWQwnrhnpM67XljQyN1FWVNIzu9PCIIwSZRVV9rkYLh2+Vl
	qQfo3AGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXjMs-00000008xCV-2i1B;
	Tue, 14 Jan 2025 16:02:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXjLc-00000008wq2-1EOu;
	Tue, 14 Jan 2025 16:00:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68F4C11FB;
	Tue, 14 Jan 2025 08:01:21 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A3A23F673;
	Tue, 14 Jan 2025 08:00:48 -0800 (PST)
Date: Tue, 14 Jan 2025 16:00:45 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Parthiban Nallathambi <parthiban@linumiz.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin
 Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Linus
 Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH RESEND 10/22] pinctrl: sunxi: add missed lvds pins for
 a100/a133
Message-ID: <20250114160045.2baacdaa@donnerap.manchester.arm.com>
In-Reply-To: <20241227-a133-display-support-v1-10-abad35b3579c@linumiz.com>
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
	<20241227-a133-display-support-v1-10-abad35b3579c@linumiz.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_080056_414139_9FEE26ED 
X-CRM114-Status: GOOD (  16.56  )
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

On Fri, 27 Dec 2024 18:30:59 +0530
Parthiban Nallathambi <parthiban@linumiz.com> wrote:

Hi,

since LinusW wants to pull this already, I gave it a look, despite this
series being not complete.

> lvds, lcd, dsi all shares the same GPIO D bank and lvds0
> data 3 lines and lvds1 pins are missed, add them.
> 
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> ---
>  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> index df90c75fb3c5..b97de80ae2f3 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> @@ -256,72 +256,84 @@ static const struct sunxi_desc_pin a100_pins[] = {
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D12 */
> +		  SUNXI_FUNCTION(0x3, "lvds0"),		/* D3P */

I initially stumbled upon those first two pins being from lvds0, with the
other 8 pins missing for this interface, but then realised that those are
on portD, and we already describe them in this table (above). So those two
were missing all the time.

So having compared these lines to the A133 user manual, I can now say that
they are all correct:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Linus, in contrast to what I originally thought, this patch *is* fine, so
feel free to keep it in your tree.
Sorry for the noise!

Cheers,
Andre

>  		  SUNXI_FUNCTION(0x4, "dsi0"),		/* DP3 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 8)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 9),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D13 */
> +		  SUNXI_FUNCTION(0x3, "lvds0"),		/* D3N */
>  		  SUNXI_FUNCTION(0x4, "dsi0"),		/* DM3 */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 9)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 10),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D14 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D0P */
>  		  SUNXI_FUNCTION(0x4, "spi1"),		/* CS */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 10)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 11),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D15 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D0N */
>  		  SUNXI_FUNCTION(0x4, "spi1"),		/* CLK */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 11)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 12),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D18 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D1P */
>  		  SUNXI_FUNCTION(0x4, "spi1"),		/* MOSI */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 12)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 13),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D19 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D1N */
>  		  SUNXI_FUNCTION(0x4, "spi1"),		/* MISO */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 13)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 14),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D20 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D2P */
>  		  SUNXI_FUNCTION(0x4, "uart3"),		/* TX */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 14)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 15),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D21 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D2N */
>  		  SUNXI_FUNCTION(0x4, "uart3"),		/* RX */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 15)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 16),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D22 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* CKP */
>  		  SUNXI_FUNCTION(0x4, "uart3"),		/* RTS */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 16)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 17),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* D23 */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* CKN */
>  		  SUNXI_FUNCTION(0x4, "uart3"),		/* CTS */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 17)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 18),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* CLK */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D3P */
>  		  SUNXI_FUNCTION(0x4, "uart4"),		/* TX */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 18)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 19),
>  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>  		  SUNXI_FUNCTION(0x1, "gpio_out"),
>  		  SUNXI_FUNCTION(0x2, "lcd0"),		/* DE */
> +		  SUNXI_FUNCTION(0x3, "lvds1"),		/* D3N */
>  		  SUNXI_FUNCTION(0x4, "uart4"),		/* RX */
>  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 2, 19)),
>  	SUNXI_PIN(SUNXI_PINCTRL_PIN(D, 20),
> 



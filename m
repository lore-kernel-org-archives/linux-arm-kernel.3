Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077C3E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 09:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ARhTSA0nJgY861KMeIETbOAYL9L6U0TmGU7S3PEN8Qc=; b=34eD6kQi0DmV3iG3jFiE9G5iLg
	6YZuartLKQ1A3Hnrvlao4y8muYOJeBFT55Hu0Wcx/cCgIVprKuKEp72w/2/W08gR+R8RgToU/YXyn
	ley+GjpK05YaQxR/35hg3JpGwLAMsd9LYJeUzuIIy2aCw0u4eIHW/ylgOlfr3uU2PNfGXmzvnHyma
	IKvYiCKknZ41qCDlZhG9iVpe1X9FAAZg8NZ6A0vwSIurGOY2UWLBgQ4yuLTr5vJSbNDtoUFvKESLs
	91rSsPfDjf0sXO7pPTtyjBA8IrFCa22PpFigp8zBHU27UQ4+llP8G/0rcrZxt3fl7u7l0kAuAXi+V
	pGQgcXCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKZzD-000000074n4-2MaX;
	Mon, 09 Dec 2024 09:23:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKZyB-000000074fB-0RIw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 09:22:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7A960A40321;
	Mon,  9 Dec 2024 09:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 266EFC4CED1;
	Mon,  9 Dec 2024 09:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733736141;
	bh=y4qWf57LvAAFe4m8BlvFFvxUPawjnJVFQg2SuHEoOW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RzrHPMOXfNrjB31QWk35WWoGqza4GiNx+L0Ce7gAja7Eh2TKu4l1uswCzkxeXC7km
	 s2dw/bIeFqhNiH4U49DA8xVxl7VQFtRz5pk09r70MDqPMq3zQaTdkM8/wWdtOLolFj
	 DpOuZdigVGk0DSkTRtt84dTdpZgFgQYCMpsM8df/7nClaHzI62T9tL+WbQTrISifn6
	 WwDDJCJoLPgOJCJfZxzZLduJ3mhUZ8KNdau4vVwXoANGm5pl7o3SgzTPJAjATPBVJv
	 HYDgzfxzt9qUaP6gfsbC30Zb8x+O6A/AmTOjf8PIHDTTbEvJCPPus6sUV/8GX2Hjx1
	 cXi1QIf+jVYlA==
Date: Mon, 9 Dec 2024 10:22:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>, y@krzk-bin
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
Message-ID: <bqn4tddl3kgle7zlamgaqlh45pizw6gf5qjwlmcsbkb6fx343l@tf5w63xursi2>
References: <20241207130433.30351-1-towinchenmi@gmail.com>
 <20241207130433.30351-3-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241207130433.30351-3-towinchenmi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_012223_280298_EBF6999F 
X-CRM114-Status: GOOD (  27.10  )
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

On Sat, Dec 07, 2024 at 09:03:15PM +0800, Nick Chan wrote:
> Add driver for backlight controllers attached via Apple DWI 2-wire
> interface, which is found on some Apple iPhones, iPads and iPod touches
> with a LCD display.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  drivers/video/backlight/Kconfig  |  12 +++
>  drivers/video/backlight/Makefile |   1 +
>  drivers/video/backlight/dwi_bl.c | 124 +++++++++++++++++++++++++++++++
>  3 files changed, 137 insertions(+)
>  create mode 100644 drivers/video/backlight/dwi_bl.c
> 
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index 3614a5d29c71..e64cc3d51ac5 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -166,6 +166,18 @@ config BACKLIGHT_EP93XX
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called ep93xx_bl.
>  
> +config BACKLIGHT_APPLE_DWI
> +	tristate "Apple DWI 2-Wire Interface Backlight Driver"
> +	depends on ARCH_APPLE || COMPILE_TEST
> +	default y
> +	help
> +          Say Y to enable the backlight driver for backlight controllers
> +          attached via the Apple DWI 2-wire interface which is found in some
> +          Apple iPhones, iPads and iPod touches.

Mixed/messed indentation. Some spaces?

> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called dwi_bl.
> +
>  config BACKLIGHT_IPAQ_MICRO
>  	tristate "iPAQ microcontroller backlight driver"
>  	depends on MFD_IPAQ_MICRO
> diff --git a/drivers/video/backlight/Makefile b/drivers/video/backlight/Makefile
> index 8fc98f760a8a..0a569d7f0210 100644
> --- a/drivers/video/backlight/Makefile
> +++ b/drivers/video/backlight/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_BACKLIGHT_BD6107)		+= bd6107.o
>  obj-$(CONFIG_BACKLIGHT_CLASS_DEVICE)	+= backlight.o
>  obj-$(CONFIG_BACKLIGHT_DA903X)		+= da903x_bl.o
>  obj-$(CONFIG_BACKLIGHT_DA9052)		+= da9052_bl.o
> +obj-$(CONFIG_BACKLIGHT_APPLE_DWI)	+= dwi_bl.o

Please do not introduce other sorting way - it is sorted by config name.
Which will also point you to apple_bl.o and need of explaining the
differences, e.g. why this cannot be one driver.


>  obj-$(CONFIG_BACKLIGHT_EP93XX)		+= ep93xx_bl.o
>  obj-$(CONFIG_BACKLIGHT_GPIO)		+= gpio_backlight.o
>  obj-$(CONFIG_BACKLIGHT_HP680)		+= hp680_bl.o
> diff --git a/drivers/video/backlight/dwi_bl.c b/drivers/video/backlight/dwi_bl.c
> new file mode 100644
> index 000000000000..d4bfd74b3129
> --- /dev/null
> +++ b/drivers/video/backlight/dwi_bl.c
> @@ -0,0 +1,124 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Driver for backlight controllers attached via Apple DWI 2-wire interface
> + *
> + * Copyright (c) 2024 Nick Chan <towinchenmi@gmail.com>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
> +#include <linux/backlight.h>
> +
> +#define DWI_BL_CTL			0x0
> +#define DWI_BL_CTL_SEND1		BIT(0)
> +#define DWI_BL_CTL_SEND2		BIT(4)
> +#define DWI_BL_CTL_SEND3		BIT(5)
> +#define DWI_BL_CTL_LE_DATA		BIT(6)
> +/* Only used on Apple A9 and later */
> +#define DWI_BL_CTL_SEND4		BIT(12)
> +
> +#define DWI_BL_CMD			0x4
> +#define DWI_BL_CMD_TYPE			GENMASK(31, 28)
> +#define DWI_BL_CMD_TYPE_SET_BRIGHTNESS	0xa
> +#define DWI_BL_CMD_DATA			GENMASK(10, 0)
> +
> +#define DWI_BL_CTL_SEND			(DWI_BL_CTL_SEND1 | \
> +					 DWI_BL_CTL_SEND2 | \
> +					 DWI_BL_CTL_SEND3 | \
> +					 DWI_BL_CTL_LE_DATA | \
> +					 DWI_BL_CTL_SEND4)
> +
> +#define DWI_BL_MAX_BRIGHTNESS		2047
> +
> +struct apple_dwi_bl {
> +	void __iomem *base;
> +};
> +
> +static int dwi_bl_update_status(struct backlight_device *bl)
> +{
> +	struct apple_dwi_bl *dwi_bl = bl_get_data(bl);
> +
> +	int brightness = backlight_get_brightness(bl);
> +
> +	u32 cmd = 0;
> +
> +	cmd |= FIELD_PREP(DWI_BL_CMD_DATA, brightness);
> +	cmd |= FIELD_PREP(DWI_BL_CMD_TYPE, DWI_BL_CMD_TYPE_SET_BRIGHTNESS);
> +
> +	writel(cmd, dwi_bl->base + DWI_BL_CMD);
> +	writel(DWI_BL_CTL_SEND, dwi_bl->base + DWI_BL_CTL);
> +
> +	return 0;
> +}
> +
> +static int dwi_bl_get_brightness(struct backlight_device *bl)
> +{
> +	struct apple_dwi_bl *dwi_bl = bl_get_data(bl);
> +
> +	u32 cmd = readl(dwi_bl->base + DWI_BL_CMD);
> +
> +	return FIELD_GET(DWI_BL_CMD_DATA, cmd);
> +}
> +
> +static const struct backlight_ops dwi_bl_ops = {
> +	.options = BL_CORE_SUSPENDRESUME,
> +	.get_brightness = dwi_bl_get_brightness,
> +	.update_status	= dwi_bl_update_status
> +};
> +
> +static int dwi_bl_probe(struct platform_device *dev)
> +{
> +	struct apple_dwi_bl *dwi_bl;
> +	struct backlight_device *bl;
> +	struct backlight_properties props;
> +	struct resource *res;
> +
> +	dwi_bl = devm_kzalloc(&dev->dev, sizeof(struct apple_dwi_bl), GFP_KERNEL);

sizeof(*)

> +	if (!dwi_bl)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -ENXIO;
> +
> +	dwi_bl->base = devm_ioremap_resource(&dev->dev, res);

Use helper for these two, devm_platform_get_and_ioremap_resource() or
similar.

Best regards,
Krzysztof



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DBBE77199
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 11:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z37JkDaN0t6JXoFx1vBz+p4KCXNj7qhzt5gFvExyr7w=; b=A2MWQiFT2c6aexgfpte5xRf3B6
	sjirgL83j9nYjxbS592fiArudTrns8kjb5kKruPSTpzjAM4xUk3jKNsuQdcC+QnGK6dlwt0KALem8
	Q/K5EM14OBymK6ORTjZD4ZZnaKbAj7mzVdJAO+R4UtaCCpoV+UcxBIvS4sDxa+TK7Yt3bY/wSSquT
	2g3o1/4Qs8YxAMbp1q3QiiaxgJ4F6iXAWmBlVoUVAts4tle1S1pdqSR9tsBvALYdm/+jIi0q2TOVd
	rzfCQ1QHCV2DrggZRTWz73vR1/d8WPPxF94nLPp2kq6lg/eflpV57K1e8zRlUhxsZIruS59DxzF44
	wAnYUcWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVTp4-000000087SX-2M3L;
	Wed, 08 Jan 2025 11:02:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVTg5-000000084MR-2A4M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 10:52:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F3D915C070B;
	Wed,  8 Jan 2025 10:52:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61BD8C4CEDD;
	Wed,  8 Jan 2025 10:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736333564;
	bh=BUkcEIZO72zG0bmSzzrHuBtmboN5338uqDoQVUVBraU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qPyZgo075e0ivgTjrIrZ1ezJszqrsrblWv3plRZKkE7lDx5MBcl6MxAlahkjMIsFN
	 BZQdSDHwj/yC1EKNXJhsqVGT978YcXPP0IJ5UlgxsTSm28EgPXjEKQv68E6R78SOVc
	 5izTa3NcOTbULgiLpQXfBqMbOTYiw1nhQw+XpfO92YbBHsqubxE1GEppQ1yJiWACCd
	 GSHsQ+P47ZH3cMpBRMFrwjDg1O9+Y2XCtri32i3MEsjBJYHlk6bhasiKf1h/VytRra
	 KOSBaY6mWyPa6ptojEl/+dolGsARtVPVcvPjWp49IG7HnRBTdUOx43gTcDcA8NIgl4
	 RGG7hTZqWBRzg==
Date: Wed, 8 Jan 2025 10:52:38 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/3] backlight: dwi_bl: Add Apple DWI backlight driver
Message-ID: <Z35Y9rzS6tLVgsRo@aspen.lan>
References: <20241211113512.19009-1-towinchenmi@gmail.com>
 <20241211113512.19009-3-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211113512.19009-3-towinchenmi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_025245_641029_9CB8C881 
X-CRM114-Status: GOOD (  25.62  )
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

On Wed, Dec 11, 2024 at 07:34:38PM +0800, Nick Chan wrote:
> Add driver for backlight controllers attached via Apple DWI 2-wire
> interface, which is found on some Apple iPhones, iPads and iPod touches
> with a LCD display.
>
> Although there is an existing apple_bl driver, it is for backlight
> controllers on Intel Macs attached via PCI, which is completely different
> from the Samsung-derived DWI block.
>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  drivers/video/backlight/Kconfig  |  12 +++
>  drivers/video/backlight/Makefile |   1 +
>  drivers/video/backlight/dwi_bl.c | 122 +++++++++++++++++++++++++++++++

I'd rather this was called apple_dwi_bl.c to match that config options,
etc.

> diff --git a/drivers/video/backlight/dwi_bl.c b/drivers/video/backlight/dwi_bl.c
> new file mode 100644
> index 000000000000..59e5cad0fbd8
> --- /dev/null
> +++ b/drivers/video/backlight/dwi_bl.c
> @@ -0,0 +1,122 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Driver for backlight controllers attached via Apple DWI 2-wire interface
> + *
> + * Copyright (c) 2024 Nick Chan <towinchenmi@gmail.com>
> + */
> +
> +#include <linux/backlight.h>
> +#include <linux/bitfield.h>
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
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
> +	dwi_bl = devm_kzalloc(&dev->dev, sizeof(*dwi_bl), GFP_KERNEL);
> +	if (!dwi_bl)
> +		return -ENOMEM;
> +
> +	dwi_bl->base = devm_platform_get_and_ioremap_resource(dev, 0, &res);
> +	if (IS_ERR(dwi_bl->base))
> +		return PTR_ERR(dwi_bl->base);
> +
> +	memset(&props, 0, sizeof(struct backlight_properties));
> +	props.type = BACKLIGHT_RAW;
> +	props.max_brightness = DWI_BL_MAX_BRIGHTNESS;

There should be something to indicate whether the backlight controls are
linear or logarithmic here.


> +static struct platform_driver dwi_bl_driver = {
> +	.driver		= {
> +		.name	= "dwi-bl",

Again, I'd rather see apple here too (although, to be clear, I'm
perfectly happy with all the static functions and variables being
prefixed only with dwi_bl).


Daniel.


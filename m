Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B35E9E2EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 11:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DhOrUnGDwOZpo3bOt2i0FPNOeyumTwoy45hxUXnS4/8=; b=CaAITImF9ASFVnkTBixG3I/kAq
	1pgMVsyfAGO+FquM6o/kq+jtYoIK6u9LjahCkeNv9A8z5lR6j+OPLFovVKIeKO8Hj5UwaJ/+0YvT5
	IPLRmwaXzaBX99aOa8sFdEmOvof/7ROiaabdzJN7PUo5ryAR518d1SUj3qdYUYelgUBDlo7f5JZwi
	OQtC+qMdLecGTvDNPmeN8SNJq/jAikv2uvDUPyBYwILtoQOzTsrUX0JkADMDfVSPTd5xbAyC+VIJB
	QV2HziIJFIrnN/zqoRhhEhEKDCz9XPlEyCzEAIHqCuP6FJBOd4Id96kjKTnOMp3g3CNBBNuFLgvjx
	EqofoX+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq8cl-00000000aN4-0gx4;
	Wed, 11 Feb 2026 11:43:15 +0000
Received: from lahtoruutu.iki.fi ([185.185.170.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq8ci-00000000aMA-0OKZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 11:43:13 +0000
Received: from darkstar.musicnaut.iki.fi (85-76-68-182-nat.elisa-mobile.fi [85.76.68.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4f9xPt08zKz49Q5P;
	Wed, 11 Feb 2026 13:42:57 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1770810180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DhOrUnGDwOZpo3bOt2i0FPNOeyumTwoy45hxUXnS4/8=;
	b=DHHF9SwoEIPPqb1Y95d96Dt7mnLOB6bZ/bkgDivsT85keHGXrYr0sNt/QITeY+i7xuX/qY
	dqVZO+QfgHBIKP9uiswFR4b+5ylbsEHjsBzStbjIVVrpTN2wpMP0wt6HGUfQbnFEak4/hW
	SaEZWYlnZ+OBS986J36tyGCul49nPk28URyfU20u5I5DCyVUVXtx5bMYPZPA7NWkDnfoCZ
	d7KRxOSlRtuUO0y4xvQZG61tGkmPKLGJR/Qs3bXz2jY0joTnGZBd0I2dxKZ0hD3+KBdl8d
	GknhHK7qfmCusQEkr9d9jpKQyUN3YTvvmOHAsUrt7iqrCjcP+Ibvowk8jEErSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1770810180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DhOrUnGDwOZpo3bOt2i0FPNOeyumTwoy45hxUXnS4/8=;
	b=kwHhvmP76adQ9GjuBxjK18his0ITyXZ/MVl/VP5Z2HT2Ra5syNgFTvtm6haggsi8AS5mlB
	ODkd5tkIttpHskQ/Cf1WKrXhyO6SucdJ6zTaHHzIUc7gVa1h0/Oy0py8+pzOHdKS0k00xR
	wJbJ3wSFL5uT6LcUpMUb4395JZUaf5EcmWI4TCglqbi3m6/BXZWIbM2W8ykn79aQl3wfUh
	e0UrqFKkSu2l6ge16LZv94Zk2P6qY0SDSBQ4BcFkI7TOK7gxtfumIcAu0GeFogIVNSuETk
	9LhviI5l35OKvxKvrgfn0P5Np5Xwdm+MHnWO+JLDy7yWphhxFR9n8s66WBvKtA==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1770810180;
	b=h+1Dg5tV5VH25sWJZB5zOqYCICtpnQfyQvt10BBA0dJeuN5uKT1InH4KAsGAmriRUfvh20
	/TvpT5jmo+5M43hB0mpw2FhRA0r1//mO15rFts1pYiGchNqkyo345h/Fs+ZJL2eY0I4HtP
	9Q8hgOOJp54GwKffFPssEoO8nTwpCsSwpRBRzgPDjLTNrBDTezJAEfVgqc0W2OCbIKdfpJ
	ntIkpsX3hfwKBRIitI5azzZapwxDBpLZngrlaU6XryFFDnZAZOEX5YJ/Y69RoHkVR+Gr3K
	lcZaVB9l9xU4nis2MK1GVvSyidRe4PJovfDyS7gcZyy4f3VjLPzFLq9MBbde2g==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
Date: Wed, 11 Feb 2026 13:42:56 +0200
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>, Hans de Goede <hansg@kernel.org>,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, brgl@kernel.org
Subject: Re: [RFT PATCH] ARM: omap1: enable real software node lookup of
 GPIOs on Nokia 770
Message-ID: <aYxrQDFxcQ6G-tbB@darkstar.musicnaut.iki.fi>
References: <20260211111449.122593-1-bartosz.golaszewski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211111449.122593-1-bartosz.golaszewski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_034312_333451_64B45A28 
X-CRM114-Status: GOOD (  30.02  )
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

Hi,

On Wed, Feb 11, 2026 at 12:14:49PM +0100, Bartosz Golaszewski wrote:
> Currently the board file for Nokia 770 creates dummy software nodes not
> attached in any way to the actual GPIO controller devices and uses the
> fact that GPIOLIB matching swnode's name to the GPIO chip's label during
> software node lookup. This behavior is wrong and we want to remove it.
> To that end, we need to first convert all existing users to creating
> actual fwnode links.
> 
> Create real software nodes for GPIO controllers on OMAP16xx and
> reference them from the software nodes in the nokia board file.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> This is a follow up to the following discussion[1]. I don't have the
> hardware for testing so only build-tested it.

I won't build with CONFIG_I2C_CBUS_GPIO - the CBUS is mandatory, otherwise
the board will power off 30 seconds after the reset.

A.

> [1] https://lore.kernel.org/all/aYkdKfP5fg6iywgr@jekhomev/
> 
>  arch/arm/mach-omap1/board-nokia770.c | 24 ++---------------------
>  arch/arm/mach-omap1/common.h         |  4 ++++
>  arch/arm/mach-omap1/gpio16xx.c       | 29 +++++++++++++++++++++++++++-
>  3 files changed, 34 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/arm/mach-omap1/board-nokia770.c b/arch/arm/mach-omap1/board-nokia770.c
> index a5bf5554800f..a81514c6f92c 100644
> --- a/arch/arm/mach-omap1/board-nokia770.c
> +++ b/arch/arm/mach-omap1/board-nokia770.c
> @@ -36,25 +36,6 @@
>  #include "clock.h"
>  #include "mmc.h"
>  
> -static const struct software_node nokia770_mpuio_gpiochip_node = {
> -	.name = "mpuio",
> -};
> -
> -static const struct software_node nokia770_gpiochip1_node = {
> -	.name = "gpio-0-15",
> -};
> -
> -static const struct software_node nokia770_gpiochip2_node = {
> -	.name = "gpio-16-31",
> -};
> -
> -static const struct software_node *nokia770_gpiochip_nodes[] = {
> -	&nokia770_mpuio_gpiochip_node,
> -	&nokia770_gpiochip1_node,
> -	&nokia770_gpiochip2_node,
> -	NULL
> -};
> -
>  #define ADS7846_PENDOWN_GPIO	15
>  
>  static const unsigned int nokia770_keymap[] = {
> @@ -112,7 +93,7 @@ static const struct omap_lcd_config nokia770_lcd_config __initconst = {
>  };
>  
>  static const struct property_entry nokia770_mipid_props[] = {
> -	PROPERTY_ENTRY_GPIO("reset-gpios", &nokia770_gpiochip1_node,
> +	PROPERTY_ENTRY_GPIO("reset-gpios", &omap16xx_gpio1_swnode,
>  			    13, GPIO_ACTIVE_LOW),
>  	{ }
>  };
> @@ -138,7 +119,7 @@ static const struct property_entry nokia770_ads7846_props[] = {
>  	PROPERTY_ENTRY_U16("ti,x-plate-ohms", 180),
>  	PROPERTY_ENTRY_U16("ti,debounce-tol", 3),
>  	PROPERTY_ENTRY_U16("ti,debounce-rep", 1),
> -	PROPERTY_ENTRY_GPIO("pendown-gpios", &nokia770_gpiochip1_node,
> +	PROPERTY_ENTRY_GPIO("pendown-gpios", &omap16xx_gpio1_swnode,
>  			    ADS7846_PENDOWN_GPIO, GPIO_ACTIVE_LOW),
>  	{ }
>  };
> @@ -318,7 +299,6 @@ static void __init omap_nokia770_init(void)
>  	/* Unmask SleepX signal */
>  	omap_writew((omap_readw(0xfffb5004) & ~2), 0xfffb5004);
>  
> -	software_node_register_node_group(nokia770_gpiochip_nodes);
>  	platform_add_devices(nokia770_devices, ARRAY_SIZE(nokia770_devices));
>  
>  	gpiod_add_lookup_table(&nokia770_irq_gpio_table);
> diff --git a/arch/arm/mach-omap1/common.h b/arch/arm/mach-omap1/common.h
> index 7a7c3d9eb84a..34659b5fc6f0 100644
> --- a/arch/arm/mach-omap1/common.h
> +++ b/arch/arm/mach-omap1/common.h
> @@ -35,6 +35,10 @@
>  #include "soc.h"
>  #include "i2c.h"
>  
> +extern const struct software_node omap16xx_mpu_gpio_swnode;
> +extern const struct software_node omap16xx_gpio1_swnode;
> +extern const struct software_node omap16xx_gpio2_swnode;
> +
>  #ifdef CONFIG_OMAP_SERIAL_WAKE
>  int omap_serial_wakeup_init(void);
>  #else
> diff --git a/arch/arm/mach-omap1/gpio16xx.c b/arch/arm/mach-omap1/gpio16xx.c
> index 55acec22fef4..6eedb87cbf6b 100644
> --- a/arch/arm/mach-omap1/gpio16xx.c
> +++ b/arch/arm/mach-omap1/gpio16xx.c
> @@ -9,6 +9,7 @@
>   */
>  
>  #include <linux/platform_data/gpio-omap.h>
> +#include <linux/property.h>
>  #include <linux/soc/ti/omap1-io.h>
>  
>  #include "hardware.h"
> @@ -55,6 +56,8 @@ static struct omap_gpio_platform_data omap16xx_mpu_gpio_config = {
>  	.regs                   = &omap16xx_mpuio_regs,
>  };
>  
> +const struct software_node omap16xx_mpu_gpio_swnode = { };
> +
>  static struct platform_device omap16xx_mpu_gpio = {
>  	.name           = "omap_gpio",
>  	.id             = 0,
> @@ -99,6 +102,8 @@ static struct omap_gpio_platform_data omap16xx_gpio1_config = {
>  	.regs                   = &omap16xx_gpio_regs,
>  };
>  
> +const struct software_node omap16xx_gpio1_swnode = { };
> +
>  static struct platform_device omap16xx_gpio1 = {
>  	.name           = "omap_gpio",
>  	.id             = 1,
> @@ -122,6 +127,8 @@ static struct resource omap16xx_gpio2_resources[] = {
>  	},
>  };
>  
> +const struct software_node omap16xx_gpio2_swnode = { };
> +
>  static struct omap_gpio_platform_data omap16xx_gpio2_config = {
>  	.bank_width		= 16,
>  	.regs                   = &omap16xx_gpio_regs,
> @@ -155,6 +162,8 @@ static struct omap_gpio_platform_data omap16xx_gpio3_config = {
>  	.regs                   = &omap16xx_gpio_regs,
>  };
>  
> +const struct software_node omap16xx_gpio3_swnode = { };
> +
>  static struct platform_device omap16xx_gpio3 = {
>  	.name           = "omap_gpio",
>  	.id             = 3,
> @@ -183,6 +192,8 @@ static struct omap_gpio_platform_data omap16xx_gpio4_config = {
>  	.regs                   = &omap16xx_gpio_regs,
>  };
>  
> +const struct software_node omap16xx_gpio4_swnode = { };
> +
>  static struct platform_device omap16xx_gpio4 = {
>  	.name           = "omap_gpio",
>  	.id             = 4,
> @@ -201,6 +212,14 @@ static struct platform_device *omap16xx_gpio_dev[] __initdata = {
>  	&omap16xx_gpio4,
>  };
>  
> +static const struct software_node *omap16xx_gpio_swnodes[] __initconst = {
> +	&omap16xx_mpu_gpio_swnode,
> +	&omap16xx_gpio1_swnode,
> +	&omap16xx_gpio2_swnode,
> +	&omap16xx_gpio3_swnode,
> +	&omap16xx_gpio4_swnode,
> +};
> +
>  /*
>   * omap16xx_gpio_init needs to be done before
>   * machine_init functions access gpio APIs.
> @@ -208,7 +227,7 @@ static struct platform_device *omap16xx_gpio_dev[] __initdata = {
>   */
>  static int __init omap16xx_gpio_init(void)
>  {
> -	int i;
> +	int i, ret;
>  	void __iomem *base;
>  	struct resource *res;
>  	struct platform_device *pdev;
> @@ -244,6 +263,14 @@ static int __init omap16xx_gpio_init(void)
>  		iounmap(base);
>  
>  		platform_device_register(omap16xx_gpio_dev[i]);
> +
> +		ret = device_add_software_node(&omap16xx_gpio_dev[i]->dev,
> +					       omap16xx_gpio_swnodes[i]);
> +
> +		if (ret) {
> +			dev_err(&pdev->dev, "Failed to add software node.\n");
> +			return ret;
> +		}
>  	}
>  
>  	return 0;
> -- 
> 2.47.3
> 


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E17C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 00:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QCP4h/2LIOFu84CMjY5+BVjwXFaEw7s+4dPs42APlHc=; b=YPB127pgyjdgkHXan5k9lMRUN+
	NilDJoSR8sWw144Nj3Sf1pcUNP40+RvFZwAswoVBc29UPMRpC9ZCCItKaXcxASGMOJbAOLWDwVnIf
	ekCYn0FJFbt155QVBCOV6RS1ZTQeF5bAHfqWtO7zoDl/9n/Ol/F+13QLX61/9VcRVwmFO6PmRE8M6
	JuO4vVU/ZQz0vc58ReD2d4b4WXvOWHyIjqWkGHw5ilP0v0S+ZxwdmkMvuD+0rO4jLPknZ069faaND
	7c2VkcnbIVrWhw7M71ECBYhW3hjKbRj3v2BHQpRLM/qNIfhTXzcJEicVH3FCPymWuec8L7Ileh6L6
	TrxEKOUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwZb-0000000D9KW-3kgy;
	Fri, 27 Jun 2025 00:04:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUuxs-0000000CvO1-3Gpn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 22:21:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AF81339
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 15:20:44 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A53723F66E
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 15:21:01 -0700 (PDT)
Date: Thu, 26 Jun 2025 23:20:43 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org, patches@opensource.cirrus.com,
	linux-samsung-soc@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFT 3/6] mfd: vexpress-sysreg: set-up software nodes for
 gpio-mmio
Message-ID: <aF3Hu0bMVfkbXdFn@e110455-lin.cambridge.arm.com>
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
 <20250624-gpio-mmio-pdata-v1-3-a58c72eb556a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250624-gpio-mmio-pdata-v1-3-a58c72eb556a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_152104_897252_3BAA1582 
X-CRM114-Status: GOOD (  21.20  )
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

On Tue, Jun 24, 2025 at 03:19:14PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Replace struct bgpio_pdata - that we plan to remove - with software
> nodes containing properties encoding the same values thatr can now be
> parsed by gpio-mmio.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

I'm OK with this going through the GPIO tree.

Best regards,
Liviu

> ---
>  drivers/mfd/vexpress-sysreg.c | 46 ++++++++++++++++++++++++++-----------------
>  1 file changed, 28 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/mfd/vexpress-sysreg.c b/drivers/mfd/vexpress-sysreg.c
> index ef03d6cec9ff6927668d051ca459eb1d8ff7269e..fc2daffc4352cca763cefbf6e17bdd5242290198 100644
> --- a/drivers/mfd/vexpress-sysreg.c
> +++ b/drivers/mfd/vexpress-sysreg.c
> @@ -11,6 +11,7 @@
>  #include <linux/module.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/slab.h>
>  #include <linux/stat.h>
>  
> @@ -37,22 +38,34 @@
>  
>  /* The sysreg block is just a random collection of various functions... */
>  
> -static struct bgpio_pdata vexpress_sysreg_sys_led_pdata = {
> -	.label = "sys_led",
> -	.base = -1,
> -	.ngpio = 8,
> +static const struct property_entry vexpress_sysreg_sys_led_props[] = {
> +	PROPERTY_ENTRY_STRING("label", "sys_led"),
> +	PROPERTY_ENTRY_U32("ngpios", 8),
> +	{ }
>  };
>  
> -static struct bgpio_pdata vexpress_sysreg_sys_mci_pdata = {
> -	.label = "sys_mci",
> -	.base = -1,
> -	.ngpio = 2,
> +static const struct software_node vexpress_sysreg_sys_led_swnode = {
> +	.properties = vexpress_sysreg_sys_led_props,
>  };
>  
> -static struct bgpio_pdata vexpress_sysreg_sys_flash_pdata = {
> -	.label = "sys_flash",
> -	.base = -1,
> -	.ngpio = 1,
> +static const struct property_entry vexpress_sysreg_sys_mci_props[] = {
> +	PROPERTY_ENTRY_STRING("label", "sys_mci"),
> +	PROPERTY_ENTRY_U32("ngpios", 2),
> +	{ }
> +};
> +
> +static const struct software_node vexpress_sysreg_sys_mci_swnode = {
> +	.properties = vexpress_sysreg_sys_mci_props,
> +};
> +
> +static const struct property_entry vexpress_sysreg_sys_flash_props[] = {
> +	PROPERTY_ENTRY_STRING("label", "sys_flash"),
> +	PROPERTY_ENTRY_U32("ngpios", 1),
> +	{ }
> +};
> +
> +static const struct software_node vexpress_sysreg_sys_flash_swnode = {
> +	.properties = vexpress_sysreg_sys_flash_props,
>  };
>  
>  static struct mfd_cell vexpress_sysreg_cells[] = {
> @@ -61,22 +74,19 @@ static struct mfd_cell vexpress_sysreg_cells[] = {
>  		.of_compatible = "arm,vexpress-sysreg,sys_led",
>  		.num_resources = 1,
>  		.resources = &DEFINE_RES_MEM_NAMED(SYS_LED, 0x4, "dat"),
> -		.platform_data = &vexpress_sysreg_sys_led_pdata,
> -		.pdata_size = sizeof(vexpress_sysreg_sys_led_pdata),
> +		.swnode = &vexpress_sysreg_sys_led_swnode,
>  	}, {
>  		.name = "basic-mmio-gpio",
>  		.of_compatible = "arm,vexpress-sysreg,sys_mci",
>  		.num_resources = 1,
>  		.resources = &DEFINE_RES_MEM_NAMED(SYS_MCI, 0x4, "dat"),
> -		.platform_data = &vexpress_sysreg_sys_mci_pdata,
> -		.pdata_size = sizeof(vexpress_sysreg_sys_mci_pdata),
> +		.swnode = &vexpress_sysreg_sys_mci_swnode,
>  	}, {
>  		.name = "basic-mmio-gpio",
>  		.of_compatible = "arm,vexpress-sysreg,sys_flash",
>  		.num_resources = 1,
>  		.resources = &DEFINE_RES_MEM_NAMED(SYS_FLASH, 0x4, "dat"),
> -		.platform_data = &vexpress_sysreg_sys_flash_pdata,
> -		.pdata_size = sizeof(vexpress_sysreg_sys_flash_pdata),
> +		.swnode = &vexpress_sysreg_sys_flash_swnode,
>  	}, {
>  		.name = "vexpress-syscfg",
>  		.num_resources = 1,
> 
> -- 
> 2.48.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 555B7CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 13:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=57QB6xBQ8gqpDfxbeiOlnUmoE2/nos49K0TW7236SFI=; b=Q4jAHiRCD2rhVsFHcBOJJmnFaY
	7Rrsxfr89nsDkrKSH0wc5XT+zyiNYEmd5Eqdf1CA8GsFHCm2e0i2Y7DpaNC9FwlN+lCROZhgmEX0u
	oDJOE+rEcfykt2NXmTm5zGnBJMYArBWj9zBv/6JA4YKGHzS6BIFLPJnegXle8PwQUEG5I3QXGx8aL
	FJZahvoPgW9xI8raWymISFTTuU4ZaIVFqmI85Q3DNi2L84K/KdMsYxb2BRz24P8PupWxdazngPxm9
	eU1HQQueqz0XU9tWDV/zomCi57Hv7wyNbq1k3v/HpfZh2mbH8Bf0pWhUvbfmL/T6JbM6XU1eF2qiL
	dM8Zfx1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0RU-0000000FduS-27UR;
	Thu, 06 Nov 2025 13:54:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0RR-0000000Fdt2-3ndP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 13:54:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 91EA2406F1;
	Thu,  6 Nov 2025 13:54:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 460AAC116D0;
	Thu,  6 Nov 2025 13:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762437261;
	bh=gpGj9lMLnvuz0MT/8CxK0FE+kuoPB2CSVZM/LrsKjdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nQvUOAAzRQ71RP1RFBkIEsamS76gIZw1XnPOymu03j1Qb22RtExWxS+omPqMRNcjN
	 nBuU0Cz7BSw9jbp2vZxe+QD+mXy19WzwfNLbRQms+5Kd5vnyAROdYcvHX1m2u6zj41
	 eNIVCkzPE421CW+xRFXRNFd50RkbqKGtOvaopfNk7fEyaIwn1dgNf2ZjLEvjqsu0MX
	 Lb++LzbcqEGnKinMAryDzTFI0oT7fCa7/7SDIWB2g//lBKQobZupVI5l6UQzi3nSb9
	 M0OvsONVZoN/R368gSI7iDqXgtqC6v/gnNzqGFOr3a7QBzOfMIhvjOBl33IZQ5NORG
	 pZjmnvbxZRCsg==
Date: Thu, 6 Nov 2025 13:54:14 +0000
From: Lee Jones <lee@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v4 03/11] rtc: Add new rtc-macsmc driver for Apple
 Silicon Macs
Message-ID: <20251106135414.GO8064@google.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
 <20251025-macsmc-subdevs-v4-3-374d5c9eba0e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251025-macsmc-subdevs-v4-3-374d5c9eba0e@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_055421_983793_043F0DA3 
X-CRM114-Status: GOOD (  28.48  )
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

On Sat, 25 Oct 2025, James Calligeros wrote:

> From: Hector Martin <marcan@marcan.st>
> 
> Apple Silicon Macs (M1, etc.) have an RTC that is part of the PMU IC,
> but most of the PMU functionality is abstracted out by the SMC.
> On T600x machines, the RTC counter must be accessed via the SMC to
> get full functionality, and it seems likely that future machines
> will move towards making SMC handle all RTC functionality.
> 
> The SMC RTC counter access is implemented on all current machines
> as of the time of this writing, on firmware 12.x. However, the RTC
> offset (needed to set the time) is still only accessible via direct
> PMU access. To handle this, we expose the RTC offset as an NVMEM
> cell from the SPMI PMU device node, and this driver consumes that
> cell and uses it to compute/set the current time.
> 
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Sven Peter <sven@kernel.org>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  MAINTAINERS              |   1 +
>  drivers/rtc/Kconfig      |  11 ++
>  drivers/rtc/Makefile     |   1 +
>  drivers/rtc/rtc-macsmc.c | 141 +++++++++++++++++++++++++
>  4 files changed, 154 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 10f4c0034b5e..3c6322872dd1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2460,6 +2460,7 @@ F:	drivers/nvmem/apple-spmi-nvmem.c
>  F:	drivers/pinctrl/pinctrl-apple-gpio.c
>  F:	drivers/power/reset/macsmc-reboot.c
>  F:	drivers/pwm/pwm-apple.c
> +F:	drivers/rtc/rtc-macsmc.c
>  F:	drivers/soc/apple/*
>  F:	drivers/spi/spi-apple.c
>  F:	drivers/spmi/spmi-apple-controller.c
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index 4a8dc8d0a4b7..e165301d4abb 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -2078,6 +2078,17 @@ config RTC_DRV_WILCO_EC
>  	  This can also be built as a module. If so, the module will
>  	  be named "rtc_wilco_ec".
>  
> +config RTC_DRV_MACSMC
> +	tristate "Apple Mac System Management Controller RTC"
> +	depends on MFD_MACSMC
> +	help
> +	  If you say yes here you get support for RTC functions
> +	  inside Apple SPMI PMUs accessed through the SoC's
> +	  System Management Controller
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called rtc-macsmc.
> +
>  config RTC_DRV_MSC313
>  	tristate "MStar MSC313 RTC"
>          depends on ARCH_MSTARV7 || COMPILE_TEST
> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> index 610a9ee5fd33..32083bd5bb81 100644
> --- a/drivers/rtc/Makefile
> +++ b/drivers/rtc/Makefile
> @@ -93,6 +93,7 @@ obj-$(CONFIG_RTC_DRV_M48T35)	+= rtc-m48t35.o
>  obj-$(CONFIG_RTC_DRV_M48T59)	+= rtc-m48t59.o
>  obj-$(CONFIG_RTC_DRV_M48T86)	+= rtc-m48t86.o
>  obj-$(CONFIG_RTC_DRV_MA35D1)	+= rtc-ma35d1.o
> +obj-$(CONFIG_RTC_DRV_MACSMC)	+= rtc-macsmc.o
>  obj-$(CONFIG_RTC_DRV_MAX31335)	+= rtc-max31335.o
>  obj-$(CONFIG_RTC_DRV_MAX6900)	+= rtc-max6900.o
>  obj-$(CONFIG_RTC_DRV_MAX6902)	+= rtc-max6902.o
> diff --git a/drivers/rtc/rtc-macsmc.c b/drivers/rtc/rtc-macsmc.c
> new file mode 100644
> index 000000000000..05e360277f63
> --- /dev/null
> +++ b/drivers/rtc/rtc-macsmc.c
> @@ -0,0 +1,141 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Apple SMC RTC driver
> + * Copyright The Asahi Linux Contributors
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/mfd/core.h>

Why is this here?

> +#include <linux/mfd/macsmc.h>
> +#include <linux/module.h>
> +#include <linux/nvmem-consumer.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/rtc.h>
> +#include <linux/slab.h>

-- 
Lee Jones [李琼斯]


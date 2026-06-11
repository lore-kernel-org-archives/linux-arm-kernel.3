Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 504D6CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 11:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXbvGxjsbYKAOSuXjFoiX5RrWY+cznGeY+TWkckl1mM=; b=rt4fd1GiyQRuEil5uEN0MG3knq
	QKb39GLjXyYOB0Mrg2DoFpyGG+N2OUJN+ByUhR732j4VMZR+r0ER8B5PdSFKRdGMtpPPB8rnyhswR
	b4fCnD8muQiLMtdG3b4Q0RH4ewlQkgB17E4Uv2jsG/a3PiS/2yoHy8cjcTFDFQCish7URojy28wVN
	sSGt8S/1CfTiF45p2iX6hWk0vTSivYDRijKO2OaZ+mAgtLLLiB76dw8UT+Rvx+5yrhYQpMYbiAzp9
	OcEYUqQuk/bcygz+VQeAqFpScKQOMYV0gDAON5s5pnGqyBkOHe2UlC2NhRLQ1Wbn/7Z0HOiAVraoM
	n7IEW0zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXdDL-00000009H8N-2Fhc;
	Thu, 11 Jun 2026 11:04:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXdDK-00000009H8E-07YN;
	Thu, 11 Jun 2026 11:04:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 41D8960212;
	Thu, 11 Jun 2026 11:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 257FA1F00893;
	Thu, 11 Jun 2026 11:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781175885;
	bh=DXbvGxjsbYKAOSuXjFoiX5RrWY+cznGeY+TWkckl1mM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aCH8ip6yO86ZyM5RRiI3m8OEnA/TqawQ4wlHxYSGqZhTZo2KKwiTPXTjUqgnJqJnI
	 kp+7C9baLAEpHRO79tziW5AsKGHxmQaD8We1Qw/5iGigtapLlquxNPluMLNPlpYuxG
	 XsUBe1pOm7B/L21eJD4ZWePh5lmFTM0MlJlIv00W2Mk2eKQFGyqiRwqCq8TTTAPoGe
	 7gzZ5yY7dGMTiG8t46ExvIbgilFMBuwF9adQ32ZJtB0nEVqUie7n8cRsoHwjQAOo0C
	 TZVzWq+GBjRWMiJQODRtouB3r+857gVp8nNObP+sXwGGE+WOJVyz9h+G0ZSiUjRcCZ
	 XK1naB+iufW2w==
Date: Thu, 11 Jun 2026 16:34:40 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: nuvoton: Add MA35D1 USB2 OTG PHY driver
Message-ID: <aiqWSGCuhAK7hoY9@vaman>
References: <20260604101220.1092822-1-a0987203069@gmail.com>
 <20260604101220.1092822-3-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604101220.1092822-3-a0987203069@gmail.com>
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

On 04-06-26, 18:12, Joey Lu wrote:
> Add a PHY driver for the USB 2.0 PHYs in the Nuvoton MA35D1 SoC,
> intended for use with the EHCI and OHCI host controllers.
> 
> The MA35D1 SoC has two USB ports:
> 
>   - USB0: an OTG port shared between a DWC2 gadget controller and
>     EHCI0/OHCI0 host controllers.  A hardware mux automatically routes
>     the physical USB0 signals to the appropriate controller based on the
>     USB ID pin state.  The DWC2 IP is device-only in hardware,
>     so host-mode operation on USB0 is handled entirely by EHCI0/OHCI0.
> 
>   - USB1: a dedicated host-only port served by EHCI1/OHCI1.
> 
> The driver implements:
>   - Power-On Reset sequence with a guard that skips re-initialization if
>     the PHY is already operational.  This protects PHY0 when the DWC2
>     gadget driver has already run its own init before EHCI0 probes.
>   - Optional resistor calibration trim via nuvoton,rcalcode.
>   - Optional over-current detect polarity via nuvoton,oc-active-high.
>   - For PHY0 only: a USB role switch that exposes the hardware ID pin
>     state (PWRONOTP[16]).
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  drivers/phy/nuvoton/Kconfig          |  15 ++
>  drivers/phy/nuvoton/Makefile         |   1 +
>  drivers/phy/nuvoton/phy-ma35d1-otg.c | 264 +++++++++++++++++++++++++++
>  3 files changed, 280 insertions(+)
>  create mode 100644 drivers/phy/nuvoton/phy-ma35d1-otg.c
> 
> diff --git a/drivers/phy/nuvoton/Kconfig b/drivers/phy/nuvoton/Kconfig
> index d02cae2db315..5fdd13f841e7 100644
> --- a/drivers/phy/nuvoton/Kconfig
> +++ b/drivers/phy/nuvoton/Kconfig
> @@ -10,3 +10,18 @@ config PHY_MA35_USB
>  	help
>  	  Enable this to support the USB2.0 PHY on the Nuvoton MA35
>  	  series SoCs.
> +
> +config PHY_MA35_USB_OTG
> +	tristate "Nuvoton MA35 USB2.0 OTG PHY driver"
> +	depends on ARCH_MA35 || COMPILE_TEST
> +	depends on OF
> +	select GENERIC_PHY
> +	select MFD_SYSCON
> +	select USB_ROLE_SWITCH
> +	help
> +	  Enable this to support the USB2.0 OTG PHY on the Nuvoton MA35
> +	  series SoCs.  This driver handles PHY initialization for the
> +	  EHCI/OHCI host controllers, including per-PHY power-on reset,
> +	  resistor calibration trim, and over-current polarity
> +	  configuration.  For the OTG port (PHY0), it also monitors the
> +	  USB ID pin and registers a USB role switch.
> diff --git a/drivers/phy/nuvoton/Makefile b/drivers/phy/nuvoton/Makefile
> index 2937e3921898..3ecd76f35d7c 100644
> --- a/drivers/phy/nuvoton/Makefile
> +++ b/drivers/phy/nuvoton/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
>  obj-$(CONFIG_PHY_MA35_USB)		+= phy-ma35d1-usb2.o
> +obj-$(CONFIG_PHY_MA35_USB_OTG)		+= phy-ma35d1-otg.o

Have you considered reusing usb2 driver with a different power_on
function? Or handle the differences internally in the driver. There are
few similarities in two and some things are different

-- 
~Vinod


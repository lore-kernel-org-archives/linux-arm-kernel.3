Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA638C982DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 11:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xku0mQ7DlQYT23dIZk7jLMoqOmM1hgklzsAYADSbmPA=; b=uHTg0T8+el3T8RGCJjYVdbvRxP
	QQu9kSFc3biwWp/MDzhZ1Kj6NrRkAE9NmnbwndeI9mkgaF5Hk4hkbTjpfGlijLCGrnssUrN6kSv+T
	3fUDkjLXHGrjjbfbd6AuFfaW2NtWLeYdPwDOH5XhqJz8Q6mcb3bGy6GGPQUAR1tDL5vDhJcE75t48
	YEqmFS6/6chMhaKQ06XWjupmZZBIQcmiKs53mLAgiKGYS/sIiZ4hwftQTvB68Cnomv1shw8ZetjP3
	VTrf9YXN852C0WlWmXIIw36Z8RB6sKR6T6LF7xFyYtdhEYxtw9ByTxDWBjZoHY4bi64uawqhNQ4/1
	vciIyKPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Wo5-0000000EE74-3K5h;
	Fri, 18 Sep 2026 11:31:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Wo4-0000000EE6v-3lrZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 11:31:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A71A540257;
	Fri, 18 Sep 2026 11:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BCB71F00893;
	Fri, 18 Sep 2026 11:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789731064;
	bh=xku0mQ7DlQYT23dIZk7jLMoqOmM1hgklzsAYADSbmPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A6+N6bW2eJ7X4uwztiq31Ufy1pmskigYpnd6qsud3xUqe5gCkkHLsAKZ/duoShy+9
	 +lhzplWdQKyV5N3f/FaXzTRtHKFDZVaDYyMpuQo3nIb8flk7693fRrBetLN+IQFy4i
	 kpDnqL+9bVxNWIBVnOztrL0aY+sAyzMM+BjDTFZ0XMcuKgr+CWPGsJQQBDIFcS1Eom
	 NMyuYaMKjBBf6EsCM/TrTL9wBeKPvH4MLPZkI2vM/YHXSGH0D/s0igK6IN+ZHYrMs7
	 LG++/dv5USnAKDQxbiCu+g5TlBsGkxVpiwss1ev6VqDrRqjIrqP7fWpHx6Ui7xp287
	 dXLwbpjP5MtZQ==
Date: Fri, 18 Sep 2026 13:31:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrew Gaylard <ag@ffroot.co.za>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	qinjian@cqplus1.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux@armlinux.org.uk
Subject: Re: [PATCH 3/4] arm: dts: sunplus: add Tibbo LTPP3G2 board
Message-ID: <20260918-silent-zircon-cuttlefish-bafcbc@quoll>
References: <20260917082632.626614-1-ag@ffroot.co.za>
 <20260917082632.626614-4-ag@ffroot.co.za>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260917082632.626614-4-ag@ffroot.co.za>
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

On Thu, Sep 17, 2026 at 10:26:31AM +0200, Andrew Gaylard wrote:
> Add a DTS for the Tibbo LTPP3G2 board, which uses the Sunplus SP7021
> SoC. The initial DTS was provided by Sunplus Technology Co. and has
> been adapted for upstream with permission.
> 
> The board features eMMC, SPI, a bit-banged I2C EEPROM (Atmel 24C16),
> PWM output to a buzzer, a watchdog, RTC, and two GPIO LEDs (heartbeat
> and MMC activity).
> 
> Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
> ---
>  MAINTAINERS                                   |   6 +
>  arch/arm/boot/dts/sunplus/Makefile            |   5 +-
>  .../dts/sunplus/sunplus-sp7021-ltpp3g2.dts    | 182 ++++++++++++++++++
>  3 files changed, 190 insertions(+), 3 deletions(-)
>  create mode 100644 arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a53620839407..f54a833484a0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3737,6 +3737,12 @@ F:	drivers/reset/reset-sunplus.c
>  F:	include/dt-bindings/clock/sunplus,sp7021-clkc.h
>  F:	include/dt-bindings/reset/sunplus,sp7021-reset.h
>  
> +ARM/TIBBO LTPP3G2 BOARD
> +M:	Andrew Gaylard <ag@ffroot.co.za>
> +L:	linux-arm-kernel@lists.infradead.org
> +S:	Maintained
> +F:	arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts
> +
>  ARM/Synaptics SoC support
>  M:	Jisheng Zhang <jszhang@kernel.org>
>  M:	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> diff --git a/arch/arm/boot/dts/sunplus/Makefile b/arch/arm/boot/dts/sunplus/Makefile
> index 868f2ea0c127..25ba2e530c35 100644
> --- a/arch/arm/boot/dts/sunplus/Makefile
> +++ b/arch/arm/boot/dts/sunplus/Makefile
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_SOC_SP7021) += \
> -	sunplus-sp7021-demo-v3.dtb
> -dtb-$(CONFIG_SOC_SP7021) += \
> -	sunplus-sp7021-demo-v3.dtb
> +	sunplus-sp7021-demo-v3.dtb \
> +	sunplus-sp7021-ltpp3g2.dtb
> diff --git a/arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts b/arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts
> new file mode 100644
> index 000000000000..f91b0de79c3d
> --- /dev/null
> +++ b/arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts
> @@ -0,0 +1,182 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for Tibbo LTPP board G2
> + *
> + * Copyright (C) 2021 Sunplus Technology Co.
> + */
> +
> +/dts-v1/;
> +
> +#include "sunplus-sp7021-achip.dtsi"
> +
> +/ {
> +	compatible = "tibbo,ltpp3g2", "sunplus,sp7021";
> +	model = "Tibbo LTPP3G2";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		bootargs = "console=ttySUP0,115200 earlycon root=/dev/mmcblk0p8 rootwait";

None of above should be here. earlycon is for debugging. Console is
below. root - why booting is fixed to mmc? Why none of other boot
methods are suitable or allowed?

> +		stdout-path = "serial0:115200n8";
> +	};

...

> +	pins_btuart: pinmux_btuart-pins {
> +		sunplus,pins = <
> +			SPPCTL_IOPAD(40, SPPCTL_PCTL_G_PMUX, MUXF_UA4_RX, 0)
> +			SPPCTL_IOPAD(41, SPPCTL_PCTL_G_PMUX, MUXF_UA4_TX, 0)
> +			SPPCTL_IOPAD(56, SPPCTL_PCTL_G_PMUX, MUXF_UA4_RTS, SPPCTL_PCTL_L_ONV)
> +			SPPCTL_IOPAD(49, SPPCTL_PCTL_G_PMUX, MUXF_UA4_CTS, 0)
> +		>;
> +	};
> +
> +	pins_bt_reset: pinmux_bt_reset-pins {

Please follow DTS coding style for naming.

Best regards,
Krzysztof



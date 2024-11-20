Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8C0D6E2DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 09:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDvJaKpZuKLZv305ygSswu5FCuqiJuOt2pFbq/KPmnU=; b=0J5cs5lZ416uXO8JlqAWFmzCDG
	ACZHW1Sry4wQ9ig5DLeGtiQxtky2hstl1ro35p4subyaoFpjq9qaCVh7RRx5xPZSrUgsdgEPrj2ew
	o1a4gq+nUxCdCepJnIdkCYFPg05fjpLaozfJCd+HdM6pm17X2yW8AxrutlLidt2PBcPJkPcKac6UK
	bELJ7ES+rD6HIrewWRJImIB7orPVDcFeBmChpfhe1wRcTxQtAttGeXWgYvoLUJHFO7p0JhJgwjHyr
	PAH0oEY3FblU+5kIIKQ+9VLXunUInsUiS+3JZEtTM27Y8A0DKrkyxRGE9enTh6QTlWuNAC9yzRaLL
	zpKU9X3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDghr-0000000ErUY-1nlt;
	Wed, 20 Nov 2024 09:09:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDggs-0000000Er9N-2Faw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 09:08:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0CC205C57B1;
	Wed, 20 Nov 2024 09:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB3BC4CED0;
	Wed, 20 Nov 2024 09:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732093681;
	bh=IQcj0bjfdOfYI6t7QqB+CTdJu2i+/2bIawSzJun9Uik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oj2jZhdXjtBIQEOsHjFk4BjSvr0ATtxMhD8ujOgIHUXiQ4+ddi0M2p5MPhcAGITT1
	 sFlAkiZhFN3WjK7iwy3JYRt6YqE8ElBaTGHt5u9Fgv72fY/JbBZOPNqadwjEXWctwS
	 7irH3yWcpsf6/DVGimzad81rT6KZ4r7vpgk5I4ELv0DVKaMW/i+TILxAs5XNk6uGzV
	 2GRRd09W1KZZdilgqHVn1kvKK3Te1uslSNh4K2BVZ3U6YcptdkHVnDg/UDemU6eqje
	 L6ePJJ/xeHxJnEy1kp7JqgXB0Rm1dwh7/VVFeTA/0Leb9Z/C1AnryMmV1hksKRoAOQ
	 qjFAa1jk9lu1w==
Date: Wed, 20 Nov 2024 10:07:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH 12/15] ARM: dts: microchip: add support for
 sama7d65_curiosity board
Message-ID: <y5pggfi3mc6so4p53uycvjewnwm6xprl5a7f455dbucnbkuqkq@4uwgltnplxp5>
References: <cover.1732030972.git.Ryan.Wanner@microchip.com>
 <7877f8c4cce78de34a6bdcc13fc78f5f0ebde06b.1732030972.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7877f8c4cce78de34a6bdcc13fc78f5f0ebde06b.1732030972.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_010802_664980_666710E6 
X-CRM114-Status: GOOD (  20.37  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, arnd@arndb.de, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, sboyd@kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, linux-mmc@vger.kernel.org, claudiu.beznea@tuxon.dev, mihai.sain@microchip.com, linux-gpio@vger.kernel.org, dharma.b@microchip.com, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, varshini.rajendran@microchip.com, krzk+dt@kernel.org, romain.sioen@microchip.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Nov 19, 2024 at 09:40:18AM -0700, Ryan.Wanner@microchip.com wrote:
> From: Romain Sioen <romain.sioen@microchip.com>
> 
> Add device tree support for the SAMA7D65 Curiosity board.
> Update the Makefile to include the new device tree file.
> 
> uart6 is related to flexcom6, hence not sorted in alphabetical order.
> 
> Signed-off-by: Romain Sioen <romain.sioen@microchip.com>
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/Makefile          |   3 +
>  .../dts/microchip/at91-sama7d65_curiosity.dts |  89 ++
>  .../arm/boot/dts/microchip/sama7d65-pinfunc.h | 947 ++++++++++++++++++
>  3 files changed, 1039 insertions(+)
>  create mode 100644 arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
>  create mode 100644 arch/arm/boot/dts/microchip/sama7d65-pinfunc.h
> 
> diff --git a/arch/arm/boot/dts/microchip/Makefile b/arch/arm/boot/dts/microchip/Makefile
> index 470fe46433a9..79cd38fdc7da 100644
> --- a/arch/arm/boot/dts/microchip/Makefile
> +++ b/arch/arm/boot/dts/microchip/Makefile
> @@ -12,6 +12,7 @@ DTC_FLAGS_at91-sama5d2_xplained := -@
>  DTC_FLAGS_at91-sama5d3_eds := -@
>  DTC_FLAGS_at91-sama5d3_xplained := -@
>  DTC_FLAGS_at91-sama5d4_xplained := -@
> +DTC_FLAGS_at91-sama7d65_curiosity := -@
>  DTC_FLAGS_at91-sama7g54_curiosity := -@
>  DTC_FLAGS_at91-sama7g5ek := -@
>  dtb-$(CONFIG_SOC_AT91RM9200) += \
> @@ -90,6 +91,8 @@ dtb-$(CONFIG_SOC_SAM_V7) += \
>  	at91-sama5d4_xplained.dtb \
>  	at91-sama5d4ek.dtb \
>  	at91-vinco.dtb
> +dtb-$(CONFIG_SOC_SAMA7D65) += \
> +	at91-sama7d65_curiosity.dtb
>  dtb-$(CONFIG_SOC_SAMA7G5) += \
>  	at91-sama7g54_curiosity.dtb \
>  	at91-sama7g5ek.dtb
> diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> new file mode 100644
> index 000000000000..c307c5a58b74
> --- /dev/null
> +++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + *  at91-sama7d65_curiosity.dts - Device Tree file for SAMA7D65 Curiosity board
> + *
> + *  Copyright (c) 2024 Microchip Technology Inc. and its subsidiaries
> + *
> + *  Author: Romain Sioen <romain.sioen@microchip.com>
> + *
> + */
> +/dts-v1/;
> +#include "sama7d65-pinfunc.h"
> +#include "sama7d65.dtsi"
> +#include <dt-bindings/mfd/atmel-flexcom.h>
> +#include <dt-bindings/pinctrl/at91.h>
> +
> +/ {
> +	model = "Microchip SAMA7D65 Curiosity";
> +	compatible = "microchip,sama7d65-curiosity", "microchip,sama7d65", "microchip,sama7d6", "microchip,sama7";

Please wrap code according to coding style (checkpatch is not a coding
style description but only a tool).

> +
> +	chosen {
> +		bootargs = "rw root=/dev/mmcblk0p2 rootfstype=ext4 rootwait";

Drop, not really correct. My board uses read-only root and ext2.

> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	aliases {
> +		serial0 = &uart6;
> +	};
> +
> +	memory@60000000 {
> +		device_type = "memory";
> +		reg = <0x60000000 0x40000000>;
> +	};
> +};

Best regards,
Krzysztof



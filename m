Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5E7E8FDB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 08:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PmSH0nwcqOBPAw5dGNox+O7VXm9zfy32qSvJh5PFPyA=; b=EQ1m8crbZTP730hHYuCx5awEpX
	CujALHyTtcXWUdjbvtcC7HDNZhNVOmMlgkGIdPhk6Tp0oj2M8azmZNrUUSvZwrnOm+ft+Cywwb/oC
	jjixtTr7rBAIeq0AWT9lZmjCCwvDrLSZQrGz/dBLO7TYywRfSxJn7Wle+T/7LQTLgXdPoH+QPhzuJ
	hnHQ2mDdBeKkgzZoCezaNHztwz3Rd9M55TjnZJnahiPfY8nW9N/cSQQav3H/jf9eP/asB6wxTP0YF
	kkRoodNSz2EIiG06tMYggMYO4CKI8ggzCQWQZCMQj5azS3HrHFn31HI7H21RLkfDiWCo0Q9UVbqvl
	2S4MF5jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va8VC-00000003T8p-0Oyi;
	Mon, 29 Dec 2025 08:21:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va8V8-00000003T8I-1CUN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 08:21:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C18940628;
	Mon, 29 Dec 2025 08:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63E69C116B1;
	Mon, 29 Dec 2025 08:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766996473;
	bh=CupXRn6WjwVywyOpt0njYsg+oPXfAGdmmxZ+dvdVolM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SulfU2/rM2veTBZKTXjI3WpPloI6MIKFSV20tzySslnrXgDVyoUgEf6tGOIN776MU
	 npvDJRZyYaF/HQu0hME8dEJDxH63UdkaAWBffnvnAm5t3okxVsdJu60fz+w2oBO364
	 3wj5HyRRVYaFNaC323Sowzbk0Rb4r3JpPg2cIkLAxA0iP320PcLMM7NUd2DLhvSApu
	 iA2bT/4wN56mC4OJOeBH3SsSUCcuDEXlTWdkiyGB3A6QQZZi7FRXU9rh6Oh0kFcdf4
	 94X89cYoScmNoKZLE8qiQXkNL8SANDnRg4Hj5rNw9BKu/KoU3Yi9LTfbNaM8GU+r5/
	 Tzu0JWoFO16iw==
Date: Mon, 29 Dec 2025 16:21:07 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 4/5] arm64: dts: freescale: Add the GOcontroll
 Moduline IV
Message-ID: <aVI5875EkE3aGBqI@dragon>
References: <20251117-mini_iv-v4-0-5aa63832f51a@gocontroll.com>
 <20251117-mini_iv-v4-4-5aa63832f51a@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117-mini_iv-v4-4-5aa63832f51a@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_002115_175757_6193EB2B 
X-CRM114-Status: GOOD (  17.36  )
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

On Mon, Nov 17, 2025 at 04:01:29PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
> 
> The Moduline IV is a part of the wider GOcontroll Moduline ecosystem. These
> are embedded controllers that focus on modularity with their swappable IO
> modules.
> 
> Features:
> - up to 8 Moduline IO modules
> - 4 CAN busses
> - 1 LIN bus
> - 1 Ethernet
> - 4 RGB leds
> - optional Wi-Fi/Bluetooth
> - optional 4G/GPS
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |   2 +
>  .../imx8mm-tx8m-1610-moduline-iv-306-d.dts         | 800 +++++++++++++++++++++
>  2 files changed, 802 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 525ef180481d..b2fef44e0a37 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -124,6 +124,8 @@ imx8mm-evk-pcie-ep-dtbs += imx8mm-evk.dtb imx-pcie0-ep.dtbo
>  imx8mm-evkb-pcie-ep-dtbs += imx8mm-evkb.dtb imx-pcie0-ep.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-evk-pcie-ep.dtb imx8mm-evkb-pcie-ep.dtb
>  
> +dtb-$(CONFIG_ARCH_MXC) += imx8mm-tx8m-1610-moduline-iv-306-d.dtb
> +
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-icore-mx8mm-ctouch2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-icore-mx8mm-edimm2.2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mm-iot-gateway.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-iv-306-d.dts b/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-iv-306-d.dts
> new file mode 100644
> index 000000000000..01df9d77fa51
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-iv-306-d.dts
> @@ -0,0 +1,800 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Maud Spierings <maudspierings@gocontroll.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "imx8mm-tx8m-1610.dtsi"
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +	chassis-type = "embedded";
> +	compatible = "gocontroll,moduline-iv-306-d", "karo,imx8mm-tx8m-1610", "fsl,imx8mm";
> +	hardware = "Moduline IV V3.06-D";
> +	model = "GOcontroll Moduline IV";
> +
> +	aliases {
> +		usb-host = &usbotg2;
> +		usbotg = &usbotg1;
> +		spi0 = &ecspi2; /* spidev number compatibility */
> +		spi1 = &ecspi3; /* spidev number compatibility */
> +		spi2 = &ecspi1; /* spidev number compatibility */

Can we order aliases alphabetically?

Shawn


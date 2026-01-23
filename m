Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2760D7235E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 09:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XYD1j+fFI82lIgn55ikFEMN+S+tt/o2t8A4pZ9kIgS8=; b=tmr4MOnW2imSJ8NzjWpmfQ0Lyu
	ABl/pxpdlKq25XW8dBNF/eK2WZ/3BA5dhjsDM2pYo+P0U6fbirpuMQX2Kp9dPZf+j79yZjEG17449
	UdU8VQDOk5WMd2LOWMpexkTunr7+jb2+Q7NTYD+cokdC3oyG15kM97wmvIlHz0RkvNZOfHngKaGd4
	ti3YRTuraBXy3taL7DVQoCoil5XVDQSo1azVBlw2xgMQw5vEheQUZgxFf+gihxVmeEbgyo/NZNfmW
	iLa1efFoNflZPkIO3QhgAJzYfc8edrXND6Q5XwV/GigPay/9T2/HlVq0kyL94aExUdQIOEP/kG9ym
	YWerb7Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjD3v-00000008WpK-3XUH;
	Fri, 23 Jan 2026 09:02:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjD3u-00000008WpD-27Vq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 09:02:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B61A60010;
	Fri, 23 Jan 2026 09:02:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0667C4CEF1;
	Fri, 23 Jan 2026 09:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769158957;
	bh=PIa/I7R0BydZfomtSmkapB5g2iSIYkR0v+oP3tOPoZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n735dr/6ogETtT6sqt4DE/Ng81anX6mk40ARL40MDPFpZQnr7lRf41GaGu+4KqdmI
	 Etay7mXNqlH3I99fjMPqHlP64X4sxVRfD+2W98IHZTBkTttfsep85w95vqqk+k1Ghp
	 bMarHx8y1sHTY0ap+UTco0SenlfReRl5Y97jI+GoxuZLFhwu2fANuBZgtC3NM4PTmE
	 VIV0wp/pniVEsx7qbaWh220t+HGkXt5oQ9ArDTZcMQcY4YjNdZuU86SMt4/wnqdgBd
	 gVZYVpSXhf8zUAGSSV4izXhrCnh3G9l70BI1EhRCORqmAgHkTIZRDjg47fV2lQaPLd
	 Lu0Y4u2xQRNwQ==
Date: Fri, 23 Jan 2026 10:02:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, frank.li@nxp.com, s.hauer@pengutronix.de, festevam@gmail.com, 
	daniel.baluta@nxp.com, dario.binacchi@amarulasolutions.com, 
	alexander.stein@ew.tq-group.com, Markus.Niebel@tq-group.com, matthias.schiffer@tq-group.com, 
	y.moog@phytec.de, josua@solid-run.com, francesco.dolcini@toradex.com, 
	primoz.fiser@norik.com, kernel@pengutronix.de, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 2/2] arch: arm64: imx93-wevk: Add i.MX93 Wireless EVK
 board support
Message-ID: <20260123-gifted-wolverine-from-mars-47b9d4@quoll>
References: <20260123024448.3909345-1-sherry.sun@nxp.com>
 <20260123024448.3909345-3-sherry.sun@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260123024448.3909345-3-sherry.sun@nxp.com>
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

On Fri, Jan 23, 2026 at 10:44:48AM +0800, Sherry Sun wrote:
> i.MX93 Wireless SiP is created by integrating i.MX93 and IW610 WLCSP
> (Wi-Fi + BLE + 802.15.4). And i.MX93 Wireless EVK board with the i.MX93
> Wireless SiP basically reuse the i.MX93 11x11 EVK board, with some minor
> functional and pin connection differences.
> 
> Here are the detailed differences between i.MX93 Wireless EVK and i.MX93
> 11x11 EVK board.
> 
> Function differences:
> Function	i.MX93W EVK			i.MX93 EVK
> WIFI/BT		IW610 in i.MX93W		IW612 M.2 module
> MQS		N				Y
> PDM MIC		N				Y
> M.2		N				Y
> RPi 40-pin HDR	Limited support(pin conflict) 	Y
> 
> Pin connection differences:
> Function  Signal name	i.MX93W EVK		i.MX93 EVK
> WIFI/BT	  SPI_FRM	SAI1_TXFS (spi1.PCS0)	GPIO_IO08 (spi3.PCS0)
> 	  SPI_TXD	SAI1_TXC (spi1.SIN)	GPIO_IO09 (spi3.SIN)
> 	  SPI_RXD	SAI1_RXD0 (spi1.SOUT)	GPIO_IO10 (spi3.SOUT)
> 	  SPI_CLK	SAI1_TXD0 (spi1.SCK)	GPIO_IO11 (spi3.SCK)
> 	  SPI_INT	CCM_CLKO1		on-board IO expander
> 	  NB_WAKE_IN	PDM_CLK			on-module IO expander
> 	  WL_WAKE_IN	PDM_BIT_STREAM0		on-module IO expander
> 	  IND_RST_WL	PDM_BIT_STREAM1		on-module IO expander
> 	  IND_RST_NB	GPIO_IO28		on-module IO expander
> 	  PDn		GPIO_IO29		on-module IO expander
> 	  NB_WAKE_OUT	GPIO_IO14		on-board IO expander
> 	  WL_WAKE_OUT	GPIO_IO15		CCM_CLKO1
> I2C3	  I2C3_SDA	GPIO_IO00		GPIO_IO28
> 	  I2C3_SCL	GPIO_IO01		GPIO_IO29
> 
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile       |  1 +
>  arch/arm64/boot/dts/freescale/imx93w-evk.dts | 73 ++++++++++++++++++++
>  2 files changed, 74 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93w-evk.dts
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 700bab4d3e60..d0ea746c59b8 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -418,6 +418,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-14x14-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx93w-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-kontron-bl-osm-s.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx93w-evk.dts b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
> new file mode 100644
> index 000000000000..f09587dc74f6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93w-evk.dts
> @@ -0,0 +1,73 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 NXP
> + */
> +
> +#include "imx93-11x11-evk.dts"
> +
> +/ {
> +	model = "NXP i.MX93W EVK board";
> +	compatible = "fsl,imx93-wireless-evk", "fsl,imx93";
> +
> +	/delete-node/ regulator-m2-pwr;

If you remove nodes then clearly you do not share a common design, thus
you should not include other DTSI... and definitely even more confusing
to include other DTS.

> +
> +	sound-bt-sco {
> +		status = "disabled";
> +	};
> +
> +	sound-micfil {
> +		status = "disabled";

Kind of same here.

It's poor practice to include DTS inside DTS, some platforms disallow
this. Is it acceptable pattern in NXP/iMX?

> +	};
> +};
> +
> +&pcal6524 {
> +	/delete-node/ m2-pcm-level-shifter-hog;

Why do you remove so much?

> +};
> +
> +&reg_usdhc3_vmmc {
> +	/delete-property/ vin-supply;

Do you understand how inclusion works? You claim here you have common
parts. Removing them means they are not common.

Best regards,
Krzysztof



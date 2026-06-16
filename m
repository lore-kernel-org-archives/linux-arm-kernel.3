Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11404CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 10:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1g2CG9IiKEy/YVPbiNnEetF5KBKUdZhApz3+tSzsmiw=; b=LXHo4/cU6ELUHVpnljlXt4SkH8
	3pJuVJfiPBLLz1LQFf+qVCTjT/nHSUesMZ4HEOIM3NMMnp+mxkZdoypnSPqxcezHOIWushmrE2HuN
	soTM6fn8PDqcfP/pnvm1Kdg+sLSXoNyX52lDTSFIfo3PLEmZqfaB9WgG2jfn5MDcGJdgVD6jqllXC
	45LVqeQsnyBOfiFjop2s+P9Ts3JaEngO7RpF2HVdMtVYUcCiH9+oGcyX/mJlvPohvxPbT9bg/DljT
	GxKmgXQ31wE7TbFnipooRA5u62p5qAg98MkbVJfbEKG/sy44ZJOwQz74PA/oNU8WMWONAcg/U8L7B
	SONKnkNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQfS-0000000FZDg-3UA9;
	Tue, 16 Jun 2026 10:05:14 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZQfP-0000000FZCx-2rBC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 10:05:14 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1wZQfH-0003jK-3A; Tue, 16 Jun 2026 12:05:03 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1wZQfG-0030uu-2j;
	Tue, 16 Jun 2026 12:05:02 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1wZQfG-00000008itz-32QJ;
	Tue, 16 Jun 2026 12:05:02 +0200
Date: Tue, 16 Jun 2026 12:05:02 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Liu Ying <victor.liu@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: imx93-11x11-evk: Add DY1212W-4856
 LVDS panel
Message-ID: <nj7yarck53nfnmsa3fafw7iqh6cqwfsm4qmfeig3w5pr3pvof6@cblp4m4aqu2l>
References: <20260610-imx93-ldb-v3-0-c9b65d742753@nxp.com>
 <20260610-imx93-ldb-v3-3-c9b65d742753@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610-imx93-ldb-v3-3-c9b65d742753@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_030511_727581_852DD3EE 
X-CRM114-Status: GOOD (  19.99  )
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

On 26-06-10, Liu Ying wrote:
> DY1212W-4856 [1] is a 12.1" (WXGA) TFT LCD panel with LVDS interface.
> The panel's 40-pin connector allows it to be directly connected to
> i.MX93 11x11 EVK board.
> 
> Link: https://www.nxp.com/design/design-center/development-boards-and-designs/dy1212w-4856-tft-lcd-panel-with-lvds-interface:DY1212W-4856 [1]
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |  4 ++
>  .../freescale/imx93-11x11-evk-dy1212w-4856.dtso    | 81 ++++++++++++++++++++++
>  2 files changed, 85 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 8ddaab127ab9..dbe27d757c86 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -588,6 +588,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-ontat-kd50g21-40nt-a1.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-tianma-tm050rdh03.dtb
>  
>  dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
> +
> +imx93-11x11-evk-dy1212w-4856-dtbs += imx93-11x11-evk.dtb imx93-11x11-evk-dy1212w-4856.dtbo
> +dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk-dy1212w-4856.dtb
> +
>  dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-frdm.dtb
>  
>  imx93-11x11-frdm-pixpaper-dtbs += imx93-11x11-frdm.dtb imx93-11x11-frdm-pixpaper.dtbo
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk-dy1212w-4856.dtso b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-dy1212w-4856.dtso
> new file mode 100644
> index 000000000000..35f7c5699e3a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk-dy1212w-4856.dtso
> @@ -0,0 +1,81 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 NXP
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/imx93-clock.h>
> +
> +&{/} {
> +	panel-lvds {
> +		compatible = "boe,ev121wxm-n10-1850";
> +		backlight = <&backlight_lvds>;
> +		power-supply = <&buck4>;
> +
> +		panel-timing {
> +			/*
> +			 * Set clock frequency to 71142858Hz to accommodate
> +			 * IMX93_CLK_VIDEO_PLL rate at 498000000Hz in a rate
> +			 * table.
> +			 */
> +			clock-frequency = <71142858>;
> +			hactive = <1280>;
> +			vactive = <800>;
> +			hfront-porch = <48>;
> +			hback-porch = <80>;
> +			hsync-len = <32>;
> +			vfront-porch = <3>;
> +			vback-porch = <14>;
> +			vsync-len = <6>;
> +		};
> +
> +		port {
> +			panel_lvds_in: endpoint {
> +				remote-endpoint = <&ldb_lvds_ch0>;
> +			};
> +		};
> +	};
> +};
> +
> +&backlight_lvds {
> +	status = "okay";
> +};
> +
> +&lcdif {
> +	status = "okay";
> +};
> +
> +&lvds_bridge {
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			ldb_lvds_ch0: endpoint {
> +				remote-endpoint = <&panel_lvds_in>;
> +			};
> +		};
> +	};

You could just make use of the ldb_lvds_ch0 phandle you added previously
and drop the complete override.

Regards,
  Marco

> +};
> +
> +&media_blk_ctrl {
> +	assigned-clocks = <&clk IMX93_CLK_MEDIA_AXI>,
> +			  <&clk IMX93_CLK_MEDIA_APB>,
> +			  <&clk IMX93_CLK_MEDIA_DISP_PIX>,
> +			  <&clk IMX93_CLK_VIDEO_PLL>;
> +	assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1>,
> +				 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
> +				 <&clk IMX93_CLK_VIDEO_PLL>;
> +	/*
> +	 * Set IMX93_CLK_MEDIA_DISP_PIX rate to 71142858Hz to accommodate
> +	 * IMX93_CLK_VIDEO_PLL rate at 498000000Hz in a rate table.
> +	 */
> +	assigned-clock-rates = <400000000>, <133333333>, <71142858>, <498000000>;
> +	status = "okay";
> +};
> 
> -- 
> 2.43.0
> 
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |


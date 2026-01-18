Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B76C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 17:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TeVqSgSzj7YDzU++X5mPX2zlki+Lh6wmAeH5mriv8dg=; b=etHPw+887wSDWWZGZzUPsfyFNA
	ywGLgDiw/vyzHfAxOYNlU2cGfz0CdCKLe7B96Ve6F1XeL8ZgBUjvgsEegrINcCTswr0dnl4J//RJo
	hDBruVhkVHxewuBinkAMK6bZfEYm7ALV6kc/bUnw+kHMYC07G7bJ+rSh56mhTvA4IDZNggWMXcMFX
	dpa5SfwIeNaepbzwtYnQq86DcFc/HjvK63Fx3itRwBE12rvJTRQwCAI4BSLaaj7xIcMgJ4pztYjzS
	Mp42QRn04V9tTF/rljMX9kEDt/vqVDDs+RRQUqsUubsDPnwl6amo0IScWpe7DaJ7FQoqd2sRuvFUb
	5eycXh6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhWXJ-00000000aaV-2K04;
	Sun, 18 Jan 2026 17:26:02 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhWXH-00000000aZy-3hql
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 17:26:01 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vhWX1-0007Bl-QV; Sun, 18 Jan 2026 18:25:43 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vhWX1-001HJA-39;
	Sun, 18 Jan 2026 18:25:43 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vhWX1-001bCU-0Z;
	Sun, 18 Jan 2026 18:25:43 +0100
Date: Sun, 18 Jan 2026 18:25:43 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, devicetree@vger.kernel.org,
	Fugang Duan <fugang.duan@nxp.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 5/9] arm64: dts: imx8mm-evk: add uart3 port
Message-ID: <20260118172543.gmx6p7ae43nge7vq@pengutronix.de>
References: <20260117-misc_dts-v2-0-0f319c7e9b55@nxp.com>
 <20260117-misc_dts-v2-5-0f319c7e9b55@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117-misc_dts-v2-5-0f319c7e9b55@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_092559_943885_3FD3F82F 
X-CRM114-Status: GOOD (  19.30  )
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

On 26-01-17, Frank Li wrote:
> From: Fugang Duan <fugang.duan@nxp.com>
> 
> Add uart3 port.

Would be nice to know why the port is needed? If it's just a UART on the
pin header I would rather keep it un-muxed to keep it easy to adapt the
EVK to dev needs.

Regards,
  Marco


> Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> index 30b13b4d630f8b8b0531fad531081d4ee32849f9..8be44eaf4e1e0adc2921db8cc5f2dc69586b68cf 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> @@ -627,6 +627,15 @@ &uart2 { /* console */
>  	status = "okay";
>  };
>  
> +&uart3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart3>;
> +	assigned-clocks = <&clk IMX8MM_CLK_UART3>;
> +	assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_80M>;
> +	uart-has-rtscts;
> +	status = "okay";
> +};
> +
>  &usbphynop1 {
>  	wakeup-source;
>  };
> @@ -819,6 +828,15 @@ MX8MM_IOMUXC_UART2_TXD_UART2_DCE_TX	0x140
>  		>;
>  	};
>  
> +	pinctrl_uart3: uart3grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_ECSPI1_SCLK_UART3_DCE_RX		0x140
> +			MX8MM_IOMUXC_ECSPI1_MOSI_UART3_DCE_TX		0x140
> +			MX8MM_IOMUXC_ECSPI1_SS0_UART3_DCE_RTS_B		0x140
> +			MX8MM_IOMUXC_ECSPI1_MISO_UART3_DCE_CTS_B	0x140
> +		>;
> +	};
> +
>  	pinctrl_usdhc2_gpio: usdhc2grpgpiogrp {
>  		fsl,pins = <
>  			MX8MM_IOMUXC_GPIO1_IO15_GPIO1_IO15	0x1c4
> 
> -- 
> 2.34.1
> 
> 
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |


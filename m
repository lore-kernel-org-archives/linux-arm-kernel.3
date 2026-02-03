Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068AAE87834
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 14:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y+3dv9VjeD5d8qahXYET+cysjqAsCoesn7ofwZAQsWo=; b=d18sUzvKkKoCSsf2/gPUr+t1Km
	89zSdDihlCrsgA6/ygv/hA/M572OjJyHjWhFUWzTXgLtYiEX9G5ShjsFRMkye0sRW0nEOSW4nzmHb
	gYrcqZY47hwp7IViJss2RGf6Wl46D+bv4Xv8pB8ThlsHVa6jgNUIboAIsk5qr0jo07WxE3HoW8jkg
	/PvFoFanyyA8tntp/611zwK6fBt84oBei+j7X259ftfCZy44AkPcwDaUV091BJsg4Bz5TbrlmSuEP
	MFs4Or5rAQi/qmLON/UUTJ3NM+Lqed2IbPEKSIP+5CyiVJADlyBiP4io6YUjinok7SoGHlUTVnfI4
	JifR1Ksg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHWa-00000006mGW-0jWT;
	Tue, 03 Feb 2026 14:37:04 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnHWX-00000006mFy-14aG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 14:37:02 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vnHW2-0006dU-Jr; Tue, 03 Feb 2026 15:36:30 +0100
Message-ID: <b69b73b5-cde0-444a-875d-ef817cfa7504@pengutronix.de>
Date: Tue, 3 Feb 2026 15:36:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: freescale: imx8mm-evk: share usdhc3 setup
To: Mario Peter <mario.peter@leica-geosystems.com>, shawnguo@kernel.org,
 s.hauer@pengutronix.de
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, kernel@pengutronix.de,
 krzk+dt@kernel.org, festevam@gmail.com, linux-arm-kernel@lists.infradead.org
References: <20260203142158.3929433-1-mario.peter@leica-geosystems.com>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <20260203142158.3929433-1-mario.peter@leica-geosystems.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_063701_458013_3DA5F231 
X-CRM114-Status: GOOD (  18.27  )
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

Hello Mario,

thanks for your patch.

On 2/3/26 3:21 PM, Mario Peter wrote:
> The eMMC controller on EVK and EVKB uses the same usdhc3
> configuration and pinmux. Move the common node and pinctrl groups
> into imx8mm-evk.dtsi so both boards inherit the shared setup and
> avoid duplication in the board DTS files.

What about the imx8mm-ddr4-evk.dts? Did you check if it also has
something connected to usdhc3?

Cheers,
Ahmad

> 
> Signed-off-by: Mario Peter <mario.peter@leica-geosystems.com>
> ---
> v1: submitted
> 
>  arch/arm64/boot/dts/freescale/imx8mm-evk.dts  | 61 -------------------
>  arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 61 +++++++++++++++++++
>  2 files changed, 61 insertions(+), 61 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> index b68954bcc383..002ebdeeb2d6 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> @@ -53,18 +53,6 @@ flash@0 {
>  	};
>  };
>  
> -&usdhc3 {
> -	assigned-clocks = <&clk IMX8MM_CLK_USDHC3_ROOT>;
> -	assigned-clock-rates = <400000000>;
> -	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> -	pinctrl-0 = <&pinctrl_usdhc3>;
> -	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
> -	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
> -	bus-width = <8>;
> -	non-removable;
> -	status = "okay";
> -};
> -
>  &iomuxc {
>  	pinctrl_flexspi: flexspigrp {
>  		fsl,pins = <
> @@ -76,53 +64,4 @@ MX8MM_IOMUXC_NAND_DATA02_QSPI_A_DATA2           0x82
>  			MX8MM_IOMUXC_NAND_DATA03_QSPI_A_DATA3           0x82
>  		>;
>  	};
> -
> -	pinctrl_usdhc3: usdhc3grp {
> -		fsl,pins = <
> -			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x190
> -			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d0
> -			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d0
> -			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d0
> -			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d0
> -			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d0
> -			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d0
> -			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d0
> -			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d0
> -			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d0
> -			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d0
> -			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x190
> -		>;
> -	};
> -
> -	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> -		fsl,pins = <
> -			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x194
> -			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d4
> -			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d4
> -			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d4
> -			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d4
> -			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d4
> -			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d4
> -			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d4
> -			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d4
> -			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d4
> -			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x194
> -		>;
> -	};
> -
> -	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> -		fsl,pins = <
> -			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x196
> -			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d6
> -			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d6
> -			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d6
> -			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d6
> -			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d6
> -			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d6
> -			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d6
> -			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d6
> -			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d6
> -			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x196
> -		>;
> -	};
>  };
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> index 6eab8a6001db..6e53828b5d30 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> @@ -649,6 +649,18 @@ &usdhc2 {
>  	status = "okay";
>  };
>  
> +&usdhc3 {
> +	assigned-clocks = <&clk IMX8MM_CLK_USDHC3_ROOT>;
> +	assigned-clock-rates = <400000000>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc3>;
> +	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
> +	bus-width = <8>;
> +	non-removable;
> +	status = "okay";
> +};
> +
>  &wdog1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_wdog>;
> @@ -839,6 +851,55 @@ MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
>  		>;
>  	};
>  
> +	pinctrl_usdhc3: usdhc3grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x190
> +			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d0
> +			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d0
> +			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d0
> +			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d0
> +			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d0
> +			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d0
> +			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d0
> +			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d0
> +			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d0
> +			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d0
> +			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x190
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x194
> +			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d4
> +			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d4
> +			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d4
> +			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d4
> +			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d4
> +			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d4
> +			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d4
> +			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d4
> +			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d4
> +			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x194
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x196
> +			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d6
> +			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d6
> +			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d6
> +			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d6
> +			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d6
> +			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d6
> +			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d6
> +			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d6
> +			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d6
> +			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x196
> +		>;
> +	};
> +
>  	pinctrl_wdog: wdoggrp {
>  		fsl,pins = <
>  			MX8MM_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B	0x166

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |



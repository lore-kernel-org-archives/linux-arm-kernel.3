Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6787FCCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 12:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5j2479e3gDOHLOBxdxP9rWH3tVwbPphYz6F17ZmNVM=; b=1bgwjPxX38f09ZzxUfH9WZYFMJ
	H/ny9CWP/rbUl8i0J9u+QlXiMgUG+TQ/UhgxdF2wlPyvuTiI54PYkSiG1ksvQ7zeeMaSVYeP3Lh5E
	SJbr4ydC+22V+G0jSYNMjXreUEO6gJSs7XzSMUdRSWkWc2ahM9QDqZFyC/5RDjjXabPRH7ipsudnO
	M/Q3Si8QBi67RC0GMGjvaO25nfoCdvt+TiqD/2isxOB9MM9KpyieT9YNcAmmxtJ9zA4wwEOWfe6L1
	gcgrLSVrNQQFGkvnjk5k/srYuEN9Xlzdmv3gdddXCoUrOMnOgYVt0NSZzyo1uLfD6h072X1CUvZtG
	dcpWqrkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBu0e-00000006AFU-3bEY;
	Thu, 23 Oct 2025 12:01:36 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBu0b-00000006AEi-2Qu2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 12:01:35 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vBtzs-00057X-KQ; Thu, 23 Oct 2025 14:00:48 +0200
Message-ID: <56075d3e-30ac-4501-bd77-2a84d0d124bd@pengutronix.de>
Date: Thu, 23 Oct 2025 14:00:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: freescale: imx93-phy{core, board}: Add i2c
 bus recovery
To: Primoz Fiser <primoz.fiser@norik.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, upstream@lists.phytec.de,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev
References: <20251023103426.3606647-1-primoz.fiser@norik.com>
Content-Language: en-US, de-DE, de-BE
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20251023103426.3606647-1-primoz.fiser@norik.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_050133_644683_EE498290 
X-CRM114-Status: GOOD (  19.27  )
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

Hi,

On 10/23/25 12:34 PM, Primoz Fiser wrote:
> Add bus recovery feature for I2C buses on the PHYTEC phyCORE-i.MX93 SoM
> based boards (that is phyBOARD-Nash-i.MX93 and phyBOARD-Segin-i.MX93).
> This enables the i2c-imx-lpi2c driver to recover the stuck I2C bus by
> switching the SCL and SDA pinmuxing and do the I2C bus bit-banging.
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  .../arm64/boot/dts/freescale/imx93-phyboard-nash.dts | 12 +++++++++++-
>  .../boot/dts/freescale/imx93-phyboard-segin.dts      | 12 +++++++++++-
>  arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi | 12 +++++++++++-
>  3 files changed, 33 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
> index 5599e296919f..96c58cf13754 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-nash.dts
> @@ -128,8 +128,11 @@ &flexcan1 {
>  /* I2C2 */
>  &lpi2c2 {
>  	clock-frequency = <400000>;
> -	pinctrl-names = "default";
> +	pinctrl-names = "default", "gpio";
>  	pinctrl-0 = <&pinctrl_lpi2c2>;
> +	pinctrl-1 = <&pinctrl_lpi2c2_gpio>;
> +	scl-gpios = <&gpio1 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio1 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>  	status = "okay";
>  
>  	/* RTC */
> @@ -253,6 +256,13 @@ MX93_PAD_I2C2_SDA__LPI2C2_SDA		0x40000b9e
>  		>;
>  	};
>  
> +	pinctrl_lpi2c2_gpio: lpi2c2gpiogrp {
> +		fsl,pins = <
> +			MX93_PAD_I2C2_SCL__GPIO1_IO02		0x31e

I haven't worked with imx93 myself yet, but does this not need the SION
bit set?

Cheers,
Ahmad

> +			MX93_PAD_I2C2_SDA__GPIO1_IO03		0x31e
> +		>;
> +	};
> +
>  	pinctrl_lpspi6: lpspi6grp {
>  		fsl,pins = <
>  			MX93_PAD_GPIO_IO00__GPIO2_IO00		0x386
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> index 802d96b19e4c..1850a93dbaa4 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
> @@ -132,8 +132,11 @@ &flexcan1 {
>  /* I2C2 */
>  &lpi2c2 {
>  	clock-frequency = <400000>;
> -	pinctrl-names = "default";
> +	pinctrl-names = "default", "gpio";
>  	pinctrl-0 = <&pinctrl_lpi2c2>;
> +	pinctrl-1 = <&pinctrl_lpi2c2_gpio>;
> +	scl-gpios = <&gpio1 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio1 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>  	status = "okay";
>  
>  	/* Codec */
> @@ -238,6 +241,13 @@ MX93_PAD_I2C2_SDA__LPI2C2_SDA		0x40000b9e
>  		>;
>  	};
>  
> +	pinctrl_lpi2c2_gpio: lpi2c2gpiogrp {
> +		fsl,pins = <
> +			MX93_PAD_I2C2_SCL__GPIO1_IO02		0x31e
> +			MX93_PAD_I2C2_SDA__GPIO1_IO03		0x31e
> +		>;
> +	};
> +
>  	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
>  		fsl,pins = <
>  			MX93_PAD_SD2_RESET_B__GPIO3_IO07	0x31e
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> index 3f069905cf0b..ebc57841f27f 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> @@ -93,8 +93,11 @@ ethphy1: ethernet-phy@1 {
>  /* I2C3 */
>  &lpi2c3 {
>  	clock-frequency = <400000>;
> -	pinctrl-names = "default";
> +	pinctrl-names = "default", "gpio";
>  	pinctrl-0 = <&pinctrl_lpi2c3>;
> +	pinctrl-1 = <&pinctrl_lpi2c3_gpio>;
> +	scl-gpios = <&gpio2 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio2 28 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>  	status = "okay";
>  
>  	pmic@25 {
> @@ -234,6 +237,13 @@ MX93_PAD_GPIO_IO29__LPI2C3_SCL		0x40000b9e
>  		>;
>  	};
>  
> +	pinctrl_lpi2c3_gpio: lpi2c3gpiogrp {
> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO28__GPIO2_IO28		0x31e
> +			MX93_PAD_GPIO_IO29__GPIO2_IO29		0x31e
> +		>;
> +	};
> +
>  	pinctrl_pmic: pmicgrp {
>  		fsl,pins = <
>  			MX93_PAD_ENET2_RD3__GPIO4_IO27		0x31e

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986B4C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 09:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OA/fTBISzM4/0hQHF9JF3amGEuf4mz381ZmSovEWqf4=; b=luYlG6zBY+vvHuzHNkzWftecJ3
	3KDLmbyjdOa3QB+0YLaFR5ovmLu3SvANGuwMu+3hozCa7Cy3slUZ2s1GRZssKhKJO1zWP/8gzAUMU
	vp+dCLYkjlOKEV92aOKn8GSQlb35lHYM+MLP2sXZ8kBSHriYucLU9qBHaOiwR5InPTj9FNGhqJVKF
	SbOKzWOWFwyE3oYVGSoq7t5tZYLyTnLSwAfQF8OFTZhN5wz4l/cZW5w6EKiH6pfRiEaef/z5i08Up
	+DfNUtF1ttnRs3dRpKuelJ5YiNdkTnY95WjgUhjbsUvLYXyWvQHacPUtrObGwJ77x+STEFVKlYFcZ
	AAp896hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhPgf-00000003IIP-0ilg;
	Thu, 31 Jul 2025 09:34:57 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhPdi-00000003Hga-0MXv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 09:31:55 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uhPdT-0005sL-9v; Thu, 31 Jul 2025 11:31:39 +0200
Message-ID: <4043f877-fc29-4d81-b96a-83f6ef3fa926@pengutronix.de>
Date: Thu, 31 Jul 2025 11:31:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: imx8mp-tqma8mpql: remove virtual 3.3V
 regulator
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, Markus Niebel
 <Markus.Niebel@ew.tq-group.com>, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com
References: <20250731091655.2453107-1-alexander.stein@ew.tq-group.com>
 <20250731091655.2453107-2-alexander.stein@ew.tq-group.com>
Content-Language: en-US, de-DE, de-BE
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20250731091655.2453107-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_023154_133154_870D1AB0 
X-CRM114-Status: GOOD (  19.47  )
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

Hi Alexander,

On 7/31/25 11:16, Alexander Stein wrote:
> From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> 
> BUCK4 rail supplies the 3.3V rail. Use the actual regulator
> instead of a virtual fixed regulator.
> 
> Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

jfyi, this may impact boot time as it delays eMMC probe until after the
PMIC on the slower I2C bus is registered. It would be cool if we could
annotate regulators as left-on by bootloader somehow to weaken
dependencies, but that's unrelated to your patch.

Cheers,
Ahmad

> ---
>  .../boot/dts/freescale/imx8mp-tqma8mpql.dtsi      | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
> index b48d5da147273..9716f24f7c6ed 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
> @@ -16,15 +16,6 @@ memory@40000000 {
>  		reg = <0x0 0x40000000 0 0x80000000>;
>  	};
>  
> -	/* identical to buck4_reg, but should never change */
> -	reg_vcc3v3: regulator-vcc3v3 {
> -		compatible = "regulator-fixed";
> -		regulator-name = "VCC3V3";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -		regulator-always-on;
> -	};
> -
>  	reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
>  		compatible = "regulator-gpio";
>  		pinctrl-names = "default";
> @@ -187,14 +178,14 @@ at24c02: eeprom@53 {
>  		read-only;
>  		reg = <0x53>;
>  		pagesize = <16>;
> -		vcc-supply = <&reg_vcc3v3>;
> +		vcc-supply = <&buck4_reg>;
>  	};
>  
>  	m24c64: eeprom@57 {
>  		compatible = "atmel,24c64";
>  		reg = <0x57>;
>  		pagesize = <32>;
> -		vcc-supply = <&reg_vcc3v3>;
> +		vcc-supply = <&buck4_reg>;
>  	};
>  };
>  
> @@ -211,7 +202,7 @@ &usdhc3 {
>  	non-removable;
>  	no-sd;
>  	no-sdio;
> -	vmmc-supply = <&reg_vcc3v3>;
> +	vmmc-supply = <&buck4_reg>;
>  	vqmmc-supply = <&buck5_reg>;
>  	status = "okay";
>  };

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023E9CFA44F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 16:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V0OHs0H7IhHNUY8ODfZQzfiiqBNGvwZxhUzPRwZ3pR8=; b=z04uidqjmjRfn4+3X40bUvr2gZ
	W8p0aRR3FlRxKe+ZPv1fM7O83nOZ9dc6DHeGaSMCqbWuvvOsPVk8rPbMn9mxCEn85mZ+XPm0VOxNo
	DNfPf17LKsKC5HwI39aL5MiVs431a7+8P3qZ6BwPkj7i8GqALxfRHyIASfMMkik4u/PVUSVmBAq2F
	zR7e7OggUBSJ4cZ6mQ6npGsyA9sU2i5nAnteXGCLkBjWPYfO/dYgA2FvKrouvgllwkIw4IciODJ90
	gzAJVOnbuZ2xUycKvf5jJBT20OPBAnk5/0fvTC77yQcKDvGJ4zopY56hFMgQs/f0Umdfin83M5NIt
	9U9lBjvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dr3-0000000F4mn-06sj;
	Wed, 23 Oct 2024 16:05:01 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cvy-0000000Eskq-0aCX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 15:06:03 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49NF5uvb060575;
	Wed, 23 Oct 2024 10:05:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729695956;
	bh=V0OHs0H7IhHNUY8ODfZQzfiiqBNGvwZxhUzPRwZ3pR8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hLBZ3MNSbJzm5Bu51JcrwX+E48TUIN6a8uSfXNJF60mZH5o5r/GKwa7ABMRbnBvUx
	 IuGF5XMVDb6aQi2lpjQf0keLjWIuQJxBCkX/PUoJAd9ZQWV+uB1sYO4rrWarWbozkk
	 YafxJJyeWYsg/7BW+ZyiQOu4hCb+AREFIR9u6VqE=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49NF5uXx058932;
	Wed, 23 Oct 2024 10:05:56 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 23
 Oct 2024 10:05:56 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 23 Oct 2024 10:05:56 -0500
Received: from [172.24.227.91] (psdkl-workstation0.dhcp.ti.com [172.24.227.91])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49NF5psV073797;
	Wed, 23 Oct 2024 10:05:52 -0500
Message-ID: <577721f5-659e-4a75-bd41-a633c7f67017@ti.com>
Date: Wed, 23 Oct 2024 20:35:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/12] arm64: dts: ti: k3-j7200-evm*: Add bootph-*
 properties
To: Manorit Chawdhry <m-chawdhry@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh
 Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Neha Malcom Francis <n-francis@ti.com>,
        Udit
 Kumar <u-kumar1@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>, Andrew Davis <afd@ti.com>
References: <20241023-b4-upstream-bootph-all-v5-0-a974d06370ab@ti.com>
 <20241023-b4-upstream-bootph-all-v5-12-a974d06370ab@ti.com>
Content-Language: en-US
From: Aniket Limaye <a-limaye@ti.com>
In-Reply-To: <20241023-b4-upstream-bootph-all-v5-12-a974d06370ab@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_080602_463621_3F11589B 
X-CRM114-Status: GOOD (  12.50  )
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



On 23/10/24 12:27, Manorit Chawdhry wrote:
> Adds bootph-* properties to the leaf nodes to enable bootloaders to
> utilise them.
> 
> Following adds bootph-* to:
> - pmic regulator for enabling AVS Support
> - main_uart0, mcu_uart0(DM), wkup_uart0(TIFS) for Traces
> - mmc0, mmc1, usb0, ospi0, ospi1, hbmc for enabling various bootmodes.
> 
> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>

Reviewed-by: Aniket Limaye <a-limaye@ti.com>

> ---
>   arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts | 13 +++++++++++++
>   arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi           |  6 ++++++
>   2 files changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
> index 6593c5da82c0..d03690b8d652 100644
> --- a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
> @@ -129,6 +129,7 @@ J721E_WKUP_IOPAD(0x94, PIN_OUTPUT, 0) /* (E21) MCU_UART0_RTSn */
>   			J721E_WKUP_IOPAD(0x8c, PIN_INPUT, 0) /* (D20) MCU_UART0_RXD */
>   			J721E_WKUP_IOPAD(0x88, PIN_OUTPUT, 0) /* (D19) MCU_UART0_TXD */
>   		>;
> +		bootph-all;
>   	};
>   
>   	wkup_uart0_pins_default: wkup-uart0-default-pins {
> @@ -136,6 +137,7 @@ wkup_uart0_pins_default: wkup-uart0-default-pins {
>   			J721E_WKUP_IOPAD(0x48, PIN_INPUT, 0) /* (B14) WKUP_UART0_RXD */
>   			J721E_WKUP_IOPAD(0x4c, PIN_OUTPUT, 0) /* (A14) WKUP_UART0_TXD */
>   		>;
> +		bootph-all;
>   	};
>   
>   	mcu_cpsw_pins_default: mcu-cpsw-default-pins {
> @@ -204,6 +206,7 @@ J721E_IOPAD(0xb4, PIN_OUTPUT, 0) /* (T17) UART0_TXD */
>   			J721E_IOPAD(0xc0, PIN_INPUT, 2) /* (W3) SPI0_CS0.UART0_CTSn */
>   			J721E_IOPAD(0xc4, PIN_OUTPUT, 2) /* (U5) SPI0_CS1.UART0_RTSn */
>   		>;
> +		bootph-all;
>   	};
>   
>   	main_uart1_pins_default: main-uart1-default-pins {
> @@ -238,6 +241,7 @@ J721E_IOPAD(0xf0, PIN_INPUT, 0) /* (N20) MMC1_DAT2 */
>   			J721E_IOPAD(0xec, PIN_INPUT, 0) /* (N19) MMC1_DAT3 */
>   			J721E_IOPAD(0xe4, PIN_INPUT, 8) /* (V1) TIMER_IO0.MMC1_SDCD */
>   		>;
> +		bootph-all;
>   	};
>   
>   	vdd_sd_dv_pins_default: vdd-sd-dv-default-pins {
> @@ -259,6 +263,7 @@ main_usbss0_pins_default: main-usbss0-default-pins {
>   		pinctrl-single,pins = <
>   			J721E_IOPAD(0x04, PIN_OUTPUT, 0) /* (T4) USB0_DRVVBUS */
>   		>;
> +		bootph-all;
>   	};
>   };
>   
> @@ -267,12 +272,14 @@ &wkup_uart0 {
>   	status = "reserved";
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&wkup_uart0_pins_default>;
> +	bootph-all;
>   };
>   
>   &mcu_uart0 {
>   	status = "okay";
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&mcu_uart0_pins_default>;
> +	bootph-all;
>   };
>   
>   &main_uart0 {
> @@ -281,6 +288,7 @@ &main_uart0 {
>   	power-domains = <&k3_pds 146 TI_SCI_PD_SHARED>;
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&main_uart0_pins_default>;
> +	bootph-all;
>   };
>   
>   &main_uart1 {
> @@ -379,6 +387,7 @@ &main_sdhci0 {
>   	/* eMMC */
>   	status = "okay";
>   	non-removable;
> +	bootph-all;
>   	ti,driver-strength-ohm = <50>;
>   	disable-wp;
>   };
> @@ -390,6 +399,7 @@ &main_sdhci1 {
>   	pinctrl-names = "default";
>   	vmmc-supply = <&vdd_mmc1>;
>   	vqmmc-supply = <&vdd_sd_dv>;
> +	bootph-all;
>   	ti,driver-strength-ohm = <50>;
>   	disable-wp;
>   };
> @@ -401,11 +411,13 @@ &serdes_ln_ctrl {
>   
>   &usb_serdes_mux {
>   	idle-states = <1>; /* USB0 to SERDES lane 3 */
> +	bootph-all;
>   };
>   
>   &usbss0 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&main_usbss0_pins_default>;
> +	bootph-all;
>   	ti,vbus-divider;
>   	ti,usb2-only;
>   };
> @@ -413,6 +425,7 @@ &usbss0 {
>   &usb0 {
>   	dr_mode = "otg";
>   	maximum-speed = "high-speed";
> +	bootph-all;
>   };
>   
>   &tscadc0 {
> diff --git a/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
> index e78b4622a7d1..291ab9bb414d 100644
> --- a/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j7200-som-p0.dtsi
> @@ -121,6 +121,7 @@ J721E_WKUP_IOPAD(0x20, PIN_INPUT, 1) /* (B8) MCU_OSPI0_D5.MCU_HYPERBUS0_DQ5 */
>   			J721E_WKUP_IOPAD(0x24, PIN_INPUT, 1) /* (A8) MCU_OSPI0_D6.MCU_HYPERBUS0_DQ6 */
>   			J721E_WKUP_IOPAD(0x28, PIN_INPUT, 1) /* (A7) MCU_OSPI0_D7.MCU_HYPERBUS0_DQ7 */
>   		>;
> +		bootph-all;
>   	};
>   
>   	mcu_fss0_ospi0_pins_default: mcu-fss0-ospi0-default-pins {
> @@ -137,6 +138,7 @@ J721E_WKUP_IOPAD(0x0024, PIN_INPUT, 0)  /* MCU_OSPI0_D6 */
>   			J721E_WKUP_IOPAD(0x0028, PIN_INPUT, 0)  /* MCU_OSPI0_D7 */
>   			J721E_WKUP_IOPAD(0x0008, PIN_INPUT, 0)  /* MCU_OSPI0_DQS */
>   		>;
> +		bootph-all;
>   	};
>   };
>   
> @@ -146,6 +148,7 @@ wkup_i2c0_pins_default: wkup-i2c0-default-pins {
>   			J721E_WKUP_IOPAD(0x98, PIN_INPUT_PULLUP, 0) /* (F20) WKUP_I2C0_SCL */
>   			J721E_WKUP_IOPAD(0x9c, PIN_INPUT_PULLUP, 0) /* (H21) WKUP_I2C0_SDA */
>   		>;
> +		bootph-all;
>   	};
>   };
>   
> @@ -186,6 +189,7 @@ &hbmc {
>   	flash@0,0 {
>   		compatible = "cypress,hyperflash", "cfi-flash";
>   		reg = <0x00 0x00 0x4000000>;
> +		bootph-all;
>   
>   		partitions {
>   			compatible = "fixed-partitions";
> @@ -347,6 +351,7 @@ bucka1: buck1 {
>   				regulator-max-microvolt = <1800000>;
>   				regulator-boot-on;
>   				regulator-always-on;
> +				bootph-all;
>   			};
>   
>   			bucka2: buck2 {
> @@ -520,6 +525,7 @@ partition@800000 {
>   			partition@3fc0000 {
>   				label = "ospi.phypattern";
>   				reg = <0x3fc0000 0x40000>;
> +				bootph-all;
>   			};
>   		};
>   	};
> 


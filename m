Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B112BCDDE71
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 11:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ywmV9eiNqtGS3Aufr8ZJ/Yftbh9P8x+/J9EEZ4Hx2tw=; b=YEt6K/Ltw1KmrNFR7nIE40HMRh
	CMSi1jk6OxR3oz25Kb9E/8p0xWV2utyYEXrMcvmWuQPr/bwc863bQIFP3ZvQiMiVXh1thLVr5wf6T
	O6Xuk5n7dOSa1psPMeEideCMQQzUJ8UCFnz9DfrYzSi+7faLTYwUsiMtY7v5z+sfOvhB8SM7jIoC/
	+kVP31AHySh9iLrObyndvqGBjos/mL6W4yB5GmcX5nSVbm1T4S94hnYPhZdYOFDu90sz49zXSuQoT
	AwuSkYZhuUVvPVvCwzfC8fVRpWgKDz5t9mit4nGPMUEAjSW6Jb0nvZjsB1/BhBP2JEh5LBBPniI2t
	qHZeHwBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Zqj-0000000EDLT-3IpD;
	Wed, 23 Oct 2024 11:48:25 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Zby-0000000E8uU-3eZ8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 11:33:12 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49NBX6qs128154;
	Wed, 23 Oct 2024 06:33:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729683186;
	bh=ywmV9eiNqtGS3Aufr8ZJ/Yftbh9P8x+/J9EEZ4Hx2tw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rK84usAcKdnF536iuMvtLt0XCawFjh9FdRV9mYS1N8v1mSLiVXW0tObMLsg8sGmLQ
	 GILPJaXsN3xMUrNMpwrnre0Z88NY+qYe9HBoi26OsAcZ7GpDGpPYPBEM01UOuZtPlq
	 gdVKng88Jt+6pMroG3d4AVYN2w9mP7w3eKIw7CSQ=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49NBX6MD061852;
	Wed, 23 Oct 2024 06:33:06 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 23
 Oct 2024 06:33:06 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 23 Oct 2024 06:33:06 -0500
Received: from [172.24.227.36] (a0497641-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [172.24.227.36] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49NBX1In075090;
	Wed, 23 Oct 2024 06:33:02 -0500
Message-ID: <377463b4-dc85-4aa0-959c-c90f3087f047@ti.com>
Date: Wed, 23 Oct 2024 17:03:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/12] arm64: dts: ti: k3-j721e-evm*: Add bootph-*
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
        <linux-kernel@vger.kernel.org>, Aniket Limaye <a-limaye@ti.com>,
        Udit Kumar
	<u-kumar1@ti.com>, Beleswar Padhi <b-padhi@ti.com>,
        Siddharth Vadapalli
	<s-vadapalli@ti.com>, Andrew Davis <afd@ti.com>
References: <20241023-b4-upstream-bootph-all-v5-0-a974d06370ab@ti.com>
 <20241023-b4-upstream-bootph-all-v5-10-a974d06370ab@ti.com>
Content-Language: en-US
From: Neha Malcom Francis <n-francis@ti.com>
In-Reply-To: <20241023-b4-upstream-bootph-all-v5-10-a974d06370ab@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_043311_036289_1AE08A4C 
X-CRM114-Status: GOOD (  13.38  )
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

Hi Manorit

On 23/10/24 12:27, Manorit Chawdhry wrote:
> Adds bootph-* properties to the leaf nodes to enable bootloaders to
> utilise them.
> 
> Following adds bootph-* to:
> - main_uart0, mcu_uart0(DM), wkup_uart0(TIFS) for Traces
> - mmc0, mmc1, usb0, ospi0, ospi1, hbmc for enabling various bootmodes.
> 
> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> ---
>   arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts | 16 ++++++++++++++++
>   arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi           |  5 +++++
>   2 files changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> index 8230d53cd696..4c1e02a4e7a2 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts
> @@ -193,6 +193,7 @@ J721E_IOPAD(0x1c0, PIN_OUTPUT, 1) /* (AA2) SPI0_CS0.UART0_RTSn */
>   			J721E_IOPAD(0x1e8, PIN_INPUT, 0) /* (AB2) UART0_RXD */
>   			J721E_IOPAD(0x1ec, PIN_OUTPUT, 0) /* (AB3) UART0_TXD */
>   		>;
> +		bootph-all;
>   	};
>   
>   	main_uart1_pins_default: main-uart1-default-pins {
> @@ -234,6 +235,7 @@ J721E_IOPAD(0x240, PIN_INPUT, 0) /* (R26) MMC1_DAT3 */
>   			J721E_IOPAD(0x258, PIN_INPUT, 0) /* (P23) MMC1_SDCD */
>   			J721E_IOPAD(0x25c, PIN_INPUT, 0) /* (R28) MMC1_SDWP */
>   		>;
> +		bootph-all;
>   	};
>   
>   	vdd_sd_dv_alt_pins_default: vdd-sd-dv-alt-default-pins {
> @@ -247,6 +249,7 @@ main_usbss0_pins_default: main-usbss0-default-pins {
>   			J721E_IOPAD(0x290, PIN_OUTPUT, 0) /* (U6) USB0_DRVVBUS */
>   			J721E_IOPAD(0x210, PIN_INPUT, 7) /* (W3) MCAN1_RX.GPIO1_3 */
>   		>;
> +		bootph-all;
>   	};
>   
>   	main_usbss1_pins_default: main-usbss1-default-pins {
> @@ -342,6 +345,7 @@ wkup_uart0_pins_default: wkup-uart0-default-pins {
>   			J721E_WKUP_IOPAD(0xa0, PIN_INPUT, 0) /* (J29) WKUP_UART0_RXD */
>   			J721E_WKUP_IOPAD(0xa4, PIN_OUTPUT, 0) /* (J28) WKUP_UART0_TXD */
>   		>;
> +		bootph-all;
>   	};
>   
>   	mcu_uart0_pins_default: mcu-uart0-default-pins {
> @@ -351,6 +355,7 @@ J721E_WKUP_IOPAD(0xec, PIN_OUTPUT, 0) /* (J27) WKUP_GPIO0_15.MCU_UART0_RTSn */
>   			J721E_WKUP_IOPAD(0xe4, PIN_INPUT, 0) /* (H28) WKUP_GPIO0_13.MCU_UART0_RXD */
>   			J721E_WKUP_IOPAD(0xe0, PIN_OUTPUT, 0) /* (G29) WKUP_GPIO0_12.MCU_UART0_TXD */
>   		>;
> +		bootph-all;
>   	};
>   
>   	sw11_button_pins_default: sw11-button-default-pins {
> @@ -370,6 +375,7 @@ J721E_WKUP_IOPAD(0x4c, PIN_INPUT, 0) /* (C23) MCU_OSPI1_D3 */
>   			J721E_WKUP_IOPAD(0x3c, PIN_INPUT, 0) /* (B23) MCU_OSPI1_DQS */
>   			J721E_WKUP_IOPAD(0x38, PIN_INPUT, 0) /* (A23) MCU_OSPI1_LBCLKO */
>   		>;
> +		bootph-all;
>   	};
>   
>   	mcu_cpsw_pins_default: mcu-cpsw-default-pins {
> @@ -435,12 +441,14 @@ &wkup_uart0 {
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
> @@ -449,6 +457,7 @@ &main_uart0 {
>   	pinctrl-0 = <&main_uart0_pins_default>;
>   	/* Shared with ATF on this platform */
>   	power-domains = <&k3_pds 146 TI_SCI_PD_SHARED>;
> +	bootph-all;
>   };
>   
>   &main_uart1 {
> @@ -487,6 +496,7 @@ &main_sdhci0 {
>   	/* eMMC */
>   	status = "okay";
>   	non-removable;
> +	bootph-all;
>   	ti,driver-strength-ohm = <50>;
>   	disable-wp;
>   };
> @@ -498,12 +508,14 @@ &main_sdhci1 {
>   	vqmmc-supply = <&vdd_sd_dv_alt>;
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&main_mmc1_pins_default>;
> +	bootph-all;
>   	ti,driver-strength-ohm = <50>;
>   	disable-wp;
>   };
>   
>   &usb_serdes_mux {
>   	idle-states = <1>, <0>; /* USB0 to SERDES3, USB1 to SERDES1 */
> +	bootph-all;
>   };
>   
>   &serdes_ln_ctrl {
> @@ -513,6 +525,7 @@ &serdes_ln_ctrl {
>   		      <J721E_SERDES3_LANE0_USB3_0_SWAP>, <J721E_SERDES3_LANE1_USB3_0>,
>   		      <J721E_SERDES4_LANE0_EDP_LANE0>, <J721E_SERDES4_LANE1_EDP_LANE1>,
>   		      <J721E_SERDES4_LANE2_EDP_LANE2>, <J721E_SERDES4_LANE3_EDP_LANE3>;
> +	bootph-all;
>   };
>   
>   &serdes_wiz3 {
> @@ -533,6 +546,7 @@ serdes3_usb_link: phy@0 {
>   &usbss0 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&main_usbss0_pins_default>;
> +	bootph-all;
>   	ti,vbus-divider;
>   };
>   
> @@ -541,6 +555,7 @@ &usb0 {
>   	maximum-speed = "super-speed";
>   	phys = <&serdes3_usb_link>;
>   	phy-names = "cdns3,usb3-phy";
> +	bootph-all;
>   };
>   
>   &usbss1 {
> @@ -613,6 +628,7 @@ partition@800000 {
>   			partition@3fe0000 {
>   				label = "qspi.phypattern";
>   				reg = <0x3fe0000 0x20000>;
> +				bootph-all;
>   			};
>   		};
>   	};
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
> index cef47c67493f..0722f6361cc8 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-som-p0.dtsi
> @@ -151,6 +151,7 @@ wkup_i2c0_pins_default: wkup-i2c0-default-pins {
>   			J721E_WKUP_IOPAD(0xf8, PIN_INPUT_PULLUP, 0) /* (J25) WKUP_I2C0_SCL */
>   			J721E_WKUP_IOPAD(0xfc, PIN_INPUT_PULLUP, 0) /* (H24) WKUP_I2C0_SDA */
>   		>;
> +		bootph-all;
>   	};
>   
>   	pmic_irq_pins_default: pmic-irq-default-pins {
> @@ -173,6 +174,7 @@ J721E_WKUP_IOPAD(0x0024, PIN_INPUT, 0)  /* MCU_OSPI0_D6 */
>   			J721E_WKUP_IOPAD(0x0028, PIN_INPUT, 0)  /* MCU_OSPI0_D7 */
>   			J721E_WKUP_IOPAD(0x002c, PIN_OUTPUT, 0) /* MCU_OSPI0_CSn0 */
>   		>;
> +		bootph-all;
>   	};
>   
>   	mcu_fss0_hpb0_pins_default: mcu-fss0-hpb0-default-pins {
> @@ -192,6 +194,7 @@ J721E_WKUP_IOPAD(0x20, PIN_INPUT, 1)  /* MCU_HYPERBUS0_DQ5 */
>   			J721E_WKUP_IOPAD(0x24, PIN_INPUT, 1)  /* MCU_HYPERBUS0_DQ6 */
>   			J721E_WKUP_IOPAD(0x28, PIN_INPUT, 1)  /* MCU_HYPERBUS0_DQ7 */
>   		>;
> +		bootph-all;
>   	};
>   };
>   
> @@ -422,6 +425,7 @@ partition@800000 {
>   			partition@3fe0000 {
>   				label = "ospi.phypattern";
>   				reg = <0x3fe0000 0x20000>;
> +				bootph-all;
>   			};
>   		};
>   	};
> @@ -440,6 +444,7 @@ &hbmc {
>   	flash@0,0 {
>   		compatible = "cypress,hyperflash", "cfi-flash";
>   		reg = <0x00 0x00 0x4000000>;
> +		bootph-all;
>   
>   		partitions {
>   			compatible = "fixed-partitions";
> 

Reviewed-by: Neha Malcom Francis <n-francis@ti.com>

-- 
Thanking You
Neha Malcom Francis


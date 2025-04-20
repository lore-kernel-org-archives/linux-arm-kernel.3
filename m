Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C7CC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 04:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+92oJ6MzaNo2BZvoRTKDsk2yJVhwkV0jeSyiXIjKTA=; b=WF6vyR2tkGfklCbVhYh3SimH+/
	oktO5aA/t1UV01lqcMjFpOLhxM/lUFjSp+8XETjCnfC3HZm93Up+nvn7rzPPwdv9XNVfZIVIgrGi5
	AWA3z8sIGM0CixBzRBUObrckxPEbTMqhwYcpF9nncKHyV8+ISMqZP+V83WjO5DQXQgiKDAq8ydpGH
	axwr4Rfi0I4BoyyuhcRqrTbiVBgO+fFrHNovrEJu+t+hXb3JkwoKnspnoAKjc8SU9FHcvxLm/be4n
	DMNP4B07h4Ev6yGhewt6l5ZlGoNQ/wSRDdw10zvK+R/dp44qENF8P2M7wXBg8eaCLDQHPt4B6aS2o
	7QIilZ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6MTk-00000002CFg-03CK;
	Sun, 20 Apr 2025 04:40:28 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6MRo-00000002CB9-0nCP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Apr 2025 04:38:29 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53K4cNQq1317944
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Apr 2025 23:38:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745123903;
	bh=E+92oJ6MzaNo2BZvoRTKDsk2yJVhwkV0jeSyiXIjKTA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=vtwLVdYwuXHVdyOgbmpQdTOKi/1+L0hGJQQbWdvjYNiSOU1djKtsAYyY+M6ZQPRkU
	 yt2ZhREs9t7u7d3v4jq/sSDn0m2Ocx2NjKFVSQmfkFo7P3iRu9WaD48icR4yI4qPBb
	 bxIw9bKTAlBIbMBcLbs8TMt5/NkBkPR9Z/CdBwgc=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53K4cNiu001057
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Apr 2025 23:38:23 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 19
 Apr 2025 23:38:22 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 19 Apr 2025 23:38:22 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53K4cINR018601;
	Sat, 19 Apr 2025 23:38:19 -0500
Message-ID: <385e8f6a-6f25-4729-8ccc-877a551a3e9b@ti.com>
Date: Sun, 20 Apr 2025 10:08:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] arm64: dts: ti: Add basic support for
 phyBOARD-Izar-AM68x
To: Dominik Haller <d.haller@phytec.de>, <robh@kernel.org>,
        <kristo@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <vigneshr@ti.com>, <nm@ti.com>, <m-chawdhry@ti.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <upstream@lists.phytec.de>, <u-kumar1@ti.com>
References: <20250417125921.100580-1-d.haller@phytec.de>
 <20250417125921.100580-2-d.haller@phytec.de>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250417125921.100580-2-d.haller@phytec.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_213828_362790_4A6B09CF 
X-CRM114-Status: GOOD (  23.51  )
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

Hello Dominik,

Thanks for patch.

Few minor feedback

On 4/17/2025 6:29 PM, Dominik Haller wrote:
> The phyCORE-AM68x/TDA4x [1] is a SoM (System on Module) featuring TI's
> AM68x/TDA4x SoC. It can be used in combination with different carrier
> boards. This module can come with different sizes and models for DDR,
> eMMC, SPI NOR Flash and various SoCs from the AM68x/TDA4x (J721S2) family.
>
> A reference carrier board design, called phyBOARD-Izar is used for the
> phyCORE-AM68x/TDA4x development kit [2].
>
> Supported features:
> * Debug UART
> * 2x SPI NOR Flash
> * eMMC
> * 2x Ethernet
> * Micro SD card
> * I2C EEPROM
> * I2C RTC
> * 2x I2C GPIO Expander
> * LEDs
> * USB 5 Gbit/s
> * PCIe
>
> For more details see the product pages for the SoM and the
> development kit:
>
> [1] https://www.phytec.eu/en/produkte/system-on-modules/phycore-am68x-tda4x/
> [2] https://www.phytec.eu/en/produkte/development-kits/phyboard-izar/
>
> Signed-off-by: Dominik Haller <d.haller@phytec.de>
> Acked-by: Moteen Shah <m-shah@ti.com>
> ---
>
> Notes:
>      Bootlog:
>      https://gist.github.com/dominiknh90/644e753c752b232117e12092e3691124
>      
>      Link to v2:
>      https://lore.kernel.org/linux-arm-kernel/20250415130458.33714-1-d.haller@phytec.de/
>      
>      Link to v1:
>      https://lore.kernel.org/linux-arm-kernel/20250411101004.13276-1-d.haller@phytec.de/
>      
>      Changes in v3:
>      - added phytec,am68-phycore-som compatible
>      - pickup up Acked-by: Moteen Shah
>      
>      Changes in v2:
>      - aliases reordered
>      - stdout-path set to &main_uart8
>      - fixed coding style in serdes0 node
>      - dropped whitespaces in commit message
>
>   arch/arm64/boot/dts/ti/Makefile               |   1 +
>   .../boot/dts/ti/k3-am68-phyboard-izar.dts     | 579 +++++++++++++++++
>   .../boot/dts/ti/k3-am68-phycore-som.dtsi      | 594 ++++++++++++++++++
>   3 files changed, 1174 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phyboard-izar.dts
>   create mode 100644 arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi
>
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index 03d4cecfc001..3f18ca4029c3 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -109,6 +109,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721e-sk.dtb
>   dtb-$(CONFIG_ARCH_K3) += k3-j721e-sk-csi2-dual-imx219.dtbo
>   
> [..]
> +
> +&wkup_pmx1 {
> +	mcu_fss0_ospi1_pins_default: mcu-fss0-ospi1-default-pins {
> +		pinctrl-single,pins = <
> +			J721S2_WKUP_IOPAD(0x008, PIN_OUTPUT, 0) /* (A19) MCU_OSPI1_CLK */
> +			J721S2_WKUP_IOPAD(0x024, PIN_OUTPUT, 0) /* (D20) MCU_OSPI1_CSn0 */
> +			J721S2_WKUP_IOPAD(0x014, PIN_INPUT, 0) /* (D21) MCU_OSPI1_D0 */
> +			J721S2_WKUP_IOPAD(0x018, PIN_INPUT, 0) /* (G20) MCU_OSPI1_D1 */
> +			J721S2_WKUP_IOPAD(0x01c, PIN_INPUT, 0) /* (C20) MCU_OSPI1_D2 */
> +			J721S2_WKUP_IOPAD(0x020, PIN_INPUT, 0) /* (A20) MCU_OSPI1_D3 */
> +		>;

Please have bootph-all in case, this is boot device


> [..]
> +
> +	wkup_uart0_pins_default: wkup-uart0-default-pins {
> +		pinctrl-single,pins = <
> +			J721S2_WKUP_IOPAD(0x070, PIN_INPUT, 0) /* (E25) WKUP_GPIO0_6.WKUP_UART0_CTSn */
> +			J721S2_WKUP_IOPAD(0x074, PIN_OUTPUT, 0) /* (F28) WKUP_GPIO0_7.WKUP_UART0_RTSn */
> +			J721S2_WKUP_IOPAD(0x048, PIN_INPUT, 0) /* (D28) WKUP_UART0_RXD */
> +			J721S2_WKUP_IOPAD(0x04c, PIN_OUTPUT, 0) /* (D27) WKUP_UART0_TXD */
> +		>;
> +		bootph-all;

Since this is shared with TIFS fw (debug prints), then i suggest not to 
have flow control on this UART


> +	};
> +};
> +
> [..]
> +
> +&ospi1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mcu_fss0_ospi1_pins_default>;
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0x0>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
> +		spi-max-frequency = <40000000>;
> +		cdns,tshsl-ns = <60>;
> +		cdns,tsd2d-ns = <60>;
> +		cdns,tchsh-ns = <60>;
> +		cdns,tslch-ns = <60>;
> +		cdns,read-delay = <2>;

Bootph-all  here


> +	};
> [..]
> +/* Shared with TIFS */
> +&wkup_uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&wkup_uart0_pins_default>;
> +	uart-has-rtscts;
> +	bootph-all;
> +	status = "okay";
> +};

Do you see possibility to keep reserve for fw ?


> diff --git a/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi b/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi
> new file mode 100644
> index 000000000000..f9fb0c78ccde
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am68-phycore-som.dtsi
> @@ -0,0 +1,594 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright (C) 2025 PHYTEC Messtechnik GmbH
> + * Author: Dominik Haller <d.haller@phytec.de>
> + *
> + * https://www.phytec.eu/en/produkte/system-on-modules/phycore-am68x-tda4x/
> [..]
> +
> +/* eMMC */
> +&main_sdhci0 {
> +	disable-wp;

I think no need to disable-wp for eMMC


> +	non-removable;
> +	ti,driver-strength-ohm = <50>;
> +	bootph-all;
> +	status = "okay";
> +};
> +
> [..]
> +
> +	pmic@48 {
> +		compatible = "ti,tps6594-q1";
> +		reg = <0x48>;
> +		system-power-controller;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pmic_irq_pins_default>;
> +		interrupt-parent = <&wkup_gpio0>;
> +		interrupts = <39 IRQ_TYPE_EDGE_FALLING>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		buck12-supply = <&vcc_3v3>;
> +		buck3-supply = <&vcc_3v3>;
> +		buck4-supply = <&vcc_3v3>;
> +		buck5-supply = <&vcc_3v3>;
> +		ldo1-supply = <&vcc_3v3>;
> +		ldo2-supply = <&vcc_3v3>;
> +		ldo3-supply = <&vcc_3v3>;
> +		ldo4-supply = <&vcc_3v3>;
> +		ti,primary-pmic;
> +
> +		regulators {
> +			bucka12: buck12 {
> +				regulator-name = "VDD_DDR_1V1";
> +				regulator-min-microvolt = <1100000>;
> +				regulator-max-microvolt = <1100000>;
> +				regulator-boot-on;
> +				regulator-always-on;

In case you want to enable ESM reset in u-boot,

Please carry bootph-all or bootph-pre-ram in one of regulator node


> +			};
> [..]


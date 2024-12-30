Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172D9E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 17:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9k73myKHnJBw/Qxb7EYQPplcgdHOsgbV15trPbrYOGc=; b=CmVfFDOG7XZQUNOplwPFP1GUy+
	HmK4x1ZTHemSkYO5vUW+EIzAikB4PhOfo8m5noDabhAulOGz2iWExi4g901t8+UVxzvCyq93eR7S2
	TV78scJBv2hWrR5Uat77xRNoct8ltW5CDDTD2lr2xWE2wcI7KsR+ppX44+YNSG491qG1BFV3OuXc1
	jMKmzup+8l3S1x91kTG2p8yECAewBgtbPS+BkAVPA/Ab88kF7pAr9L3r0lMVddlvrdRrsRfXKTrqi
	8L7wr2pl65uo/XtUrL5tqU9PjxvxVD9oxr7NGYuy+tv4+k6jZ7EPccx18MRpKD3odDx2HZgrBFFuu
	E2ZIAV4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSJNY-00000005Yeh-0rSW;
	Mon, 30 Dec 2024 17:16:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSJMN-00000005Ya7-2Aut;
	Mon, 30 Dec 2024 17:15:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3B61F5C1392;
	Mon, 30 Dec 2024 17:14:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52FDEC4CED0;
	Mon, 30 Dec 2024 17:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735578918;
	bh=0sjAsH5ayPW6hXrHhiuC0iSM/SUSpFO7ltP1BGYOyEk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=agqmFo8BLeJcd6/KPD2GqpQMC8/YmfniwxVbeLgJgRq7rAA8NLpoQXKDyS95FWTZB
	 ij8vk5kGY2rRm4CAMPUngJhHCEBg0lcQdxdYf94p3GXSEcqJVZz1KhmK1bV0iNyIB5
	 lZIuBEmNalXvudGAl8rfpBQoSZVNr/h2V9Zqz8yPSrmPTfOALtC9uF2CAKDUIg6nea
	 9VrG/x5CjU7rx/8evKn5r5cq3l34WSAHi7fPsnbpTUCZVBiVo46CaBQdSMY0DHcud3
	 AA31veUrwV67tZAzkXg2XRS7vQZyrd/1LrNLlwDIDrUzDnTAWCoDKAFPtwkK3spwvR
	 hrjK/VurZMOxw==
Message-ID: <2122a623-4124-4551-92a6-44273c43f71e@kernel.org>
Date: Mon, 30 Dec 2024 18:15:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: rockchip: Add BigTreeTech CB2 and Pi2
To: Ivan Sergeev <ivan8215145640@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241230-bigtreetech-cb2-v4-0-26d2d30e07ce@gmail.com>
 <20241230-bigtreetech-cb2-v4-2-26d2d30e07ce@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241230-bigtreetech-cb2-v4-2-26d2d30e07ce@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_091519_670216_1201394D 
X-CRM114-Status: GOOD (  10.69  )
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

On 30/12/2024 15:58, Ivan Sergeev wrote:
> BigTreeTech CB2 and Pi2 share a lot of hardware configuration, so a
> common dtsi file was used to define common nodes and properties. This is
> similar to how BigTreeTech CB1 and Pi are implemented.
> 


...

> +			vcc3v3_sd: SWITCH_REG2 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-name = "vcc3v3_sd";
> +				regulator-state-mem {
> +					regulator-off-in-suspend;
> +				};
> +			};
> +		};
> +
> +		codec {
> +			rockchip,mic-in-differential;
> +		};
> +	};
> +};
> +
> +&i2c2 {
> +	pinctrl-0 = <&i2c2m1_xfer>;
> +};
> +
> +&i2c3 {
> +	status = "okay";
> +
> +	tft_tp: ns2009@48 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation



> +		compatible = "ti,tsc2007";
> +		reg = <0x48>;
> +		status = "okay";
> +		ti,x-plate-ohms = <660>;
> +		ti,rt-thr = <3000>;
> +		ti,fuzzx = <32>;
> +		ti,fuzzy = <16>;
> +	};
> +};
> +
> +&i2s0_8ch {
> +	status = "okay";
> +};
> +
> +&i2s1_8ch {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2s1m0_sclktx
> +			&i2s1m0_lrcktx
> +			&i2s1m0_sdi0
> +			&i2s1m0_sdo0>;

Why this can't be one line?

> +	rockchip,trcm-sync-tx-only;
> +	status = "okay";
> +};
> +
> +&spi1 {
> +	pinctrl-0 = <&spi1m1_cs0 &spi1m1_pins>;
> +
> +	can_mcp2515: can-mcp2515@0 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +		status = "disabled";

Why? Anyway, srtatus is never the first property for new nodes.

> +		compatible = "microchip,mcp2515";
> +		reg = <0x00>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> +		spi-max-frequency = <10000000>;
> +		clocks = <&can_mcp2515_osc>;
> +		vdd-supply = <&vcc3v3_sys>;
> +		xceiver-supply = <&vcc3v3_sys>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&mcp2515_int_pin>;
> +	};
> +};
> +
> +&spi3 {
> +	pinctrl-0 = <&spi3m1_cs0 &spi3m1_pins>;
> +};
> +
> +&pcie2x1 {
> +	reset-gpios = <&gpio1 RK_PB2 GPIO_ACTIVE_HIGH>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie_reset_h>;
> +	vpcie3v3-supply = <&vcc3v3_pcie>;
> +	status = "okay";
> +};
> +
> +&pinctrl {
> +	wireless-bluetooth {
> +		uart1_gpios: uart1-gpios {
> +			rockchip,pins = <2 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	sd {
> +		sdmmc0_pwr_h: sdmmc0-pwr-h {
> +			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	mxc6655xa {
> +		mxc6655xa_irq_gpio: mxc6655xa_irq_gpio {


...

> +	};
> +
> +	bt {
> +		bt_enable: bt-enable-h {
> +			rockchip,pins = <2 RK_PB7 RK_FUNC_GPIO &pcfg_pull_down>;
> +		};
> +
> +		bt_host_wake: bt-host-wake-l {
> +			rockchip,pins = <2 RK_PC1 RK_FUNC_GPIO &pcfg_pull_down>;
> +		};
> +
> +		bt_wake: bt-wake-l {
> +			rockchip,pins = <2 RK_PC0 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	mcp2515_int_pin {
> +		mcp2515_int_pin: mcp2515_in_pin {

Don't use underscore. See DTS coding style.

> +			rockchip,pins = <4 RK_PA3 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +};
> +
> +&pmu_io_domains {
> +		status = "okay";
> +		pmuio1-supply = <&vcc3v3_pmu>;
> +		pmuio2-supply = <&vcc3v3_pmu>;
> +		vccio1-supply = <&vcc_3v3>;
> +		vccio2-supply = <&vcc_1v8>;
> +		vccio3-supply = <&vccio_sd>;
> +		vccio4-supply = <&vcc_1v8>;
> +		vccio5-supply = <&vcc_3v3>;
> +		vccio6-supply = <&vcc_3v3>;
> +		vccio7-supply = <&vcc_3v3>;

Messed indentation



> +
> +&sdmmc0 {
> +	max-frequency = <150000000>;
> +	bus-width = <4>;
> +	cap-mmc-highspeed;
> +	cap-sd-highspeed;
> +	disable-wp;
> +	//sd-uhs-sdr104;

Drop dead code

> +	vmmc-supply = <&vcc_sd>;
> +	vqmmc-supply = <&vccio_sd>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sdmmc0_bus4 &sdmmc0_clk &sdmmc0_cmd &sdmmc0_det>;
> +	status = "okay";
> +};
> +
> +&sdmmc1 {
> +	/* WiFi & BT combo module AMPAK AP6256 */
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	max-frequency = <150000000>;
> +	bus-width = <4>;
> +	disable-wp;
> +	cap-sd-highspeed;
> +	cap-sdio-irq;
> +	keep-power-in-suspend;
> +	mmc-pwrseq = <&sdio_pwrseq>;
> +	non-removable;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sdmmc1_bus4 &sdmmc1_cmd &sdmmc1_clk>;
> +	sd-uhs-sdr104;
> +	status = "okay";

Status is always the last property... or the first in overrides, but not
middle.

> +	rockchip,default-sample-phase = <90>;
> +
> +	sdio-wifi@1 {
> +		compatible = "brcm,bcm4329-fmac";
> +		reg = <1>;
> +		interrupt-parent = <&gpio2>;
> +		interrupts = <9 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "host-wake";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wifi_host_wake>;
> +		brcm,drive-strength = <10>;
> +	};
> +};
> +
> +&sfc {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +};
> +
> +&tsadc {
> +	status = "okay";
> +};
> +
> +&uart1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart1m0_xfer &uart1m0_ctsn &uart1m0_rtsn>;
> +	uart-has-rtscts;
> +	dma-names = "tx\0rx";

Hm? NUL byte?

> +
> +	bluetooth {
> +		compatible = "brcm,bcm4345c5";
> +		clocks = <&rk809 1>;
> +		clock-names = "lpo";
> +		device-wakeup-gpios = <&gpio2 RK_PC0 GPIO_ACTIVE_HIGH>;
> +		host-wakeup-gpios = <&gpio2 RK_PC1 GPIO_ACTIVE_HIGH>;
> +		shutdown-gpios = <&gpio2 RK_PB7 GPIO_ACTIVE_HIGH>;
> +		//pinctrl-names = "default";
> +		//pinctrl-0 = <&bt_host_wake &bt_wake &bt_enable>;
Drop dead code

Best regards,
Krzysztof


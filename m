Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED198C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXNqSD4M+STt9rPeJLNdSTkWXei7RgeGLCS8pC4zY2w=; b=YVu9d53mVPeghPZdhEc/nL+fJL
	eHeL8EJVn34sMoyEng5P4mk44OXlDpKPHb/Arle4a76oASD2ERXEk3tx6YLCWpa4ktouZH7l/nBbu
	ayo3R4GS1o9xnQ7Nn45LcvN/z43FIE7yN2XTpqahoMNwXClW1EYlEFNKJbVhFMRNja1K2W++0JN+Z
	hwEBcYDaVlB7mAEB169EtQIZhc9smN1f2cdYmjG9zwY+R0sNsNTmlN4FpICrchuxq9FPKkACkeBN0
	sMajtPipCppH6PmmD1v+HumRsSIU1IivjD33y1k5xU9tczsdSmq0L+UkmTJal5YEel77br4YhVKNs
	V1zfo5sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x52zv-0000000H1RE-1Oqu;
	Fri, 11 Sep 2026 15:17:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x52zr-0000000H1Qa-1CV2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 15:17:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B05716A3;
	Fri, 11 Sep 2026 08:16:52 -0700 (PDT)
Received: from [10.57.6.75] (unknown [10.57.6.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 866A73F8C6;
	Fri, 11 Sep 2026 08:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789139816; bh=SH9LQjovDQKwYst9EmYx/0+2qn295mC9Q+2GFhxBYLs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VrDyOKDUEAoDzxB/jtc1qwotnvW8CKelDYAZgbTzMT4DvT2KmQrcUOx7l+dSn5ZtP
	 xAXAzNyC5W13BfhS8cMlkUVH84i7/pvi5LoE5oNcq57voI6avTUmW34tSBFazyx+w3
	 gFA1eHbbiwzSuccwAOShQBbsFJ+TN697fe14Ecso=
Message-ID: <63a19617-9349-4dd4-b9cb-dc677edc387f@arm.com>
Date: Fri, 11 Sep 2026 17:16:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: allwinner: Add SPC Glee 10.1 A64
To: jcarlosgl96@proton.me, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260911-b4-spc-glee-a64-v1-v2-0-ed0b7ff02e0b@proton.me>
 <20260911-b4-spc-glee-a64-v1-v2-2-ed0b7ff02e0b@proton.me>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260911-b4-spc-glee-a64-v1-v2-2-ed0b7ff02e0b@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_081659_404822_361B80D3 
X-CRM114-Status: GOOD (  23.61  )
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

thanks for taking the time to send this upstream!
Have you looked at the Pinetab .dts? That could serve as a guideline for 
the other peripherals. Typically many devices follow some Allwinner 
reference design, so are close to each other.

On 9/11/26 15:48, Juan Carlos Gutiérrez Lavado via B4 Relay wrote:
> From: Juan Carlos Gutiérrez Lavado <jcarlosgl96@proton.me>
> 
> Add support for the SPC Glee 10.1 tablet based on the Allwinner A64.
> Describe the 2 GiB DRAM configuration, AXP803 PMIC, essential supplies,
> microSD, UART, battery monitoring and USB peripheral port. Leave eMMC

why is that? eMMC should be very easy to enable: you just need to figure 
out if it's 1.8V or 3.3V, the speed (mode) in a BSP booted system should 
give you some clue.
> and unverified peripherals disabled.
> 
> Include CPU operating points for frequency scaling and thermal cooling.
> Enable the PMIC USB supply and connect it to the PHY for VBUS detection.
> Keep the ALDO2 VCC-PL and ALDO3 VCC-PLL/AVCC supplies enabled, matching
> the stock firmware and the measured 1.8 V and 3.0 V baseline settings.
> 
> Tested with kexec into Linux 7.3.0-rc1 without regulator_ignore_unused:
> CPU frequency transitions, CPU cooling frequency cap, and USB supply
> unplug/replug detection with SSH reconnection. Cold-boot validation of
> this revision remains pending.
> 
> Signed-off-by: Juan Carlos Gutiérrez Lavado <jcarlosgl96@proton.me>
> ---
>   arch/arm64/boot/dts/allwinner/Makefile             |   1 +
>   .../boot/dts/allwinner/sun50i-a64-spc-glee.dts     | 143 +++++++++++++++++++++
>   2 files changed, 144 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> index aa21f58a4..cc6687b39 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -21,6 +21,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinephone-1.2.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinetab.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pinetab-early-adopter.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-sopine-baseboard.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-spc-glee.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-teres-i.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h64-remix-mini-pc.dtb
>   dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a100-allwinner-perf1.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-spc-glee.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-spc-glee.dts
> new file mode 100644
> index 000000000..0f8f37b14
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-spc-glee.dts
> @@ -0,0 +1,143 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2026 SPC Glee A64 Linux contributors
> + */
> +
> +/dts-v1/;
> +
> +#include "sun50i-a64.dtsi"
> +#include "sun50i-a64-cpu-opp.dtsi"
> +
> +/ {
> +	model = "SPC Glee 10.1 A64";
> +	compatible = "onspc,glee-10-1-a64", "allwinner,sun50i-a64";
> +	chassis-type = "tablet";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0x40000000 0x80000000>;
> +	};

Please no memory nodes, this is up to the bootloader (U-Boot) to detect 
and insert into the DTB.
> +};
> +
> +&cpu0 {
> +	cpu-supply = <&reg_dcdc2>;
> +};
> +
> +&cpu1 {
> +	cpu-supply = <&reg_dcdc2>;
> +};
> +
> +&cpu2 {
> +	cpu-supply = <&reg_dcdc2>;
> +};
> +
> +&cpu3 {
> +	cpu-supply = <&reg_dcdc2>;
> +};
> +
> +&mmc0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mmc0_pins>;
> +	vmmc-supply = <&reg_dcdc1>;
> +	vqmmc-supply = <&reg_dcdc1>;
> +	broken-cd;
> +	bus-width = <4>;
> +	max-frequency = <25000000>;

Why is this? This would limit the SD card to just 12.5 MB/s, half of 
what it can do at High-Speed mode (at 3.3V).
If it can do 50 MHz (~25MB/s at 4 bits), you wouldn't need to enter a 
max frequency at all, as the 3.3V I/O supply would limit the frequency 
to that anyway.

> +	status = "okay";
> +};
> +
> +&r_rsb {
> +	status = "okay";
> +
> +	axp803: pmic@3a3 {
> +		compatible = "x-powers,axp803";
> +		reg = <0x3a3>;
> +		interrupt-parent = <&r_intc>;
> +		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};
> +
> +#include "axp803.dtsi"
> +
> +&axp_adc {
> +	status = "okay";
> +};
> +
> +&battery_power_supply {
> +	status = "okay";
> +};
> +
> +&reg_aldo2 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1800000>;
> +	regulator-max-microvolt = <1800000>;
> +	regulator-name = "vcc-pl";
> +};
> +
> +&reg_aldo3 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <3000000>;
> +	regulator-max-microvolt = <3000000>;
> +	regulator-name = "vcc-pll-avcc";
> +};
> +
> +&reg_dcdc1 {
> +	regulator-always-on;
> +	regulator-name = "vcc-3v3";
> +};
> +
> +&reg_dcdc2 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1000000>;
> +	regulator-max-microvolt = <1300000>;
> +	regulator-name = "vdd-cpux";
> +};
> +
> +&reg_dcdc5 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1500000>;
> +	regulator-max-microvolt = <1500000>;
> +	regulator-name = "vcc-dram";
> +};
> +
> +&reg_dcdc6 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1100000>;
> +	regulator-max-microvolt = <1100000>;
> +	regulator-name = "vdd-sys";
> +};
> +
> +&reg_fldo2 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1100000>;
> +	regulator-max-microvolt = <1100000>;
> +	regulator-name = "vdd-cpus";
> +};
> +
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_pb_pins>;
> +	status = "okay";
> +};
> +
> +&usb_otg {
> +	dr_mode = "peripheral";

Is that really peripheral only? I guess it can do OTG, right? You hint 
at that above in the commit message. You would just need to specify 
usb0_id_det-gpios in the usbphy node below. If you are lucky, the BSP's 
/sys/kernel/debug/gpio would give you a hint which GPIO it is.

Cheers,
Andre

> +	status = "okay";
> +};
> +
> +&usb_power_supply {
> +	status = "okay";
> +};
> +
> +&usbphy {
> +	usb0_vbus_power-supply = <&usb_power_supply>;
> +	status = "okay";
> +};
> 



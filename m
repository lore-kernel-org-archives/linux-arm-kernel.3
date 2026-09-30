Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D368CA5FBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 12:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bu2dadxbchBOlRvLuIVSPK1UHvvVmB3poKMzc4ts/yU=; b=CXLyOsylb6WDl+RwJw1GgeCjeQ
	ALnj928su8skiiU+MC5mzzbxPiOPYCl97AJReY5oz1D/3nVBerJdqCakcWGG54X9tXSC1JL7f+RH2
	/jFzL+Bd2g7pEIGFFY1BaO+4H/RTH1sTcVekDV75dfCVfwm2W4WL8xI8DyORTXZBDC3f89Pn1NOQ2
	KbqmKgmMb0bRT/S30NNWMqSVVcY5tYrOQXbwsvtcIcWTZ0pmQNcnAx+ixnJFO8/F75FgXVsTz6MVb
	0Z9Krq8SFtCBN7mQc8lMVLzu6RHEd6s5a4NUMjAbaCfi7fXfb1x2v8KkVYNIWBWfAG9QLQSJsopsy
	cTdkSL4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBt08-00000005xMe-2v7h;
	Wed, 30 Sep 2026 12:01:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBt04-00000005xLc-23dl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 12:01:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13A60143D;
	Wed, 30 Sep 2026 05:01:20 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 572893F86F;
	Wed, 30 Sep 2026 05:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790769683; bh=YbIY2rui/hWhIuxGu1KcNDurWpS78yPBrwn4KOsrv2s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HTf9R45FHoPrMLPdv1LuWYj23imVUb5goyNap/KjyspqUoCdkMhzYpj9BXYwC8hTA
	 yD11rQvNi2LLhzQFZKV3Q6WhyDrYHYLeipMI0bcPiDXOHsArSTOKavwglbpX0jx+nP
	 lm1HDkJm6OfvwydlZmOkrSlvuEYQ53S1gvDIfpvA=
Message-ID: <eb443e72-403c-40c1-8ff7-203e0d4c7a94@arm.com>
Date: Wed, 30 Sep 2026 14:01:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] ARM: sunxi: add B288 and the PocketBook Verse
 board
To: Pablo Mazzini <pmazzini@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
References: <20260927151016.186493-1-pmazzini@gmail.com>
 <20260927151016.186493-12-pmazzini@gmail.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260927151016.186493-12-pmazzini@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_050128_682059_2EFF15CC 
X-CRM114-Status: GOOD (  43.49  )
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

many thanks for cobbling this together, I do understand that this is 
tricky without schematics or even a manual.

On 9/27/26 17:10, Pablo Mazzini wrote:
> arm,cpu-registers-not-fw-configured is required: Allwinner's boot0 sets
> neither CNTFRQ nor CNTVOFF, so the virtual timer storms. Same reason as
> commit 121b96cd9d7e ("ARM: sun6i: Enable ARM arch timers").

Are you planning on going ahead with just boot0 in the long run? Given 
the age of the platform, and it being close to the A64, I expect a 
U-Boot port being pretty straight-forward. Chances are the DRAM 
controller (the biggest hurdle here) is very similar to the H3/A64/R40 
generation, for which we already have a unified driver.

And in general: how do you boot this device, then? I guess you somehow 
trick boot0 into booting a mainline kernel? Is there some documentation 
about this?
Can you please create a wiki page about the device, and describe your 
device-specific findings in there? There is 
https://linux-sunxi.org/PocketBook_Basic_Lux_4_(PB618) already, which 
you can use as inspiration. Or maybe, if they are very similar, use that 
very page, even.

> The watchdog interrupt was measured on hardware via GICD_ISPENDR.
> 
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
>   arch/arm/boot/dts/allwinner/Makefile          |   1 +
>   .../allwinner/sun8i-b288-pocketbook-verse.dts | 122 +++++++
>   arch/arm/boot/dts/allwinner/sun8i-b288.dtsi   | 304 ++++++++++++++++++
>   arch/arm/mach-sunxi/sunxi.c                   |   1 +
>   4 files changed, 428 insertions(+)
>   create mode 100644 arch/arm/boot/dts/allwinner/sun8i-b288-pocketbook-verse.dts
>   create mode 100644 arch/arm/boot/dts/allwinner/sun8i-b288.dtsi
> 
> diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
> index 75b2b6a2f7a6..2dfdc01e4825 100644
> --- a/arch/arm/boot/dts/allwinner/Makefile
> +++ b/arch/arm/boot/dts/allwinner/Makefile
> @@ -227,6 +227,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
>   	sun8i-a83t-bananapi-m3.dtb \
>   	sun8i-a83t-cubietruck-plus.dtb \
>   	sun8i-a83t-tbs-a711.dtb \
> +	sun8i-b288-pocketbook-verse.dtb \
>   	sun8i-h2-plus-bananapi-m2-zero.dtb \
>   	sun8i-h2-plus-libretech-all-h3-cc.dtb \
>   	sun8i-h2-plus-orangepi-r1.dtb \
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-b288-pocketbook-verse.dts b/arch/arm/boot/dts/allwinner/sun8i-b288-pocketbook-verse.dts
> new file mode 100644
> index 000000000000..91c89d5a097e
> --- /dev/null
> +++ b/arch/arm/boot/dts/allwinner/sun8i-b288-pocketbook-verse.dts
> @@ -0,0 +1,122 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * PocketBook Verse (PB629), an Allwinner B288 based e-reader.
> + */
> +
> +/dts-v1/;
> +#include "sun8i-b288.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	model = "PocketBook Verse";
> +	compatible = "pocketbook,verse", "allwinner,sun8i-b288";
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

We typically don't hardcode memory nodes in the DT, but leave this up to 
the bootloader to populate, based on either detection or hard-coding 
*there*.
I guess this eBook reader only comes in this one configuration?
Maybe we could allow this node in here, then, to increase compatiblity? 
Depends a bit on how involved this boot0 setup is, I guess.

> +		device_type = "memory";
> +		reg = <0x40000000 0x20000000>;
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&mmc0 {
> +	vmmc-supply = <&reg_dldo2>;
> +	bus-width = <4>;
> +	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */

I guess this is microSD, so without a write-protection switch? Then 
please add the "disable-wp;" property.
Also this is missing the pinctrl properties, to describe the pinmux 
used. As you describe the PortB UART0 pins in the .dtsi, just reference 
them here.

And are you sure the vmmc-supply is dldo2? Does the VCC pin on the SD 
card slot go to 0V when you turn that regulator off?
Just asking because on this generation of devices we most often see 
DCDC1 supplying the SD card, as it needs to be powered at reset time, to 
allow the BROM reading from the SD card.

> +	status = "okay";
> +};
> +
> +&mmc3 {
> +	vmmc-supply = <&reg_dcdc1>;
> +	vqmmc-supply = <&reg_dldo1>;

If this is a 1.8V eMMC, then please add the 1.8V properties:
         mmc-ddr-1_8v;
         mmc-hs200-1_8v;
(given that these modes work).
And again the pinctrl nodes are missing.

> +	bus-width = <8>;
> +	non-removable;
> +	cap-mmc-hw-reset;
> +	status = "okay";
> +};
> +
> +&pio {
> +	vcc-pc-supply = <&reg_dldo1>;
> +	vcc-pd-supply = <&reg_dldo1>;
> +	/*
> +	 * PC and PD are named in the vendor rail list; PF is not. It is not
> +	 * on dldo2: with that rail off, a pull-up on PF6 still reads card
> +	 * detect correctly, so the bank has its own supply. dcdc1 is the
> +	 * only remaining candidate, carrying vcc-io and vcc-card. Derived
> +	 * from the rail naming plus that measurement, not from a schematic.
> +	 */
> +	vcc-pf-supply = <&reg_dcdc1>;

Yes, on older SoCs PortF is internally powered by the VCC-IO pin, and is 
fixed at 3.3V. Compare the datasheets from the A64 and H3, for instance.
And VCC-IO is traditionally powered by DCDC1, since it needs the most juice.
In any case, I think we don't need the comment, since it's a common setup.

> +};
> +
> +&i2c0 {
> +	status = "okay";
> +
> +	axp22x: pmic@34 {

Can you add a comment here that this is labelled as AXP227?

> +		compatible = "x-powers,axp221";
> +		reg = <0x34>;
> +		interrupt-parent = <&nmi_intc>;
> +		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};
> +
> +#include "axp22x.dtsi"
> +
> +&reg_dcdc1 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <3000000>;
> +	regulator-max-microvolt = <3000000>;
> +	regulator-name = "vcc-io";
> +};
> +
> +&reg_dcdc2 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1260000>;
> +	regulator-max-microvolt = <1260000>;
> +	regulator-name = "vdd-cpu";
> +};
> +
> +&reg_dcdc4 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1100000>;
> +	regulator-max-microvolt = <1100000>;
> +	regulator-name = "vdd-sys";
> +};
> +
> +&reg_dcdc5 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <1350000>;
> +	regulator-max-microvolt = <1350000>;
> +	regulator-name = "vcc-dram";
> +};
> +
> +&reg_aldo3 {
> +	regulator-always-on;
> +	regulator-min-microvolt = <3000000>;
> +	regulator-max-microvolt = <3000000>;
> +	regulator-name = "avcc";
> +};
> +
> +&reg_dldo1 {
> +	regulator-always-on;

Do you really need the always-on here?
Does it power more than the eMMC? Can you boot from SD card and use the 
system with that property removed, and the kernel turning it off?

> +	regulator-min-microvolt = <1800000>;
> +	regulator-max-microvolt = <1800000>;
> +	regulator-name = "vcc-pc";
> +};
> +
> +&reg_dldo2 {
> +	/* Powers the microSD slot (slot pin 4), switched per card scan. */

What does "switched per card scan" mean?
And it's rather uncommon to see the SD card powered by a separate PMIC 
line, since it needs to be on at reset, to allow the BROM to access it.
According to the AXP221 datasheet, dldo2 is off at reset, so can you 
please somehow check this? It might be different on the AXP227, but 
worth a try, I think.

> +	regulator-min-microvolt = <3300000>;
> +	regulator-max-microvolt = <3300000>;
> +	regulator-name = "vcc-sdcv";
> +};
> diff --git a/arch/arm/boot/dts/allwinner/sun8i-b288.dtsi b/arch/arm/boot/dts/allwinner/sun8i-b288.dtsi
> new file mode 100644
> index 000000000000..f5feec87defc
> --- /dev/null
> +++ b/arch/arm/boot/dts/allwinner/sun8i-b288.dtsi
> @@ -0,0 +1,304 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Allwinner B288 (sun8iw10p1) SoC
> + *
> + * Addresses and interrupts come from the PocketBook Verse (PB629) vendor
> + * device tree, cross-checked against the BSP clk-sun8iw10.c.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/sun8i-b288-ccu.h>
> +#include <dt-bindings/reset/sun8i-b288-ccu.h>
> +
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	interrupt-parent = <&gic>;
> +
> +	clocks {

I don't think we put the crystals in their own node anymore. I see that 
we did this for the 32-bit Allwinner SoCs, but it's pointless.

> +		osc24M: osc24M-clk {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <24000000>;
> +			clock-output-names = "osc24M";
> +		};
> +
> +		osc32k: osc32k-clk {
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <32768>;
> +			clock-output-names = "osc32k";
> +		};
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			compatible = "arm,cortex-a7";
> +			device_type = "cpu";
> +			reg = <0>;
> +			clocks = <&ccu CLK_CPUX>;
> +			clock-names = "cpu";
> +		};
> +
> +		cpu1: cpu@1 {
> +			compatible = "arm,cortex-a7";
> +			device_type = "cpu";
> +			reg = <1>;
> +			clocks = <&ccu CLK_CPUX>;
> +			clock-names = "cpu";
> +		};
> +	};


So how does SMP work here, exactly? For the later 32-bit SoCs, we rely 
on a PSCI implmenetation in U-Boot, and I would strongly recommend doing 
so here as well.

> +
> +	timer {
> +		compatible = "arm,armv7-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
> +		clock-frequency = <24000000>;
> +		arm,cpu-registers-not-fw-configured;

Meh, as the comments in the binding say: please fix your firmware ;-)
I am not completely against it if boot0 is the firmware to use for a 
while, but if we go with U-Boot, it would be nicely fixed there.

> +	};
> +
> +	soc {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		/*
> +		 * mmc0 is a v4p1x controller, so it runs in the old timing
> +		 * mode and needs the sample and output phase clocks.

I think the comment can end here.
But it would need to be moved below, above the actual mmc0 node.

>		Do not
> +		 * give it the sun50i-a64-mmc fallback: that selects the new
> +		 * timing mode, which this block does not implement.
> +		 */
> +		nmi_intc: interrupt-controller@1c000d0 {
> +			compatible = "allwinner,sun8i-b288-nmi",
> +				     "allwinner,sun9i-a80-nmi";
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			reg = <0x01c000d0 0x0c>;
> +			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		mmc0: mmc@1c0f000 {
> +			compatible = "allwinner,sun8i-b288-mmc",
> +				     "allwinner,sun7i-a20-mmc";
> +			reg = <0x01c0f000 0x1000>;
> +			clocks = <&ccu CLK_BUS_SDMMC0_BUS>,
> +				 <&ccu CLK_MMC0>,
> +				 <&ccu CLK_MMC0_OUTPUT>,
> +				 <&ccu CLK_MMC0_SAMPLE>;
> +			clock-names = "ahb", "mmc", "output", "sample";
> +			resets = <&ccu RST_BUS_MMC0>;
> +			reset-names = "ahb";
> +			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&mmc0_pins>;
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		/* SDXC v4.5. The soldered eMMC; shares the PC pads with mmc2. */

This comment should go. Pinmuxing is described separately, and "the 
soldered eMMC" does not belong into a .dtsi file, since it's board specific.
If you really want to document some of your findings, you can do so in 
the commit message.

> +		mmc3: mmc@1c12000 {
> +			compatible = "allwinner,sun8i-b288-emmc",
> +				     "allwinner,sun50i-a64-emmc";
> +			reg = <0x01c12000 0x1000>;
> +			clocks = <&ccu CLK_BUS_SDMMC3_BUS>, <&ccu CLK_MMC3>;
> +			clock-names = "ahb", "mmc";
> +			resets = <&ccu RST_BUS_MMC3>;
> +			reset-names = "ahb";
> +			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&mmc3_pins>;
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		/*
> +		 * mmc2 (0x01c11000) is an SDHCI-style controller, not SDXC, and
> +		 * has no upstream binding. It loses the PC pad arbitration to
> +		 * mmc3 and is unused here, so it is left undescribed rather than
> +		 * given a wrong compatible.
> +		 */

You can shorten the comment to:
	"mc2 @0x01c11000 is an unsupported SDHCI-style controller."

> +
> +		ccu: clock-controller@1c20000 {
> +			compatible = "allwinner,sun8i-b288-ccu";
> +			reg = <0x01c20000 0x400>;
> +			clocks = <&osc24M>, <&osc32k>;
> +			clock-names = "hosc", "losc";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
> +		rtc: rtc@1c20400 {
> +			compatible = "allwinner,sun8i-b288-rtc";
> +			reg = <0x01c20400 0x400>;
> +			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> +			clock-output-names = "osc32k";
> +			clocks = <&osc32k>;
> +			#clock-cells = <1>;
> +		};
> +
> +		pio: pinctrl@1c20800 {
> +			compatible = "allwinner,sun8i-b288-pinctrl";
> +			reg = <0x01c20800 0x400>;
> +			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_PIO>, <&osc24M>, <&osc32k>;
> +			clock-names = "apb", "hosc", "losc";
> +			gpio-controller;
> +			#gpio-cells = <3>;
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +
> +			mmc0_pins: mmc0-pins {
> +				pins = "PF0", "PF1", "PF2",
> +				       "PF3", "PF4", "PF5";
> +				function = "sdc0";

We do not use the BSP function naming, but "mmc0" instead.

> +				allwinner,pinmux = <2>;
> +				drive-strength = <30>;
> +				bias-pull-up;
> +			};
> +
> +			i2c0_pins: i2c0-pins {
> +				pins = "PB6", "PB7";
> +				function = "twi0";

Same here, "i2c0" please.

> +				allwinner,pinmux = <2>;
> +			};
> +
> +			mmc3_pins: mmc3-pins {
> +				pins = "PC1", "PC4", "PC5", "PC6",
> +				       "PC7", "PC8", "PC9", "PC10",
> +				       "PC11", "PC12", "PC13", "PC14";
> +				function = "sdc3";

function = "mmc3";

> +				allwinner,pinmux = <5>;
> +				drive-strength = <40>;
> +				bias-pull-up;
> +			};
> +
> +			uart0_pb_pins: uart0-pb-pins {
> +				pins = "PB4", "PB5";
> +				function = "uart0";
> +				allwinner,pinmux = <2>;
> +			};
> +		};
> +
> +		wdt: watchdog@1c20ca0 {
> +			compatible = "allwinner,sun6i-a31-wdt";

I think lately we used this as a fallback, paired with a SoC specific 
compatible first.
In many aspects the more recent DTs under the arch/arm64 directory are 
more modern and a better source to copy from.
> +			reg = <0x01c20ca0 0x20>;
> +			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&osc24M>;
> +		};
> +
> +		uart0: serial@1c28000 {
> +			compatible = "snps,dw-apb-uart";
> +			reg = <0x01c28000 0x400>;
> +			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&ccu CLK_BUS_UART0>;
> +			resets = <&ccu RST_BUS_UART0>;
> +			status = "disabled";
> +		};
> +
> +		uart1: serial@1c28400 {
> +			compatible = "snps,dw-apb-uart";
> +			reg = <0x01c28400 0x400>;
> +			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&ccu CLK_BUS_UART1>;
> +			resets = <&ccu RST_BUS_UART1>;
> +			status = "disabled";
> +		};
> +
> +		uart2: serial@1c28800 {
> +			compatible = "snps,dw-apb-uart";
> +			reg = <0x01c28800 0x400>;
> +			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&ccu CLK_BUS_UART2>;
> +			resets = <&ccu RST_BUS_UART2>;
> +			status = "disabled";
> +		};
> +
> +		uart3: serial@1c28c00 {
> +			compatible = "snps,dw-apb-uart";
> +			reg = <0x01c28c00 0x400>;
> +			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&ccu CLK_BUS_UART3>;
> +			resets = <&ccu RST_BUS_UART3>;
> +			status = "disabled";
> +		};
> +
> +		uart4: serial@1c29000 {
> +			compatible = "snps,dw-apb-uart";
> +			reg = <0x01c29000 0x400>;
> +			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&ccu CLK_BUS_UART4>;
> +			resets = <&ccu RST_BUS_UART4>;
> +			status = "disabled";
> +		};
> +
> +		i2c0: i2c@1c2ac00 {
> +			compatible = "allwinner,sun8i-b288-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x01c2ac00 0x400>;
> +			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_TWI0>;
> +			resets = <&ccu RST_BUS_I2C0>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&i2c0_pins>;
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c1: i2c@1c2b000 {
> +			compatible = "allwinner,sun8i-b288-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x01c2b000 0x400>;
> +			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_TWI1>;
> +			resets = <&ccu RST_BUS_I2C1>;
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		i2c2: i2c@1c2b400 {
> +			compatible = "allwinner,sun8i-b288-i2c",
> +				     "allwinner,sun6i-a31-i2c";
> +			reg = <0x01c2b400 0x400>;
> +			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&ccu CLK_BUS_TWI2>;
> +			resets = <&ccu RST_BUS_I2C2>;
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		gic: interrupt-controller@1c81000 {
> +			compatible = "arm,gic-400";
> +			reg = <0x01c81000 0x1000>,
> +			      <0x01c82000 0x2000>,
> +			      <0x01c84000 0x2000>,
> +			      <0x01c86000 0x2000>;
> +			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +		};
> +	};
> +};
> diff --git a/arch/arm/mach-sunxi/sunxi.c b/arch/arm/mach-sunxi/sunxi.c
> index e1b7945aac99..c5b19d0e63f9 100644
> --- a/arch/arm/mach-sunxi/sunxi.c
> +++ b/arch/arm/mach-sunxi/sunxi.c
> @@ -61,6 +61,7 @@ MACHINE_END
>   static const char * const sun8i_board_dt_compat[] = {
>   	"allwinner,sun8i-a23",
>   	"allwinner,sun8i-a33",
> +	"allwinner,sun8i-b288",

Do we really need that entry? Or at least do we need the timer init part 
of that?
And in any case it doesn't belong into the DT patch, as it's Linux code, 
not DT or binding related.

Cheers,
Andre

>   	"allwinner,sun8i-h2-plus",
>   	"allwinner,sun8i-h3",
>   	"allwinner,sun8i-r40",



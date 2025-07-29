Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADD6C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 22:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Ccr56Is1Rfk2SiS/uJUbErmNhk/5uP/PAiUGQwInNM=; b=hhFvNrQ3qcgCs5ZOfXAR/z8+VW
	XWW7Sjy7K/jUKIHvYXMGSD1+CH/+yiSGZUuzEZE7ooNIeLjbLfaw+xiB/tW0a0fVkBjQ3vhUf4gq4
	tvcSBSrLiopTTOdd2QutUpZsQVoiKtc73mgQuzi36yK6SaxQqvSCwoV7gaQORfIAxeZbjvZX86Ob2
	BzwgGx0fPM0+PuK7HBQvPbIq7Hg1FtfBxwqNeWVfs1HdepMszzhhENmOrw5aAnWo6Ta7v6oG9J0T9
	pJYMju+zFYHOhXvpxn4PQmfvnFNrCkr8vvJrgy0Rh8p0U5Do57ay/zQHqq2MzAygM7usTq0v/j7jb
	JbQmZH6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugsWh-00000000ARn-0kFV;
	Tue, 29 Jul 2025 22:10:27 +0000
Received: from chumsalmon.baetis.net ([209.222.21.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugsUE-00000000AAk-14xd;
	Tue, 29 Jul 2025 22:07:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tahomasoft.com;
	s=default; t=1753826872;
	bh=jdP8s86vYvElqMc9MRRxZ21Uvfhmc6d7quFvHaC2cSY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=f3LA7VbGPBbQ5/xlUivOR+0h9d3FOLbpu+zg18TKb3sR1N1Wvg4IZMgbEDsxC3hLn
	 3ccmzQus/3WulSamWmqfkUsKsIQQhjHfhGt83Lx1oVKXoOtpR92p4WurBaVSJiVbb/
	 dYS7h8OC98jaj/z7T055KTYPUnsfqB9zCwS5ExozDmMDbEQOttRZO9bU6qvjX39iss
	 TKgngZtvGyE4fdFHnXhYTkhV1Fe/IZnAg9inbbY5SHOWKvTvkwub9oRxAfyBYtyU50
	 vIDSB6UxyCFPyF9OeyG0ctuzm9yBqyotbrBUmeJcUl2YhNk4o04/i0Bw6/owkkj3+u
	 Y6c4npL07YCOQ==
Received: from WahpenayoPeak.tahoma.link (unknown [IPv6:2600:4040:50b7:b604:2ea0:d8ae:cc27:168f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by chumsalmon.baetis.net (Postfix) with ESMTPSA id 5FF2927E211;
	Tue, 29 Jul 2025 22:07:52 +0000 (UTC)
Date: Tue, 29 Jul 2025 18:07:45 -0400
From: Erik Beck <xunil@tahomasoft.com>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] arm64: dts: rockchip: add LinkStar-H68k-1432v1
Message-ID: <20250729180745.713b4f75.xunil@tahomasoft.com>
In-Reply-To: <8ef3e1f4-4658-408f-8f46-ee9fc48d7a8d@kwiboo.se>
References: <20250729-linkstar-6-16-rc1-v6-v6-0-92307f465835@tahomasoft.com>
	<20250729-linkstar-6-16-rc1-v6-v6-2-92307f465835@tahomasoft.com>
	<8ef3e1f4-4658-408f-8f46-ee9fc48d7a8d@kwiboo.se>
Organization: Tahoma Soft
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_150754_577445_78CEAE12 
X-CRM114-Status: GOOD (  38.48  )
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

On Tue, 29 Jul 2025 22:30:35 +0200
Jonas Karlman <jonas@kwiboo.se> wrote:

> Hi Erik,
> 

Hi Jonas, 

Thanks for the in-depth review!

> On 7/29/2025 4:39 PM, Erik Beck wrote:
> > Add DTS for Seeed LinkStar H68K-1432v1 board, a travel router using
> > Rockchip rk3568 SoC.
> > 
> > Signed-off-by: Erik Beck <xunil@tahomasoft.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/Makefile              |   1 +
> >  .../dts/rockchip/rk3568-linkstar-h68k-1432v1.dts   | 740
> > +++++++++++++++++++++ 2 files changed, 741 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/Makefile
> > b/arch/arm64/boot/dts/rockchip/Makefile index
> > 4bf84622db473696f64b157ba94560f476d4f52f..baae5a9a3f06e0c7f74c9252eb244bb03989f2d7
> > 100644 --- a/arch/arm64/boot/dts/rockchip/Makefile +++
> > b/arch/arm64/boot/dts/rockchip/Makefile @@ -128,6 +128,7 @@
> > dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-bpi-r2-pro.dtb
> > dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-evb1-v10.dtb
> > dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-fastrhino-r66s.dtb
> > dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-fastrhino-r68s.dtb
> > +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-linkstar-h68k-1432v1.dtb
> > dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-lubancat-2.dtb
> > dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-mecsbc.dtb
> > dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-nanopi-r5c.dtb diff --git
> > a/arch/arm64/boot/dts/rockchip/rk3568-linkstar-h68k-1432v1.dts
> > b/arch/arm64/boot/dts/rockchip/rk3568-linkstar-h68k-1432v1.dts new file
> > mode 100644 index
> > 0000000000000000000000000000000000000000..1d05ce94746288299618961280378b50eb3ade42
> > --- /dev/null +++
> > b/arch/arm64/boot/dts/rockchip/rk3568-linkstar-h68k-1432v1.dts @@ -0,0
> > +1,740 @@ +// SPDX-License-Identifier: (GPL-2.0+ OR MIT) +/*
> > + * Copyright (c) 2025 TahomaSoft xunil@tahomasoft.com
> > + */
> > +
> > +/dts-v1/;
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/leds/common.h>
> > +#include <dt-bindings/input/input.h>
> > +#include <dt-bindings/pinctrl/rockchip.h>
> > +#include <dt-bindings/soc/rockchip,vop2.h>
> > +#include "rk3568.dtsi"
> > +
> > +/ {
> > +	model = "Seeed LinkStar H68K-1432V1 (RK3568) DDR4 Board";  
> 
> I suggest you name this board "Seeed Studio LinkStar-H68K".
> 

I think this is a great idea; glad to get guidance and a reason to drop the
long, clunky name I had been using for this board. 

Your other comments below look great; it will take me a bit of time to dig
into some of them to make sure I get them right.  If I have follow-up
questions, should I ask them on the mailing lists, or is sending you
questions via direct email (not sending to the lists) the proper procedure?

Again, thanks for your thoughtful review and comments. I'll start working on them.

Regards,

Erik

> From what I can tell from e.g. wiki.seeedstudio.com and other boards in
> tree "Seeed Studio" seem to be more used than only "Seeed".
> 
> Also the 1432 numbers seem to just help indicate WiFi (1), RAM (4) and
> eMMC (32), there is e.g. also a 0232 variant that has no WiFi, 2 GiB RAM
> and 32 GiB eMMC. No need to have this information in the board model or
> DT name, please drop it.
> 
> Use of v1 is possible also not needed, the V2 model is clearly marketed
> as a different product and not just an updated hw revision. I suggest
> you name this board without v1, the V2 can be named "LinkStar-H68K-V2"
> to closer match product wiki and marketing.
> 
> > +	compatible = "seeed,rk3568-linkstar-h68k-1432v1",
> > "rockchip,rk3568";  
> 
> Use of rk3568 seem redundant, suggest something like:
> 
>   "seeed,linkstar-h68k", "rockchip,rk3568"
> 
> and V2 would be:
> 
>   "seeed,linkstar-h68k-v2", "rockchip,rk3568"
> 
> > +
> > +	aliases {
> > +		ethernet0 = &gmac0;
> > +		ethernet1 = &gmac1;
> > +
> > +		/* fixed eMMC */
> > +		mmc0 = &sdhci;
> > +
> > +		/* removable uSD/TF Card */
> > +		mmc1 = &sdmmc0;
> > +
> > +		rtc0 = &rk809;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = "serial2:1500000n8";
> > +	};
> > +
> > +	hdmi-con {
> > +		compatible = "hdmi-connector";
> > +		type = "a";
> > +
> > +		port {
> > +			hdmi_con_in: endpoint {
> > +				remote-endpoint = <&hdmi_out_con>;
> > +			};
> > +		};
> > +	};
> > +
> > +	gpio-keys {
> > +		compatible = "gpio-keys";
> > +		pinctrl-0 = <&reset_button_pin>;
> > +		pinctrl-names = "default";  
> 
> Please be consistent in pinctrl-names/pinctrl-0 ordering, here you
> define pins before the state name.
> 
> > +
> > +		/* Middle inset/recessed button,
> > +		 * marked by clockwise arrow/circle
> > +		 */
> > +
> > +		button-reset {
> > +			label = "button:system:reset";
> > +			gpios = <&gpio0 RK_PA0 GPIO_ACTIVE_LOW>;
> > +			linux,code = <KEY_RESTART>;
> > +			debounce-interval = <50>;  
> 
> Please order props alphabetically.
> 
> > +		};
> > +	};
> > +
> > +	gpio-leds {
> > +		compatible = "gpio-leds";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&led_white_pin>, <&led_green_pin>,
> > +			<&led_amber_pin>, <&led_blue_pin>;  
> 
> And here pinctrl-names comes before the pins, this is my personal
> preferred ordering for pinctrl-* props, I will settle for being
> consistent.
> 
> > +
> > +		/* White LED inset in power button */
> > +
> > +		led_white: led-0   {
> > +			color = <LED_COLOR_ID_WHITE>;
> > +			default-state = "on";
> > +			function = LED_FUNCTION_POWER;
> > +			gpios = <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
> > +			linux,default-trigger = "default-on";
> > +		};
> > +
> > +		led_green: led-1 {
> > +			color = <LED_COLOR_ID_GREEN>;
> > +			default-state = "off";
> > +			function = LED_FUNCTION_STATUS;
> > +			gpios = <&gpio3 RK_PB0 GPIO_ACTIVE_HIGH>;
> > +			linux,default-trigger = "none";
> > +		};
> > +
> > +		led_amber: led-2 {
> > +			color = <LED_COLOR_ID_AMBER>;
> > +			default-state = "off";
> > +			function = LED_FUNCTION_STATUS;
> > +			gpios = <&gpio3 RK_PA7 GPIO_ACTIVE_HIGH>;
> > +			linux,default-trigger = "none";
> > +		};
> > +
> > +		led_blue: led-3 {
> > +			color = <LED_COLOR_ID_BLUE>;
> > +			default-state = "off";
> > +			function = LED_FUNCTION_STATUS;
> > +			gpios = <&gpio3 RK_PA5 GPIO_ACTIVE_HIGH>;
> > +			linux,default-trigger = "heartbeat";
> > +		};
> > +	};
> > +
> > +	vcc12v_dcin: regulator-vcc12v-dcin {
> > +		compatible = "regulator-fixed";
> > +		regulator-always-on;
> > +		regulator-boot-on;
> > +		regulator-min-microvolt = <12000000>;
> > +		regulator-max-microvolt = <12000000>;
> > +		regulator-name = "vcc12v_dcin";  
> 
> I would sort regulator-name before regulator-min, same for rest of the
> regulators.
> 
> > +	};
> > +
> > +	vcc3v3_sys: regulator-vcc3v3-sys {
> > +		compatible = "regulator-fixed";
> > +		regulator-always-on;
> > +		regulator-boot-on;
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		regulator-name = "vcc3v3_sys";
> > +		vin-supply = <&vcc12v_dcin>;
> > +	};
> > +
> > +	vcc5v0_sys: regulator-vcc5v0-sys {
> > +		compatible = "regulator-fixed";
> > +		regulator-always-on;
> > +		regulator-boot-on;
> > +		regulator-min-microvolt = <5000000>;
> > +		regulator-max-microvolt = <5000000>;
> > +		regulator-name = "vcc5v0_sys";
> > +		vin-supply = <&vcc12v_dcin>;
> > +	};
> > +
> > +	vcc5v0_usb: regulator-vcc5v0-usb {
> > +		compatible = "regulator-fixed";
> > +		regulator-always-on;
> > +		regulator-boot-on;
> > +		regulator-min-microvolt = <5000000>;
> > +		regulator-max-microvolt = <5000000>;
> > +		regulator-name = "vcc5v0_usb";
> > +		vin-supply = <&vcc12v_dcin>;
> > +	};
> > +
> > +	vcc5v0_usb_host: regulator-vcc5v0-usb-host {
> > +		compatible = "regulator-fixed";
> > +		enable-active-high;
> > +		gpio = <&gpio0 RK_PA5 GPIO_ACTIVE_HIGH>;  
> 
> Please use gpios instead of the deprecated gpio name.
> 
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&vcc5v0_usb_host_en>;
> > +		regulator-min-microvolt = <5000000>;
> > +		regulator-max-microvolt = <5000000>;
> > +		regulator-name = "vcc5v0_usb_host";
> > +		vin-supply = <&vcc5v0_usb>;
> > +	};
> > +
> > +	vcc3v3_pcie: regulator-vcc3v3-pcie {
> > +		compatible = "regulator-fixed";
> > +		enable-active-high;  
> 
> Is this missing gpios and pinctrl props? or should enable-active-high be
> dropped?
> 
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		regulator-name = "vcc3v3_pcie";
> > +		startup-delay-us = <5000>;  
> 
> I think startup delay make little sense without gpios.
> 
> > +		vin-supply = <&vcc5v0_sys>;
> > +	};
> > +
> > +	rk809-sound {
> > +		compatible = "simple-audio-card";
> > +		simple-audio-card,format = "i2s";
> > +		simple-audio-card,name = "Analog RK809";
> > +		simple-audio-card,mclk-fs = <256>;
> > +
> > +		simple-audio-card,cpu {
> > +			sound-dai = <&i2s1_8ch>;
> > +		};
> > +		simple-audio-card,codec {
> > +			sound-dai = <&rk809>;
> > +		};  
> 
> 
> Nodes should typically be separated with a space.
> 
> > +	};
> > +};
> > +
> > +&gmac0 {
> > +	assigned-clocks = <&cru SCLK_GMAC0_RX_TX>, <&cru SCLK_GMAC0>;
> > +	assigned-clock-parents = <&cru SCLK_GMAC0_RGMII_SPEED>;
> > +	assigned-clock-rates = <0>, <125000000>;
> > +	clock_in_out = "output";
> > +	phy-mode = "rgmii-id";
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&gmac0_miim
> > +		     &gmac0_tx_bus2
> > +		     &gmac0_rx_bus2
> > +		     &gmac0_rgmii_clk
> > +		     &gmac0_rgmii_bus>;  
> 
> Please separate each phandle, mostly for consistency and it also has a
> small semantic differance when dts is being parsed.
> 
>   <&gmac0_miim>, <&gmac0_tx_bus2>, ...
> 
> > +	snps,reset-gpio = <&gpio2 RK_PD3 GPIO_ACTIVE_LOW>;
> > +	snps,reset-active-low;
> > +	snps,reset-delays-us = <0 20000 100000>;  
> 
> These snps,reset-* props are deprecated, please drop and instead add
> correct resets-gpios pros in the rgmii_phy0 node.
> 
> > +	phy-handle = <&rgmii_phy0>;
> > +	status = "okay";
> > +};
> > +
> > +&gmac1 {
> > +	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
> > +	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>;
> > +	assigned-clock-rates = <0>, <125000000>;
> > +	clock_in_out = "output";
> > +	phy-mode = "rgmii-id";
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&gmac1m1_miim
> > +		     &gmac1m1_tx_bus2
> > +		     &gmac1m1_rx_bus2
> > +		     &gmac1m1_rgmii_clk
> > +		     &gmac1m1_rgmii_bus>;  
> 
> Same as gmac0.
> 
> > +	snps,reset-gpio = <&gpio1 RK_PB0 GPIO_ACTIVE_LOW>;
> > +	snps,reset-active-low;
> > +	snps,reset-delays-us = <0 20000 100000>;  
> 
> Same as gmac0.
> 
> > +	phy-handle = <&rgmii_phy1>;
> > +	status = "okay";
> > +};
> > +
> > +&combphy0 {
> > +	status = "okay";
> > +};
> > +
> > +&combphy1 {
> > +	status = "okay";
> > +};
> > +
> > +&combphy2 {
> > +	status = "okay";
> > +};
> > +
> > +&cpu0 {
> > +	cpu-supply = <&vdd_cpu>;
> > +};
> > +
> > +&cpu1 {
> > +	cpu-supply = <&vdd_cpu>;
> > +};
> > +
> > +&cpu2 {
> > +	cpu-supply = <&vdd_cpu>;
> > +};
> > +
> > +&cpu3 {
> > +	cpu-supply = <&vdd_cpu>;
> > +};
> > +
> > +&gpu {
> > +	mali-supply = <&vdd_gpu>;
> > +	status = "okay";
> > +};
> > +
> > +&hdmi {
> > +	avdd-0v9-supply = <&vdda0v9_image>;
> > +	avdd-1v8-supply = <&vcca1v8_image>;
> > +	status = "okay";
> > +};
> > +
> > +&hdmi_in {
> > +	hdmi_in_vp0: endpoint {
> > +		remote-endpoint = <&vp0_out_hdmi>;
> > +	};
> > +};
> > +
> > +&hdmi_out {
> > +	hdmi_out_con: endpoint {
> > +		remote-endpoint = <&hdmi_con_in>;
> > +	};
> > +};
> > +
> > +&hdmi_sound {
> > +	status = "okay";
> > +};
> > +
> > +&i2c0 {
> > +	status = "okay";
> > +
> > +	vdd_cpu: regulator@1c {
> > +		compatible = "tcs,tcs4525";
> > +		reg = <0x1c>;
> > +		fcs,suspend-voltage-selector = <1>;
> > +		regulator-name = "vdd_cpu";
> > +		regulator-always-on;
> > +		regulator-boot-on;  
> 
> Please be consistent in regulator-* props ordering across all regulators.
> 
> > +		regulator-min-microvolt = <800000>;
> > +		regulator-max-microvolt = <1150000>;
> > +		regulator-ramp-delay = <2300>;
> > +		vin-supply = <&vcc5v0_sys>;
> > +
> > +		regulator-state-mem {
> > +			regulator-off-in-suspend;
> > +		};
> > +	};
> > +
> > +	rk809: pmic@20 {
> > +		compatible = "rockchip,rk809";
> > +		reg = <0x20>;
> > +		interrupt-parent = <&gpio0>;
> > +		interrupts = <RK_PA3 IRQ_TYPE_LEVEL_LOW>;
> > +		assigned-clocks = <&cru I2S1_MCLKOUT_TX>;
> > +		assigned-clock-parents = <&cru CLK_I2S1_8CH_TX>;
> > +		#clock-cells = <1>;
> > +		clock-names = "mclk";
> > +		clocks = <&cru I2S1_MCLKOUT_TX>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pmic_int>, <&i2s1m0_mclk>;
> > +		rockchip,system-power-controller;  
> 
> This prop is deprecated, please use system-power-controller.
> 
> > +		#sound-dai-cells = <0>;
> > +		wakeup-source;
> > +
> > +		vcc1-supply = <&vcc3v3_sys>;
> > +		vcc2-supply = <&vcc3v3_sys>;
> > +		vcc3-supply = <&vcc3v3_sys>;
> > +		vcc4-supply = <&vcc3v3_sys>;
> > +		vcc5-supply = <&vcc3v3_sys>;
> > +		vcc6-supply = <&vcc3v3_sys>;
> > +		vcc7-supply = <&vcc3v3_sys>;
> > +		vcc8-supply = <&vcc3v3_sys>;
> > +		vcc9-supply = <&vcc3v3_sys>;
> > +
> > +		regulators {
> > +			vdd_logic: DCDC_REG1 {
> > +				regulator-always-on;
> > +				regulator-boot-on;
> > +				regulator-initial-mode = <0x2>;
> > +				regulator-min-microvolt = <500000>;
> > +				regulator-max-microvolt = <1350000>;
> > +				regulator-name = "vdd_logic";
> > +				regulator-ramp-delay = <6001>;
> > +
> > +				regulator-state-mem {
> > +					regulator-off-in-suspend;
> > +				};
> > +			};
> > +
> > +			vdd_gpu: DCDC_REG2 {
> > +				regulator-always-on;
> > +				regulator-initial-mode = <0x2>;
> > +				regulator-min-microvolt = <500000>;
> > +				regulator-max-microvolt = <1350000>;
> > +				regulator-name = "vdd_gpu";
> > +				regulator-ramp-delay = <6001>;
> > +
> > +				regulator-state-mem {
> > +					regulator-off-in-suspend;
> > +				};
> > +			};
> > +
> > +			vcc_ddr: DCDC_REG3 {
> > +				regulator-always-on;
> > +				regulator-boot-on;
> > +				regulator-initial-mode = <0x2>;
> > +				regulator-name = "vcc_ddr";
> > +
> > +				regulator-state-mem {
> > +					regulator-on-in-suspend;
> > +				};
> > +			};
> > +
> > +			vdd_npu: DCDC_REG4 {
> > +				regulator-initial-mode = <0x2>;
> > +				regulator-min-microvolt = <500000>;
> > +				regulator-max-microvolt = <1350000>;
> > +				regulator-name = "vdd_npu";
> > +				regulator-ramp-delay = <6001>;
> > +
> > +				regulator-state-mem {
> > +					regulator-off-in-suspend;
> > +				};
> > +			};
> > +
> > +			vcc_1v8: DCDC_REG5 {
> > +				regulator-always-on;
> > +				regulator-boot-on;
> > +				regulator-min-microvolt = <1800000>;
> > +				regulator-max-microvolt = <1800000>;
> > +				regulator-name = "vcc_1v8";
> > +
> > +				regulator-state-mem {
> > +					regulator-off-in-suspend;
> > +				};
> > +			};
> > +
> > +			vdda0v9_image: LDO_REG1 {
> > +				regulator-name = "vdda0v9_image";
> > +				regulator-min-microvolt = <900000>;
> > +				regulator-max-microvolt = <900000>;
> > +
> > +				regulator-state-mem {
> > +					regulator-off-in-suspend;
> > +				};
> > +			};
> > +
> > +			vdda_0v9: LDO_REG2 {
> > +				regulator-always-on;
> > +				regulator-boot-on;
> > +				regulator-min-microvolt = <900000>;
> > +				regulator-max-microvolt = <900000>;
> > +				regulator-name = "vdda_0v9";
> > +
> > +				regulator-state-mem {
> > +					regulator-off-in-suspend;
> > +				};
> > +			};
> > +
> > +			vdda0v9_pmu: LDO_REG3 {
> > +				regulator-always-on;
> > +				regulator-boot-on;
> > +				regulator-min-microvolt = <900000>;
> > +				regulator-max-microvolt = <900000>;
> > +				regulator-name = "vdda0v9_pmu";
> > +
> > +				regulator-state-mem {
> > +					regulator-on-in-suspend;
> > +					regulator-suspend-microvolt =
> > <900000>;
> > +				};
> > +			};
> > +
> > +			vccio_acodec: LDO_REG4 {
> > +				regulator-always-on;
> > +				regulator-min-microvolt = <3300000>;
> > +				regulator-max-microvolt = <3300000>;
> > +				regulator-name = "vccio_acodec";
> > +
> > +				regulator-state-mem {
> > +					regulator-off-in-suspend;
> > +				};
> > +			};
> > +
> > +			vccio_sd: LDO_REG5 {
> > +				regulator-min-microvolt = <1800000>;
> > +				regulator-max-microvolt = <3300000>;
> > +				regulator-name = "vccio_sd";
> > +
> > +				regulator-state-mem {
> > +					regulator-off-in-suspend;
> > +				};
> > +			};
> > +
> > +			vcc3v3_pmu: LDO_REG6 {
> > +				regulator-always-on;
> > +				regulator-boot-on;
> > +				regulator-min-microvolt = <3300000>;
> > +				regulator-max-microvolt = <3300000>;
> > +				regulator-name = "vcc3v3_pmu";
> > +
> > +				regulator-state-mem {
> > +					regulator-on-in-suspend;
> > +					regulator-suspend-microvolt =
> > <3300000>;
> > +				};
> > +			};
> > +
> > +			vcca_1v8: LDO_REG7 {
> > +				regulator-always-on;
> > +				regulator-boot-on;
> > +				regulator-min-microvolt = <1800000>;
> > +				regulator-max-microvolt = <1800000>;
> > +				regulator-name = "vcca_1v8";
> > +
> > +				regulator-state-mem {
> > +					regulator-off-in-suspend;
> > +				};
> > +			};
> > +
> > +			vcca1v8_pmu: LDO_REG8 {
> > +				regulator-always-on;
> > +				regulator-boot-on;
> > +				regulator-min-microvolt = <1800000>;
> > +				regulator-max-microvolt = <1800000>;
> > +				regulator-name = "vcca1v8_pmu";
> > +
> > +				regulator-state-mem {
> > +					regulator-on-in-suspend;
> > +					regulator-suspend-microvolt =
> > <1800000>;
> > +				};
> > +			};
> > +
> > +			vcca1v8_image: LDO_REG9 {
> > +				regulator-min-microvolt = <1800000>;
> > +				regulator-max-microvolt = <1800000>;
> > +				regulator-name = "vcca1v8_image";
> > +
> > +				regulator-state-mem {
> > +					regulator-off-in-suspend;
> > +				};
> > +			};
> > +
> > +			vcc_3v3: SWITCH_REG1 {
> > +				regulator-name = "vcc_3v3";
> > +				regulator-always-on;
> > +				regulator-boot-on;
> > +
> > +				regulator-state-mem {
> > +					regulator-off-in-suspend;
> > +				};
> > +			};
> > +
> > +			vcc3v3_sd: SWITCH_REG2 {
> > +				regulator-name = "vcc3v3_sd";
> > +
> > +				regulator-state-mem {
> > +					regulator-off-in-suspend;
> > +				};
> > +			};
> > +		};
> > +
> > +		codec {
> > +			rockchip,mic-in-differential;
> > +		};
> > +	};
> > +};
> > +
> > +&i2s0_8ch {
> > +	status = "okay";
> > +};
> > +
> > +&i2s1_8ch {
> > +	rockchip,trcm-sync-tx-only;
> > +	status = "okay";
> > +};
> > +
> > +&mdio0 {
> > +	rgmii_phy0: ethernet-phy@0 {
> > +		compatible = "ethernet-phy-ieee802.3-c22";
> > +		reg = <0x0>;  
> 
> Please add reset-gpios related props here.
> 
> > +	};
> > +};
> > +
> > +&mdio1 {
> > +	rgmii_phy1: ethernet-phy@0 {
> > +		compatible = "ethernet-phy-ieee802.3-c22";
> > +		reg = <0x0>;  
> 
> Same here.
> 
> > +	};
> > +};
> > +
> > +&pcie30phy {
> > +	 data-lanes = <1 2>;
> > +	 status = "okay";
> > +};
> > +
> > +&pcie2x1 {
> > +	 reset-gpios = <&gpio2 RK_PD6 GPIO_ACTIVE_HIGH>;  
> 
> This should probably also include pinctrl props.
> 
> > +	 vpcie3v3-supply = <&vcc3v3_pcie>;
> > +	 status = "okay";
> > +};
> > +
> > +&pcie3x1 {
> > +	 num-lanes= <1>;
> > +	 bus-range = <0x10 0x1f>;
> > +	 reset-gpios = <&gpio3 RK_PA4 GPIO_ACTIVE_HIGH>;  
> 
> Same here, use of gpios typically means you will also need pinctrl.
> 
> > +	 vpcie3v3-supply = <&vcc3v3_pcie>;
> > +	 status = "okay";
> > +
> > +};
> > +
> > +&pcie3x2 {
> > +	 num-lanes= <1>;
> > +	 bus-range = <0x20 0x2f>;
> > +	 reset-gpios = <&gpio2 RK_PD0 GPIO_ACTIVE_HIGH>;  
> 
> And here.
> 
> > +	 vpcie3v3-supply = <&vcc3v3_pcie>;
> > +	 status = "okay";
> > +};
> > +
> > +&pinctrl {
> > +	button {
> > +		reset_button_pin: reset-button-pin {
> > +			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO
> > &pcfg_pull_up>;
> > +		};
> > +	};
> > +
> > +	bluetooth {
> > +		bt_wake_host_h: bt-wake-host-h {
> > +			rockchip,pins = <3 RK_PA1 RK_FUNC_GPIO
> > &pcfg_pull_down>;
> > +		};
> > +
> > +		host_wake_bt_h: host-wake-bt-h {
> > +			rockchip,pins = <3 RK_PA2 RK_FUNC_GPIO
> > &pcfg_pull_none>;
> > +		};
> > +	};
> > +
> > +	gpio-leds {
> > +	     led_white_pin: led-white-pin  {
> > +		    rockchip,pins = <0 RK_PB6 RK_FUNC_GPIO
> > &pcfg_pull_none>;
> > +	     };
> > +
> > +	     led_green_pin: led-green-pin {
> > +		    rockchip,pins = <3 RK_PB0 RK_FUNC_GPIO
> > &pcfg_pull_none>;
> > +	     };
> > +
> > +	     led_amber_pin: led-amber-pin {
> > +		    rockchip,pins = <3 RK_PA7 RK_FUNC_GPIO
> > &pcfg_pull_none>;
> > +	     };
> > +
> > +	     led_blue_pin: led-blue-pin {
> > +		    rockchip,pins = <3 RK_PA5 RK_FUNC_GPIO
> > &pcfg_pull_none>;
> > +	     };
> > +
> > +	};
> > +
> > +	pmic {
> > +		pmic_int: pmic_int {
> > +			rockchip,pins = <0 RK_PA3 RK_FUNC_GPIO
> > &pcfg_pull_up>;
> > +		};
> > +	};
> > +
> > +	usb {
> > +		vcc5v0_usb_host_en: vcc5v0_usb_host_en {
> > +			rockchip,pins = <0 RK_PA5 RK_FUNC_GPIO
> > &pcfg_pull_none>;
> > +		};
> > +	};
> > +};
> > +
> > +&pmu_io_domains {
> > +	pmuio1-supply = <&vcc3v3_pmu>;
> > +	pmuio2-supply = <&vcc3v3_pmu>;
> > +	vccio1-supply = <&vccio_acodec>;
> > +	vccio2-supply = <&vcc_1v8>;
> > +	vccio3-supply = <&vccio_sd>;
> > +	vccio4-supply = <&vcc_1v8>;
> > +	vccio5-supply = <&vcc_3v3>;
> > +	vccio6-supply = <&vcc_1v8>;
> > +	vccio7-supply = <&vcc_3v3>;
> > +	status = "okay";
> > +};
> > +
> > +&rng {
> > +	status = "okay";
> > +};  
> 
> rng is already enabled in rk3568.dtsi, please drop.
> 
> > +
> > +&saradc {
> > +	vref-supply = <&vcca_1v8>;
> > +	status = "okay";
> > +};
> > +
> > +&sata0 {
> > +	status = "disabled";
> > +};
> > +
> > +&sata1 {
> > +	status = "disabled";
> > +};
> > +
> > +&sata2 {
> > +	status = "disabled";
> > +};  
> 
> These sataX are already disabled by default, should not be needed here?
> 
> > +
> > +&sdhci {
> > +	bus-width = <8>;
> > +	max-frequency = <200000000>;
> > +	non-removable;  
> 
> This should probably also have cap-mmc-highspeed and mmc-hs200-1_8v.
> 
> > +	pinctrl-0 = <&emmc_bus8 &emmc_clk &emmc_cmd &emmc_datastrobe>;  
> 
> This is missing pinctrl-names and please separate each phandle as mentioned
> above.
> 
> Maybe add vmmc/vqmmc regulators?
> 
> > +	status = "okay";
> > +};
> > +
> > +&sdmmc0 {
> > +	bus-width = <4>;
> > +	cap-sd-highspeed;
> > +	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
> > +	disable-wp;
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&sdmmc0_bus4 &sdmmc0_clk &sdmmc0_cmd &sdmmc0_det>;  
> 
> Please separate each phandle as mentioned above.
> 
> > +	sd-uhs-sdr104;
> > +	vmmc-supply = <&vcc3v3_sd>;
> > +	vqmmc-supply = <&vccio_sd>;
> > +	status = "okay";
> > +};
> > +
> > +&tsadc {
> > +	rockchip,hw-tshut-mode = <1>;
> > +	rockchip,hw-tshut-polarity = <0>;
> > +	status = "okay";
> > +};
> > +
> > +&uart2 {
> > +	status = "okay";
> > +};
> > +
> > +&usb_host0_ehci {
> > +	status = "okay";
> > +};
> > +
> > +&usb_host1_ehci {
> > +	status = "okay";
> > +};
> > +
> > +&usb_host0_ohci {
> > +	status = "okay";
> > +};
> > +
> > +&usb_host1_ohci {
> > +	status = "okay";
> > +};
> > +
> > +&usb_host0_xhci {
> > +	phys = <&combphy0 PHY_TYPE_USB3>;
> > +	phy-names = "usb3-phy";  
> 
> Is the usb2-phy not used?
> 
> The default from rk3568.dtsi add both the usb2 and usb3 phys.
> 
> Regards,
> Jonas
> 
> > +	status = "okay";
> > +};
> > +
> > +&usb_host1_xhci {
> > +	status = "okay";
> > +};
> > +
> > +&usb2phy0 {
> > +	status = "okay";
> > +};
> > +
> > +&usb2phy0_host {
> > +	phy-supply = <&vcc5v0_usb_host>;
> > +	status = "okay";
> > +};
> > +
> > +&usb2phy1 {
> > +	status = "okay";
> > +};
> > +
> > +&usb2phy1_host {
> > +	phy-supply = <&vcc5v0_usb_host>;
> > +	status = "okay";
> > +};
> > +
> > +&usb2phy1_otg {
> > +	phy-supply = <&vcc5v0_usb_host>;
> > +	status = "okay";
> > +};
> > +
> > +&vop {
> > +	assigned-clocks = <&cru DCLK_VOP0>, <&cru DCLK_VOP1>;
> > +	assigned-clock-parents = <&pmucru PLL_HPLL>, <&cru PLL_VPLL>;
> > +	status = "okay";
> > +};
> > +
> > +&vop_mmu {
> > +	status = "okay";
> > +};
> > +
> > +&vp0 {
> > +	vp0_out_hdmi: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
> > +		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
> > +		remote-endpoint = <&hdmi_in_vp0>;
> > +	};
> > +};
> >   
> 
> 



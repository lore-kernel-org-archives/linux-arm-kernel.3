Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886E9C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 09:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQzV+C6vNOMiJSlMbb5WYGSJ6UwSGQKE9h7pya059wo=; b=mBfD6OKmEq3KYe1GQZjWeXC7RU
	90K42phpHDtPW3qu1BBTHd0SqrOnSXq0Xu6uRXAYT0xFjwTpVxGIIRdg+qLrgAHYwcBf0Eulob/YE
	uaGcDoxPryoh8o8aT4erTbJboqJWFdlAsyOV8mX8zqAD0RurEU1XhVu6t429ASmp7cMpWjAaOrQvq
	TvDWOwBQSVfPmiYyQs4Q1PvC1M6g9/UCRkgN+mpugF2mQJVFyccxjZSUakdibYwtAhNLidmvujjWT
	iZVfuDdDJiUF79/6P/8M6/xOJL0yWC9cX1w+LMhjRoFC7ec+r7CDJ3L5xNBxnb0BhRWRUEzxQcwSg
	9MMur3fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7rYR-0000000G92C-3ywj;
	Sat, 19 Sep 2026 09:40:19 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7rYO-0000000G91U-3bwL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 09:40:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1789810816;
 bh=DQzV+C6vNOMiJSlMbb5WYGSJ6UwSGQKE9h7pya059wo=;
 b=I4SBsa6XvMIb8Ystpg6S3m7IhEyy2TvjqpQMhmLS2udjhGpFwZfGGQ1BSSZSnOZLOgEKHg0Lu
 gApHyP22Q2YCms0fx1tlSFG1yUSYwNY1C2mlWgGpi0REklANMGJqciiYZmrU+ddVnRvJcO90Fox
 B79c1xMGq74HsLMzsVUs2cbLtHl2Qn5aw2WaNlfFDGbSIXJRrafYlDy9gkcGfaTf3ZPOzyxclL4
 jkRQTYtZVkjrxr4DC1G46eXEEe3HtJkgNaQMEXKmcDSmqnm4hxjPvSoydaJ8Mu9Te1qKmShFHOP
 spY221yEw0Zs/+kvXu+1TrGAPDSVlxx5U116Lir1+VPg==
X-Forward-Email-ID: 6aae587fa917c0722b38310e
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.14.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <e9cf4fc9-4b94-41a4-aab2-00e807aa1ae8@kwiboo.se>
Date: Sat, 19 Sep 2026 11:40:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64: dts: rockchip: Add devicetree for the
 FriendlyElec NanoPi R28S
To: HystericalDragons@proton.me, Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Chukun Pan <amadeus@jmu.edu.cn>,
 jensen <jensenhuang@friendlyarm.com>, Andrey Korshunov
 <razor1702@gmail.com>, Diederik de Haas <diederik@cknow-tech.com>
References: <20260914-r28s-upstream-v6-0-ea9edd75c126@proton.me>
 <20260914-r28s-upstream-v6-3-ea9edd75c126@proton.me>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260914-r28s-upstream-v6-3-ea9edd75c126@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_024016_977941_A07CD5D4 
X-CRM114-Status: GOOD (  24.61  )
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

On 9/14/2026 3:35 PM, 安容 via B4 Relay wrote:
> From: 安容 <HystericalDragons@proton.me>
> 
> The NanoPi R28S is a dual gigabit Ethernet router board based on the
> Rockchip RK3528 SoC, designed and developed by FriendlyElec. It shares
> most of its design with the NanoPi Zero2, so it builds on the common
> rk3528-nanopi.dtsi.
> 
> Specification:
> - Rockchip RK3528
> - 1GB RAM
> - eMMC socket (optional)
> - MicroSD slot
> - 1x 1000Base-T (GMAC1, Realtek RTL8211F)
> - 1x 1000Base-T (PCIe, Realtek RTL8111H)
> - AICSemi AIC8800D80 SDIO WiFi
> - 3x LEDs (SYS, LAN, WAN)
> - 1x USB 2.0 Type-C, peripheral only, shared with the 5V power input
> - User and MaskROM buttons
> - Haoyu HYM8563 RTC
> - 1x USB Type-C debug UART (onboard WCH CH340E)
> 
> Assisted-by: LLM
> Signed-off-by: 安容 <HystericalDragons@proton.me>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile              |   1 +
>  .../arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts | 146 +++++++++++++++++++++
>  2 files changed, 147 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index b677914cd3..51a9889088 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -94,6 +94,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-vicharak-vaaman.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399pro-rock-pi-n10.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-armsom-sige1.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-hinlink-h28k.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-nanopi-r28s.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-nanopi-zero2.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-radxa-e20c.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-rock-2a.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts
> new file mode 100644
> index 0000000000..a453a990b3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts
> @@ -0,0 +1,146 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2022 Rockchip Electronics Co., Ltd.
> + * Copyright (c) 2026 FriendlyElec Computer Tech. Co., Ltd.
> + * Copyright (c) 2026 安容 <HystericalDragons@proton.me>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/leds/common.h>

This is already included from rk3528-nanopi.dtsi, so this can be dropped
or we should possible also include input and gpio symbols used in this
board DT.

> +#include "rk3528-nanopi.dtsi"
> +
> +/ {
> +	model = "FriendlyElec NanoPi R28S";
> +	compatible = "friendlyarm,nanopi-r28s", "rockchip,rk3528";
> +
> +	aliases {
> +		mmc2 = &sdio0;
> +		serial2 = &uart2;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio4_b2_usr_btn>;
> +
> +		button-user {
> +			debounce-interval = <50>;
> +			gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
> +			label = "USER";
> +			linux,code = <BTN_1>;
> +			wakeup-source;
> +		};
> +	};
> +
> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pwr_wf>;
> +		post-power-on-delay-ms = <100>;
> +		reset-gpios = <&gpio1 RK_PC2 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&combphy {
> +	status = "okay";
> +};
> +
> +&leds {

This should also include a 'pinctrl-names = "default"', as we are
re-defining pinctrl-0 here.

> +	pinctrl-0 = <&led1>, <&led2>, <&led_sys>;
> +
> +	led-1 {
> +		color = <LED_COLOR_ID_GREEN>;
> +		default-state = "off";
> +		function = LED_FUNCTION_WAN;
> +		gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_HIGH>;
> +		linux,default-trigger = "netdev";
> +	};
> +
> +	led-2 {
> +		color = <LED_COLOR_ID_GREEN>;
> +		default-state = "off";
> +		function = LED_FUNCTION_LAN;
> +		gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_HIGH>;
> +		linux,default-trigger = "netdev";
> +	};
> +};
> +
> +&pcie {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie_eth_perstb>;
> +	reset-gpios = <&gpio4 RK_PC0 GPIO_ACTIVE_HIGH>;
> +	vpcie3v3-supply = <&vcc_3v3>;
> +	status = "okay";
> +};
> +
> +&pinctrl {

This is still missing the bluetooth and wifi pins. We know the pins from
the schematics and already describe remaining pins and devices used by
the onboard WiFi+BT chip. Please also include the four missing pins.

	bluetooth {
		bt_wake_host: bt-wake-host {
			rockchip,pins = <1 RK_PB5 RK_FUNC_GPIO &pcfg_pull_down>;
		};

		host_wake_bt: host-wake-bt {
			rockchip,pins = <1 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
		};
	};

> +	gpio-keys {
> +		gpio4_b2_usr_btn: gpio4-b2-usr-btn {
> +			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +
> +	leds {
> +		led2: led2 {
> +			rockchip,pins = <4 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	pcie {
> +		pcie_eth_perstb: pcie-eth-perstb {
> +			rockchip,pins = <4 RK_PC0 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	wifi {

and:

		host_wake_wl: host-wake-wl {
			rockchip,pins = <1 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
		};

> +		pwr_wf: pwr-wf {
> +			rockchip,pins = <1 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};

and:

		wl_wake_host: wl-wake-host {
			rockchip,pins = <1 RK_PA7 RK_FUNC_GPIO &pcfg_pull_down>;
		};

> +	};
> +};
> +
> +&sdio0 {
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	cap-sdio-irq;
> +	keep-power-in-suspend;
> +	mmc-pwrseq = <&sdio_pwrseq>;
> +	no-mmc;
> +	no-sd;
> +	non-removable;
> +	sd-uhs-sdr104;
> +	vmmc-supply = <&vcc_3v3>;
> +	vqmmc-supply = <&vcc_1v8>;
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	dma-names = "tx", "rx";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart2m1_xfer>, <&uart2m1_ctsn>, <&uart2m1_rtsn>;
> +	uart-has-rtscts;
> +	status = "okay";
> +};
> +
> +&usb_host0_xhci {
> +	/*
> +	 * The Type-C port is also the 5V power input. Both CC pins have a
> +	 * 5.1k pull-down, the ID pin is not connected and VBUS only feeds
> +	 * the 5V rail, so the port can only ever be a device.
> +	 */
> +	dr_mode = "peripheral";

The CC and ID pins only help signal the initial state, device mode. The
DWC3 controller can still work in dual role mode.

With dr_mode=otg and a Belkin USB-C 4-in-1 Multiport Adapter [1] hooked
up the OTG port on my R28S, I can access the storage device attached to
the hub, with dr_mode=peripheral mode it does not.

  ~ # lsusb
  Bus 001 Device 005: ID 2109:8817 VIA Labs, Inc. USB Billboard Device
  Bus 001 Device 001: ID 1d6b:0002 Linux 7.1.0-next-20260619 xhci-hcd xHCI Host Controller
  Bus 001 Device 003: ID 050d:006b Belkin USB-C 4-in-1 Multiport
  Bus 001 Device 002: ID 2109:2817 VIA Labs, Inc. USB2.0 Hub
  Bus 001 Device 004: ID 1b1c:1a14 Corsair Voyager VEGA

  [   10.219627] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 7.01
  [   10.219691] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
  [   10.220672] usb usb1: Product: xHCI Host Controller
  [   10.223000] usb usb1: Manufacturer: Linux 7.1.0-next-20260619 xhci-hcd
  [   10.223814] usb usb1: SerialNumber: xhci-hcd.1.auto
  [   10.260442] hub 1-0:1.0: USB hub found
  [   10.534737] usb 1-1: new high-speed USB device number 2 using xhci-hcd
  [   10.690464] usb 1-1: New USB device found, idVendor=2109, idProduct=2817, bcdDevice= 1.24
  [   10.691662] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
  [   10.692557] usb 1-1: Product: USB2.0 Hub
  [   10.693209] usb 1-1: Manufacturer: VIA Labs, Inc.
  [   10.693910] usb 1-1: SerialNumber: 000000000
  [   10.768322] hub 1-1:1.0: USB hub foundiver hub
  [   11.910478] usb 1-1.3: new full-speed USB device number 3 using xhci-hcd
  [   12.090565] usb 1-1.3: not running at top speed; connect to a high speed hub
  [   12.148576] usb 1-1.3: New USB device found, idVendor=050d, idProduct=006b, bcdDevice= 2.01
  [   12.149670] usb 1-1.3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
  [   12.151418] usb 1-1.3: Product: USB-C 4-in-1 Multiport
  [   12.152164] usb 1-1.3: Manufacturer: Belkin
  [   12.152731] usb 1-1.3: SerialNumber: 000000000005
  [   12.326468] usb 1-1.4: new high-speed USB device number 4 using xhci-hcd
  [   12.491207] usb 1-1.4: New USB device found, idVendor=1b1c, idProduct=1a14, bcdDevice= 1.10
  [   12.492298] usb 1-1.4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
  [   12.493213] usb 1-1.4: Product: Voyager VEGA
  [   12.493777] usb 1-1.4: Manufacturer: Corsair
  [   12.494489] usb 1-1.4: SerialNumber: 070894224D1DDF08
  [   12.526029] usb-storage 1-1.4:1.0: USB Mass Storage device detected
  [   12.540646] scsi host0: usb-storage 1-1.4:1.0
  [   12.658716] usb 1-1.5: new high-speed USB device number 5 using xhci-hcd
  [   12.759957] usb 1-1.5: New USB device found, idVendor=2109, idProduct=8817, bcdDevice= 0.01
  [   12.761051] usb 1-1.5: New USB device strings: Mfr=1, Product=2, SerialNumber=3
  [   12.761966] usb 1-1.5: Product: USB Billboard Device
  [   12.762748] usb 1-1.5: Manufacturer: VIA Labs, Inc.
  [   12.763476] usb 1-1.5: SerialNumber: 0000000000000001

[1] https://www.belkin.com/p/usb-c-4-in-1-multiport-adapter/AVC006btSGY.html

Regards,
Jonas

> +	extcon = <&usb2phy>;
> +	maximum-speed = "high-speed";
> +	phys = <&usb2phy_otg>;
> +	phy-names = "usb2-phy";
> +	status = "okay";
> +};
> +
> +&usb2phy {
> +	status = "okay";
> +};
> +
> +&usb2phy_otg {
> +	status = "okay";
> +};
> 



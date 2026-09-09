Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9188C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 10:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=klkamjWO7ZdrH09EL+Tq+b+/1eABCR7Hx6lvFcqVLyY=; b=aNueHXQO5gXugacnFSerFnedDj
	1QEIvcO30ZhxxPAGXrFcO7nuEANwauii2ASiupHqam/2oyAmE+xjSy9I+CC/k8K744h5F2/lj5f/7
	PzguabRaioOxCriNBsyOXQBqyTpA0d+anuELitMZXwsTwCgIRsWDMZF5RaimlzpWpGy68hz2Hmm0w
	oPjB/TDscYsxPbHLucXSr25VIGz6MaHcU7ZiHRtxYUVs2xZXsFNcYyO64mlvdeWO8FZSpXWghSM7h
	TvrSfX3C9FPmEtWMA1PnvLi1H3nxTS9RiuPkmEut0XU4y3BAPZBODgDj5STpDfiXPCDqFFCr9BqOD
	4Pwj8bTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Fvf-0000000BUSd-1rkd;
	Wed, 09 Sep 2026 10:53:23 +0000
Received: from out-239.mta1.migadu.com ([95.215.58.239] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Fvb-0000000BUQT-1IWb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 10:53:21 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ut1UAXDx2kgEZTQBPOYbxfS9ZaWvfArbNUvkXw4DAXs=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788951195; v=1; x=1789555995;
 b=ZFOn4/Ve548OUpVoEXY1A6leJIscWg5Up+GNEKYBXqTlYOLTMqadaRubzC44SJ8DEJNkp0KP
 8xHDQdwMkcGLvE3yYrI71nz/R5LdJ4m1LVm/pHhdQvEaD2aegHFBNroLf/Bn3pwt/v+e28PmoRC
 Xan8IOEZ7SfsaaC/eHbl1bPvsPapKwEobbEOhi3iFHTSaR7NATo4Q5sLd87nIqmOHZu8kC2mM4F
 vhhJQMlpe6QJxGNDljfZl9L1j0eZCByrIwUc6gxjmlmhkrfD1tbUW5Pc6iVUxX01FTCJW6Xuk9L
 sMOP+PYLczf0PyoewkdZXQVwpnEwEg5DElSjWKND+AbjQ==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7dc79fa296131603;
	Wed, 09 Sep 2026 10:53:15 +0000
X-Mizu-Trace-ID: 7dc79fa296131603
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 12:53:14 +0200
Message-Id: <DLAQ9T5TJQQP.KL6V9LP6E2N0@cknow-tech.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: Add devicetree for the
 FriendlyElec NanoPi R28S
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: <HystericalDragons@proton.me>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Chukun Pan" <amadeus@jmu.edu.cn>, "jensen" <jensenhuang@friendlyarm.com>
X-Mailer: aerc 0.22.0-9-ge948bb7230f4
References: <20260907-r28s-upstream-v2-0-21ab570fc91c@proton.me>
 <20260907-r28s-upstream-v2-3-21ab570fc91c@proton.me>
In-Reply-To: <20260907-r28s-upstream-v2-3-21ab570fc91c@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_035319_498134_375C2E09 
X-CRM114-Status: GOOD (  16.82  )
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

On Mon Sep 7, 2026 at 4:13 PM CEST, =E5=AE=89=E5=AE=B9 via B4 Relay wrote:
> From: =E5=AE=89=E5=AE=B9 <HystericalDragons@proton.me>
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
> Signed-off-by: =E5=AE=89=E5=AE=B9 <HystericalDragons@proton.me>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile              |   1 +
>  .../arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts | 142 +++++++++++++++=
++++++
>  2 files changed, 143 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/=
rockchip/Makefile
> index b677914cd3..51a9889088 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -94,6 +94,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399-vicharak-vaaman=
.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3399pro-rock-pi-n10.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3528-armsom-sige1.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3528-hinlink-h28k.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3528-nanopi-r28s.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3528-nanopi-zero2.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3528-radxa-e20c.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3528-rock-2a.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts b/arch/a=
rm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts

If you run
``scripts/dtc/dt-check-style --mode=3Dstrict arch/arm64/boot/dts/rockchip/r=
k3528-nanopi-r28s.dts``

it will find a few (IMO) false-positives, but the property order of
pinctrl-0/pinctrl-names is valid and a blank line preceeding ``status`` too=
.

Cheers,
  Diederik

> new file mode 100644
> index 0000000000..b9e9f5af4e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-r28s.dts
> @@ -0,0 +1,142 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2022 Rockchip Electronics Co., Ltd.
> + * Copyright (c) 2026 FriendlyElec Computer Tech. Co., Ltd.
> + * Copyright (c) 2026 =E5=AE=89=E5=AE=B9 <HystericalDragons@proton.me>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/leds/common.h>
> +#include "rk3528-nanopi.dtsi"
> +
> +/ {
> +	model =3D "FriendlyElec NanoPi R28S";
> +	compatible =3D "friendlyarm,nanopi-r28s", "rockchip,rk3528";
> +
> +	aliases {
> +		mmc2 =3D &sdio0;
> +	};
> +
> +	gpio-keys {
> +		compatible =3D "gpio-keys";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&usr_btn>;
> +
> +		button-user {
> +			debounce-interval =3D <50>;
> +			gpios =3D <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
> +			label =3D "USER";
> +			linux,code =3D <KEY_RESTART>;
> +			wakeup-source;
> +		};
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&led1>, <&led2>, <&led_sys>;
> +
> +		led-lan {
> +			color =3D <LED_COLOR_ID_GREEN>;
> +			default-state =3D "off";
> +			function =3D LED_FUNCTION_LAN;
> +			gpios =3D <&gpio4 RK_PB3 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger =3D "netdev";
> +		};
> +
> +		led-sys {
> +			color =3D <LED_COLOR_ID_RED>;
> +			default-state =3D "on";
> +			function =3D LED_FUNCTION_HEARTBEAT;
> +			gpios =3D <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +
> +		led-wan {
> +			color =3D <LED_COLOR_ID_GREEN>;
> +			default-state =3D "off";
> +			function =3D LED_FUNCTION_WAN;
> +			gpios =3D <&gpio4 RK_PB1 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger =3D "netdev";
> +		};
> +	};
> +
> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pwr_wf>;
> +		post-power-on-delay-ms =3D <100>;
> +		reset-gpios =3D <&gpio1 RK_PC2 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&combphy {
> +	status =3D "okay";
> +};
> +
> +&pcie {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pcie_eth_perstb>;
> +	reset-gpios =3D <&gpio4 RK_PC0 GPIO_ACTIVE_HIGH>;
> +	vpcie3v3-supply =3D <&vcc_3v3>;
> +	status =3D "okay";
> +};
> +
> +&pinctrl {
> +	gpio-keys {
> +		usr_btn: usr-btn {
> +			rockchip,pins =3D <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +
> +	leds {
> +		led1: led1 {
> +			rockchip,pins =3D <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		led2: led2 {
> +			rockchip,pins =3D <4 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		led_sys: led-sys {
> +			rockchip,pins =3D <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	pcie {
> +		pcie_eth_perstb: pcie-eth-perstb {
> +			rockchip,pins =3D <4 RK_PC0 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	wifi {
> +		pwr_wf: pwr-wf {
> +			rockchip,pins =3D <1 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +};
> +
> +&sdio0 {
> +	bus-width =3D <4>;
> +	cap-sd-highspeed;
> +	cap-sdio-irq;
> +	keep-power-in-suspend;
> +	mmc-pwrseq =3D <&sdio_pwrseq>;
> +	non-removable;
> +	sd-uhs-sdr104;
> +	vqmmc-supply =3D <&vcc_1v8>;
> +	status =3D "okay";
> +};
> +
> +&uart2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&uart2m1_xfer>, <&uart2m1_ctsn>, <&uart2m1_rtsn>;
> +	uart-has-rtscts;
> +	status =3D "okay";
> +};
> +
> +&usb_host0_xhci {
> +	/* Type-C port, shared with the 5V power input */
> +	dr_mode =3D "peripheral";
> +};




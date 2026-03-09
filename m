Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34B50FCA191
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 21:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oVHmmg5PbGhBJcH1DiEgCgltbKf4t8SXuZF/r8goSLw=; b=UGpKdJfbVKF9+8d8uG84qNwgWm
	iAPR5huk0GJq4tSgAUrtcsQjQ+/yP5VuPC1SPDXj+QMWhB5UDAs6kmYR1OsTJSdubzjiKeESGMq8y
	+/5GAlvMpJQBc8TGlpJW9GnaWJKy92aWEE1qgOuYh6U8/7y69+gKsrRSrNAa2gIqNwzCxYXKZCWRq
	+SyqTb3i99zDDUxWv5HJJbCuIy/CJawVVNYfcExagLr0c9Bs/0kTIYuyfFAr6CcYo1/gkgBm5dNVc
	8zJ1zFenWewgKTm9ESB6sjWXBw+mCZaKqXj5vXRz1J3pfd5FlI8hcgd54000NGw9RRJeN8g/zk/R8
	DApqo+Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzi68-00000008BIg-0hgG;
	Mon, 09 Mar 2026 21:25:08 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzi65-00000008BHz-17FM;
	Mon, 09 Mar 2026 21:25:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=oVHmmg5PbGhBJcH1DiEgCgltbKf4t8SXuZF/r8goSLw=; b=m65ga86fwWwLPFyKsNOsIcX0n5
	t+hFSKHitbRnnM6HTltcGkOw/tM+icOJ6Po2iUWNNoMiJy7a7u9GvU+ZLT4CbtQ+QmzRISrhVkYzh
	cQUak1ZcIUurAZjCLi4UO0smzo1imi2Ysvh7okKiSYqWTtGPpv+8yHWpsPWHuuieDuCO75OyKuHvz
	DjrRpGK2Pp1QNKhrQVJeKkstBhNDvU/Rw0wPiS/sDuXiraKj1nOI0eE+ovUGNXPsnWjN7qtXi8EdK
	/oH4O1VDXio5inTRlf0oHSGLGY+jUWpVOtYVGr0BGnBIW1yQQKz1UMNJeiXOCIUocG6Kmbv/tNul7
	KHMXW2IQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: jonas@kwiboo.se, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Fabio Estevam <festevam@nabladev.com>
Subject: Re: [PATCH v5 2/4] ARM: dts: rockchip: Add support for RV1103B
Date: Mon, 09 Mar 2026 22:24:52 +0100
Message-ID: <47923648.fMDQidcC6G@phil>
In-Reply-To: <20260216010219.2131484-2-festevam@gmail.com>
References: <20260216010219.2131484-1-festevam@gmail.com>
 <20260216010219.2131484-2-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_142505_328740_D8A2C826 
X-CRM114-Status: GOOD (  20.10  )
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

Am Montag, 16. Februar 2026, 02:02:17 Mitteleurop=C3=A4ische Normalzeit sch=
rieb Fabio Estevam:
> From: Fabio Estevam <festevam@nabladev.com>
>=20
> Add the initial RV1103B devicetree.
>=20
> Based on the 5.10 Rockchip vendor kernel.
>=20
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> ---
> The <dt-bindings/clock/rockchip,rv1103b-cru.h> header comes from another
> series:
>=20
> https://lore.kernel.org/linux-devicetree/20260210022620.172570-1-festevam=
@gmail.com/
>=20
> Maybe Heiko could apply the clock series as well?
>=20
> Changes since v4:
> - None.
>=20
>  .../boot/dts/rockchip/rv1103b-pinctrl.dtsi    | 816 ++++++++++++++++++
>  arch/arm/boot/dts/rockchip/rv1103b.dtsi       | 257 ++++++
>  2 files changed, 1073 insertions(+)
>  create mode 100644 arch/arm/boot/dts/rockchip/rv1103b-pinctrl.dtsi
>  create mode 100644 arch/arm/boot/dts/rockchip/rv1103b.dtsi


> diff --git a/arch/arm/boot/dts/rockchip/rv1103b.dtsi b/arch/arm/boot/dts/=
rockchip/rv1103b.dtsi
> new file mode 100644
> index 000000000000..5955b249d4ce
> --- /dev/null
> +++ b/arch/arm/boot/dts/rockchip/rv1103b.dtsi
> @@ -0,0 +1,257 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2024 Rockchip Electronics Co., Ltd.
> + */
> +
> +#include <dt-bindings/clock/rockchip,rv1103b-cru.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/soc/rockchip,boot-mode.h>
> +
> +/ {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +
> +	compatible =3D "rockchip,rv1103b";
> +
> +	interrupt-parent =3D <&gic>;
> +
> +	arm-pmu {
> +		compatible =3D "arm,cortex-a7-pmu";
> +		interrupts =3D <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-affinity =3D <&cpu0>;
> +	};
> +
> +	xin32k: oscillator-32k {
> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <32768>;
> +		clock-output-names =3D "xin32k";
> +		#clock-cells =3D <0>;
> +	};

Please double-check where that xin32k is coming from in device-schematics.
Yes the xin24m is normally a dedicated oscillator, but the xin32k in
most cases is generated from the system-pmic.

So please check and most likely move that to the board dts.

Also, please sort node-names alphabetically (if there is no address)


> +	xin24m: oscillator-24m {
> +		compatible =3D "fixed-clock";
> +		clock-frequency =3D <24000000>;
> +		clock-output-names =3D "xin24m";
> +		#clock-cells =3D <0>;
> +	};
> +
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type =3D "cpu";
> +			compatible =3D "arm,cortex-a7";
> +			reg =3D <0x0>;
> +			clocks =3D <&cru ARMCLK>;
> +		};
> +	};
> +
> +	timer {
> +		compatible =3D "arm,armv7-timer";
> +		interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HI=
GH)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>;
> +		clock-frequency =3D <24000000>;
> +	};
> +
> +	pinctrl: pinctrl {
> +		compatible =3D "rockchip,rv1103b-pinctrl";
> +		rockchip,grf =3D <&ioc>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges;
> +
> +		gpio0: gpio@20520000 {
> +			compatible =3D "rockchip,gpio-bank";
> +			reg =3D <0x20520000 0x200>;
> +			interrupts =3D <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cru PCLK_PMU_GPIO0>, <&cru DBCLK_PMU_GPIO0>;
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <2>;
> +		};
> +
> +		gpio1: gpio@20d80000 {
> +			compatible =3D "rockchip,gpio-bank";
> +			reg =3D <0x20d80000 0x200>;
> +			interrupts =3D <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cru PCLK_GPIO1>, <&cru DBCLK_GPIO1>;
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <2>;
> +		};
> +
> +		gpio2: gpio@20840000 {
> +			compatible =3D "rockchip,gpio-bank";
> +			reg =3D <0x20840000 0x200>;
> +			interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cru PCLK_GPIO2>, <&cru DBCLK_GPIO2>;
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			interrupt-controller;
> +			#interrupt-cells =3D <2>;
> +		};
> +	};
> +
> +	soc {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <1>;
> +		ranges;
> +
> +		cru: clock-controller@20000000 {
> +			compatible =3D "rockchip,rv1103b-cru";
> +			reg =3D <0x20000000 0x81000>;
> +			#clock-cells =3D <1>;
> +			#reset-cells =3D <1>;
> +			bootph-all;

I don't think we want u-boot-specific properties in mainline.
They are normally kept in separate -u-boot.dtsi files

> +		};

[...]

> +		uart1: serial@20870000 {
> +			compatible =3D "rockchip,rv1103b-uart", "snps,dw-apb-uart";

uart compatible, does not seem to have landed in the uart tree

> +			reg =3D <0x20870000 0x100>;
> +			interrupts =3D <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift =3D <2>;
> +			reg-io-width =3D <4>;
> +			clocks =3D <&cru SCLK_UART1>, <&cru PCLK_UART1>;
> +			clock-names =3D "baudclk", "apb_pclk";
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&uart1m0_xfer>;
> +			status =3D "disabled";
> +		};

[...]

> +		wdt: watchdog@208d0000 {
> +			compatible =3D "snps,dw-wdt";

please add a new compatible to the dw-wdt watchdog binding

> +			reg =3D <0x208d0000 0x100>;
> +			clocks =3D <&cru TCLK_WDT_NS>, <&cru PCLK_WDT_NS>;
> +			clock-names =3D "tclk", "pclk";
> +			interrupts =3D <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
> +			status =3D "disabled";
> +		};
> +


Heiko




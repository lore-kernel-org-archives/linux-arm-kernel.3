Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8197AC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 12:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jycqaezhCsooEMLFOB7YGlzrs+SpJfWD5uERxhFzT9w=; b=B0zYlR13FzFX/MDN7RwLvb2++p
	E0PUEkoLFz/u7bzdT/cPK2QsLX4rM71Lh3KK7E+AsUJHZStW3gsLIStI+dNn0H3qWkssX2bqArKPn
	6lSF2+e514c8NtXqAjzD04NX8/ZQwbrN4L87bGgZakxYSV3xlJnKTIdbNDsPQV8YRZ29EOajE821G
	dYQarSLrZ+9jCRmkrZ/xfS7LLEqF7I6R2oJdmdFt3pcttqhqcVRpVyP6bdQBK9aJHAcszepJ4yu/z
	OXjRTzLB7/Q1mgBow/2jt9tkXduQNl1JmVBr83SpQvDTuixThNP7f43RkbPQEockjlULM6OHiDyYl
	X9s/jEuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMnG-00000003a9t-3hFC;
	Fri, 09 May 2025 12:25:35 +0000
Received: from out-181.mta1.migadu.com ([95.215.58.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLnW-00000003Q6P-0kvF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 11:21:47 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1746789694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jycqaezhCsooEMLFOB7YGlzrs+SpJfWD5uERxhFzT9w=;
	b=IjQNX/lCGNU+MTonjMcjwKjBj2i18UbXyRd4mzgOuD/8Pqbj9xH9w3nv1Jyd3tn8PbXrNm
	fWIVwOKQvpZL9hye+plpkgCiCxABFpmJTxA2+0d1dRqSPldbB3vfYOsOvXuh90Tv96cMh3
	PD19WdITDHgwDKYJ+RTkRhJ6jjeefPePV/1rQ25feH+F/SutEirtNuULbUjvPoSFmzRGPE
	ZwT4xnEWsKyBvn9XiNcxCSH1b6K+0qthvDHlraL9f4JkqDXsJ9YUmuEfGD3HyM2FxsU8qX
	SC62p0PIMKt7DxkT0TJrUYrzdijQJKX/B3C7Morf6mUPHhDTdc25NlYasMqdIA==
Content-Type: multipart/signed;
 boundary=76ae7b15ebcac961fb29afb3c1039cc390728cd5d52cfd66bb9894187db4;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 09 May 2025 13:21:13 +0200
Message-Id: <D9RL9DZN7PXS.PGSNWKK9J548@cknow.org>
Subject: Re: [PATCH 4/6] arm64: dts: rockchip: add px30-cobra base dtsi and
 board variants
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Heiko Stuebner" <heiko@sntech.de>
Cc: <quentin.schulz@cherry.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Heiko Stuebner" <heiko.stuebner@cherry.de>
References: <20250508150955.1897702-1-heiko@sntech.de>
 <20250508150955.1897702-5-heiko@sntech.de>
In-Reply-To: <20250508150955.1897702-5-heiko@sntech.de>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_042146_354560_00E93CBB 
X-CRM114-Status: GOOD (  19.91  )
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

--76ae7b15ebcac961fb29afb3c1039cc390728cd5d52cfd66bb9894187db4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu May 8, 2025 at 5:09 PM CEST, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
>
> Cobra are Touchscreen devices built around the PX30 SoC using
> a variety of display options.
>
> The devices feature an EMMC, network port, usb host + OTG ports and
> a 720x1280 display with a touchscreen.
>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile         |   4 +
>  .../rockchip/px30-cobra-ltk050h3146w-a2.dts   |  39 ++
>  .../dts/rockchip/px30-cobra-ltk050h3146w.dts  |  39 ++
>  .../dts/rockchip/px30-cobra-ltk050h3148w.dts  |  39 ++
>  .../dts/rockchip/px30-cobra-ltk500hd1829.dts  |  58 ++
>  arch/arm64/boot/dts/rockchip/px30-cobra.dtsi  | 570 ++++++++++++++++++
>  6 files changed, 749 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-=
a2.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.=
dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3148w.=
dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.=
dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
>
> <snip>
>
> diff --git a/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi b/arch/arm64/bo=
ot/dts/rockchip/px30-cobra.dtsi
> new file mode 100644
> index 000000000000..92066cbc1a70
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
> @@ -0,0 +1,570 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2025 Cherry Embedded Solutions GmbH
> + */
> +
> +/dts-v1/;
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include "px30.dtsi"
> +
> +/ {
> +	aliases {
> +		mmc0 =3D &emmc;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial5:115200n8";
> +	};
> +
> +	backlight: backlight {
> +		compatible =3D "pwm-backlight";
> +		power-supply =3D <&vcc5v0_sys>;
> +		pwms =3D <&pwm0 0 25000 0>;
> +	};
> +
> +	beeper {
> +		compatible =3D "pwm-beeper";
> +		pwms =3D <&pwm1 0 1000 0>;
> +	};
> +
> +	emmc_pwrseq: emmc-pwrseq {
> +		compatible =3D "mmc-pwrseq-emmc";
> +		pinctrl-0 =3D <&emmc_reset>;
> +		pinctrl-names =3D "default";
> +		reset-gpios =3D <&gpio1 RK_PB3 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	gpio-leds {
> +		compatible =3D "gpio-leds";
> +
> +		led-0 {
> +			color =3D <LED_COLOR_ID_BLUE>;
> +			gpios =3D <&gpio0 RK_PA0 GPIO_ACTIVE_HIGH>;
> +			label =3D "heartbeat";
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +	};
> +
> +	pwm-leds {
> +		compatible =3D "pwm-leds";
> +
> +		ring_red: led-0 {
> +			color =3D <LED_COLOR_ID_RED>;
> +			default-state =3D "off";
> +			label =3D "ring_red";
> +			pwms =3D <&pwm5 0 1000000 0>;
> +			max-brightness =3D <255>;
> +		};
> +
> +		ring_green: led-1 {
> +			color =3D <LED_COLOR_ID_GREEN>;
> +			default-state =3D "off";
> +			label =3D "ring_green";
> +			pwms =3D <&pwm6 0 1000000 0>;
> +			max-brightness =3D <255>;
> +		};
> +
> +		ring_blue: led-2 {
> +			color =3D <LED_COLOR_ID_BLUE>;
> +			default-state =3D "off";
> +			label =3D "ring_blue";
> +			pwms =3D <&pwm7 0 1000000 0>;
> +			max-brightness =3D <255>;
> +		};
> +	};
> +
> +	/* also named 5V_Q7 in schematics */
> +	vcc5v0_sys: regulator-vccsys {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc5v0_sys";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +	};
> +};
> +
> +&cpu0 {
> +	cpu-supply =3D <&vdd_arm>;
> +};
> +
> +&cpu1 {
> +	cpu-supply =3D <&vdd_arm>;
> +};
> +
> +&cpu2 {
> +	cpu-supply =3D <&vdd_arm>;
> +};
> +
> +&cpu3 {
> +	cpu-supply =3D <&vdd_arm>;
> +};
> +
> +&display_subsystem {
> +	status =3D "okay";
> +};
> +
> +&dsi_dphy {
> +	status =3D "okay";
> +};
> +
> +&emmc {
> +	bus-width =3D <8>;
> +	cap-mmc-highspeed;
> +	/*
> +	 * For hs200 support, U-Boot would have to set the RK809 DCDC4
> +	 * rail to 1.8V from the default of 3.0V. It doesn't do that on
> +	 * devices out in the field, so disable hs200.
> +	 * mmc-hs200-1_8v;
> +	 */
> +	mmc-pwrseq =3D <&emmc_pwrseq>;
> +	non-removable;
> +	vmmc-supply =3D <&vcc_3v3>;
> +	vqmmc-supply =3D <&vcc_emmc>;
> +	status =3D "okay";
> +};
> +
> +&gmac {
> +	clock_in_out =3D "output";
> +	phy-handle =3D <&dp83825>;
> +	phy-supply =3D <&vcc_3v3>;
> +	status =3D "okay";
> +};
> +
> +&gpu {
> +	mali-supply =3D <&vdd_log>;
> +	status =3D "okay";
> +};
> +
> +/* I2C0 =3D PMIC, STUSB4500, RTC */
> +&i2c0 {
> +	status =3D "okay";
> +
> +	rk809: pmic@20 {
> +		compatible =3D "rockchip,rk809";
> +		reg =3D <0x20>;
> +		#clock-cells =3D <0>;
> +		clock-output-names =3D "xin32k";
> +		interrupt-parent =3D <&gpio0>;
> +		interrupts =3D <7 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pmic_int>;
> +		wakeup-source;
> +		rockchip,system-power-controller;

The "rockchip," prefix is not needed and deprecated, so you can drop it.
Same issue is present in patch 6 of this series.

Cheers,
  Diederik

--76ae7b15ebcac961fb29afb3c1039cc390728cd5d52cfd66bb9894187db4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaB3lNwAKCRDXblvOeH7b
bo/FAQC5JFHh6hf/TaSCesVRR7H5eRQlxvlw731y6nMua5aEMAEAhPjTcmcQNuWH
SVe21rvMza2bRe8N/MCmB9XPapWzzgU=
=Hk2D
-----END PGP SIGNATURE-----

--76ae7b15ebcac961fb29afb3c1039cc390728cd5d52cfd66bb9894187db4--


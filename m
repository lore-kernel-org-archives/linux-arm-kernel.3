Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D581C79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 17:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+r6n/vLnsOmInCcpk8izV7RIrFv8Rb9N3jvQGVPFeDA=; b=38WkKUwCnz19dEUaZRHGcAjbHa
	bacNqV/yI/Ev8Vc4FrdRbyCGiRQIV4wodU7YfMzYgJpVFvdQsY+5Kdi1ZugI1jPZp1OD///LqsSmT
	I+IJ49JtzovpIBxMZ1eoXdShq2S/fvdJs1Po6Ln02+fjzT9AKoDfGzyLPOocwBDtLAH6tatgsw6vG
	qKu6q2cRqoXTSYSoi3U3Lj13K9OVdIwuifU8SGKosavdp95ceXh23yqD6ZKSLDhmPnfngk8YvcufE
	kgPkQBg/Mg4pXlgGl/6/psezPFHXX2Xu0u7YrSYcexP6mGkKKB7N6W9sfRcMlulwuUhRtAQhLk4tM
	iPCOn/ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MJj-0000000CWiL-2NWw;
	Wed, 09 Sep 2026 17:42:39 +0000
Received: from out-167.mta0.migadu.com ([2001:41d0:1004:224b::a7] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MJf-0000000CWgy-2biB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 17:42:38 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=fTEVGWI3xZqNHtli5O7XYQjJwsilEDuETEuMfL8uIPM=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788975752; v=1; x=1789580552;
 b=RF54K1YLN66eGsOhQnHzlvBKiZTc9tuYeIhf4Dr+eaNoqHxNappwd5aEZ142VCyb4P9UUDOm
 BoWRYyUtZTO7bY7aqVWH42O2gDRw67guvkL9pySNIi1HMZ5C2aQq+TLAgIV+rT8TVj/LRe9UIFh
 ZXo0iV0EeceA7ddksiOfyteB9kIXeItJiBD3jJNiCeGX8Onr0yxa98uMB3SMZFFTvVSoF8aywQR
 lKLVpssPrhFLbmebEkEIyY31IypSAVqDNLBwdHGtaD0mMoL7f5EulfuPdFkwT/WqrrQI5IUNYZr
 wI9T8PO03yfJKlX+IZkrPTG5YpIFhoL/kgYUqIaofqdcA==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 29aa8afd47eb6454;
	Wed, 09 Sep 2026 17:42:22 +0000
X-Mizu-Trace-ID: 29aa8afd47eb6454
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 09 Sep 2026 19:42:18 +0200
Message-Id: <DLAYZ0FCWA2N.15D8EHX3COH6P@cknow-tech.com>
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: <HystericalDragons@proton.me>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Chukun Pan" <amadeus@jmu.edu.cn>, "jensen" <jensenhuang@friendlyarm.com>,
 "Andrey Korshunov" <razor1702@gmail.com>, "Diederik de Haas"
 <diederik@cknow-tech.com>
Subject: Re: [PATCH v3 5/5] arm64: dts: rockchip: Follow the DTS coding
 style in the NanoPi RK3528 devicetrees
X-Mailer: aerc 0.22.0-9-ge948bb7230f4
References: <20260909-r28s-upstream-v3-0-ee3e1a34a353@proton.me>
 <20260909-r28s-upstream-v3-5-ee3e1a34a353@proton.me>
In-Reply-To: <20260909-r28s-upstream-v3-5-ee3e1a34a353@proton.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_104236_289634_447CBA2C 
X-CRM114-Status: GOOD (  21.62  )
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

On Wed Sep 9, 2026 at 4:33 PM CEST, =E5=AE=89=E5=AE=B9 via B4 Relay wrote:
> From: =E5=AE=89=E5=AE=B9 <HystericalDragons@proton.me>
>
> scripts/dtc/dt-check-style --mode=3Dstrict reports two deviations from

I mentioned dt-check-style as it is a useful tool and it would be
beneficial if more/all future submissions were also checked with it.
I would not make it part of the commit message though.
Just like 'checkpatch' is a tool in the toolbox, so is dt-check-style.

> Documentation/devicetree/bindings/dts-coding-style.rst in the shared

Because the actual reason for this change is a violation of the DTS coding
style ... which I would put in the commit message.

> NanoPi RK3528 devicetree and in the NanoPi Zero2 board devicetree:
> "pinctrl-0" has to sort before "pinctrl-names", and "status" has to be
> preceded by a blank line when the node has content before it.
>
> Sort the properties and add the missing blank lines. The generated
> devicetree blobs are unchanged.

Making explicit which fixes you've done is fine AFAIC, but not strictly
needed as the diff already shows it. I would rather use "No functional
changes.", instead of 'blobs are unchanged'.

> The remaining findings of the tool are left alone, as they contradict
> the established practice in arch/arm64/boot/dts/rockchip: "model"
> before "compatible", "regulator-name" before the other regulator
> properties, "regulator-min-microvolt" before "regulator-max-microvolt",
> "pwms" before "pwm-supply" and "linux,code" before "wakeup-source" or
> "press-threshold-microvolt".

But as you noticed, it's not flawless. My guess is that it actually does
an alphanumerical sort, while the DTS coding style prescribes a natural
sorting. Dunno if there's an actual (enforceable) definition for it.

I would not list what I see as tool errors in the commit message though.

AFAIC no need for a new version for (just) this though.

My 0.02

Cheers,
  Diederik

> Suggested-by: Diederik de Haas <diederik@cknow-tech.com>
> Signed-off-by: =E5=AE=89=E5=AE=B9 <HystericalDragons@proton.me>
> ---
>  .../boot/dts/rockchip/rk3528-nanopi-zero2.dts      |  5 +++--
>  arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi    | 26 +++++++++++++++-=
------
>  2 files changed, 21 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts b/arch/=
arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
> index 48e4273872..96c537da6a 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
> @@ -25,8 +25,8 @@ button-recovery {
> =20
>  	leds {
>  		compatible =3D "gpio-leds";
> -		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <&led1>, <&led_sys>;
> +		pinctrl-names =3D "default";
> =20
>  		led-0 {
>  			color =3D <LED_COLOR_ID_RED>;
> @@ -59,8 +59,8 @@ usb2_host_5v: regulator-5v0-usb2-host {
>  		compatible =3D "regulator-fixed";
>  		enable-active-high;
>  		gpios =3D <&gpio4 RK_PB5 GPIO_ACTIVE_HIGH>;
> -		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <&usb20_host1_pwren>;
> +		pinctrl-names =3D "default";
>  		regulator-name =3D "usb2_host_5v";
>  		regulator-min-microvolt =3D <5000000>;
>  		regulator-max-microvolt =3D <5000000>;
> @@ -96,5 +96,6 @@ &usb_host0_ohci {
> =20
>  &usb2phy_host {
>  	phy-supply =3D <&usb2_host_5v>;
> +
>  	status =3D "okay";
>  };
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi b/arch/arm64=
/boot/dts/rockchip/rk3528-nanopi.dtsi
> index 1980d14d6f..45e31b90a7 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3528-nanopi.dtsi
> @@ -77,8 +77,8 @@ vcc_3v3: regulator-3v3-vcc {
>  	vcc3v3_sd: regulator-3v3-vcc-sd {
>  		compatible =3D "regulator-fixed";
>  		gpios =3D <&gpio4 RK_PA1 GPIO_ACTIVE_LOW>;
> -		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <&sdmmc_pwren_l>;
> +		pinctrl-names =3D "default";
>  		regulator-name =3D "vcc3v3_sd";
>  		regulator-min-microvolt =3D <3300000>;
>  		regulator-max-microvolt =3D <3300000>;
> @@ -97,8 +97,8 @@ vcc5v0_sys: regulator-5v0-vcc-sys {
>  	vccio_sd: regulator-vccio-sd {
>  		compatible =3D "regulator-gpio";
>  		gpios =3D <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>;
> -		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <&sdmmc_vol_ctrl_h>;
> +		pinctrl-names =3D "default";
>  		regulator-name =3D "vccio_sd";
>  		regulator-min-microvolt =3D <1800000>;
>  		regulator-max-microvolt =3D <3300000>;
> @@ -152,20 +152,23 @@ &gmac1 {
>  	phy-handle =3D <&rgmii_phy>;
>  	phy-mode =3D "rgmii-id";
>  	phy-supply =3D <&vcc_3v3>;
> -	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&rgmii_miim>, <&rgmii_tx_bus2>, <&rgmii_rx_bus2>,
>  		    <&rgmii_rgmii_clk>, <&rgmii_rgmii_bus>, <&gmac1_rstn_l>;
> +	pinctrl-names =3D "default";
> +
>  	status =3D "okay";
>  };
> =20
>  &gpu {
>  	mali-supply =3D <&vdd_logic>;
> +
>  	status =3D "okay";
>  };
> =20
>  &i2c1 {
> -	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&i2c1m0_xfer>;
> +	pinctrl-names =3D "default";
> +
>  	status =3D "okay";
> =20
>  	hym8563: rtc@51 {
> @@ -174,8 +177,8 @@ hym8563: rtc@51 {
>  		#clock-cells =3D <0>;
>  		interrupt-parent =3D <&gpio4>;
>  		interrupts =3D <RK_PC1 IRQ_TYPE_LEVEL_LOW>;
> -		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <&rtc_int_l>;
> +		pinctrl-names =3D "default";
>  		wakeup-source;
>  	};
>  };
> @@ -216,19 +219,22 @@ sdmmc_vol_ctrl_h: sdmmc-vol-ctrl-h {
>  };
> =20
>  &pwm1 {
> -	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pwm1m0_pins>;
> +	pinctrl-names =3D "default";
> +
>  	status =3D "okay";
>  };
> =20
>  &pwm2 {
> -	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pwm2m0_pins>;
> +	pinctrl-names =3D "default";
> +
>  	status =3D "okay";
>  };
> =20
>  &saradc {
>  	vref-supply =3D <&vcc_1v8>;
> +
>  	status =3D "okay";
>  };
> =20
> @@ -241,6 +247,7 @@ &sdhci {
>  	non-removable;
>  	vmmc-supply =3D <&vcc_3v3>;
>  	vqmmc-supply =3D <&vcc_1v8>;
> +
>  	status =3D "okay";
>  };
> =20
> @@ -252,12 +259,14 @@ &sdmmc {
>  	sd-uhs-sdr104;
>  	vmmc-supply =3D <&vcc3v3_sd>;
>  	vqmmc-supply =3D <&vccio_sd>;
> +
>  	status =3D "okay";
>  };
> =20
>  &uart0 {
> -	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&uart0m0_xfer>;
> +	pinctrl-names =3D "default";
> +
>  	status =3D "okay";
>  };
> =20
> @@ -266,6 +275,7 @@ &usb_host0_xhci {
>  	maximum-speed =3D "high-speed";
>  	phys =3D <&usb2phy_otg>;
>  	phy-names =3D "usb2-phy";
> +
>  	status =3D "okay";
>  };
> =20




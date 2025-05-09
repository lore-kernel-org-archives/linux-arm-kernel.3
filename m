Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD3BC3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 13:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R7GJ7qvzsdrqnYobrx3s7aB7m2F5mPpRtkMxGcl8bYk=; b=a/ZrKI4d8pOtuBCHq5ngxuxW4d
	QlXLsqCQ0AIkUW7NnKGu6/DXlkkr4iMB0HAEHwuZUMKfrfmZDfs3JXyUdht+T4o6thVZIC4Csdjke
	0VUKcXqNlVChlo3MLYaoOabA6/PoaX6HviZ8VuKqMjvFGD1Bbm/En4Y9J46JpSrV7HJgu01W9pq3u
	c6iPr82Wh/MAlI5A63FGKFZUqNvzPXwgFrz+5Tsmis7JMEyj1lXNxlReNvy5vQHvnM3QzVtcDaj8t
	EEoEHFoYjlIX2LKtwLSic3v/emvHgdXbi0ryYmP6L74DI9bWAZimruucjQ1R9/PFNtgKM0fsYP81Q
	VN8jhNQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDO6l-00000003poL-0PDh;
	Fri, 09 May 2025 13:49:47 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNEq-00000003ee8-2V2Y;
	Fri, 09 May 2025 12:54:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=R7GJ7qvzsdrqnYobrx3s7aB7m2F5mPpRtkMxGcl8bYk=; b=Qs9CY6NCsFtAMSdALPcnM0RY2S
	hVgMAFTAAEUXMZyhGOpCuicXYXbd+xpjtl+ZKbBmx18g+7UDSQMqnBCod+UOoDm02c0WmB3srf0YP
	Yq/WlJ74jJ8+4Ci62cu+ELaeTFc7b+w4jJKuDCQZwZyF5TrOSmBN9iMruMsxb7rsMkuvR9bw+CBwG
	XVim9lAnfXCwTGnBezG8zdJlIvYirt6kBoHhxj2dv3ldAjIC3PatC8rHzgET+OSU/fHBCVu1ztqYq
	AKSa8RmV1pSYSH6pCb1yDSdUkzdRFmIf9n88dSQEbCtgU39Rqf1gfOjYXZnhPTY5YGx8N4PGmAbxY
	UGmKiKgw==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uDNEn-0005A8-SH; Fri, 09 May 2025 14:54:01 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Diederik de Haas <didi.debian@cknow.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v2 2/5] arm64: dts: rockchip: move rock 5b to include file
Date: Fri, 09 May 2025 14:54:00 +0200
Message-ID: <2653568.Lt9SDvczpP@diego>
In-Reply-To: <D9RN1HZAXH1M.3H228KWQJ9CR0@cknow.org>
References: <20250508-rock5bp-for-upstream-v2-0-677033cc1ac2@kernel.org>
 <20250508-rock5bp-for-upstream-v2-2-677033cc1ac2@kernel.org>
 <D9RN1HZAXH1M.3H228KWQJ9CR0@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_055404_654541_DF4360FD 
X-CRM114-Status: GOOD (  28.05  )
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

Am Freitag, 9. Mai 2025, 14:44:57 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Diederik de Haas:
> Hi,
>=20
> On Thu May 8, 2025 at 7:48 PM CEST, Sebastian Reichel wrote:
> > Radxa released some more boards, which are based on the original
> > Rock 5B. Move its board description into an include file to avoid
> > unnecessary duplication.
>=20
> Aren't you moving it *out of* an/the include file?
> If so, the patch Subject and the above line should be updated so that
> they correctly reflect what is changed in this patch.
>=20
> The above text is correct (and the same ...) as patch 1, but in this
> patch you move things out of the dtsi which are unique per board.
>=20
> > NOTE: this should be merged with the previous commit to ensure
> > bisectability. The rename happens in a separete commit during
> > development because git does not properly detect the rename when
> > the original filename is reused in the same commit. This means
> >
> > 1. it's a lot harder to review the changes
> > 2. it's a lot harder to rebase the patch series
>=20
> Or did I fall prey to the exact thing you described here?

I think Sebastian's idea  is, that I squash both patches when applying.
This split makes it easy(er) to review because patch1 is just a rename.

And merging them when applying then makes it again not break bisectability.


Heiko


> Cheers,
>   Diederik
>=20
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts  | 52 ++++++++++++++++=
++++++++
> >  arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi | 40 ----------------=
=2D-
> >  2 files changed, 52 insertions(+), 40 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm=
64/boot/dts/rockchip/rk3588-rock-5b.dts
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..9407a7c9910ada1f6c803d2=
e15785a9cbd9bd655
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
> > @@ -0,0 +1,52 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +
> > +/dts-v1/;
> > +
> > +#include "rk3588-rock-5b.dtsi"
> > +
> > +/ {
> > +	model =3D "Radxa ROCK 5B";
> > +	compatible =3D "radxa,rock-5b", "rockchip,rk3588";
> > +};
> > +
> > +&sdio {
> > +	max-frequency =3D <200000000>;
> > +	no-sd;
> > +	no-mmc;
> > +	non-removable;
> > +	bus-width =3D <4>;
> > +	cap-sdio-irq;
> > +	disable-wp;
> > +	keep-power-in-suspend;
> > +	wakeup-source;
> > +	sd-uhs-sdr12;
> > +	sd-uhs-sdr25;
> > +	sd-uhs-sdr50;
> > +	sd-uhs-sdr104;
> > +	vmmc-supply =3D <&vcc3v3_pcie2x1l0>;
> > +	vqmmc-supply =3D <&vcc_1v8_s3>;
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&sdiom0_pins>;
> > +	status =3D "okay";
> > +};
> > +
> > +&uart6 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&uart6m1_xfer &uart6m1_ctsn &uart6m1_rtsn>;
> > +	status =3D "okay";
> > +};
> > +
> > +&pinctrl {
> > +	usb {
> > +		vcc5v0_host_en: vcc5v0-host-en {
> > +			rockchip,pins =3D <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> > +		};
> > +	};
> > +};
> > +
> > +&vcc5v0_host {
> > +	enable-active-high;
> > +	gpio =3D <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&vcc5v0_host_en>;
> > +};
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi b/arch/ar=
m64/boot/dts/rockchip/rk3588-rock-5b.dtsi
> > index 17f4fd054cd3d1c4e23ccfe014a9c4b9d7ad1a06..6052787d2560978d2bae6cf=
beea5fc1d419d583a 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi
> > @@ -8,9 +8,6 @@
> >  #include "rk3588.dtsi"
> > =20
> >  / {
> > -	model =3D "Radxa ROCK 5B";
> > -	compatible =3D "radxa,rock-5b", "rockchip,rk3588";
> > -
> >  	aliases {
> >  		mmc0 =3D &sdhci;
> >  		mmc1 =3D &sdmmc;
> > @@ -139,10 +136,6 @@ vcc5v0_host: regulator-vcc5v0-host {
> >  		regulator-always-on;
> >  		regulator-min-microvolt =3D <5000000>;
> >  		regulator-max-microvolt =3D <5000000>;
> > -		enable-active-high;
> > -		gpio =3D <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
> > -		pinctrl-names =3D "default";
> > -		pinctrl-0 =3D <&vcc5v0_host_en>;
> >  		vin-supply =3D <&vcc5v0_sys>;
> >  	};
> > =20
> > @@ -488,12 +481,6 @@ pcie3_vcc3v3_en: pcie3-vcc3v3-en {
> >  			rockchip,pins =3D <1 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
> >  		};
> >  	};
> > -
> > -	usb {
> > -		vcc5v0_host_en: vcc5v0-host-en {
> > -			rockchip,pins =3D <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> > -		};
> > -	};
> >  };
> > =20
> >  &pwm1 {
> > @@ -530,27 +517,6 @@ &sdmmc {
> >  	status =3D "okay";
> >  };
> > =20
> > -&sdio {
> > -	max-frequency =3D <200000000>;
> > -	no-sd;
> > -	no-mmc;
> > -	non-removable;
> > -	bus-width =3D <4>;
> > -	cap-sdio-irq;
> > -	disable-wp;
> > -	keep-power-in-suspend;
> > -	wakeup-source;
> > -	sd-uhs-sdr12;
> > -	sd-uhs-sdr25;
> > -	sd-uhs-sdr50;
> > -	sd-uhs-sdr104;
> > -	vmmc-supply =3D <&vcc3v3_pcie2x1l0>;
> > -	vqmmc-supply =3D <&vcc_1v8_s3>;
> > -	pinctrl-names =3D "default";
> > -	pinctrl-0 =3D <&sdiom0_pins>;
> > -	status =3D "okay";
> > -};
> > -
> >  &sfc {
> >  	pinctrl-names =3D "default";
> >  	pinctrl-0 =3D <&fspim2_pins>;
> > @@ -566,12 +532,6 @@ flash@0 {
> >  	};
> >  };
> > =20
> > -&uart6 {
> > -	pinctrl-names =3D "default";
> > -	pinctrl-0 =3D <&uart6m1_xfer &uart6m1_ctsn &uart6m1_rtsn>;
> > -	status =3D "okay";
> > -};
> > -
> >  &spi2 {
> >  	status =3D "okay";
> >  	assigned-clocks =3D <&cru CLK_SPI2>;
>=20
>=20






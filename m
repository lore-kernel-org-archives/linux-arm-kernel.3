Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B30F4368A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 11:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8QyLMvKF44I/UarTwSVYz03wCTTEkLP4ZLZ/bSttUck=; b=DHgSM1Au9B0wi7pQ5RzTcwpmH4
	irDKFxYNzRe0rkOJIFDfyW9NA3hgDkH9iuwl4Sn5FGYfJ39fhHMy5NxS1ywg5R4dy2SzoCrBMww0t
	KNk2xhW+JEezB2T3aicrHeBde5GI+z7aoLUPDmpTt6AVltD7x7hOX1dGMYFxrpi5hXCK1ypShDBqN
	+6N0QcJF0io9U77MHOTpqk3Xc/O8NKYC/moK7Yx6c7hsPjVnOGHEQPFNeL+R45kf/UWSt0sRtjzAW
	uc/j7153utz3iqHOrCVuMiyUyitVDT+QOqaunsj1g5F8my5MBDJTLyBx/ioZUF2V/AVamfqDHeQWR
	E39LYqtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDhRK-00000003yzC-33eJ;
	Fri, 17 Apr 2026 11:32:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDhRI-00000003yyc-1RC3;
	Fri, 17 Apr 2026 11:32:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=8QyLMvKF44I/UarTwSVYz03wCTTEkLP4ZLZ/bSttUck=; b=ALAyFiqJXMslOeqg+jJlEYthCo
	UVRDtIAW0JAjYkBK0IDOoG6FsPd84Xv4i1Ede9QYaKCkqHrvMjyCxPlUT/xuVb9WgUwWePUhg62w2
	uAFTXjOSfnRG2MOjpXKlwHIhHkPAJew55oBzmjYx39aV/86aIp4KZ816pzVVa4U9tdL/3s1kWc8l8
	7SM7z+MCW0jJyYUOqy+im8sAxJBq0+NDoUYi/DJIogEoJn2gKHhkgJujwM5kyWeEqFekfyTdMWfMI
	L31z0CTJe/InBk/UkCtZnueMejzmzj9KHjjzzqZUdvzKqNjJ0t1TFpAbujQWTMAP773E/1vGMGqk7
	HqjjK+WA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3576-luckfox-core3576
Date: Fri, 17 Apr 2026 13:32:37 +0200
Message-ID: <2000470.6tgchFWduM@phil>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-5-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
 <20260417-dts-rk-frl-enable-gpios-v1-5-a19c0dd8c9f6@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_043248_404112_F2778FE1 
X-CRM114-Status: GOOD (  20.31  )
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

Hi Cristian,

the comments below apply sort of to all patches in that series.

Am Freitag, 17. April 2026, 11:24:39 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Cristian Ciocaltea:
> The board exposes the GPIO4_C6 line to control the voltage bias on the
> HDMI data lines.  It must be asserted when operating in HDMI 2.1 FRL
> mode and deasserted for HDMI 1.4/2.0 TMDS mode.
>=20
> Wire up the HDMI node to the GPIO line using the frl-enable-gpios
> property and drop the line from the vcc_5v0_hdmi regulator to allow
> adjusting the bias when transitioning between TMDS and FRL operating
> modes.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi b/=
arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
> index 749f0a54b478..93ae37699366 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
> @@ -140,10 +140,7 @@ regulator-state-mem {
> =20
>  	vcc_5v0_hdmi: regulator-vcc-5v0-hdmi {
>  		compatible =3D "regulator-fixed";
> -		enable-active-high;
> -		gpios =3D <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
> -		pinctrl-names =3D "default";
> -		pinctrl-0 =3D <&hdmi_con_en>;
> +		regulator-always-on;
>  		regulator-min-microvolt =3D <5000000>;
>  		regulator-max-microvolt =3D <5000000>;
>  		regulator-name =3D "vcc_5v0_hdmi";

I think this regulator was sort of a complete hack, to set that
gpio to some sort of default state, by declaring it as hdmi-pwr-supply.

Only 2 rk3576 boards seem, to use that hack, so I think as that "regulator"
is completely functionless now, the whole thing could be removed?



> @@ -231,6 +228,8 @@ &gpu {
>  };
> =20
>  &hdmi {
> +	pinctrl-0 =3D <&hdmi_txm0_pins &hdmi_tx_scl &hdmi_tx_sda &hdmi_frl_en>;
> +	frl-enable-gpios =3D <&gpio4 RK_PC6 GPIO_ACTIVE_LOW>;

this should be sorted the other way around I think.

Also please provide a pinctrl-names property too. If for whatever reason
the dw-hdmi aquires a 2nd pinctrl state in the future, this makes sure
board DTs are staying in the "old" compatible mode until they are adapted.


>  	status =3D "okay";
>  };
> =20
> @@ -655,7 +654,7 @@ &pcie0 {
> =20
>  &pinctrl {
>  	hdmi {
> -		hdmi_con_en: hdmi-con-en {
> +		hdmi_frl_en: hdmi-frl-en {

pinctrl names should ideally match the naming in schematics, for example
the "HDMI0_TX_ON_H" for jaguar and tiger. This makes it way easier to
go from DT to schematics and back.

>  			rockchip,pins =3D <4 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
>  		};
>  	};
>=20
>=20

Heiko




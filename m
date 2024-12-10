Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D5EE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 11:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dC9p5FCQHs2anWJcb1DSJZ9Qt5OmqJaqiCA2H3GVUdA=; b=GYD8HiplS8pZi7Djd4xnrsOdSu
	sNBzcumtNXpdo1qnyLm+Ymfb/egcd/CC+5Gz9fXco+uXt9bB4uWFWzcFIocFkX5zyT4Ja6Tznxg01
	Jv3v3rRPBhq3tEn2weAZoYWOoxWFT6Y4zB7S5W9xrWE4nRn3tHLkhs9TnbnCSiojaGG6ifA1FKroT
	o1SS3sHEQNKvAKR8EphQBX4M7jEhhDioPRoaEddlEevUtmRmB5OityjzrKhS50d/bUbBrZFPDAjsX
	mPYOVfvjCZh7KvNjxEc7l/SZ5K0HSObFHsXCHlQFGYvSO/+9UPoPCpWY3UpPerYSp1tzrkiTM/rp0
	3yPpezLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKyTV-0000000BKC5-2xu4;
	Tue, 10 Dec 2024 11:32:21 +0000
Received: from out-185.mta0.migadu.com ([2001:41d0:1004:224b::b9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKySQ-0000000BJtp-3G5j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 11:31:16 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1733830272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dC9p5FCQHs2anWJcb1DSJZ9Qt5OmqJaqiCA2H3GVUdA=;
	b=rhbg1cnDCmr4+sq42ofOWItwWMMrQ/fu3jv83RueAD29byK8AuCHomk+TOanv7eTttbQ4O
	SlK3EjM51VoQtoedkuRdy9/wxUoYnw1tJb5P19ZzuLkzRPyIYhI/Xe9nRsIeXFGf6RZVyh
	PPRxoFJPVc+Ddh50sp6ecHS6VDOTRDXIA6KddPPRunRntp8cWBkfR+q7WrMsFPL7m6O1AB
	KLUl/t3jylitbOMRyfrs4zeQGCg2bQOlWC1TqPn3BTkkPJZVMt2Gt2CP/0TxispyBNtH/q
	RwHbfXmksyJ2Hrwjt2N+NcwGxdhaVhXsaLkqJpemT8rCJgdpM7+I0KEFca0zJA==
Content-Type: multipart/signed;
 boundary=768b44e4608be46521de5d39885a4e035e23bf1739a34b0bd3d7b81b3cbe;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Tue, 10 Dec 2024 12:31:02 +0100
Message-Id: <D67ZJ6MOM5TH.2WBYCCU20DDJO@cknow.org>
Subject: Re: [PATCH 5/6] arm64: dts: rockchip: correct rk3328-roc regulator
 map
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Peter Geis" <pgwipeout@gmail.com>, "Heiko Stuebner" <heiko@sntech.de>
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Dragan Simic"
 <dsimic@manjaro.org>, "Johan Jonker" <jbx6244@gmail.com>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Levin Du" <djw@t-chip.com.cn>, "Rob
 Herring" <robh@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>
References: <20241210013010.81257-1-pgwipeout@gmail.com>
 <20241210013010.81257-6-pgwipeout@gmail.com>
In-Reply-To: <20241210013010.81257-6-pgwipeout@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_033115_216203_9E3F94CF 
X-CRM114-Status: GOOD (  17.07  )
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

--768b44e4608be46521de5d39885a4e035e23bf1739a34b0bd3d7b81b3cbe
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Peter,

Thanks for this series, I already saw some familiar error msgs
mentioned, so will try this series out soon (tm).

On Tue Dec 10, 2024 at 2:30 AM CET, Peter Geis wrote:
> The rk3328-roc-cc input power is sourced from a micro-usb port, while
> the rk3328-roc-pc input power is sourced from a usb-c port. Both inputs
> are 5vdc only. Remove the 12v input from the device tree.
>
> While we are at it, add missing voltages and supply to vcc_phy, missing
> voltages to vcc_host1_5v, and standardize the order of regulator
> properties among the fixed regulators.

Big fan of standardization :-) ...

>
> Fixes: 2171f4fdac06 ("arm64: dts: rockchip: add roc-rk3328-cc board")
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
>
>  arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi | 23 +++++++++++++-------
>  1 file changed, 15 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi b/arch/arm64/bo=
ot/dts/rockchip/rk3328-roc.dtsi
> index f782c8220dd3..6984387ff8b3 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
> @@ -24,22 +24,23 @@ gmac_clkin: external-gmac-clock {
>  		#clock-cells =3D <0>;
>  	};
> =20
> -	dc_12v: regulator-dc-12v {
> +	/* fed from passive usb input connector */
> +	dc_5v: regulator-dc-5v {
>  		compatible =3D "regulator-fixed";
> -		regulator-name =3D "dc_12v";
> +		regulator-name =3D "dc_5v";
>  		regulator-always-on;
>  		regulator-boot-on;
> -		regulator-min-microvolt =3D <12000000>;
> -		regulator-max-microvolt =3D <12000000>;
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
>  	};
> =20
>  	vcc_sd: regulator-sdmmc {
>  		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc_sd";
>  		gpio =3D <&gpio0 RK_PD6 GPIO_ACTIVE_LOW>;
>  		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <&sdmmc0m1_pin>;
>  		regulator-boot-on;
> -		regulator-name =3D "vcc_sd";
>  		regulator-min-microvolt =3D <3300000>;
>  		regulator-max-microvolt =3D <3300000>;
>  		vin-supply =3D <&vcc_io>;

... but why not put regulator-name as the first of the regulator
properties as is done in the rk3328-rock64.dts ...

> @@ -50,22 +51,25 @@ vcc_sdio: regulator-sdmmcio {
>  		states =3D <1800000 0x1>, <3300000 0x0>;
>  		regulator-name =3D "vcc_sdio";
>  		regulator-type =3D "voltage";
> +		regulator-always-on;
>  		regulator-min-microvolt =3D <1800000>;
>  		regulator-max-microvolt =3D <3300000>;
> -		regulator-always-on;
>  		vin-supply =3D <&vcc_sys>;
>  	};
> =20
>  	vcc_host1_5v: vcc_otg_5v: regulator-vcc-host1-5v {
>  		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vcc_host1_5v";
>  		enable-active-high;
>  		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <&usb20_host_drv>;
> -		regulator-name =3D "vcc_host1_5v";
>  		regulator-always-on;
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
>  		vin-supply =3D <&vcc_sys>;
>  	};

... and was the case here?

Cheers,
  Diederik

> =20
> +	/* sourced from usb input through 3A fuse */
>  	vcc_sys: regulator-vcc-sys {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vcc_sys";
> @@ -73,7 +77,7 @@ vcc_sys: regulator-vcc-sys {
>  		regulator-boot-on;
>  		regulator-min-microvolt =3D <5000000>;
>  		regulator-max-microvolt =3D <5000000>;
> -		vin-supply =3D <&dc_12v>;
> +		vin-supply =3D <&dc_5v>;
>  	};
> =20
>  	vcc_phy: regulator-vcc-phy {
> @@ -81,6 +85,9 @@ vcc_phy: regulator-vcc-phy {
>  		regulator-name =3D "vcc_phy";
>  		regulator-always-on;
>  		regulator-boot-on;
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		vin-supply =3D <&vcc_io>;
>  	};
> =20
>  	leds {


--768b44e4608be46521de5d39885a4e035e23bf1739a34b0bd3d7b81b3cbe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZ1gmeQAKCRDXblvOeH7b
bmMBAQDzQzO1G+w5qzoBp5aUjpUNIUQhGVvq8MR3l/ziGJqI8gEAyBZ7Pt2t9Uc1
WSOu5/T6z7u4uJ8LYn9q97mYE7UlTg0=
=qRUc
-----END PGP SIGNATURE-----

--768b44e4608be46521de5d39885a4e035e23bf1739a34b0bd3d7b81b3cbe--


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773FFCAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 09:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o/FsUHZpUwtMtFiC6QiXyV09jlQR1OM6fWOKHvw5+8w=; b=WtB0izmAx+WzqgbXfpgVZquZzO
	w73/xwyiUKeWYwQLnl/JYfzbaoDtQE8Q+DDQ4EaB2LMfIFGO03Nsxw7q3IXuR1IYrDaBnAbGjHYS6
	atR8WojO74xSpEAeBEr8rHIC4XFRg02mPset6gBFu8m3OfjtUvbfDJ4lWMO/3AGvQBjOdV4HpiwPv
	8t0+UIb68SVyUEXFyQgAx7eWHTrns8zJGScCTU/sL1tUaXVy/uHMVUAqLe9cE/NLiFHiz2IOntTcH
	mV7JeHqNPOOxQSK2+EvP5H0HH+TCUYZ9K+wdkXyK0iicFBK/ep/+CT2ODDhOqlnz7WhBvfGB73YPU
	C/fqutaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Ade-0000000245H-1ifq;
	Mon, 29 Sep 2025 09:57:46 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Adb-0000000244U-2Leg;
	Mon, 29 Sep 2025 09:57:45 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1759139856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o/FsUHZpUwtMtFiC6QiXyV09jlQR1OM6fWOKHvw5+8w=;
	b=SOxFflLEf6Rjwp29LFayU4mIroCapYlknZs8TqHsmxnrfbpo+GDA33o/QoqwHB4ux2EFBT
	IWU+totZ3Rtgvbj0qDHteY1N/vVjeBH8ERUnec9/pkdyrQvnyca1TYrqH1NZ0IXvA3YYsY
	lBnkBe2PhX+VEb+zQHGcaHiIob424plaOfQ4SRdy8TChu7bm1pgO3oLHAfSGLZs/2ixgZ7
	yP+IVPvlQpGSapgxMYd8p+WW7T5Oj0Q9jRl9/JbTlRA92mkkp9LCtkHPHNhYxvHlEW4lvM
	QzkSHqcJvYWHkHYUdMmKFt+vahEfVCHopzUgWrDU4Ay5vAbe+XxT9j9vczU1PA==
Content-Type: multipart/signed;
 boundary=cb0678fa4e25dcc650e6f47f2c81c7a9ab6e010a75fd318cadeb60384faa;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 29 Sep 2025 11:57:26 +0200
Message-Id: <DD5714TDL1NA.26WS3YF7EMZ5I@cknow.org>
Cc: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Ondrej Jirman" <megi@xff.cz>, "Martijn Braam" <martijn@brixit.nl>,
 =?utf-8?q?Kamil_Trzci=C5=84ski?= <ayufan@ayufan.eu>
Subject: Re: [PATCH v4 1/4] arm64: dts: rk3399-pinephone-pro: Add
 light/proximity sensor support
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: <guptarud@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Heiko Stuebner" <heiko@sntech.de>
References: <20250929-ppp_light_accel_mag_vol-down-v4-0-6598f22d3451@gmail.com> <20250929-ppp_light_accel_mag_vol-down-v4-1-6598f22d3451@gmail.com>
In-Reply-To: <20250929-ppp_light_accel_mag_vol-down-v4-1-6598f22d3451@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_025744_217977_65283A57 
X-CRM114-Status: GOOD (  13.46  )
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

--cb0678fa4e25dcc650e6f47f2c81c7a9ab6e010a75fd318cadeb60384faa
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Mon Sep 29, 2025 at 9:35 AM CEST, Rudraksha Gupta via B4 Relay wrote:
> From: Ondrej Jirman <megi@xff.cz>
>
> Pinephone Pro uses STK3311 according to the schematics.
> ...
> Co-developed-by: Martijn Braam <martijn@brixit.nl>
> Signed-off-by: Martijn Braam <martijn@brixit.nl>
> Co-developed-by: Kamil Trzci=C5=84ski <ayufan@ayufan.eu>
> Signed-off-by: Kamil Trzci=C5=84ski <ayufan@ayufan.eu>
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts | 15 +++++++++++++=
++
>  1 file changed, 15 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts b/arch=
/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> index 6f97e57f36f5599f4027a0f3db98bcbc69cef5e5..71d32c4bae0d0336ac0c91204=
3618fc9b94919ef 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts
> @@ -520,6 +520,15 @@ touchscreen@14 {
>  		touchscreen-size-x =3D <720>;
>  		touchscreen-size-y =3D <1440>;
>  	};
> +
> +	light-sensor@48 {
> +		compatible =3D "sensortek,stk3311";
> +		reg =3D <0x48>;
> +		interrupt-parent =3D <&gpio4>;
> +		interrupts =3D <RK_PD3 IRQ_TYPE_EDGE_FALLING>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&stk3311_int>;
> +	};
>  };
> =20
>  &i2c4 {
> @@ -689,6 +698,12 @@ vcc1v8_codec_en: vcc1v8-codec-en {
>  		};
>  	};
> =20
> +	stk3311 {
> +		stk3311_int: stk3311-int {
> +			rockchip,pins =3D <4 RK_PD3 RK_FUNC_GPIO &pcfg_input_pull_up>;

On page 11 and 17 of PPP schematic V1.0-20211127 I see LIGHT_INT_L as
identifier so it's best to use that identifier here, thus
``light_int_l: light-int-l {``
and update the pinctrl-0 reference accordingly.

Cheers,
  Diederik

> +		};
> +	};
> +
>  	wireless-bluetooth {
>  		bt_wake_pin: bt-wake-pin {
>  			rockchip,pins =3D <2 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;


--cb0678fa4e25dcc650e6f47f2c81c7a9ab6e010a75fd318cadeb60384faa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaNpYCAAKCRDXblvOeH7b
bvsuAPsEC/G3fJAw/u6yVlNjqrrlLRyZ1BAsI/p7LKdixd2uOgEAkW/WYh9W3sk7
dKjhmsr7Dc8j5Hx0B0dGqOs3NS6jzgY=
=zCuL
-----END PGP SIGNATURE-----

--cb0678fa4e25dcc650e6f47f2c81c7a9ab6e010a75fd318cadeb60384faa--


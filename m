Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C641CC83029
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 19:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1IjTfiI6YOU4Q4l0EImUrTasIaT8l6VP8YEW14aV+kQ=; b=zhEwzXIFnR3qVcxg6E1QdFV8rA
	w0iUSHDMsTBJTCtCBpuTf9qp4IB7cHrftxkY2rHGsTQ+RkMe9U5AQROva5+e93va2JUNWgPNWwr2g
	bGwZRDgl3+hRkw8KJb/u9qXyktEBYjAsxnKAJ+bgCXs5//Uc4HDDFHYQjBlk1ZpAgHH+kZB3QUL+W
	xXRAyuBUO3vL2weGXy2IH1ZN/4roeP4BDKQhVCR/9EYl2EebekNk/3buTjtdpFZNy7TaBCo8gIyl6
	3jRGmTs/Ik+3EOqxHhJEzZrI/VFJX7lhbwOt24ica2JBdgRHc4vRFLFfR5HeXadmSa3Bbg3/RKia5
	OiSa9KuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWKI7-00000003J0C-1ECR;
	Mon, 30 Jun 2025 19:35:47 +0000
Received: from out-186.mta0.migadu.com ([91.218.175.186])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWIzn-000000039VQ-2Vsm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 18:12:49 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751307163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1IjTfiI6YOU4Q4l0EImUrTasIaT8l6VP8YEW14aV+kQ=;
	b=ZtKTsCfQFJLmOjxOwr/ja+NklV6ewZ7jV+roC/0MrZDNbu2wLBa05nl3CFFZncVXTSxGcq
	bRMm47JkB8u8BPwcTx0ypTfRpSu71rCC1kOs5NnFMGi/rvenX0P27Md80CxJSASApC9mTP
	QE0/1IWlGVfiXOXwi9NL8cYKH4p24lgjiGndKCJYXCM6oKgx2shIOcEILuRaM2zwnFE3O2
	1hWE9ekxB6gMkeiHXe2RO+5gDV27Is/BjQ9wSaPQZQzgdihVIFzkm6qVerfl0oZq5LhGt8
	vZuGJmFBu+16mxNt+rWtkZdsKZlWk6KMdq4RRDylbN8RPikqSKGINsh4tVJ6Cg==
Content-Type: multipart/signed;
 boundary=15e5725fc5b5f4c0c9d367992ee8abf67013301df5a41c1f57230398550e;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 30 Jun 2025 20:12:27 +0200
Message-Id: <DB02KKR1VK9H.1Q1Y5A98FKGLK@cknow.org>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <kernel@collabora.com>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: adjust dcin regulator on ROCK
 4D
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>
References: <20250630-rock4d-reg-usb-wifi-v1-0-1057f412d98c@collabora.com>
 <20250630-rock4d-reg-usb-wifi-v1-1-1057f412d98c@collabora.com>
In-Reply-To: <20250630-rock4d-reg-usb-wifi-v1-1-1057f412d98c@collabora.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_111247_975505_97521D3C 
X-CRM114-Status: GOOD (  16.51  )
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

--15e5725fc5b5f4c0c9d367992ee8abf67013301df5a41c1f57230398550e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Nicolas,

On Mon Jun 30, 2025 at 5:36 PM CEST, Nicolas Frattaroli wrote:
> The ROCK 4D's actual DC input is 5V, and the schematic names it as being
> 5V as well.
>
> Rename the regulator, and change the voltage it claims to be at.

Shouldn't it have a fixes tag then? Providing 12V where 5V is expected
sounds problematic ;-)

> Furthermore, fix vcc_1v1_nldo_s3's vin-supply as coming from
> vcc_5v0_sys, and not the DCIN, as per the schematic. This makes no
> functional change; both regulators are always on, and one feeds into the
> other.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64=
/boot/dts/rockchip/rk3576-rock-4d.dts
> index 6756403111e704cad42f6674d5ab55eb0306f1e3..352e3df165688219bfedc1973=
4d9eb32c547ec44 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
> @@ -57,13 +57,13 @@ user-led {
>  		};
>  	};
> =20
> -	vcc_12v0_dcin: regulator-vcc-12v0-dcin {
> +	vcc_5v0_dcin: regulator-vcc-5v0-dcin {
>  		compatible =3D "regulator-fixed";
>  		regulator-always-on;
>  		regulator-boot-on;
> -		regulator-min-microvolt =3D <12000000>;
> -		regulator-max-microvolt =3D <12000000>;
> -		regulator-name =3D "vcc_12v0_dcin";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		regulator-name =3D "vcc_5v0_dcin";
>  	};

With the name change, this block needs to be moved down.

Cheers,
  Diederik
> =20
>  	vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
> @@ -166,7 +166,7 @@ vcc_5v0_device: regulator-vcc-5v0-device {
>  		regulator-min-microvolt =3D <5000000>;
>  		regulator-max-microvolt =3D <5000000>;
>  		regulator-name =3D "vcc_5v0_device";
> -		vin-supply =3D <&vcc_12v0_dcin>;
> +		vin-supply =3D <&vcc_5v0_sys>;
>  	};
> =20
>  	vcc_5v0_host: regulator-vcc-5v0-host {
> @@ -190,7 +190,7 @@ vcc_5v0_sys: regulator-vcc-5v0-sys {
>  		regulator-min-microvolt =3D <5000000>;
>  		regulator-max-microvolt =3D <5000000>;
>  		regulator-name =3D "vcc_5v0_sys";
> -		vin-supply =3D <&vcc_12v0_dcin>;
> +		vin-supply =3D <&vcc_5v0_dcin>;
>  	};
>  };
> =20


--15e5725fc5b5f4c0c9d367992ee8abf67013301df5a41c1f57230398550e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaGLTjgAKCRDXblvOeH7b
bpjeAQCzYAOFotMkkx+55BY9EWiLa3hdCx0OlYAGWZPUrLcXoQEAzb20FcRS6uLg
HcRGqO8KyFJR5wJ4qKDf06imkRHUpgM=
=TFga
-----END PGP SIGNATURE-----

--15e5725fc5b5f4c0c9d367992ee8abf67013301df5a41c1f57230398550e--


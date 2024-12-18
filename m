Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E36E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 14:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FOaMq1h4xw9lY78crmK5fmaa/PhCj+8V/cHyU3qhiFE=; b=dybU9OHO2+o68FGRl38DOUdTlh
	pn2HsAeP1ABWyb4rHQ2Kx9//amSjoq4eFR5KUKw5AZVrSHHrWkqWyqod39RyrKxNIGTB5fqzY3k9B
	JEuAeuCyEzgn/NOusZEXR0JKX0G0saEQBDQvwvm9EDEunT2KO7DrW+CvaKgRT/vlEFF9gIgIegsVJ
	WdRHZC3EKcCOThnFwhMAZGsMyEMKsw2IKEqubE1SY6dJAHXz8Y4OctuEgLnotUk4Pjo7UQt6IF7oC
	gKDCxQZy5w5tOlFkdPQQRl6Cc+FnmY6gsLiQ4BaQfmnm91w/zS6q6cU5bCRTTTlCk7ie/goqKUQnm
	uPsmCxGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNv3j-0000000GqrQ-3AUV;
	Wed, 18 Dec 2024 14:29:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNv2d-0000000Gqg5-1FVk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 14:28:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 96F335C61B0;
	Wed, 18 Dec 2024 14:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 991FBC4CECD;
	Wed, 18 Dec 2024 14:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734532126;
	bh=QBb4ql4W7i7q6VTY7ONxMF/vNewVhfHwxaZUuigiHu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eWpXnDv9yI0O+XOaDZYnKbxqg0G+RIZCeXTl3kjkhuY2n+YdiZiKPcafpiHjTIINS
	 ljyPUmjJGyfPteEp3tPQ7gzi0zp6kPmuuM2mOywh4NaudNz+ku7O2kR/CuRnYAzOs2
	 dHPMIcL+jsfSrUTMIfu6aIYndNGbDeCULBeIH67N7FbPEw5sgOXFBJglAgWv2mJIpF
	 jZUgCMTYMRqvRUX33+fl2og5Gy/TLmSBSZMob3ifiWLcXe+PoPOdSSTjPo/MkkFBTI
	 M3HG8ZsJR6qxFOi24OaQkDQgBJqGcXlX+v7u2QNajAKvnPYicNU3N+VlztarBlNufT
	 I2Itn2of0+IAg==
Date: Wed, 18 Dec 2024 14:28:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Poojaa R <poojaamonica94@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dtoverlays: Added DT overlay file for MAX98090 and the
 detailed steps for its usage is included in
 https://github.com/Poojaa-Rangaiah/DeviceTreeOverlay-for-MAX98090 .
Message-ID: <20241218-arrange-pointer-cdd39770b48b@spud>
References: <20241218065848.12254-1-poojaamonica94@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="M3bhhHaTmUl9gQ+V"
Content-Disposition: inline
In-Reply-To: <20241218065848.12254-1-poojaamonica94@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_062847_422796_A8412E75 
X-CRM114-Status: GOOD (  20.13  )
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


--M3bhhHaTmUl9gQ+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 12:28:48PM +0530, Poojaa R wrote:
> Only the driver files were existing for max98090 audio codec (playback an=
d capture) but now the max98090.dts file is also included in linux/arch/arm=
/boot/dts/overlays/.
> new file:   arch/arm/boot/dts/overlays/max98090.dts
>=20
> Signed-off-by: Poojaa R <poojaamonica94@gmail.com>

Why have you send this patch for your random github tree to lkml?

Thanks,
Conor.

> ---
>  arch/arm/boot/dts/overlays/max98090.dts | 96 +++++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 arch/arm/boot/dts/overlays/max98090.dts
>=20
> diff --git a/arch/arm/boot/dts/overlays/max98090.dts b/arch/arm/boot/dts/=
overlays/max98090.dts
> new file mode 100644
> index 000000000000..eaf197384edb
> --- /dev/null
> +++ b/arch/arm/boot/dts/overlays/max98090.dts
> @@ -0,0 +1,96 @@
> +/*
> + * Device Tree Overlay for MAX98090, MAX98091 Audio Codec.
> + * https://github.com/Poojaa-Rangaiah/DeviceTreeOverlay-for-MAX98090 =3D=
> for more details.
> + * MAX98090 audio codec as master and Raspberry Pi as slave.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +/ {
> +    compatible =3D "brcm,bcm2835", "brcm,bcm2711";
> +
> +    fragment@0 {
> +        target =3D <&i2s_clk_consumer>;
> +        __overlay__ {
> +            status =3D "okay";
> +        };
> +    };
> +
> +    fragment@1 {
> +        target =3D <&i2c1>;
> +        __overlay__ {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +            status =3D "okay";
> +            max98090_codec: max98090@10 {
> +                #sound-dai-cells =3D <0>;
> +                compatible =3D "maxim,max98090","maxim,max98091";
> +                reg =3D <0x10>;
> +                interrupt-parent =3D <&gpio>;
> +                interrupts =3D <27 2>;	/* GPIO 27 as Edge_Falling_IRQ (2=
) */
> +                maxim,micbias =3D <3>;
> +                status =3D "okay";
> +            };
> +        };
> +    };
> +
> +    fragment@2 {
> +        target-path =3D "/";
> +        __overlay__ {
> +            clk_oscillator: oscillator {
> +                compatible =3D "fixed-clock";
> +                #clock-cells =3D <0>;
> +                clock-frequency =3D <12288000>;  /* Frequency of the ext=
ernal oscillator (mclk =3D 12.288 MHz) but can also be 11.2896 MHz/12 MHz/1=
3 MHz/26 MHz/19.2 MHz. */
> +                clock-output-names =3D "mclk";
> +            };
> +        };
> +    };
> +
> +    fragment@3 {
> +        target =3D <&sound>;
> +        sound_overlay: __overlay__ {
> +            compatible =3D "simple-audio-card";
> +            simple-audio-card,format =3D "i2s";
> +            simple-audio-card,name =3D "MAX98090-Codec";
> +            simple-audio-card,bitclock-master =3D <&dailink0_master>;
> +            simple-audio-card,frame-master =3D <&dailink0_master>;
> +
> +            simple-audio-card,widgets =3D
> +                "Microphone", "Mic Jack",
> +                "Speaker", "Speaker",
> +                "Line", "Line In",
> +                "Line", "Line Out",
> +                "Headphone", "Headphone Jack";
> +
> +            simple-audio-card,routing =3D
> +                "Headphone Jack", "HPL",
> +                "Headphone Jack", "HPR",
> +                "Line Out", "RCVL",
> +                "Line Out", "RCVR",=20
> +                /* Uncomment any of these below lines if the Line Input(=
s) is(are) used else leave it as such. */
> +                //"IN5", "Line In",  /* IN1/IN2/IN3/IN4/IN6 (For single =
ended input) */
> +                //"IN56", "Line In", /* IN34 (For differential inputs) */
> +                "MIC1", "Mic Jack",
> +                "MIC2", "Mic Jack",
> +                "Speaker", "SPKL",
> +                "Speaker", "SPKR";
> +
> +            status =3D "okay";
> +
> +            simple-audio-card,cpu {
> +                sound-dai =3D <&i2s_clk_consumer>;
> +            };
> +
> +            dailink0_master: simple-audio-card,codec {
> +                sound-dai =3D <&max98090_codec>;
> +                clocks =3D <&clk_oscillator>;
> +            };
> +        };
> +    };
> +   =20
> +    __overrides__ {
> +        card-name =3D <&sound_overlay>, "simple-audio-card,name";
> +    };
> +};
> +
> --=20
> 2.34.1
>=20
>=20

--M3bhhHaTmUl9gQ+V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2LcGwAKCRB4tDGHoIJi
0pIgAP9wcVH4pCyWoUoFHY1sW2XjsrX0Kz3ul3TsB4/De7XkGgEA0gpSmzuZtNed
ullh9U8xxdqmI/jNTMHGw+HQE8yiCgY=
=mrmN
-----END PGP SIGNATURE-----

--M3bhhHaTmUl9gQ+V--


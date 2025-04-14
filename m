Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67769C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 06:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YaBBYXHfLF++cExY9hjSu3QHr8Mvyrqh9+FHlLk33ro=; b=wpVVgNZmzOH9eME7H+AggYfijq
	XKPQyEgd7r/sbmYy0jkMLhIlZaQSpBxV286+XfjiHiiqfIIIufJ8ksXGvZLU93AA4WQR9U932OOc/
	TQPXN5OHBrrUgx8GWDHmqSYb5QTkk7Toz/hEGmzg19+6SawZs7a6HsYQk4O3FIWwO/PQIJv0VQttJ
	PzlV/JdLnurv77eqMzp5bPXYaJxQ/Kw78ve48xowHFp4BJG37aW7/5eH60so8q0DMUkR0cS2TpItg
	SGdTYmKTqOLtnqVEx1iy8Al7DfChlpHNfh/ev0ADbAkpnaJCbdM0YNxZ1O4ucKk86NpJZHOuMMmPM
	nXuj1sFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Dfh-00000000r0R-1DrY;
	Mon, 14 Apr 2025 06:51:57 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4DcK-00000000qRN-201Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 06:48:30 +0000
Date: Mon, 14 Apr 2025 12:18:18 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744613305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YaBBYXHfLF++cExY9hjSu3QHr8Mvyrqh9+FHlLk33ro=;
	b=mP0VR8NeyztZF6hFVhgFhodcSN3xqJXCf+sxhThfbf+3vD4UsKkMYQ+TOj7bGCKMz+YypF
	RIwGyf88gDMgqqjy+yBfuvhM7ikDNifrSIWS6g/nc/4St2JbZAGHCTuZ+1c6De+eQAwIR+
	zCUD3IJWTTbjQXv86+Zabg8xkDGJApU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jai Luthra <jai.luthra@linux.dev>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, vaishnav.a@ti.com, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, u-kumar1@ti.com, stable@vger.kernel.org
Subject: Re: [PATCH v2 5/7] arm64: dts: ti: k3-am62x: Remove clock-names
 property from IMX219 overlay
Message-ID: <tosg63tki3b7xqr4kiioav3pjq3hwmj5vygb4d4ju46o7eyyfz@yowubjrrnsvh>
X-PGP-Key: http://jailuthra.in/files/public-key.asc
References: <20250409134128.2098195-1-y-abhilashchandra@ti.com>
 <20250409134128.2098195-6-y-abhilashchandra@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="udmjswxldcpwpkxo"
Content-Disposition: inline
In-Reply-To: <20250409134128.2098195-6-y-abhilashchandra@ti.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_234828_656797_FE40DECF 
X-CRM114-Status: GOOD (  15.29  )
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


--udmjswxldcpwpkxo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 5/7] arm64: dts: ti: k3-am62x: Remove clock-names
 property from IMX219 overlay
MIME-Version: 1.0

Thanks for the fix,

On Wed, Apr 09, 2025 at 07:11:26PM +0530, Yemike Abhilash Chandra wrote:
> The IMX219 sensor device tree bindings do not include a clock-names
> property. Remove the incorrectly added clock-names entry to avoid
> dtbs_check warnings.
>=20
> Fixes: 4111db03dc05 ("arm64: dts: ti: k3-am62x: Add overlay for IMX219")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>

Reviewed-by: Jai Luthra <jai.luthra@linux.dev>

> ---
>  arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso b/arch/a=
rm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
> index 76ca02127f95..7a0d35eb04d3 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
> @@ -39,7 +39,6 @@ ov5640: camera@10 {
>  				reg =3D <0x10>;
> =20
>  				clocks =3D <&clk_imx219_fixed>;
> -				clock-names =3D "xclk";
> =20
>  				reset-gpios =3D <&exp1 13 GPIO_ACTIVE_HIGH>;
> =20
> --=20
> 2.34.1
>=20

--udmjswxldcpwpkxo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmf8r7IACgkQQ96R+SSa
cUUWUw/9EANMG5P9O57SqaT7wfQ/VnxxlUUfXTqeHoYXuwDgLK/gIxA2AxlJzf1z
PjUvXjnwdn/2xnJzUlOJihlLkvqoG9oAaKKG3LUUx2AV5TA5jpX38M3ifvTjn5WK
8tIBq0EtGH8sC3vbx2RT7L3Lu1nA021oUXj8IK9IGtcCh4afVB2bGCDQmghY12WO
2P4XKVrMg11LUfm7Xpmo2JB6Nlc2P+lleh8UVr4kXhDtKp5MAJAJhEw+n7rfTUYU
FBpZOPNIwzxQNRhSVGY9n70A6vCzM6Z2zVPIwXHOX0IOAqBFywqrlF9iV+znyWoK
2wngiE5gcOxcsCjXuZSVCCtXz03yKvt4ELHGqy5t/N7Z6n3pL1ZY+WNcpqrGokMV
8EOYQKV+Wmon965m9T/HntHHxzAdnD2KF6bcM8Un7HK+Zit1SwMAmq5Ffml0IrMl
u8m9rNUL3enJgPrgy9JE3ZvqaMtbgQAxYUOuA7Gcx8uD3MvoR5KrIZZge0uWF9OI
w8QASdBjVSuucWJKathj5CSE6fBHBj4QY2Fqy1Kd2qCopbCwVZ4gPuEDoyoe5GwV
TlRR2aPcINRH/ehtZMUN77r8Szl0YasXgskYQu42XRNSwcYE2J/Vf+B8SmaBVCsF
4t1aDcsGWZY3efzRSv4pdimo83qz96p8R468u5ngKyiPuo8QU5Y=
=tCJn
-----END PGP SIGNATURE-----

--udmjswxldcpwpkxo--


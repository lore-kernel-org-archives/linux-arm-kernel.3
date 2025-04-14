Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82E9C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 06:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bV+9Q8YkIlG7twmYcn7d/G5ce4v53eG6zFWycuhqVrs=; b=O5SEbLLHw3rxq00AbCkAHoOj4J
	aJIdvBTKlab3uogfpGICBKEjOMyoEO8lVfi8e5z+kBACP9aSme13VL/cSqML32PX/l2onXHlr3abs
	fOwZXzMLLoU9Y+Jr/lhNb6StsOPazGyPi5IeFfzd7/PxQfTs//H1EGzcSm/LtFQGQZbBscILzUVtU
	6bQHMZaKmsluWLhGgIX4AswNcGTMm2lQ7GdzyYZtX0BihmDWwypfL1JXI7xV5u1bsUvSp34ZB04mO
	X8O4/gpjLK4eatvZN5j76BWgPNUEwYDqmw40DXoyQORAEL/d8lNVMKrhLd1vgc1AgLatRUQQ2tGZP
	sdSc0VHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Dmx-00000000rnd-0tQD;
	Mon, 14 Apr 2025 06:59:27 +0000
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Ddy-00000000qk4-35Yy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 06:50:12 +0000
Date: Mon, 14 Apr 2025 12:20:02 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744613408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bV+9Q8YkIlG7twmYcn7d/G5ce4v53eG6zFWycuhqVrs=;
	b=Hs90We8aRLict0baKvkhSRRp1/cGjYc9CvEirjeMvg41VRzkOt2j8aNUX7SVNla60+rToL
	JUbxUHbR15EJu1nc1qrJijPyXKdy34ht7L4U/aFpjKVDyV1bkRkEdJ0k9uZ3m6Uf6af5d3
	kNIiGLjcretrOI8sl+KbK8pt4P0Nqhw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jai Luthra <jai.luthra@linux.dev>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, vaishnav.a@ti.com, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, u-kumar1@ti.com, stable@vger.kernel.org
Subject: Re: [PATCH v2 7/7] arm64: dts: ti: k3-am62x: Rename I2C switch to
 I2C mux in OV5640 overlay
Message-ID: <bc5ocuam2ghevg6ory35leuebfka7amllfqr5xggiori7qt2xh@mevrrqj74lmd>
X-PGP-Key: http://jailuthra.in/files/public-key.asc
References: <20250409134128.2098195-1-y-abhilashchandra@ti.com>
 <20250409134128.2098195-8-y-abhilashchandra@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dg2ofw3wo72v6frl"
Content-Disposition: inline
In-Reply-To: <20250409134128.2098195-8-y-abhilashchandra@ti.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_235010_917645_848C76C9 
X-CRM114-Status: GOOD (  15.64  )
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


--dg2ofw3wo72v6frl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 7/7] arm64: dts: ti: k3-am62x: Rename I2C switch to
 I2C mux in OV5640 overlay
MIME-Version: 1.0

On Wed, Apr 09, 2025 at 07:11:28PM +0530, Yemike Abhilash Chandra wrote:
> The OV5640 device tree overlay incorrectly defined an I2C switch instead
> of an I2C mux. According to the DT bindings, the correct terminology and
> node definition should use "i2c-mux" instead of "i2c-switch". Hence,
> update the same to avoid dtbs_check warnings.
>=20
> Fixes: 635ed9715194 ("arm64: dts: ti: k3-am62x: Add overlays for OV5640")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>

Reviewed-by: Jai Luthra <jai.luthra@linux.dev>

> ---
>  arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-ov5640.dtso      | 2 +-
>  arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-ov5640.dtso b/arch/a=
rm64/boot/dts/ti/k3-am62x-sk-csi2-ov5640.dtso
> index ccc7f5e43184..7fc7c95f5cd5 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-ov5640.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-ov5640.dtso
> @@ -22,7 +22,7 @@ &main_i2c2 {
>  	#size-cells =3D <0>;
>  	status =3D "okay";
> =20
> -	i2c-switch@71 {
> +	i2c-mux@71 {
>  		compatible =3D "nxp,pca9543";
>  		#address-cells =3D <1>;
>  		#size-cells =3D <0>;
> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso b/a=
rch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso
> index 4eaf9d757dd0..b6bfdfbbdd98 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-tevi-ov5640.dtso
> @@ -22,7 +22,7 @@ &main_i2c2 {
>  	#size-cells =3D <0>;
>  	status =3D "okay";
> =20
> -	i2c-switch@71 {
> +	i2c-mux@71 {
>  		compatible =3D "nxp,pca9543";
>  		#address-cells =3D <1>;
>  		#size-cells =3D <0>;
> --=20
> 2.34.1
>=20

--dg2ofw3wo72v6frl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmf8sBoACgkQQ96R+SSa
cUUy0BAA0gb0YY99MVaqw2qUY9WJWfMvUk7dMWK89JmtKgTTWnm/y2O0me2oWrnv
o3j3FrXIZip5yr8iyzcscWpsFpCR/XiyyprLC0vIajZqs5Wf2HsthGfWZkNRCGX9
rCrttkk5lj4KX/mNHiUdkTbUTtxzogU/QMHu+wQ8OwX0BtiCw4zzkuhhl2wXqlW/
eh7UFQ1ntmdx91GHqa6kHXulxt76PHB8/PHgSLzqlGHX8TCdpBwYCUCKyeK8ckT1
/+jnmnTa9HIRUxsbU50R119Rvj5HZ5X2ZAzY/qw8Q+fHozAAHk3iC6sAj/o53rwu
9dkMkqUBOZnuSFCRaDhhmgQpV5OLl03Tc6TpMUJJCkJ10TJ5DcIrANitCM7s4z1/
Eo5o2+SMMza9pFo94f7uJzn5JTUkhaZYu7cc5I++L5HFQzI1v68ieBdV4dfL/QdB
W9niWHSpLZD6EGDfki/mGdvM4OqKgVAzszW/n4gH3ljMx39Yuc9uXP5wqnbQT87w
sIqDTJpRuG3UYpXaJk40/fQ0/d6gYCkibCRIYY7Z9H4eu91ei8syeazveEr/dQ/w
iIThXVfBUaK5Zs9oH4ETcq3z0XLsQ3XAjqLYHv4p18kGdnmq856vFPplFoUy4m9a
trre856gV5bh32+mxX5M3DYALa2JA1wbs0rulf6Y2pgMLjq9MzM=
=HJ8g
-----END PGP SIGNATURE-----

--dg2ofw3wo72v6frl--


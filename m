Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6948BC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 06:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJTVD7jo/Otn6b9WVWQ6HDZFYqH5A0K7Bz7wq0uQ/wE=; b=tXZvNYVlGDqJM+k8jDDl7qUuRr
	/KXxZen9IjUcovJ+8czNqWkMWDIuYMkCFXNukLq54duuC8IT77/GmKzKyKfr+Id1KN3WjWGI77Tw1
	mz05R0FUtF6nAFoBQ3anPXiN2tdLH0Axfvd6Wi60w4ivvqQb8SVCvJPEHOcYr/jdTDhFG6QfMZ4kh
	4M0j4X9UUpQGuB0ByZlbA2RJRAXgs5zZOtdyBalp0b9hFBX/5XRmWR6TORZRIMDi/LtnGcSw37CZw
	n5mmJ9r51thLES6w5Kn6DZaVjEW7y29HaSUsCu+W/QMricTYEgqQuRPvs5PEiqqHPXSr6VbOoq5PW
	BkzSImRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Dds-00000000qhx-2XgK;
	Mon, 14 Apr 2025 06:50:04 +0000
Received: from out-180.mta1.migadu.com ([2001:41d0:203:375::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Dc0-00000000qLK-1KkR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 06:48:10 +0000
Date: Mon, 14 Apr 2025 12:17:42 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744613271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sJTVD7jo/Otn6b9WVWQ6HDZFYqH5A0K7Bz7wq0uQ/wE=;
	b=Dt+/FOWRaugCrElq6wtIZic2VZ5ebwpR6k7EbcBcjuFWW3qFwfhqFHBd0xyEgkK2/LWfUJ
	cOHS5C/Bw6O9yiqqA7BJys06RcE5Vb+AFsMMU8feT8cVN31IjuFrCpXBuUxuWk/3Oa1VLp
	kCa923oDQJtyG2juPvprTiBcRJypTZ4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jai Luthra <jai.luthra@linux.dev>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, vaishnav.a@ti.com, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, u-kumar1@ti.com, stable@vger.kernel.org
Subject: Re: [PATCH v2 3/7] arm64: dts: ti: k3-j721e-sk: Remove clock-names
 property from IMX219 overlay
Message-ID: <gegzfauj2ow4ibilu7bsfr2bj4p4s7mea75vj5gxiifqj5dafc@qmaan4suzxql>
X-PGP-Key: http://jailuthra.in/files/public-key.asc
References: <20250409134128.2098195-1-y-abhilashchandra@ti.com>
 <20250409134128.2098195-4-y-abhilashchandra@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eqifq5opzzp3xw6i"
Content-Disposition: inline
In-Reply-To: <20250409134128.2098195-4-y-abhilashchandra@ti.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_234808_637315_4FD589AB 
X-CRM114-Status: GOOD (  14.74  )
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


--eqifq5opzzp3xw6i
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 3/7] arm64: dts: ti: k3-j721e-sk: Remove clock-names
 property from IMX219 overlay
MIME-Version: 1.0

Hi Abhilash,

Thanks for the fix.

On Wed, Apr 09, 2025 at 07:11:24PM +0530, Yemike Abhilash Chandra wrote:
> The IMX219 sensor device tree bindings do not include a clock-names
> property. Remove the incorrectly added clock-names entry to avoid
> dtbs_check warnings.
>=20
> Fixes: f767eb918096 ("arm64: dts: ti: k3-j721e-sk: Add overlay for IMX219=
")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>

Reviewed-by: Jai Luthra <jai.luthra@linux.dev>

> ---
>  arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso b/a=
rch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso
> index 47bb5480b5b0..4a395d1209c8 100644
> --- a/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-sk-csi2-dual-imx219.dtso
> @@ -34,7 +34,6 @@ imx219_0: imx219-0@10 {
>  		reg =3D <0x10>;
> =20
>  		clocks =3D <&clk_imx219_fixed>;
> -		clock-names =3D "xclk";
> =20
>  		port {
>  			csi2_cam0: endpoint {
> @@ -56,7 +55,6 @@ imx219_1: imx219-1@10 {
>  		reg =3D <0x10>;
> =20
>  		clocks =3D <&clk_imx219_fixed>;
> -		clock-names =3D "xclk";
> =20
>  		port {
>  			csi2_cam1: endpoint {
> --=20
> 2.34.1
>=20

--eqifq5opzzp3xw6i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmf8r44ACgkQQ96R+SSa
cUXg+Q//czeJY8KpGxGTyeaS0FCuPmwFgcYuyIq4tAzbvSMCzjsNqfy4b99yP7GK
YehndSrRB+e6HRoxZtrmM9Z73h1nriCF0ZkrrNFasWYwzKlnjLVnzv4E2oWI02P8
FXHG4w6nwYZYPpVasTn+uwzCuDUDFrRTC/z4apYXdIItZJj/vujjBOsdTw5rLXmk
WuB+rdq8C8tXbASekBF42FqR521Ua4t8mE5f+ItiBVcMw5mlnyzaMWh8jMzBloWV
RYFNU4Qu9z32+VpNkyPJp0pHe5/yLUaL3Ku2wRHyBDMVbRWFAF0+vLcTqwfJwaO8
CvSfmRN1uUj7Kg2znLNj8op/Jg/3ewSNmxkIL2+DxvMaFwpIvUR1Fz1uU80R7M9Y
0oW6CTM4oDQMc6AYp+WQRUKnSCAv410gjG3mtlaQUdt1FamPJ/OVJacNpQP0haKx
MUcZwvNbO8wiKREMLsPxF4Uf+rNNAtvGvvfs31oYbcUujMq4XkbE8hMnGzWQGTxF
T27K2Pa3SGjiRSNYhXG6zdBzN5Ilkiu5Vz3Uy45kgcjVaep/dEilo2kJnhCpmgPo
wDYwd3J7So9stf2IwPntbMshvJmvEl8e3D6y0koIz1W+KKaaWVJsY0/tBcJK781C
z3g4UlSxK9UkxmrAtNyR9/1bT4qD8y1Xo2Fp13GdJdgJZs1wJBQ=
=NQGY
-----END PGP SIGNATURE-----

--eqifq5opzzp3xw6i--


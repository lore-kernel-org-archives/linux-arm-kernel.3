Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F8DC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 06:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lGBFw2hdWC8TDA5yog697eJPHJRXG9owfWJfJ5MWngc=; b=037RjZuT/KSALae7La7sb8aJ1P
	0ov4gzs0uleoZfy7A6FPbtIowMLB66sOOoltWLDbdjufPhEeuaU0bFoi6Dpi894jfNtSBgfA591qD
	BAsBHAB91OxMIOnCCDNZe0e8gWT7DdHN0R+IuieaMAP+xnCzaQDUU7zNdNhg6Tnt9mJkYJfiH3yHO
	kfzkHcc4d6wi4Mb2D3D/uYyxbc2qXXR50nxKKfj9CsulLiqN/NDhi93Tp+ApLwizwZY8CirzU049T
	DswerQrQ1b1Muz15OP54WufJ9qoHNvPUE4r0sRWv3M32OEjQ+klI7Cs1altkbJDl1hhKDHlLKSa3V
	f/3GT6LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4DjK-00000000rRS-3Umz;
	Mon, 14 Apr 2025 06:55:42 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Ddh-00000000qfy-0h99
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 06:49:54 +0000
Date: Mon, 14 Apr 2025 12:19:43 +0530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744613391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lGBFw2hdWC8TDA5yog697eJPHJRXG9owfWJfJ5MWngc=;
	b=qqOExq9wrfuj2E7BAHVXk5iB1JcUfjJ6LveWgHk4tJ9mqBs+mP8E7eXdez99vVL82IqFUe
	tIRCC7FlgxpUTcAp72JqqEGU3fq1cETeJKWzPvC8ywCc0y7lhw1HfJLCYFVuzIzf+E04FN
	iusWrAW+m3Xqfh/zU89hG1v9q2n+s+8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jai Luthra <jai.luthra@linux.dev>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, vaishnav.a@ti.com, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, u-kumar1@ti.com, stable@vger.kernel.org
Subject: Re: [PATCH v2 6/7] arm64: dts: ti: k3-am62x: Rename I2C switch to
 I2C mux in IMX219 overlay
Message-ID: <rlak6samxx5p3rlvlhpibh3ibqf4hlyp457zcl2l2babel5njv@2aqkkauioeoc>
X-PGP-Key: http://jailuthra.in/files/public-key.asc
References: <20250409134128.2098195-1-y-abhilashchandra@ti.com>
 <20250409134128.2098195-7-y-abhilashchandra@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m2vb5doimzrhycjq"
Content-Disposition: inline
In-Reply-To: <20250409134128.2098195-7-y-abhilashchandra@ti.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_234953_345715_2368B93E 
X-CRM114-Status: GOOD (  15.90  )
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


--m2vb5doimzrhycjq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 6/7] arm64: dts: ti: k3-am62x: Rename I2C switch to
 I2C mux in IMX219 overlay
MIME-Version: 1.0

On Wed, Apr 09, 2025 at 07:11:27PM +0530, Yemike Abhilash Chandra wrote:
> The IMX219 device tree overlay incorrectly defined an I2C switch instead
> of an I2C mux. According to the DT bindings, the correct terminology and
> node definition should use "i2c-mux" instead of "i2c-switch". Hence,
> update the same to avoid dtbs_check warnings.
>=20
> Fixes: 4111db03dc05 ("arm64: dts: ti: k3-am62x: Add overlay for IMX219")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>

Reviewed-by: Jai Luthra <jai.luthra@linux.dev>

> ---
>  arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso b/arch/a=
rm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
> index 7a0d35eb04d3..dd090813a32d 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
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

--m2vb5doimzrhycjq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmf8sAcACgkQQ96R+SSa
cUVbgQ/+OCj8AncO8Yr6uC9bhzntgfdfFAJNn8WfHb55QBDB7efxUZFWX/J7CNka
MtSLG6s/N3YOOQEbmDriV8cA0XLpwsVN6L7Xjf8md9TZ93oWWKxc9oNLuw/gFKnN
CQ/Jc7ayOBg51IR3ndU8xO/BgrhnYjJsRtthrVzdJDI73DL+AN/Yn03xw+0jRrhb
sBAWt9VDnKYg45P86EtAHiYWAOH40JZ+sSq0b34mrrv0W65uiT0BdB5YO6L9Uu2h
aHouxsp42H0MUVLFa6hPsbGqyfugvpSVQMKiYM0RB+irO2VgRvtRTiEpyPYMSv4l
JfmuZ6yn8e2Sx2hi4RMgrChYeDfIff6H94/mDXpCVc1omvPTFPt7GKGw7+ty6v83
ePBqOVw4xTzITmN7fSr5hk42FCN9UoNIey34OcUJkSOkdwty4M4mpYyLZVviKiiV
TfuA4tgvEkzxcvpdtHSNq2DngqIshtV/JC0kyXhHX3ezSWum9NsudZXgUNWOf17p
VKtnCbWyh9KQOyjkAhVuYRQrnBvL7x6Fp+ZC1RSpRQU4ZcZGUWx8ujuFIaMbti12
+fnsjG0hMkiloK7Qlp1UAiPfwLWZAXSVr5vwuyyvM515uiiIe5ormuLQOTLF7XmZ
teXAPh5qJRMJLp6P2plk2LouA1WjL0CIeS3Hx1rKqnWPQIfSVEo=
=AcOW
-----END PGP SIGNATURE-----

--m2vb5doimzrhycjq--


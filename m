Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD17CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 12:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UHNPF/1Qwplu6Nd1JZHbugRfr3BJ3omzZ7zRPHLtfLY=; b=nwIu1BXnnlozND+f+zUL9UkiuC
	oLxRyz3pIm0U9TpjavTMw8rWZlDxQmv15PkpXnzPPQ4UtGBsA4X/dxcDomNWB2CFdgZqQwCdKkxO3
	qiePlxBWyA41M3ZkQGx/t/85wamU2OaHeIduFHe5/NkXdsVRXA2VLYh/oSmJcvmzi6ALjvaHZLV5o
	aCH5p0ZDDYRayjiflC3C5scYK5gY6plxYAFTK2A3fewB+pba0Tu5U78ucf1IUbx0LEvvdoS+vWrso
	RF1szuYR2eEld6Z1g+8alJCXjF6iHH2zwn+cA2+t7xD4F9K9Fon+NLK+2bL5LKZUfmvxOXAdnY7C2
	yRTHBbTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2BF-0000000BAxr-2Cwn;
	Mon, 01 Jun 2026 12:55:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2BE-0000000BAxW-1KjA;
	Mon, 01 Jun 2026 12:55:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UHNPF/1Qwplu6Nd1JZHbugRfr3BJ3omzZ7zRPHLtfLY=; b=CGZA/vn+KpcmI5g3kAE0u3xSUX
	BOGfA4DQ0gG/qxCSwMa/3y+y1yRDOVCv+nYg+wkh/TrX1B3ZkRKnf3kmIPwvZZcPZIfp85F9mJOt8
	ojHvYSkTsj661FzkcvbtuWLGXRZNNZtIIFgGpl7TnxZ3PTiLPQa2DiaPFy3Ei+VWDDczfVrGKVOct
	llfTaOzUgPETxc0w/W2Cu7XbbSVEZd8FxLjBx3bkcAEHzvOUr224k4padpstAsO7BiTlpfMlvfUT4
	pLZQnBUKlUkVg/liCcGqvNLqv4S1S8FHORx52Oi9y5hCOUuwlJ5Cexa4ngY+yCcZ82ePr2qbUcXdZ
	DESb8+5w==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2BA-00000006kEQ-2Hbb;
	Mon, 01 Jun 2026 12:55:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1780318531; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GcTDPbHSICavOEZLVA5lq9UVLrzp7S7FKh/dQEzhGHnL9u9HsPv70mv0QDPE/hDIeMVbO4oAMCws/QUvJW79cSJg5wep7Co4KWe8SnajOxA8Z4beG4nKgGKSllnIP+FR74lpQ5Bz2NCyinBNtdIMa807LmI/fSUS3hoSUnctTmo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780318531; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UHNPF/1Qwplu6Nd1JZHbugRfr3BJ3omzZ7zRPHLtfLY=; 
	b=nrsnvnJlObEBo5yWGB266Aoqpa5ZfTHTHUTgYjJkDomUe+ps7m89Eoxl1OkCmtSrzI/Bvb2aX9zJhwzinHjnj6L4DzqAW2vBCq2BN9lMPBTZNJDl2kudQ7zAF9dfza8EslFEQkzsOUSr+P8pp6FmMQ62d6zc/JqEvz5f1l7mD78=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780318531;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=UHNPF/1Qwplu6Nd1JZHbugRfr3BJ3omzZ7zRPHLtfLY=;
	b=U/RXgUNi+6FLEiu+feEZAkUkoUPwl03tCCZol/nq5GXLJAKLkC68fXdtB4IxgCRH
	7mgv514wfUJYXUy6oyw/5P2M2NKvsI9W8ewQrTnJoIXS5S3zX5+2x/FVcub8d+ziN25
	g0zvCouPSJZ9L9ymvHTYEUlgNFKbGnY+Ki8yNofM=
Received: by mx.zohomail.com with SMTPS id 1780318528697566.8024877077298;
	Mon, 1 Jun 2026 05:55:28 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 667F2181D80; Mon, 01 Jun 2026 14:55:25 +0200 (CEST)
Date: Mon, 1 Jun 2026 14:55:25 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: ricardo@pardini.net
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: fix PCIe regulator name on
 NanoPC-T6
Message-ID: <ah2AYT4XmYR03I7z@venus>
References: <20260529-rk3588-dts-rtl-eth-describe-dt-alias-v2-0-49700248143f@pardini.net>
 <20260529-rk3588-dts-rtl-eth-describe-dt-alias-v2-2-49700248143f@pardini.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zvgvt4wic33r6t4d"
Content-Disposition: inline
In-Reply-To: <20260529-rk3588-dts-rtl-eth-describe-dt-alias-v2-2-49700248143f@pardini.net>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.2.1.5.2/280.300.36
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_135541_207325_F859FA53 
X-CRM114-Status: GOOD (  21.63  )
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


--zvgvt4wic33r6t4d
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: fix PCIe regulator name on
 NanoPC-T6
MIME-Version: 1.0

Hi,

On Fri, May 29, 2026 at 05:31:25PM +0200, Ricardo Pardini via B4 Relay wrot=
e:
> From: Ricardo Pardini <ricardo@pardini.net>
>=20
> The GPIO-switched 3v3 regulator on the NanoPC-T6 is labeled
> vcc3v3_pcie2x1l0, but it is wired to and consumed by &pcie2x1l1, and
> its enable is the pcie_m2_1_pwren pin - i.e. it powers the M.2 slot on
> pcie2x1l1, not pcie2x1l0. The two soldered RTL8125 NICs on pcie2x1l0
> and pcie2x1l2 instead share the always-on vcc_3v3_pcie20 rail, so
> nothing actually uses an "l0" switched supply.
>=20
> Rename the label, node name and regulator-name to vcc3v3_pcie2x1l1 so
> they match the controller the rail actually supplies.
>=20
> Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
> ---

You should use the regulator name from the schematics. I had a quick
look and https://wiki.friendlyelec.com/wiki/images/9/97/NanoPC-T6_2301_SCH.=
PDF
describes the GPIO as PCIE_M2_1_PWREN as you mention in your commit
message. That GPIO controls a regulator for the power net "VDD_MPCIE_3.3V".
So that's the expected name :)

Greetings,

-- Sebastian

>  arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/ar=
m64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> index 04c4479f08170..7d314df3f947b 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
> @@ -203,13 +203,13 @@ vbus5v0_usb: regulator-vbus5v0-usb {
>  		vin-supply =3D <&vcc5v0_sys>;
>  	};
> =20
> -	vcc3v3_pcie2x1l0: regulator-vcc3v3-pcie2x1l0 {
> +	vcc3v3_pcie2x1l1: regulator-vcc3v3-pcie2x1l1 {
>  		compatible =3D "regulator-fixed";
>  		enable-active-high;
>  		gpio =3D <&gpio4 RK_PC2 GPIO_ACTIVE_HIGH>;
>  		pinctrl-names =3D "default";
>  		pinctrl-0 =3D <&pcie_m2_1_pwren>;
> -		regulator-name =3D "vcc3v3_pcie2x1l0";
> +		regulator-name =3D "vcc3v3_pcie2x1l1";
>  		regulator-min-microvolt =3D <3300000>;
>  		regulator-max-microvolt =3D <3300000>;
>  		vin-supply =3D <&vcc5v0_sys>;
> @@ -655,7 +655,7 @@ rtl_eth0: ethernet@0,0 {
> =20
>  &pcie2x1l1 {
>  	reset-gpios =3D <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
> -	vpcie3v3-supply =3D <&vcc3v3_pcie2x1l0>;
> +	vpcie3v3-supply =3D <&vcc3v3_pcie2x1l1>;
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pcie2_1_rst>;
>  	status =3D "okay";
>=20
> --=20
> 2.54.0
>=20
>=20

--zvgvt4wic33r6t4d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmodgTkACgkQ2O7X88g7
+pq3Gg/+M/zLNTAVZl9fG/flrN7PT03vm7m7gBgTQoRz6Nmzw/dM3TqM31RCl5A7
qI5qdPdfDy2h9i6QesKvy5ZvH+Ek0bAIGNXQHygFEUZGla9VbrYdT3d6VoSmG6vT
Ia9zT7tqYtQr17ydH3m7T/APsdHbWqoyYEFfA7q4xp8RabY67uxcTgYCdem0LZDQ
EsNjRIrlkSycLh+/gCUCCY9wY694hN+9689Mn1x6V/qKQdXkg1X1cafwXoIuEHuT
E7q1EiMtCEABIPKtSI5cbW43z6w0VrHNzu22wnT//CQfl17l06yQBmBGdICaBfZN
FUEmUPOGPexk8gIHXbZxM+7w14agZHO4JIhf8etZFelrQk/lcXct4REOy7QaIgMD
lyN0QqxKHGvmfEDcuwA1g1wnz9iTKa0Hxrea5b6+Pg+Yjg/Ak7Rzjp+D9csu1kar
JOsAsjqnYbfugNIaNX9/tktc6/mpXTfC1QZo0rtPNrN9iCY87VY90mTcjVDhczXO
j2+4VuD5HuF0fMPtQFu1bjEn21rdmnmGOfUSCYhCAWnyt2sBm/ronhzKFTIV6A7P
WeICTkitYonY5kpUfgFQ7Q/EjaPFW4wWn/hVA9fM14VlkcPj9qYwSIysT4V8r/Gx
IQdjZFmVieT3WoTLPjik1IYWxSc9gjGK6mbVrvuHj5g2tPt6Th0=
=Kd1g
-----END PGP SIGNATURE-----

--zvgvt4wic33r6t4d--


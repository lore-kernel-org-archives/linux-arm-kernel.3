Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACE4EA4FC7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 14:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWdzbk2dmHzXquuk0aSPJmnEiK9NBTpOiSnPjYmtFLk=; b=EwUPgl0l0vpz7Aw6YFwY3wvK7H
	pu+gD9LWBX0V14BtONTvWYHXn1nfsV9aasEkLn6mhXQ+00qHnGkZ9RlKszI7VW749LF3Y1cSXxGHd
	5JwGRNSK77O1QcCKPjVh7Sili4zNdTVvRu1zJkAUvjQ6trgROiHz5gStff0YEYvcMD7GvYL7TKtYs
	yKpcTEIAQ6YICmcNWsiSAkhRHoufFhQpE7w7WCOxZYz3Q13OuffaIxGsfsvg5M6zfCKFDAVqJ9XtP
	L0c4c3gp7xjOhp9hg9pEff4f1wndY/pb11R5ifpU3xaVwxxosqJWqxOeRi9N3YUWC6kMGU3PDadpH
	HTlEGbew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXI7-00000000V5n-2UTL;
	Mon, 23 Feb 2026 14:52:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXI5-00000000V5J-1dCr;
	Mon, 23 Feb 2026 14:52:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771858319;
	bh=gClOm7NqJCClk7cIbay3EtBTBbjsRKHQNftOviWUJUM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=cl3hVtqawzHAY6UykTclc0q0W1+8W5Kx8ePoA1YPF+OLziu1bih33q2Ec6Mul18IE
	 Z+q2pZEWnS391sPmLKQ+1/AQflvTWuNux5/IBxIQIRyRyhFej2/ixsEPIkCrevnpCk
	 bi8f4/f0kMKvsy5KHTEMczChJa75eUwVQ5bA+RlLS7fgMusEFtHNddrtiSf5MNJR1P
	 07ClyROi0HYb8pIbtTKPXpelIS3W9MMPOGM3dToKiadgc3HdxAqRqCWXcWxo5UPanb
	 1rGdJCGllUeNorva9XmKTpjsNKKaQju98mENTcpfo4SxqQ7KHAqP+k4dun4TgMv4Df
	 9aQARpuF6d1SA==
Received: from [IPv6:2606:6d00:15:210e::5ac] (unknown [IPv6:2606:6d00:15:210e::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 13DBD17E043F;
	Mon, 23 Feb 2026 15:51:57 +0100 (CET)
Message-ID: <edbf38b34e98ee039f45faab5aa5b00a585799ce.camel@collabora.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Fix vdec register blocks order on
 RK3576
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Detlev Casanova
	 <detlev.casanova@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 23 Feb 2026 09:51:55 -0500
In-Reply-To: <20260223-vdec-reg-order-rk3576-v1-1-560976566bd3@collabora.com>
References: <20260223-vdec-reg-order-rk3576-v1-1-560976566bd3@collabora.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-RHGQesk7FfUtbqUrU2bL"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_065205_581936_52A9D8D9 
X-CRM114-Status: GOOD (  16.43  )
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


--=-RHGQesk7FfUtbqUrU2bL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cristian,

Le lundi 23 f=C3=A9vrier 2026 =C3=A0 14:25 +0200, Cristian Ciocaltea a =C3=
=A9crit=C2=A0:
> When building device trees for the RK3576 based boards, DTC shows the
> following complaint:
>=20
> =C2=A0 rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg):
> /soc/video-codec@27b00000: simple-bus unit address format error, expected
> "27b00100"
>=20
> Provide the register blocks in the expected address-based order.
>=20
> Fixes: da0de806d8b4 ("arm64: dts: rockchip: Add the vdpu383 Video Decoder=
 on
> rk3576")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> =C2=A0arch/arm64/boot/dts/rockchip/rk3576.dtsi | 6 +++---
> =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> index 49ccdf12ef7e..45eb0d053a6f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> @@ -1281,10 +1281,10 @@ gpu: gpu@27800000 {
> =C2=A0
> =C2=A0		vdec: video-codec@27b00000 {
> =C2=A0			compatible =3D "rockchip,rk3576-vdec";
> -			reg =3D <0x0 0x27b00100 0x0 0x500>,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x0 0x27b00000 0x0 0x100>,
> +			reg =3D <0x0 0x27b00000 0x0 0x100>,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x0 0x27b00100 0x0 0x500>,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x0 0x27b00600 0x0 0x100>;
> -			reg-names =3D "function", "link", "cache";
> +			reg-names =3D "link", "function", "cache";

I have a vague memory it was done on purpose, due to the "items" in the bin=
dings
requiring to follow the same order. I was not enable to run the DT checks t=
oday
(some pythonic version miss-match issue), but wanted to raise the flag.

Nicolas

> =C2=A0			interrupts =3D <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>;
> =C2=A0			clocks =3D <&cru ACLK_RKVDEC_ROOT>, <&cru HCLK_RKVDEC>,
> =C2=A0				 <&cru ACLK_RKVDEC_ROOT_BAK>, <&cru
> CLK_RKVDEC_CORE>,
>=20
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260223-vdec-reg-order-rk3576-cc2ec6e05e98

--=-RHGQesk7FfUtbqUrU2bL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaZxpiwAKCRDZQZRRKWBy
9F6GAP9sK3LNgp3i/RTPemPHdl3OCWbtObnfVIAxjEF8QC7QOwD+MUegoEjbLFvL
vLDQK4lHUUSmK7/+64xIuuaw9QZJrQo=
=WXgQ
-----END PGP SIGNATURE-----

--=-RHGQesk7FfUtbqUrU2bL--


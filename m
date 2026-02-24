Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FF9E9B263
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 13:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ltlGUt+3T2rmOmta72pu4GzuLqz+MYwJ3XBbEIEPsTw=; b=LBuhSryFY/JOnSuzcuNJqVdmjT
	oYbPRy89hbbFCsHXxR3u85F3fLtpFstwZMair8R03Z3qOJp5qFbWO7Y+hlRL1uhLhgMs8P7uJVVpP
	21eTykctv2hLveUE0mnqdN/hQkqNjFBFbWh7RhENXerls6QyKjOW7szhU+UmbR9tcgtqlANwEBhZj
	FemBGsrplZ2DUCPcFUxg9VCrAyHPIgasYv8BI0uK/ZCGXPWPUn0gJMuZoQpgmTeaVQdq0nbz3nITG
	15VrYfK4ML1lMB3wZxzEfCRhJHBe2AOW6GwT9lGhK1fzAyrcqBKcDpSMAFfbTA3MXsXre8AUxvXyr
	IrJpKQ2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vusIU-000000027UJ-0QGX;
	Tue, 24 Feb 2026 13:17:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vusIQ-000000027Tp-3u6s;
	Tue, 24 Feb 2026 13:17:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771939067;
	bh=2VI6nOomYDX8EwYV4/q49oHhrG90jmgi4U/LV+aBRts=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Hg0MsWYRo/nnvj4o5r/xu7+v8czkfssXjeEjlmBwtEvjGLSCITtFB7giuIOjn9eWs
	 1WKxIduihoa/Nr7zJHkcEWGIxCPOngp3qlkCOO4lp2yjdAmD5E5DElXdkY+plHdVVQ
	 vEFaYBO6mhoRqEaDQ67LYNSZcy9ypHUKn3WVEmePzShqasb61nrfSBczdTHue/Ie7S
	 WdYZ6DzZMmjc0WR9jNT8wCgvNf7as9K0Z/KNC93vMymfmbTs5KDYOYkXuvwN4bzBkY
	 fQWjGvAbYHFnduLhlBf2+EQFCKPfJLEiONB0zF+Ltpma4vsX8IZ8xexAlSFaLlbnzh
	 d9q4/vrK5Rqew==
Received: from [IPv6:2606:6d00:15:210e::5ac] (unknown [IPv6:2606:6d00:15:210e::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C976517E01E7;
	Tue, 24 Feb 2026 14:17:45 +0100 (CET)
Message-ID: <366daf706b5dc3942e3340f29151ece1f49460e0.camel@collabora.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: rockchip: Fix vdec register blocks
 order on RK3576
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Cristian Ciocaltea
	 <cristian.ciocaltea@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Detlev Casanova	 <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 kernel@collabora.com, 	devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley	 <conor.dooley@microchip.com>,
 linux-media@vger.kernel.org
Date: Tue, 24 Feb 2026 08:17:44 -0500
In-Reply-To: <20260224-glaring-poetic-goshawk-b44d7b@quoll>
References: <20260223-vdec-reg-order-rk3576-v2-0-daf4942dfc02@collabora.com>
	 <20260223-vdec-reg-order-rk3576-v2-2-daf4942dfc02@collabora.com>
	 <20260224-glaring-poetic-goshawk-b44d7b@quoll>
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
	protocol="application/pgp-signature"; boundary="=-cvvz0gfg/4oyTxCxnCsz"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_051751_141699_89DD3660 
X-CRM114-Status: GOOD (  24.03  )
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


--=-cvvz0gfg/4oyTxCxnCsz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 24 f=C3=A9vrier 2026 =C3=A0 08:22 +0100, Krzysztof Kozlowski a =C3=
=A9crit=C2=A0:
> On Mon, Feb 23, 2026 at 09:49:50PM +0200, Cristian Ciocaltea wrote:
> > When building device trees for the RK3576 based boards, DTC shows the
> > following complaint:
> >=20
> > =C2=A0 rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video=
-codec@27b00000: simple-bus unit address format error, expected "27b00100"
>=20
> So you need to fix the unit address. This is what the warning tells you.

The unit address is where the register range starts. Picking a random point
inside the range is just bad idea. For anyone that uses spec to develop the=
se
drivers and device tree, its just plain difficult and error prone.

>=20
> >=20
> > Provide the register blocks in the expected address-based order.
> >=20
> > Fixes: da0de806d8b4 ("arm64: dts: rockchip: Add the vdpu383 Video Decod=
er on rk3576")
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > ---
> > =C2=A0arch/arm64/boot/dts/rockchip/rk3576.dtsi | 6 +++---
> > =C2=A01 file changed, 3 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot=
/dts/rockchip/rk3576.dtsi
> > index 49ccdf12ef7e..45eb0d053a6f 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> > @@ -1281,10 +1281,10 @@ gpu: gpu@27800000 {
> > =C2=A0
> > =C2=A0		vdec: video-codec@27b00000 {
> > =C2=A0			compatible =3D "rockchip,rk3576-vdec";
> > -			reg =3D <0x0 0x27b00100 0x0 0x500>,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x0 0x27b00000 0x0 0x100>,
> > +			reg =3D <0x0 0x27b00000 0x0 0x100>,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x0 0x27b00100 0x0 0x500>,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x0 0x27b00600 0x0 0x100>;
>=20
> The main block, so probably the lowest address as in unit address,
> should be used, but this ship has sailed. You shipped this DTS, because
> the order of items is FIXED. Your binding change is clearly incorrect
> and ABI break without explanation and without reason, so you cannot use
> such as an argument here.

Its not released yet.


> You cannot change it without impact, so just fix the unit address.

I completely disagree with that.

Nicolas


--=-cvvz0gfg/4oyTxCxnCsz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaZ2k+AAKCRDZQZRRKWBy
9B7vAP47G+wCvT4HAirrFY7mJS0pSbKTNPlDGG+sbMVBZF5jogD/aFs4ud4Gi6SX
DRuI6CS3MlRp1ywT1oYN5ozDVKoBig4=
=UcYd
-----END PGP SIGNATURE-----

--=-cvvz0gfg/4oyTxCxnCsz--


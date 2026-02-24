Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664A4E9B260
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 13:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QDBlBOY6T+mWEXrv/m/BROi/PGkVajgTbGo7PUZjJMg=; b=lous6j7fC57ns0h9hD1OAGCoqq
	UyVx345ScBu4GAnf+l1Z2AYUrifwTU2g8RSXVGuAsZmqWEzerynj6bCQGC4neomnrRgp/js0LqbCi
	XC/hXYLQ4T49uoTHz+SAvJhG8N9YI6j/vvPSE3zYssGwW2QuC3snhHClFLfHsFqNA2M6/UIaV0ah2
	yByESBcXBOieXT+sICfX2Luvlur1hOfcNOhm9SlDeWjNqUC3H3qswXTaVQ61nJRZPtrSyJKo3DovX
	Lu8JZc5A11x3VXr2zdVjPayRgSsNRMIdQLDu828v/Y0tj43JJDN8v8wMhsTaAteioCvT33sAT/Nv6
	nWNR5nzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vusFT-000000026jh-15ZC;
	Tue, 24 Feb 2026 13:14:47 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vusFQ-000000026jG-2Tsb;
	Tue, 24 Feb 2026 13:14:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771938880;
	bh=QDBlBOY6T+mWEXrv/m/BROi/PGkVajgTbGo7PUZjJMg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=fnnGBmGLTE4IUyu2V2/CREu3eVMNtGRq2xiualZ+Noh87rNDNu780b8X71o4+5WlO
	 3aq3coOJY30fPW6222dYPTxbgAgwx3i+mur/r/bVV53BCOLTf97bYh2OvJNSq64zkb
	 s5PD1f4BGMwVQ6Dms1ufK+Bl/tsKlpwwX5dUU2kHmmpHJ/41JP7h2OiLeDdr8tERUt
	 hkXmQzilMM87TiRc2J1tytsMgGsE/6bQUgBgRF4/ad6Fpv1TwxPbhjDgYeqD2Ih4rT
	 T9zU4ywLdh/Po2ukB9jVWdgTmok9pBdCxwixg8ebEKrRjwXhyqdNPNqcX2SnXCSD7/
	 onO/oj0bRcuRg==
Received: from [IPv6:2606:6d00:15:210e::5ac] (unknown [IPv6:2606:6d00:15:210e::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B671617E03E5;
	Tue, 24 Feb 2026 14:14:37 +0100 (CET)
Message-ID: <244b22d3be77047163b4e47c4ed33b5b1befb4b4.camel@collabora.com>
Subject: Re: [PATCH v2 1/3] media: dt-bindings: rockchip,vdec: Correct
 reg-names order for RK35{76,88}
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
Date: Tue, 24 Feb 2026 08:14:35 -0500
In-Reply-To: <20260224-saffron-peccary-from-heaven-2d5e6e@quoll>
References: <20260223-vdec-reg-order-rk3576-v2-0-daf4942dfc02@collabora.com>
	 <20260223-vdec-reg-order-rk3576-v2-1-daf4942dfc02@collabora.com>
	 <20260224-saffron-peccary-from-heaven-2d5e6e@quoll>
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
	protocol="application/pgp-signature"; boundary="=-6vdVUmvCeNcE+MD7yuOO"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_051444_784141_D12205A7 
X-CRM114-Status: GOOD (  22.35  )
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


--=-6vdVUmvCeNcE+MD7yuOO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 24 f=C3=A9vrier 2026 =C3=A0 08:17 +0100, Krzysztof Kozlowski a =C3=
=A9crit=C2=A0:
> On Mon, Feb 23, 2026 at 09:49:49PM +0200, Cristian Ciocaltea wrote:
> > Update 'reg-names' property to allow providing the register blocks in
> > the expected address-based order for RK3576 & RK3588 video decoder and,
>=20
> What? The register blocks SHOULD NOT be provided in address-based order.
> There was never such coding style, never ever we gave such hint and if
> you found Qcom discussions you would see me and Rob objecting to it.

Would be nice to make a suggestion to how to fix this warning differently.

rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg): /soc/video-codec@27b0=
0000: simple-bus unit address format error, expected "27b00100"


>=20
> > consequently, fix some DTC warnings.
> >=20
> > Additionally, drop the 'reg' description items as the order is not fixe=
d
> > anymore, while the information they offer is not very relevant anyway.
> >=20
> > Fixes: c6ffb7e1fb90 ("media: dt-bindings: rockchip: Document RK3588 Vid=
eo Decoder bindings")
> > Fixes: a5c4a6526476 ("media: dt-bindings: rockchip: Add RK3576 Video De=
coder bindings")
>=20
> No, nothing to be fixed here. Describe the bug, because missing order
> to address-based is for sure not a bug.

The warning should be part of this this commit message, since the cover let=
ter
is not going into git.

>=20
> > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > ---
> > =C2=A0Documentation/devicetree/bindings/media/rockchip,vdec.yaml | 13 +=
+++++-------
> > =C2=A01 file changed, 6 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml=
 b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > index 809fda45b3bd..2d3164a2882b 100644
> > --- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> > @@ -28,16 +28,15 @@ properties:
> > =C2=A0
> > =C2=A0=C2=A0 reg:
> > =C2=A0=C2=A0=C2=A0=C2=A0 minItems: 1
> > -=C2=A0=C2=A0=C2=A0 items:
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: The function configurati=
on registers base
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: The link table configura=
tion registers base
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: The cache configuration =
registers base
> > +=C2=A0=C2=A0=C2=A0 maxItems: 3
> > =C2=A0
> > =C2=A0=C2=A0 reg-names:
> > -=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0 oneOf:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: function
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: link
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: cache
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: link
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: functi=
on
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: cache
>=20
> No, ABI break without point.

Its not released yet, otherwise both order would need to be allowed.

Nicolas

>=20
> > =C2=A0
> > =C2=A0=C2=A0 interrupts:
> > =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> >=20
> > --=20
> > 2.52.0
> >=20

--=-6vdVUmvCeNcE+MD7yuOO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaZ2kOwAKCRDZQZRRKWBy
9BqXAP0WLFO+Ad1TiY32B/5I/dn3cBQsJKE069cW8NysidEIsgEAh/wL1hMjh63+
oRsi0fbu/sIfKsL636Wv6YG3zrhkKQY=
=HW9Q
-----END PGP SIGNATURE-----

--=-6vdVUmvCeNcE+MD7yuOO--


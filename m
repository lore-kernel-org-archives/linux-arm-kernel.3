Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3629EEC111B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 18:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXUJNuq5MZV4lzOVyrHqHb/9m9zvmP1n50whNHu4wnI=; b=4Otu9eLdeKvy2MUSHnEgOV6yqH
	ek8P3v5/e6Dlj73qAWK0bTqjeDMZ35+ZbPBSWrWR50UbEevKg2OQ7IKVgOz1DB3v7Vys35e+7BJw/
	1MnpEIYqkZqDchq3wwvx/YTqooUWFmO5QUbVOj2UuQQV5APia8hZpw/0CD6Z1TRHGUB9WtIeGioId
	z76q0aayYqCkju5yJEPfNMLODLf0IqCc7rDsbsgDe+3CilWfX4I7maOW4uK6RoQ2rXEbXZkdGp5l4
	aEP3gzaEETz9rzTavssU+SyRRwHRbsbzVpVqUCTlE/VKc7VM1yAXHEzy1Fymf/8OWMgkYKMkJBTCR
	ZGWTUbDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuaM2-00000000qKa-2DVR;
	Mon, 23 Feb 2026 18:08:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuaLz-00000000qK1-48DW;
	Mon, 23 Feb 2026 18:08:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771870097;
	bh=mXUJNuq5MZV4lzOVyrHqHb/9m9zvmP1n50whNHu4wnI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=MMkbp3hXvXzB7Z/ppOc9jY0jBj8hR8eaJ38n/PoZp75pKKwU5YlGRsJo8t1a4WiFc
	 2n/QkSVw0YHlWowI/CmqLPINaxP/WdjApT7hj5WKMwq/B0HZNQGTRtPl2LA68wdhd0
	 LcnoqnnAyxKudkJkyganRCxGVfkaV86UNWVceP0txRKuFRwbYng9iZowRVj9IoKdtU
	 7sWaNxQLALIdjXonPPaGzeMtY6WtFaneFPi5hgXwgZ7zd3n+Y6DDBR1NNxhVvSKqTg
	 TSpAxKHIt4hJVWuj6WXbb85n8r1WQfWWKR+HyaMAlSsqXKqa66sMfqEd35KMkfRckV
	 XSoCW7ITN/91w==
Received: from [IPv6:2606:6d00:15:210e::5ac] (unknown [IPv6:2606:6d00:15:210e::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 71C3417E03E5;
	Mon, 23 Feb 2026 19:08:15 +0100 (CET)
Message-ID: <6e20d6cdaebdfe89b4066db9f1d6f1216403b091.camel@collabora.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Fix vdec register blocks order on
 RK3576
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Diederik de Haas	
 <diederik@cknow-tech.com>, Sebastian Reichel
 <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Detlev Casanova	 <detlev.casanova@collabora.com>, kernel@collabora.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 23 Feb 2026 13:08:12 -0500
In-Reply-To: <b4eb3031-69e8-4a73-b4f1-91dd4192bb21@collabora.com>
References: <20260223-vdec-reg-order-rk3576-v1-1-560976566bd3@collabora.com>
	 <aZxkDGzEQCCLKR-M@venus> <DGMF3IX3J3BP.1XT41P0G8P5OD@cknow-tech.com>
	 <b4eb3031-69e8-4a73-b4f1-91dd4192bb21@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-h8XPhJ/XXmCZWhSQFgHf"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_100820_192141_A560B4C0 
X-CRM114-Status: GOOD (  21.95  )
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


--=-h8XPhJ/XXmCZWhSQFgHf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le lundi 23 f=C3=A9vrier 2026 =C3=A0 19:07 +0200, Cristian Ciocaltea a =C3=
=A9crit=C2=A0:
> On 2/23/26 4:39 PM, Diederik de Haas wrote:
> > On Mon Feb 23, 2026 at 3:31 PM CET, Sebastian Reichel wrote:
> > > On Mon, Feb 23, 2026 at 02:25:05PM +0200, Cristian Ciocaltea wrote:
> > > > When building device trees for the RK3576 based boards, DTC shows t=
he
> > > > following complaint:
> > > >=20
> > > > =C2=A0 rk3576.dtsi:1282.30-1304.5: Warning (simple_bus_reg):
> > > > /soc/video-codec@27b00000: simple-bus unit address format error,
> > > > expected "27b00100"
> > > >=20
> > > > Provide the register blocks in the expected address-based order.
> > > >=20
> > > > Fixes: da0de806d8b4 ("arm64: dts: rockchip: Add the vdpu383 Video
> > > > Decoder on rk3576")
> > > > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com=
>
> > > > ---
> > >=20
> > > This fixes this warning, but instead creates a new one, because the
> > > reg-names order is fixed in the DT binding:
> > >=20
> > > =C2=A0=C2=A0 reg:
> > > =C2=A0=C2=A0=C2=A0=C2=A0 minItems: 1
> > > =C2=A0=C2=A0=C2=A0=C2=A0 items:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: The function conf=
iguration registers base
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: The link table co=
nfiguration registers base
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: The cache configu=
ration registers base
> > > =C2=A0=20
> > > =C2=A0=C2=A0 reg-names:
> > > =C2=A0=C2=A0=C2=A0=C2=A0 items:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: function
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: link
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: cache
>=20
> Oh, right, missed to check the binding.. :-(
>=20
> >=20
> > See also the prior discussion wrt this:
> > https://lore.kernel.org/linux-rockchip/edabca63-594e-44ae-8a3d-0f60987a=
8664@collabora.com/
>=20
> That's interesting, I'm also not able to trigger the warning on RK3588.
>=20
> Regardless, the binding can be easily adjusted with the patch below.=C2=
=A0 Hence
> I'm
> going to handle this in v2, unless there's a reason against moving furthe=
r.
>=20
> Thanks,
> Cristian
>=20
>=20
> --- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> @@ -34,10 +34,12 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: The cache configurati=
on registers base
>=20
> =C2=A0=C2=A0 reg-names:
> -=C2=A0=C2=A0=C2=A0 items:
> +=C2=A0=C2=A0=C2=A0 oneOf:

Is there a better keyword for that, cause picking 3 of a one of is clearly
confusing to read.

Nicolas

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: function
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: link
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: cache
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: link
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: function
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: cache
>=20
> =C2=A0=C2=A0 interrupts:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1

--=-h8XPhJ/XXmCZWhSQFgHf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaZyXjAAKCRDZQZRRKWBy
9Cl7AP9uFA0M8s14cMDKn/c8m/v7c1b87q8uL0M5asRQkNJA0QD+PM6qZs8Bemvu
c2FjgV2IQvpCj71b3BlzpveDwoOPZwE=
=L29t
-----END PGP SIGNATURE-----

--=-h8XPhJ/XXmCZWhSQFgHf--


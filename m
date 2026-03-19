Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052BC1091917
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 20:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2nYp2Iy/5l+M3knMvF7NKwjP9yv333TJvK0rI736oQM=; b=PuN/OYLjpzYh+7oyKwmDbE9M0R
	cdP6usDYr2c+pth93tJjqkD+UnGjCjTfs5reHZobPGxz9wS8qK/IQwZPMzB40DCdSUkGTv8yRCx53
	h89v/iDm3/Y4oqz7PTjJ7zB0d/9QAZGcWw97M9+baC9oblEofPGmfU/7Pp8Kdt1Gd2y1neBPNLyri
	kXfIeVNXhuIbx+A7kwXy/YUpazJuuL7PQzQj7I5VuPJDYNPKJvqV0aFGXJ4aCecawDsRIxfXjxBiq
	YUxnHzrOxGPw6JE6V3RejFIk1WawDugZPRGfLbnakfWLMg+gX/Gfz2rMkEx7IlVrekVm13UJd8LhM
	qt/ILZEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3KBo-0000000BYJz-09sm;
	Thu, 19 Mar 2026 20:41:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3KBl-0000000BYJb-0Y5W;
	Thu, 19 Mar 2026 20:41:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773952909;
	bh=2nYp2Iy/5l+M3knMvF7NKwjP9yv333TJvK0rI736oQM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=n2EVMZyHMqHfN4m1F3N0YDPL8+UNBEFGUXnXuXi79y4OD+66E+w6FdF9U51S1QQHt
	 Ovw6bamEf2XL/B+Et7b4bDM6aDILluE7QgHi2h8Vhz/qQomxvjKhF64JMN7g4sim9Y
	 vp9xc+N/ScwrNuhHobBE8ICYTv+Wc3SgHD7fczDLVLtietw15glAPJwkJqbGx5bW8W
	 Tq8YXjOK2YAWaySHTYFabD3H/svzbtcg/lrxr50IYKH/9m3bXwC4D9bxdAXUKWFBmX
	 hJrYk6g38k+1XnmpaK/42MCk32jq4EnJ3+zK2uxRwusog0s+e884zUzRuC6aLHwHu2
	 QuWBPM3Q2ksDA==
Received: from [IPv6:2606:6d00:11:b76d::5ac] (unknown [IPv6:2606:6d00:11:b76d::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A233A17E0ED6;
	Thu, 19 Mar 2026 21:41:46 +0100 (CET)
Message-ID: <c91cbec7266aea6dec3f66e9ebce7406281b66bd.camel@collabora.com>
Subject: Re: [PATCH v5 1/4] media: dt-bindings: rockchip,vdec: Mark
 reg-names required for RK35{76,88}
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Detlev Casanova	
 <detlev.casanova@collabora.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>,  Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	linux-media@vger.kernel.org, Conor Dooley <conor@kernel.org>
Date: Thu, 19 Mar 2026 16:41:42 -0400
In-Reply-To: <20260304-vdec-reg-order-rk3576-v5-1-7006fad42c3a@collabora.com>
References: <20260304-vdec-reg-order-rk3576-v5-0-7006fad42c3a@collabora.com>
	 <20260304-vdec-reg-order-rk3576-v5-1-7006fad42c3a@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-QKja3Cualm9wLtqX3oRC"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_134153_322044_46C7E502 
X-CRM114-Status: GOOD (  20.06  )
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


--=-QKja3Cualm9wLtqX3oRC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 04 mars 2026 =C3=A0 23:00 +0200, Cristian Ciocaltea a =C3=A9cri=
t=C2=A0:
> The Rockchip Video Decoder driver expects reg-names to be mandatory for
> RK3576 and RK3588 SoCs, however the binding does not currently require
> the use of them.
>=20
> As a consequence, driver would fail to probe with a hypothetical
> devicetree that doesn't provide the reg-names for these SoCs, but which
> is otherwise a perfectly valid DT from the binding perspective.
>=20
> Update the binding and make reg-names required for the aforementioned
> SoCs.=C2=A0 While this change introduces an ABI break, the expected impac=
t on
> potential users would be minimal, if any, since the old SoCs are
> unaffected, while the video decoder support for these newer variants in
> mainline driver and devicetrees hasn't been released yet.
>=20
> Moreover, this is also a prerequisite for a subsequent binding update
> introducing an alternative reg-names order, according to the
> address-based listing in the vendor's datasheet.
>=20
> Reported-by: Conor Dooley <conor@kernel.org>
> Closes: https://lore.kernel.org/all/20260227-urologist-gratitude-7984733f=
2d41@spud/
> Fixes: c6ffb7e1fb90 ("media: dt-bindings: rockchip: Document RK3588 Video=
 Decoder bindings")
> Fixes: a5c4a6526476 ("media: dt-bindings: rockchip: Add RK3576 Video Deco=
der bindings")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

To Heiko, I'm picking this for 7.1, along with the order changes, which are=
 more
or less cosmetic considering that names are required by this patch. At leas=
t it
show that driver cannot do anything else then picking these by name for
compatibility reason.

Nicolas

> ---
> =C2=A0Documentation/devicetree/bindings/media/rockchip,vdec.yaml | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml b=
/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> index 809fda45b3bd..dc4ebb50b316 100644
> --- a/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip,vdec.yaml
> @@ -123,6 +123,8 @@ allOf:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItems: 5
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reset-names:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 minItems: 5
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 required:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - reg-names
> =C2=A0=C2=A0=C2=A0=C2=A0 else:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg:

--=-QKja3Cualm9wLtqX3oRC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabxfhwAKCRDZQZRRKWBy
9EDKAQDZQTlJPwnkKi/xjIAq4hmNEUlZDufgrxQLFh12i0Hp+gEAtig2V2/waIFs
huravIxFyGxxr7cgF/YZtTqnKOWl3wY=
=Npfi
-----END PGP SIGNATURE-----

--=-QKja3Cualm9wLtqX3oRC--


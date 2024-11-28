Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C139D690F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 10:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkpYfR0YRpDWZnChNpMhClbLteGunVQfMnCk8yDUZkA=; b=dSvMm0tfw/jOCUqGJVlxoRqFAW
	uILc3TkAmCbAwBTwYK4KEo7SsqXay3vQ1NftVWJLa5c+44UAH1gaSXvVes1VqKs5Y+FOIcAwKDre2
	b8s4zD6m4xQVVFVp1DNHMealcQTBGi9rcGmJvxCQ607XBJoxKttvIvkyqwmpyAfe0j2skWuOjxQty
	pJg/F2CjGy/+5xhM0zS4u8znCNOL0ibDFX0ilbvXd9xXn6903/qVmkTanM13Dh2/IHnhLA5rGknwL
	hqVlEXd2khsT+42vzxDSBOXpNx30uL5CrdCJIuD746u58qKmIzfYgf9PgvROJWOEqo4aF/Hvi4d8t
	AqHKpqUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGbn2-0000000FG6K-07c4;
	Thu, 28 Nov 2024 10:30:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGbm1-0000000FFvc-3zTd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 10:29:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AE9205C59FD;
	Thu, 28 Nov 2024 10:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C5CC4CECE;
	Thu, 28 Nov 2024 10:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732789763;
	bh=UN9E/IslKJJ6kXg07JlJB5mwNZgSYgjjqJXv+tdg8to=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vLmuCLCjnYq+kiQoVtx+OI6vriP/NyPLzBqvfhzYve/l4WNpbc1wYdDQssVor5zdt
	 p5KtJ1sm9eTKXSYshjV2SkAmRd2LCrMJwq890kcxask80KqdRBvGJ7ABwVAP42ztkp
	 kh0u1amEpZ7e+XlAmgQYbDL3QhpVrbm7sHWPw7dJAaVUEZc6Og232TsDsyV5Y2BBsJ
	 T7lrV9F+V1tHkasuVo5nhpjqYgLc7V4P3enqP+dX4UXJwbqeb5uQZhUZ/Xmn7l8aWx
	 1XsM9pjx8udc9EV2jBiSUdvch42d6NKcruq7zzYhGoMRw04jX4HlIjkWokSNcZTWQ8
	 fB+i97A77k18w==
Date: Thu, 28 Nov 2024 11:29:20 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Andrej Picej <andrej.picej@norik.com>
Cc: Rob Herring <robh@kernel.org>, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, 
	jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, marex@denx.de, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: drm/bridge: ti-sn65dsi83: Add optional
 property ti,lvds-vcom
Message-ID: <20241128-mottled-nostalgic-oriole-be31ce@houat>
References: <20241127103031.1007893-1-andrej.picej@norik.com>
 <20241127103031.1007893-2-andrej.picej@norik.com>
 <20241127151630.GA3515396-robh@kernel.org>
 <3b5768e5-dcb6-436d-837c-418676e13b2e@norik.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="tvgn3pzm6x2sclac"
Content-Disposition: inline
In-Reply-To: <3b5768e5-dcb6-436d-837c-418676e13b2e@norik.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_022926_077274_2B4EF3B3 
X-CRM114-Status: GOOD (  20.33  )
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


--tvgn3pzm6x2sclac
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/3] dt-bindings: drm/bridge: ti-sn65dsi83: Add optional
 property ti,lvds-vcom
MIME-Version: 1.0

On Thu, Nov 28, 2024 at 09:46:33AM +0100, Andrej Picej wrote:
> On 27. 11. 24 16:16, Rob Herring wrote:
> > On Wed, Nov 27, 2024 at 11:30:29AM +0100, Andrej Picej wrote:
> > > From: Janine Hagemann <j.hagemann@phytec.de>
> > >=20
> > > Add an optional property to change LVDS output voltage. This depends =
on
> > > the connected display specifications. With this property we directly =
set
> > > the LVDS_VCOM (0x19) register.
> > > Better register property mapping would be quite tricky. Please check
> > > bridge's datasheet for details on how register values set the LVDS
> > > data lines and LVDS clock output voltage.
> > >=20
> > > Signed-off-by: Janine Hagemann <j.hagemann@phytec.de>
> > > Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> > > ---
> > >   .../bindings/display/bridge/ti,sn65dsi83.yaml      | 14 +++++++++++=
++-
> > >   1 file changed, 13 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65=
dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.=
yaml
> > > index 48a97bb3e2e0..5b2c0c281824 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.y=
aml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.y=
aml
> > > @@ -58,6 +58,12 @@ properties:
> > >                     - const: 2
> > >                     - const: 3
> > >                     - const: 4
> > > +              ti,lvds-vcom:
> > > +                $ref: /schemas/types.yaml#/definitions/uint32
> > > +                description: LVDS output voltage configuration. This=
 defines
> > > +                  LVDS_VCOM (0x19) register value. Check bridge's da=
tasheet for
> > > +                  details on how register values set the LVDS data l=
ines and
> > > +                  LVDS clock output voltage.
> >=20
> > Constraints? 0 - 2^32 are all valid values?
>=20
> Not really, only first 6 bits, which also means that this can be uint8 th=
en.
> Will fix with other issues.

Also, generally speaking directly using register values is really
frowned upon, even more so when they match a value expressed in a
standard unit.

Maxime

--tvgn3pzm6x2sclac
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0hF9wAKCRAnX84Zoj2+
dhSoAX9Uu3UcKpopfFbkrgWp56OEJeL/hrbtsgKELqjxdDABI0ujjZDWXpMg1rM8
FxDYFLkBgMOgSjdgLtFASjWYBF1ZOJauobTk1LyMFCHiK30f0SS5gjfI+r7wL/pr
FqWXHi0wAw==
=sZjc
-----END PGP SIGNATURE-----

--tvgn3pzm6x2sclac--


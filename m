Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271C9CD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 16:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EM0tOpRC6ixc7T8RIHjmgk36nAVQgn8lpdFzEdyfyNI=; b=gwqcvv2+NuPZnyB8wY3ke+Yx//
	2gjETd0IbHhCMTTaGYxfqSGn05IUGuY4dR2YSjaRVvjun9jQZhUHHyK4i/h8A9Zq7fPCKdPDzzNYB
	z46vMWUmuKKUay/EMG43wuepbidMcZFTvZYekQ1s3neEhi/NJwP88iEXjx3MtYFnpLWEwDZoO2vaR
	sV2fVNY0Wc136sp+QM7ONEwqVgjHQ7CGsgwV6z66wsCBVAOEv1yKrfngJxQiaH7xLhHq15Z7MmG56
	cjpZXEkDzaaZyoFQre4Aov9DOPzT09N4klffcsrL2ZEoj0i4oM/XBPELYnc1h/WP/H9RO1dF0bAqD
	BzIgeBhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6k0-00000008ZKY-0aIt;
	Thu, 21 May 2026 16:59:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6jz-00000008ZKM-1DBg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 16:59:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A6E1B601F3;
	Thu, 21 May 2026 16:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346391F000E9;
	Thu, 21 May 2026 16:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779382762;
	bh=EM0tOpRC6ixc7T8RIHjmgk36nAVQgn8lpdFzEdyfyNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g+QqISauQqVYxSIXaHqVaUlLJHDcMT4QNJN/9mxUtxf6sJycMYnsGFXAZU3wvySRq
	 tfVy50AWhc8dHAB6jL2KIqy2aqEQdwp94yXY3Wpp+Gc1XtFJgHuWH2Hy6I7mletKwf
	 8XN2+KM2UmpbI3mqBqctxzmNiaYUCYpQt41jrU+8QN4W3bDm9OLPpK7ic1jwvnuYCk
	 2rzqJAeJKol7jUWW4iTOVuGywYeNKo3amm643l4OxM5RSkHV874dU0jP8VDYdcl6nZ
	 SpADqiIHtY1es6/WpDQzJifaN4XoMcrq3sBLxF3jK8rn0MzJMreog3QgYveKDqZYTT
	 wPlMSXrbx49Iw==
Date: Thu, 21 May 2026 17:59:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Vitor Soares <ivitro@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 13/15] dt-bindings: display: panel-lvds: Add
 dual-channel LVDS support
Message-ID: <20260521-cleaver-starboard-963eec225121@spud>
References: <20260521150038.103538-17-ivitro@gmail.com>
 <20260521150038.103538-30-ivitro@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zZiN10fyI46t4nxn"
Content-Disposition: inline
In-Reply-To: <20260521150038.103538-30-ivitro@gmail.com>
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


--zZiN10fyI46t4nxn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 04:00:49PM +0100, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
>=20
> The panel-lvds binding only supports single-channel panels.
> Extend it to support dual-channel LVDS panels by referencing the
> lvds-dual-ports schema when a ports container is present.
>=20
> Assisted-by: Claude:claude-sonnet-4.6
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>

Ah, this is part of what sashiko was talking about I guess.
nvm that email so.
Why can't your new device go into panel-simple-lvds-dual-ports?

> ---
>  .../bindings/display/panel/panel-lvds.yaml          | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.y=
aml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> index 7ed0c486870b..45183a1439ce 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
> @@ -82,6 +82,17 @@ required:
>    - width-mm
>    - height-mm
>    - panel-timing
> -  - port
> +
> +oneOf:
> +  - required:
> +      - port
> +  - required:
> +      - ports
> +
> +if:
> +  required:
> +    - ports
> +then:
> +  $ref: /schemas/display/lvds-dual-ports.yaml#
> =20
>  ...
> --=20
> 2.54.0
>=20

--zZiN10fyI46t4nxn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCag855AAKCRB4tDGHoIJi
0l4mAP9LCzA3DYw150Odv8EVXwZMevxuRD/apsBgRbxPRJbN6wD/ZX/TS7nMkBei
vgOWMO7ndOs70m86sVKr1GJtxamNnAQ=
=xKXx
-----END PGP SIGNATURE-----

--zZiN10fyI46t4nxn--


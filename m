Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0CAD3177B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 18:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1QgTsReoaiEpOkyd8henLX224FFr8Bnzmqp3kECQu/8=; b=fsdgbNceirru0yBLyLmVkWqtoe
	w7x9cJyfMsNnDq3l54vRUyt2XLbntVQzRB+CUyW34Efbf42oMQdxqyD3lPqhZj5WxLt3N7ESwtMYq
	NJkCmu0Sh1z1dB2NZw+tuSfO4EaLlFinu3CEO5+N+TeB8v+PhVQCFFiLtbeCVO8d/Sll7yOieIZC9
	NWMtrNnhCTZA1kt7zse+CY37/rS1JK/wzSJGRHB/hrivTZ4w7MSWEypSN/GeeZkibF+FisfX7YRIM
	21QTQq/Al9u+N8eNaaCjq+dPPBPN2ae0RaPJqMFKTp9dkexPp2oGe/+UcUwy4+XH3rc+6TXZtKz/8
	ChpPCyZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8O5I-00000000LOE-2bbJ;
	Tue, 05 Nov 2024 18:15:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8O3D-00000000L1G-1ZRX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 18:13:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 038AA5C53E2;
	Tue,  5 Nov 2024 18:12:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8D4DC4CECF;
	Tue,  5 Nov 2024 18:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730830390;
	bh=pxqB7qCPgf6SdrFqZG7JzmVzNL3Eokwf44mDjUQzHfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cuy7307NTZAW7l+Q8xtduxKrBLrSSffzLiuD9yd/Evp64dVBZJ+Yv8depWaLxk8dU
	 7f7cKZeUP7FO2Sx7nQRC/0esYs/0R9cdKlFSp2PjHiwxBievF4nwZJZ+aRrx5gTWGe
	 ZhSuvZXPjkrW+fzjwSQO6nVqE2Bzo6qemZSLV2L6gNnwXmREKWZSVvD1HQRP1STjS2
	 Qp+HGKOTtMpl1H5yC4BoSFZhB1aTrL/IPwIhorI5HadxPaDhVZ1ZvkXVKZDwXdgkDb
	 uFiJGIeoPns0ZSRFi6IEJa12b6ulyKiaguMvMgy+uiaLFQd2ZcsOtPDVkBzjgZJrjL
	 oHszmpQmgCyRQ==
Date: Tue, 5 Nov 2024 18:13:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Matt Coster <matt.coster@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Randolph Sapp <rs@ti.com>,
	Darren Etheridge <detheridge@ti.com>
Subject: Re: [PATCH 01/21] dt-bindings: gpu: img: More explicit compatible
 strings
Message-ID: <20241105-matron-gangway-64e78576ec47@spud>
References: <20241105-sets-bxs-4-64-patch-v1-v1-0-4ed30e865892@imgtec.com>
 <20241105-sets-bxs-4-64-patch-v1-v1-1-4ed30e865892@imgtec.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HC9jzF+yIAdMYD3B"
Content-Disposition: inline
In-Reply-To: <20241105-sets-bxs-4-64-patch-v1-v1-1-4ed30e865892@imgtec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_101311_540635_D7964046 
X-CRM114-Status: GOOD (  22.66  )
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


--HC9jzF+yIAdMYD3B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 05, 2024 at 03:58:07PM +0000, Matt Coster wrote:
> The current compatible strings are not specific enough to constrain the
> hardware in devicetree. For example, the current "img,img-axe" string
> refers to the entire family of Series AXE GPUs. The more specific
> "img,img-axe-1-16m" string refers to the AXE-1-16M GPU which, unlike the
> rest of its family, only uses a single power domain.

That's not true, you could apply the rules using the ti,am62-gpu
compatible, no?

> Work is currently underway to add support for volcanic-based Imagination
> GPUs; also add a generic top-level "img,img-rogue" compatible string to
> allow for simpler differentiation in devicetrees.

This makes no sense, how does adding another fallback compatible make
it simpler? I have to assume that this means there will be geothermally
powered axes in the future and you want to tell the difference between
them and those pesky rogue axes that chop the heads off of naughty
children?

>=20
> Make these changes now before introducing more compatible strings to keep
> the legacy versions to a minimum.
>=20
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml    | 19 +++++++++++++=
+-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml=
 b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 256e252f8087fa0d6081f771a01601d34b66fe19..ef7070daf213277d0190fe319=
e202fdc597337d4 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -12,10 +12,19 @@ maintainers:
> =20
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - ti,am62-gpu
> -      - const: img,img-axe # IMG AXE GPU model/revision is fully discove=
rable
> +    oneOf:
> +      - items:
> +          - enum:
> +              - ti,am62-gpu
> +          - const: img,img-axe-1-16m
> +          - const: img,img-rogue
> +
> +      # This legacy combination of compatible strings was introduced ear=
ly on before the more
> +      # specific GPU identifiers were used. Keep it around here for comp=
atibility, but never use
> +      # "img,img-axe" in new devicetrees.
> +      - items:
> +          - const: ti,am62-gpu
> +          - const: img,img-axe
> =20
>    reg:
>      maxItems: 1
> @@ -64,7 +73,7 @@ examples:
>      #include <dt-bindings/soc/ti,sci_pm_domain.h>
> =20
>      gpu@fd00000 {
> -        compatible =3D "ti,am62-gpu", "img,img-axe";
> +        compatible =3D "ti,am62-gpu", "img,img-axe-1-16m", "img,img-rogu=
e";
>          reg =3D <0x0fd00000 0x20000>;
>          clocks =3D <&k3_clks 187 0>;
>          clock-names =3D "core";
>=20
> --=20
> 2.47.0
>=20

--HC9jzF+yIAdMYD3B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZypgMAAKCRB4tDGHoIJi
0nC4AQC4AzHjeKvDrm+ExJzNjJmg5LhdaVii97hh964tmhK59QD4jl8H5QIn/+vE
4NZXGn3q7P2E/PvGBSyFkSd9XRUHBw==
=IOI3
-----END PGP SIGNATURE-----

--HC9jzF+yIAdMYD3B--


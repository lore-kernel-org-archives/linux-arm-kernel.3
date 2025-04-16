Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9A9C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 17:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q64y2zQHOBhXue7VEEfrr93o347z5k3JbyIYNfns/J8=; b=iq90fE8WBPoj1jRSWanTREBfEU
	/oIZm33rMO6vRiDL4TYE+XLhY8MRpNiYFT/QfMoFf9vhqMbh4INQ/IBlPFULSgXFzevMvitffGkFG
	Cv/IzvjOUfi+qOY8Np/DHodWrXYtHuTrmvZSQkt+Cf/iChEtMa3/fJ4tOSZxWxXj3I8AjeNv8A/8+
	YT9zuqfseRVuJE0Lps0ik/sCZ0C6iuGsry5TQi5471qd6Pihzfwr2CiDiMSni0hyoPZH6KALcrqyQ
	Pfa8jVf1h1rpoDxF90frEjnJU0iIywQFuqojRiiwylGaVFd5lddqsmw8cajXPG1Wezd+k9oeqrvKG
	KwHVVEnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u56CG-0000000AMME-0eFU;
	Wed, 16 Apr 2025 17:05:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55fY-0000000AGl1-1WAg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 16:31:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C55AEA4A3F8;
	Wed, 16 Apr 2025 16:25:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B4FC4CEE2;
	Wed, 16 Apr 2025 16:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744821082;
	bh=gd4WJ1bKoNwsdKrjrxPXgePTdjDUnGH4t90UElI2Ng0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oBO62cTzmHGTYfMcNfBkhSRUl+ysy7VRh0akpS1HqVX8NftlJKagpLADUPEOJy57Q
	 r+YEvPJfvGGjK+T7q2klddkSFTYXRAmmBWi/7ekn2H3CvjoWrxukrV/SEMPVbZHgcz
	 BiMabEqAhxo61m8fF2aGJfNUSuBVwQak91EmpVk2PU37LBgDZAliZdY6bDHynSwLT/
	 nRQdLttpKUYTKdj1S1u97In5c+7iLK8OnUfH3U9MzK43ujiHgK9OLd8Jld4nFybRpI
	 TQaXH1mh+VZT+J1QgJZ31cIgqap+JZew9TjlrFvX6/+mg47O/wz08xUvSpWBX9SF8r
	 yLDt/mgU0fN9Q==
Date: Wed, 16 Apr 2025 17:31:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Dominik Haller <D.Haller@phytec.de>
Cc: "robh@kernel.org" <robh@kernel.org>,
	"kristo@kernel.org" <kristo@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"vigneshr@ti.com" <vigneshr@ti.com>, "nm@ti.com" <nm@ti.com>,
	"m-chawdhry@ti.com" <m-chawdhry@ti.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"upstream@lists.phytec.de" <upstream@lists.phytec.de>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: ti: Add bindings for PHYTEC
 AM68x based hardware
Message-ID: <20250416-repost-crock-e86b694bd268@spud>
References: <20250415130458.33714-1-d.haller@phytec.de>
 <20250415-lark-deskwork-7850a95aa955@spud>
 <e93ea6f4c401089298dcf36ac35dbc4365deb9b6.camel@phytec.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VGUmC/Ceia8R78/F"
Content-Disposition: inline
In-Reply-To: <e93ea6f4c401089298dcf36ac35dbc4365deb9b6.camel@phytec.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_093124_530167_B39AE937 
X-CRM114-Status: GOOD (  23.22  )
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


--VGUmC/Ceia8R78/F
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 12:25:36PM +0000, Dominik Haller wrote:
> On Tue, 2025-04-15 at 17:09 +0100, Conor Dooley wrote:
> > On Tue, Apr 15, 2025 at 03:04:56PM +0200, Dominik Haller wrote:
> > > Add devicetree bindings for the AM68x based phyCORE-AM68x/TDA4x SoM
> > > and the phyBOARD-Izar carrier board.
> > >=20
> > > Signed-off-by: Dominik Haller <d.haller@phytec.de>
> > > ---
> > >=20
> > > Notes:
> > > =A0=A0=A0 Changes in v2:
> > > =A0=A0=A0 - no changes
> > >=20
> > > =A0Documentation/devicetree/bindings/arm/ti/k3.yaml | 2 ++
> > > =A01 file changed, 2 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml
> > > b/Documentation/devicetree/bindings/arm/ti/k3.yaml
> > > index 18f155cd06c8..a03fdb9c0482 100644
> > > --- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
> > > @@ -135,6 +135,8 @@ properties:
> > > =A0=A0=A0=A0=A0=A0 - description: K3 J721s2 SoC
> > > =A0=A0=A0=A0=A0=A0=A0=A0 items:
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - enum:
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - phytec,am68-phyboard-izar
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - phytec,am68-phycore-som
> >=20
> > This looks wrong, if I am not misunderstanding. Your izar dts
> > includes
> > the som dtsi, so this should be configured with a fallback, so you're
> > going "phytec,am68-phyboard-izar", "phytec,am68-phycore-som",
> > "ti,j721s2",
> > no?
> The compatibles are "phytec,am68-phyboard-izar", "ti,j721s2"; in the
> dts and=A0"phytec,am68-phycore-som", "ti,j721s2"; in the dtsi now.
>=20
> So when I add the phytec,am68-phycore-som comaptible to the dts I'll
> move my bindings into an own entry and use a second const for the som:
>=20
>       - description: K3 J721S2 SoC Phytec SoM based boards
>         items:
>           - enum:
>               - phytec,am68-phyboard-izar
>           - const: phytec,am68-phycore-som
>           - const: ti,j721s2

This looks more like what I'd expect, ye.

--VGUmC/Ceia8R78/F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ//bVgAKCRB4tDGHoIJi
0gEOAQC41W0X7lIQLzvWx+GjIyTqwWL/Ak2Hilski22leIhZ9gD/Y9/3EHL8AwMr
mB65pu9rFGljtn2AssgjV1vVv+5DHws=
=RVvU
-----END PGP SIGNATURE-----

--VGUmC/Ceia8R78/F--


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E211C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 18:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sHnU61R+7n6GMPzzUrxZ8rYUJLceuOx0V3E1T1zEZ9o=; b=EzLclBFleWe26+jaGTfjaQaBLx
	MoeZ8c+3qzJC39HqR9Zvy5h/KRQOnLE7aUbEMSjm9nzWMfpOvdcerxAaGxkVXmDFuqj8LggSOX5F0
	/ZXe7xMh5v5MZLgOBd+JQGsRzZLznoxo9KSLaoB/RYu7gvyiAp1hE+imvHz9DlJmyqiZg/XCHuryz
	R1S9uNGxOgc0hR0vkUzwJb7cDT6T+p9xuVg4Iv6rR9vTphSsmN4kACy2LjESTU5mbnnwJjzYanlVj
	uyXFNEp+ffppOyeMHNWqgjqrGSEOuRvJRSSbgTmC9/o5glCsZDafLDnz7sQX5+VQSBi+XPhXqTyAI
	BqEKdX5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP402-00000007qBY-0Uoq;
	Tue, 10 Jun 2025 18:47:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0sB-00000007JLL-2pOt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 15:26:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 593255C4698;
	Tue, 10 Jun 2025 15:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB9AC4CEF0;
	Tue, 10 Jun 2025 15:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749569206;
	bh=L4D6UEE3jXZEX8/zwLbFdXFJfzEaEMXKWpBeLeAk1Ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iFHJtYCxl9efKlFhO+vB8Mjl/34HpMQfpIePgoQSHEHTm4tNkwyrOfTO6S+PbpIic
	 Pu8R217jkW01boKBcwLo8aK8lB5n0odnvP8grrgINrN7oHDMm97xI+VpbR1GJ8EVtG
	 rIiYnToX486ubJqWXQOyBrkzWLG2nLJGIAvfmezktcbtyNrpE2isBiXdYc4gX9I89z
	 1xcLu3iJFBEpO+v0O8z/za/8Zakc7TzlQDlgSeX2Bs5uxW7qjfaaOx5LAg4VRu1GkX
	 qPq4eR649NMwqC+pbVFVY911ZW+ZNbCT4/XvUBJp9JED2YZv57hDS1A70lRNib+I48
	 StBtJFABKDHTQ==
Date: Tue, 10 Jun 2025 16:26:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Bajjuri Praneeth <praneeth@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/5] arm: dts: omap: Add support for BeagleBone Green
 Eco board
Message-ID: <20250610-ongoing-showing-4274fe6ac0e4@spud>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
 <20250609-bbg-v2-4-5278026b7498@bootlin.com>
 <20250609-helpful-immodest-0f195cdbcbf2@spud>
 <20250609224502.1fce742c@kmaincent-XPS-13-7390>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CNb1Q4rZI/FcDQ7n"
Content-Disposition: inline
In-Reply-To: <20250609224502.1fce742c@kmaincent-XPS-13-7390>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_082647_796389_FEDC3878 
X-CRM114-Status: GOOD (  22.61  )
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


--CNb1Q4rZI/FcDQ7n
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 09, 2025 at 10:45:02PM +0200, Kory Maincent wrote:
> Le Mon, 9 Jun 2025 18:04:01 +0100,
> Conor Dooley <conor@kernel.org> a =E9crit :
>=20
> > On Mon, Jun 09, 2025 at 05:43:54PM +0200, Kory Maincent wrote:
> > > SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone =
Green
> > > (BBG). It has minor differences from the BBG, such as a different PMI=
C,
> > > a different Ethernet PHY, and a larger eMMC.
> > >=20
> > > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > > ---
> > >=20
> > > Changes in v2:
> > > - Used generic pmic node name.
> > > - Add regulator prefix to fixed regulator node name.
> > > - Add the compatible to omap.yaml binding
> > > ---
> > >  Documentation/devicetree/bindings/arm/ti/omap.yaml |   1 +
> > >  arch/arm/boot/dts/ti/omap/Makefile                 |   1 +
> > >  arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dts | 170
> > > +++++++++++++++++++++ 3 files changed, 172 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > > b/Documentation/devicetree/bindings/arm/ti/omap.yaml index
> > > c43fa4f4af81..774c13157caa 100644 ---
> > > a/Documentation/devicetree/bindings/arm/ti/omap.yaml +++
> > > b/Documentation/devicetree/bindings/arm/ti/omap.yaml @@ -145,6 +145,7=
 @@
> > > properties:
> > >        - description: TI bone green variants based on TI AM335
> > >          items:
> > >            - enum:
> > > +              - ti,am335x-bone-green-eco
> > >                - ti,am335x-bone-green-wireless
> > >            - const: ti,am335x-bone-green
> > >            - const: ti,am335x-bone =20
> >=20
> > Why is this hunk here?
>=20
> Do you mean that the binding change should be in another patch?

Yes, you have a binding change hidden away in a dts patch.

--CNb1Q4rZI/FcDQ7n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEhOsQAKCRB4tDGHoIJi
0lMaAQCmKPqrWelkROcaZ+0YtXmnca+FBaYWFgHGdnpcj+Yf/QD9GSTFZQwOTKVP
MdMxzoAGPBOr08LrEVPcvhr6rUrHxAo=
=ndtq
-----END PGP SIGNATURE-----

--CNb1Q4rZI/FcDQ7n--


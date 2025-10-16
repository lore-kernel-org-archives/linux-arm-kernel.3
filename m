Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9A1CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 15:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TzJUZ89OhUGA3kL4v7MMvwwkR3jxoQv3mjB9cMoKyWw=; b=Lw0xLFEzrygo0DdeCluLJokWXq
	6XHfAk7fEnHWXbnciPBYuSyJD4ZTYF2RlYNH+LiXy4D7yhscJ3Wj18o9j9zBheEdGhpVRaShRNX3b
	sCpA74T5usQJsWPvSlg1qLE7q5D4vXO2Fcsz8lbBE1cOj2xbpn/GltOatJOyNH4zdoyPMw9HMzab3
	l0+lo/mubTyHGJbUfofy42UFVcik2RUxZhf7quJwAo2DuGiuB8xTe5XdrxqpFZLItkEEOTr6qqFup
	J7NeFdZe185BFq2rSDh5X2UgssFRubTFKF2t86VD6UDDogqAuPlwEjNfBYV07dvlvxaHT64OjlZtr
	ZOjPHywg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Pjx-000000059ss-0azT;
	Thu, 16 Oct 2025 15:18:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Pjv-000000059sb-2gAR;
	Thu, 16 Oct 2025 15:18:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0977C63FEA;
	Thu, 16 Oct 2025 15:18:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDEE0C4CEF1;
	Thu, 16 Oct 2025 15:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760627882;
	bh=OLnjTBsFhS0CId8p8aaFBJZI0umIpECS/0vXz5PL+w8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VKj0kEsd+aS2RZwQEt4B+17ygXz+unO4/ewuvgXyT6PEydMGpLQOTjs3Byc8uk14D
	 +t4wVTmWAQtrVH6sM0pdk5sxAO+Gfy1HqARSe8MWBiTVMGEq514rzJCY1sOdJn0Ykf
	 ltUmLw320DKnZfgOT3xWmLpqsmxgPsYasO0IIxAqFVLTecd3RUSFqpd5fSno7zw+85
	 OfyYL/b++1IURqXBF08aIGO5AyZ7PAoy5PTaEwPXgm9baSzd0UJUqr4AKQVDWneFB4
	 Y8Np3Le5wbkjQOr0UGNy0kVuPakJ8ARC8V3UqYwApf0XTb89JkD/mibdl3P6JNF5Q4
	 S33CHW9BdnqHg==
Date: Thu, 16 Oct 2025 16:17:57 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	broonie@kernel.org, igor.belwon@mentallysanemainliners.org,
	linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
	kernel@collabora.com, matthias.bgg@gmail.com, wenst@chromium.org,
	devicetree@vger.kernel.org, krzk+dt@kernel.org, lee@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, conor+dt@kernel.org
Subject: Re: [PATCH v9 1/9] dt-bindings: regulator: Document MediaTek MT6316
 PMIC Regulators
Message-ID: <20251016-sporty-nectar-aecdb9499624@spud>
References: <20251016093054.126293-1-angelogioacchino.delregno@collabora.com>
 <20251016093054.126293-2-angelogioacchino.delregno@collabora.com>
 <176061229682.2195705.7053755296248416631.robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ohtOrGlqHgKDXiIM"
Content-Disposition: inline
In-Reply-To: <176061229682.2195705.7053755296248416631.robh@kernel.org>
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


--ohtOrGlqHgKDXiIM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 05:58:16AM -0500, Rob Herring (Arm) wrote:
>=20
> On Thu, 16 Oct 2025 11:30:46 +0200, AngeloGioacchino Del Regno wrote:
> > Add bindings for the regulators found in the MediaTek MT6316 PMIC,
> > usually found in board designs using the MT6991 Dimensity 9400 and
> > on MT8196 Kompanio SoC for Chromebooks.
> >=20
> > This chip is fully controlled by SPMI and has multiple variants
> > providing different phase configurations.
> >=20
> > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> > ---
> >  .../regulator/mediatek,mt6316b-regulator.yaml | 78 +++++++++++++++++++
> >  .../regulator/mediatek,mt6316c-regulator.yaml | 78 +++++++++++++++++++
> >  .../regulator/mediatek,mt6316d-regulator.yaml | 77 ++++++++++++++++++
> >  3 files changed, 233 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/regulator/mediate=
k,mt6316b-regulator.yaml
> >  create mode 100644 Documentation/devicetree/bindings/regulator/mediate=
k,mt6316c-regulator.yaml
> >  create mode 100644 Documentation/devicetree/bindings/regulator/mediate=
k,mt6316d-regulator.yaml
> >=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/r=
egulator/mediatek,mt6316c-regulator.example.dtb: pmic@6 (mediatek,mt6316c-r=
egulator): '#address-cells' does not match any of the regexes: '^pinctrl-[0=
-9]+$', '^vbuck(124|3)$'
> 	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6316=
c-regulator.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/r=
egulator/mediatek,mt6316b-regulator.example.dtb: pmic@8 (mediatek,mt6316b-r=
egulator): '#address-cells' does not match any of the regexes: '^pinctrl-[0=
-9]+$', '^vbuck(12|34)$'
> 	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6316=
b-regulator.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/r=
egulator/mediatek,mt6316d-regulator.example.dtb: pmic@7 (mediatek,mt6316d-r=
egulator): '#address-cells' does not match any of the regexes: '^pinctrl-[0=
-9]+$'
> 	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6316=
d-regulator.yaml#
=20

 pw-bot: changes-requested

--ohtOrGlqHgKDXiIM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPEMogAKCRB4tDGHoIJi
0qc5AQC6xrazBME8K5XiVlRmkQmWm65ekJKMBRgQQ4h9Gki0+QEA2a5XkyiAuneG
Od5C/18x/63rpqNUfJk81SW/QURIGQc=
=IJSe
-----END PGP SIGNATURE-----

--ohtOrGlqHgKDXiIM--


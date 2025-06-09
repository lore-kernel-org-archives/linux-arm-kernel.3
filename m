Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFE7C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 18:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BnzFDlWRwXCzfZM9kXNEXUY6JzpyBJKqSJ6foAVIV5w=; b=X7jN2oDeUGQX+Rcfajs4r6Te3Y
	3N1C8Hfz4H02M49hkkYtTTWPgVX0sIvipN4VyKxiTcaaVXU8r7oEGNChN1cBB8NeZnGqD761QqM4Q
	1+zg4R1cLL+6SjT1ecHPlftOD9xLcKqn2t/6VRNn+dL8z578+gibeXAMB+Lk787FwQhIDVhJY2QqL
	rwKB0fPBoT+NqS72lwVGb5dpAXW4wTfMsu/tfbhzsmGTaF1PezoB2ezCqg8QQL/RAnKxvMubyuDES
	JPNwDNKxP9fTM5GmJz5BvZ43h2EERGmE4hRVlujuk2GRHusq/Fgu9RKrp9nmFMdLmg+VNLWxhzVfT
	m2CtoC/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOh2d-00000004skc-0Ypb;
	Mon, 09 Jun 2025 18:16:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOftw-00000004kWj-2F0o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 17:03:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3362D5C4CB6;
	Mon,  9 Jun 2025 17:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF62C4CEEB;
	Mon,  9 Jun 2025 17:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749488590;
	bh=yshw6FuZ+90MLQuf4k5pVwoG8nSwK5lhMx3IZxX4Yjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qFXB3fAKQEml8axtfTSLRX63AIu8lfrNVd+eSmH26rzMKl81kmc988nBVEr9eiZ1I
	 ABLbR7+i4oqcCDUoEBZ0cFj/PmQ2Jk/NHjXSS+VdEn1xeMDaRnMluobVOXG6KeSy7b
	 BWM0etqh25arz2xYTX7VNHo9ZefvrTD4JWEgwuBjixEd69Tbwt5mzbIUnZ0POKprtz
	 lhD3a8dBgphRmfNY16L3Cjv4mOj8FuyFaDE0wgroUkIZJhAWBPazsSRTHVXI34/qyb
	 UhC/J6aYB4lubISyYSg92C5BDTXs3aSMTm15JLoyYup3LnSdNEJjbZ/iPP9TV5XtFv
	 7r/muSVDvqI6Q==
Date: Mon, 9 Jun 2025 18:03:05 +0100
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
Subject: Re: [PATCH v2 2/5] binding: omap: Add lots of missing omap AM33
 compatibles
Message-ID: <20250609-hacking-corporate-d53531577680@spud>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
 <20250609-bbg-v2-2-5278026b7498@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LtdcJJGh4TYXgIhP"
Content-Disposition: inline
In-Reply-To: <20250609-bbg-v2-2-5278026b7498@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_100312_655084_CDE6C4A8 
X-CRM114-Status: GOOD (  18.62  )
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


--LtdcJJGh4TYXgIhP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 09, 2025 at 05:43:52PM +0200, Kory Maincent wrote:
> Add several compatible strings that were missing from the binding
> documentation. Add description for Bone, BoneBlack and BoneGreen
> variants.
>=20
> Add several compatible that were missing from the binding.
>=20
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>=20
> Change in v2:
> - New patch
> ---
>  Documentation/devicetree/bindings/arm/ti/omap.yaml | 38 ++++++++++++++++=
++++++
>  1 file changed, 38 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documen=
tation/devicetree/bindings/arm/ti/omap.yaml
> index 3603edd7361d..c43fa4f4af81 100644
> --- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> +++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> @@ -104,12 +104,50 @@ properties:
>        - description: TI AM33 based platform
>          items:
>            - enum:
> +              - bosch,am335x-guardian
>                - compulab,cm-t335
> +              - grinn,am335x-chilisom
> +              - gumstix,am335x-pepper
> +              - moxa,uc-2101
>                - moxa,uc-8100-me-t
> +              - myir,myc-am335x
> +              - myir,myd-am335x
>                - novatech,am335x-lxm
> +              - oct,osd3358-sm-refdesign
> +              - tcl,am335x-sl50
>                - ti,am335x-bone
>                - ti,am335x-evm
> +              - ti,am335x-evmsk
> +              - ti,am335x-pocketbeagle
> +              - ti,am335x-shc
>                - ti,am3359-icev2
> +              - vscom,onrisc
> +          - const: ti,am33xx
> +
> +      - description: TI bone variants based on TI AM335

"bone variant" sounds like some shortand or nickname. Are the boards not
called "beaglebone green" and "beaglebone black"? Whatever about the
compatible, the description should use the full name I think.

> +        items:
> +          - enum:
> +              - ti,am335x-bone-black
> +              - ti,am335x-bone-green
> +              - ti,am335x-pocketbeagle
> +          - const: ti,am335x-bone
> +          - const: ti,am33xx
> +
> +      - description: TI bone black variants based on TI AM335
> +        items:
> +          - enum:
> +              - sancloud,am335x-boneenhanced
> +              - ti,am335x-bone-black-wireless
> +          - const: ti,am335x-bone-black
> +          - const: ti,am335x-bone
> +          - const: ti,am33xx
> +
> +      - description: TI bone green variants based on TI AM335
> +        items:
> +          - enum:
> +              - ti,am335x-bone-green-wireless
> +          - const: ti,am335x-bone-green
> +          - const: ti,am335x-bone
>            - const: ti,am33xx
> =20
>        - description: Compulab board variants based on TI AM33
>=20
> --=20
> 2.43.0
>=20

--LtdcJJGh4TYXgIhP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEcTyQAKCRB4tDGHoIJi
0qmaAQCnYxeSuRJuzQVZJXHtkG21nWecDwYZTK+G5bmgMQu4JAEA1D88zUPK6VZX
LCfljitN0oDl0kGQFAPdaT7pXwWKdgQ=
=7/bx
-----END PGP SIGNATURE-----

--LtdcJJGh4TYXgIhP--


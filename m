Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A85DFCA17E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 19:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aAmcXWlI8Mr9sTH5PMSRTMe1lFI2sZP4CAoxZHDW6UQ=; b=uMHEKmjgFXR5i+n40sXNaLTlvp
	QqnCNjGt08iMuOPlM1MoTve02FShBrNI8hQuJH4ykHElr7oPoVLCUObo2KYoQjcBdaUoCNKYEOary
	l81YqtNsT6h27P7oBA1NlZMc/jpsYx1G/RuDN5tlh9JRNXoGwHqVUj1Tj35oWW2kCO69aYE+nlK+1
	c/T17yLgl/xDnsKlDIJat1ziUTveO3hPDsz75kQq4cNaxhiuHPrekFDDZNsy9KgfZ9sDxlWla075T
	rvi8ZY8zX4ysavmT5E/v1+0jyG1pqizKMGtQTxx+0+Qgn9dPMHJsxAgcnVwAm5F0mMqzv6UF+qn4Y
	6FGtMMkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzgaz-000000084rT-0neH;
	Mon, 09 Mar 2026 19:48:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzgax-000000084r9-408f;
	Mon, 09 Mar 2026 19:48:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 107BD60054;
	Mon,  9 Mar 2026 19:48:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06832C2BC87;
	Mon,  9 Mar 2026 19:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773085730;
	bh=hLn046K7Bbtakbf/CSH1PdqAYCPfjzoSWSGucaaZ4zc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZEU2OqxKE4K4U2w0B0f0ZnSiumP9hTWhEYqMesO6/EeglKejq+0Fs3FlFQO1YYmag
	 zx5jQOmymPt32QKibei5WQbnchlYAB6bGaDVr/0L+r3ixSUOjBo6HkHRO/2iM7pEAE
	 X/wDSsYOZpiniiTg8LypoTl1ToihM37nGPn8hQBMmvwBiY/H/sgeGAH3Pg1HoMvNU3
	 3u0dWnoRjgxj0mxfPM7nUSzbxyW5CU9C2dD7bJ+ek0ukm/HnKkdKO6cpGK7Z6NNCQz
	 p8G28iQ3UEGfOWFk1rXgaYzTg2hduLXtjgcCPbuNaWoq1s4KyJU+FWOr3y9qjjyGFr
	 j8fIJW5b2a3yw==
Date: Mon, 9 Mar 2026 20:48:47 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: airoha: en7581: Add switch node to to EN7581
 SoC
Message-ID: <aa8kH8_4NO3y2zeJ@lore-desk>
References: <20260309-airoha-7581-dsa-switch-v1-1-448530b7f91f@kernel.org>
 <a9638d70-c474-4c03-b57c-5c15e9ef273e@lunn.ch>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="84AudNwnjjFunWL9"
Content-Disposition: inline
In-Reply-To: <a9638d70-c474-4c03-b57c-5c15e9ef273e@lunn.ch>
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


--84AudNwnjjFunWL9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > +				gsw_phy1: ethernet-phy@1 {
> > +					compatible =3D "ethernet-phy-ieee802.3-c22";
> > +					reg =3D <9>;
>=20
> The @1 should match the reg value. So this is wrong.

ack, I will fix it in v2.

>=20
> > +					phy-mode =3D "internal";
>=20
> phy-mode is actually a MAC property, not a PHY property. It is not
> listed in
> Documentation/devicetree/bindings/net/ethernet-phy.yaml. Which also
> suggest this has not been tested using the DT validation tools.

ack, right. I guess this just a leftover of a previous implementation, I wi=
ll
remove it in v2. Anyway I compiled the dts with the command below:

$make CHECK_DTBS=3Dy W=3D1 airoha/en7581-evb.dtb

Regards,
Lorenzo

>=20
> 	Andrew
>=20

--84AudNwnjjFunWL9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaa8kHwAKCRA6cBh0uS2t
rGw+APoDgNAVNaQq61XtrlM++fJOEhoVovfOQwUr54rfo6BNcwD8DwS4HIbPsbVx
sKWaXxv0PB5hdpZk63vRIclsFxBBVQs=
=UIg7
-----END PGP SIGNATURE-----

--84AudNwnjjFunWL9--


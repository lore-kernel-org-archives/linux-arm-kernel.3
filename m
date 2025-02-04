Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C872C02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 16:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1om8YbeuY3FiZXBm5pqswmLpWJAdjtFeqEad2mTTikQ=; b=e67EyrBRO+FBSKWn7ep6lPxmIo
	23Ih6BOG6npwAmtccemDcSyzQADFimT2OgqDxV01JxEH5G90Y8fZ8M1U9Vo2yV4rGcooW8ywg3fao
	GzEnridiJSKiv7Ofv9fSj10J1pnCam38WuM3xK6vbzuXTUNoB4wQvuYAlfd6kUVSEslwche0StYK2
	o5c+WcTujCFwDnOR3cRbrs3IU7ysuSwgUgPcWgV1dbvgWkmtYg47eE8ONkvb7DKtvFXkwsvukyadb
	Pe+hw5A6vWVZivIJiJ+DSD20LMXLpQPE5EqFd1RGdXnqPSKH9+x/TNSXTVVJ0ZOao+zx4CdO4YrIq
	D8DelQ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfLcT-00000000wIc-3tl7;
	Tue, 04 Feb 2025 16:17:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfLaN-00000000vyD-24lg;
	Tue, 04 Feb 2025 16:15:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 622955C5596;
	Tue,  4 Feb 2025 16:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BB94C4CEDF;
	Tue,  4 Feb 2025 16:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738685737;
	bh=QgWlamS94vS3vGAG/pHtXY7wtWDDLe5dqXG87XVePgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nhCQur0FfjxOhKL9RDst4vNpY75oEzasHNvW1DxWJb9hxojf+QTH08/wIYKNq8N5X
	 XrIU9Sep2NhtFQy68eXDok0cbGTwbQW6nvPwrY/v9cJYT6Ej+wkM0s0R4UtNraO7v+
	 +0WS+e/M73lWqGLPaJ/6/WGqt3X9taDK8svlXwmcDOcA1M2/E+oIjA0ry77UzDDcHl
	 qXcLAdS/1QN8mjLkgNbZQrIVFNJhr6GEO/fvwgJzco7CSHE2AwBAP2QKRT1Vo1d9ha
	 iBWJQcu2JYeXnhZc81WVqER23Abjam9VoJCIXjMMb18tmuPqRMyPzpX1SYAIMG6nhd
	 EmCCnKliXUC0w==
Date: Tue, 4 Feb 2025 17:15:35 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: Introduce more nodes to EN7581 SoC
 evaluation board
Message-ID: <Z6I9JzAVv3VjKOiE@lore-desk>
References: <20250201-en7581-dts-spi-pinctrl-v1-1-aaa4a9dfc4a6@kernel.org>
 <4656ae57-c6a1-48ac-a60f-72d7b988c307@kernel.org>
 <231c1f01-dea1-4c39-bbe1-cb629f7c109d@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EpiTytTZELGaMO09"
Content-Disposition: inline
In-Reply-To: <231c1f01-dea1-4c39-bbe1-cb629f7c109d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_081539_575788_DCBEFFF2 
X-CRM114-Status: GOOD (  18.27  )
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


--EpiTytTZELGaMO09
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 03/02/2025 17:04, Krzysztof Kozlowski wrote:
> >> +
> >> +		rng@1faa1000 {
> >> +			compatible =3D "airoha,en7581-trng";
> >> +			reg =3D <0x0 0x1faa1000 0x0 0xc04>;
> >> +			interrupts =3D <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> >> +		};
> >> +
> >> +		system-controller@1fbf0200 {
> >> +			compatible =3D "syscon", "simple-mfd";
> >=20
> > These are never allowed alone. I am pretty sure I added proper checks
> > which should point it out, so I think you did not really test your DTS.
> >=20
> > It does not look like you tested the DTS against bindings. Please run
> > `make dtbs_check W=3D1` (see
> > Documentation/devicetree/bindings/writing-schema.rst or
> > https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-s=
ources-with-the-devicetree-schema/
> > for instructions).
> > Maybe you need to update your dtschema and yamllint. Don't rely on
> > distro packages for dtschema and be sure you are using the latest
> > released dtschema.
> >=20
>=20
> Now I see Rob's report:
> arch/arm64/boot/dts/airoha/en7581-evb.dtb: system-controller@1fbf0200:
> compatible: ['syscon', 'simple-mfd'] is too short
> which confirms untested code. Schema is there for a reason. :(

actually I have tested them with the following command (but without W=3D1).

make CHECK_DTBS=3Dy DT_SCHEMA_FILES=3Dairoha airoha/en7581-evb.dtb

- dtschema 2024.11
- yamllint 1.35.1

With W=3D1 I can see more issues, I will fix issues in v2.

Regards,
Lorenzo

>=20
> Best regards,
> Krzysztof

--EpiTytTZELGaMO09
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ6I9JgAKCRA6cBh0uS2t
rIMyAP4uP2ubCPuXLcNH5JUy4qPhLnxjvsCqrv6WyRfdB6RAygEA2OwuGuOQUP10
1Az6VVla3vIb+KN0Ff+m+hHoFjADGgY=
=uAFD
-----END PGP SIGNATURE-----

--EpiTytTZELGaMO09--


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB5BC02194
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 08:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4pAWlKYQAsQwsC7GkBiYLNZ5M/vv7xcDnFC5tspjJOY=; b=JVdVX5qBefoPPiPRdFkOWOLQ9D
	sX0pyi/2RAuq7m9E9+hTdemDsZxT61iCFDrhkIUkTUwTcHDnuubgy6K2wehQAfWviZ6kt7gfZlYOT
	rjjWDagU0p194qH0Ly/spywKRXaUVqxbHQH3K3/cJKf/nPHiMhQx9mEFTMRhPf2qUUe5zHYHwYckN
	GwJ7UPtiVzl5tXWZVxzdgp7SNVYaw2GMOHz4L4fmzUC3KhWL/LcsfKvEl5BkgiXeiCdBeanSBB6xL
	pXdECd3Oe12iC3t8TalLT2MDmQrLzipuB9ZIevexrAyiXDxPk4BfBbuW2i39xsRxwCyYsyT1EBV0p
	Sae8ng1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfahB-00000002ZcY-1sHa;
	Wed, 05 Feb 2025 08:23:41 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfafo-00000002ZZy-4ANQ;
	Wed, 05 Feb 2025 08:22:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 05709A4324F;
	Wed,  5 Feb 2025 08:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D4BC4CED1;
	Wed,  5 Feb 2025 08:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738743735;
	bh=plWBqjVepzAuiutGiFeK2rxapKZ0OgBeLuxkv7ZfeeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SDvjgAmScUamgc00gwGEzO4oY3ekKdYGSYKdIR2SrFxIXDB632igGoIiMaTVQu/sj
	 emUbDY8yf1ri+4b/LnOKkxWyYzfl4SF6PB5YLhI7N+q4uTjTJgsbFj+JxmsacUJe0J
	 V5bJ27wRFwqS/P+L8rym6mmVIkaQEm/WKpNYhvuMUE2Li/xviItzCo4UMWfhjG+gRb
	 Mo7u0xA6SMty7kUwZtn6wQn04R5j5tuqg8SFQ10hcAX7UZJLN1kJTF2ge53U1KvQ9M
	 pO5Q0GPmz3VG05yiApvEY5/zYn9dbbBIW60JAHFE7MMs7QEdP9N/MLyND5no15GUSw
	 5cOKBYZS8LxIw==
Date: Wed, 5 Feb 2025 09:22:12 +0100
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
Message-ID: <Z6MftNE6JrbISVZH@lore-desk>
References: <20250201-en7581-dts-spi-pinctrl-v1-1-aaa4a9dfc4a6@kernel.org>
 <4656ae57-c6a1-48ac-a60f-72d7b988c307@kernel.org>
 <231c1f01-dea1-4c39-bbe1-cb629f7c109d@kernel.org>
 <Z6I9JzAVv3VjKOiE@lore-desk>
 <8b79700d-f628-4e65-b9a5-63bbc3958cc1@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LiQRrPQ3+vR+Xwkq"
Content-Disposition: inline
In-Reply-To: <8b79700d-f628-4e65-b9a5-63bbc3958cc1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_002217_172743_D0F5DE6D 
X-CRM114-Status: GOOD (  18.07  )
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


--LiQRrPQ3+vR+Xwkq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 04/02/2025 17:15, Lorenzo Bianconi wrote:
> >> On 03/02/2025 17:04, Krzysztof Kozlowski wrote:
> >>>> +
> >>>> +		rng@1faa1000 {
> >>>> +			compatible =3D "airoha,en7581-trng";
> >>>> +			reg =3D <0x0 0x1faa1000 0x0 0xc04>;
> >>>> +			interrupts =3D <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
> >>>> +		};
> >>>> +
> >>>> +		system-controller@1fbf0200 {
> >>>> +			compatible =3D "syscon", "simple-mfd";
> >>>
> >>> These are never allowed alone. I am pretty sure I added proper checks
> >>> which should point it out, so I think you did not really test your DT=
S.
> >>>
> >>> It does not look like you tested the DTS against bindings. Please run
> >>> `make dtbs_check W=3D1` (see
> >>> Documentation/devicetree/bindings/writing-schema.rst or
> >>> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree=
-sources-with-the-devicetree-schema/
> >>> for instructions).
> >>> Maybe you need to update your dtschema and yamllint. Don't rely on
> >>> distro packages for dtschema and be sure you are using the latest
> >>> released dtschema.
> >>>
> >>
> >> Now I see Rob's report:
> >> arch/arm64/boot/dts/airoha/en7581-evb.dtb: system-controller@1fbf0200:
> >> compatible: ['syscon', 'simple-mfd'] is too short
> >> which confirms untested code. Schema is there for a reason. :(
> >=20
> > actually I have tested them with the following command (but without W=
=3D1).
> >=20
> > make CHECK_DTBS=3Dy DT_SCHEMA_FILES=3Dairoha airoha/en7581-evb.dtb
> >=20
> > - dtschema 2024.11
> > - yamllint 1.35.1
> >=20
> > With W=3D1 I can see more issues, I will fix issues in v2.
>=20
> Rob's warning does not come from W=3D1. Your test cmd was incorrect: drop
> DT_SCHEMA_FILES. You must test your code against ENTIRE bindings, not
> some subset.

ack, thx for pointing this out.

Regards,
Lorenzo

>=20
> Best regards,
> Krzysztof

--LiQRrPQ3+vR+Xwkq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ6MftAAKCRA6cBh0uS2t
rIdRAP0T8iB3DoaOfZdbT+HBVFT7fwKaImgcPD/jY4Yf/Ldr8wEAoH7z/VszoODJ
1lATWykY0c7IScLhRndOZArIN8AeuAw=
=4f92
-----END PGP SIGNATURE-----

--LiQRrPQ3+vR+Xwkq--


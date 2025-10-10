Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A331CCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 14:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qPSsDU+826Mf+ug/L+tOLG1Ewipr/P5TUEUo63BxYh8=; b=CnMxj8OoXgy2w1m8lxnNEt0fOI
	jWYy/wBs8n8CZc+8dY492K78gEE8y4j1gfieBk4oXxA7wv09IyZQLwRgUMp0Ia5Lf3R483oXZth38
	kNEnkIpHGcdri2wJLbovM1HDgq52S1YM9JdaGMt1TSe2wFjQY0fvVR3a4XQBdLsqs+we14yqQ+Koh
	PUBiNASLQyJcXnI/wdPufHAIBbzrwwOzIkIVRDpRM0btDI/pSMM51hpmRCk2RjFMsxVN/CiShU/ck
	6ScFaJisbD91Jz8xl+ZyCHZl+w4KNyM7yrPPNKLsu/MNGKUcEtO5/khVG5CMmSBXOFZiYQx72K5nF
	ie3KX9Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7E3L-00000008gEh-3C3z;
	Fri, 10 Oct 2025 14:25:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7E3J-00000008gDP-0Wlm;
	Fri, 10 Oct 2025 14:25:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 175C84054C;
	Fri, 10 Oct 2025 14:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B95C4CEF1;
	Fri, 10 Oct 2025 14:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760106299;
	bh=J8sWNiOYxowlMW18nKVK3dVuYCRC461LwDkFzez3QWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MSVFSg2vVo6Qro2rAkelTcna3fSOk/InqEC682lBjaO6aUxpCzYZZ1GTMHsKmvPrt
	 Gxu0ZeJRfQ8KLnq6ESiLJ3SlKg0b2WASUYp61rSAdcvnJhFqHYuemfCY1gb68l0AK0
	 i7g5ImLxeGk7dHBJSikwNtgcif6LaIKdFNtBzW/TCtUv378L5CNDX3e7k4d0GdU9Yh
	 Lvh+9k9UVdOjfZ12gqGNDpAy2rx53lH0HKV3h6EBIzHpAKldoXMOZGHrbyK9vDjFOY
	 BQ4AwZxZBGkD5Kczt5wuQ4EutZ6+ogs5NjPFnMkl0vV2xpC6MgfbC7WvDh6cTumw8r
	 5yRKtyaI22KbQ==
Date: Fri, 10 Oct 2025 15:24:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: Re: [PATCH v7 16/17] dt-bindings: spi: airoha: add compatible for
 EN7523
Message-ID: <20251010-landscape-cavity-88a963e45a6b@spud>
References: <20251010033136.1475673-1-mikhail.kshevetskiy@iopsys.eu>
 <20251010033136.1475673-17-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rOjyNSm5a3C66cVt"
Content-Disposition: inline
In-Reply-To: <20251010033136.1475673-17-mikhail.kshevetskiy@iopsys.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_072501_264254_AFB92927 
X-CRM114-Status: GOOD (  16.34  )
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


--rOjyNSm5a3C66cVt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 06:31:35AM +0300, Mikhail Kshevetskiy wrote:
> Add dt-bindings documentation of SPI NAND controller
> for Airoha EN7523 SoC platform.
>=20
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

Please explain in the commit message why these two devices are not
compatible.

> ---
>  .../devicetree/bindings/spi/airoha,en7581-snand.yaml         | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/spi/airoha,en7581-snand.ya=
ml b/Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
> index b820c5613dcc..fdc5b0f920cc 100644
> --- a/Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
> +++ b/Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
> @@ -14,7 +14,10 @@ allOf:
> =20
>  properties:
>    compatible:
> -    const: airoha,en7581-snand
> +    enum:
> +      - airoha,en7523-snand
> +      - airoha,en7581-snand
> +
> =20
>    reg:
>      items:
> --=20
> 2.51.0
>=20

--rOjyNSm5a3C66cVt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaOkXNgAKCRB4tDGHoIJi
0ty4AP9HhsDk0a5+c83mF5LeHVZq0iCJQOUqAv/6o87d7uhvoAD/acsmShTBVTC4
ViX0nbl+U2XzHK+Yzxtl3YDx7XD8Owo=
=kctn
-----END PGP SIGNATURE-----

--rOjyNSm5a3C66cVt--


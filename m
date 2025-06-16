Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4386CC71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 17:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=abU1vQNEnzcEs0HbBDHBwuoOwKII4kXYKA5fV8FeR/4=; b=H5u/fgSGZ1Sfzj9OtvNOkz9Xq0
	2H/Z0bDH3avrBwiB9epDbFKg0p7/Ok+fGuOckvsmRQhqf2DeyZd+uVCOvzvyz2Es47oEUdYjvVMiR
	mB8uUPhkdUq7e2PptLWoHcFDbGCkJtqxMaD5DInHon7eS3HPewkmRbYmf8SdA34czpXWrP4bvU5rB
	0qhLX9LdkMhaieXtizP07QMjMJcvcbK7a1H44hk9+TKvD465Om6Ia8NyzWGsxv06VoqSICIkUjtTS
	o+Z0L5YSSUBPSPSxqZsSrqLDz5FP0BHzaDnNSXVl3TQJ+xM0wsoEuSIs84YEMqOIn2N4XymdRu4ps
	pWdSL59Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRDLN-000000054v1-2oHN;
	Mon, 16 Jun 2025 17:10:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRBYC-00000004o9p-1MVP;
	Mon, 16 Jun 2025 15:15:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D37FA5C624F;
	Mon, 16 Jun 2025 15:12:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9CD0C4CEEA;
	Mon, 16 Jun 2025 15:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750086907;
	bh=S01e6i/248142ZN8T1QwXvUAAnTI2Pm0YebVCw7eric=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qt6DkzSvMTZ2pDGD6PCVS11LpUE02bgSxx6mN5V/nvlZgNsarKHguqkC4KcmcE2q2
	 dXMo1u9wvwAGu4LZt0pJq20fIykloL6HNR1DK0fB2xERYlirsiknDHLcCQ1J3+vfUm
	 NQBZpdOjWkZjT36MsYxXlvCTvETWKTlvpTL8caXCtAN9GS1oNxM9trTaEexaHjWjTC
	 V0uu9MNA+hJhTMnOtlaoXyHOZK/aTrmB+92CjX/VNw1W9iiYEU8y3rQQCCG8IImhg0
	 XFg3D8f7LE3Jn32Ek3OG/y9wcJtKOld5QF7frs2hYx6MbJp8QZFDq7HQNFI74c4cmQ
	 n5L7gejiKda7w==
Date: Mon, 16 Jun 2025 16:15:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
	mchehab@kernel.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH 1/5] dt-bindings: vendor-prefixes: Add Verisilicon
Message-ID: <20250616-cold-dingy-7a3112a52273@spud>
References: <20250616145607.116639-1-benjamin.gaignard@collabora.com>
 <20250616145607.116639-2-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8nOZplPpgsff+FjY"
Content-Disposition: inline
In-Reply-To: <20250616145607.116639-2-benjamin.gaignard@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_081508_414439_BA3E41A2 
X-CRM114-Status: GOOD (  14.14  )
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


--8nOZplPpgsff+FjY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 04:55:49PM +0200, Benjamin Gaignard wrote:
> Verisilicon Microelectronics is a company based in Shanghai, China,
> developping hardware blocks for SoC.
>=20
> https://verisilicon.com/
>=20
> Add their name to the list of vendors.
>=20
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index 5d2a7a8d3ac6..1baf8304c9ac 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1635,6 +1635,8 @@ patternProperties:
>      description: Variscite Ltd.
>    "^vdl,.*":
>      description: Van der Laan b.v.
> +  "^verisilicon,.*":
> +    description: VeriSilicon Microelectronics
>    "^vertexcom,.*":
>      description: Vertexcom Technologies, Inc.
>    "^via,.*":
> --=20
> 2.43.0
>=20

--8nOZplPpgsff+FjY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFA09QAKCRB4tDGHoIJi
0ghsAP0R8V9T4k3Bxyhe/X3aEh32l4IHKw5Cn9bsimUNs+RG8AEAg2TMoYlnM6jW
L6gXbFxHvE9paMA6qFOLCYdHw86GVAo=
=Lgt1
-----END PGP SIGNATURE-----

--8nOZplPpgsff+FjY--


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91850C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 16:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zq+whcMwdMCqXRt3nHkuc4AuAgF122eOPTne255Gd8M=; b=4dM6UA7eyt0TLQ5WsgAnz4H+/+
	pzmAjR9e56kCIYEx4RNXUGhkMEoHjg+fvuy1t3CyEXR3SaAiiE3waVJhlQzAUXSt8O1FWg7W5ObLG
	hCcjJyZMMPCBisNci5IeB9/GDs0Phm1rtVVOZIbjjO02k1kgubHSZVXlcSg3nV3LGtI38ETBf77l4
	KsXKtdI3kVKmIQqYhIHe5jgnGK0wJCj1JdmFm3inSHJxLMhl3PSbo/7U4rVJNwmdOXmy+kxL0EW9i
	FQiMHuygsUAEdCMFkZ93DeOnz4KJGPa3G8xjPH2Y1OUbvSbX6iZedvs3pyY2CWrGl6L92iDF/XQRe
	0rjD8/iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL29T-000000015jk-1l2d;
	Fri, 30 May 2025 16:00:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL26p-0000000153G-1d56;
	Fri, 30 May 2025 15:57:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A7706115E;
	Fri, 30 May 2025 15:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D68C2C4CEE9;
	Fri, 30 May 2025 15:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748620646;
	bh=hZHDiYBG1Y1HUlzoNGnJPAo5du46tcOG49Tcr3RVSvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ikYMHjijfZBls/jp41L/O8ESIo1EqOSIcMUkBhMMZhMaTgtLyMxFsYbWZvZiMNEmu
	 JbOD2pJjpPqAf073kbNKifC+WKIo5S6VmgBtRWQwqBogxxgGcDFLSU7u8JJnY0EX1Z
	 Peg3Yv0Emf9ZRv6+9E+2PL4oruJyA6hrMC8oRThFV6vDPxwfU6W0UimBh4Pbv2nUlp
	 tJyD2k2f7fOEdi6ITdKPuBg1DawIRVFLSQ8X0hhnB5uoh/j9KSbf/98u6irEU/VRSU
	 WQpmtxsGsJTKWsThr8t2If8v76mHvPxx+TqXSgs0Wu3pohUc3o1I5ckwNtOCq+TlV6
	 IxUgYKde4CwRw==
Date: Fri, 30 May 2025 16:57:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jia-Wei Chang <jia-wei.chang@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [RFC v1] dt-bindings: interconnect: add mt7988-cci compatible
Message-ID: <20250530-naturist-swept-973a1f8f4b08@spud>
References: <20250528135251.6492-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wlJGDMBTc856vNFG"
Content-Disposition: inline
In-Reply-To: <20250528135251.6492-1-linux@fw-web.de>
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


--wlJGDMBTc856vNFG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 03:52:49PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
>=20
> Add compatible for Mediatek MT7988 SoC with mediatek,mt8183-cci fallback
> which is taken by driver.

What's RFC about the patch?

>=20
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  .../bindings/interconnect/mediatek,cci.yaml          | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/interconnect/mediatek,cci.=
yaml b/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
> index 58611ba2a0f4..2c6785c588e9 100644
> --- a/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
> +++ b/Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
> @@ -17,9 +17,15 @@ description: |
> =20
>  properties:
>    compatible:
> -    enum:
> -      - mediatek,mt8183-cci
> -      - mediatek,mt8186-cci
> +    oneOf:
> +      - items:

This "- items:" is redundant.

> +          - enum:
> +              - mediatek,mt8183-cci
> +              - mediatek,mt8186-cci
> +      - items:
> +          - enum:
> +              - mediatek,mt7988-cci
> +          - const: mediatek,mt8183-cci
> =20
>    clocks:
>      items:
> --=20
> 2.43.0
>=20

--wlJGDMBTc856vNFG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDnVYAAKCRB4tDGHoIJi
0i+UAQCTTLJpyhXbrf/dTa8U43yhnq5ItBZMUPXZ1/O5ePbQigEAq4UB18R67FR0
qNKjVg68sWCN+sXou9O3+mRNTSkosgU=
=FvmH
-----END PGP SIGNATURE-----

--wlJGDMBTc856vNFG--


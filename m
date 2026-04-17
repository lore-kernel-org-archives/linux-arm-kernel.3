Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00913F436BB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 16:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihPTuPmxQbzOZabEiSOP+b2ty6xmgOUmbLPAXSYXs5s=; b=qZHOaiTsgPDTeN+yCscLpvVCAi
	hf5rPjxAWoquQlJNuB3gYHj02wdmRP8VdOPYN4RczcCc2DPQlPqQRIByTJICa4EojbFhAUnjaEzhT
	sXhq4KDhNtUoD/8QlfdqhshxRVGSbshZZ/neGQys19bcRl0nhy6aCEku1U/Kqmg3r2k+EksenAoXg
	05oy+YTnsDtFWTq93hJOW2wOU+v5EKKAyDwmLqpJvKlY3XV9ej/KpCN0Nh7dSQBMxWMk5T13GNgoF
	Ks20j0mnKz6x1GIrI5O06f2K2ExVn4awKzEucceUJKDjyx6oSZUJPVXQTraonhhMXO+L4lLhB6DqA
	yqrNdSRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDlxM-00000004G7x-0Beb;
	Fri, 17 Apr 2026 16:22:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDlxK-00000004G7n-1lAq;
	Fri, 17 Apr 2026 16:22:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7BBB760139;
	Fri, 17 Apr 2026 16:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 164A1C2BCB4;
	Fri, 17 Apr 2026 16:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776442929;
	bh=egW6uHF4eK85Hi/etR9aA8Lh7/2sOL+cwSmZ8PG8Gr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oAjE8slqT10r02Jkq/UXK6Kdkj3JB5VRdtK1k8ORy64oM77yRDN7qbQIKATWgsBN9
	 +fFnVE+KdJzN2hV07uY06YSdkRVq9BNCLIXZnMagW1/zEM3zLHV6AIWjLqS7WJ0/GB
	 jBbbvtgOljpAv+rS/hfMJR9TdU29LnbWcUMh1Jj5579VKSwMsE5yiJyDfxn8lMF3Ce
	 LxH+hlSq9mfuiR0u91ZZ1Mxuvd4VYcRGW8Ch65vw5mgftnDUK+8YYALFEWrfScN36A
	 COqa+LZTJWJSIA7Vf+rkptt0/xKAF7ocTbGkZ5/Ng6ycUkLHFi2Z1d1/KO+r2aQkRW
	 +aMGlDsy+4ZCw==
Date: Fri, 17 Apr 2026 17:22:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Jianhua Lin <jianhua.lin@mediatek.com>
Cc: nicolas@ndufresne.ca, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	sirius.wang@mediatek.com, vince-wl.liu@mediatek.com,
	jh.hsu@mediatek.com
Subject: Re: [PATCH v7 1/3] dt-bindings: media: mediatek-jpeg-decoder: add
 MT8189 compatible string
Message-ID: <20260417-steersman-scowling-1b8923c3d6fc@spud>
References: <20260417100519.1043-1-jianhua.lin@mediatek.com>
 <20260417100519.1043-2-jianhua.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SI+6e7v0m6f8SmPK"
Content-Disposition: inline
In-Reply-To: <20260417100519.1043-2-jianhua.lin@mediatek.com>
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


--SI+6e7v0m6f8SmPK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 06:05:17PM +0800, Jianhua Lin wrote:
> Add the compatible string for the JPEG decoder block found in the
> MediaTek MT8189 SoC.
>=20
> Compared to previous generation ICs, the MT8189 JPEG decoder requires
> 34-bit IOVA address space support and only needs a single clock
> ("jpgdec") instead of two. Therefore, it is added as a standalone
> compatible string without falling back to older SoCs.
>=20
> Update the binding schema to include the new compatible string and add
> an `allOf` block with conditional checks. This enforces the single clock
> requirement for MT8189 while preserving the two-clock requirement
> ("jpgdec-smi", "jpgdec") for older SoCs.
>=20
> Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
> ---
>  .../bindings/media/mediatek-jpeg-decoder.yaml | 48 +++++++++++++++----
>  1 file changed, 40 insertions(+), 8 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decode=
r.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> index a4aacd3eb189..fd895688a038 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> @@ -15,10 +15,10 @@ description: |-
>  properties:
>    compatible:
>      oneOf:
> -      - items:
> -          - enum:
> -              - mediatek,mt8173-jpgdec
> -              - mediatek,mt2701-jpgdec
> +      - enum:
> +          - mediatek,mt2701-jpgdec
> +          - mediatek,mt8173-jpgdec
> +          - mediatek,mt8189-jpgdec
>        - items:
>            - enum:
>                - mediatek,mt7623-jpgdec
> @@ -32,13 +32,20 @@ properties:
>      maxItems: 1
> =20
>    clocks:
> +    minItems: 1
>      maxItems: 2
> -    minItems: 2
> =20
>    clock-names:
> -    items:
> -      - const: jpgdec-smi
> -      - const: jpgdec
> +    oneOf:
> +      - items:
> +          - const: jpgdec
> +      - items:
> +          - const: jpgdec-smi
> +          - const: jpgdec
> +
> +  mediatek,larb:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: a phandle to the smi_larb node.

This should be restricted to only the new platform.

> =20
>    power-domains:
>      maxItems: 1
> @@ -60,6 +67,31 @@ required:
>    - power-domains
>    - iommus
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8189-jpgdec
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 1
> +          maxItems: 1

Constraints that duplicate the outtermost ones don't need to
be/shouldn't be repeated here. You only need the maxItems here and the
minItems in the else.

pw-bot: changes-requested

Cheers,
COnor.

> +        clock-names:
> +          minItems: 1
> +          maxItems: 1
> +      required:
> +        - mediatek,larb
> +    else:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +        clock-names:
> +          minItems: 2
> +          maxItems: 2
> +
>  additionalProperties: false
> =20
>  examples:
> --=20
> 2.45.2
>=20

--SI+6e7v0m6f8SmPK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeJeKwAKCRB4tDGHoIJi
0kqgAP97U/dCLPVLSL5QUuwO1PDi3nC/QrG3oONPZ0qzcA0Q5gEA41YDuwB2x+5b
Kaq5lytA+wheHyQALeOAnjtKDlX3RgA=
=5MTH
-----END PGP SIGNATURE-----

--SI+6e7v0m6f8SmPK--


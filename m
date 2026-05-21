Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A92CCD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 20:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mR7/bge6JcX24xjulaB5vvJqpecE2qhCKlDej64wNVc=; b=Y4BSGtcJBvgGrY2jcgSy21iiRx
	epF0zQfSUAm3qD+peQrxgebEfBsaoTc9/3isKvRHXM/SXH6QW1BHDoKuCbcAUA/suKPRRZavwZyea
	thdNE1NBttf1oXTlxoiGHR4zbMHT0aGWlyge1EEmByjX14DnqwCK8WSfTJ3kwRj1VW71sLeZ6Lf3j
	TaeMZrpIz7yyQrRhGx/tGO/Xfbq4lUTR2YX2WRUp+wTrp2hcIBGK0a/GdDBgvskLjFLWq1nS1or02
	Ek7nZkN0yzYob+1TcQttypiWgqHYx2Nra017gxrtmkfXSuDDhTESK/MoDzdtRsL9DRmOpbX56KRMd
	3yLf09Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ9yS-000000090tB-1Tvh;
	Thu, 21 May 2026 20:26:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ9yQ-000000090so-2vM4;
	Thu, 21 May 2026 20:26:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 63BF160138;
	Thu, 21 May 2026 20:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 767E31F000E9;
	Thu, 21 May 2026 20:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779395189;
	bh=mR7/bge6JcX24xjulaB5vvJqpecE2qhCKlDej64wNVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Lwvm4EBQPc2T68E60wfFJqRqq2TPk7TNTo9++A1sbAr8w0yOwyMWu5zNYmPcBPsLE
	 GC6N7r998f4JX1yEUTKdLPneuGhr8xRQBJrIXggVJgr2b5Crzg8/l++N9Mjhw8mfsF
	 S5C7rJ/mqFdtchY2OduLmlAyTQhJH0XHsP+r5KwiyCcn23BHKbqx1SJZsRAc/FcAhs
	 cYq/pxd+9Gzf86uaQhJUh4x0pTEVG+uuv6qDeZ3UV23pAZJaykDSML3LFBUpvWraYG
	 vyM83L+fJjk3jfq+HGVfDgKcM8v0/Q73Ladt7fPQ3c1LlSGdv2GcZ+TfDcLhu1kdQD
	 fFHmiFRvT0PSA==
Date: Thu, 21 May 2026 21:26:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Arnab Layek <arnab.layek@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, andersson@kernel.org,
	mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v4 1/1] dt-bindings: remoteproc: mtk,scp: Allow multiple
 memory regions for MT8188
Message-ID: <20260521-rarity-degree-4d5ae12b6fd0@spud>
References: <20260520112629.3420612-1-arnab.layek@mediatek.com>
 <20260520112629.3420612-2-arnab.layek@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KMuahv1k41CftHWI"
Content-Disposition: inline
In-Reply-To: <20260520112629.3420612-2-arnab.layek@mediatek.com>
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


--KMuahv1k41CftHWI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 07:26:29PM +0800, Arnab Layek wrote:
> The MT8188 SCP can use either one or two reserved memory regions:
> - Required: Main SCP SRAM memory region (mandatory for SCP operation)
> - Optional: SCP L1TCM memory region (Level 1 Tightly Coupled Memory,
>   used for performance optimization when available, but not required
>   for basic SCP functionality)
>=20
> Other MediaTek SoCs (MT8183, MT8186, MT8192, MT8195) use only a single
> memory region and must remain restricted to one region for backward
> compatibility.
>=20
> Update the base schema to allow 1-2 memory regions (minItems: 1,
> maxItems: 2), following the pattern used by other MediaTek dt-bindings
> like mediatek,vcodec-encoder.yaml where the base property defines a
> permissive range accommodating all device variants.
>=20
> Add two conditionals:
> 1. Explicitly restrict non-MT8188 devices to maxItems: 1
> 2. Document MT8188's two regions with descriptions (minItems: 1 makes
>    the L1TCM region optional, allowing boards to specify 1-2 regions
>    based on hardware configuration)
>=20
> This approach maintains backward compatibility while enabling MT8188 to
> specify 1-2 memory regions depending on board design and performance
> requirements.
>=20
> Signed-off-by: Arnab Layek <arnab.layek@mediatek.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

Cheers,
Conor.

> ---
>  .../bindings/remoteproc/mtk,scp.yaml          | 45 ++++++++++++++++++-
>  1 file changed, 43 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/=
Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index bdbb12118da4..fca9b0675eae 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -55,7 +55,8 @@ properties:
>        initializing SCP.
> =20
>    memory-region:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> =20
>    cros-ec-rpmsg:
>      $ref: /schemas/embedded-controller/google,cros-ec.yaml
> @@ -123,7 +124,8 @@ patternProperties:
>            initializing sub cores of multi-core SCP.
> =20
>        memory-region:
> -        maxItems: 1
> +        minItems: 1
> +        maxItems: 2
> =20
>        cros-ec-rpmsg:
>          $ref: /schemas/embedded-controller/google,cros-ec.yaml
> @@ -205,6 +207,45 @@ allOf:
>            items:
>              - const: cfg
>              - const: l1tcm
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - mediatek,mt8183-scp
> +            - mediatek,mt8186-scp
> +            - mediatek,mt8192-scp
> +            - mediatek,mt8195-scp
> +            - mediatek,mt8195-scp-dual
> +    then:
> +      properties:
> +        memory-region:
> +          maxItems: 1
> +      patternProperties:
> +        "^scp@[a-f0-9]+$":
> +          properties:
> +            memory-region:
> +              maxItems: 1
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - mediatek,mt8188-scp
> +            - mediatek,mt8188-scp-dual
> +    then:
> +      properties:
> +        memory-region:
> +          minItems: 1
> +          items:
> +            - description: Main SCP SRAM memory region
> +            - description: Optional SCP L1TCM memory region
> +      patternProperties:
> +        "^scp@[a-f0-9]+$":
> +          properties:
> +            memory-region:
> +              minItems: 1
> +              items:
> +                - description: Main SCP SRAM memory region
> +                - description: Optional SCP L1TCM memory region
> =20
>  additionalProperties: false
> =20
> --=20
> 2.45.2

--KMuahv1k41CftHWI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCag9qcAAKCRB4tDGHoIJi
0rcRAQCLjBxasDXV57xfl5XfSkQ3fL4xZ8EJcvOKXBI9aa0ZWgD+LTstcSvBjZQz
vpMsjWdsvrPrK8D0qh0BwR+7yr+7OgY=
=QOd/
-----END PGP SIGNATURE-----

--KMuahv1k41CftHWI--


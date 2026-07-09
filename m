Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6C5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 17:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LRJ1/OPtx1Iim/kW87V48kJYVXQps8lsYFvlD6icIBk=; b=TT0jybE+eGY7X6QIMP0AXw4OKr
	K9VebulG0/hRccsZRckdXdGGEztYBqck5qlzl64t5n6519eCqi2NhmbQYS2ozjE+MM6jElJ18bbjj
	ZjztZrjg5TC89n8DAuvQPK/zlthWfZUX3fWkqSM51dANNpSl6laBXJaaGDm1LhDuENItXjQOb62um
	GZ7Qo5EISrdom80DpoFdlNAxHFWMoEz/KpuVCNb5nPSeEHtvZurT1QU0AzWuthBP/VwlJecuMQWxF
	Bcgs+xETOMaD+qd4BKw/5Qqn63GDN06J+y5/1AhSp5xhVhde8REXnCCaGb1/gDS+/EgysYcfFZWJT
	Jbg387Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wht0g-00000003BLs-0fBg;
	Thu, 09 Jul 2026 17:58:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wht0f-00000003BLR-0lAL;
	Thu, 09 Jul 2026 17:58:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 67C666137D;
	Thu,  9 Jul 2026 17:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01AC81F000E9;
	Thu,  9 Jul 2026 17:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783619884;
	bh=LRJ1/OPtx1Iim/kW87V48kJYVXQps8lsYFvlD6icIBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n5I29HUiseWe37yvndAIEuS+lV5BsGhqvU4NXd/jsX4v+r7Ie4rxuX3TpupyHDj9W
	 sO04Mvgsk4+I0mSKt1FUxmbhmTIVqiYF2YuAbrRVUbnkGuh318xOJ6VgGlrXBXJlKl
	 mvb3uq4IdESiEZFShCt+6VGLmPb3IHD3rDIqUPOprQ1XcjptaeQFINqAE/SXvmm57R
	 98mark9lO/9yMWXUQETpA1Ty5RNwQhLJpCoCSrgP3WqqspWlcLBXvvgY0UtzA90Sq+
	 vANLKuP/VbEPkgC2MfgJx1nx1hvaxGtUyPjN6YdNw/MKdZWZM8iJimjAsqQa7+ELU1
	 C181nltTPgCuQ==
Date: Thu, 9 Jul 2026 18:57:59 +0100
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
Subject: Re: [PATCH v9 1/3] dt-bindings: media: mediatek-jpeg-decoder: add
 MT8189 compatible string
Message-ID: <20260709-octane-refold-37324d9f2aad@spud>
References: <20260709032657.25730-1-jianhua.lin@mediatek.com>
 <20260709032657.25730-2-jianhua.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="APjTtQgaMDz/nB9h"
Content-Disposition: inline
In-Reply-To: <20260709032657.25730-2-jianhua.lin@mediatek.com>
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

--APjTtQgaMDz/nB9h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 09, 2026 at 11:26:54AM +0800, Jianhua Lin wrote:
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
>  .../bindings/media/mediatek-jpeg-decoder.yaml | 49 ++++++++++++++++---
>  1 file changed, 41 insertions(+), 8 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decode=
r.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
> index a4aacd3eb189..13fb4fb61f2b 100644
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
> @@ -32,13 +32,16 @@ properties:
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
> =20
>    power-domains:
>      maxItems: 1
> @@ -51,6 +54,15 @@ properties:
>        Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for de=
tails.
>        Ports are according to the HW.
> =20
> +  mediatek,larb:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |
> +      A phandle to the local arbiter (SMI LARB) node. This explicitly
> +      describes the hardware topology where the JPEG block is connected
> +      to a dedicated SMI LARB for memory bandwidth arbitration. It is
> +      required to accurately represent the hardware connection independe=
ntly
> +      of the IOMMU.
> +
>  required:
>    - compatible
>    - reg
> @@ -60,6 +72,27 @@ required:
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
> +          maxItems: 1
> +        clock-names:
> +          maxItems: 1
> +      required:
> +        - mediatek,larb
> +    else:
> +      properties:
> +        clocks:
> +          minItems: 2
> +        clock-names:
> +          minItems: 2

Please add a mediatek,larb: false here too.

pw-bot: changes-requested

Thanks,
Conor.

> +
>  additionalProperties: false
> =20
>  examples:
> --=20
> 2.45.2
>=20

--APjTtQgaMDz/nB9h
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak/hJgAKCRB4tDGHoIJi
0sywAP4/3MErasyHV912BqopkkvO7NXQwYknCYOiZVu8kxtNtwD+Kqr61fQW/M2k
AvZSQrEqRK2jJ144zH8+IVUJ/w6DxQc=
=STFS
-----END PGP SIGNATURE-----

--APjTtQgaMDz/nB9h--


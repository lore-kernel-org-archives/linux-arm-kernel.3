Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D891CD4840
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 16:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VUhpsjQrH/mckZs2t7/2owZF+Xb+aJbtam5fG6bKFfw=; b=wmnbBIrri8iC2xXeXvVPdKHRBQ
	U+W4D2O3u32/jQNTjaDzh2AmiNa+ZbHRTnRfcqbTWWJYOw9EovSK8iEJpZEymYjNBp/8rP2e3cr+S
	D5WaxutC25BopHUA2TYcLow7YyUh5nY4FFjkbE09vul5L/VYQna8rUC+2q6qHCkrcbM4Wfy/VUREh
	jZ8k68vNjRx3DC7HF7c5zF3wCpPKK88WkI6rt7bTwM+uKcSWhZT0bwolRglE/4d6nhhOO+KGAA7CK
	MV4gN7RSRsz03mjKXSc8qSJdQa1LnD10xnEfeR400BcR7SwoBVQ3FIOsa1hvbH0wP4tKo5zWYRPE7
	uAAHGrcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTU3-0000000ECfE-1xro;
	Mon, 11 May 2026 16:27:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMTU2-0000000ECem-1k6v;
	Mon, 11 May 2026 16:27:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D9AB860120;
	Mon, 11 May 2026 16:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05BBCC2BCB0;
	Mon, 11 May 2026 16:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778516873;
	bh=V0wLh5KRspfOQ3ibRR/1QYF8R6kmly0cfDdqmRIJqvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gcmyAxHAKFs6NB3meRHb14KoC6R9ksltSt15rHaXzZGZv3SOCwBupe3Q67oel5/qb
	 hMr4Q0I75R456Sean1nvn2ql0Nv/q/NKL/jC1Hsco3Td8/+uB0HIRTYeq1wy0KrVHJ
	 3/xT33SBXpz13eLPMF9CcEKP3UbhDX0t0qEsmzSwishRclNtw88eAZH0nIxnaQR+ZU
	 zcWleaZH9FTxJde+jDXQPhnFBFqhtk2GlcNAMgH2dy86LrHK8hQoXO7MctjL4zMFAs
	 nGFoSEGnTTLKfHtSopIXrClD54+3IG/wR+B8JApKw0cuRc2f1RMh0qrGp9PxIaBOal
	 zRUinbWJtU2Qg==
Date: Mon, 11 May 2026 17:27:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Arnab Layek <arnab.layek@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 1/1] dt-bindings: remoteproc: mtk,scp: Allow multiple
 memory regions for MT8188
Message-ID: <20260511-uncouth-pandemic-080dccd30f4b@spud>
References: <20260506133157.3283204-1-arnab.layek@mediatek.com>
 <20260511121004.2984149-1-arnab.layek@mediatek.com>
 <20260511121004.2984149-2-arnab.layek@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Cth8D7RmP7y3OUje"
Content-Disposition: inline
In-Reply-To: <20260511121004.2984149-2-arnab.layek@mediatek.com>
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


--Cth8D7RmP7y3OUje
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 08:10:04PM +0800, Arnab Layek wrote:
> The MT8188 SCP requires two reserved memory regions:
> 1. Main SCP SRAM memory region (required)
> 2. SCP L1TCM memory region (optional, for additional memory)
>=20
> Some other MediaTek SoCs only use a single memory region. This patch adds
> a conditional schema using if/then to allow 1-2 memory regions
> specifically for mediatek,mt8188-scp and mediatek,mt8188-scp-dual
> compatibles, while keeping the default maxItems: 1 for other
> SoCs.
>=20
> Each memory region is documented with descriptions to
> clarify their purpose, following the pattern used in other bindings.
>=20
> Signed-off-by: Arnab Layek <arnab.layek@mediatek.com>
> ---
>  .../bindings/remoteproc/mtk,scp.yaml          | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/=
Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> index bdbb12118da4..df13be2026a6 100644
> --- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
> @@ -205,6 +205,27 @@ allOf:
>            items:
>              - const: cfg
>              - const: l1tcm
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

Does this even work, given that memory-region has maxItems: 1 outside
the conditional section?

Cheers,
Conor.

> =20
>  additionalProperties: false
> =20
> --=20
> 2.45.2
>=20

--Cth8D7RmP7y3OUje
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagIDhAAKCRB4tDGHoIJi
0l1KAP4ogMR4hY4vl2iFHrcWq1THHYzittMIqmeoOyXVWNsTAAEAuFti4lcrCBUc
+MZz9rCNT0pG273MQ05Xxrr/JE7IJgc=
=tkTv
-----END PGP SIGNATURE-----

--Cth8D7RmP7y3OUje--


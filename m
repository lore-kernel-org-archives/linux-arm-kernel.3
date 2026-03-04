Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7125EB7ED3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 11:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLONteymYF3A1QUrNDVoPVPwVgsPF0G8apSYLaWLt0Q=; b=H8YLppIAHqzxFcfjjIef6UPx6w
	cDNTi72lC6KhMshbkoD/THAU5LZJs3VkUR1+M04Q0Nz77MA8TycHI9Pka0PF5C3wLrF4jaZ5JoGdx
	QHxp2gKYQ6iTpICIAIETVxU/VYeLC7fFzrsTKYdsTWooeQz9UJI1hWqCgO1X8Y87W2acXWdP7DTl2
	XqkCyToQuleHySkLZRKj19ByzepHDizHXePNCIr7N4ddou/+CffjAD2ZmC4Sq4pg+3XbXK5blPZW3
	bH5V/L8HNS5xfDkffZIMWhG5h8HTc3kon/yPoNd+61MMG6ZoEb4SkdEbhBE/eABBSYBTMOAwWHpwQ
	sNTg252g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxkV8-0000000H6BG-0qCk;
	Wed, 04 Mar 2026 11:34:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxkV6-0000000H6Ar-0bk9;
	Wed, 04 Mar 2026 11:34:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8177043A94;
	Wed,  4 Mar 2026 11:34:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F1FC19423;
	Wed,  4 Mar 2026 11:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772624087;
	bh=8ynUVUDyth5bSt/By20k6bJWU9I97gy1nrt2iENQfHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P8pZhTA6EhprRj40CnGqbIRNhfj1qcvYxaVvXz9neh16grGyd57KyQXsPDmzkzyzd
	 pyo4tgOInkzbL1RPptLdgqPHLZ9pFvN2R/rO4nQy0pivE3AGYgBC5A7UST7SRpGAmO
	 auQa8sQp/G8i0Wd6U9qmRYUJyI697qHud/eii+OZ4YG+RthlAqAP3V2I+FCJttXueO
	 c346ig/LwSV5U81xG8gs34KXaYaPW4/HeaWYtlYqYi4hajinmEBduJjQCosAgX5jmx
	 dgTgYGycoZ7lEzPR84ocX84KLvrUVxYrCMa2+eE1u8vTE0CTkHpgLuf4/Il2MZw/Dv
	 rdtWvNpCZLndQ==
Date: Wed, 4 Mar 2026 12:34:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Olivia Mackall <olivia@selenic.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@mediatek.com>, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: rng: mtk-rng: add SMC-based TRNG
 variants
Message-ID: <20260304-defiant-echidna-of-examination-b1e798@quoll>
References: <04622e0bc917aed4145a9a3b50b61f343fc89312.1772585683.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <04622e0bc917aed4145a9a3b50b61f343fc89312.1772585683.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_033448_210178_8514C3BA 
X-CRM114-Status: GOOD (  13.12  )
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

On Wed, Mar 04, 2026 at 12:55:27AM +0000, Daniel Golle wrote:
> diff --git a/Documentation/devicetree/bindings/rng/mtk-rng.yaml b/Documentation/devicetree/bindings/rng/mtk-rng.yaml
> index 7e8dc62e5d3a6..6074758552ac3 100644
> --- a/Documentation/devicetree/bindings/rng/mtk-rng.yaml
> +++ b/Documentation/devicetree/bindings/rng/mtk-rng.yaml
> @@ -11,12 +11,15 @@ maintainers:
>  
>  properties:
>    $nodename:
> -    pattern: "^rng@[0-9a-f]+$"
> +    pattern: "^rng(@[0-9a-f]+)?$"
>  
>    compatible:
>      oneOf:
>        - enum:
>            - mediatek,mt7623-rng
> +          - mediatek,mt7981-rng
> +          - mediatek,mt7987-rng
> +          - mediatek,mt7988-rng

Not compatible with each other?

>        - items:
>            - enum:
>                - mediatek,mt7622-rng
> @@ -38,9 +41,22 @@ properties:
>  
>  required:
>    - compatible
> -  - reg
> -  - clocks
> -  - clock-names
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          not:

Use rather positive list, so drop "not:" and use cntains for only one
compatible - mediatek,mt7623-rng.

> +            contains:
> +              enum:
> +                - mediatek,mt7981-rng
> +                - mediatek,mt7987-rng
> +                - mediatek,mt7988-rng
> +    then:
> +      required:
> +        - reg
> +        - clocks
> +        - clock-names
>  
>  additionalProperties: false
>  
> @@ -53,3 +69,7 @@ examples:
>              clocks = <&infracfg CLK_INFRA_TRNG>;
>              clock-names = "rng";
>      };
> +  - |
> +    rng {
> +            compatible = "mediatek,mt7981-rng";

Use four spaces for indentation.

> +    };
> -- 
> 2.53.0


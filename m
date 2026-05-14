Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16810CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 12:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sPIYUVBUYaEU2ZhC6plQdg5cDxGwIYWVjNhmGLypg3w=; b=G4l0KJPuPcju4z+mzUhInt6Yh3
	fZEfcTv1VKEbVw7XLdxJZJq9wlHjC43Wx3kMKJ7bkL+KIo7nEcSE46JWWAAwYzSfln+qMq751gj0j
	zovdzGXZHPbchBWo1hbEhF0gJvKvahoxSEiXMj5B+oZdz9AKrvf708ueB8EUL1pnXEI3CzL/9FwAw
	U+HZyxI314BrV0CvOL1NXiVbzDTFb+xgGzRVH9ihfm3E6Np5xXjoRcAyCPB265HIbAQk91UGdlaJd
	dAUweUinJoHB3xTQeGLi3gw5keufurPwzwbbb6gVSpF7+0yHId4P06IGbub1PFu1RydlNk0/5u8R6
	IyvzDWLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVBk-00000005SGK-1Gn7;
	Thu, 14 May 2026 12:29:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVBj-00000005SG0-1Bal;
	Thu, 14 May 2026 12:29:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B9186012B;
	Thu, 14 May 2026 12:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82E94C2BCB3;
	Thu, 14 May 2026 12:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778761754;
	bh=qOWbOvqHMaeYwiDsyg5AN0nnqLfamVFB2hHGFVZd/pE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GTnbsWpzLvrGR+7jaAiWkc30RibULgmzzDGxmo57IvbRhPrFATtFElhSiiDLqeYKd
	 6/5tRP06GN+ENFWoo8gasw+Fc+86hA3xGqw6Oq2mIESRWek8HX0/NRS4TmktTH6wL8
	 HFr/OlbxOtW/q4rj03rUM8AKSdAw6KzKKQdS3I6B/KP5cOODlW5CZwgnTQLvBZSkXz
	 iHxBU17+9nJ+4sTrlpUGuiEB6V/6A4sJ8a5cEZvAScknfoHFpgxs/KZ11rn7g4gOVT
	 4DTNXiquD2CA6sr/FbisgTfO4NZBTbqGdI6N7nQRya7m4/5SXjR5r/YA+H9yJWrJtp
	 SIH8cVqmQuf+Q==
Date: Thu, 14 May 2026 14:29:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnab Layek <arnab.layek@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 1/1] dt-bindings: remoteproc: mtk,scp: Allow multiple
 memory regions for MT8188
Message-ID: <20260514-shiny-woodoo-saluki-1b07d3@quoll>
References: <20260506133157.3283204-1-arnab.layek@mediatek.com>
 <20260511121004.2984149-1-arnab.layek@mediatek.com>
 <20260511121004.2984149-2-arnab.layek@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Mon, May 11, 2026 at 08:10:04PM +0800, Arnab Layek wrote:
> The MT8188 SCP requires two reserved memory regions:
> 1. Main SCP SRAM memory region (required)
> 2. SCP L1TCM memory region (optional, for additional memory)
> 
> Some other MediaTek SoCs only use a single memory region. This patch adds

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94

> a conditional schema using if/then to allow 1-2 memory regions
> specifically for mediatek,mt8188-scp and mediatek,mt8188-scp-dual
> compatibles, while keeping the default maxItems: 1 for other
> SoCs.

Stop explaining what you did. Explain WHY. Why second entry is optional?
Why are you changing existing binding? Was it working? Not? Why not? Why
yes?


> 
> Each memory region is documented with descriptions to
> clarify their purpose, following the pattern used in other bindings.

Redundant. We can read the diff.

> 
> Signed-off-by: Arnab Layek <arnab.layek@mediatek.com>
> ---
>  .../bindings/remoteproc/mtk,scp.yaml          | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
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

Conflicts top level.

> +      patternProperties:
> +        "^scp@[a-f0-9]+$":
> +          properties:
> +            memory-region:
> +              minItems: 1
> +              items:
> +                - description: Main SCP SRAM memory region
> +                - description: Optional SCP L1TCM memory region
>  
>  additionalProperties: false
>  
> -- 
> 2.45.2
> 


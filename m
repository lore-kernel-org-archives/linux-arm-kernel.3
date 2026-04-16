Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A97F8A149
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 08:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=huhx+eJ3U7yvSqrRPEfXT8KAowWBmHbz3dRdNKqXRzo=; b=cnkH0yZE5a6xn2bho0pOjzutaz
	7eWs4zrDnKtBK84lvZJTVWyY8mLmGOXHNQcI2rR7eSMo6p7P1RqE79C8MLAvhuM+IT9HEKR0pWO6u
	7sQxukQ3IaRiMc9H/INcpc7UogMpzgO8PzqFRMflXjRz2iyeiTlRakDXBPl1kg+s6n/omLBR6ywCn
	+kMHBt1xQsUYhEWfszb5HNBJ2YTHksCsTLcrYF+4j8fg6IgcBq+KTEqxaScHDLLre4kgPPT7IPobH
	QIuTHlwNjG1a+eMFi8XNTvirf1Qdh15OV/H9UqNNkX4r4u+cCXZQPe8RaRg0njdR2RJWewGDnfUBD
	LJxNfN1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDIWz-00000002Cmg-1jD6;
	Thu, 16 Apr 2026 08:57:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDIWx-00000002ClW-1Fv0;
	Thu, 16 Apr 2026 08:57:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 82A5643864;
	Thu, 16 Apr 2026 08:56:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5A3FC2BCAF;
	Thu, 16 Apr 2026 08:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776329818;
	bh=vl7msSVm/Rgwxg49h1Sq1unOUgNN5gUFB5siCR+yTVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pgLFFsm6NHz3pwjpal0HBdNtK2K9UWYBSwSvTYF6hNldu5GBSvOUb/qDfaYLvjRmP
	 t2VuX+M10i0DNuGtsM01lRnTiCftAnFhz/V2e/BiWuO/PjMkjma4wm3gyou/9CfV2A
	 XCWWecdUlDqlfvOljHlGvLF68zQq3YKPEOrKrTAAyoyzwi2zcw71kjsN9yQFwPdlks
	 qwi1eo6sYaz4EosAB9PpDTFFxHCic5BKyeNAxEOzahtjzjBwPObNi1OyGPJqCizDql
	 CynunWN8OMIO3+ct8ptqc0GksMa6Y49V7bM+oo40Icu4MkDc3IkFxCOKwnLYq5f6qV
	 INjFB9QOpYXrw==
Date: Thu, 16 Apr 2026 10:56:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xiaoshun Xu <xiaoshun.xu@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Sirius Wang <sirius.wang@mediatek.com>, Vince-wl Liu <vince-wl.liu@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 4/6] dt-bindings: soc: mediatek: devapc: Add bindings
 for MT8189
Message-ID: <20260416-sophisticated-wealthy-hawk-efb7f4@quoll>
References: <20260416031231.2932493-1-xiaoshun.xu@mediatek.com>
 <20260416031231.2932493-5-xiaoshun.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260416031231.2932493-5-xiaoshun.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_015659_384236_3E59D8BD 
X-CRM114-Status: GOOD (  17.30  )
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

On Thu, Apr 16, 2026 at 11:12:07AM +0800, Xiaoshun Xu wrote:
> Extend the devapc device tree bindings to support the MediaTek MT8189
> SoC. This includes:
> 
> - Adding "mediatek,mt8189-devapc" to the list of compatible strings.
> - Introducing the "vio-idx-num" property to specify the number of bus
>   slaves managed by devapc.
> 
> These changes enable proper configuration and integration of devapc on
> MT8189 platforms, ensuring accurate device matching and resource
> allocation in the device tree.

Pointless paragraph. Would you write a commit which does not enable
proper configuration?

> 
> Signed-off-by: Xiaoshun Xu <xiaoshun.xu@mediatek.com>
> ---
>  .../devicetree/bindings/soc/mediatek/devapc.yaml       | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> index 99e2caafeadf..06a096440331 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> @@ -14,13 +14,14 @@ description: |
>    analysis and countermeasures.
>  
>  maintainers:
> -  - Neal Liu <neal.liu@mediatek.com>

Your commit said what the change is doing. It's pointless because we see
it in the diff. Except that we don't...

> +  - Xiaoshun Xu <xiaoshun.xu@mediatek.com>
>  
>  properties:
>    compatible:
>      enum:
>        - mediatek,mt6779-devapc
>        - mediatek,mt8186-devapc
> +      - mediatek,mt8189-devapc
>  
>    reg:
>      description: The base address of devapc register bank
> @@ -30,6 +31,10 @@ properties:
>      description: A single interrupt specifier
>      maxItems: 1
>  
> +  vio-idx-num:

Nah, compatible defines it. Please follow standard rules for bindings,
see writing-bindings doc.


> +    description: Describe the number of bus slaves controlled by devapc
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
>    clocks:
>      description: Contains module clock source and clock names
>      maxItems: 1
> @@ -42,8 +47,6 @@ required:
>    - compatible
>    - reg
>    - interrupts
> -  - clocks
> -  - clock-names

Why?

This commit explains nothing and makes some random-looking code changes.

Best regards,
Krzysztof



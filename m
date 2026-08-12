Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188ECC5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 10:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTxtUzbw2CP7qzFDOd8XF82HMw4zOXtbtAjcgTQm07Y=; b=oHAYWDcQBIHzWC3XbdaTzodfiG
	is0q3Ois2delCn70y+9BJY1g12KLlfr2Xhoqt47msLo6/BN9Zrsi+JEth77Tzrj7B75o7CLsbXQhH
	HWCY8wr6/DRuJYOY6pjHROJvIHGGSssXWMLzZwUB1YCE1fBraQLfgsDbF49bzEZFB/WR9KSu2ikLq
	aj9O0xpq+sdVH8QC0mlNpS38lRcJl0h5CHEYXHKZp4YflIB78BDR8zJVsbw0jdrpcycbi8m1Ehv4Y
	k2f4DLRkMgHNjDcWhZoWUwifDdry6ErHeHxdS4zwjpopQYnn4ijsyg3ttQENnRWglz2LmlJClo6Tw
	o9HQwEpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6QV-0000000FvT7-1LMx;
	Wed, 12 Aug 2026 10:43:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu6QT-0000000FvSr-2IX4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 10:43:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2491740AEB;
	Wed, 12 Aug 2026 10:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A3C31F000E9;
	Wed, 12 Aug 2026 10:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786531393;
	bh=zTxtUzbw2CP7qzFDOd8XF82HMw4zOXtbtAjcgTQm07Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ltMzeIQZcdZIqZprcX/FAsp9b8pPmHH3UiKGIPZihGl77y6b+AticxA7JACKpWWUx
	 0PRXseHzevvsyFXTYWDSulY2m8HGvkQ9f5EgV2hKeEmBo+ZTSkBfN6A5DiHPfr3GYH
	 hLqjtHx+N+zPRg63DHV3krOfwWrkRK6M3q/z4DZzVkylsz8NmWYh9obxH7AgzHt78G
	 e+Leq+hOzXoxZuF0BFtjBYT9EX+FPuOza+tUVoUZlSVdr3/kU47cn4PNTNjbTkSfQw
	 EmoMb6tgP7h+H9Qwvb4CNlYbPZ4eDS+Otlao+UaSjA5MaEbu/1NZcZIWeuUZJ8Ke31
	 yOnTf/b/Zdy/g==
Date: Wed, 12 Aug 2026 12:43:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Golla Nagendra <nagendra.golla@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, michal.simek@amd.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org, 
	git@amd.com, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH V3 4/6] dt-bindings: dma: xlnx,zynqmp-dma: Add Versal Net
 compatible support
Message-ID: <20260812-benevolent-ammonite-of-mathematics-5dcafc@quoll>
References: <20260810100452.426320-1-nagendra.golla@amd.com>
 <20260810100452.426320-5-nagendra.golla@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810100452.426320-5-nagendra.golla@amd.com>
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

On Mon, Aug 10, 2026 at 03:34:50PM +0530, Golla Nagendra wrote:
> From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
> 
> Introduce a new compatible string amd,versal-net-dma-1.0 for
> Versal Net ZDMA.The new compatible requires xlnx,zynqmp-dma-1.0 as a
> fallback.
> 
> Add a reset property to describe the per-channel reset line exposed
> on Versal Gen2 and Versal Net. Mark the resets property as required
> for both Versal Gen2 and Versal Net, and not applicable for other
> platforms.

I cannot find previous discussion in my inbox and cover letter has no
links to previous versions (when finally will you start using b4?), so
you might get the same review over and over.

> 
> Note that making resets required for Versal Gen2 results in an ABI
> break but this is unavoidable. When DMA is used by two software components
> back to back (e.g., firmware before Linux boot), DMA functionality fails
> due to configuration differences or the DMA being left in a bad state by
> the previous user. The channel can only be cleanly re-configured after
> a DMA channel reset,making it essential.

So this was never working? What exactly is unavoidable?

> 
> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
> Co-developed-by: Golla Nagendra <nagendra.golla@amd.com>
> Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
> ---
> Changes in V3:
> - Use allOf:if:then: to restrict the resets property per-compatible,
>   making it required for amd,versal2-dma-1.0 and amd,versal-net-dma-1.0
>   and explicitly setting resets: false for all other platforms
> - Add amd,versal-net-dma-1.0 compatible string with xlnx,zynqmp-dma-1.0
>   as fallback
> - Switch compatible from enum to oneOf to accommodate the new multi-item
>   entry for Versal Net
> - Add ABI break justification
> ---
>  .../dma/xilinx/xlnx,zynqmp-dma-1.0.yaml       | 25 ++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
> index 2da86037ad79..87c65aef5c7d 100644
> --- a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
> +++ b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
> @@ -18,15 +18,31 @@ maintainers:
>  
>  allOf:
>    - $ref: ../dma-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amd,versal2-dma-1.0
> +              - amd,versal-net-dma-1.0

> +    then:
> +      required:
> +        - resets
> +    else:
> +      properties:
> +        resets: false

Entire allOf goes after "required:" block, by convention, see
example-schema.

Best regards,
Krzysztof



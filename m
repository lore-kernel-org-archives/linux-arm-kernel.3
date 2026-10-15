Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFBCCC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 20:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7YOUVUAuDJ+LB8A54CxgLAZstJTxkbUW426eqIMaE68=; b=LDKKQqYntfGqj+1kICeHUc/Svh
	NxcfTygM2WmFC3ydOKci0txhUCDiFvScahMOY+o6NlmOPBl1pKVMayCilaWt7CJRZWattLjc/Y50a
	k7xracORHDCzr5VvpvPjS4bpB9U6NgTI8hthv8+gp9dBK3XSEoy3DQum5raIYbYwpOBsN+PRLa6F1
	E1UWYpvHuTpHgqnz2dJfPvrkke8RDVcvNieINfF72OQmDVlpTBir6G2lTtis8gaFVfmfSCzVLgwPX
	NcYztIPXMBGKAknhXHENo8tmrsVedhfBOhYFqbzbGT5JordcEdO55b52sBR4iH4kHaneA5V/hkWu3
	pRXHoLPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRwW-00000001Khv-137T;
	Thu, 15 Oct 2026 20:20:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHRwV-00000001Khc-161K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:20:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A35F41924;
	Thu, 15 Oct 2026 20:20:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B0F1F000C4;
	Thu, 15 Oct 2026 20:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792095646;
	bh=7YOUVUAuDJ+LB8A54CxgLAZstJTxkbUW426eqIMaE68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UBn4y+d6m2uaC4Bq6UF8Iq5w9WgO7AHVyBnXal7TulBgMIBec1PV8r+m+Uly2Ahyu
	 9HAGREL01rwbBVjC350IYOUF5Tpf231E28hxdD+/HReudYDAXae3qm0La+c5xE7r2F
	 xGx7JlEKmY7SDz3P0HLquOcUHraDsfev6ZoNSnte2oKoqp1djm93L0hWsxvA5QSt2H
	 kSuF+iSiT1fUXvbfSF0IUkoz5E+u+1rVvHM3wkTY0hQSxyaQ/slWT9HnfGkrSedz+6
	 i4G4Hy6msS5qrdyhmeikRAVkTAOHK5Q3C9TCirMgzrdmIwB5q8Nf79jYVIYFyBz68/
	 wsA44DDaJQbrw==
Date: Thu, 15 Oct 2026 15:20:44 -0500
From: Rob Herring <robh@kernel.org>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	robin.murphy@arm.com, devicetree@vger.kernel.org,
	Frank.Li@kernel.org, cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] dt-bindings: dma: arm,dma-350: Document the CIX
 Sky1 integration
Message-ID: <20261015202044.GA2956742-robh@kernel.org>
References: <20261012084155.2547480-1-Jelly.Jia@cixtech.com>
 <20261012084155.2547480-5-Jelly.Jia@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012084155.2547480-5-Jelly.Jia@cixtech.com>
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

On Mon, Oct 12, 2026 at 04:41:53PM +0800, Jelly Jia wrote:
> The CIX Sky1 DMA-350 integration is the same device with SoC glue around
> it, so it is described by the arm,dma-350 node itself with an additional
> "cix,sky1-dma350" compatible rather than by a separate wrapper node.
> 
> Extend the binding with the CIX compatible and the resources the
> integration needs: a clock, which the CIX variant requires, an optional
> reset, and an optional reserved memory region used when the controller
> cannot reach all of system memory.
> 
> v2 -> v3:
> - Drop the cix,irq-router property and its conditional: the Sky1
>   interrupt gate it described is set up by the boot firmware and is not
>   configured by Linux, so no property describes it.
> - The CIX compatible now requires a clock.
> 
> Assisted-by: LLM checkpatch sparse dt_binding_check dtbs_check
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
> ---
>  .../devicetree/bindings/dma/arm,dma-350.yaml  | 26 ++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> index 429f682f15d8..4e0f9ffb0039 100644
> --- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> +++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> @@ -11,10 +11,22 @@ maintainers:
>  
>  allOf:
>    - $ref: dma-controller.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: cix,sky1-dma350
> +    then:
> +      required:
> +        - clocks
>  
>  properties:
>    compatible:
> -    const: arm,dma-350
> +    oneOf:
> +      - const: arm,dma-350
> +      - items:
> +          - const: cix,sky1-dma350
> +          - const: arm,dma-350
>  
>    reg:
>      items:
> @@ -36,6 +48,18 @@ properties:
>      const: 1
>      description: The cell is the trigger input number
>  
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  memory-region:
> +    maxItems: 1
> +    description:
> +      Reserved memory region used for DMA allocations when the controller
> +      cannot reach all of system memory.

That's what dma-ranges is for.

Rob


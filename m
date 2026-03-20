Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81D01093192
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 09:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69b6GWlqAx3HGfyzYEu+bN2O7/P0ipDtXJwSHKRhU38=; b=Q9fLMihC49G2BvnrItBezp/R/Z
	YnfxGPXrnv7bjRYVpzUVAO7jkxX5c01iKyUgX/Ztl2947tFEGccGyVDTN2uLDG+lY5US0140zKjLY
	z4l1+7LBU0+iKTpOC8fFbH5sbzlRW0R9C6Grkk50QJeYywUNL7XgkYgmHHo81cpBDZOzhSjJ3hJ41
	fqlRe2WubcneTwuRznYtkk+03KXXRCOeTsHlwD1gnit/izwx30IP10NaNIMshaVYp01lOO5bu0YVt
	ehonBoLlofV7UtfjCgAX+zDIC8hfOEOc/qbqmLzJUx1LE0PNzeT9JjPgrZiRU6L7Z8ArqqHplvUdr
	KQDPx9uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Vud-0000000CRWD-1j8Y;
	Fri, 20 Mar 2026 09:12:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Vua-0000000CRVr-3muW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 09:12:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A56E343678;
	Fri, 20 Mar 2026 09:12:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02516C4CEF7;
	Fri, 20 Mar 2026 09:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773997975;
	bh=eCK0dEmHKu71hb3Dx847pAiVP184hX3MEz6AOGBp5mQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PT+O+ydkF5j+137rY6WJz4keuhBPTfc0t6ixXD+/1zrq9NEbi2tyARuqViWybHPcN
	 NBgzqaW4GERsWeEpcYEhw9x65T6wiiFK3wNQzF+GZ2xeOZXsvnMoCc/Y7Ml/eS2BTb
	 Q/PL3L+zYlQ2S7b3ytyp0zc175a4R0QcmmacBIEjB17ov+A6r637aUlrFUgJG/iUXq
	 UF62WWdmuOS5Kkfd6GIoSnJove6T2j/SNMPMms5fSVSmMkb+f+zueNUOyqNi6eaoao
	 6eZKz610mHNbIORhOZkE+u3w2NjMljrw2zngu5wMrhBNereJeOQ+D6+s+nePRUwEVA
	 3Q9qMM+EvPpTA==
Date: Fri, 20 Mar 2026 10:12:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jun Guo <jun.guo@cixtech.com>
Cc: peter.chen@cixtech.com, fugang.duan@cixtech.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, ychuang3@nuvoton.com, 
	schung@nuvoton.com, robin.murphy@arm.com, Frank.Li@kernel.org, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cix-kernel-upstream@cixtech.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: dma: arm-dma350: document generic
 and combined IRQ topologies
Message-ID: <20260320-vengeful-violet-cockle-382580@quoll>
References: <20260319101723.246539-1-jun.guo@cixtech.com>
 <20260319101723.246539-2-jun.guo@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260319101723.246539-2-jun.guo@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_021257_003722_BC8F8241 
X-CRM114-Status: GOOD (  18.66  )
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

On Thu, Mar 19, 2026 at 06:17:21PM +0800, Jun Guo wrote:
> Update the DMA-350 DT binding to match the current driver behavior.
> 
> Allow both:
> - "arm,dma-350" as the generic compatible, and
> - "cix,sky1-dma-350", "arm,dma-350" for SoC-specific fallback usage.
> 
> Also document interrupt topology variants supported by hardware
> integration:
> - one combined interrupt for all channels, or
> - one interrupt per channel (up to 8 channels).
> 
> This patch is Assisted-by: Cursor: GPT-5.3 Codex.

Wrong tag, please read carefully the guideline before using LLM tools.

> 
> Signed-off-by: Jun Guo <jun.guo@cixtech.com>
> Link: https://lore.kernel.org/r/20251216123026.3519923-2-jun.guo@cixtech.com

What does this express? Changelog link? Then keep it in the changelog
--- part.


> ---
>  .../devicetree/bindings/dma/arm,dma-350.yaml  | 31 +++++++++++++------
>  1 file changed, 21 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> index 429f682f15d8..3639ce0d5054 100644
> --- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> +++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> @@ -14,7 +14,11 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: arm,dma-350
> +    oneOf:
> +      - const: arm,dma-350
> +      - items:
> +          - const: cix,sky1-dma-350
> +          - const: arm,dma-350
>  
>    reg:
>      items:
> @@ -22,15 +26,22 @@ properties:
>  
>    interrupts:
>      minItems: 1
> -    items:
> -      - description: Channel 0 interrupt
> -      - description: Channel 1 interrupt
> -      - description: Channel 2 interrupt
> -      - description: Channel 3 interrupt
> -      - description: Channel 4 interrupt
> -      - description: Channel 5 interrupt
> -      - description: Channel 6 interrupt
> -      - description: Channel 7 interrupt
> +    maxItems: 8
> +    description: |
> +      The DMA controller may be configured with separate interrupts for each channel,
> +      or with a single combined interrupt for all channels, depending on the SoC integration.

And more important - you must review the LLM microslop output before
posting and adjust it to Linux kernel coding style. Don't send
unredacted tool output.

Best regards,
Krzysztof



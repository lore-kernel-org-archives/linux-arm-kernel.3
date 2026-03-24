Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B09E9A779
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 12:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jo9Eib5SG/Zf7AoRbfeTXRywY9m0Q9g68UsRBf9uKDE=; b=i8Cf2zcydEAS8PEvRyF/S7BI6j
	X1OJBKImbCL+sFU1CxXzcmU/lDLG2M5lF6st6vo7/ymHl8F5fu7I67W55b68m0hegIg4TgaCrXgXX
	1BF5DQjH8JDquxSEscpGH11/n79I66wzuHeGL1wsh4y0kMehicGty7t3qgbw5VJFM7feQJehN/y+W
	Wn7S7qZUz6L3LHSk31ZqWEPXcVHzVUptlyYf63DtTxNIatV4QwZn5mNMy8Qa/hlSVNumIui2moSzk
	8dL5V6IP8nENHUF98va5syAj1v4z3BxpZNnvXj1IU+aLivUOv/8PwotUk0GLQy7S7kghFMyS/scvW
	H0X2qK+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50VG-00000001LQx-0AUF;
	Tue, 24 Mar 2026 12:04:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50VD-00000001LQQ-0tCJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 12:04:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 905761476;
	Tue, 24 Mar 2026 05:04:45 -0700 (PDT)
Received: from [10.57.76.67] (unknown [10.57.76.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D39A43FAF5;
	Tue, 24 Mar 2026 05:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774353891; bh=NaxP08zN77vip4UHQcZc9oRFoOqkd9B8OMX9MCY9/aA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xvs+ehkTEbm++1ybxYpV14cv2yuqzKIiK0wyP5KiiCdFXoq7zayhc+Vzlhnj9zGg4
	 hejDcnIrWIJywFqKikarNMB0nNMfiF8fC4OtqxShqaYEv/kqYE0jTpH+Dv0evtFAFT
	 xLZOjTgQZQyNw1UxK6L93VdLCJyoCpx+nDRGlzT4=
Message-ID: <c91176d1-851a-4cf5-b7dc-cde431a8326e@arm.com>
Date: Tue, 24 Mar 2026 12:04:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: dma: arm-dma350: document generic and
 combined IRQ topologies
To: Jun Guo <jun.guo@cixtech.com>, peter.chen@cixtech.com,
 fugang.duan@cixtech.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, vkoul@kernel.org, ychuang3@nuvoton.com,
 schung@nuvoton.com, Frank.Li@kernel.org
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
 linux-arm-kernel@lists.infradead.org
References: <20260323114822.1925869-1-jun.guo@cixtech.com>
 <20260323114822.1925869-2-jun.guo@cixtech.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260323114822.1925869-2-jun.guo@cixtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_050455_351145_C1B866ED 
X-CRM114-Status: GOOD (  21.00  )
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

On 2026-03-23 11:48 am, Jun Guo wrote:
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

To repeat myself for the 3rd time, this is at best unnecessary, and at 
worst arguably wrong. Here's an example of a system which happens to use 
the combined interrupt from another IP block which also offers both options:

https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/freescale/imx8qm.dtsi#n279

Same thing here; each channel is a distinct interrupt source, so it is 
perfectly honest to describe that consistently in DT, regardless of 
whether or not the interrupt signals are still distinct by the time they 
reach the interrupt controller.

Furthermore, in this case the IRQ_COMB_NONSEC interrupt actually has 
additional functionality beyond just being a mux of the individual 
IRQ_CHANNEL interrupts. So although Linux probably won't ever care, if 
it's going to be in the DT binding then it should really be distinct 
from the channel interrupts anyway, since systems could well wire them 
*all* up, and an OS could choose to use the IRQ_CHANNEL outputs directly 
for individual channel completion/error status, while also using the 
IRQ_COMB_NONSEC just for its overall INTR_ALLCH{STOPPED,PAUSED,IDLE} status.

If you only want to make your thing work in Linux, all that is needed is 
a 1-line change in the driver to enable the INTR_ANYCHINTR bit (which as 
I've also said before, we can do unconditionally because we're *not* 
using the other INTR_ALLCH stuff), and to write your DT using the 
existing binding. "One interrupt per channel" already carries no 
expectation that they all have to be *different* interrupts.

Thanks,
Robin.

> Assisted-by: Cursor: GPT-5.3-Codex
> Signed-off-by: Jun Guo <jun.guo@cixtech.com>
> ---
>   .../devicetree/bindings/dma/arm,dma-350.yaml  | 34 +++++++++++++------
>   1 file changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> index 429f682f15d8..47091614d1b4 100644
> --- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> +++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> @@ -14,7 +14,14 @@ allOf:
>   
>   properties:
>     compatible:
> -    const: arm,dma-350
> +    description:
> +      Use "arm,dma-350" for generic integration. A SoC-specific
> +      compatible may be listed first, followed by "arm,dma-350".
> +    oneOf:
> +      - const: arm,dma-350
> +      - items:
> +          - const: cix,sky1-dma-350
> +          - const: arm,dma-350
>   
>     reg:
>       items:
> @@ -22,15 +29,22 @@ properties:
>   
>     interrupts:
>       minItems: 1
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
> +    description:
> +      Either one interrupt per channel (8 interrupts), or one
> +      combined interrupt for all channels.
> +    oneOf:
> +      - items:
> +          - description: Channel 0 interrupt
> +          - description: Channel 1 interrupt
> +          - description: Channel 2 interrupt
> +          - description: Channel 3 interrupt
> +          - description: Channel 4 interrupt
> +          - description: Channel 5 interrupt
> +          - description: Channel 6 interrupt
> +          - description: Channel 7 interrupt
> +      - items:
> +          - description: Combined interrupt shared by all channels
>   
>     "#dma-cells":
>       const: 1



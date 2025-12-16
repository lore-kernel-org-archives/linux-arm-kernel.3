Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7811D5E144
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 12:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d54D9tjA7oVoe6gf1qt90qBEmEC3QOtb5u81ehmx57c=; b=jJhc01BXH8flvKDBd+ND/fyiO/
	7rKbnRaVLFcV8WljTf4nyjfd0dZf6zaufvKPgkqvUFUfpgNULhqR6ConrB3hjXT69j988RT6+cbDM
	8tx0RGLW7rtqVQeaM/wEeqPbytMjA47uApxFq2JXUKYB/q8sWtrmjV4EPL4fljn1lQIn8SNQ+zpLm
	t29U+4avA9ccE/NZM3qHq9lWskHPetbXDh6JtdYxMo1PxeE4cZRRODAQ7D1LWHntZu6DIOe2pPzcY
	r4JF6a78Sks/o7gNLBcUvXhdnteqs63WWzI0eSvCXwbozAFcDPGPYe+44xEmTDbjGubMVuSn2ziIM
	3OJlX38A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVUOh-00000005Cct-21oj;
	Tue, 16 Dec 2025 12:43:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVUOZ-00000005CcR-1yMb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 12:43:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77086FEC;
	Tue, 16 Dec 2025 04:43:05 -0800 (PST)
Received: from [10.57.43.186] (unknown [10.57.43.186])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9DC973F694;
	Tue, 16 Dec 2025 04:43:09 -0800 (PST)
Message-ID: <9d4c274f-3e4c-49a1-9b2a-a95e9a48a4a6@arm.com>
Date: Tue, 16 Dec 2025 12:43:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: dma: arm-dma350: update DT binding
 docs for cix sky1 SoC
To: Jun Guo <jun.guo@cixtech.com>, peter.chen@cixtech.com,
 fugang.duan@cixtech.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, vkoul@kernel.org, ychuang3@nuvoton.com,
 schung@nuvoton.com
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
 linux-arm-kernel@lists.infradead.org, jelly.jia@cixtech.com
References: <20251216123026.3519923-1-jun.guo@cixtech.com>
 <20251216123026.3519923-2-jun.guo@cixtech.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20251216123026.3519923-2-jun.guo@cixtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_044317_482687_52FC293D 
X-CRM114-Status: GOOD (  16.10  )
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

On 2025-12-16 12:30 pm, Jun Guo wrote:
> Add SoC-specific compatible strings to the DT binding documents to support
> cix sky1 SoC.
> 
> When adding support for a new SoC that uses the arm dma controller,
> future contributors should be encouraged to actually add SoC-specific
> compatible strings. The use of the "arm,dma-350" compatible string in
> isolation should be disallowed.

No, you've missed the point - however many channels the hardware 
implements, the DT should list that many interrupt specifiers; it 
doesn't matter whether any of them happen to be the same.

Thanks,
Robin.

> Signed-off-by: Jun Guo <jun.guo@cixtech.com>
> ---
>   .../devicetree/bindings/dma/arm,dma-350.yaml  | 31 +++++++++++++------
>   1 file changed, 21 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> index 429f682f15d8..78bcc7f9aa8b 100644
> --- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> +++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> @@ -14,7 +14,11 @@ allOf:
>   
>   properties:
>     compatible:
> -    const: arm,dma-350
> +    oneOf:
> +      - items:
> +          - enum:
> +              - cix,sky1-dma-350
> +          - const: arm,dma-350
>   
>     reg:
>       items:
> @@ -22,15 +26,22 @@ properties:
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
> +    description: |
> +      The DMA controller may be configured with separate interrupts for each channel,
> +      or with a single combined interrupt for all channels, depending on the SoC integration.
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



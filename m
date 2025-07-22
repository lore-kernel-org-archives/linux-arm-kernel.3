Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481CAC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 09:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MHJcYxxC0c04J0Sdkp2z2pvfkFABVVxORPKIRuEgp8M=; b=UihJPE5lnmk32x2uYySf+NpjWX
	m1kaCiVscBj9tRm2qMkmL1fiufh0fHWkmTjKFfoFHNwdSHSU4/d96Nyh1gU6nwiB1xtz7PZGqT3nE
	FG7Au8wpZ+cGPfDQUd+1VwIkEOw4nTpqH4U8nSDkUiSaBGMFUXllgZ8DV7gz3DOvEmPrLvV+Xik5H
	NUkXRwNMlB7jycT9ggWRzmqbOcNMsk8EyV2JUBSoduf9qXUCnfiJ76o+rXqNUbZzpJ/93leWDiRTB
	lQWb1fpyYDVXUlZqLeQz959YtecK4KMJLGvH7W4QjJCDTXGTiIfyV4fGg/X/vT1wjM8ueaVTt7vLn
	RSOQBYxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9cA-000000023f1-1ZSA;
	Tue, 22 Jul 2025 09:48:50 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue9Ta-000000022HX-0GZo;
	Tue, 22 Jul 2025 09:39:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753177196;
	bh=NgsL3gTGGimcOYXeYVqRXt5bTxZm1wqbVcpMtjeMMAM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TB7pqKFXo6MjzoRR1DOvuL2zOUx0iePTnUdN2KdM07FS19smE3tgyvm8Zodd4OvYQ
	 zSLcPbGpAuAkk/m6GWvvjvAdSOrhmSGmK80s/w3ra+zjygL8iHDe+DhxTJnOKQXNHy
	 ejbWgRodz04Om3d3xijshDRR0wv294QjJeEHCFRhmGJBBBUacjHVaWIopnGbCYSc7f
	 4F7SCSK8pYgixwnP47HJ7Aw1BnTgWXnSpMdbnq8eptaXmSAHgzkx279DJ6aBdE1tA9
	 UVBQ2zc8bxpQP9HTNiffqAH6hUmy4/zACTXpKImSjGsuYmw2mqYbk3ndeOOdkt6YDo
	 SzVoMX2qMIgaA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 302E017E07FB;
	Tue, 22 Jul 2025 11:39:55 +0200 (CEST)
Message-ID: <b90956e8-adf9-4411-b6f9-9212fcd14b59@collabora.com>
Date: Tue, 22 Jul 2025 11:39:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] dt-bindings: ufs: mediatek,ufs: add MT8195
 compatible and update clock nodes
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Ramax Lo <ramax.lo@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20250722085721.2062657-1-macpaul.lin@mediatek.com>
 <20250722085721.2062657-3-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250722085721.2062657-3-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_023958_284869_B23D42D6 
X-CRM114-Status: GOOD (  18.48  )
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

Il 22/07/25 10:57, Macpaul Lin ha scritto:
> Add MT8195 UFSHCI compatible string.
> Relax the schema to allow between one to eight clocks/clock-names
> entries for all MediaTek UFS nodes. Legacy platforms may only need
> a few clocks, whereas newer devices such as the MT8195 require
> additional clock-gating domains. For MT8195 specifically, enforce
> exactly eight clocks and clock-names entries to satisfy its hardware
> requirements.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>   .../devicetree/bindings/ufs/mediatek,ufs.yaml | 42 ++++++++++++++++---
>   1 file changed, 36 insertions(+), 6 deletions(-)
> 
> Changes for v2:
>   - Remove duplicate minItems and maxItems as suggested in the review.
>   - Add a description of how the MT8195 hardware differs from earlier
>     platforms.
> 
> diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> index 20f341d25ebc..1dec54fb00f3 100644
> --- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> +++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
> @@ -9,21 +9,20 @@ title: Mediatek Universal Flash Storage (UFS) Controller
>   maintainers:
>     - Stanley Chu <stanley.chu@mediatek.com>
>   
> -allOf:
> -  - $ref: ufs-common.yaml
> -
>   properties:
>     compatible:
>       enum:
>         - mediatek,mt8183-ufshci
>         - mediatek,mt8192-ufshci
> +      - mediatek,mt8195-ufshci
>   
>     clocks:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 8
>   
>     clock-names:
> -    items:
> -      - const: ufs
> +    minItems: 1
> +    maxItems: 8
>   
>     phys:
>       maxItems: 1
> @@ -47,6 +46,37 @@ required:
>   
>   unevaluatedProperties: false
>   
> +allOf:
> +  - $ref: ufs-common.yaml
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8195-ufshci
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 8
> +        clock-names:
> +          items:
> +            - const: ufs
> +            - const: ufs_aes
> +            - const: ufs_tick
> +            - const: unipro_sysclk
> +            - const: unipro_tick
> +            - const: unipro_mp_bclk

The unipro mp_bclk really is the ufs-sap clock; besides, the standard has clocks
for both TX and RX symbols - and also MT8195 (and also MT6991, MT8196, and others)
UFS controller do have both TX and RX symbol clocks.

Besides, you're also missing the crypto clocks for UFS, which brings the count to
12 total clocks for MT8195.

Please, look at my old submission, which actually fixes the compatibles other than
adding the right clocks for all UFS controllers in MediaTek platforms.

https://lore.kernel.org/all/20240612074309.50278-1-angelogioacchino.delregno@collabora.com/

I want to take the occasion to remind everyone that my fixes were discarded because
the MediaTek UFS driver maintainer wants to keep the low quality of the driver in
favor of easier downstream porting - which is *not* in any way adhering to quality
standards that the Linux community deserves.

Cheers,
Angelo

> +            - const: ufs_tx_symbol
> +            - const: ufs_mem_sub
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names:
> +          items:
> +            - const: ufs
> +
>   examples:
>     - |
>       #include <dt-bindings/clock/mt8183-clk.h>




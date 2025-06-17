Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AC6C71155
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 06:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0Hypg0YiyrTOdj6XVeCBXXPTB7AvejBnrNfQLy+VcU=; b=PkP9l/BFu0dxc0draMALXGhkqi
	48P8sjF951kDwT5AfU2ujW70plpGGobcJ//HTI8Q1vjGVyBCgKEGO1WPr3CbGG3lMbDM69AGfE2lX
	jhCG06hoqLREsRyMD+o4gfKhgY0ApMFB/FQVmF805B8N8GopSJTOGNP1q0/OtDYdEo7OonqC/Cj20
	TlYS+wcJQATPpkPzeg/jXP3IQ0NXuZmQu3H0dLuy4L2Q84mdDv+thr9K2lWwHkZWNcVuPahBvRkG7
	BUNi/USkYN1c2rWpy/pkHgjowZJ0jf09egLFx8JWLIWNQYjXW0yDhhz/pPUdiKAECkiUHkZcjPFta
	jQubxN6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRPwD-00000006NHc-0WQU;
	Tue, 17 Jun 2025 06:36:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRPny-00000006MAL-1Stq;
	Tue, 17 Jun 2025 06:28:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BBC7749FD3;
	Tue, 17 Jun 2025 06:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DB45C4CEE7;
	Tue, 17 Jun 2025 06:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750141701;
	bh=LF9auu4JR+Lf7VFoXANiRubeszBNmKcaT9+J6iYCMqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=si0ySmFf06Kx/pNC4mfe6nBcvFNV89lyyiFLJWdWrDmhso9gixojQO98veDgzlFS2
	 bS4eVP0/5UE4jURK+g1fRox6cuIv53sWw8Du+l6BfR1pPc0WQR4nceAvkuxGbqQw9q
	 HfsqK6V1xxQJPg7WDS0pb1SyDq2oY+HTxzLt4PdtAfaEnySYIVD2h9q+wO2LNP5LYB
	 SHFzQ99MFGGSFuxx9uYyrD9ZT5pD96cdUNXz/RlL96Y9hQbrjGZN3HL3XSror6hl1l
	 gCpKHF9/DfjEtIPPPvZWYUlLuCeyvNBZrGZFyXg9voZF6JW2FP/NWHR6QBwPzE7YJu
	 snYheb0NY7lNQ==
Date: Tue, 17 Jun 2025 08:28:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xueqi Zhang <xueqi.zhang@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Ning li <ning.li@mediatek.com>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [RFC PATCH 1/8] dt-bindings: iommu: mediatek: Add mt8196 support
Message-ID: <20250617-woodoo-uakari-of-cubism-c2bedf@kuoka>
References: <20250616025628.25454-1-xueqi.zhang@mediatek.com>
 <20250616025628.25454-2-xueqi.zhang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250616025628.25454-2-xueqi.zhang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_232822_413542_C78744C8 
X-CRM114-Status: GOOD (  15.72  )
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

On Mon, Jun 16, 2025 at 10:56:07AM GMT, Xueqi Zhang wrote:
> 1. Mediatek has its own implementation for wrapper interrupts and
> power management. Add the SoC specific compatible for MT8196
> implementing arm,smmu-v3.
> 2. APU SMMU need wait until its power is ready, thus add a phandle
> smmu-mediatek-parents to its power node.
> 
> Signed-off-by: Xueqi Zhang <xueqi.zhang@mediatek.com>
> ---
>  .../bindings/iommu/arm,smmu-v3.yaml           | 24 ++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> index 75fcf4cb52d9..c9a99e54de69 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> @@ -20,7 +20,12 @@ properties:
>    $nodename:
>      pattern: "^iommu@[0-9a-f]*"
>    compatible:
> -    const: arm,smmu-v3
> +    - description: MediaTek SoCs implementing "arm,smmu-v3"
> +      items:
> +        - enum:
> +            - mediatek,mt8196-apu-smmu
> +            - mediatek,mt8196-mm-smmu
> +        - const: arm,smmu-v3

You just broke every existing user, so this was not tested.

Limited review follows - test your patches first.

>  
>    reg:
>      maxItems: 1
> @@ -69,11 +74,28 @@ properties:
>        register access with page 0 offsets. Set for Cavium ThunderX2 silicon that
>        doesn't support SMMU page1 register space.
>  
> +  mediatek,smmu-parents:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle to the SMMU's power node. The SMMU should wait until its power
> +      is ready

No, power domains express power relationship. Or some other existing
properties or simply parent-child relationships.

Best regards,
Krzysztof



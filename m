Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4FDC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 17:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y2XBfGLdQqiee6qZhjFtUdbapPxxtLFQzL/MDUhp4v0=; b=EpFVPgk4RA78SiYBFZQw8RepKC
	4HUrLaWa5qfOYlbVxpYW0QbFs0rxgLPBJNw3diJciI1xoYKNUU5mtu5RrPH72gCgFiGufgHigBDLS
	TFGxwh5OAuzuxkNqSoXJKqvlMOlodF6zn+HcJuSQth7SSecZL3QdCKNZOlUFB0wpGnQsiRP0cNuGB
	1KCKHdcS8/mTZhdAMBHCtRUkUmri1DAOwOpPEifu5iw+DtHswLOE5yQgTugY3w19jEmRCepd0BdjR
	PNXpibHlSvB0SPvwFCNOYvwR1Gmbatf5RohN6pkofQIxUQEDaUam9Z73LxW2wNYHDHExVfghZmQw8
	saZHMD9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRDLB-000000054i6-3yDN;
	Mon, 16 Jun 2025 17:09:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRAo1-00000004hg4-0CuX;
	Mon, 16 Jun 2025 14:27:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 79B846115E;
	Mon, 16 Jun 2025 14:27:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A18EC4CEEA;
	Mon, 16 Jun 2025 14:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750084044;
	bh=uVv7MVHl65v5TQ5atsNpH/OqOcoy86TyB38oIyuB9Gs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m3rR1IJ5Z5MLV/cpapI9lGaiRVfRkzWtMkjIeTAvF839NaO/kONUVEoSEargbvt0g
	 ijZRzVoyBwgcbpuJEgSdEcDfdBX5IQl73mEoVRlKeablQoA5rxJhmZM689Zb5T8ToB
	 fdCwx3t8geYkoZrjO9ZGRZuG0cLuHVjdJuB9QRkFvypSEOY+zubQ6nX4XYLYsTpeC6
	 Xr+75TddJ5YYQv+Ql9NHQi03Snbt6rUPNCXf3p60MBOMoY7rB/kZOPb5VPUG+imr/r
	 GOHB1ZdDvzKneYlYz/jRpDmTL/0w0uwl8FwTKCST4fbcLlz1vwVz4OFsjw8VznQl2C
	 c5IFXgTwtfqZw==
Date: Mon, 16 Jun 2025 09:27:23 -0500
From: Rob Herring <robh@kernel.org>
To: Xueqi Zhang <xueqi.zhang@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Ning li <ning.li@mediatek.com>, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [RFC PATCH 1/8] dt-bindings: iommu: mediatek: Add mt8196 support
Message-ID: <20250616142723.GA515421-robh@kernel.org>
References: <20250616025628.25454-1-xueqi.zhang@mediatek.com>
 <20250616025628.25454-2-xueqi.zhang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616025628.25454-2-xueqi.zhang@mediatek.com>
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

On Mon, Jun 16, 2025 at 10:56:07AM +0800, Xueqi Zhang wrote:
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

What's wrong with the power-domains binding? Don't add vendor specific 
properties to a common IP block.

Rob


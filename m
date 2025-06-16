Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E58C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 06:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/zmDs8MrQsoMriWP9sJhRyhyF6eQLwTINrjtCe+Uil4=; b=PqqQFqiqGjJslxjz+kpwtidGxb
	rpVneOBIi21lCnxVZgnrXPuaivnYG4r4H5uK+64CmMRixmo4CH1U3IMvAMFxhqB9PZ/MvCQ3UAoF4
	qYakRb8GA7spO+ep4xd8R6YgS0UlodRVUKMfLZ3cRQxfKlzg4fcoNYSTGZ1xYu6dIev+j4jjtPpgQ
	tygl+ELmCZdIWBEWcDglNbAjdZbNiFZVNl9WA9bNDnAU6cxw6H8YysqiFCYSfqOIYU6v49ldBSZ/3
	XWVxwzbu/P+e96bfNrCdDu3KZwmmnOKfa/c9WewpyarvyEd60FQfy6Ha7wCJVUkKqnUZ7pe8HYmSc
	wZPmWuBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR2uJ-00000003T6L-2uGZ;
	Mon, 16 Jun 2025 06:01:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR1eH-00000003MVU-1m7e;
	Mon, 16 Jun 2025 04:40:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F289CA50CC0;
	Mon, 16 Jun 2025 04:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C9C1C4CEEA;
	Mon, 16 Jun 2025 04:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750048843;
	bh=TGHN5IjJzRSodYVswQbkuM8G3fZj/gxhvozJyWYCAMw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=KeNuXSA6uKkfHRPo9/0yzTwWwVbqXmUIEmb+pj3q9uPRXbbw7346x1/GG3vvNKl/l
	 aq8jkTvyH+g7m3oEgl71QVRighbGsfy78v8wJiaFq6HZVC5evfEYXuX0mFWGahOaYU
	 e/mAfnVayKsomZFWjzpTbP9BfTeNzdXBpnynhFTGRl3Iz11mFocQbS4rsJvY48+owE
	 IEg+VI1VKPtDdJovr9XyOihFQI0/ofEoipkgqjiA2N7ZeJReLu8JfvfFLytY8vEEwJ
	 eoRlxtj3uG/Lw6MoTKFojv46sC69BjIhFBsNC85llDRCvb2kJBbI4M+S/xbkc4VaCA
	 GfNJVfqGWtOhg==
Date: Sun, 15 Jun 2025 23:40:42 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Yong Wu <yong.wu@mediatek.com>, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Will Deacon <will@kernel.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, Ning li <ning.li@mediatek.com>
To: Xueqi Zhang <xueqi.zhang@mediatek.com>
In-Reply-To: <20250616025628.25454-2-xueqi.zhang@mediatek.com>
References: <20250616025628.25454-1-xueqi.zhang@mediatek.com>
 <20250616025628.25454-2-xueqi.zhang@mediatek.com>
Message-Id: <175004884234.2151629.17180852934991161132.robh@kernel.org>
Subject: Re: [RFC PATCH 1/8] dt-bindings: iommu: mediatek: Add mt8196
 support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_214045_631341_CFA183DB 
X-CRM114-Status: GOOD (  11.75  )
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


On Mon, 16 Jun 2025 10:56:07 +0800, Xueqi Zhang wrote:
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

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml: ignoring, error in schema: properties: compatible
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml: properties:compatible: [{'description': 'MediaTek SoCs implementing "arm,smmu-v3"', 'items': [{'enum': ['mediatek,mt8196-apu-smmu', 'mediatek,mt8196-mm-smmu']}, {'const': 'arm,smmu-v3'}]}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml: properties:compatible: [{'description': 'MediaTek SoCs implementing "arm,smmu-v3"', 'items': [{'enum': ['mediatek,mt8196-apu-smmu', 'mediatek,mt8196-mm-smmu']}, {'const': 'arm,smmu-v3'}]}] is not of type 'object', 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
Documentation/devicetree/bindings/iommu/arm,smmu-v3.example.dtb: /example-0/iommu@2b400000: failed to match any schema with compatible: ['arm,smmu-v3']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250616025628.25454-2-xueqi.zhang@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



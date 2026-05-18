Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67F5CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 12:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2PrBsO/3g+rvrUx9lCvyGjsipNuDjm5uAnA+JG+s1bw=; b=rox0j1B8q5ALE45VPTXJYAK6XE
	UTdQAKX4nzgO8M3GtO0P6VhNC/rpVtutCJd6xIpWH5SOnVvhUjN+Dce0sBGleky2H7OaDEoPuI4Vc
	kc2wu/eXCwNUwIihZALjfgEzyVErGZtkB+XzBBH/LxUleSYu5mgRTHvMvR/Yqb/e1+E0Wc6LX6CxN
	TQ9fGbndNKX5d1BCBtg5JJh0R41dL//30bE1sZSvFYPHKyiZ10zJl1y4B6Zb0pKKVfGZ/6sc8j9c9
	Lm96AaFQrhKbCBmFIUQsuLyy0XWSCAszIBZtfFBoddzgk0K8tjFQkuXGtOdcG0Agemj+1xP9Jm7yd
	S9tmfpXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxA8-0000000FeI0-31Fm;
	Mon, 18 May 2026 12:33:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxA5-0000000FeGj-2CSu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 12:33:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E115E4450C;
	Mon, 18 May 2026 12:33:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14096C2BCFF;
	Mon, 18 May 2026 12:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779107612;
	bh=v3h//Duuy7AHQQ8ShnbJDLW3E+a+LiFjIf5rtx+YwOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bPAlED3RNR9MJ+3qW2zXG2w1+/Oo/0DqssTSaiZl0JdqA8/KoaWu0DzXMU96auN2G
	 h4YTbU81AUFehiocRa1YcuuftQK81BN0RkebW51FjezL1AYfsjtn8Zz2nnh4QjoY44
	 KDy9A5G5LA//5TfwuMIW7DvvwAH1CBPHVghJWBacn3eckm92MbfeWaUBdAGAWdmILT
	 VtBKsaJHXWtc+4VSnGsKZGyPj3lwBP7yv9OaOz43fg0qNE1F1Ez3/vbZL9Dys3kwl8
	 mGzJDwMMDAQ4wkRNlV5/HtAX97YXx2N3REyt+l0TbsEUfySbFg9r6KhikF4ltjHmqS
	 QlpCTFfujwafA==
Date: Mon, 18 May 2026 14:33:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: iommu: arm,smmu: Document optional
 interconnects property
Message-ID: <20260518-mellow-robust-caterpillar-93fcaa@quoll>
References: <20260516-smmu_interconnect_addition-v1-0-f889d933f5c1@oss.qualcomm.com>
 <20260516-smmu_interconnect_addition-v1-1-f889d933f5c1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260516-smmu_interconnect_addition-v1-1-f889d933f5c1@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_053333_594835_C30E53C0 
X-CRM114-Status: GOOD (  16.90  )
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

On Sat, May 16, 2026 at 06:04:03PM +0530, Bibek Kumar Patro wrote:
> Some SoC implementations require a bandwidth vote on an interconnect

Then this should be disallowed for other devices in "allOf:".

> path before the SMMU register space is accessible. Add the optional
> 'interconnects' property to the binding to allow platform DT nodes
> to describe this path.
> 
> The arm-smmu driver uses these properties to vote for bandwidth before
> accessing any SMMU registers and releases the vote on runtime suspend.
> 
> Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 06fb5c8e7547cb7a92823adc2772b94f747376a6..5cbf944f2d3e178b3723d4dbaa19ee0d33446979 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -243,6 +243,15 @@ properties:
>      minItems: 1
>      maxItems: 3
>  
> +  interconnects:
> +    maxItems: 1
> +    description:
> +      Optional interconnect path to the SMMU register space. On some SoCs
> +      the SMMU registers are only accessible after a bandwidth vote has been

Drivers are irrelevant here, drop. Also first sentence is redundant.
Schema says what is and what is not optional.

Best regards,
Krzysztof



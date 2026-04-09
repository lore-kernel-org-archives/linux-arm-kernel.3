Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AABE9DE62
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 08:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21yOTrJ/B3IhYemXPT8N7nA43ixhW+PDClm3bW1M0dY=; b=sXg/VR5c0MkxZZCnYuc7lha2EA
	AsZypllRJVkc2N2/QqQQd1VKOZ+JYdXfvmNvmWmmRZDmqKPAx9LNal0iR3KDJvHUpXpv5xJUvs7Ps
	PKGq7NoUCX/KFqOZ/a20NNwRzv3Wehxgmw7VezQ9ClI+2i0VQZT17sAStMeSyRvWgGbbHagJTLF4U
	00X2VHl0VneSV+TOderdqJiaIoxx3l+It9ezJjVN9Z6lKgpXCkgMBZ+DgxHzxa/GmjhI0o/qf1ByT
	bsQxtoaDIp0IxkvYdWqrS4IdYtQaACJP/SiI8i24BhnDBr9gVr6bYWjZH8gAYVUO47wDG/2mFsIJU
	K92Ot4Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAkTM-00000009uvc-1gPp;
	Thu, 09 Apr 2026 08:10:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAkTJ-00000009uv2-3UBK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 08:10:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3613044536;
	Thu,  9 Apr 2026 08:10:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C7EC4CEF7;
	Thu,  9 Apr 2026 08:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775722241;
	bh=J+SGhUD52q5MWINYcfndMkcY7ldyo5b2pp4NmBb+LWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q60cZPU9qf6dJig+MFrL+jfcD6RH0ObI/ZZwaOsOToE1hixUItSRWHxg2396ZJ2I/
	 tQ4T8bsVdy6QqkGlZMxQ0EPDW18ip3rzgQrI/axSJitdOgIe3hYVa+YnbcwIbC3aNC
	 VC3T3u5ycvdTTk9etEKVVJggnwD82PKUK9F67aFXIuMSea6KusYYv1lGkjJw/WbiTV
	 x26xFdEcGWt+0ZuOK5IcjlMh1I6Uwgg50QlVg0+WgwZKUE1XqwerB271/DIOlzVkFT
	 jfOoipRfIHgX0/q/m45EolCcCZkHpEIzYbHm53LIB/7f/xSInShH2ccyrU/7COSgzj
	 R0tUajRsa09GQ==
Date: Thu, 9 Apr 2026 10:10:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/3] dt-bindings: iommu: arm-smmu-v3: Allow PMU child
 nodes
Message-ID: <20260409-outstanding-arboreal-peacock-2de6f1@quoll>
References: <20260408-smmu-perf-v1-0-d75dac96e828@nxp.com>
 <20260408-smmu-perf-v1-1-d75dac96e828@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260408-smmu-perf-v1-1-d75dac96e828@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_011041_908522_107CB345 
X-CRM114-Status: GOOD (  17.58  )
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

On Wed, Apr 08, 2026 at 03:51:15PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> The Arm SMMU v3 specification defines an optional PMCG (Performance

"optional" in a meaning some SMMUv3 implementations do not have it?

> Monitor Control Group) block. Per MMU-700 TRM, it has three 64KB pages,
> with TCU Performance Monitor Counter Group (PMCG) registers starting at
> offset 0x02000 in page 0. So PMCG could be described as a child node of the
> SMMU in Devicetree.
> 
> Add a patternProperties entry to the arm,smmu-v3 binding to allow child
> nodes matching "pmu@<addr>" and reference the existing
> arm,smmu-v3-pmcg.yaml schema.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> index 82957334bea24402b583e47eb61b5724c91e4378..1d09c5476e5f1a7c3e5c935b677641ee6cc9897e 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu-v3.yaml
> @@ -50,6 +50,10 @@ properties:
>              - cmdq-sync   # CMD_SYNC complete
>              - priq        # PRI Queue not empty
>  
> +  '#address-cells': true

Instead enum [1, 2]

> +  '#size-cells': true

Same here

> +  ranges: true

I guess only one mapping is allowed so:
maxItems: 1

> +
>    '#iommu-cells':
>      const: 1
>  
> @@ -83,6 +87,12 @@ properties:
>        register access with page 0 offsets. Set for Cavium ThunderX2 silicon that
>        doesn't support SMMU page1 register space.
>  
> +patternProperties:
> +  '^pmu@[0-9a-f]+$':
> +    type: object
> +    $ref: /schemas/perf/arm,smmu-v3-pmcg.yaml#
> +    unevaluatedProperties: false

Please add another example with 4-space indentation.

> +
>  allOf:
>    - if:
>        not:
> 
> -- 
> 2.37.1
> 


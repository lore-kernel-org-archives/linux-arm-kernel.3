Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0115C55175
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 09:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uyH3qhosLLWNc3FlTO/a9hJUBB7/XU0dA3zhQ3V9g8s=; b=3SF2a7JiisJF8zIkbLLhJNXRys
	juYpEXyMJWf/z9YEQBXV80yeRzG8mB3pJGfR0o4z/2t6NjAyIIsWvDDzTcd5m5vj46nRXAnB0320h
	mnYUF+3QFaOsD/1tFyI5bt42dFVg3QZwiGHQQjdRNLcw0l/nhQZE7V/5Gj9d/d1UMoMNQa81TEM2G
	SPWxq5l9+MCNw8NIa/tGqX8XrvIWzpKnVIDJDUMUQO+WB6OchhZu0JJ6W3w85Iv4Y6Ye4Kd4+1RrM
	P7WOkJO8wE/P2QdIAOylA5M/bGKKxclp4lQ+tZaBZ37c+HBRKNb/GofzCWucqGBXNWPceBQVKPvci
	DXBikhJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqouo-0000000GgPj-2zWz;
	Mon, 03 Aug 2026 09:24:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqoun-0000000GgPb-2Kei
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 09:24:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3310B40E1D;
	Mon,  3 Aug 2026 09:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3121F000E9;
	Mon,  3 Aug 2026 09:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785749094;
	bh=uyH3qhosLLWNc3FlTO/a9hJUBB7/XU0dA3zhQ3V9g8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S2FHA2WLBpGOYwvhxQ26xqrrS99RC6nBijLDWagQvxTndISOzIlcoSeXZKELvTay0
	 pT/TxUe8bhR3mYgsyVdQCyI0hr5gaJPBIaDk+PlLYZWixKqlS5bhyhG7GlJ31MYnuf
	 1jdFzL//DgDD/Kb2GK1riQDwMCbDBUSQSfYaDy3Rr546Nn+DBzLRbR/jKv7/Qo+oNt
	 72MWSi+uozNa8NxDao3PDtZrqgAKm1qlkc2tPjU7/ZyhNBGB5/UkQAa0cbxx4TG+Rj
	 urQmLBNm+9Wlz+u8UrPbUkzs7V73qg/grslfa6+PX38Q1XPYx9SU2V6ZNN3gXo50oL
	 sO2w1+u0dLtKw==
Date: Mon, 3 Aug 2026 11:24:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: qcom: add compatible for
 IPQ9650 SoC
Message-ID: <20260803-therapeutic-coua-of-judgment-5c6cdf@quoll>
References: <20260731-ipq9650_smmu_binding-v2-1-143a51c8ffce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260731-ipq9650_smmu_binding-v2-1-143a51c8ffce@oss.qualcomm.com>
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

On Fri, Jul 31, 2026 at 11:01:26AM +0530, Kathiravan Thirumoorthy wrote:
> Add the compatible string for the APPS SMMU present on the Qualcomm
> IPQ9650 SoC.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Changes in v2:
> - Add the proper constraints - no clocks needed for IPQ9650
> - Link to v1: https://patch.msgid.link/20260512-ipq9650_smmu_binding-v1-1-04defdaa140c@oss.qualcomm.com
> 
> To: Will Deacon <will@kernel.org>
> To: Robin Murphy <robin.murphy@arm.com>
> To: "Joerg Roedel (AMD)" <joro@8bytes.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: iommu@lists.linux.dev
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index f2188942f877..ffa33b7f4a96 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -38,6 +38,7 @@ properties:
>                - qcom,eliza-smmu-500
>                - qcom,glymur-smmu-500
>                - qcom,hawi-smmu-500
> +              - qcom,ipq9650-smmu-500
>                - qcom,kaanapali-smmu-500
>                - qcom,maili-smmu-500
>                - qcom,milos-smmu-500
> @@ -625,6 +626,7 @@ allOf:
>                  - qcom,eliza-smmu-500
>                  - qcom,glymur-smmu-500
>                  - qcom,hawi-smmu-500
> +                - qcom,ipq9650-smmu-500

This will disallow clocks also for the Adreno one, so confirm that it
also does not have clocks.

Best regards,
Krzysztof



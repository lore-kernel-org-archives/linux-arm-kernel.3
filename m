Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373D8C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 07:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pdUSqrfKkv0l/pM/dVOZ9OFMGRpHceaJ7yLAxkkeGiw=; b=sgHK3v5ZtmN1Pa9hIC+bZY+AbQ
	4bn25/fCNhfkLxHhPN9IwtIsBmIbIf4/7WIThSxrLuoXmLPmZJy4tlIuyZSbwXLXosJrkSo7QQWxp
	13xLJP8OeRc9kD7Jfbu/LZm8ArlhbfNwtj3ACUWu24DWEvufWSBUFbvMokm6Mx/2+eiKwlSdeBc2B
	VmYi+2BvuWm+7Ovtdfy+sPuto7yxPLOegWBDCK2l7ROGX/MSnD4HhP9CACBz1eu3Smh+Rk7hGPV7O
	+pDmOOFvSIhZOqS3C88jjRrgXZ2DVsmVcP5udGf2PFvhPG7z+K0xBojm8QLdVrp99Rk6GMV6MCjqT
	AmIY2cJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ter0W-0000000EjHo-1Sxk;
	Mon, 03 Feb 2025 07:36:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teqyN-0000000Ej8v-24Ia
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 07:34:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 79D91A40DE4;
	Mon,  3 Feb 2025 07:32:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEDF4C4CEE2;
	Mon,  3 Feb 2025 07:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738568062;
	bh=0fcgH6fpAU+WqDpnPrnEK4yexzXBn4fqZT+ycK7aI3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IjTAsZlHDtzcC9Z5sZbCEYC9gToKIZMZ/OC5TwV9/hg4+yroCNi++HNt2Jnozlhbs
	 sEYmt315saTQ2j0sLNP3YQ7pE21IsgKxnvIjVOBmWUsqpYzreRPI0OfA8xFbkxZIEu
	 KTqq93/+ud782OYURu18/EsiHsh2u7EnWxd+tmM7fC9XCZpoIkJyerBUMPtX8BMD3g
	 AwGntRAziBFtD7DphHTDXWtxT4mDfTCIzQavyDNd2yjvygzhJ1H8P0ApTiR9t+YJXz
	 RUURQyU5Z8CXyxQBbjHcW9l2S6jMQM6S102ll8Ot4CBxPWqBpwiFVgVvnLarsFGjQu
	 7qUw2T9pQlppA==
Date: Mon, 3 Feb 2025 08:34:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pratyush Brahma <quic_pbrahma@quicinc.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: arm-smmu: Document QCS8300 GPU SMMU
Message-ID: <20250203-demonic-melodic-jellyfish-7d2b5f@krzk-bin>
References: <20250203-b4-branch-gfx-smmu-v4-0-eaa7aa762f48@quicinc.com>
 <20250203-b4-branch-gfx-smmu-v4-1-eaa7aa762f48@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250203-b4-branch-gfx-smmu-v4-1-eaa7aa762f48@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_233423_594739_51C0785D 
X-CRM114-Status: GOOD (  10.91  )
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

On Mon, Feb 03, 2025 at 11:17:01AM +0530, Pratyush Brahma wrote:
> Add the compatible for Qualcomm QCS8300 GPU SMMU. Add the compatible
> in the list of clocks required by the GPU SMMU and remove it from the
> list of disallowed clocks.
> 
> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



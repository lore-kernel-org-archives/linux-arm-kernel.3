Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8DCCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 20:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+0lUFj5NSuJu+BZxreOeHpODEmTQ52uq2xjuqL8vQ3I=; b=DcFx9UpgMA/U62w7swrzEjyOAK
	o3d1gXak6hBd7fZowFJW7vIpM35U5MMTMJXV4WEKeYHeMOrGfBSaR1PtwVEaWdufOgxSzA+iDnCDP
	+1Gvn8+d24A87ORwABz40u7CNSiMSNIz4jgDpDtwGGceIx6R4Pc5Xt3gHAk4N2eOjlNf16Q3ovqu+
	GwCOvY6oPLjPPCPGeHxIz0lBmWfOmVhGuR2JqwszHOCdNjbAkkooKML9k0YxKUvUHClVi6ry9peSh
	s7RjHvaEW5XnG/6Q3aPepBwrool7jBHUaNGpMCx4iIvx+hrWBcyXxbZB+BCreH337aHdznR9WbSrv
	vR42pN8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUVpB-0000000Dkpr-446i;
	Tue, 02 Jun 2026 20:34:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUVp9-0000000Dko3-1bYQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 20:34:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1DA5A40B9F;
	Tue,  2 Jun 2026 20:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 798D61F00893;
	Tue,  2 Jun 2026 20:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780432495;
	bh=+0lUFj5NSuJu+BZxreOeHpODEmTQ52uq2xjuqL8vQ3I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HNHVd/2awJCfMsilFdMLK4aLaBZ+tywGoyXT8E5FNkjf/rzA2a/pu8rvl4eZiQPzA
	 NSX3MXQ92EQJV1M1WMdDiMtBy5XSDeQrk36BfIX03M6CIA5OCvbNk5xs9vKg8ObsMg
	 P2QDDjKzKcZVq7doJeMhDWqnQMomjLEaCCDhXI4UHqdo8P1vInyUg3kdwFnPFWnTOb
	 7nHWScd2SzIPNRElYxVRlEvF2tKOYBT5ghf9120vTwbyHgbWpjPK9JAuGaJf3quxb7
	 kVEgXq04EM/uZrv34FYN81MfwLEgiSQ9QOw7glkPsZXuP63z6yaqHOy1cZsDMiOlGB
	 0TD6plX5k54cA==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] dt-bindings: arm-smmu: Correct and add constraints for Hawi, Shikra and Kaanapali
Date: Tue,  2 Jun 2026 21:34:38 +0100
Message-ID: <178041486638.4030574.14208925839851561422.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520110913.87271-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260520110913.87271-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_133455_483855_5BE5FBFA 
X-CRM114-Status: UNSURE (   7.99  )
X-CRM114-Notice: Please train this message.
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

On Wed, 20 May 2026 13:09:14 +0200, Krzysztof Kozlowski wrote:
> Previous commit 75949eb02653 ("dt-bindings: arm-smmu: Constrain clocks
> for newer Qualcomm variants") duplicated constraints for
> qcom,sm6350-smmu-500 and qcom,sm6375-smmu-500 - these are already part
> of previous "if:" block.
> 
> It also missed enforcing one clock for qcom,kaanapali-smmu-500 in GPU
> case and missed simultaneously added Shikra and Hawi.
> 
> [...]

Applied to iommu (arm/smmu/bindings), thanks!

[1/1] dt-bindings: arm-smmu: Correct and add constraints for Hawi, Shikra and Kaanapali
      https://git.kernel.org/iommu/c/aab556d118fc

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


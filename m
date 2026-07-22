Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDECC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 21:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2G9r8fYaB8St4kBB8vENlcvsH0RfySNRNVJF+kfQiu4=; b=XMOlIFUELuPKt9DAYzyYTTShSD
	nuOjORUum/Bka5M4d++jNTvYqIl4taZcCdUDl90kk4gyyydR8PREef7MJTEltBZcAT6JBbALzDpg0
	FN8w7o3PBtgHvnBYbj0EnxvHALqg99JJGrYHe5zTgUTTnCzyuIoM5W0/wohjEleO0lAop+KTK/iBi
	W8mGSQQRYhKPzBMBz6SW+L7lbxK+Kb/tbM2Fwa/QBXmAhgUHj5pMGIETcy5801DQS/W7+AHMyN7uf
	hIXwjuMomt5TDbcnhXQLXfnu5d/4M/TYeJK9ZML4ERZMpMpqjLYN6RwQTBu1q0I3d4eeb8AHUWuvV
	d0Doh8BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmeg0-0000000CpXT-31u0;
	Wed, 22 Jul 2026 21:40:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmefi-0000000CpQi-0wGf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 21:40:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A7490600AB;
	Wed, 22 Jul 2026 21:40:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 252371F000E9;
	Wed, 22 Jul 2026 21:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784756409;
	bh=2G9r8fYaB8St4kBB8vENlcvsH0RfySNRNVJF+kfQiu4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GRFVJwQUBcgIyLolEYyvXJuKd3lKIxn9edV9NAE2+3Fe4+Z+GtuDjBP0XkgwUDNc6
	 iEZnKI3p3194E9CeZWpkJGoc/ffJoduQa5ntardIArgzrEtAB78EvLZvGxIJHPpptC
	 01EvEELLoqDIdBbO+DsulNqnyfe16P7b15ZjzUIzzs9zaLrtapuq6RZB9vfl+IF5pI
	 CGyIURFRjaw1EfLTCFEJd4l9tpYxzaK5fsVhH2zUxItNOY+SUTGjUlf039LCNDjQ0w
	 AhBBCoEX6k4eZa1xYaSjZiTd6r7BJrcvi1ZZmlUyrQUpbqkhO5pLOCjSZYBT9DRbIm
	 LZHN3HzH7EEgA==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	aiqun.yu@oss.qualcomm.com,
	tingwei.zhang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com,
	yijie.yang@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: arm-smmu: qcom: Add compatible for Maili SoC
Date: Wed, 22 Jul 2026 22:39:24 +0100
Message-ID: <178472685795.2885692.14366470703772895331.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260703-maili-smmu-v3-1-b48de6f5ae4a@oss.qualcomm.com>
References: <20260703-maili-smmu-v3-1-b48de6f5ae4a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 03 Jul 2026 00:50:33 -0700, Jingyi Wang wrote:
> Qualcomm Maili SoC includes apps smmu that implements arm,mmu-500,
> which is used to translate device-visible virtual addresses to
> physical addresses. Add compatible for it.
> 
> 

Applied to iommu (arm/smmu/bindings), thanks!

[1/1] dt-bindings: arm-smmu: qcom: Add compatible for Maili SoC
      https://git.kernel.org/iommu/c/7b97226bfb4f

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev


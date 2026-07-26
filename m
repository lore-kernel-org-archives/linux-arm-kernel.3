Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C050FC53200
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 12:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TaLiMtvY0m9e9or7P0HE6bTdSoChv2t1ZP3SmHJfHYo=; b=O4ktrY/OXKv/JhiOAEkY25ApQs
	m9yOePcydlocr72AYWzeJ580AVCqe+tydSwQSPJ8yD+I5H4k+JjBnaGk332NrFes/EOPd5p4KvMcM
	kRcf2uH+GUyVOv0tUbl+Dgr/MsP25EXgUpWBWu/lKZ0/Xe6W5S2hjrW7maL8+Gs+BjeCqMVMmdvol
	H0AYo5XU5FG+iEAF/sJLM7jG9gNiAjVZdYcmqenY7ZwhSx9YqAOT70P2p9ow4rgGrtpc0HP2CQlIS
	Nd46yeeSyf2tyn78ZNZKazSi5ZGXOwzIIfBqfsOQO+lMgicizzu6qPrsWVUbqo2XVn1RPFH3UuNx+
	bUuPFqlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnyQN-00000001BA6-1yt4;
	Sun, 26 Jul 2026 12:57:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnyQM-00000001B9n-1rcu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 12:57:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B24843BE0;
	Sun, 26 Jul 2026 12:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3F111F000E9;
	Sun, 26 Jul 2026 12:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785070664;
	bh=TaLiMtvY0m9e9or7P0HE6bTdSoChv2t1ZP3SmHJfHYo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bkOvWz1dNFkbQBJJDi5AgASXRmeBvtAHtBSNTQanG/hsstvCS7p4NTpeWSKq3O2SK
	 /107V2BRROkrNMu58bBG6f+tHcQNlyGSYxOOk0i+gG2MlAtdewK8lTDU+ETDh/zhuv
	 p4BUtIJHryrQwAOjZiogmP3tRrGJOO8PCOgCiySJU14b+kh7xXTV/na0ZBEji46myf
	 zaNCo5crj6/nQracdJbws4jSFbhHBemZeTzrl9h7RlJNwhqIWsTiHvHpNsgY2KyPGI
	 dDAH96UMleqWWKKzVA0Qq5iRKvRv2v+k3E13K0+Wk+cgSOxFxBRGY40Z93dQyAZshP
	 JtKSOgE4MBVKg==
Date: Sun, 26 Jul 2026 13:57:38 +0100
From: Will Deacon <will@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jason Gunthorpe <jgg@nvidia.com>, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/11] iommu/tegra241-cmdqv: Warn on a VCMDQ base
 above the 48-bit hardware limit
Message-ID: <amYEQt7Y5MC48kRD@willie-the-truck>
References: <cover.1784059577.git.nicolinc@nvidia.com>
 <4e638ec1bbff46a358b4129e264fef66b4f37703.1784059577.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e638ec1bbff46a358b4129e264fef66b4f37703.1784059577.git.nicolinc@nvidia.com>
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

On Tue, Jul 14, 2026 at 01:55:07PM -0700, Nicolin Chen wrote:
> tegra241_vcmdq_alloc_smmu_cmdq() allocates the VCMDQ buffer via the common
> arm_smmu_init_one_queue(), which uses smmu->dev and its coherent DMA mask
> of DMA_BIT_MASK(smmu->oas). The architectural Q_BASE_ADDR_MASK is 52 bits,
> but the Tegra241 VCMDQ_BASE holds only 48 (VCMDQ_ADDR), so the masked write
> "q_base = base_dma & VCMDQ_ADDR" silently drops bits 48 and up.
> 
> A real Tegra241 never reports a 52-bit OAS alongside the 48-bit VCMDQ, so
> this cannot happen on correct hardware, but a buggy or hostile hypervisor
> could still advertise such an OAS to a guest. The user-VCMDQ path already
> rejects a base_addr_pa with bits set outside VCMDQ_ADDR; add the same guard
> to the kernel-allocated path, failing the queue init rather than silently
> truncating the base. Use dev_warn_once() rather than WARN_ON(): the OAS is
> hypervisor-controlled, and a WARN_ON() would let it panic a guest that is
> booted with panic_on_warn.

So here you talk about "a buggy or hostile hypervisor". Is that really
part of the threat model? Presumably such a thing could cause havoc in
a million other ways?

> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> index f93e59b7bd2db..d27ee215032f7 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> @@ -674,6 +674,19 @@ static int tegra241_vcmdq_alloc_smmu_cmdq(struct tegra241_vcmdq *vcmdq)
>  	if (ret)
>  		return ret;
>  
> +	/*
> +	 * The q->base_dma is bounded by DMA_BIT_MASK of SMMU's IDR5.OAS. On a
> +	 * real hardware, VCMDQ_ADDR mask and IDR5.OAS are always aligned. But
> +	 * a buggy VM might set a mismatched IDR5.OAS for SMMU. Spit a warning
> +	 * instead of a silent truncation.
> +	 */

But then here you talk about "a buggy VM might set a mismatched IDR5.OAS".
How can a VM write to that?

/confused

Will


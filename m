Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8422C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 14:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nxvh1p7c+pmINXdKN73uo5IY1gh+WpjKlssK5VfeCXo=; b=r06ozp9sMI7E7Wbi9V5t/lzFVl
	+OnlmyV3f1NWdsrdkOv13EQJO+2mYlyd3/DQAIeNmuCacl7afSKapLp2C66Dh6wYY6s873lJoCRjf
	SCFZJ06jDH7MnkqKm17a6jqEV/2mfp6lsEqBajsyxyZ2WJALgZlTeVM8VdJceqve3grg1d9tOpODW
	aXjA6ukdBhKsnmes8k914sLbgkLpCOOIdxBRwcN7x0eQ2TdHxea+y/JtMTilSOChDHHqX1ADHQlO1
	OE4ve6dvcTwfPrFajGy/TCJN4t8VOnExNrYrUNWqhTTKSG1159L2gKZFT7GoSQc1SVnmfqgHDyPnP
	rhxxcJMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnzPj-00000001Dh1-1EU2;
	Sun, 26 Jul 2026 14:01:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnzPi-00000001Dgv-0wgt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 14:01:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 96B60408B5;
	Sun, 26 Jul 2026 14:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 155051F000E9;
	Sun, 26 Jul 2026 14:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785074469;
	bh=Nxvh1p7c+pmINXdKN73uo5IY1gh+WpjKlssK5VfeCXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZYrWiv6lnewCJxRk8PU+8AH+7ylGoDEVNKoyBrEB0R3qJuNyodqNYlaOovH2zRS3l
	 Z4RaYhWufNPLIIphrwj9yaX3UJoc05Sc3M/nhAotFR5sPGnkXn9QmmfGmOXYDRgwZ2
	 ChEcCqyqQsSTS+ZDikAzrUHfvLW6ljHyhMemmfhbQlyKPNPnvLp1UTu5+BmqmhueMW
	 q6HBcoie2oDZ6jmef3u/3m2ZMQxQ86Jy9veZxMFYn+RMNy1hMoH2S2b55rfQBZ5SJH
	 UHhlkChaAVQ2lOJG+V7C+UDptE+8t21Vtw9Jy5u5PIBj6WxeSZ8gCQPLZQXTCWE9yX
	 upWVDzr/bRh+w==
Date: Sun, 26 Jul 2026 15:01:04 +0100
From: Will Deacon <will@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	oupton@kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, vdonnefort@google.com, tabba@google.com
Subject: Re: [PATCH] KVM: arm64: Use consistent type for pool size
Message-ID: <amYTIE8QujqyYyDG@willie-the-truck>
References: <20260715150125.2798116-1-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715150125.2798116-1-smostafa@google.com>
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

On Wed, Jul 15, 2026 at 03:01:25PM +0000, Mostafa Saleh wrote:
> All the pool sizes in the hypervisor are "unsigned long" but when
> they get passed to hyp_early_alloc_contig() or hyp_pool_init() they get
> truncated to 32-bits.
> 
> That is not a big problem at the moment as to overflow this we need
> 4G bytes of carveout (2 TB of host or guest system memory).
> 
> However when new users are added (as IOMMU) it is hard to reason
> about the carveout size anymore.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
> For example in the SMMUv3 to avoid this overflow, I add a cap
> for the pools size to UINT_MAX to work around this:
> https://lore.kernel.org/linux-iommu/20260715115906.2664882-9-smostafa@google.com/
> ---
>  arch/arm64/kvm/hyp/include/nvhe/early_alloc.h | 2 +-
>  arch/arm64/kvm/hyp/include/nvhe/gfp.h         | 4 ++--
>  arch/arm64/kvm/hyp/nvhe/early_alloc.c         | 2 +-
>  arch/arm64/kvm/hyp/nvhe/page_alloc.c          | 6 +++---
>  4 files changed, 7 insertions(+), 7 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A1AE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 21:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/JtqkswqPtidrvUwbscz9qFCApJnJKi71RGMev7qMI=; b=q/NOvblaWYnjf7zzCDmIhqS940
	uT8R6jqXyUWJKnJnfP3wlu1KuScfQABBTDbvd+joPEAaPvg+VVY+yVb5F0JKRqFeU67O4D+VW4gPD
	35jx7fGtBEr1pCgp4kITkpLq7c0RRq38kP+AdgpniJ3SVNfFEmPEeX9qEUOAtem6FhpzTrxhxq1R2
	iZ505vqY4TNPN4Vvy/2vYUlhZa4TVq2eOCmdpRPrS0lxaT50glqg6yrpiuSqigq5xqzZ0KTrryEgz
	UhFqIfKJ4G1aRU82Bcv7sI7i8dMW/JgaE/r9PeoPf0YuC7F0iIMUvtd4bb3IhEDhtBgCd5DCn/sHy
	uZWRQBXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLUVm-0000000GDgP-1pCY;
	Wed, 11 Dec 2024 21:44:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLUUi-0000000GDWK-3aKU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 21:43:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CF7905C4396;
	Wed, 11 Dec 2024 21:43:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0DFAC4CED2;
	Wed, 11 Dec 2024 21:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733953424;
	bh=C1XymWqfodxSnsIvmXLKqjg7LIUnl1Qfra4eDbeAd/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fKvnV9kXvmCjXmLPPKS4tLsHWN9qQvZDMulx8M0mYORsaYyFdu/BxUw88PDSuLIdC
	 G2yAG8Qhp4RkoJsd47nnbXFLnsHLWQLZ47lkHKJvi8bFu3f4xEgxncifgLqto7IkA/
	 UQGnn/9QQqvZg1+FwPk3UxhrcgH+ciegg8p2Aq0C2eNQEb82ljzck6BlzHGL0+Grl3
	 JoNVRuc04uY3h4pay24pyaeKYfQQH0z+RRdOPuXorC/xYfHQ3IJhDQ/bFW32xH178/
	 sjjR6tweESRmNTrPvhMicFuSFsfJ2VEVcFisSh8gumUVGhnnN5+s/ZFTC5oUFNUsal
	 oxDyNzeAUg8gg==
Date: Wed, 11 Dec 2024 21:43:39 +0000
From: Will Deacon <will@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64/Kconfig: Drop EXECMEM dependency from
 ARCH_WANTS_EXECMEM_LATE
Message-ID: <20241211214338.GC17486@willie-the-truck>
References: <20241210043257.715822-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210043257.715822-1-anshuman.khandual@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_134344_933604_A8088C72 
X-CRM114-Status: GOOD (  19.12  )
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

On Tue, Dec 10, 2024 at 10:02:57AM +0530, Anshuman Khandual wrote:
> ARCH_WANTS_EXECMEM_LATE indicates subscribing platform's preference for
> EXECMEM late initialisation without creating a new dependency. Hence this
> just drops EXECMEM dependency while selecting ARCH_WANTS_EXECMEM_LATE.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v6.13-rc1
> 
> Changes in V2:
> 
> - Dropped generic EXECMEM config changes per Catalin
> - Updated the commit message as required
> 
> Changes in V1:
> 
> https://lore.kernel.org/all/20241209031251.515903-1-anshuman.khandual@arm.com/
> 
>  arch/arm64/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index b5479c8b454c..b146372bc365 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -113,7 +113,7 @@ config ARM64
>  	select ARCH_WANT_FRAME_POINTERS
>  	select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || (ARM64_16K_PAGES && !ARM64_VA_BITS_36)
>  	select ARCH_WANT_LD_ORPHAN_WARN
> -	select ARCH_WANTS_EXECMEM_LATE if EXECMEM
> +	select ARCH_WANTS_EXECMEM_LATE
>  	select ARCH_WANTS_NO_INSTR
>  	select ARCH_WANTS_THP_SWAP if ARM64_4K_PAGES
>  	select ARCH_HAS_UBSAN

tbh, I really don't see what we gain from this change but it also
looks harmless. *shrug* I guess I can pick it up.

Will


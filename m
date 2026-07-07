Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9738FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 08:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTSJ4xsyzoONcIdLlgIGjWbwlYSnLT61TvHaP7mdIgw=; b=JiZI8uNbliYar6P4+DW1p+Deyr
	emDDUKJqR+pOYndUmG68g1/9etLHxQOH3c19c6w1t9bxBxjDpo0L2WRGJ0A4I1H4gtMyvIV93vRrU
	wMSXFepSAjgrOCDFlvSdmGPcTYvG7kIqGcboisuhS88mcMyqtu3Y3C5MITbZ7utdKR9u29szZuZxk
	Kcz7MdUKriyAw0T0KJWQUlhUWg7fCceVxQtAQv2Zeol/Oxhf+cq0ZVSEPfNdrz7FXUXtcAwsn5dj7
	Isob+1tex5WTDnFg637pA4El9Voo+vI3ASMoE5zgldzoNe/rPeUG9N0pjmdH/JAxKhBUAxMHb0nGQ
	/SfDIthA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0l1-0000000EP12-0XHF;
	Tue, 07 Jul 2026 08:02:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0ky-0000000EOz9-08rf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 08:02:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A782D41799;
	Tue,  7 Jul 2026 08:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEA861F00ACA;
	Tue,  7 Jul 2026 08:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783411335;
	bh=kTSJ4xsyzoONcIdLlgIGjWbwlYSnLT61TvHaP7mdIgw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=nQjJNRhl+r/W/u9qXzDqVMPh4zwmtWaBltEzFh15EEIllFyM0jg+AX/7SWbOFs2t8
	 qM16nLQWUV26X8wkpnzQ5K5yadCQ6UxGc8gjFSOzOpW8n80Daw0UKxWvVSN+8qv4gT
	 bQZXZGXKISj+LgU61s+owZflJXNViLDl7MCWLSVYnGSDC82R4+UlRSF9Jr8CbAkDzc
	 nUu22CLjPUey9/QNdSw1uTrcC6DhefR0Zwo39g8GmeamTO+PjBpkajv212figU/igP
	 Chb+GpJshN1pNs7mtgJa22VY0lCi8+m2sSJdhAKkVul30/KrT33tmF5BovLMaRLw/P
	 V843Xc8O7txXw==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Mostafa Saleh <smostafa@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, will@kernel.org,
	rppt@kernel.org, maz@kernel.org,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 0/3] arm64/coco: Convert pKVM to a CC platform
In-Reply-To: <20260603110522.3331819-1-smostafa@google.com>
References: <20260603110522.3331819-1-smostafa@google.com>
Date: Tue, 07 Jul 2026 13:32:09 +0530
Message-ID: <yq5ay0fngrcu.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Mostafa Saleh <smostafa@google.com> writes:

> The goal of series is to convert pKVM as a CC platform similar to
> ARM CCA, that makes CC guests consistently discovered which avoid
> breaking it by the ongoing DMA rework [1]
>
> The first patch is a minor clean up I noticed while reading the code.
>
> And the second patch is a bug fix found by Sashiko.
>
> The third patch is the main one.
>
> [1]https://lore.kernel.org/all/20260522042815.370873-1-aneesh.kumar@kernel.org/
>
> Mostafa Saleh (3):
>   arm64/mm: Simplify SWIOTLB setup in arch_mm_preinit()
>   drivers/virt: pkvm: Fix end calculation in mmio_guard_ioremap_hook()
>   arm64/coco: Add pKVM as a CC platform
>
>  arch/arm64/include/asm/hypervisor.h           | 13 ++++++++++
>  arch/arm64/include/asm/mem_encrypt.h          |  3 ++-
>  arch/arm64/kernel/rsi.c                       | 12 ---------
>  arch/arm64/mm/init.c                          | 26 +++++++++++++------
>  drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c |  5 +++-
>  5 files changed, 37 insertions(+), 22 deletions(-)
>
> -- 
> 2.54.0.1032.g2f8565e1d1-goog

A rebased dma-rework tree on top of the pKVM changes can be found at:
https://gitlab.arm.com/linux-arm/linux-cca/-/tree/scratch/pkvm/testing?ref_type=heads

I was able to successfully boot a protected VM using the latest version of kvmtool.

Tested-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>

-aneesh


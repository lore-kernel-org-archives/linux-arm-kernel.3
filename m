Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF28CD13D3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 07:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTgGGs9dcqMOl4Ip5GSSCaOb5JnkJVElU2Fn4uPMZjo=; b=gwoU8wkJcfRHdN+LPorw1EXXIw
	bNPwgIKPx0l1iTCkg1CnMvBCrWdMwYxU6sp6pyX6EdedC0NfYH73pDhrlw3pu4RSVCV2TW0aPxhJX
	x5Tdx+Um1EsTqnuwd2CbvWdUZ8H2VdJakAy+AXzieBYdDRaPqyJ1WuqGnAbgZcLhASHJKDNST5Z/k
	VAkb/GjvOmO7SuWaizCidXVAz93GeWOeu4Ftizd25faJbTiVawF411/YHyhz8Lvf1yZwYpLxBQb0D
	SLJPf3Y4qqx6luuTSVFg30QqNarbht+kTYvqmvEzjS0KBJgqumS7Xk6FMbDLMHFGi1la+EfaITXtd
	4wy6UOEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIMBf-00000004vpx-32Im;
	Thu, 30 Apr 2026 07:51:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIMBd-00000004vpT-32Eu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 07:51:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D0E543BEB;
	Thu, 30 Apr 2026 07:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F388BC2BCB3;
	Thu, 30 Apr 2026 07:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777535512;
	bh=omB0cPFbcJR1aTGvPYweI9ttFbTkvnjHz/3tBImfyz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CGniRKjJDcMMa+jSknbvc9Rlummh2xbrcKzH/WE1LLyNzkl59cwhYEQjYfjQN7dCe
	 FpAJqKGNqTg0dIwcGwdcS3TFE7jOFf9170gwhmosrvUBiGsGlfu/ygW5ExQyKZhrf0
	 UTbcWVDnrruLV6BZ/bEZDpdegBXf/Sm/n6LkUhCL0G2ZoAHoqcG1Zy6ZUUbK9jhC9O
	 vDoPQOcXEjkxZPeX7iWjUbMfUGR5V/JUkJr2dQSR1gUtBGb7hnSlEGkcy5tar8+Aj1
	 aiMC2K8VpH3LtzRHO34kgl2c7INJm6vAybmMw+VY4/DnUeLW5XvbmATH3cuMazUJpk
	 oHPRLtkYNNdIQ==
Date: Thu, 30 Apr 2026 09:51:46 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>,
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Rename ptdesc_t
Message-ID: <afMKEgJGWZpZjZub@kernel.org>
References: <20260430034933.541634-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430034933.541634-1-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_005153_805681_F5490223 
X-CRM114-Status: GOOD (  14.81  )
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

Hi Anshuman,

On Thu, Apr 30, 2026 at 04:49:33AM +0100, Anshuman Khandual wrote:
> ptdesc_t sounds very similar to the core MM struct ptdesc which is actually
> the memory descriptor for page table allocations. Hence rename this typedef
> element as pxxval_t instead for better clarity and separation.

Maybe we should keep the "pt" prefix and make it "ptval_t"?
No really strong feelings, so

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: linux-efi@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> This patch applies on v7.1-rc1
> 
> Took the liberty in including David's tag from an internal discussion.
> 
>  arch/arm64/include/asm/io.h            |  2 +-
>  arch/arm64/include/asm/pgtable-types.h | 14 +++++++-------
>  arch/arm64/include/asm/ptdump.h        |  8 ++++----
>  arch/arm64/include/asm/tlbflush.h      |  4 ++--
>  arch/arm64/kernel/efi.c                |  4 ++--
>  arch/arm64/kernel/pi/map_kernel.c      |  2 +-
>  arch/arm64/kernel/pi/map_range.c       |  4 ++--
>  arch/arm64/kernel/pi/pi.h              |  2 +-
>  arch/arm64/mm/mmap.c                   |  4 ++--
>  arch/arm64/mm/pageattr.c               |  2 +-
>  arch/arm64/mm/ptdump.c                 |  2 +-
>  11 files changed, 24 insertions(+), 24 deletions(-)

-- 
Sincerely yours,
Mike.


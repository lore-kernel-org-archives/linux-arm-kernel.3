Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50571E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 13:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTrdPVTMOYbC0HGP0Z8th4Y0f11jljC0ZUbkXJEDWRE=; b=PD6x+k66kFO7SI1HuVRaRpDk8x
	TaPg9A7Kyr8h2tpPVs4YaocMUnzX8Y9iW6eoqlMk7++F1ly7INnN90nTE95zNQWop8a04P0TT88B3
	zgUhSMSEvY8SqJS6rRWJWQjQzg0xFX6iBLpdTVSjFXzRLK+JeyiA6m73jftcj2u7lh67SaZ8e0npE
	480Uxh0CK9XhPmHDaLvDtHTesAG6RvW4cu04rIx4dvDBjZW8hk7CKnbto3E9sXW+KLqe7KbMqa3hz
	ez0i2WviIYzxB0NDMpyPeQdsOno05LR7XBoxF4Sr3OQlU8cfLfcleOFFXaKN8zEVbNq4RoDouSv6Y
	VXvHpWhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVWaV-00000008ico-1lrh;
	Wed, 08 Jan 2025 13:59:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVWZG-00000008iM2-2uL2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 13:57:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2359B5C06DD;
	Wed,  8 Jan 2025 13:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78464C4CED3;
	Wed,  8 Jan 2025 13:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736344673;
	bh=wmOD3/ePyiIrov1ZtCkwH0y9xDdaiutIW9EoEfDt2NE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ryLpxZKF8Jk7BLihK2lHrg8eyeZUw8eo4NomOqHOcvmSWEZa8fRfDAVZjPp/KYbEV
	 8GG/DhSmPzBet4Hybnv+TCVHu8SU1GEALYhaT5lokvah/MYWxwjBURh9LtYqU/H+lM
	 w7ttyT88XkN1QK1837+vCIO7qIpChjnv9UHvJbMCfpQCpSfc0VsvTHBujcU6/GSyR6
	 b/ZaLoEX23rTgqrEKRzmnMTWIgzGYkVrm0jDVN8cvTJxDJNL6Dm34gW4XlwTtUtFGV
	 dd3NZTKyiQs7++zRi0G4keF00Pk8OH8yV2DyUcAo1VRUxrpRz6+cHZgVR2GesOfVQN
	 J/HSCts+EUE9w==
Date: Wed, 8 Jan 2025 13:57:48 +0000
From: Will Deacon <will@kernel.org>
To: Sangmoon Kim <sangmoon.kim@samsung.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, ardb@kernel.org
Subject: Re: [PATCH] docs: arm64: update memory layout for vmemmap region
Message-ID: <20250108135748.GA9367@willie-the-truck>
References: <CGME20250102065607epcas1p296c550a7ba26884e1c2810f872e537f4@epcas1p2.samsung.com>
 <20250102065554.1533781-1-sangmoon.kim@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250102065554.1533781-1-sangmoon.kim@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_055754_819207_0D00C082 
X-CRM114-Status: GOOD (  17.38  )
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

On Thu, Jan 02, 2025 at 03:52:37PM +0900, Sangmoon Kim wrote:
> Commit 031e011d8b22 ("arm64: mm: Move PCI I/O emulation region above
> the vmemmap region") and commit b730b0f2b1fc ("arm64: mm: Move fixmap
> region above vmemmap region") have placed PCI I/O and fixmap region
> above vmemmap region.
> 
> And commit 32697ff38287 ("arm64: vmemmap: Avoid base2 order of struct
> page size to dimension region") has moved vmemmap region to higher
> address.
> 
> Update document as the memory layout modified by the previous patches.
> 
> Signed-off-by: Sangmoon Kim <sangmoon.kim@samsung.com>
> ---
>  Documentation/arch/arm64/memory.rst | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)

To be honest with you, this document is pretty stale (it doesn't even
mention 16k pages) and almost impossible to keep in-sync with the code.
I'd be inclined to remove these tables; we have ptdump support if people
really want to see where things are.

Will

--->8

diff --git a/Documentation/arch/arm64/memory.rst b/Documentation/arch/arm64/memory.rst
index 8a658984b8bb..678fbb418c3a 100644
--- a/Documentation/arch/arm64/memory.rst
+++ b/Documentation/arch/arm64/memory.rst
@@ -23,71 +23,6 @@ swapper_pg_dir contains only kernel (global) mappings while the user pgd
 contains only user (non-global) mappings.  The swapper_pg_dir address is
 written to TTBR1 and never written to TTBR0.
 
-
-AArch64 Linux memory layout with 4KB pages + 4 levels (48-bit)::
-
-  Start			End			Size		Use
-  -----------------------------------------------------------------------
-  0000000000000000	0000ffffffffffff	 256TB		user
-  ffff000000000000	ffff7fffffffffff	 128TB		kernel logical memory map
- [ffff600000000000	ffff7fffffffffff]	  32TB		[kasan shadow region]
-  ffff800000000000	ffff80007fffffff	   2GB		modules
-  ffff800080000000	fffffbffefffffff	 124TB		vmalloc
-  fffffbfff0000000	fffffbfffdffffff	 224MB		fixed mappings (top down)
-  fffffbfffe000000	fffffbfffe7fffff	   8MB		[guard region]
-  fffffbfffe800000	fffffbffff7fffff	  16MB		PCI I/O space
-  fffffbffff800000	fffffbffffffffff	   8MB		[guard region]
-  fffffc0000000000	fffffdffffffffff	   2TB		vmemmap
-  fffffe0000000000	ffffffffffffffff	   2TB		[guard region]
-
-
-AArch64 Linux memory layout with 64KB pages + 3 levels (52-bit with HW support)::
-
-  Start			End			Size		Use
-  -----------------------------------------------------------------------
-  0000000000000000	000fffffffffffff	   4PB		user
-  fff0000000000000	ffff7fffffffffff	  ~4PB		kernel logical memory map
- [fffd800000000000	ffff7fffffffffff]	 512TB		[kasan shadow region]
-  ffff800000000000	ffff80007fffffff	   2GB		modules
-  ffff800080000000	fffffbffefffffff	 124TB		vmalloc
-  fffffbfff0000000	fffffbfffdffffff	 224MB		fixed mappings (top down)
-  fffffbfffe000000	fffffbfffe7fffff	   8MB		[guard region]
-  fffffbfffe800000	fffffbffff7fffff	  16MB		PCI I/O space
-  fffffbffff800000	fffffbffffffffff	   8MB		[guard region]
-  fffffc0000000000	ffffffdfffffffff	  ~4TB		vmemmap
-  ffffffe000000000	ffffffffffffffff	 128GB		[guard region]
-
-
-Translation table lookup with 4KB pages::
-
-  +--------+--------+--------+--------+--------+--------+--------+--------+
-  |63    56|55    48|47    40|39    32|31    24|23    16|15     8|7      0|
-  +--------+--------+--------+--------+--------+--------+--------+--------+
-            |        |         |         |         |         |
-            |        |         |         |         |         v
-            |        |         |         |         |   [11:0]  in-page offset
-            |        |         |         |         +-> [20:12] L3 index
-            |        |         |         +-----------> [29:21] L2 index
-            |        |         +---------------------> [38:30] L1 index
-            |        +-------------------------------> [47:39] L0 index
-            +----------------------------------------> [55] TTBR0/1
-
-
-Translation table lookup with 64KB pages::
-
-  +--------+--------+--------+--------+--------+--------+--------+--------+
-  |63    56|55    48|47    40|39    32|31    24|23    16|15     8|7      0|
-  +--------+--------+--------+--------+--------+--------+--------+--------+
-            |        |    |               |              |
-            |        |    |               |              v
-            |        |    |               |            [15:0]  in-page offset
-            |        |    |               +----------> [28:16] L3 index
-            |        |    +--------------------------> [41:29] L2 index
-            |        +-------------------------------> [47:42] L1 index (48-bit)
-            |                                          [51:42] L1 index (52-bit)
-            +----------------------------------------> [55] TTBR0/1
-
-
 When using KVM without the Virtualization Host Extensions, the
 hypervisor maps kernel pages in EL2 at a fixed (and potentially
 random) offset from the linear mapping. See the kern_hyp_va macro and


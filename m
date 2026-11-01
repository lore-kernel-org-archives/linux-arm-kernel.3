Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0AC606DB66
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PM9wsrFl;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dkhr+eF3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1QVLcxKIGpBrR1ls29kmgMJV8dBu1FUp9t501+9SlJY=; b=PM9wsrFlEL5Mmu
	MuL1BTed36oHlInCsj0bg6BM+/EH97fwkdPVNzzNwYac+VsOtWIT7q9SkCpCZNtAdygEb4uk3FzKw
	h7bbXO5yVpls5k9WL91rF/390sQYiM7m96AzFiJ8JiLaw+8U/hNdKHIjb14ArsAFw0mlr236Zhbs3
	uxiJnQERHrVObqnICfhqI2rhnH09UUBXURyWAmVQvZ8jXjlLXNCnYGhzGBIHbQFQC/VrOGFkvBMyw
	eHY5YZQpErv8iEwMjOmdhFr48yYfNfCm4J4Sa/izGnsEQiqXkXSNvJRBDRHROcS3H9X9RKUfP47UP
	WsucR9I84NkW6dA63QFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqh-0000000F07p-2nxh;
	Sun, 01 Nov 2026 22:16:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqO-0000000EzJY-15Ky;
	Sun, 01 Nov 2026 22:16:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B123D41FEF;
	Sun,  1 Nov 2026 22:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 887CB1F00A2C;
	Sun,  1 Nov 2026 22:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571363;
	bh=1QVLcxKIGpBrR1ls29kmgMJV8dBu1FUp9t501+9SlJY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=dkhr+eF3q1vLH5j+Vt4HH9N1vxJVl63OY3ZWjO6x3dSLn6eQyYKacs6+oM+3Qn+lI
	 thS97Vkt+DR9px4LyR/SisaZrzLD9G4XkXITq3BcSDr6ocIppa7a8idnye+qEIqM/4
	 lA297xuw1etIPcz1D0z9fjeTfmdqf6SQPW4T9L8XHNuLzhxg5drxCmE0d9RsQKGE7f
	 z+lpwxPVzUbcNwvBGGrQmdsobEkchSaH6YXFrcneezcbTudB2i/2DWGMJc6AtOWD6C
	 C8++koYKIE/Rb+G/udcYaxQ5Bv2MDWCQ3FwdoYvX/c9BzD2IHxxqLnrHL9kBU1vqtn
	 vMh0jbZFxh6bw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7D35B38003B8;
	Sun,  1 Nov 2026 22:16:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RFC 00/18] arch, mm: create a generic
 set_memory/change_page_attr core
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357136205.2624073.6611857519856364383.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:02 +0000
References: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
In-Reply-To: <20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-mm@kvack.org,
 aou@eecs.berkeley.edu, akpm@linux-foundation.org, luto@kernel.org,
 bp@alien8.de, jackmanb@google.com, catalin.marinas@arm.com,
 dave.hansen@linux.intel.com, david@kernel.org, chenhuacai@kernel.org,
 mingo@kernel.org, mingo@redhat.com, kevin.brodsky@arm.com,
 liam@infradead.org, ljs@kernel.org, mhocko@suse.com, palmer@dabbelt.com,
 pjw@kernel.org, peterz@infradead.org, hpa@zytor.com, surenb@google.com,
 tglx@kernel.org, vbabka@kernel.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, x86@kernel.org, dave.hansen@intel.com,
 jgross@suse.com
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This series was applied to riscv/linux.git (fixes)
by Dave Hansen <dave.hansen@linux.intel.com>:

On Tue, 21 Jul 2026 19:23:23 +0300 you wrote:
> Currently there are 6 independent implementations for set_memory and
> set_direct_map APIs.
> 
> With increasing demand for kernel page table manipulations, for example
> "Direct Map Removal Support for guest_memfd" [1] and "mm: ASI direct map
> management" [2], it makes sense to have a generic core for kernel page
> table manipulation in mm/ with helpers in the architecture specific
> code.
> 
> [...]

Here is the summary with links:
  - [RFC,01/18] x86/mm/pat: Don't gate cpa_lock on debug_pagealloc_enabled()
    (no matching commit)
  - [RFC,02/18] x86/mm/pat: fix effective RW computation in lookup_address_in_pgd_attr()
    https://git.kernel.org/riscv/c/ebaf7c9bbb1e
  - [RFC,03/18] x86/mm/pat: replace x86-speficic pg_level with generic pgtable_level
    (no matching commit)
  - [RFC,04/18] x86/mm/pat: use page table accessors for effective RW/NX bits
    (no matching commit)
  - [RFC,05/18] x86/mm/pat: use a generic helper for the large page size
    (no matching commit)
  - [RFC,06/18] x86/mm/pat: introduce an inline helper to check if alias needs update
    (no matching commit)
  - [RFC,07/18] x86/mm/pat: introduce cpa_handle_large_page()
    (no matching commit)
  - [RFC,08/18] x86/mm/pat: use cpa_split_data structure to pass split parameters
    (no matching commit)
  - [RFC,09/18] x86/mm/pat: use a single locked lookup for PTE verification
    (no matching commit)
  - [RFC,10/18] x86/mm/pat: move the large page size calculation to should_split_large_page
    (no matching commit)
  - [RFC,11/18] x86/mm/pat, mm: set_memory: pull change_page_attr() core to mm/
    (no matching commit)
  - [RFC,12/18] x86/pat/mm, mm/set_memory: abstract the CPA page table lock
    (no matching commit)
  - [RFC,13/18] mm/set_memory: read page table entries with pXdp_get()
    (no matching commit)
  - [RFC,14/18] x86/mm/pat, mm: move cpa-test to mm
    (no matching commit)
  - [RFC,15/18] riscv: convert set_memory to the generic CPA implementation
    (no matching commit)
  - [RFC,16/18] riscv: make set_direct_map_*_noflush actually noflush
    (no matching commit)
  - [RFC,17/18] loongarch: convert set_memory to the generic CPA implementation
    (no matching commit)
  - [RFC,18/18] loongarch: make set_direct_map_*_noflush actually noflush
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




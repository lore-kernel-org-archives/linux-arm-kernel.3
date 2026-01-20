Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6468AD2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 12:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vZ6UbohxUN0tii6hS75uDJpKshLq7buKNXOSr/0MNhw=; b=Aj6F4vzi6YsRIeutqZC7KPdTiO
	JxEW8IkukP+JP73NOiEmm9yK2YMmrgQ8dvaY/AnPIJoFokRoMA1uYZb6IihZ40lA3kEMCz6Z2bEIS
	W/FOg+1GN1pPcIRKrVQfeBqVu7DfP5Qi24TT5mvwg0kwAoJqQKCb58RskTEXpcwGdwBxykX7e+7FC
	zAvvdq6og8MSQyg2p/qkTZ1pJ5YyQqDDF+tnbL4iU6BwM+fxMKROrqzO46f4B6gQOaL1AjMr0bFdt
	RLvlIHxqvxvvRU5r50cRkyvzyR5yIghdgqX47CfoWg3TeVxY1qcmMAh2AxJlIO+elDapsSES0FtpM
	BtxvjeKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAcp-00000003nfp-2UfK;
	Tue, 20 Jan 2026 12:14:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viAcn-00000003nfg-2wFW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 12:14:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 277E66011F;
	Tue, 20 Jan 2026 12:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0133C19422;
	Tue, 20 Jan 2026 12:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768911260;
	bh=qYW1oJOqPclM08d4FkR7uEbs6KnqFmv0WcgIwdVcFYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hG7S3T/PcxkGiJSFc77iGksaBX4RezZghPeNsckH64CnHmb9AxjEaNL3ATPmpnvKS
	 Ee5+jDplxHcDnruh9DOlCFpdtuc3CLw2ldPpuQBTi+95DmvyetLMZhH4gdf8yuZmYj
	 1uJMX2AqogHK36GQsNVtFCbg71yjJzuHbenO/lnxTo/f1TzI/Miwu1vhP4FwCi+0/l
	 RF+aE/XCC84gKHmsTOUNMarUoj5fuBmMkfuIB/jNjsjOvfHRh7KTysQn0CKhMXV/j/
	 x3YAhaXWSzitUXhqSuntQA4u0iCfExs5GepiAAE9b8es1cmc8EpOUSQbLPWZx9rS5z
	 oa5KOU2pTUhnA==
Date: Tue, 20 Jan 2026 12:14:15 +0000
From: Will Deacon <will@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Marc Zyngier <maz@kernel.org>, Lukas Bulwahn <lbulwahn@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Kees Cook <kees@kernel.org>, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] arm64: Kconfig: deprecate redundant ARM64_USE_LSE_ATOMICS
Message-ID: <aW9xlz0bMw1koatd@willie-the-truck>
References: <20251223110730.121239-1-lukas.bulwahn@redhat.com>
 <aVwkIYMyoe7OpeUh@willie-the-truck>
 <86h5syn8ww.wl-maz@kernel.org>
 <aV6CpBCvr37mcv7W@willie-the-truck>
 <7b7ac65c-773e-48fe-a335-c49b6ef9a0e8@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b7ac65c-773e-48fe-a335-c49b6ef9a0e8@app.fastmail.com>
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

On Wed, Jan 07, 2026 at 11:07:03PM +0100, Arnd Bergmann wrote:
> On Wed, Jan 7, 2026, at 16:58, Will Deacon wrote:
> > On Tue, Jan 06, 2026 at 01:54:39PM +0000, Marc Zyngier wrote:
> >> On Mon, 05 Jan 2026 20:50:41 +0000, Will Deacon <will@kernel.org> wrote:
> >> Subject: [PATCH] arm64: Unconditionally enable LSE support
> >> 
> >> LSE atomics have been in the architecture since ARMv8.1 (released in
> >> 2014), and are hopefully supported by all modern toolchains.
> >> 
> >> Drop the optional nature of LSE support in the kernel, and always
> >> compile the support in, as this really is very little code. LL/SC
> >> still is the default, and the switch to LSE is done dynamically.
> >> 
> >> Signed-off-by: Marc Zyngier <maz@kernel.org>
> >> ---
> >>  arch/arm64/Kconfig             | 16 ----------------
> >>  arch/arm64/include/asm/insn.h  | 23 -----------------------
> >>  arch/arm64/include/asm/lse.h   |  9 ---------
> >>  arch/arm64/kernel/cpufeature.c |  2 --
> >>  arch/arm64/kvm/at.c            |  7 -------
> >>  arch/arm64/lib/insn.c          |  2 --
> >>  arch/arm64/net/bpf_jit_comp.c  |  7 -------
> >>  7 files changed, 66 deletions(-)
> >
> > I think we should go ahead with this.
> >
> > Initially, I thought we'd need some surgery to cpufeature.c so that
> > cpus_have_final_cap() could take the _likely_ path for LSE but it looks
> > like that's only relevant for KVM's AT handling and the common atomic_t
> > APIs use alternative_has_cap_likely() already.
> 
> I'm not entirely convinced by the direction. Removing compile-time
> options and complexity from #ifdef blocks is clearly an advantage,
> but I'm a bit worried about at least the ARM64_USE_LSE_ATOMICS 
> option still being valuable.
> 
> The boot-time patching for all atomics adds complexity as well, and
> being able to configure it out can be helpful in a number of
> scenarios:
> 
> - I've seen several scenarios where code size is extremely important,
>   and being able to compile out any runtime-detected features 
>   saves some space. In a defconfig kernel, this is about 1.1% of .text.
>   Being able to select just the LSE version without the patching
>   may be even more valuable these days, but almost
>   all embedded systems I see are still ARMv8.0 (Cortex-A53 and
>   Cortex-A35) without LSE.
> - We have an experimental patch set for CONFIG_XIP_KERNEL on arm64,
>   which inherently requires not patching at all, and requires
>   the opposite patches for other features and errata workarounds.
> - The amount of nested macros and inline functions for the arm64
>   atomics is large enough to slow down compilation, #including
>   linux/spinlock.h shouldn't really result in >1MB of preprocessed
>   source code. (this is a much harder problem to solve)

In the absence of a concerted and persistent upstream effort to solve
some of these problems, I think retaining ARM64_USE_LSE_ATOMICS is
a tiny drop in the ocean and yet its presence does lead to build
breakages and additional testing burden today, which we could avoid.

So I'm inclined to merge Marc's changes and if folks aggressively want
to optimise the kernel's memory footprint in future, perhaps they can
try to implement some of your suggestions above (such as forcing the
LSE atomics into the compiled Image).

Will


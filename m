Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78B9CFD65A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 15:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HGhw0EiXML4A1FIyvlUyBD39DDf4Jbw2mnZT/ylMpAs=; b=hUrRug5QziKHkyblRv7hV45eg6
	weeyuJspAY0xFkq3r188/OijUiVYphSrMKP/UNSQyV/mJ3SkepLo50uGibvmk5HrakTrfAYaDb7B4
	Ua8YmIgWncbCIgf/CHRtSGAe2oqCI96EKGSpd50YgKOtSXp/bEwI174zAi9J+NjY0j8AlTWGQvBEh
	cuwQlAnELxKS1ghSVQEgy5ni0S7iExBiTr13dDK00mbrJ+htjikHN1kITlRQNAtFbABi+hVCO6I0Y
	m5ryp1o6SZbTQX2lYQGylFu70qNlTGq4kH6XYio1tx/KisDqfwRU/SIg3DUw0fD3gfF3C2/c3WRNh
	AoMjUOfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdVvj-0000000FCyH-0QXm;
	Wed, 07 Jan 2026 15:58:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdVvf-0000000FCxx-0WiT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 15:58:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9385143FCA;
	Wed,  7 Jan 2026 15:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB40C4CEF1;
	Wed,  7 Jan 2026 15:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767801514;
	bh=vDFeAm5OlEz8DAm5IOoJWnKvnYIr/LJSsqbKK78xneE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HylNBj3QiEjFrgKBcBRQjm/hLt7RTzdba3/fDTLaH1bFGkkKrhjACRf87Zi1hruHl
	 9IhJM0zGYT7SXZbeVX2YyM/vv0sPAE8SXS7YJj+FWKHEzMVTjHtsUqC4mLFM3OS2ma
	 3wB61I36kGyD2AtjLo74s4KuWcrhjINMl/TG0PzZLif7qrHfUxU/lPmSrsp4FD0E0+
	 h94FH+8nFztXDT7Unhdt4jFy+c2r61X5WeGK7hJJ28S95WMkKwasgJF8XBA75TF+Ki
	 pUu3rUki8ZSnSlmR3zDrmd5pTY2plS5bEzHJvDWoCsn92ImiKAMvotQf3TkQRpOPRi
	 fzMxDOoHi9yyw==
Date: Wed, 7 Jan 2026 15:58:28 +0000
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Lukas Bulwahn <lbulwahn@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Kees Cook <kees@kernel.org>, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] arm64: Kconfig: deprecate redundant ARM64_USE_LSE_ATOMICS
Message-ID: <aV6CpBCvr37mcv7W@willie-the-truck>
References: <20251223110730.121239-1-lukas.bulwahn@redhat.com>
 <aVwkIYMyoe7OpeUh@willie-the-truck>
 <86h5syn8ww.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86h5syn8ww.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_075835_477711_B11EA21B 
X-CRM114-Status: GOOD (  42.45  )
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

On Tue, Jan 06, 2026 at 01:54:39PM +0000, Marc Zyngier wrote:
> On Mon, 05 Jan 2026 20:50:41 +0000,
> Will Deacon <will@kernel.org> wrote:
> > 
> > [+Marc]
> > 
> > On Tue, Dec 23, 2025 at 12:07:30PM +0100, Lukas Bulwahn wrote:
> > > From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> > > 
> > > Currently, the config options ARM64_USE_LSE_ATOMICS and ARM64_LSE_ATOMICS
> > > are equivalent, i.e., ARM64_LSE_ATOMICS is true if and only if
> > > ARM64_USE_LSE_ATOMICS is true.
> > > 
> > > Prior to commit 395af861377d ("arm64: Move the LSE gas support detection to
> > > Kconfig")---included in v5.6-rc1---only the config option ARM64_LSE_ATOMICS
> > > was defined, and the check for gas support was done in the Makefile. This
> > > mentioned commit then introduces the config option ARM64_USE_LSE_ATOMICS to
> > > be the promptable option, and changes the semantics of ARM64_LSE_ATOMICS to
> > > check for the gas support.
> > > 
> > > Note that there is then some minor refactoring in commit 2decad92f473
> > > ("arm64: mte: Ensure TIF_MTE_ASYNC_FAULT is set atomically"), putting this
> > > gas support check into its own config option AS_HAS_LSE_ATOMICS, but the
> > > logic remains the same. Since every binutils version defined suitable for
> > > kernel compilation then eventually included the required support, the
> > > config option AS_HAS_LSE_ATOMICS and the dependency was dropped with
> > > commit 2555d4c68720 ("arm64: drop binutils version checks"). This then
> > > makes ARM64_USE_LSE_ATOMICS and ARM64_LSE_ATOMICS equivalent. Hence, one
> > > of the two config options can be dropped now.
> > > 
> > > Considerations for the decision which config option to drop:
> > > 
> > >   - ARM64_USE_LSE_ATOMICS is promptable by the user since its introduction
> > >     in 2020. So there might be some Kconfig fragments that define this
> > >     config option and expect that this then implies ARM64_LSE_ATOMICS to be
> > >     set. However, within the kernel tree, there is no existing config file
> > >     referring to that option. So, it is unlikely to be widely used.
> > >   - ARM64_LSE_ATOMICS is used in nine places within the arm64 directory in
> > >     the current kernel tree.
> > >   - ARM64_USE_LSE_ATOMICS is the only config option that contains the infix
> > >     string _USE_ to enable support and use of an arm64 architectural
> > >     feature. However, there is not a very stringent and consistent naming
> > >     convention for Kconfig options throughout the kernel tree anyway.
> > >   - The use of the transitional attribute allows to simplify transitioning
> > >     to a different Kconfig symbol name, but also adds some intermediate
> > >     definition to be removed later eventually.
> > > 
> > > After thoughtful consideration, keep ARM_LSE_ATOMICS and remove
> > > ARM64_USE_LSE_ATOMICS in a two-step approach, first deprecate
> > > ARM64_USE_LSE_ATOMICS with the transitional attribute here and then plan
> > > to completely remove it in two or three years with a further dedicated
> > > commit then.
> > 
> > Marc was talking about removing ARM64_LSE_ATOMICS entirely the other day
> > after it bit him with a KVM change. If all supported assemblers understand
> > the LSE instructions, let's just do that?
> 
> That'd be my preferred option. Having config options for things that
> we can detect and patch at runtime makes coverage a lot more difficult
> than it should be. I'd also love to kill CONFIG_ARM64_PAN, for
> example. In any case, here's my take on this, based on -rc4.
> 
> Thanks,
> 
> 	M.
> 
> From 3ab18194eefd2017fb1cea6764adb0634f5946da Mon Sep 17 00:00:00 2001
> From: Marc Zyngier <maz@kernel.org>
> Date: Tue, 6 Jan 2026 13:44:14 +0000
> Subject: [PATCH] arm64: Unconditionally enable LSE support
> 
> LSE atomics have been in the architecture since ARMv8.1 (released in
> 2014), and are hopefully supported by all modern toolchains.
> 
> Drop the optional nature of LSE support in the kernel, and always
> compile the support in, as this really is very little code. LL/SC
> still is the default, and the switch to LSE is done dynamically.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/Kconfig             | 16 ----------------
>  arch/arm64/include/asm/insn.h  | 23 -----------------------
>  arch/arm64/include/asm/lse.h   |  9 ---------
>  arch/arm64/kernel/cpufeature.c |  2 --
>  arch/arm64/kvm/at.c            |  7 -------
>  arch/arm64/lib/insn.c          |  2 --
>  arch/arm64/net/bpf_jit_comp.c  |  7 -------
>  7 files changed, 66 deletions(-)

I think we should go ahead with this.

Initially, I thought we'd need some surgery to cpufeature.c so that
cpus_have_final_cap() could take the _likely_ path for LSE but it looks
like that's only relevant for KVM's AT handling and the common atomic_t
APIs use alternative_has_cap_likely() already.

If we do something similar for PAN, then system_uses_hw_pan() probably
wants the polarity switching from unlikely to likely.

Will


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EB8C54F5C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 06:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1A3lpYSGax/n4+5eeSy2exXTa0jNnmXhF3xXfLCX3Q=; b=TiaYCcg8XiBMruvggqlXNYl2/7
	oysdHwfH7Y5/LONBupa+kN/GaTUlC4qn+6JftivTuY3ZJ+JBATQA8hqYulSs+jl8W9jct/Sgmm+TH
	ebHNNbWXcArvdpKgttTww+FzdFmwqc4WggPdc+iptTCbWhEELQr4CKnhz+Ly9DjaWb71AkBPkdyAL
	L5nZkM4UH7IMVXANOEiR2P6z8klE4gvwoIl5cGrnzwK+3QQiF43ZjPGqRui4dgaEdwsg29Ita/DxW
	Y6Jc3ag9xmxOAfzxHWYYMOd8OzhWsn4+8B9zjc+UQXNORhP1HmhdV7gEtI7EDpG4SAGlbm/dpBWPs
	HulwSdog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtK4Z-0000000DJtA-2sxq;
	Fri, 20 Feb 2026 06:33:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtK4Y-0000000DJt4-2dLR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 06:33:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9C0A660054;
	Fri, 20 Feb 2026 06:33:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F377C116D0;
	Fri, 20 Feb 2026 06:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771569185;
	bh=Fq+HYBDt87eoP9eXSUrmnldyYQ/rSkSpbFxYlUHf1BA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MSQ82ZE30LmJrrKD9PVuqMqIuJvDK2CtgGY9C3wBZmy4pRdK/jNaqXvgw0euL+3uh
	 TWiBisItCbT2PAjp8NXubp7LyHSMhZc91THpIb8TkiRcCLDucjDn5u7r7E//A0xZjg
	 z2GDqgTGQVldYvJiVPtoWJVvZUOTLQ2gU7batWFj5sr4Lh5C3W7/4tYsi4+wu3mg8h
	 FS7fGncoct/YrnchxqXEts7B03Y5RLbskDK8zxaMcNNZI6tTnGmQDj5eEwY2VwvJBX
	 T7fGP1WxXLpgcU9LbimHWcmzf9nc3jcOl90PzPAjlS2VXpSyhqQCddFgapKvE87sBf
	 UeXn97y9HivjA==
Date: Fri, 20 Feb 2026 14:14:23 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Dev Jain <dev.jain@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, maz@kernel.org
Subject: Re: [PATCH] arm64: remove HAVE_CMPXCHG_LOCAL
Message-ID: <aZf7v4Ix1ZWCXxPu@xhacker>
References: <20260215033944.16374-1-jszhang@kernel.org>
 <aZL46z1UZkQlF3Dd@willie-the-truck>
 <89606308-3c03-4dcf-a89d-479258b710e4@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <89606308-3c03-4dcf-a89d-479258b710e4@arm.com>
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

On Mon, Feb 16, 2026 at 08:59:17PM +0530, Dev Jain wrote:
> 
> On 16/02/26 4:30 pm, Will Deacon wrote:
> > On Sun, Feb 15, 2026 at 11:39:44AM +0800, Jisheng Zhang wrote:
> >> It turns out the generic disable/enable irq this_cpu_cmpxchg
> >> implementation is faster than LL/SC or lse implementation. Remove
> >> HAVE_CMPXCHG_LOCAL for better performance on arm64.
> >>
> >> Tested on Quad 1.9GHZ CA55 platform:
> >> average mod_node_page_state() cost decreases from 167ns to 103ns
> >> the spawn (30 duration) benchmark in unixbench is improved
> >> from 147494 lps to 150561 lps, improved by 2.1%
> >>
> >> Tested on Quad 2.1GHZ CA73 platform:
> >> average mod_node_page_state() cost decreases from 113ns to 85ns
> >> the spawn (30 duration) benchmark in unixbench is improved
> >> from 209844 lps to 212581 lps, improved by 1.3%
> >>
> >> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> >> ---
> >>  arch/arm64/Kconfig              |  1 -
> >>  arch/arm64/include/asm/percpu.h | 24 ------------------------
> >>  2 files changed, 25 deletions(-)
> > That is _entirely_ dependent on the system, so this isn't the right
> > approach. I also don't think it's something we particularly want to
> > micro-optimise to accomodate systems that suck at atomics.

Hi Will,

I read this as an implication that the cmpxchg_local version is better
than generic disable/enable irq version on the newer arm64 systems. Is my
understanding correct?

> 
> Hi Will,
> 
> As I mention in the other email, the suspect is not the atomics, but
> preempt_disable(). On Apple M3, the regression reported in [1] resolves
> by removing preempt_disable/enable in _pcp_protect_return. To prove
> this another way, I disabled CONFIG_ARM64_HAS_LSE_ATOMICS and the
> regression worsened, indicating that at least on Apple M3 the
> atomics are faster.
> 
> It may help to confirm this hypothesis on other hardware - perhaps
> Jisheng can test with this change on his hardware and confirm
> whether he gets the same performance improvement.

Hi Dev,

Thanks for the hints. I tried to remove the preempt_disable/enable from
_pcp_protect_return, it improves, but the HAVE_CMPXCHG_LOCAL version is
still worse than generic disable/enable irq version on CA55 and CA73.

> 
> By coincidence, Yang Shi has been discussing the this_cpu_* overhead
> at [2].
> 
> [1] https://lore.kernel.org/all/1052a452-9ba3-4da7-be47-7d27d27b3d1d@arm.com/
> [2] https://lore.kernel.org/all/CAHbLzkpcN-T8MH6=W3jCxcFj1gVZp8fRqe231yzZT-rV_E_org@mail.gmail.com/
> 
> >
> > Will
> >
> >> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> >> index 38dba5f7e4d2..5e7e2e65d5a5 100644
> >> --- a/arch/arm64/Kconfig
> >> +++ b/arch/arm64/Kconfig
> >> @@ -205,7 +205,6 @@ config ARM64
> >>  	select HAVE_EBPF_JIT
> >>  	select HAVE_C_RECORDMCOUNT
> >>  	select HAVE_CMPXCHG_DOUBLE
> >> -	select HAVE_CMPXCHG_LOCAL
> >>  	select HAVE_CONTEXT_TRACKING_USER
> >>  	select HAVE_DEBUG_KMEMLEAK
> >>  	select HAVE_DMA_CONTIGUOUS
> >> diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
> >> index b57b2bb00967..70ffe566cb4b 100644
> >> --- a/arch/arm64/include/asm/percpu.h
> >> +++ b/arch/arm64/include/asm/percpu.h
> >> @@ -232,30 +232,6 @@ PERCPU_RET_OP(add, add, ldadd)
> >>  #define this_cpu_xchg_8(pcp, val)	\
> >>  	_pcp_protect_return(xchg_relaxed, pcp, val)
> >>  
> >> -#define this_cpu_cmpxchg_1(pcp, o, n)	\
> >> -	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
> >> -#define this_cpu_cmpxchg_2(pcp, o, n)	\
> >> -	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
> >> -#define this_cpu_cmpxchg_4(pcp, o, n)	\
> >> -	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
> >> -#define this_cpu_cmpxchg_8(pcp, o, n)	\
> >> -	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
> >> -
> >> -#define this_cpu_cmpxchg64(pcp, o, n)	this_cpu_cmpxchg_8(pcp, o, n)
> >> -
> >> -#define this_cpu_cmpxchg128(pcp, o, n)					\
> >> -({									\
> >> -	typedef typeof(pcp) pcp_op_T__;					\
> >> -	u128 old__, new__, ret__;					\
> >> -	pcp_op_T__ *ptr__;						\
> >> -	old__ = o;							\
> >> -	new__ = n;							\
> >> -	preempt_disable_notrace();					\
> >> -	ptr__ = raw_cpu_ptr(&(pcp));					\
> >> -	ret__ = cmpxchg128_local((void *)ptr__, old__, new__);		\
> >> -	preempt_enable_notrace();					\
> >> -	ret__;								\
> >> -})
> >>  
> >>  #ifdef __KVM_NVHE_HYPERVISOR__
> >>  extern unsigned long __hyp_per_cpu_offset(unsigned int cpu);
> >> -- 
> >> 2.51.0
> >>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64103E7BD91
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 11:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gn2cR0H1VaG37ZT27PlZVPTmATrjKTqR6VuyqOFczKY=; b=S2E3eMKMg9X5YBjwJWFSNbD4Dy
	d/LkqgNe1j7an1pofw8eiWrE1hX3sf3N4Ezq0bbm4bR09z3JxHUZx2HK980t/9bwY5IUrP+VuDrnw
	uSVKvrxyaL8A/kRN4pm1uxxNSiGvkfI/BUSdHxQ6ioxkN+WLoMuGTzTGNTbbt9uAD2h2uz/mTCw4e
	00bS1AJU0tBLJtBqQp/ghOptz3Q95fdox3JNuINH/JOXh5SAeolxlXbQ64JMaXf07dXoTlH66vDy8
	YDlGvIbZcmgcrXMZ+DiWM7eKLt6MR74nWqxNXobsHhcoNdZMgMrmMF+0RQ4tGHvUsijXI0xWTcWTG
	G14TSMKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwLm-00000006Om5-0qIy;
	Mon, 16 Feb 2026 11:01:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwLi-00000006OlB-3ztD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 11:01:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8EA3844556;
	Mon, 16 Feb 2026 11:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98832C19422;
	Mon, 16 Feb 2026 11:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771239664;
	bh=1aGpBeh4uTB95EnMRTLPvZfsnZO0+woMT4b5vKXb9oE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pdcz32uZUn9hgWq5Qk5Iruwxvu9Zmrvzsq+r/JIlJLbneE8xoBTfr4aj6UZoS1ymu
	 EXpOXsFcYyvGEXZWH5XGJugsQmslOztNOyJ/T9qZEzKUX6pjCms1Qk0+gl/BLDfwei
	 FOHVHRbdxNWXqKbA219UQKpQfGTvz6zHcp5Hu8WroHijRa7+DL76tCbDzHzR3kJPpy
	 mYg50NjO3nhBjMzz2QQ3wjol4L73oHB2zaB3Xk8Srhh3k2u1vWuSWgr6W1f564Z41o
	 jgK5yOOXhY7ccMRm6oiAEQDFLMX7g7hxIBdUtLrd/FCNNMYzDUVFJVzbH7KEFWnRKx
	 ks9+0uyPSkoUQ==
Date: Mon, 16 Feb 2026 11:00:59 +0000
From: Will Deacon <will@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, maz@kernel.org
Subject: Re: [PATCH] arm64: remove HAVE_CMPXCHG_LOCAL
Message-ID: <aZL46z1UZkQlF3Dd@willie-the-truck>
References: <20260215033944.16374-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260215033944.16374-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_030107_030278_278E7ECF 
X-CRM114-Status: GOOD (  15.02  )
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

On Sun, Feb 15, 2026 at 11:39:44AM +0800, Jisheng Zhang wrote:
> It turns out the generic disable/enable irq this_cpu_cmpxchg
> implementation is faster than LL/SC or lse implementation. Remove
> HAVE_CMPXCHG_LOCAL for better performance on arm64.
> 
> Tested on Quad 1.9GHZ CA55 platform:
> average mod_node_page_state() cost decreases from 167ns to 103ns
> the spawn (30 duration) benchmark in unixbench is improved
> from 147494 lps to 150561 lps, improved by 2.1%
> 
> Tested on Quad 2.1GHZ CA73 platform:
> average mod_node_page_state() cost decreases from 113ns to 85ns
> the spawn (30 duration) benchmark in unixbench is improved
> from 209844 lps to 212581 lps, improved by 1.3%
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/arm64/Kconfig              |  1 -
>  arch/arm64/include/asm/percpu.h | 24 ------------------------
>  2 files changed, 25 deletions(-)

That is _entirely_ dependent on the system, so this isn't the right
approach. I also don't think it's something we particularly want to
micro-optimise to accomodate systems that suck at atomics.

Will

> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 38dba5f7e4d2..5e7e2e65d5a5 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -205,7 +205,6 @@ config ARM64
>  	select HAVE_EBPF_JIT
>  	select HAVE_C_RECORDMCOUNT
>  	select HAVE_CMPXCHG_DOUBLE
> -	select HAVE_CMPXCHG_LOCAL
>  	select HAVE_CONTEXT_TRACKING_USER
>  	select HAVE_DEBUG_KMEMLEAK
>  	select HAVE_DMA_CONTIGUOUS
> diff --git a/arch/arm64/include/asm/percpu.h b/arch/arm64/include/asm/percpu.h
> index b57b2bb00967..70ffe566cb4b 100644
> --- a/arch/arm64/include/asm/percpu.h
> +++ b/arch/arm64/include/asm/percpu.h
> @@ -232,30 +232,6 @@ PERCPU_RET_OP(add, add, ldadd)
>  #define this_cpu_xchg_8(pcp, val)	\
>  	_pcp_protect_return(xchg_relaxed, pcp, val)
>  
> -#define this_cpu_cmpxchg_1(pcp, o, n)	\
> -	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
> -#define this_cpu_cmpxchg_2(pcp, o, n)	\
> -	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
> -#define this_cpu_cmpxchg_4(pcp, o, n)	\
> -	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
> -#define this_cpu_cmpxchg_8(pcp, o, n)	\
> -	_pcp_protect_return(cmpxchg_relaxed, pcp, o, n)
> -
> -#define this_cpu_cmpxchg64(pcp, o, n)	this_cpu_cmpxchg_8(pcp, o, n)
> -
> -#define this_cpu_cmpxchg128(pcp, o, n)					\
> -({									\
> -	typedef typeof(pcp) pcp_op_T__;					\
> -	u128 old__, new__, ret__;					\
> -	pcp_op_T__ *ptr__;						\
> -	old__ = o;							\
> -	new__ = n;							\
> -	preempt_disable_notrace();					\
> -	ptr__ = raw_cpu_ptr(&(pcp));					\
> -	ret__ = cmpxchg128_local((void *)ptr__, old__, new__);		\
> -	preempt_enable_notrace();					\
> -	ret__;								\
> -})
>  
>  #ifdef __KVM_NVHE_HYPERVISOR__
>  extern unsigned long __hyp_per_cpu_offset(unsigned int cpu);
> -- 
> 2.51.0
> 


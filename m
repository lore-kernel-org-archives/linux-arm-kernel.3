Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0395D46C16
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 02:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6jEqBRWjD+LqZ5DVpPgQihdZmzpZb7hASWlZcj7KfY=; b=HQdkkJoh4FQnRRobxxzlQftyga
	W2oFRfQiDcwjsqQRYQv2DH5k4IvRWqTWhBuF7SLGqoE28pcSS9KV+/r93jpQuBecC5Lx9WIO1+66y
	ZVP1e9ut+oBR/egk38EgEYwI4Rn9M1+Jh05sDkNElK4eEVlhjxsmTL2MzK0gqphqxUqSfYLgOZHgl
	lfVfTXzjOE7qjtLbMjocu32XZx2NnhyU8SmbH+9dsCGkomdFQEO2aoau1qeiXed1O++YZp22nH4r5
	hdKmWeSlCKAZNH/BXo57Z0ViZ8TxtJRTHqfPR4cVEKs5V1Mla+FKV3AJM9JjbynrHnUAxlOfF6Nqh
	aHJICkRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlHyp-0000000H9bv-0cQG;
	Thu, 29 Jan 2026 02:41:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlHym-0000000H9bB-1YEm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 02:41:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9846C43AD3;
	Thu, 29 Jan 2026 02:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 261EAC116C6;
	Thu, 29 Jan 2026 02:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769654515;
	bh=8LV7VFDtactd+c8QZMKoqsAIH9gGNtFQbyfO31x6Sw0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=quJtTOTNqMWbCBWl5B6qeBKij+ouFf8WcKkToo3ZR8bqtEzfpJSRk9eu+qh+KLD5h
	 mFrd4OgAopG/d4ob5XwZlyOLVIt/0+edSy2O5F9lmZmNIS5YDw61ks2I0oCfXsF6oQ
	 yhMXOSdgzVBsmq20nZyQsLa6uHsM7DeLFroF6V/kr2EeF9wk7ItayQiukhfP9Z9Yy1
	 vpNTxc0aevOjOZlYXf8wanYU8/DSBKBFg5kvXh+DoU0lcgZXf0h/rOlNHsr6MN7eS3
	 iJMZnRZRJGlbDy54csPRyV/whl607Hzvk1r4sQzh7qm9az9tJ/xEe6XUsjnrnsiek2
	 +8cx617euPVcg==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 29457F40068;
	Wed, 28 Jan 2026 21:41:54 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 28 Jan 2026 21:41:54 -0500
X-ME-Sender: <xms:8sh6adSFVeAyREqr2tJp_J1HN17cnp-AsZbFXm5RMV1fsgayPZlBEQ>
    <xme:8sh6aWOXfa0jhwK_B0Yqte1c9eGMIv_4MgqwsfOMH9SI69pjGwkHTJKYIyHDlcrbn
    3SiqGnpgsceO8-GSgqFNuKYoUgPiMqls3tsLacCwyR3MqQcfJ-s>
X-ME-Received: <xmr:8sh6aT5s67FsvgC1_wnaNToQD7qdwtLL_AqzdPU_xVrPIHAD34qeF6TGTsJsHsyn2yZXbAlMsgWBN1jPWb-dRkreVH5tmuES>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieehtddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    elueehtefhtddtgfejvdejueehhfekteevueeuueekgeetieeggeehvdffhefhhfenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqudeijedtleekgeejuddqudejjeekheehhedvqdgsohhquhhnpeepkhgvrh
    hnvghlrdhorhhgsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudehpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopegvlhhvvghrsehgohhoghhlvgdrtghomhdprh
    gtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeif
    ihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhhinhhgoheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthht
    ohepsghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhonhhgmh
    grnhesrhgvughhrghtrdgtohhmpdhrtghpthhtohepsghvrghnrghsshgthhgvsegrtghm
    rdhorhhgpdhrtghpthhtoheplhhlvhhmsehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:8sh6aZU9TwU-YIWryRyOaXozpuYufj88NX4BNfjiCiZsWWwk4YDW-Q>
    <xmx:8sh6aaOGUNBmpXxD6YtYwqxuOJLUiQ6sr1KwwbdM7MRNcXfT3NyO8Q>
    <xmx:8sh6aQiVFdpVTAsgaI5F54QdQ9FHaOHLSCmFmIjGIK6NVkvBe6H91w>
    <xmx:8sh6aQ6vIK0f7KM5uDguBKZo3_Ql9Iq5cgSbV7mPkenY5-MNv89WtQ>
    <xmx:8sh6aXd8zEwdVGGqIM8w9cLozg2oPqHQv__0KEG5jZRxqKOsN8k5J-Ka>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Jan 2026 21:41:53 -0500 (EST)
Date: Wed, 28 Jan 2026 18:41:52 -0800
From: Boqun Feng <boqun@kernel.org>
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
Message-ID: <aXrI8FQgH9P_Ors6@tardis.local>
References: <20260129005645.747680-1-elver@google.com>
 <20260129005645.747680-4-elver@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129005645.747680-4-elver@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_184156_447880_FF2A0C9C 
X-CRM114-Status: GOOD (  25.64  )
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

On Thu, Jan 29, 2026 at 01:52:34AM +0100, Marco Elver wrote:
> When enabling Clang's Context Analysis (aka. Thread Safety Analysis) on
> kernel/futex/core.o (see Peter's changes at [1]), in arm64 LTO builds we
> could see:
> 
> | kernel/futex/core.c:982:1: warning: spinlock 'atomic ? __u.__val : q->lock_ptr' is still held at the end of function [-Wthread-safety-analysis]
> |      982 | }
> |          | ^
> |    kernel/futex/core.c:976:2: note: spinlock acquired here
> |      976 |         spin_lock(lock_ptr);
> |          |         ^
> | kernel/futex/core.c:982:1: warning: expecting spinlock 'q->lock_ptr' to be held at the end of function [-Wthread-safety-analysis]
> |      982 | }
> |          | ^
> |    kernel/futex/core.c:966:6: note: spinlock acquired here
> |      966 | void futex_q_lockptr_lock(struct futex_q *q)
> |          |      ^
> |    2 warnings generated.
> 
> Where we have:
> 
> 	extern void futex_q_lockptr_lock(struct futex_q *q) __acquires(q->lock_ptr);
> 	..
> 	void futex_q_lockptr_lock(struct futex_q *q)
> 	{
> 		spinlock_t *lock_ptr;
> 
> 		/*
> 		 * See futex_unqueue() why lock_ptr can change.
> 		 */
> 		guard(rcu)();
> 	retry:
> >>		lock_ptr = READ_ONCE(q->lock_ptr);
> 		spin_lock(lock_ptr);
> 	...
> 	}
> 
> The READ_ONCE() above is expanded to arm64's LTO __READ_ONCE(). Here,
> Clang Thread Safety Analysis's alias analysis resolves 'lock_ptr' to
> 'atomic ? __u.__val : q->lock_ptr', and considers this the identity of
> the context lock given it can't see through the inline assembly;
> however, we simply want 'q->lock_ptr' as the canonical context lock.
> While for code generation the compiler simplified to __u.__val for
> pointers (8 byte case -> atomic), TSA's analysis (a) happens much
> earlier on the AST, and (b) would be the wrong deduction.
> 
> Now that we've gotten rid of the 'atomic' ternary comparison, we can
> return '__u.__val' through a pointer that we initialize with '&x', but
> then change with a pointer-to-pointer. When READ_ONCE()'ing a context
> lock pointer, TSA's alias analysis does not invalidate the initial alias
> when updated through the pointer-to-pointer, and we make it effectively
> "see through" the __READ_ONCE().
> 

Seems reasonable to me, but I don't have the compiler knowledge to do a
full review, so:

Tested-by: Boqun Feng <boqun@kernel.org>

We also have similar issues for asm-based smp_load_acquire(), to trigger
that, you can just replace `READ_ONCE(q->lock_ptr)` with
`smp_load_acquire(&q->lock_ptr)`.

Regards,
Boqun

> Code generation is unchanged.
> 
> Link: https://lkml.kernel.org/r/20260121110704.221498346@infradead.org [1]
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202601221040.TeM0ihff-lkp@intel.com/
> Cc: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Marco Elver <elver@google.com>
> ---
> v2:
> * Rebase.
> ---
>  arch/arm64/include/asm/rwonce.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> index 712de3238f9a..3a50a1d0d17e 100644
> --- a/arch/arm64/include/asm/rwonce.h
> +++ b/arch/arm64/include/asm/rwonce.h
> @@ -48,8 +48,11 @@
>   */
>  #define __READ_ONCE(x)							\
>  ({									\
> -	typeof(&(x)) __x = &(x);					\
> +	auto __x = &(x);						\
> +	auto __ret = (__rwonce_typeof_unqual(*__x) *)__x;		\
> +	auto __retp = &__ret;						\
>  	union { __rwonce_typeof_unqual(*__x) __val; char __c[1]; } __u;	\
> +	*__retp = &__u.__val;						\
>  	switch (sizeof(x)) {						\
>  	case 1:								\
>  		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
> @@ -74,7 +77,7 @@
>  	default:							\
>  		__u.__val = *(volatile typeof(*__x) *)__x;		\
>  	}								\
> -	__u.__val;							\
> +	*__ret;								\
>  })
>  
>  #endif	/* !BUILD_VDSO */
> -- 
> 2.53.0.rc1.217.geba53bf80e-goog
> 


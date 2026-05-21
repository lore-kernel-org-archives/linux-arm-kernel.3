Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFB9CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 20:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqSwJeSnn4oRa9zINtSckHShgIfREaDBWE5FteyGEoc=; b=MArbC8EyYcrlnY6mOD1hjQQqV+
	kqf72P/FbcZdK3pGNvncdMevF5UlHFHkgsHbSYl3DhgYx3OGxR9WBpei5WxX40YZiNNKQw8XK48do
	ClRMZA9AZalU6kBWvNaBta+tTL2J6j29EGJUyW1fT9f06E3iiFjK+r2GrwxiG2tqrnDBy88g33wuX
	4ASpptzelLCwkFrzVe2B1WeyeHK8Wv+TBxsWZs6DCmCgh3ZH5D3vYpzlECLsdE9Q1ZcRr62fNHnfg
	d6qZoQ3Aqtq2SkA8I/9XM3fnrPTYK/zAZqdSivA3NBJjj+G36oSw5qv/2cOlBbjn+lxnSXh6CKUTE
	Em6tQnbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ9ir-00000008zHm-1sCy;
	Thu, 21 May 2026 20:10:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ9iq-00000008zHX-14pr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 20:10:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 99AFC600FF;
	Thu, 21 May 2026 20:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E689D1F000E9;
	Thu, 21 May 2026 20:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779394223;
	bh=kqSwJeSnn4oRa9zINtSckHShgIfREaDBWE5FteyGEoc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=HD1zXVjgs2AGf+PbJLzHyvX/7dk535js4a5wN4dQEQHVV8P60kpFDrJ8QmeDmjffj
	 zHIPfwBwuKE0ka+/qlotSqGo/oh27NVAONTrK3HrZ9leplrB2oTaJjKbnQ2anEiFXr
	 NKvi3x+33l4THjwsrQK1IQupMs2rCSm6WiHZEcu1hkC7AZjNjGg1AMJ6qOkhLhmiA5
	 GiRQ8SQ2ttzx1do730CWjnwcKGegXldwloou+TX/aq1XwLu5ik1kHOfdySHmDbUTfC
	 Jrh4ksyX83wxtwlMcugY1v5NKS/Z0FdAoJwG7pGJ8kzEWqr5sZIL30gC6cn+efV+p1
	 o8ZI+aIPWMsXQ==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id DD68CF4007A;
	Thu, 21 May 2026 16:10:21 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 21 May 2026 16:10:22 -0400
X-ME-Sender: <xms:rWYPakgDT9OtGefrt0wp2Qgfq12Q--L97xltYmndzSpstrUV3ues2A>
    <xme:rWYPao_UO7XTMK8M-6OsIN9Zqq0vDVsRN6cCAb_-FQjNAhQmnT7TsXNVfsmjMwUw6
    O0iRjlcelVcB1CrudS0N-gEAKr4meWOPSeQqUTGjrbFFkSazvMFxg>
X-ME-Received: <xmr:rWYPaiOXJ6QFCwRvI4vmNgOqu86aMKG7AhUIuFW2G7kJMJR43xxIXYp_xrEEEa4ROEmPBsPU0qDRmaQ7C0uBs1g93GREMkQexAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugeekgeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevkfgjfhfugggtgfesthejredttddtjeenucfhrhhomhepfdffrghnucgh
    ihhllhhirghmshculdhnvhhiughirgdmfdcuoegujhgsfieskhgvrhhnvghlrdhorhhgqe
    enucggtffrrghtthgvrhhnpedvgeehieekteelueffueehfeejjedvjedvveetfefgffev
    hedvuedvffevffdvheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegujhgsfidomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudej
    jedvfedtgeehhedqfeeffeelgedtgeejqdgujhgsfieppehkvghrnhgvlhdrohhrghesfh
    grshhtmhgrihhlrdgtohhmpdhnsggprhgtphhtthhopedukedpmhhouggvpehsmhhtphho
    uhhtpdhrtghpthhtohepshhmrgguhhgrvhgrnhesnhhvihguihgrrdgtohhmpdhrtghpth
    htoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopeif
    ihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhhkrdhruhhtlhgrnhguse
    grrhhmrdgtohhmpdhrtghpthhtoheplhhpihgvrhgrlhhishhisehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehsuhguvggvphdrhhholhhlrgesrghrmhdrtghomhdprhgtphhtth
    hopegtohhnohhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjihgtvdefsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhish
    htshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:rWYParqkjkd4xaZpU2-l8l0febjypoYJS7fwnIz5h0KMe9v09aM1TQ>
    <xmx:rWYPav7x8tOQmcnNlA9WS1LAKZySNEJgNmlbtALripevVQC99-O7Tg>
    <xmx:rWYPatrYK3uKK_4V6pyBSf5SxF41puhKx5KeEf-h6UaUYeg0Lpgw3Q>
    <xmx:rWYPalJQFhZz_kT94Uscy6hwVDbcjvriQ3v-2pcmBCuA1RfwiZD6dw>
    <xmx:rWYPaih2XP2mr5okxytQuFhcMq60uLBC_Bn5rBzxsBpiPF84mOuSG9mS>
Feedback-ID: i67ae4b3e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 May 2026 16:10:21 -0400 (EDT)
Date: Thu, 21 May 2026 13:10:20 -0700
From: "Dan Williams (nvidia)" <djbw@kernel.org>
To: Srirangan Madhavan <smadhavan@nvidia.com>, 
 catalin.marinas@arm.com, 
 will@kernel.org, 
 mark.rutland@arm.com, 
 lpieralisi@kernel.org, 
 sudeep.holla@arm.com
Cc: conor@kernel.org, 
 jic23@kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 vsethi@nvidia.com, 
 jevans@nvidia.com, 
 raghupathyk@nvidia.com, 
 srikars@nvidia.com, 
 nbenech@nvidia.com, 
 alwilliamson@nvidia.com, 
 Dan Williams <danwilliams@nvidia.com>, 
 Srirangan Madhavan <smadhavan@nvidia.com>
Message-ID: <6a0f66ac6d7e_1bb00e100c0@djbw-dev.notmuch>
In-Reply-To: <20260521073047.320614-3-smadhavan@nvidia.com>
References: <20260521073047.320614-1-smadhavan@nvidia.com>
 <20260521073047.320614-3-smadhavan@nvidia.com>
Subject: Re: [RFC PATCH 2/2] arm64: mm: add SMCCC-backed cache invalidate
 provider
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
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

Srirangan Madhavan wrote:
> Add an arm64 cache maintenance backend that discovers SMCCC cache
> clean+invalidate support, queries attributes, handles transient BUSY and
> RATE_LIMITED responses with bounded retries, and registers with the generic
> cache coherency framework.
> 
> Signed-off-by: Srirangan Madhavan <smadhavan@nvidia.com>
> ---
>  MAINTAINERS                 |   1 +
>  arch/arm64/mm/Makefile      |   1 +
>  arch/arm64/mm/cache_maint.c | 180 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 182 insertions(+)
>  create mode 100644 arch/arm64/mm/cache_maint.c
[..]
> +static int arm64_smccc_cache_wbinv(struct cache_coherency_ops_inst *cci,
> +				   struct cc_inval_params *invp)
> +{
> +	struct arm64_smccc_cache *cache =
> +		container_of(cci, struct arm64_smccc_cache, cci);
> +	struct arm_smccc_res res = {};
> +	int delay_us = smccc_cache_delay_us(cache);
> +	u64 gen = 0;
> +	s32 status;
> +	int ret;
> +	int i;
> +
> +	if (!invp->size)
> +		return -EINVAL;
> +
> +	if (cache->global_op)
> +		gen = READ_ONCE(cache->global_flush_gen);
> +
> +	guard(mutex)(&cache->lock);
> +
> +	/*
> +	 * If firmware reports a global operation type, a successful operation
> +	 * covers every request that was already waiting behind it. Skip if the
> +	 * generation advanced while this request was waiting to enter the
> +	 * serialized firmware call path.
> +	 */
> +	if (cache->global_op && gen != READ_ONCE(cache->global_flush_gen))
> +		return 0;

Hmm, this looks like it could under flush which is worse than over
flushing. The ordering is:

CPU0			CPU1
<dirty>
flush_gen==0
lock
flush_gen==0
flush			<dirty>	
flush_gen++		flush_gen==0	
			lock
			flush_gen==1
			skip

I.e. if CPU1 is racing dirtying while CPU0 is still flushing, then there
is a window for CPU1 to read the updated flush_gen and skip when it
needs to follow on with a new flush cycle. So this either needs a more
sophisticated queue / batch system to track which requests might get
satisfied while waiting for a turn, or just drop the optimization until
it is clear it causes a problem in practice.

I think dropping the optimization is practical for now.

> +
> +	for (i = 0; i < SMCCC_CACHE_MAX_RETRIES; i++) {
> +		/* Long firmware operations can trigger watchdog checks. */
> +		touch_nmi_watchdog();
> +
> +		arm_smccc_1_1_invoke(ARM_SMCCC_ARCH_CLEAN_INV_MEMREGION,
> +				     invp->addr, invp->size, 0UL, &res);
> +		status = (s32)res.a0;
> +		ret = smccc_cache_status_to_errno(status);
> +		if (!ret) {
> +			if (cache->global_op) {
> +				WRITE_ONCE(cache->global_flush_gen,
> +					   cache->global_flush_gen + 1);
> +			}
> +			return 0;
> +		}
> +
> +		if (ret != -EBUSY && ret != -EAGAIN)
> +			return ret;

I notice that cxl_region_invalidate_memregion() only expects failures to
find a flush capability, not failures to execute a flush.

Just a note to circle back to this concern.


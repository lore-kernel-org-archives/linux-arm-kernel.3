Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A555F8A171
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 13:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1sTpd7zgs6A8RDoBfZLFLWJ7N8U8AmlZljaetEWitc=; b=ggaTAM21RPqaCRvigcMDnju5cN
	kS/yqwv6ny8C2hvKILZjdTRCgPWEGDHLSbWxGZ0DGSfCKpwjviOOey9jS7KEAW7li6lPoJdw5l39P
	rYGl2U4bN4uWK6e/A6L3jR/QMolMuqBRMZIslptemo9P+MAz3jBgQ0gfNm56MUPk91erTjM6tXRlU
	1yo6ScGeP8PAyR3Tl9e7ZuXkXohe22NLYg4UfeRD+b3O24j7dluAh+DGxV5xgidz6jmQJj7z8dIy1
	86GHwYzD4qrEy2HbYhepCuo0NYBdL7OtqX7eFRXNuem2WmyQGID9La7L1TeLY+KeFIWF6+uf2/zPL
	qkPsoEUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDMx9-00000002Vdn-3jsm;
	Thu, 16 Apr 2026 13:40:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDMx7-00000002Vdg-47CE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 13:40:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0706B60128;
	Thu, 16 Apr 2026 13:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 524C0C2BCB3;
	Thu, 16 Apr 2026 13:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776346816;
	bh=0NpdKvM+D6ZzMOSi3MCcQoz79uQMzAPRQOfP9LfksO0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=qPpT1hSj5WKfgNwaXLDH60GMIxQywunHEShZB3TzdogGITiATESBQUQEzL8n+ymXn
	 fzSGBAb0yHhzH4J5zEkJ4BmU1o5re5u74WvmULWHzjMADqLtAKpP9YX2xt7wzZ4giA
	 CqwpgyHTjRWrOTU4IGfeOszAj0ZZBQBr2Bq2eRZhyH+QZaOsYuUJFDB/yrsd1qaaAE
	 kvyQ5mfy8nSKm1J1LLod/Y4wDQxVYuq2FlYUnuCAOMgyCu3oiPrch7SFBnric2c1UB
	 OfHKFOPNovN4ujG0MRzvtpI7jdGceoOyV+UX6TkQuHwe8M6HTiJ/xZ1i7deEFTL55w
	 zcuCmp+cnCtOw==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 64F25F4006D;
	Thu, 16 Apr 2026 09:40:15 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Thu, 16 Apr 2026 09:40:15 -0400
X-ME-Sender: <xms:v-bgaS5Aha0NUk2vcC7vjuJ883wVPYXa_rHZ2EDIWnOgTmX3mZGDaQ>
    <xme:v-bgaWt7XIPZM8eXZXYRdQEH-Ew2X-0qGeZaiGXjCx-9EqDZBef-3GlaAfoLV_IUo
    Ot8GqoCVcPb_WfIbo3VOyeBLz8l6tTLa9wTabw9h7o519BDPBTY6V3R>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegjeduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhguuceu
    ihgvshhhvghuvhgvlhdfuceorghruggssehkvghrnhgvlhdrohhrgheqnecuggftrfgrth
    htvghrnhepjefhteevheevhfetkeeglefftdfggfdvtdekgeduvddvudduvdeiteejffev
    feejnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhguodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdduieejtdehtddtjeelqdeffedvudeigeduhedqrghruggspeepkh
    gvrhhnvghlrdhorhhgseifohhrkhhofhgrrhgurdgtohhmpdhnsggprhgtphhtthhopedu
    fedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinh
    grshesrghrmhdrtghomhdprhgtphhtthhopehmrghrkhdrrhhuthhlrghnugesrghrmhdr
    tghomhdprhgtphhtthhopehrohgsihhnrdhmuhhrphhhhiesrghrmhdrtghomhdprhgtph
    htthhopeihuhhkuhgrihesfhhnnhgrshdrtghomhdprhgtphhtthhopeguvghmhigrnhhs
    hhesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnrghnuddvvdeshhhurgifvghird
    gtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepshhonhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvg
    hlrdhorhhg
X-ME-Proxy: <xmx:v-bgaQqld1-38blCmpDeA4NjkfVsn42TQcrK4U4WkNuoMhvGk61m4Q>
    <xmx:v-bgaaU0NpMKJeKioDdDOZ2UqyZcIwNY6Ws5tPXBUA2IM8NX-ny50g>
    <xmx:v-bgad3188ZkE_nU_Xpj0z8tb0bABNVOVSgJGPThv3i7WAWc2KB1ug>
    <xmx:v-bgaZSEAGOGrl_DKacd0sp4W62kmqlfxa0VhIf5M8pcjgqgMCjv0Q>
    <xmx:v-bgaRTzL05UME20sGgNj8ZInmhGttlEBj-tox9OyrGGFG5HMzB53Mxn>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 332E1700065; Thu, 16 Apr 2026 09:40:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 16 Apr 2026 15:39:53 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Demian Shulhan" <demyansh@gmail.com>, "Christoph Hellwig" <hch@lst.de>
Cc: "Mark Rutland" <mark.rutland@arm.com>, "Song Liu" <song@kernel.org>,
 "Yu Kuai" <yukuai@fnnas.com>, "Will Deacon" <will@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Mark Brown" <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 "Robin Murphy" <robin.murphy@arm.com>, "Li Nan" <linan122@huawei.com>,
 linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <5158e4e0-3275-4c29-a8fc-2dfabc13a69d@app.fastmail.com>
In-Reply-To: <CAOLeWCtxPk7q_bVvrcKaipSKr+_=57Auobcj0cFRvXxXMdH58g@mail.gmail.com>
References: <20260318150245.3080719-1-demyansh@gmail.com>
 <f9bc0534-4b7a-4b14-974b-4d7811ccd899@app.fastmail.com>
 <acJhCCPfVxjFUZ5R@J2N7QTR9R3>
 <CAOLeWCsxhzdxQviizJ4X4VOp_28LCtO-RjWoCcZG29rQw86NVg@mail.gmail.com>
 <9a12e043-8200-4650-bfe2-cbece57a4f87@app.fastmail.com>
 <20260331063659.GA2061@lst.de>
 <CAOLeWCtnZz=kHGk4C2f9Mbfi3tEBE100iCkMBhcG47dmR9eDWw@mail.gmail.com>
 <CAOLeWCtxPk7q_bVvrcKaipSKr+_=57Auobcj0cFRvXxXMdH58g@mail.gmail.com>
Subject: Re: [PATCH v2] raid6: arm64: add SVE optimized implementation for syndrome
 generation
Content-Type: text/plain
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

Hi Demian,

On Thu, 16 Apr 2026, at 14:40, Demian Shulhan wrote:
> Hi all,
>
> Sorry for the delay. The tests became more complex than I initially
> thought, so I needed to gather more data and properly validate the
> results across different hardware configurations.
>
> Firstly, I want to clarify the results from my March 29 tests. I found
> a flaw in my initial custom benchmark. The massive 2x throughput gap on
> 24 disks wasn't solely due to SVE's superiority, but rather a severe L1
> D-Cache thrashing issue that disproportionately penalized NEON.
>
> My custom test lacked memset() initialization, causing all data buffers
> to map to the Linux Zero Page (Virtually Indexed, Physically Tagged
> cache aliasing).

D-caches always behave as PIPT on arm64. This is complex stuff, so please
don't present conjecture as fact.

> Furthermore, even with memset(), allocating contiguous
> page-aligned buffers can causes severe Cache Address Sharing (a known
> issue that Andrea Mazzoleni solved in SnapRAID 13 years ago using
> RAID_MALLOC_DISPLACEMENT).
>
> Because SVE (svex4) uses 256-bit registers on Neoverse-V1, it performs
> exactly half the number of memory load instructions compared to 128-bit
> NEON. This dramatically reduced the L1 cache alias thrashing, allowing
> SVE to survive the memory bottleneck while NEON choked:
>

You are drawing some conclusions here without disclosing the actual
information that you based this on. D-caches are non-aliasing on arm64.

So what exactly did you fix in your test case?

> Custom test without memset (4kb block):
>  | algo=neonx4 ndisks=24 iterations=1M time=11.014s MB/s=7802.57
>  | algo=svex4  ndisks=24 iterations=1M time=5.719s  MB/s=15026.92
>

This is the result where all data buffer pointers point to the same
memory, right? I.e., the zero page? So this is an unrealistic use
case that we can disregard.

> Custom test with memset (4kb block):
>  | algo=neonx4 ndisks=24 iterations=1M time=6.165s  MB/s=13939.08
>  | algo=svex4  ndisks=24 iterations=1M time=5.839s  MB/s=14718.23
>
> Even with the corrected memory setup, the throughput gap narrowed, but
> the fundamental CPU-efficiency result remained fully intact.
>

Sorry but your result that SVE is 2x faster does not remain fully intact,
right? Given that the speedup is now 5.5%?

Should we just disregard the above results (and explanations) and focus
on the stuff below?

> To completely isolate these variables and provide accurate real-world
> data, the following test campaigns were done based on the SnapRAID
> project (https://github.com/amadvance/snapraid) using its
> perf_bench.c tool with proper memory displacement and a 256 KiB block
> size.
>
> Test configurations:
> - c7g.medium (AWS Graviton3, 1 vCPU): Neoverse-V1, 256-bit SVE
> - c7g.xlarge (AWS Graviton3, 4 vCPUs): Neoverse-V1, 256-bit SVE
> - c8g.xlarge (AWS Graviton4, 4 vCPUs): Neoverse-V2, 128-bit SVE
>
>
> =========================================================
> Section 1: SnapRAID Validation on Graviton3 / Neoverse-V1
> =========================================================
>
...
>
> 1.3 Main Graviton3 Conclusions
>  - On 256-bit SVE hardware, svex4 consistently retires about ~34% fewer
>    instructions and ~10-15% fewer CPU cycles than neonx4.
>
> =========================================================
> Section 2: SnapRAID Validation on Graviton4 / Neoverse-V2
> =========================================================
>
...
>
> 2.3 Main Graviton4 Conclusions
>  - On Neoverse-V2, SVE vector length is 128-bit (same as NEON).
>  - Without the 256-bit width, NEON outperforms SVE.
>  - svex4 retires ~32% MORE instructions here and is consistently slower.
>
> =========================================================
> Section 3: Validation on c7g.medium (1 vCPU)
> =========================================================
>
...
> 3.3 Main c7g.medium Conclusions
>  - The instruction count reduction (~34%) perfectly matches the 4-vCPU
>    instance.
>  - The single vCPU is heavily memory-bandwidth constrained (cycle counts
>    are much higher waiting for RAM).
>

OK, so the takeaway here is that SVE is only worth the hassle if the vector
length is at least 256 bits. This is not entirely surprising, but given that
Graviton4 went back to 128 bit vectors from 256, I wonder what the future
expectation is here.

But having these numbers is definitely a good first step. Now we need to
quantify the overhead associated with having kernel mode SVE state that
needs to be preserved/restored.

However, 10%-15% speedup that can only be achieved on SVE implementations
with 256 bit vectors or more may not be that enticing in the end. (The
fact that you are retiring 34% instructions less does not really matter
here unless there is some meaningful SMT-like sharing of functional units
going on in the meantime, which seems unlikely on a CPU that is maxed out
on the data side)


> =========================================================
> Section 4: The Pitfalls of the Current Kernel Benchmark
> =========================================================
>

These results seem very relevant - perhaps Christoph can give some guidance
on how we might use these to improve the built-in benchmarks to be more
accurate.


Thanks,



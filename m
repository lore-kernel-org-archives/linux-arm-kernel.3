Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A567EF436B2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 14:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ibwfIFnUUlarXWt/Vd+yl4IfzjwO5SQSWOvdj5rO59o=; b=H1EMyVnsczpMxr5hD6lbWiNfbL
	zjuh8XDznmwzWpGU+O8XuButbK7dIHR5mt9JIHh887GlOkOUjtmbNTwahdTpaCmzasNghFosiM1JE
	hIwyUD7GMyQyUDGwm3DTEMgx0gSxKa0C73NMgxiumYkHyV7oit3AECekWmZKJObRcRkrkjo2PJQB5
	FvwTBBu+kzBQXyG5uhO+ZkSh8BWVS7zKBIWEVncJhphRL/9MMfY+TT6/a23xcJHMzZU/OyjV6PwRq
	AqPLGLQkiA6fzgIKzp/+Y8WlqO1DEOlYF+7jkyXquFL3yqn5SeDQWGOjzmLpGramrnUs+jSzCnU+g
	wlbzHDeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDkPs-000000049K3-01Rr;
	Fri, 17 Apr 2026 14:43:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDkPp-000000049Jg-2iKv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 14:43:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 548244440D;
	Fri, 17 Apr 2026 14:43:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B35F4C4AF0B;
	Fri, 17 Apr 2026 14:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776437008;
	bh=ibwfIFnUUlarXWt/Vd+yl4IfzjwO5SQSWOvdj5rO59o=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=bl0et/Px8pJXMVYohkGsLalYpIg6KeNK6FKl2fXKNA4s3MOwTvQR3kmz380HGDoLy
	 cXFghKjGvykoVKwg6HYj9YJR9mCYoY6o+wa9OjqYjcQ3hpSA9jEdJ1Ts0Wv5PisScn
	 OxtS1EpCayaR/JVmHLE3MxVV1cyeSlXY9qQvFO9BRr7AFb7NficY3H9htgbpSQRlWB
	 YvzfYDi0Yipy2S0Fh5j+kC+i6pAg/smHfQhn4ZFCsT/T1YTrzyQe62eDNPOsnj2Vjx
	 OyFXKEB4YFUoeM2Bp0ub7cHP3A+kycuny+lrGUK/kbJyH6B7sC+JzUxbZFcBfTrNNX
	 FUBleyHyX171Q==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id C1901F40074;
	Fri, 17 Apr 2026 10:43:26 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Fri, 17 Apr 2026 10:43:26 -0400
X-ME-Sender: <xms:DkfiaXTbkpP5A8w4pdzr8XrAoDf0lvatJs9502j3293KdgJwHFSZfw>
    <xme:DkfiaTl8MIkb9Ui3AkHYOl7ClQfdk6seyVPhcsMTn82F7bcjnTGS-PEFUukvR4uHi
    P7EKpN1PvFR9ERtBVKxjhIIRvwYGt4Egk2Gv6uDa9g_2FJImIRx0Bc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdehtdduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhguuceu
    ihgvshhhvghuvhgvlhdfuceorghruggssehkvghrnhgvlhdrohhrgheqnecuggftrfgrth
    htvghrnhepvdeuheeitdevtdelkeduudetgffftdelteefteevjeevjeeiheefhfejieej
    fedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeijedthedttdejledq
    feefvdduieegudehqdgrrhgusgeppehkvghrnhgvlhdrohhrghesfihorhhkohhfrghrug
    drtghomhdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepmh
    grrhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtoheprhhosghinhdrmhhu
    rhhphhihsegrrhhmrdgtohhmpdhrtghpthhtohephihukhhurghisehfnhhnrghsrdgtoh
    hmpdhrtghpthhtohepuggvmhihrghnshhhsehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    lhhinhgrnhduvddvsehhuhgrfigvihdrtghomhdprhgtphhtthhopegsrhhoohhnihgvse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehsohhngheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:DkfiaaBNfkHHowV89EbpEv0UcFRqubvCBzSkUDnoyuf0llcCiuydPg>
    <xmx:DkfiaYPAyklSFCAv3ZZM04805p7q1L-ufnUb3xjINtEwPH1wnm7oAA>
    <xmx:DkfiaWP3hG587E8ctgsmXbZd9_8JKmFSpd8i9R4wVzWoyFnVqF5EnQ>
    <xmx:DkfiaaKOpJ4OFsQJTe55ckgSSEwzuvTNep34MDZvZvAZgDCGTmKx1w>
    <xmx:DkfiaQrP-Hzi17D6vFpiJmrydcZ2YswO-z5ScYHlZ1VpO4M74xB76OfG>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 90D9E700065; Fri, 17 Apr 2026 10:43:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 17 Apr 2026 16:43:06 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Robin Murphy" <robin.murphy@arm.com>,
 "Demian Shulhan" <demyansh@gmail.com>
Cc: "Christoph Hellwig" <hch@lst.de>, "Mark Rutland" <mark.rutland@arm.com>,
 "Song Liu" <song@kernel.org>, "Yu Kuai" <yukuai@fnnas.com>,
 "Will Deacon" <will@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Mark Brown" <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 "Li Nan" <linan122@huawei.com>, linux-raid@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <c9362db6-1fef-4e70-9525-29b2936f4887@app.fastmail.com>
In-Reply-To: <8db4defe-8b5e-4cc3-880b-72d46510b034@arm.com>
References: <20260318150245.3080719-1-demyansh@gmail.com>
 <f9bc0534-4b7a-4b14-974b-4d7811ccd899@app.fastmail.com>
 <acJhCCPfVxjFUZ5R@J2N7QTR9R3>
 <CAOLeWCsxhzdxQviizJ4X4VOp_28LCtO-RjWoCcZG29rQw86NVg@mail.gmail.com>
 <9a12e043-8200-4650-bfe2-cbece57a4f87@app.fastmail.com>
 <20260331063659.GA2061@lst.de>
 <CAOLeWCtnZz=kHGk4C2f9Mbfi3tEBE100iCkMBhcG47dmR9eDWw@mail.gmail.com>
 <CAOLeWCtxPk7q_bVvrcKaipSKr+_=57Auobcj0cFRvXxXMdH58g@mail.gmail.com>
 <5158e4e0-3275-4c29-a8fc-2dfabc13a69d@app.fastmail.com>
 <CAOLeWCtf2rZyPeJH-LuZ2A+c7mC9M2r-Ya0VjyOJFpun3TFMnw@mail.gmail.com>
 <8db4defe-8b5e-4cc3-880b-72d46510b034@arm.com>
Subject: Re: [PATCH v2] raid6: arm64: add SVE optimized implementation for syndrome
 generation
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_074329_753781_F568F45B 
X-CRM114-Status: GOOD (  20.02  )
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


On Thu, 16 Apr 2026, at 18:26, Robin Murphy wrote:
> On 16/04/2026 3:59 pm, Demian Shulhan wrote:
>> Hi Ard!
...
>>> OK, so the takeaway here is that SVE is only worth the hassle if the
>>> vector length is at least 256 bits. This is not entirely surprising,
>>> but given that Graviton4 went back to 128 bit vectors from 256, I
>>> wonder what the future expectation is here.
>>
>> I agree. The results from the SnapRAID tests are not as impressive as
>> I hoped, and the fact that Neoverse-V2 went back to 128-bit is a red
>> flag. It suggests that wide SVE registers might not be a priority in
>> future architecture versions.
>
> If you look at the Neoverse V1 software optimisation guide[1], the SVE
> instructions generally have half the throughput of their ASIMD
> equivalents (i.e. presumably the vector pipes are still only 128 bits
> wide and SVE is just using them in pairs), so indeed the total
> instruction count is largely meaningless - IPC might be somewhat more
> relevant, but I'd say the only performance number that's really
> meaningful is the end-to-end MB/s measure of how fast the function
> implementation as a whole can process data.

On arm64, kernel mode NEON is mostly used to gain access to AES and SHA
instructions, and only to a lesser degree to speed up ordinary
arithmetic, and so XOR is somewhat of an outlier here.

Given that Neoverse V1 apparently already carves up ordinary arithmetic
performed on 256-bit vectors and operates on 128 bits at a time, I am
rather skeptical that we're likely to see any SVE implementations of the
crypto extensions soon that are meaningfully faster, given that these
are presumably much costlier to implement in terms of gate count, and
therefore likely to be split up even on SVE implementations that can
perform ordinary arithmetic on 256+ bit vectors in a single cycle. Note
that even the arm64 SIMD accelerated CRC implementations rely heavily on
64x64->128 polynomial multiplication.

IOW, before we consider kernel mode SVE, I'd like to see some benchmarks
for other algorithms too.

> It's probably also worth checking whether the current NEON routines
> themselves are actually optimal for modern big CPUs - things have
> moved on quite a bit since Cortex-A57 (whose ASIMD performance could
> also be described as "esoteric" at the best of times...)
>

Some of those crypto routines could definitely be made faster, but it
highly depends on the context whether that actually helps: for instance,
there was a proposal a while ago to incorporate the AES-GCM code from
the OpenSSL project (authored by ARM) but at the time, it slightly
regressed the ~1500 byte case and only gave a substantial improvement
for much larger block sizes, which aren't that common in the kernel for
this particular algorithm.

IOW, any contributions that improve the existing code (or outright
replace it with something faster, for all I care) are highly
appreciated, but they should be motivated by benchmarks that reflect
the use cases that we actually consider important for the algorithm
in question.


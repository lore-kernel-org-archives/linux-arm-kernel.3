Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E4EFED9E4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 15:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TXnZ5LNY2whQgQd5nM30YY+FOaSou4brWnq8XBTt87U=; b=cjdWx9dXtiLNlTMRhpJB5WXLNg
	b7zF+eh+E5gUA8qptvx4aYr/CGAoJyQXEUpoiph+EEEN/jWdtJPcj9ZjCjhWEITsMOw3gdsbsEm4B
	lpGl8nh574Xz8l/zu2pkIwPbVfYK2qPHYSYUYGfgH0/2hsIHq80uV9lBGikoSXf50lZMlr/FfkNQm
	zalgO9qXhk4XCeoUOlf2qD7OlxDDn3bmWeFzf65NzsSKnVs8r/Ar6AxGcRI2XOQide8q+dkkbhk5N
	2JVmBFKYCctGRnc/B0nUU3nHD460bbEragKZO84yUAmHkW20NjTTA3D/Pll0jkI6BjW2m4YMrkx65
	HUy+1rbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2W2M-00000006gnC-2tOI;
	Tue, 17 Mar 2026 15:08:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2W2K-00000006gmT-1rNd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 15:08:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 586D643A71;
	Tue, 17 Mar 2026 15:08:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA6AC4AF0B;
	Tue, 17 Mar 2026 15:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773760126;
	bh=Mr8nFOMXA5ElV7SfPAaspq7Qh87bB2g0Z7bO4Atcjpg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=XO4i6R2UlygzDSxeSGU/XndQrZ9yTF1jwhcMd+O+UVdGInzgfui5F4itxIV+lSRR5
	 y/LK+JA4f97h5CULBsqEq//fzHkIwZFvzPGLm4RrXXejElLpp0xvsinlR1+Ku2utXb
	 Y5E4a9y+fW0ZVTLoq2lmy/YaGTXkQzm/TOfNVXfkg43GLncP20G1J4HkSqQ3cS0FMn
	 3LLA/suwIoItvNT1EiJ8zp14YlBpPRpq28AFi99O5nOUaNH5CMfvBDRaJJI1Hr+y63
	 kpFH7GCEWCU+c9x+10obm/xC85grVZPmI066Fi7Xp0ddOx4qDl85Y3pFw8K5lz0xj4
	 Pv3ywfPJSiFpg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id D2968F40071;
	Tue, 17 Mar 2026 11:08:44 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Tue, 17 Mar 2026 11:08:44 -0400
X-ME-Sender: <xms:fG65abCxstZNJj7FHEq82SEXWQTV0TaPWLeFvc6KUqnHXAq2YrAA7g>
    <xme:fG65acWbiD_mtCj5Ytly0zEfZT4tf0KVbdomRu-83YlDK4d3g7DefisHbB7lK3P9W
    j_EHJSak51OC4np04ybaWULo9mVClDwytwAPyEBADf-esHNxckmyzBG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdduheejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpedvueehiedtvedtleekuddutefgffdtleetfeetveejveejieehfefhjeei
    jeefudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdehtddtjeel
    qdeffedvudeigeduhedqrghruggspeepkhgvrhhnvghlrdhorhhgseifohhrkhhofhgrrh
    gurdgtohhmpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohephh
    gvrhgsvghrthesghhonhguohhrrdgrphgrnhgrrdhorhhgrdgruhdprhgtphhtthhopehh
    tghhsehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepvggsihhgghgvrhhssehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrg
    gurdhorhhgpdhrtghpthhtoheplhhinhhugidqtghrhihpthhosehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepjhgrshhonhesiiigvdgtgedrtghomh
X-ME-Proxy: <xmx:fG65aYuok-blM0mBAaiWPna8oMSA1snjL6wMV5SBp3mWm9JbsgsC5A>
    <xmx:fG65abcccpnRaI6yp8h-Ey8KvFrIHGq_Q55Yaf3AG4RCW7gDVzKC8w>
    <xmx:fG65aekM15kjzIgQX43LElqb3j07OVoxNlukOhhYj_NJpZkMByo8mg>
    <xmx:fG65aeDlZ219m8e0_mmv2ShikggnfaoZQeC7GWtBs6cs3ddfWEzEcA>
    <xmx:fG65aYPivqHq_hB2TWaqMw72jeXSf3Cx5EAk9Jh0VsZ4G6D2xp6_Ar7B>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AD9CD700065; Tue, 17 Mar 2026 11:08:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A0MGIhlQvLYV
Date: Tue, 17 Mar 2026 16:08:24 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Christoph Hellwig" <hch@infradead.org>
Cc: "Eric Biggers" <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>,
 linux-arm-kernel@lists.infradead.org,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Message-Id: <ef71c58d-3950-474e-bddb-fc95f8d18b07@app.fastmail.com>
In-Reply-To: <ablpCtKCV5goM_AD@infradead.org>
References: <20260314175049.26931-1-ebiggers@kernel.org>
 <38a37b02-602a-42a4-8974-b8a6cd750c3e@app.fastmail.com>
 <ablpCtKCV5goM_AD@infradead.org>
Subject: Re: [PATCH] lib/crypto: arm64: Drop checks for CONFIG_KERNEL_MODE_NEON
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_080848_531347_91D38838 
X-CRM114-Status: GOOD (  11.74  )
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


On Tue, 17 Mar 2026, at 15:45, Christoph Hellwig wrote:
> On Tue, Mar 17, 2026 at 12:09:34PM +0100, Ard Biesheuvel wrote:
>> Acked-by: Ard Biesheuvel <ardb@kernel.org>
>> 
>> Actually, we should just get rid of CONFIG_KERNEL_MODE_NEON entirely on arm64, although there is some code shared with ARM that would still need some checks. But anything that is arm64-only should never look at this at all.
>
> I'll also drop it from the XOR series.
>

Ack - mind cc'ing me on the next revision?

> Talking about which (sorry for highjacking this thread), arm32 and arm64
> have completely different neon XOR implementations, where arm32 uses
> #pragma GCC optimize "tree-vectorize" or clang auto-vectorization of
> the generic C implementation, and arm64 uses intrinsics.  Is there any
> chance those could share a single implementation?

If we're migrating the XOR arch code to live under lib (if that is what you are proposing), I think we could tweak the arm64 implementation to make it build for ARM too, with the caveat that the 3-input EOR3 instruction does not exist there.


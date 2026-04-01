Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A871FD35144
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgY7Dg2wdZKod9lpN0cghi4LcrEelYHJpjbkfLWJrBc=; b=ShAvwIsgflQGsvuxPwPdH/n+V2
	igS+175WPt3Ffvn9dcm6DXRV/XQ8jIi7eFhaTstRdNx9X1Fjv0PEg47t5iKO1BtU0KwLMxbiosHm6
	H1J+KNecJu2eeexitrApvgsJaJFO9KWkvUfIKNWSQ+5mL/vkq306eJs0OdWPnY7zepr50RMtpiteu
	ReFGzm9CcpTimQoE6zgkWWG2pzBSE4JuRzQAj2VfQRCcn/A/pS1Bc+seP0r6gSLVEsotWz83fQwCN
	LFbTXwjSU+X74mTtJ0cAnhc+8alK2HCiMb9h04oHOxR5+4sjvlGX2Z4saIDRRWQn+rF85e72cMZcV
	NgmcEPDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pZv-0000000EA6G-2410;
	Wed, 01 Apr 2026 07:01:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7pZn-0000000EA1N-3SP2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 07:01:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 385AA404DC;
	Wed,  1 Apr 2026 07:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B794CC4CEF7;
	Wed,  1 Apr 2026 07:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775026879;
	bh=Bwy9wfZVxlaokc+KfkVhltejvIhjmBP86LTsX8ZfOas=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=j4JYGGEcBg7LF3ms6EQ/NMTfsrXfiCl38v9cn3ApM4rvtteVdR/pUF+/v2vJ9nByF
	 +TuWqJwzEHg420L+Vznghf54sQ56O8XZBwL4CYVpHk8I8yswkYoT6HEu2uRAGh2a2E
	 s5aB3ppxLphII3yXnEY6skMdO8VYiFVUBm0jERB9497EJpmGHxxkDkUzsRrZDWZHp6
	 6sYYEUMx9wPqeqToYvLDds4ylUJgijOgzkAwTvDZ5Jdn2pP7dXYpBefO08h5WDSELj
	 4nw+PWzq2jXLw//9+79vpUENeyjs0Ffh9kO8fNpGoCMZUXmW4zLGpXPALWX0iWGcbL
	 zj2nwNTtI9WVQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id BC8A1F40081;
	Wed,  1 Apr 2026 03:01:17 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Wed, 01 Apr 2026 03:01:17 -0400
X-ME-Sender: <xms:vcLMaVY8FL-o1qcxYn795HpiD7LgdWdCSPSfA53u46BTBgQQgF_dRQ>
    <xme:vcLMaXPIqZg7IRQvwUo6jazmaB_SXir3YUbY5IBi-Qr9HgfMlps0qWMuoE40cgUui
    gROuQg8mSkP7bHQlDkK6ESMkNa48tYKnyoTv9-NYTA2FUFghH1aVbE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvgeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcuuehi
    vghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpedvueehiedtvedtleekuddutefgffdtleetfeetveejveejieehfefhjeeijeef
    udenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    guodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdehtddtjeelqdef
    fedvudeigeduhedqrghruggspeepkhgvrhhnvghlrdhorhhgseifohhrkhhofhgrrhgurd
    gtohhmpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehhvghrsggvrhhtsehgohhnughorhdrrghprghnrgdrohhrghdrrghupdhrtghpthhtoh
    epvggsihhgghgvrhhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgr
    rhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtth
    hopehlihhnuhigqdgtrhihphhtohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
    thhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtph
    htthhopehjrghsohhnseiigidvtgegrdgtohhm
X-ME-Proxy: <xmx:vcLMaTBjCSZpfBVI6o_vYGMNibhNdbffHOlv7cVvEUpP8t2-0bqltg>
    <xmx:vcLMaTm7qQPTSk0lQgJWrtcWG7-_3fM7CSv75CsWbizCSHgt8nzOxw>
    <xmx:vcLMaedI4IcBkLT9ktjBs16bBdWxECms9QGFv5gO_n34mxkmm5eI7g>
    <xmx:vcLMaXSPW3HslaxkXbpjEL9_qxZZew-M5ubEsWXcLheJf5GBOyleBA>
    <xmx:vcLMaVsKW_F23UINJL9xdKQhpIVGWW80qxTvgW2mWX2dhbBOjkod3yqk>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9C02370006A; Wed,  1 Apr 2026 03:01:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A2hVHX09Hs_c
Date: Wed, 01 Apr 2026 09:00:57 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Eric Biggers" <ebiggers@kernel.org>, linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>,
 linux-arm-kernel@lists.infradead.org
Message-Id: <55da45c4-4f06-430e-a14b-ecfeeb8d22d1@app.fastmail.com>
In-Reply-To: <20260401000548.133151-1-ebiggers@kernel.org>
References: <20260401000548.133151-1-ebiggers@kernel.org>
Subject: Re: [PATCH 0/9] lib/crypto: arm64: Remove obsolete chunking logic
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_000120_001563_0F799425 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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

On Wed, 1 Apr 2026, at 02:05, Eric Biggers wrote:
> Since commit aefbab8e77eb ("arm64: fpsimd: Preserve/restore kernel mode
> NEON at context switch"), kernel-mode NEON sections have been
> preemptible on arm64.  And since commit 7dadeaa6e851 ("sched: Further
> restrict the preemption modes"), voluntary preemption is no longer
> supported on arm64 either.  Therefore, there's no longer any need to
> limit the length of kernel-mode NEON sections on arm64.
>
> This series simplifies the code in lib/crypto/arm64/ accordingly by
> using longer kernel-mode NEON sections instead of multiple shorter ones.
>
> This series is targeting libcrypto-next.
>
> Eric Biggers (9):
>   lib/crypto: arm64/aes: Remove obsolete chunking logic
>   lib/crypto: arm64/chacha: Remove obsolete chunking logic
>   lib/crypto: arm64/gf128hash: Remove obsolete chunking logic
>   lib/crypto: arm64/poly1305: Remove obsolete chunking logic
>   lib/crypto: arm64/sha1: Remove obsolete chunking logic
>   lib/crypto: arm64/sha256: Remove obsolete chunking logic
>   lib/crypto: arm64/sha512: Remove obsolete chunking logic
>   lib/crypto: arm64/sha3: Remove obsolete chunking logic
>   arm64: fpsimd: Remove obsolete cond_yield macro
>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>


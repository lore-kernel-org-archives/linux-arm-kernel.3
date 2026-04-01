Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626B3D3514B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 07:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i16X/VMBLM2HmH1EkKusbLWyKu5DYBLsRolq6C1/VZI=; b=vijZBCHugN5Q6U9Mmi1DnU2enc
	X64oxB4NuRdwoc8+OCC8sv7HOH38o1SOk1GMlEZBV6IvU7mbE2EkSd/SjC0nFeZZZqSaCk52Ml3fz
	e1e56alpZVvZEuZLPa/XRuqDzjSAlfQCrLyuJ+P2Gqwl8cU1jnYJKBDdExVaKESo0zgsk8oxl9P5P
	jijUheL1KvI7GtsYi8TdHYEFTZDubh+FQhCnjdfTqpf573KSBRZ6PsqCO9nIs5QhDbuhUoSGI2Lcn
	mejlPGA5P79Wolz7S2CYsuLPQAJzlC2r5DNOlcxwqEfgVzizwXJ2VmfVtBSx69ieM1l/lP7Kfjo3g
	kYQoglPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7q3L-0000000EEG5-44cq;
	Wed, 01 Apr 2026 07:31:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7q3L-0000000EEFZ-0CDJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 07:31:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E9AD0600C4;
	Wed,  1 Apr 2026 07:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B974C19423;
	Wed,  1 Apr 2026 07:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775028709;
	bh=IZ+lq6z/zre6b9tz3T6OUxgEWHImu6aX2Wtg9rskWfk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=UlUJKOsRldvU9XmGgo4G4xKaAeCvD+h6hEQ9jwYGt8/ewvbqTcQ2q9AiMCYkCqYK5
	 +KJLSWWNprt8ry+D1z5mmyjP8+RQcM8LH2c7aN2e4DpfKAQMo+1gf4yQ1V98OpgRxr
	 qHzZUwm88dj5806tiqSfgnBRDYMJETmPF1KoWzLS6b1b2PbDYdKObCnUrCkEKHXDz1
	 wpK2850kxt3Aw0Tzf0HRvO9kBZadTlNcieS4ol1YlttXPS5Dz4DBgKh18QmYTOFbJe
	 2uOMiIJ4kbAsKZIiW+NAoZX52X9YvYOj1pzVU/etfK0fnFZAGYgns939c5vE4u7/sK
	 SY1/6GTJJkn0Q==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 65A5FF40068;
	Wed,  1 Apr 2026 03:31:48 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Wed, 01 Apr 2026 03:31:48 -0400
X-ME-Sender: <xms:5MnMaeKg8A1q61tCZsM8venvrnLAz-sbzqWepjRwBedys6pwX81JYg>
    <xme:5MnMaQ9g5kfMHRttn6gGr7HTAlHIV0M5Qp0T-qvHNOH7AVPy695SPPm-3l_AhKdoN
    9pj0xELjZ6HXJc3MrgUvX0d1Qfps-LMEg1iYn-3tTHS3VI8siRUow8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvheduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcuuehi
    vghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpedvueehiedtvedtleekuddutefgffdtleetfeetveejveejieehfefhjeeijeef
    udenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    guodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdehtddtjeelqdef
    fedvudeigeduhedqrghruggspeepkhgvrhhnvghlrdhorhhgseifohhrkhhofhgrrhgurd
    gtohhmpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehhvghrsggvrhhtsehgohhnughorhdrrghprghnrgdrohhrghdrrghupdhrtghpthhtoh
    epvggsihhgghgvrhhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgr
    rhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtth
    hopehlihhnuhigqdgtrhihphhtohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
    thhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtph
    htthhopehjrghsohhnseiigidvtgegrdgtohhm
X-ME-Proxy: <xmx:5MnMaby4mtw-gACOFsUupxx4Pkwx1rFt_0YnBoUPOLjKwcjPoI4Hsg>
    <xmx:5MnMadXvdpfwQXqSJAWR3u_Ug0hX1IzdZY3pKg5gAFlU937gkyqElw>
    <xmx:5MnMaVPXU5v8oUnjZmyXXXM6pHTpbWiorTTciQiaQMef8iMKKrG9ZQ>
    <xmx:5MnMaXA7FH-ZnmRw-7YZ8vU7vYQxglgEODEFaHgPASd74M7bJ7tHWQ>
    <xmx:5MnMaaes0MfeYHxl76zBapdvrxOqz63mNr3G8aulUFUWgNP3Q8XJwVfg>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 48FA2700065; Wed,  1 Apr 2026 03:31:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AbuMglSPIfTN
Date: Wed, 01 Apr 2026 09:31:28 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Eric Biggers" <ebiggers@kernel.org>, linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>,
 linux-arm-kernel@lists.infradead.org
Message-Id: <dd3a1dbb-4426-49e4-899c-a9377ec0939d@app.fastmail.com>
In-Reply-To: <20260401003331.144065-1-ebiggers@kernel.org>
References: <20260401003331.144065-1-ebiggers@kernel.org>
Subject: Re: [PATCH] lib/crypto: arm64: Assume a little-endian kernel
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



On Wed, 1 Apr 2026, at 02:33, Eric Biggers wrote:
> Since support for big-endian arm64 kernels was removed, the CPU_LE()
> macro now unconditionally emits the code it is passed, and the CPU_BE()
> macro now unconditionally discards the code it is passed.
>
> Simplify the assembly code in lib/crypto/arm64/ accordingly.
>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>
> This patch is targeting libcrypto-next
>
>  lib/crypto/arm64/aes-cipher-core.S  | 10 -------
>  lib/crypto/arm64/chacha-neon-core.S | 16 -----------
>  lib/crypto/arm64/ghash-neon-core.S  |  2 +-
>  lib/crypto/arm64/sha1-ce-core.S     |  8 +++---
>  lib/crypto/arm64/sha256-ce.S        | 41 +++++++++++++----------------
>  lib/crypto/arm64/sha512-ce-core.S   | 16 +++++------
>  lib/crypto/arm64/sm3-ce-core.S      |  8 +++---
>  7 files changed, 36 insertions(+), 65 deletions(-)
>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>


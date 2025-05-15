Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BF9C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 15:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AxWp/bO6a/dlbN9S4ZXHuFnqObOo8qNPEmwy3SAkQvE=; b=UcPnsALOz+xr4ycHhel1G+5fLm
	TGXuDoOUyMlSWHaLorQ8sorZp1vvqYWhbLu2gw1yjIsApM/BHbk4N/7jaPbGddhzRzUvHh9CW2uGS
	i3AJ7jrQm8s0JiDgQzCkOjPe5XAYspnVEMZZS6FaYBTa7x1GQnu4tQfowdaw2tW5HVCzaW+wlrl0C
	b3flmve2QPCSUQHZL7FJMWbclHd6bXnzcYFil7jmqMgGFfSsh7RYz3ahOSFLdM27UIHNmSaqabj5C
	eR08NkXIHgpHtywpxaQ/NJwxzDoIX1/381D4RoiXllxsY7LbKoFwCnbg0NmbVVR13iNVGZMHfKg+1
	9smZ2kfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFaTm-0000000136R-1OuX;
	Thu, 15 May 2025 15:26:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFaRk-000000012pZ-1h2k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 15:24:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 76BA643593;
	Thu, 15 May 2025 15:24:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07B7CC4CEEF;
	Thu, 15 May 2025 15:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747322671;
	bh=mThh3LiRoZ0/VEkP3K5cxEaWK3WMhF83PfhnB+8FtnE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=UzVahxZvE4YlGy5uMUO4l9BFBqzVk9fxqsieZkED7ki6l+K/y/UXkGS3DfO9Gh8Aq
	 xCOYAQBHu5MyRMWfCFLtoK3plPQ9HjnFCdb7h9qzu9MMagtdR/AXdHzsuLYzE3Kk4E
	 VCdAUs4qznH8c9BKJ2Snp+AgFwPlqMakw/t9Ieni5OS/yvJZ1xzILQqDd6ZSHL0zIC
	 5dozMPfboV+b7koxLlz6KEW43Zi7LPZr42lc0A2/hdggDsYHWb/14ADVBCmlckcRDl
	 lEmOw0JEo7uqzNEb0e/mTEm8O5CA0R+REl4BrXdFtXJeg1vupOyjxRIyoyUlZZVP9h
	 qIzVXcVRjdAlg==
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 05DF6120007C;
	Thu, 15 May 2025 11:24:30 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Thu, 15 May 2025 11:24:30 -0400
X-ME-Sender: <xms:LQcmaPJJOrCFG73Vxqx6H7y1JwXFwVeEwJZEjK3Wilja2BT4d_GKRA>
    <xme:LQcmaDIET7ZIqL5LeewxknQwZQtYriwgL7zNbZcFUHtwS_vcnTwNMHOwtBqXGxP1G
    T9QMvFaXRWCmi4tKQ4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddtvddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnh
    gvlhdrohhrgheqnecuggftrfgrthhtvghrnhepjeejffetteefteekieejudeguedvgfef
    feeitdduieekgeegfeekhfduhfelhfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheprghrnhguodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdduvdekhedujedtvdegqddvkeejtddtvdeigedqrghrnhgupeepkhgvrhhnvg
    hlrdhorhhgsegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtohepfhgvshhtvghvrghmseguvghngidruggvpdhrtghpthhtoh
    epfhgvshhtvghvrghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohephhgvrhgsvghrthes
    ghhonhguohhrrdgrphgrnhgrrdhorhhgrdgruhdprhgtphhtthhopegvsghighhgvghrsh
    esghhoohhglhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghl
    sehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:LQcmaHsN4s7ffGtZMxrP4u-5NqGsS5O9vMM9efv361_0MAihyUoFyg>
    <xmx:LQcmaIaro4rZi--wOAw9vn4PuC9Lmob3l-93GPumsUvaZbz7hjdFAw>
    <xmx:LQcmaGYwlqNZHc6kSZOWUwq77_E3ivPRW6e5Rz2acARzzPdhkzR_NA>
    <xmx:LQcmaMDbXCnlZRqenkGQ6yAuadhY2JG-jxdVNiBtwmtvcWLefxtSfw>
    <xmx:LQcmaEailZGo-JefDogn8UQ4Twq0O-ZKGJDJVVYD3A28BR-Udvrh9zg_>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D0B06106005E; Thu, 15 May 2025 11:24:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Ted18243d6c85cbb9
Date: Thu, 15 May 2025 17:24:09 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Fabio Estevam" <festevam@gmail.com>
Cc: "Herbert Xu" <herbert@gondor.apana.org.au>,
 "Eric Biggers" <ebiggers@google.com>, linux-arm-kernel@lists.infradead.org,
 "Fabio Estevam" <festevam@denx.de>
Message-Id: <ece2df8d-acaa-4554-8c82-24ed45f3a8a4@app.fastmail.com>
In-Reply-To: <20250515151548.431853-1-festevam@gmail.com>
References: <20250515151548.431853-1-festevam@gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Ensure CRYPTO_CHACHA20_NEON is selected
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_082432_486072_AE0A41CB 
X-CRM114-Status: GOOD (  11.40  )
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

On Thu, May 15, 2025, at 17:15, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
>
> Since commit 17ec3e71ba79 ("crypto: lib/Kconfig - Hide arch options from
> user"), the CRYPTO_CHACHA20_NEON option is no longer selected by default
> due to changes in how crypto library options are exposed and selected.
>
> To restore the previous behavior and ensure CRYPTO_CHACHA20_NEON is
> enabled, explicitly select CONFIG_CRYPTO_CHACHA20 in the defconfig. This
> pulls in CRYPTO_LIB_CHACHA_INTERNAL and allows CRYPTO_CHACHA20_NEON to be
> selected automatically as before.
>
> Fixes: 17ec3e71ba79 ("crypto: lib/Kconfig - Hide arch options from user")
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Acked-by: Arnd Bergmann <arnd@arndb.de> 

in case Herbert wants to pick this up as a fix for the crypto tree,
or I can apply this through arm-soc if you send a copy to soc@lists.linux.dev.

      Arnd


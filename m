Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8D2C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 13:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/CqZOqLup6xvIywqoPIxhoUTzY2HWbFRMD0iQbgjd0=; b=sx8oK7DNijyJUnMYu6GE88wAR0
	6WC7DQkj87ZemqX1keNTIz4JzrolYpp2/abeUk6F/wd7hzJvHEkMGQWx96i9fKCFKkzWjHdtll0Hb
	ZdDkXoZIt/MdnK36QznBI164M8Is0n2wsjM/Oa1H0ylAIUnj7fzx3NckpuBoDVkYKJ9s23Phu3rPx
	4R6USXnZ9Sf5wZdDmhU+IVWq3ZyudKjfC8Z1YZHv+bSACRHyCKAF/I1hxi2PMLTaTM66ZTmwoidKu
	Uv9Qh4jleuDyFuE7EoeQLn/oSGnpdyPdnWeKg3q+RZVyfU/5Y2OMqGCyNdqQ0dUDWrATfdyp/9zlo
	2kYQtm3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXg9u-0000000ETNm-3oUa;
	Fri, 04 Jul 2025 13:08:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXg5M-0000000ESei-2MDh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 13:04:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0914F45F99;
	Fri,  4 Jul 2025 13:04:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3BB9C4CEEB;
	Fri,  4 Jul 2025 13:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751634251;
	bh=x/CqZOqLup6xvIywqoPIxhoUTzY2HWbFRMD0iQbgjd0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=IGmBMBClf+RwN3YyNrdb1Abs8NnJSYkOUhlYN3ZKk0epejsuio/ybIV1aRTyz8Xdm
	 vHClTlKrNuiemixVlZ8HFW9IBw1PVCc2WnQvBVkqpkf23s353cYNtNjF1kb+8VSWEZ
	 YxAw9VD7guNkqFWaA52P+SgbSQIOw4AXRdVin7Gjr1aCeqpdml/p+UNz9uBNyZQqT4
	 YjXYfuUoXpncnUbLA648fF7R9sV0oPrpfOV3xvDEcN6/pevCRpO1m906HnNmq4g1A/
	 HlO7SGGUXpJgq7V81dWkar7H4VxWRxdME7jiqjjOw+az5jnI7HA4cwMn9EFiI3zfTx
	 5yqkqI7krNE4w==
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id BB6BAF40066;
	Fri,  4 Jul 2025 09:04:10 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 04 Jul 2025 09:04:10 -0400
X-ME-Sender: <xms:StFnaKnZ01qgJVhy9xusnFs3BikKvutLQCFeEVtnU_Uzkw_5GgmQWg>
    <xme:StFnaB2fg3_xVmGwiCSJVMEUeTbjmecqFFSUTKj8P9Ci5kusMjlGPrMvDiMYRZMgw
    c0E8fRy5x3L_yXfYfI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvfedvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugeskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpeejjeffteetfeetkeeijedugeeuvdfgfeefiedtudeikeeggeefkefhudfhlefh
    veenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidquddvkeehudejtddvgedq
    vdekjedttddvieegqdgrrhhnugeppehkvghrnhgvlhdrohhrghesrghrnhgusgdruggvpd
    hnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhn
    uhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepsghrghhlsegsghguvg
    hvrdhplhdprhgtphhtthhopegsrghrthhoshiirdhgohhlrghsiigvfihskhhisehlihhn
    rghrohdrohhrghdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghroh
    drohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdr
    ihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhgphhiohesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhg
    vghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:StFnaIolG1hLWgDLhV3R3nYQfoPpa3nJxUR0VyMvVkmQ7eud9sVwww>
    <xmx:StFnaOljZHP28NXdUbUIRaSTcOI4A8dODPjunuewcTJdl6h6pT_rqg>
    <xmx:StFnaI2kkbiBy6857EKmo5TZh4bHu4asvmbhe0xW5gEXgkB-PqREVQ>
    <xmx:StFnaFtavOjlWA6ryCafcJZ_bkd5iAKxjBp6CRKRo5eW-QrpSxIZOA>
    <xmx:StFnaEXM4fkXbs65meQ7inGwdmq8jsJfFw6NCXPbIMrrkChjPIjpb_YM>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8E2DB700069; Fri,  4 Jul 2025 09:04:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T32a3380a6a3c276e
Date: Fri, 04 Jul 2025 15:03:49 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Russell King" <linux@armlinux.org.uk>,
 "Linus Walleij" <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>
Message-Id: <0d5be287-e11b-405d-87ed-972a198f00e9@app.fastmail.com>
In-Reply-To: <20250623-gpiochip-set-rv-gpio-v3-1-90f0e170a846@linaro.org>
References: <20250623-gpiochip-set-rv-gpio-v3-1-90f0e170a846@linaro.org>
Subject: Re: [PATCH v3] gpio: reg: use new GPIO line value setter callbacks
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_060412_646440_5D2929F0 
X-CRM114-Status: GOOD (  14.95  )
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

On Mon, Jun 23, 2025, at 09:57, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the legacy generic
> gpio-reg module to using them. We have to update the two legacy ARM
> platforms that use it at the same time as they call the set_multiple()
> callbacks directly (they shouldn't but it's old technical debt I
> suppose).
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This is the
> last remaining patch from a bigger series that already went into
> linux-next. The idea is for the ARM changes to be Acked by Arnd or
> Russell and routed through the GPIO tree.

Acked-by: Arnd Bergmann <arnd@arndb.de>


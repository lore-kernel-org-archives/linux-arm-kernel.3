Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E73610AB830
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvZFSyq8QW4V7ZlgaK7boMJFXcBY/yCMgDul6Cw5wwE=; b=EGVSp4XXSWc8tmWVj88qEFBygK
	KGojepO1JEo3ANX98CBx+fmai96s6GRk1GWfv4icfpag4yRsP9WIbw+VValVFF3jxwx5rXqAQB0pQ
	aO+lnwPHBAWK0t2H42xNh+Mo6Ly2cOONn3246q/Gveb/BGDAVsR1rszAVgjTJrV/MviFaerproKkl
	qUwt4pSXDq38MhGUH8Bf4aRZz0tYex35RTFAGJKAE7jjU82pfzHU3YZ9Qo3iLQyIwPRglC1WOfK3E
	h9axfn3yyfwcD/xJLQLun3Y4Eq4eXz3gMixG3B+JU6SzAX/jsmvh4sf317MOX3sm5dnp5pelCBgGA
	d14nFEZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w68S4-00000007dI2-2DKt;
	Fri, 27 Mar 2026 14:46:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w68S3-00000007dHR-1J8i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 14:46:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BC42360103;
	Fri, 27 Mar 2026 14:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21BC4C2BCB1;
	Fri, 27 Mar 2026 14:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774622778;
	bh=SbAKA/26LwcK0q6dnMapaGU5thIjIo4BFuftIcsI5lY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=nqszAYyreIRCife/vpIN9/huQ3fE2pwToGH/nZJFyR9x/kziTa8XBKe+Hf9Sq587B
	 k7vczpCVD/R67EjPkF001zU0l+B8QkezAbLyXM4BfzIzJpwH08jey2VAZ55fFaTpAa
	 UWk56zktKiz+H3eEp5EicsCHHEAV+RzukCLooVLfhv0z72BhAOn22AYa+Xordd3fWj
	 DZ1kv1R6+9yWS29R1UnghQM5fXSC0a+rQYXSY9knHq7KBYcTkmOxKsF4ssQ89pMtjk
	 giRpeA1puUVqa43oAietYqgmHlKtr7QIw7uYY86XdAzCZ8o3RtTVxClBkR91DJKnjj
	 UBE2TFve7tdfg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 04F02F40069;
	Fri, 27 Mar 2026 10:46:17 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Fri, 27 Mar 2026 10:46:17 -0400
X-ME-Sender: <xms:OJjGabeK1xgOJy27hyTavZFZ0BZJCaT2m241Zo6OE1NmV_-t6GoBmw>
    <xme:OJjGacBNqagaEeXB8zEFwXswzcInEt-nPdgWwx-kDfJnFfXyHB_rocRHEeD1aLmKj
    S7DGSsPbfu_Z9TRfMilXhqov39ReLD-4Xsw3vAONL28t9DZDUa30NY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeffedtheeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpedvueehiedtvedtleekuddutefgffdtleetfeetveejveejieehfefhjeei
    jeefudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdehtddtjeel
    qdeffedvudeigeduhedqrghruggspeepkhgvrhhnvghlrdhorhhgseifohhrkhhofhgrrh
    gurdgtohhmpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoheprghrnh
    gusegrrhhnuggsrdguvgdprhgtphhtthhopegrrhgusgdoghhithesghhoohhglhgvrdgt
    ohhmpdhrtghpthhtohepvggsihhgghgvrhhssehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdr
    ohhrghdprhgtphhtthhopehhtghhsehlshhtrdguvgdprhgtphhtthhopehlihhnuhigqd
    gtrhihphhtohesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhrrghiugesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:OJjGaS6Po9-4bXBSer7-ZkhqFNfP8OL95UK2T4hi3RcjCoj-cbA0Vg>
    <xmx:OJjGaQ0APBvxXavPcuwNj07qkbZM6BpV0URyWA9PmCsEsFVeVxf8OQ>
    <xmx:OJjGaVvjE1TzRL1QgJYMMARQo0RR9Fh3mhSrDccjHUeV8PslstPbzg>
    <xmx:OJjGae5FQT5bj2TQ-FBCcLRFm13TD2Or97f2rTu1Mv71cJXK2gXbRw>
    <xmx:OJjGaZeWDcvkzfZHIYoZu8Avzm9bW-HaR8wAO-WJnG1JoFc3jvMj-9Aa>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id CEC2C700065; Fri, 27 Mar 2026 10:46:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ANyOC1R28h8-
Date: Fri, 27 Mar 2026 15:45:56 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Christoph Hellwig" <hch@lst.de>, "Ard Biesheuvel" <ardb+git@google.com>
Cc: linux-raid@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, "Russell King" <linux@armlinux.org.uk>,
 "Arnd Bergmann" <arnd@arndb.de>, "Eric Biggers" <ebiggers@kernel.org>
Message-Id: <cca6facc-6c37-48d0-81e6-f8568f36b91d@app.fastmail.com>
In-Reply-To: <20260327135051.GA739@lst.de>
References: <20260327113047.4043492-7-ardb+git@google.com>
 <20260327113047.4043492-11-ardb+git@google.com> <20260327135051.GA739@lst.de>
Subject: Re: [PATCH 4/5] xor/arm64: Use shared NEON intrinsics implementation from
 32-bit ARM
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

On Fri, 27 Mar 2026, at 14:50, Christoph Hellwig wrote:
> On Fri, Mar 27, 2026 at 12:30:52PM +0100, Ard Biesheuvel wrote:
>> From: Ard Biesheuvel <ardb@kernel.org>
>> 
>> Tweak the arm64 code so that the pure NEON intrinsics implementation of
>> XOR is shared between arm64 and ARM.
>
> Instead of hiding the implementation in a header, just split xor-neon.c
> into two .c files, one of which could be built by arm32 as well.

That is what patch 3/5 does. This patch wires up that version into arm64, and drops the copy that has become redundant as a result.

> probably
> in the arm/ instead of the arm64/ subdirectory, but we can also add a
> new arm-common one if that's what the arm maintainers prefer.

Having the shared pure NEON version in arm/ is perfectly fine.

Building it as a separate compilation unit for arm64 should also be straight-forward, the only issue is that the 2-way NEON version needs to be shared with the EOR3 compilation unit.




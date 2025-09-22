Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153BFCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=spCmI4qpr96vlC+6fo13WS0SrNCRrYHQpc+SyJrq5no=; b=urKqNKBOpkIkksLdHEGSzS8P5c
	FjOgZEmBWfhLkqL09KSl72XjniMBv4pruK2JyVczLKwlYzT6dVSAWAEEfOLZynDag+0CzMsEh6S/n
	WnuCF6ZrWYQ3vgjSStBzN9C3zbHu5L/D4fZVBgav2niUeOPB57AGnGz6/fx56CE5r4Fiyha9RTRai
	VlRRwwNgXCUNBB8ziTfR1tVvryEnpXXY5tlCb/b2sVn5X48SvCO7R/0xPcrU6N3ffsBq1AsNWj8mG
	vZWlNF4utZrXJmVzsbae4cwzsljF3NHQsDMzVLkjINOzzZ4LaRn0kpFHyybyP1ppyGuTlRpswxGB6
	ZhzcEHEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gTT-0000000AUX7-06vp;
	Mon, 22 Sep 2025 13:20:59 +0000
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gTP-0000000AUW9-3CMU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:20:57 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 54E1F140014E;
	Mon, 22 Sep 2025 09:20:54 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 22 Sep 2025 09:20:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758547254;
	 x=1758633654; bh=spCmI4qpr96vlC+6fo13WS0SrNCRrYHQpc+SyJrq5no=; b=
	dhk1or6RXuzqy3ZN6yGP2ezg4vNPx1g5j/3U2t3ZqKbhqMi51sBnw1Y9SDbUvjXe
	RQPJnFHZ1mWBzHZLbZLmw35vtOac0ExqrijHClpZzEmcBruiJ+pB1CLD/I6roS7s
	xczCIJaIOfj48FI+b11PLUYCFAjgH7j2/pPR6r7ILMzzVoNSTQs8KmNjOPMZWthp
	chvyBk4WY1z6L2k2SnXwPws+zj6B7jLq21WE/hsRmsJwgcpr9j/HKRtkmjsFlWC6
	S1HESdRRF+rSYZ+pwXMYy0MVClJCGy9c6+yteXw/42xjDV1viLmkpNIKscIcuHJ7
	m7h+W30SIOLMkS+6jpFckQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758547254; x=
	1758633654; bh=spCmI4qpr96vlC+6fo13WS0SrNCRrYHQpc+SyJrq5no=; b=R
	z7+ty/kRD30juLcAOy2/iu5hKtqVP74Dmgw5mcHTmc7AtyS8UPcXY9flfjaN+x99
	ZFX/6VGYYsPB4/3iLzsNdD5Y+4eBazKoMSN4iG3e/91nWzyr2y/5hFfsT0GSHZIa
	1eG54n1D5GK5Hygmig8+0ZxEMTNKo8zcbnZRu/zEAdcVYBAYKviEaxa9E1APZkeL
	JM/aMS8tgWPAaz3tJgz+DhF7tli6mBsVTTwtWEqgPH1gqzX0de4OibLMYcNHmGxr
	ym01rkvs37ldCGNyN+wWDYofUbyobKN0iNhpvYJ85RUFSpTsoAxRW6HKj2yd2suU
	vejHf0n39XD6M/MqQ8Vzg==
X-ME-Sender: <xms:Nk3RaJHz34vvWIIHBtSJCoI0BYVwF4JWgr-1Ky6urSunePwfOq5Kyw>
    <xme:Nk3RaOUW0VLA1L337koW8KlilOFpz2AnpzbQtESzF0CG7XYuuFi5QvRhbglaFMLeP
    pEVxOmeQNh5MzJ6dl4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdehjeelhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeefhfehteffuddvgfeigefhjeetvdekteekjeefkeekleffjeetvedvgefhhfeihfen
    ucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghp
    thhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugidqrghrmh
    dqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohep
    shhtvghfrghnrdifihgvhhhlvghrsehnohhkihgrrdgtohhmpdhrtghpthhtoheplhhinh
    hugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Nk3RaAtXKtk3yb6HfhfqV49z-_fGG-FbGtxCptXUxDqPaIJb2l1h5A>
    <xmx:Nk3RaIX7MbfaT4KVW9bAYhSsyLHBtMI7-tlQnaGsDu6WbEV1XCTNew>
    <xmx:Nk3RaDlWDIDPe-MHs3kCaQPocarHmm9Ecx0tM1dzd15mlAchNBPUiQ>
    <xmx:Nk3RaBb6LfPmNk4oudKcmf2auVHi1EsaPaCbTAF3xTYaPjBYCR87pA>
    <xmx:Nk3RaD9vYB5t6nBYlQqt85xqZYQAQjjNPrAps8j_l9yMaL_YLT0uL0gy>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 11BAB700065; Mon, 22 Sep 2025 09:20:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AeuX_cJPfcCo
Date: Mon, 22 Sep 2025 15:20:23 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Stefan Wiehler" <stefan.wiehler@nokia.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Message-Id: <9ac3eb75-efac-4f3c-a3e9-6953db4babf8@app.fastmail.com>
In-Reply-To: <8f104eba-6805-46e0-90da-232ce18973c5@nokia.com>
References: <8f104eba-6805-46e0-90da-232ce18973c5@nokia.com>
Subject: Re: Highmem on AXM and K2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_062056_023542_36C3BB84 
X-CRM114-Status: GOOD (  36.30  )
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

On Fri, Sep 19, 2025, at 15:24, Stefan Wiehler wrote:
> Hi Arnd,
>
> You've been calling out for users still needing highmem, and here we are ;-) We
> use both the Intel AXM 5516 and the TI KeyStone II with > 4 GB of RAM in our
> networking products.

Hi Stefan,

Thanks a lot for getting back to me on this!

> We use the AXM 5516 with 6 GB of RAM and highmem is therefore a must for us.
> The latest estimate from product management for EOL is June 2029. We would
> appreciate if this date (plus some buffer) could be kept in mind when choosing
> the last LTS kernel with highmem.

Ok, I think this one is fine for the highmem usage at least. According
to our current discussions, we'd likely start by reducing the references
to highmem but keep supporting it for the page cache. Even with the
earliler timeline I posted in [1], 2029 would be covered by the LTS kernel
that gets released in late 2026.

The other problem on this platform is that upstream support has been
abandoned by Intel a long time ago and as you know the drivers that
did get merged are incomplete, so you are already on your own.

Alexander Sverdlin at some point in the past considered upstreaming
more of it, but that never happened during his time at Nokia. If you
or someone else are interested in improving upstream support for the
Axxia platform, that is still something that could be done. I know
there are other users interested in it, and some of the original
software team are now working for consulting companies that would
likely offer their services.

> With the TI K2, the situation is more complicated: The EOL for the latest
> product hasn't even been defined yet, but most likely we need to support it
> until 2037; it really depends on when the last 2G/3G networks will be shut
> down. Obviously the community cannot wait that long with highmem removal. While
> we have 5 GB of RAM there, a little bit less than half is used by Linux. 

Right, this is clearly the more worrying of the two platforms, and I had
not expected the timeline to extend that far into the future. The platform
has some nasty quirks with its memory layout (having to use lowmem at
physical address >0x100000000 to get coherent DMA, and needing ARM_LPAE for
that) and does not have a lot of activity upstream, so I had hoped that
it would not be as long-lived as come other platforms.

> I see two options:
> 1. We'll need to evaluate if we could move away from current CONFIG_MEMSPLIT_3G
> with our rather special memory configuration. My current understanding is that
> there hasn't been a lot of interest in getting CONFIG_VMSPLIT_4G_4G into
> mainline. As we cannot accept major performance degradation, I doubt that this
> will be a viable path.
> 2. We'll need to switch over to the last highmem-enabled SLTS kernel, earliest
> around 2028 (to keep some support buffer).

Right, I agree that these are the two possible options, and I think
we can make the timeline work for option 2, though option 1 is
likely better longtime if we can come up with solution that works
for your specific workload.

Can you share more details about how exactly system uses its highmem
today? In particular:

- The physical memory layout, especially whether the memory
  that is assigned to Linux is physically contigouous, or if
  the memory owned by other components (the network processor
  or an FPGA) is taken from the middle. Note that at the
  moment, any memory that is too far away from the first
  page becomes highmem, even if the total RAM is under 800MB.  

- Is the memory mainly used for file backing (including tmpfs) or
  is it used as anonymous memory (like malloc()) in a few processes?

- If most of the memory is mapped into a small number of
  processes, how close are you to reaching the available 3GB
  virtual address limit in those processes?

- If possible, share the contents of /proc/meminfo, /proc/zoneinfo
  and the /proc/${PID}/maps for the processes with the largest vsize
  (according to ps)?

If the largest process needs more than 2GB of virtual address
space, then there is not much hope in changing to CONFIG_VMSPLIT_2G
or CONFIG_VMSPLIT_1G. On the other hand if your workload does
not rely on having all that memory mapped into a single address
space, using VMPLIT_1G would likely improve system performance
noticeably and have no other downside.

     Arnd

[1] https://lore.kernel.org/lkml/4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com/


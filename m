Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F2ACAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 21:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CLqRBKVf5IvTh800HM+2y42LrS7XFT+UlQoEp2IAPso=; b=GhmaCR88hijcCY7Dm5SsxhQwPb
	VpT6/EKk8Y67dlN688mXJfZ5xbi0SX790M0FaJxdTRIBygeVtEP1vhdzP0+ugXc4xf8EIauGdF+kO
	eHQsOTkABtEYwVVuPsRyFmtgvLKFdBqVrJMdpwzyi30Jf5ihayeNZnn6oOTGc+6kAUno+vxACQbWq
	pBXGpaF2kuIz13eceJyoFJwl1Ygy8iSaegKufPPdXd6eZ/Uuzo8SRRrmv/SzF40G/uR1rlRXhoaCV
	U/GhDVuHiDcgLZqb6YuK32Cz9m6duCwI2IJlCaG+7vhYsDD6ZtDxNAorVAoQWBP5JYEkhGYMghoQR
	r21lB2Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxB1o-0000000BZPo-24ov;
	Fri, 12 Sep 2025 21:09:56 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxB1k-0000000BZMV-2RQX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 21:09:55 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 128BF7A01CD;
	Fri, 12 Sep 2025 17:09:50 -0400 (EDT)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-05.internal (MEProxy); Fri, 12 Sep 2025 17:09:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757711389;
	 x=1757797789; bh=CLqRBKVf5IvTh800HM+2y42LrS7XFT+UlQoEp2IAPso=; b=
	GI4t6+q5kXjCO6cruisFBrxlfYspQdyR2nSwyVUifQzM7VEMrmYCNyjAVYjNhTgm
	WqCqX8kZdK2deNSwLTBVJ3N8pSl0NhU5c9HH2kyD2VdFMzafqFVFH9hpDeIJNrzj
	g4Qa7RVKOklHp6T9//Fk2QqJOmtlyMcvCzaPH7vzB72i03nMdNbtRdOZjHzQ4h/L
	ftry70985VVJ0JC8deKiZyhzurfBwKKn5fmc5YLwZO9NW0AWFO9cbhr6Oa1pnc8X
	IbeXUCwwcUmmLw1JIdKGv7tJjqaUU7L6MH1vAFkSQFJ8ZQ5CrDw16pFxmTMYZ3b4
	iRfechyn/kmAf/3LIGcGLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757711389; x=
	1757797789; bh=CLqRBKVf5IvTh800HM+2y42LrS7XFT+UlQoEp2IAPso=; b=H
	g+efwLEojmMZRq8iZwYjjIYprH/XYxRGz4gmpycxwdhPe1s8+YfTor2bbGv0c0B2
	RLsa8YQz2KykS1Kzwhrjk5vc4sNyX55mlyEc/YPCTF+a+h5XGA1P5EP0qMtntlaW
	glaOlh/Kn+XcHwMTpuhR2UrjWZGj35jBvgxWwqm5OAUbjTj6+VnIzZ7ANky9E3Wz
	IpurPFx3x7zuk4nsRKyP70Og/99u4DsemcafNS5R+S7aIEm+gzBBWkmSBQ6mFI6Z
	sZlMDN5oUpNr0X2A2oOZa95CyTZTboiXtWUjzqMltgruej+lvRP5fnsTfi9FdrWx
	iwGev+FnsPgCi2tPWVfjQ==
X-ME-Sender: <xms:GozEaJ7WVeaEI1J4FNYCAeFSe1bMurC67OT_BB0Jbhk6PWXzJbvBLQ>
    <xme:GozEaG5x_FaTJVZFNRf7pkhjUFbOGrPCkzZW9DKjVtpsq9dK8yfY--QfEjU7m0KIT
    _ceh86DRDz2N8UZEKI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeftddtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeevhfelgeefleefgedttefhgfffieejkefghfeghffhheelieeivdduteevhedvgeen
    ucffohhmrghinheplhifnhdrnhgvthenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthho
    peefvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptghhvghsthgvrhdrrgdruh
    hnrghlsegrrhhinhgtledrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghl
    lhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheptghhrhhishhtohhphhgvrd
    hlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopegrnhgurhgvrghssehgrghi
    shhlvghrrdgtohhmpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvg
    hrrdgsvgdprhgtphhtthhopegrlhgvgigrnhguvghrrdhsvhgvrhgulhhinhesghhmrghi
    lhdrtghomhdprhgtphhtthhopehsvghrghhiohdrphgrrhgrtghuvghllhhoshesghhmrg
    hilhdrtghomhdprhgtphhtthhopehsuhhrvghnsgesghhoohhglhgvrdgtohhmpdhrtghp
    thhtohepfihilhhlhiesihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:GozEaDU9e-ltO4GjQuBQZhofb5Kj9EDyPaq1nCnmbW-klx59mcvMXA>
    <xmx:GozEaKDK4yJBaHtkl_LHlcH0jkKXOLdoeoxqmFBWV2JzvB84rcbpfw>
    <xmx:GozEaCC2WD64DUi7GSydM1X-85yv-7hi6n4v8g8ii_kFrgTh92XlXw>
    <xmx:GozEaJphW--h3lZUWi9M-TVTnM42xRnish8dD4tvsnrWGtNkHbKeKA>
    <xmx:HYzEaKn6J5RHAuH4Qzhj_HsWd61NA-XKIndTEYj5XMySXeVQsv1vmoqt>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AFA80C40077; Fri, 12 Sep 2025 17:09:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AneuvEk2E7Kg
Date: Fri, 12 Sep 2025 23:09:22 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nicolas Ferre" <nicolas.ferre@microchip.com>, ksummit@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, imx@lists.linux.dev,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Richard Weinberger" <richard@nod.at>,
 "Lucas Stach" <l.stach@pengutronix.de>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Ankur Arora" <ankur.a.arora@oracle.com>,
 "David Hildenbrand" <david@redhat.com>,
 "Mike Rapoport" <rppt@kernel.org>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Matthew Wilcox" <willy@infradead.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>,
 "Suren Baghdasaryan" <surenb@google.com>,
 "Ira Weiny" <ira.weiny@intel.com>, "Nishanth Menon" <nm@ti.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Alexander Sverdlin" <alexander.sverdlin@gmail.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 "Sergio Paracuellos" <sergio.paracuellos@gmail.com>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Mihai.Sain" <Mihai.Sain@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>
Message-Id: <1d58fc51-b921-4669-b6e2-f9a71d1eda58@app.fastmail.com>
In-Reply-To: <f931da29-5f10-494a-acc0-309bd805d41a@microchip.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <f931da29-5f10-494a-acc0-309bd805d41a@microchip.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_140953_098500_CE2A48E2 
X-CRM114-Status: GOOD (  24.04  )
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

On Fri, Sep 12, 2025, at 18:49, Nicolas Ferre wrote:
> Arnd,
>
> On 09/09/2025 at 23:23, Arnd Bergmann wrote:
>> I'm still collecting information about which of the remaining highmem
>> users plan to keep updating their kernels and for what reason.
>
> We have 1GB of memory on our latest Cortex-A7 SAMA7D65 evaluation boards 
> [1] (full production announced beg. 2025). The wide range of DDR types 
> supported make some of these types interesting to use at such density.
> Both our Cortex-A7 SoCs don't have IOMMU; core and DMAs can address the 
> full range of the 32 bit address space, so we're quite 
> standard/simplistic in this area. We use CMA with large chunks as our 
> camera or display interfaces address "modern-ish" resolutions (~1080p).
>
> We use CONFIG_HIGHMEM and activated it for simplicity, conformance to 
> usual user-space workloads and planned to add it to our sama7_defconfig 
> [2]. I understand that we might reconsider this "by default" choice and 
> move to one of the solutions you highlighted in your message, lwn.net 
> article or recent talk at ELC-E.

Hi Nicolas,

Thanks for your summary! I think with 1GB, you'll be mostly on the safe
side in general. I would definitely recommend using VMSPLIT_3G_OPT
as the default in the long run and turn off highmem on those.

My expectation is that VMSPLIT_3G_OPT may uncover application bugs, but
those should be fixed anyway, while using highmem is safer but makes
everything slightly worse through the added runtime overhead and
increased fragmentation risk. The 1GB case has caused additional bugs
because it has a very small highmem area on CONFIG_VMSPLIT_3G and
that can make it run out of highmem first. 

> Of course we plan to maintain these boards and keep updating our kernel 
> "offer" once a year for those associated SoCs (with maintaining 
> upstream, as usual). As you said, being ARMv7, we're quite confident for 
> now.
>
> As you mentioned, we've recently released one ARMv5te arm926ejs-based 
> soc: the SAM9x75 family. But we don't have the intention to use too big 
> memory sizes on them, even if they do address large screens, with LVDS 
> and MIPI or modern camera interfaces...
>
> I don't have too much info about our customer's use cases as they are 
> very, very diverse, but don't hesitate to reach out to me if you have 
> questions about a particular combination of use.
> Thanks for your regular update on these topics.

I'm curious about the AT91RM9200 part, which I think is the oldest 
SoC with Linux support that is still advertised as "in production".
I understand that Microchip hardly ever discontinues parts, and there is
clearly no need to stop supporting it as long as you maintain the SAM9
family, but I wonder how many users are still buying this part or
running the latest kernel on it. 

    Arnd


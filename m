Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241FAC54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 11:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XhhVWC6jzn1Afzw69bBokx+BW+sGIY/e9FBTuoQUXbo=; b=EgjFMH6kEgCVIuqIBoUO5jL53d
	GXSzOvv1AHxf0wyJblS/1KjZHfZrxIyRGTntKj0tPcP7SObq6i23X7dWan+OJ/B2c2RoOOPLvvPgs
	CYzPzu101eqwyl5qOEpim8X6/uGj7LE0zN5WdaOs8vE+RcScirZcgD5Fc7cLQ2UtzaJRw3wXjUBBN
	ABuUYP9ooAaKhM02g2IRR6kc4X9tjbMncTFdsGhSfxPCwxmT80dMwQQjJQ+LXVMZLjMrfFhLbEhO5
	+ZIt/Za6a8M5i84J87qvtd2xBD8vv2oTPUi7eJv8HrtktihN1eKAJhEJJjQ3iS9HrryCwcdmmgn+o
	8uJl0u8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI44M-00000000rSa-1WLf;
	Thu, 22 May 2025 11:26:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI42H-00000000rBF-228Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 May 2025 11:24:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 466A75C0499;
	Thu, 22 May 2025 11:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C666BC4CEED;
	Thu, 22 May 2025 11:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747913068;
	bh=+zQS3S6RMbxbtQ1jmleifwG7mLFUwlhBih4BfL3KQyc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=QWCGv5I/b6g+XR9O5W2v/wQb8CUECyukG3CwF0l97X0ghij//jNKjph0vRVJ2Va+e
	 nySiQ0D7Yeks//MpMqeQMi0flot6YfwwO+yI3QjpG4EGf02gNg+2voae00qmd/FoLD
	 o2oxrepwBPjeJGIJuo71fnzM141Md7/KGTsuIy9TwWQh7IGec7f0Hsk2T9kyAwA91W
	 EZmXQGVJ8NKB+CiH/bjckujP/aV1TPXo2CWEn4iEZr0WtHqRffwLmBBlRE8YFEG66b
	 XJ6eWQDBl7SZObVmfjII8Q2VNW0A7HIw135YmgUNPwDOOdnPz3qJBePhEgkbe9rjwD
	 XFH4ZeoosFuaw==
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id B66641200043;
	Thu, 22 May 2025 07:24:26 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Thu, 22 May 2025 07:24:26 -0400
X-ME-Sender: <xms:agkvaGInivNR1_igikpTEaJ8gFW66enV8XgE2JpfYuzQr6blhyiZ1g>
    <xme:agkvaOLsgmNwYJJCeacPrh9a_u_9VErXlwN9EInDKpPNbxe8RvoKZvY2OqK2J3uNf
    kzizdlcFti2OAKaazI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdehkeegucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgj
    fhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuc
    eorghrnhgusehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepjeejffetteef
    teekieejudeguedvgfeffeeitdduieekgeegfeekhfduhfelhfevnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhguodhmvghsmhhtphgr
    uhhthhhpvghrshhonhgrlhhithihqdduvdekhedujedtvdegqddvkeejtddtvdeigedqrg
    hrnhgupeepkhgvrhhnvghlrdhorhhgsegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    gedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepkhgvnhhtrdhovhgvrhhsthhrvg
    gvtheslhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgv
    lheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehpvghnghdrfh
    grnhesnhigphdrtghomhdprhgtphhtthhopehlihhnuhigqdgstggrtghhvghfshesvhhg
    vghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:agkvaGtASlOK3Gpw1n7r6OGUb_R7FIQzGERBuR91-LrVdZDEfGqBhg>
    <xmx:agkvaLb7BJ41ytP76-k1X4AdAfJPyUfip7SruoaM_IIxCTXVBYaD8Q>
    <xmx:agkvaNZ0UN4dyCLO8ZTUMJNF6Hjty_7LUMupho6wV182qOV-keVciw>
    <xmx:agkvaHCfaLsBkxnlU3KFPdCB_nUePkK7H3UCe8o6GC2mq8T9ySlIxw>
    <xmx:agkvaDYUqFg0nGaGmq4CoVq0Cz1Wpcr1hPzBDXHHIvMQGcK8fb8OGnvo>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 895A11060061; Thu, 22 May 2025 07:24:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Te8dbde31adf78faf
Date: Thu, 22 May 2025 13:23:56 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Peng Fan" <peng.fan@nxp.com>,
 "Kent Overstreet" <kent.overstreet@linux.dev>
Cc: "linux-bcachefs@vger.kernel.org" <linux-bcachefs@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Message-Id: <d8e9f098-49a2-4f1e-a6a5-7a6437658d93@app.fastmail.com>
In-Reply-To: <PAXPR04MB845954FBBF2AD810B17536138899A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <PAXPR04MB845954FBBF2AD810B17536138899A@PAXPR04MB8459.eurprd04.prod.outlook.com>
Subject: Re: error: the frame size of 1552 bytes is larger than 1280 bytes when
 building bcachefs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_042429_615711_76AFC61B 
X-CRM114-Status: UNSURE (   9.16  )
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

On Thu, May 22, 2025, at 08:39, Peng Fan wrote:
> Hi Kent, Arnd
>
> There is below build error with "make ARCH=arm randconfig; make"
>
> fs/bcachefs/data_update.c: In function 
> '__bch2_data_update_index_update':
> fs/bcachefs/data_update.c:439:1: error: the frame size of 1552 bytes is 
> larger than 1280 bytes [-Werror=frame-larger-than=]

Right, I think that's been the case with bcachefs since the start,
and I see it with allmodconfig as well, the problem being mostly
CONFIG_KASAN_STACK.

There are a couple of bcachefs functions that have an unusual number
of local struct variables in them, and KASAN_STACK adds a redzone
around each one of them, further increasing the size.

When I add "depends on !KASAN_STACK" to bcachefs, I see all
randconfig builds succeeding, but that may not be the best
solution.

     Arnd


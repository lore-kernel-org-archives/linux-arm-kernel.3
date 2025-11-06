Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F129CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 17:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQ4GgdM8KMjiFNoveJBSCQRm3uDbF8oZgBhhE89LoX4=; b=SUe12PvqPmHnyHeKSEF8MiGc4x
	I+qGIljriABmipGLJ1UXoB2YD3F8c6eA2cL3oBxGVroIyC5M6d4Iz1S7e2hQgHiMGfVhlGj2y7aFc
	hh8h5YGuPSsa0wIGQnr/nyj6TWDDgJMmRGiRH37WEiAmleL8ApPftrKk2GKvwbqPEFSNsw0rBkuiR
	AlgcB+xm52BKi0t1CRA0VruzwU9vrP7k2geT9JP7+p+IBFT6lrkEPcYJsnrhRfiuLlTKBbO9hg0BO
	cwgBxl00ZBloAEzIK238V49uZ1upV/HY+Y4+b4YouYfi9rKttZt/c+p6qsfJOlXOWYPy5RMBF2c13
	iPUjVTEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3gc-0000000G0mp-150r;
	Thu, 06 Nov 2025 17:22:14 +0000
Received: from fout-a4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3gZ-0000000G0mN-0wEd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 17:22:13 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 7131AEC025B;
	Thu,  6 Nov 2025 12:22:07 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 06 Nov 2025 12:22:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762449727;
	 x=1762536127; bh=TQ4GgdM8KMjiFNoveJBSCQRm3uDbF8oZgBhhE89LoX4=; b=
	PtsuK0f319LO45lQah6VIlHKcBebKDpwzs+8+S63Ih2uA1rnN8V+VHZwIo2IR6gE
	UotFl2nTxcby+j5R8f+Vmuhxgv4Hm5O90ixA7ZgJVMPMdu/irmAXQa3pHZxYlZUc
	Y3f3UI4bGgKxUqnYTCJr8stJZjZ49rN3UUh+m/DZ2yRbXZ06n5E35cbZ7jN2ns4R
	YE4x8CAbK0h4ChU4SWLti5Pf+Q+ujzQi+QAQehiYOzJbLeI8TuzyVsoRzZGYGEV2
	A792tJTOa9P3sKs4bNkVl89ferrG8+rQk6iKTByyeeLSfS2GncgY4E+R048EQ6c8
	OuiDEnH515NYfsukF4a9Ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762449727; x=
	1762536127; bh=TQ4GgdM8KMjiFNoveJBSCQRm3uDbF8oZgBhhE89LoX4=; b=2
	I7NVcIlWD2z3AfmYy/yeycsO4xGBqfCc1aJomcwzCoFur0AJ2uwG5Pxj9ZVMWP/P
	3fkJnC+MlLYdb1437+n4JwWje2YGCl5TBbkERKxQek8I3DXRTHm2Ov/xL3gU1AUH
	lP25GALiK/8YCJS8GJQMXZISwykI/bvZzMQbD6IqleeaQ1xHQk/pf4XLW8a89ZNv
	OX95Ffje2Bgdlk2/B9QwfyYmnNd/eTvKG06IuZyVGFox9K+C6ON4INyUtY+B4P7i
	/U1aaoL3jCfy65gUg/S0o/6AqzGuFurnw9i9bJjp27E1jQXjw2J61Znbq74l6Sdk
	spCFNTas3qBD8tC8Dw+Jw==
X-ME-Sender: <xms:PNkMaZMO1lPn7wub_x6RJYgXvPR-dmuVBOLe0MmQ3izKbD81hs6pnA>
    <xme:PNkMaWwaT8hRBGLxXu_WTAWlI-HdBAVJFL4oRJhvE5E1lv6zloisZkL9eWoT0SWaT
    IBdHg99pY-IDRQaDME0mJ54bwa48zwh-Mbn5smpD0W0gHaoCVNujIo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeejfeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepkedvuefhiedtueeijeevtdeiieejfeelvefffeelkeeiteejffdvkefgteeuhffg
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopeefkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhssghoghgvnh
    gusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopegtrghtrghlihhnrdhm
    rghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepvhhinhgtvghniihordhfrhgrsh
    gtihhnohesrghrmhdrtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidr
    ohhrghdruhhkpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrh
    houhhprdgvuhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhr
    tghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhrtghpthhtoheprghnug
    hrvggrshesghgrihhslhgvrhdrtghomhdprhgtphhtthhopehnphhighhgihhnsehgmhgr
    ihhlrdgtohhm
X-ME-Proxy: <xmx:PNkMaVUYfrmc5te1EUxSvgQ8TRVDaDGzRierkf5jayA311IlXx5ADA>
    <xmx:PNkMabX_DlTmYrLzD_sdL2tXkJ4F4s076mdaMi8qr6vq8DbuWNylbw>
    <xmx:PNkMaYMfKmo2E2B0ITXYRv6LyemjW9LOLDP3wOmyt7voffmGNPYxVA>
    <xmx:PNkMafizk25mJNDFFaNeFGIdB428VC0-WvGeQMoXVrdUlnXuPgrPYA>
    <xmx:P9kMaUCgmYPQKJzxhj8GAva_-VVQifLJ9oCwH3jMqxAHtW82r16n0xOk>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 78838700054; Thu,  6 Nov 2025 12:22:04 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AisJtzLZ_1Kg
Date: Thu, 06 Nov 2025 18:20:36 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Andy Lutomirski" <luto@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "David S . Miller" <davem@davemloft.net>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Nick Alcock" <nick.alcock@oracle.com>,
 "John Stultz" <jstultz@google.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 shuah <shuah@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Shannon Nelson" <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org,
 "Arnd Bergmann" <arnd@kernel.org>
Message-Id: <95430a56-1ee4-46e2-814e-01a8cd074a48@app.fastmail.com>
In-Reply-To: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
Subject: Re: [PATCH v5 00/34] sparc64: vdso: Switch to the generic vDSO library
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_092211_604492_20AD0CF0 
X-CRM114-Status: GOOD (  19.68  )
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

On Thu, Nov 6, 2025, at 11:01, Thomas Wei=C3=9Fschuh wrote:
> The generic vDSO provides a lot common functionality shared between
> different architectures. SPARC is the last architecture not using it,
> preventing some necessary code cleanup.
>
> Make use of the generic infrastructure.
>
> Follow-up to and replacement for Arnd's SPARC vDSO removal patches:
> https://lore.kernel.org/lkml/20250707144726.4008707-1-arnd@kernel.org/
>
> SPARC64 can not map .bss into userspace, so the vDSO datapages are
> switched over to be allocated dynamically. This requires changes to the
> s390 and random subsystem vDSO initialization as preparation.
> The random subsystem changes in turn require some cleanup of the vDSO
> headers to not end up as ugly #ifdef mess.
>
> Tested on a Niagara T4 and QEMU.
>
> This has a semantic conflict with my series "vdso: Reject absolute
> relocations during build" [0]. The last patch of this series expects a=
ll
> users of the generic vDSO library to use the vdsocheck tool.
> This is not the case (yet) for SPARC64. I do have the patches for the
> integration, the specifics will depend on which series is applied firs=
t.
>
> Based on v6.18-rc1.

I had a look at this version and everything looks fine to me.

Acked-by: Bergmann <arnd@arndb.de>

I see that you have sent the series 'to' a lot of people, so
I'm not sure who you expect to merge it. I assume this will all
go through the tip/timers/vdso branch, unless you need me to
pick it up through the asm-generic tree instead.

     Arnd


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33265C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 19:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EppjiZBFLpymW3k0IoAM4ktKeyibh2YCqj0MSCFFTf8=; b=x2FiLJiyBcwa/7BzyNMYIL4SU4
	rovM2O+4wPkpBNlnN9j7al09icFxGrgBnTb661lut2ax4u7QSdBYPuOwJuHNlpXlZFSvZ5SYqAW65
	G3bnNbLcea8qEViGKM0L8+kmJ1PzYVAsmCLU+9fcrcbkInXLEMo570TRbVItsDNe7wheRgIG6UUUt
	9D5wfpbgYbSOoIsdJHDgOEWmLBQ4M/uqNsqAWcNxRMFGFEsbw6wxsjZ80shscNuLUt83h56+xazb8
	nhMUa5f2DQurkaTD0mgH2kjKqAdgsJbCEk+Vkv29m8qfxpy4JDLbLXnDBS+BRypUn56qopBZurE9q
	Ogjh47KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVEkT-0000000FdVJ-1ExB;
	Fri, 27 Jun 2025 19:28:33 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVDxp-0000000FVv7-13hu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 18:38:19 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 25E7FEC009A;
	Fri, 27 Jun 2025 14:38:15 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 27 Jun 2025 14:38:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751049495;
	 x=1751135895; bh=EppjiZBFLpymW3k0IoAM4ktKeyibh2YCqj0MSCFFTf8=; b=
	a6KsZrUCgZnWxbdrELTCArv/39jaYVF74eSy5JiWDgkgJ8XlHte8XLkaQdkWvcCx
	A6htij8o7fjjygnvKP6J2Fjz3Y4oKXpVh9Q2mShKvNLPSyGiFDXYyNLI7EceD86k
	aUXA0Yxzb5z3PqceDYoHtGj6oors5HcXGEuiGJJSoKZQEuf5j45gJq2w+lgXqRFx
	MnTvTQqTiRKno5KkfGPrIZbQBxIKXPcoFcjYsRdhrAxXJN3tsZXWDj4dj13/NqxV
	g/8Jzk4bhiqDG2KAhB4LkKD+3sOcVLsgIE1iUPp8nWB8dYIV6S+Sz85EPz8zHCCq
	QGFpMX69nI5BnOSADAcd5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751049495; x=
	1751135895; bh=EppjiZBFLpymW3k0IoAM4ktKeyibh2YCqj0MSCFFTf8=; b=N
	SLsWnPddwalUg1e39Uu1dNo5RbqMj1u1SAbieq8Umd5MQBzITI2RHHoaN/I4VE3J
	1QZ62SAmJ2aeNSx8Rl9nFXapnuxhUWG5lS6jTo+/FlTFyDNFqXUgM/424kvSi9dD
	7iMWw+5UYOiJCdz/C+HYtUe2SiWc8s7TQgQ9sY6h0GrFIZrl6XgeShcDeWlK9Wza
	br9JgtCuERvS3ScT8uc6WVT3KVED+8BDpLUp6X62aEjC6U8lCoz/afYqFEI4tZYL
	pIbgXKJDLYgkwG/jXHO5el0NrjlSsn4gX/eGOcI/RA/MWmHYdfHjpFG3UID8V0HG
	ULVYajeAUBvvVzLc0gyWQ==
X-ME-Sender: <xms:FuVeaJRvr5wbXtftmiEUBvm9h1hLau66XG1G-qpqs_GGtF3VogjSnw>
    <xme:FuVeaCyWV9HbocBPKxWTct1J3P7Qoyj_-aQk4RHHkBNipYWXFTEdK5CzhINfeY1t4
    hRPrRFj72X2eLWYqmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epfefhheetffduvdfgieeghfejtedvkeetkeejfeekkeelffejteevvdeghffhiefhnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphht
    thhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgrrhhkrdhruhhtlh
    grnhgusegrrhhmrdgtohhmpdhrtghpthhtoheprhhosghinhdrmhhurhhphhihsegrrhhm
    rdgtohhmpdhrtghpthhtohepnhhitghkrdguvghsrghulhhnihgvrhhsodhlkhhmlhesgh
    hmrghilhdrtghomhdprhgtphhtthhopehjuhhsthhinhhsthhithhtsehgohhoghhlvgdr
    tghomhdprhgtphhtthhopehmohhrsghosehgohhoghhlvgdrtghomhdprhgtphhtthhope
    grrhhnugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdho
    rhhg
X-ME-Proxy: <xmx:FuVeaO3QJmNs3FqhuuDJfVl0DxYb2aACaSXSRcboFClgl2urwEv4Yg>
    <xmx:FuVeaBBPm3zvX6bceLK_mdpepxsRuOuzfV7bnQ73pMKqq92rj-ekRA>
    <xmx:FuVeaCjOLJYbynMg_7YPN24VgvWp4V5sEyPjLw2zQhpeLrNVjzcZXQ>
    <xmx:FuVeaFpTEnCzndnktMCO0IIFJJGmoODmHyxWZvO9XA7HHjOqptExFA>
    <xmx:F-VeaIpKXgEsEPXQWHynHa3_noFGIfugOmUKAnaDjXyZUK6PyqF5_haU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5527D700063; Fri, 27 Jun 2025 14:38:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T5c964ff673f056b0
Date: Fri, 27 Jun 2025 20:37:53 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Robin Murphy" <robin.murphy@arm.com>, "Arnd Bergmann" <arnd@kernel.org>,
 "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Nathan Chancellor" <nathan@kernel.org>
Cc: "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>,
 "Ilkka Koskinen" <ilkka@os.amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Message-Id: <0952a73f-3f3d-4531-a3ca-d68478a86e11@app.fastmail.com>
In-Reply-To: <39117e6a-ebb6-4c92-a19c-2033c4e590cd@arm.com>
References: <20250620115149.132845-1-arnd@kernel.org>
 <39117e6a-ebb6-4c92-a19c-2033c4e590cd@arm.com>
Subject: Re: [PATCH] perf/arm-cmn: reduce stack usage in arm_cmn_probe()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_113817_710168_C6B39161 
X-CRM114-Status: GOOD (  11.18  )
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

On Fri, Jun 27, 2025, at 19:57, Robin Murphy wrote:
> On 20/06/2025 12:51 pm, Arnd Bergmann wrote:
>
> At that point, though, it seems like we may as well just disable the 
> warning :/

I had a couple of cases like this, where the same large stack
happens on both gcc and clang, and adding noinline makes clang
behave the same way as gcc, so neither of them warns. Leaving
the warning enabled at this point at least ensures that we catch
it if it ever increases further.

There is a different type of problem (mostly on powerpc and mips,
but sometimes on arm64) where the 'noinline' helps clang to not
produce some really bad object code with unnecessary temporaries
on the stack.

> Fortunately it's not actually that hard to improve matters here, so I've 
> just sent that patch:
>
> https://lore.kernel.org/r/e7dd41bf0f1b098e2e4b01ef91318a4b272abff8.1751046159.git.robin.murphy@arm.com/T/#u

Nice, your version reduces the stack size from 1360 to 784 bytes
for my test randconfig, so that's clearly better than my version.

While attempting to reproduce this now, I also found that another
patch I had avoided the warning: I added -finline-max-stacksize=128
to the KASAN cflags, to work around some overeager inlining on
powerpc, and this had the same effect as my patch, but without
actually having to modify the sources.

     Arnd


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B59F606D83A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2QqtxW2S;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X6xbhRQf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fuQ3178AL1UXwToo1XcknyLf6+Rxx1bT4a3ss6S3V80=; b=2QqtxW2SH5tFLh10rfT6QttLEU
	HX6YWnyftuL0DbSM7piaOT8Xl6R6+tM/ADQ/+PC5CRLGQzip22SZG2ZifLQKk1rrv85T6veEtOyNW
	tvWhKzgZF0j8otO+c8jxRbw6uaKDN0/c8KZ5smlipqXHkn4y5flC6Bcigkw1UFAF4NVFRly2KbwzS
	Zsf2aeTgcbGoTKvoCdPso7sxoMbjI6x0pZ7Hm1oXE19/XariN3gKRMLqviB+gmYhDf6rb63HNvMqj
	mOLvTK08CnXO7f+jM4i/8pFGnww/vqJsA51yAojRz+unkveph5/2zpfrafNkA/HQFugNwg8lUojhx
	rK+j+k+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOETW-00000002XD0-2pcP;
	Tue, 03 Nov 2026 13:22:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOETV-00000002XCW-113k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:22:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CD1AC407A7;
	Tue,  3 Nov 2026 13:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 276C61F000C1;
	Tue,  3 Nov 2026 13:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793712172;
	bh=fuQ3178AL1UXwToo1XcknyLf6+Rxx1bT4a3ss6S3V80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X6xbhRQfoLbXk658NKrEHYDA1wPHQ2VyqBTjnFqMKKtjcWlrMTT5ave5ZO1bEjp7w
	 yJpQTwXZyOSIrGIv1CEGsqL1vhTDr3wiOqXaBcclHZjKWoVzhgQWfhn2hMJofKCDUA
	 pGv6BgxC8atCsUE1rqfA7bZjnEkGuAcxW0whXUYFzh2i2UtTnwL7hDyPOPBMCFAdnW
	 R8j+Sp/t86eUWWvrXYacUWlebCXn8lPIUh8YOeyz9aDYt2D7SKMu1Hk3MX/YE4Axjx
	 q0PCNLaxJkNha69YEmKDtULwy/D6Wvymt9UznOX8BALJsFOfxbpyzISzA0kb9YfOVM
	 47S7y9owLpu0A==
Date: Tue, 3 Nov 2026 13:22:47 +0000
From: Will Deacon <will@kernel.org>
To: Paul Cercueil <paul.cercueil@bootlin.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	leitao@debian.org, mhiramat@kernel.org
Subject: Re: [PATCH] arm64: Kconfig: add CONFIG_CMDLINE_EXTEND
Message-ID: <aungJ2BsmbHDNPLg@willie-the-truck>
References: <20261103084140.7689-1-paul.cercueil@bootlin.com>
 <aunCuysle9uzTRI1@willie-the-truck>
 <902f7e15f881583e9069ae1376952964f7bdf96e.camel@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <902f7e15f881583e9069ae1376952964f7bdf96e.camel@bootlin.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

[+Breno & Masami]

On Tue, Nov 03, 2026 at 12:49:21PM +0100, Paul Cercueil wrote:
> Le mardi 03 novembre 2026 à 11:17 +0000, Will Deacon a écrit :
> > On Tue, Nov 03, 2026 at 09:41:40AM +0100, Paul Cercueil wrote:
> > > Other archs have it, and it is supported in arch-independent code, so I
> > > see no reason why it is not provided on Aarch64. Add it there.
> > > 
> > > Signed-off-by: Paul Cercueil <paul.cercueil@bootlin.com>
> > > ---
> > >  arch/arm64/Kconfig | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > > index 1075bc661833..f8542e532b50 100644
> > > --- a/arch/arm64/Kconfig
> > > +++ b/arch/arm64/Kconfig
> > > @@ -2551,6 +2551,12 @@ config CMDLINE_FROM_BOOTLOADER
> > >  	  the boot loader doesn't provide any, the default kernel command
> > >  	  string provided in CMDLINE will be used.
> > >  
> > > +config CMDLINE_EXTEND
> > > +	bool "Extend bootloader kernel arguments"
> > > +	help
> > > +	  The command-line arguments provided by the boot loader will be
> > > +	  appended to the default kernel command string.
> > 
> > We previously reverted this in cae118b6acc3 ("arm64: Drop support for
> > CMDLINE_EXTEND") and I think that reasoning still applies. The thing
> > that _has_ changed since then, is that I think bootconfig now has some
> > support for early params, so that's really what people should be using
> > here.
> 
> I didn't know about bootconfig, that looks like exactly what I need, thanks!

Great! Just watch out for the early_param support. Historically,
bootconfig silently dropped early parameters, so it was quite limited in
what you could use it for. However, I think Breno and Masami have recently
fixed that but I'm not entirely sure. I wanted to attend the recent LPC
session about it, but I had a conflict and haven't had chance to dig up
the recording.

Will


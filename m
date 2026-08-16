Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAFCC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 09:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ym2E/ppYBKHdBhBtVf5gJtO8Hteq90HRIV+vNeMH5MY=; b=AP2Yjln5jM5O8i38NEfuMsqCj7
	dmB2hax7+4P3/zDhCXRP3t2zyErzp3AWwlUr80bh9JfPUjgzMB1ONcEKxZhn+t4iK21gm42gsO9G3
	iNvlpVTITCbJcPd67p21K3AKd296NtlQkUpbYitWXhk3B7Al5FND/G/wc+xPe8MAK1qyoBjcd9rOq
	SyJ4HxtImgqOVciDEgBPMapykBdscZxFuLlbv+bUOTQ7K/lv83GrGGdtDYFZPreS4ombmJsAoiPjg
	mwqKeHwrpwQ4q8WrJbiOC7Qswurm6T4oOgaS6Ws2uwRlO4kiFP8kQX7GfNH/yhEkc7NOaX9i9paEo
	Ok5zWxDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvXSa-00000004ciT-2VHK;
	Sun, 16 Aug 2026 09:47:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvXSZ-00000004ciN-35QR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 09:47:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C3DEF6001D;
	Sun, 16 Aug 2026 09:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186D31F000E9;
	Sun, 16 Aug 2026 09:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786873638;
	bh=ym2E/ppYBKHdBhBtVf5gJtO8Hteq90HRIV+vNeMH5MY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SKoLHWotb1sqq/pS02uVe0ycoTKDpLXzUlxyALTaKELFXdldswG1FYb7xBuR9KGf+
	 oEimTvzQPkRgqu8n0ZMLtHiJMFBSpjodDrX1iltopie2tSyULQEs1yjzs/kTMXUbyq
	 DI788NQGWkOsDOqgsYbGj52lLeRcnjDp5ZEUszhVZACxnVsR7zfX8Y76xPGg/59dEZ
	 YwUa4YoP/XhBy6KiV932Wk2yTGSHusm9mPyjtmNlcV05vmteufoM6iXgmS7WFSZ6On
	 2UnUYHsjtJmEMIWgLpXYe/kKYnL+Mmvgd7Au4a5mzHPiikY9Li6jqR9FrHGCFSFkyW
	 6tg5XrRG0NCEg==
Date: Sun, 16 Aug 2026 10:47:12 +0100
From: Will Deacon <will@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH 00/12] arm64: Remove unused big-endian support
Message-ID: <aoGHINU1DWOHXgYC@willie-the-truck>
References: <20260811140132.22778-1-will@kernel.org>
 <6632712f-7782-4580-84c0-62124a016f46@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6632712f-7782-4580-84c0-62124a016f46@app.fastmail.com>
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

Hi Arnd,

On Tue, Aug 11, 2026 at 05:11:47PM +0200, Arnd Bergmann wrote:
> On Tue, Aug 11, 2026, at 16:01, Will Deacon wrote:
> > Big-endian support on arm64 (CONFIG_CPU_BIG_ENDIAN) has depended on
> > BROKEN since 1cf89b6bf660 ("arm64: Kconfig: Make CPU_BIG_ENDIAN depend
> > on BROKEN") and has already seen some clean-up patches removing some of
> > the unused support code (e.g. 5276ea17a23c ("lib/crc: arm64: Assume a
> > little-endian kernel")).
> >
> > Finish the job, and remove the remaining big-endian support code from
> > arm64. Note that the SETEND emulation for 32-bit tasks remains and so
> > some of the mixed-endian EL0 helpers are retained.
> 
> I had not expected the removal to come this soon, but I'm not
> complaining about that. I assume you are planning this for 7.4,
> leaving 7.3-LTS to still have the code in case someone wants to
> still use it, right?

Yes, this is for 7.4.

> Not sure if you saw
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/arch/arm/mm/Kconfig?id=fe91e4e9da70765420538d9cbcf6d9a970237a8d
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/arch/arm/mach-ixp4xx/Kconfig?id=2262f02ac2aa545560a7f182c8e6b5c98e72763c
> 
> so for 7.3, we have marked big-endian mode in arm32 as deprecated
> as well, and also managed to get ixp4xx working again in little-endian
> mode, which was slightly broken for a few years. It may be good to
> add a reference to your series for context.

Thanks, I'll do that!

> My suggestions there was to possibly remove arm32 big-endian mode at
> the same time as on arm64, but that does feel a little rushed if
> ixp4xx only has one release of supporting both, and removing be8
> but leaving be32 for a little while longer is probably not worth it.

Yeah, maybe give it another LTS on the arm32 side? I think arm64 going
first is ok, though.

> > I've broken this down into fairly coarse chunks, as it seemed a lot
> > easier to manage than one giant patch (even with the Kconfig being
> > effectively disabled already) and not all of it is just mindless
> > deletion. Despite that, I'm anticipating the whole thing going via the
> > arm64 tree.
> 
> I would have done even larger patches, this does already feel fairly
> fine-grained to me ;-). I had a look at the individual patches to make
> sure this all makes sense, and I found nothing wrong here.

If it was just a sed script or similar, I think I'd would've done a giant
patch, but some of it is surprisingly error-prone (e.g. when you have a
file with a load of '#ifdef CPU_BIG_ENDIAN' and then an '#ifndef
CPU_BIG_ENDIAN' hiding in the middle of it all).

> For a 7.4 (or later) merge:
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> There are also a few arm64 specific drivers that I think no
> longer need a dependency, but none of that is important:

I think there might also be some logic in the SMMUv3 driver which could
go. Perhaps I'll add a driver patch on the end of the next version to
pick this up.

Cheers,

Will


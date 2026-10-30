Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC96606AA00
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 10:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bh6yNtp1;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=eK/PHqrz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IeD1te9JsbH+posWGpI0LErcMqbnAyvM7nGUHinnYH0=; b=Bh6yNtp1TnI95kb932lwBgNAEC
	aDe0gzq6iwLF1oiNVdkc2AXbtgxorDF7jCCrx3FV5zyvw/y4Fo92gFFeP79tDbGv8dhvaDTWp3Eil
	G5dRH03nnn3pfeOSbvekWcdddgtJEA6JjphlDAaSnono4rfp1iIgJib7LP3okoq5BXEmjg5BADNXK
	ljHsXlI2CsaYOriui+SFplzfLh/X0E6k8xlN/M95CzRRdCkpy+JYZVSLHCAJxQje5BYcKd1f4nj6V
	k2GyAHvcdFzqxKcxI1XQxSEpp3LCy3N8Ms/kXSC3G/3FOX1MJmRWf0q3hTzP9nua+OplM0NTcckfC
	xHxsKCcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMk7m-0000000BRBd-4Ayn;
	Fri, 30 Oct 2026 10:46:19 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMk7j-0000000BR5n-2Yyk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 10:46:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IeD1te9JsbH+posWGpI0LErcMqbnAyvM7nGUHinnYH0=; b=eK/PHqrzkjQgVhbCMJPf1MeeGP
	X60Lmy8PWAQRAbb17GHHu0O7T30Vq6rwR5XXwd1Hw3H/Ev8Op7HtK8y1ynZ7m3lVm2fmrkVQTIC/9
	91977gFeLDZez9UOidNBfxfTuDrGB70Q85lW4Ge/O3U03TFIDVImJhV5hZQBc3q26OvnDiHawlLvR
	iyNhQXRTl5RpFZDM2oUP3xGrvW0NKkv+XjLnhlEQ2NQb54WKEwyAaPcGaSCFp4Qv3TQbesi8v1Qky
	0M4T4JRXF74eoOgiFWdSSqQ0nkBR/t1815/UkL44k8CQroIqShI+yWe69duoTSa/xnDPoioJXGffw
	WxJeQRFQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xMk7b-003lNW-2O;
	Fri, 30 Oct 2026 10:46:07 +0000
Date: Fri, 30 Oct 2026 03:46:03 -0700
From: Breno Leitao <leitao@debian.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kas@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] arm64: Kconfig: Don't select CPUMASK_OFFSTACK with 64K
 pages
Message-ID: <auR0kSCYyo31Inxf@gmail.com>
References: <20261007-arm_stack-v1-1-b48dad5fa8b2@debian.org>
 <auCSG2OmNMQKp3dq@gmail.com>
 <auRxNDAe_tv-mCvk@willie-the-truck>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auRxNDAe_tv-mCvk@willie-the-truck>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_034615_665009_BD4EB7C3 
X-CRM114-Status: GOOD (  25.51  )
X-Spam-Score: -4.4 (----)
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

Hello Will,

On Fri, Oct 30, 2026 at 10:28:04AM +0000, Will Deacon wrote:
> On Tue, Oct 27, 2026 at 04:59:52AM -0700, Breno Leitao wrote:
> > On Wed, Oct 07, 2026 at 12:58:16AM -0700, Breno Leitao wrote:
> > > arm64 selects CPUMASK_OFFSTACK when NR_CPUS is above 256, which keeps
> > > cpumask_var_t off the kernel stack. With 64K pages the kernel stack is
> > > 64K as well, we have enough room to keep cpumask on the stack, avoiding
> > > extra alocation and possible performance penalties.
> > > 
> > > Skip the select when ARM64_64K_PAGES is set. A 64K kernel can then raise
> > > NR_CPUS above 256 and keep cpumask_var_t as an inline array. 4K and 16K
> > > page kernels are unchanged.
> > > 
> > > Signed-off-by: Breno Leitao <leitao@debian.org>
> > > ---
> > > Based on Will presentation at LPC, I've decided to have a look at Meta's
> > > stack usage, and I found that this might be an small optimization!?
> > > ---
> > >  arch/arm64/Kconfig | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > > index 5f2db2cecf9772..b73371327d2a47 100644
> > > --- a/arch/arm64/Kconfig
> > > +++ b/arch/arm64/Kconfig
> > > @@ -111,7 +111,7 @@ config ARM64
> > >  	select CLONE_BACKWARDS
> > >  	select COMMON_CLK
> > >  	select CPU_PM if (SUSPEND || CPU_IDLE)
> > > -	select CPUMASK_OFFSTACK if NR_CPUS > 256
> > > +	select CPUMASK_OFFSTACK if NR_CPUS > 256 && !ARM64_64K_PAGES
> > 
> > Does this one sound sane?
> 
> It doesn't make an awful lot of sense to me, to be honest. The page size
> and the number of CPUs are two independent variables, so tying them
> together like this looks a little odd.

Sure, but with 64K pages the kernel stack is _huge_. Why do we still
need to keep the cpumask off the stack frame in that case?


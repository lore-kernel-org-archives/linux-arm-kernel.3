Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B30C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 12:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oKJtXROx3fu4lTSaimhGhm2MQBtEFEroGU9PzY9IvkY=; b=3C7IWTpaPXiQrbMDQGhVN3BF6P
	CiGbwO2eeix80J3xK/0eYHPXwUe884c3PnBfeMXg7/kxxwzOyRyIwTioVCKDschcOD4JZObyH7Z7K
	x6lRc/BQ79SdgVPL3Mrn8hVEDY3brdkKmvvLddJlLnvAsSaGlu2d4S9iQSXCwj3051hX2A58mu6pe
	entZb9H9jd/JFByP8tie8+xv+6QqhzhbdmpkM8KiGRUjveDbDgZLbWBe4S/mNLn4OIUApHBbhT+L3
	LjWUGId7XZPCoit4w8cdkQiznbzgGC7dIJYTU5uYp1wZnJw4RgzpsYB1Qj31XM4KOsp9mdjKmqEV3
	+6QsEI3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogl3-00000005DWZ-0sTX;
	Tue, 28 Jul 2026 12:18:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogl1-00000005DW8-3r7s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 12:18:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ED7F860A9E;
	Tue, 28 Jul 2026 12:18:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 445001F000E9;
	Tue, 28 Jul 2026 12:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785241082;
	bh=oKJtXROx3fu4lTSaimhGhm2MQBtEFEroGU9PzY9IvkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fPFTresp55rinYb2SQTzm53LiKWqICzRPjr6COkBGaVoYzGpWll9D7htcrmVSqUjz
	 zdJLjUncSOwK4O28nm3ZqrbqihTBAqxU/C2HpzZ57juOCHQ90HCA5uQSXJiLuYvBOG
	 7lLZVXc20ocZKQHVcq9Pv041QmxWZLaQgUpiJQMpfXSkWncNomV/In3cYqZk/8zdgZ
	 0MOp5budlZ8FR/wXUVjiEhDo29rGwU2+Sfn8qlERSWSuWia7mSPxm360JjC3iPxjpK
	 V7Lrl4z5USbz6dgc/dBltmnkLb9/5Omk8RBWMJm2FhPQzLlLFwriU7QIQycRW8obcc
	 9KTwtVPb8X0lg==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 65659F40067;
	Tue, 28 Jul 2026 08:18:01 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 28 Jul 2026 08:18:01 -0400
X-ME-Sender: <xms:-Z1oau8VeVoxtSWkmOuLEk7JFloulL56gZC6PZaTUCTRbnFaqi2d9g>
    <xme:-Z1oah0Tu5wi2xp8DzNWFIV-HVRStgZAb3s51p8IZNv82uQlmaBtTgM_kOd6QuFsl
    kIHJCu-_OPSZjAcWEqRs4nbD1xlnZPyrMbwy7gBjH8gQPH8RCGHWwk>
X-ME-Received: <xmr:-Z1oahfDz7f7U8T2i8_mGr-ih8r9sHGpT0hp90xfBytuCOxFIUq1BVAWu9ckBQ>
X-ME-Proxy-Cause: dmFkZTFFd/nsSnqpSmQvzVxqvwzHWaSzKqPBbSvvQe7BvijMIlW7Pibm8W9snxtWuenbkt
    fXmF38BS7EzslH6KJfUsM5EsKiDwKkfK9LX560qLV+E5CypcBmXp8ZhqGdXBiy9AK/Nk5a
    Km53mPal4MiglBzFuJJBeZacqbq4M1BVvYzp/KlJpSmrUFiYxDquDLb+pDoL1jpVOzFdzG
    Tt4GOD0485OJnG3Vzi1H4fIFGkBR6l6HZ7FwXT4qfe0bJfxtd00jNBr9CdZK1omiTiaY38
    KLpK78XWtlutDCsD8njPO6jGlTCbvlBoEqNaumlpluVdJmDs2O1Fs0xsHwZbwS+kdDKCMn
    N5DClSzaNkylNrXDuQnVOhGRc0kBudga5SiQpTzo2r1j6qrkdlPmRwa5U1koT7ynO+Q5ie
    WMyBWi3SS5QeiGYSp2HqSJhkVFdZpVeOKagI4OpM12pEbfJSrdGH33wT3nN1xJnPv/tt+M
    2AbLgDGtX4g0gSQZc6mLuctzPmR2Mz5LiWwMxMYUOIm1T9cxyOVXvug5ARK9y2Pu+HqRbV
    D7O3+T7XCn7wFSVFCpffYMGuXPxKyDUFmaD28jnb6qzqXy+7DvUtIGQJiRaC9/tJ+G5UsK
    C5gIK0cBZmVHnGKxl1z7XuiQXpJ/3hvHfLiQP6+d2VjE/693ZZhOz4odp8wg
X-ME-Proxy: <xmx:-Z1oarA5E8cVDsr48hLcfRa7-_nr8ZzsEx6g9b_VAywPNVZHPANJBw>
    <xmx:-Z1oah3eIBLyfn3i1rEuDsaQUJ-hmYthgcnvrHnRNTnAAvlUSpKc2Q>
    <xmx:-Z1oauOD0yWuD9YR2GBL3BibXzra6dM_Z3oz3yuehlFB2ra97vd6jg>
    <xmx:-Z1oaobLAl2kAEO4g9UU-Yz4t9SRiYOzKddP7QpreacmALAnVog8TQ>
    <xmx:-Z1oao2hK8GsSxB9Lg-hSbRe8sDblDyZXzQrporYUh3vZC5d8zJA5sgQ>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Jul 2026 08:18:00 -0400 (EDT)
Date: Tue, 28 Jul 2026 13:17:59 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	James Morse <james.morse@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Doug Anderson <dianders@chromium.org>, 
	Petr Mladek <pmladek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Usama Arif <usama.arif@linux.dev>, 
	Breno Leitao <leitao@debian.org>, Julien Thierry <julien.thierry.kdev@gmail.com>, 
	Lecopzer Chen <lecopzer@gmail.com>, Sumit Garg <sumit.garg@kernel.org>, kernel-team@meta.com, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/4] arm64: cross-CPU NMI via SDEI
Message-ID: <amiayYZA2kBSTzFB@thinkstation>
References: <cover.1782744912.git.kas@kernel.org>
 <ak_IRHwd02EjWMf8@thinkstation>
 <amYR5VWHWC1WdFXc@willie-the-truck>
 <amZRtS2Lu1epc0S4@thinkstation>
 <amiDoZdszC1pB6Z2@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amiDoZdszC1pB6Z2@willie-the-truck>
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

On Tue, Jul 28, 2026 at 11:25:37AM +0100, Will Deacon wrote:
> > FEAT_NMI is the endgame and a machine that has it needs none of this,
> > but non-FEAT_NMI parts stay in fleets for many years, so I can't
> > honestly give you a date for dropping SDEI.
> 
> That's fair, I was really just trying to understand the direction. It
> sounds like you will *eventually* move to FEAT_NMI, even if it's many
> years away.

Right, that's the plan.

> > While this change is pretty self-contained, I understand that SDEI infra
> > maintenance can be a burden.
> > 
> > Is there anything on the wider SDEI infrastructure that would lower the
> > maintenance burden or keep it more out of your way -- consolidation,
> > tighter isolation, docs, help carrying it? If there's work there that
> > makes SDEI more palatable to keep while non-FEAT_NMI parts are in
> > service, I'm glad to take it on.
> 
> I'm somewhat trying to predict the future here, but I wouldn't be
> shocked if some whizz-bang new architecture feature interacted badly
> with SDEI, either due to outdated specs or because of a fundamental
> incompatability. In this case, I would like the option of being able to
> make new hardware support mutually exclusive with SDEI rather than try
> to hack around the mess. It sounds like that would be ok for you?

Yes, that's fine by me.

I'd prefer that exclusivity at boot rather than compile time, so we can
keep a single kernel binary across the fleet. The delivery side
already works this way -- the arch selects one cross-CPU-NMI provider, so
it's a boot-time decision already.

The piece that isn't boot-time yet is the hardlockup detector that drives
all this. perf and buddy are mutually exclusive at compile time. We want
to use perf watchdog for FEAT_NMI while SDEI needs buddy.

But it is solvable.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov


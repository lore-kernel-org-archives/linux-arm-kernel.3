Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8226FC9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 14:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xXsyG1nJZcjvmXOLppTmlV6HL6GNJEk1tug38gOX6l0=; b=rDkfaFAFfWcnknVZO+QNhkPMUE
	x5cNmgVyz2+SmOK+jBmY+c41kaA2dbrd5VW0F1ZnubF6sjM19u9VPvZiF4JYiWHtC+0syLrU6RZPo
	eULYpcv7lbYP5m2Y3kYQtRzxt8i1oRQdESmcdj3+PLEsz6O3AyMld8UVTtqyJ2kRope1Eer/jmKFU
	tYuy0bHgQ0aAYfgpiYWni1zckkgTtFtPPD7PSWcN6tZIwadITddDkDinVOkO5xCfGhQxCcqW8IK3q
	LYIeOj2pTLbsrVCv4rxsc4GY2m9yh8Z+pCQ1l0UP8OGd+Au3BFi6cpOvaLoczRwhOmAVH5hMoPoOV
	uYQIXseA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYvS-00000003nrK-0q1g;
	Tue, 29 Sep 2026 14:35:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBYvR-00000003nqx-0r2o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 14:35:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D7EF4410A8;
	Tue, 29 Sep 2026 14:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A5C1F000FF;
	Tue, 29 Sep 2026 14:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790692520;
	bh=xXsyG1nJZcjvmXOLppTmlV6HL6GNJEk1tug38gOX6l0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IjUdSti5PbGtpxTH9nZfpeWsbi0bAFEBEQgVElcuOKCzN/zvZsmvUgJnM3NZTIrRg
	 jamQRDL4Fe/VVJ9P+xNWfOHSSnFU/6jmptwUAdy5KFKjsjofxgATg6Y1INB59K1ybn
	 OjPd5zkLzYCyEETvR8VmutueNwMipWkvSozbzc/x6e62Tak2Roh7MIHekVrEw7LWVT
	 4qIw5AzDUpDcX0/5pGM6av4aj62QuRCCoe+62hiIn5nyUY91XGRCzdj5LRZf0j+Kdq
	 LKX/5DyBFT5UquYEqIibMnIMbnwYwX4vtKkHKmFAW91Ui21mjMgQS+M3wM+xhXYH5M
	 veB8hha56G79g==
Date: Tue, 29 Sep 2026 15:35:16 +0100
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ben Horgan <ben.horgan@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v3 7/8] clocksource/drivers/arm_arch_timer: Expose a
 direct accessor for the virtual counter
Message-ID: <arvMpP8Htq3dKu99@willie-the-truck>
References: <20260802165327.385217-1-maz@kernel.org>
 <20260802165327.385217-8-maz@kernel.org>
 <aru1QvpaQ8A-OnQq@willie-the-truck>
 <868q4k3zds.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <868q4k3zds.wl-maz@kernel.org>
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

On Tue, Sep 29, 2026 at 03:28:47PM +0100, Marc Zyngier wrote:
> On Tue, 29 Sep 2026 13:55:30 +0100,
> Will Deacon <will@kernel.org> wrote:
> > 
> > On Sun, Aug 02, 2026 at 05:53:26PM +0100, Marc Zyngier wrote:
> > > We allow access to the architected counter via arch_timer_read_counter().
> > > However, this accessor can either be the virtual or the physical
> > > view of the counter, depending on how the kernel has been booted.
> > > 
> > > At the same time, we have some architectural features (such as WFIT,
> > > WFET) that rely on the virtual counter, and nothing else.
> > > 
> > > If implementations were perfect, we'd rely on reading CNTVCT_EL0,
> > > and be done with it. However, we have a bunch of broken implementations
> > > in the wild, which rely on preemption being disabled and other
> > > costly workarounds.
> > > 
> > > In order to provide decent performance on non-broken HW while still
> > > supporting the legacy horrors, expose arch_timer_read_vcounter() as
> > > a new helper that hides this complexity. Obviously, this is simply
> > > a global alias of arch_counter_get_cntvct().
> > > 
> > > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > > ---
> > >  drivers/clocksource/arm_arch_timer.c | 2 ++
> > >  include/clocksource/arm_arch_timer.h | 1 +
> > >  2 files changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
> > > index b3b31d4f4815f..9c7501ce57073 100644
> > > --- a/drivers/clocksource/arm_arch_timer.c
> > > +++ b/drivers/clocksource/arm_arch_timer.c
> > > @@ -128,6 +128,8 @@ static notrace u64 arch_counter_get_cntvct(void)
> > >  	return __arch_counter_get_cntvct();
> > >  }
> > >  
> > > +u64 arch_timer_read_vcounter(void) __attribute__((alias("arch_counter_get_cntvct")));
> > 
> > nit: compiler-attributes.h provides __alias to make this a tiny bit cleaner.
> > 
> > That said, why did you decide on the alias rather than just having this
> > as a wrapper function?
> 
> No idea. Laziness, probably.
> 
> But I've paged most of this stuff out, and I'm not sure it even serves
> a purpose, given that we've lived for about a decade with the problem
> it tries to solve.
> 
> Consider it an abandoned series.

Ok, but patch one is probably worth taking to fix the PMU issue, no?

Will


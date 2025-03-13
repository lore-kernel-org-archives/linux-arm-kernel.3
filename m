Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA098C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 19:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HiHcfO46YFy+G7rNegmU0HN6KM+mOtmwJso74ubWtrM=; b=xQuJWhvKSCZghT7GC1pFOApjdJ
	O8aQ3QtTaRMqiXOxgqDkas9Bm3szyZrUo8IRkgiIz96kidtKue1vIDgJp13nXIj3bHpsq3A/x3tdT
	428ObvEf5IP5Uy3QxGkBOc4drliZ9OB4RWXri37TsswhydzvJphhR1KjY6/4DKK1nyG5Y0NRuBFhv
	uRBuzCA3uGxxl7rZ01zKkDJWJZM97E44CV4aT4r0EeKXqh/OdFYBsPdrokEQ2LfxDZMeRZF2udWIm
	PKultNel367pS88Rf3AtausMyxekQ1RgS8SpVz1D0ApRoWkmqITv9sTz3Z1vL0qgDgepLjJJGin3r
	22kxvjKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsnzB-0000000CIA3-48zE;
	Thu, 13 Mar 2025 19:12:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsnxW-0000000CHwV-1QSW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 19:11:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5549EA48703
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 19:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78A9BC4CEF0
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 19:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741893068;
	bh=Lr25EZkqxsPL3BB3IHuJEFZ8TJ1hBBK49jrHSJx6Gj4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oevAoY3+/xB5VOwPK/1aY6R2CgtAQVmg9qw2dUTMnNz4qVSiKJDy3ZHfRR16qT+/4
	 dVYWCd79CPNwrCz8OQQcQhFRgmsj7YValC4LccajI/xIBupibEPUCGGpLxvczxx4+4
	 FvhaJtKiq/oheQW7uf3JuDTOuTB6lrG+rlxQUHQOHVSUrITYB/SUgcOlnOABelmx5D
	 n3s/daUujbgufdPlIJjDZbu245wCFv368RoC+7bwyNecYdHdq273StjobJAbCMlBSz
	 L++PFLlZ5Swc248DwDwTjIPwxurGSgFPlwmmRoCpRyiS7+PVPn2iWYaK9u8rBTzTKO
	 b1Lxnk6yR14NQ==
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3d439dc0548so4765775ab.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Mar 2025 12:11:08 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw5xbMKgkobo7L4Z5vaWUCGVM/z0Bz+/spewCnkejjH3wFXJZR3
	wGSHy4OzTFWrefSBW4NzxHaMLcQp2l0bWgVsF2twoLbEjtH3MZbs4SNrS4UfEscpnn61ef2tRSZ
	eKMkw+Fu7BcrswyXUxpy+BmEVrbY=
X-Google-Smtp-Source: AGHT+IGNaR9f/JVYBzHMMBNK+4GBcPFS332kc+pm3ldB4zFS8Anllv7AuVgokgN6kmTde5EZ5Ep8F2WKYTV04VfIU5M=
X-Received: by 2002:a05:6e02:144b:b0:3d4:276:9a1b with SMTP id
 e9e14a558f8ab-3d481783128mr10476285ab.16.1741893067798; Thu, 13 Mar 2025
 12:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250308012742.3208215-1-song@kernel.org> <20250308012742.3208215-2-song@kernel.org>
 <20250313-angelic-coral-giraffe-dfa4f3@leitao>
In-Reply-To: <20250313-angelic-coral-giraffe-dfa4f3@leitao>
From: Song Liu <song@kernel.org>
Date: Thu, 13 Mar 2025 12:10:56 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4QjDx1_2xXVjPzy2HueR+ZGb-q=zsn4S-TYSp38Tp-Zg@mail.gmail.com>
X-Gm-Features: AQ5f1JoREMu_L4nvl7y97uDhMFDyg_nK0nvfqGckRS9rsJPlVC_Jg1pGhtp1-gQ
Message-ID: <CAPhsuW4QjDx1_2xXVjPzy2HueR+ZGb-q=zsn4S-TYSp38Tp-Zg@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: Implement arch_stack_walk_reliable
To: Breno Leitao <leitao@debian.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org, 
	indu.bhagat@oracle.com, puranjay@kernel.org, wnliu@google.com, 
	irogers@google.com, joe.lawrence@redhat.com, jpoimboe@kernel.org, 
	mark.rutland@arm.com, peterz@infradead.org, roman.gushchin@linux.dev, 
	rostedt@goodmis.org, will@kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_121110_512045_6E753B97 
X-CRM114-Status: GOOD (  21.16  )
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

On Thu, Mar 13, 2025 at 11:12=E2=80=AFAM Breno Leitao <leitao@debian.org> w=
rote:
>
> On Fri, Mar 07, 2025 at 05:27:41PM -0800, Song Liu wrote:
> > With proper exception boundary detection, it is possible to implment
> > arch_stack_walk_reliable without sframe.
> >
> > Note that, arch_stack_walk_reliable does not guarantee getting reliable
> > stack in all scenarios. Instead, it can reliably detect when the stack
> > trace is not reliable, which is enough to provide reliable livepatching=
.
> >
> > This version has been inspired by Weinan Liu's patch [1].
> >
> > [1] https://lore.kernel.org/live-patching/20250127213310.2496133-7-wnli=
u@google.com/
> > Signed-off-by: Song Liu <song@kernel.org>
>
> Tested-by: Breno Leitao <leitao@debian.org>

Thanks for the testing!

>
> >  arch/arm64/Kconfig                         |  2 +-
> >  arch/arm64/include/asm/stacktrace/common.h |  1 +
> >  arch/arm64/kernel/stacktrace.c             | 44 +++++++++++++++++++++-
> >  3 files changed, 45 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index 940343beb3d4..ed4f7bf4a879 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -275,6 +275,7 @@ config ARM64
> >       select HAVE_SOFTIRQ_ON_OWN_STACK
> >       select USER_STACKTRACE_SUPPORT
> >       select VDSO_GETRANDOM
> > +     select HAVE_RELIABLE_STACKTRACE
>
> Can we really mark this is reliable stacktrace?  I am wondering
> if we need an intermediate state (potentially reliable stacktrace?)
> until we have a fully reliable stack unwinder.

AFAICT, we do not expect arch_stack_walk_reliable() to always
return a reliable stack. Instead, it is expected to return -EINVAL if
the stack trace is not reliable. OTOH, arch_stack_walk() doesn't
warn the caller when the stack trace is not reliable. This is exactly
what we need for live patch: we just need to make the patch
transition when the stack trace is reliable and none of the functions
in the stack is being patched. If the stack trace is not reliable, we
will retry the transition at a later time.

Thanks,
Song


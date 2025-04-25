Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7BCC369D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 15:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tK9StlpDYAp08qW4tTKOct1Yb3+IgiVio9GxX2VqMMU=; b=1YeJ1N9XLABaIUAklN53OqLTAO
	ZtXH5K+vN2pnd0FRe0axZAI5gEp0/7xzvxbWu9jogAPHBQpcsEX4v5eG+99WWMh7GHxfgJJ6MMkQw
	mnc3JPhnck70RhbwYe2YHa6yCRHpTHmGvVhJnLkpgJKU2UY1o8P/xNzegnf/mWqHj8Pz7QDUwUCAw
	M5hnRWLs36D72wDAHeix0p3BXjvw6EErDo5QhSwemfLXEaQlhOYlILOPBbaGKaF94mgI6zJb1ZNHd
	qiId9u0nV/0y6FZk57btu4kBzvLIqDy1YqOEzR3dX6kbN2YotJrHz60X8dt4hbVIZWhkEPsRH9rM7
	KnfrEw3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Kze-000000002r6-1MRD;
	Fri, 25 Apr 2025 15:29:34 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8JIa-0000000HK2D-0j9P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 13:41:02 +0000
Date: Fri, 25 Apr 2025 15:40:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745588457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tK9StlpDYAp08qW4tTKOct1Yb3+IgiVio9GxX2VqMMU=;
	b=n0BXU4AQVKORmqE6oDe8REQpn+OId76jh34c1y2J85KvGy+0JgyXnbnNA8dbK/1Kwa1CDT
	sbSEqwIvqW01LXg14hRV9fDwZ9Qts+4Qrjb7rGVqTvuvwk5tDmmtUyX7J4lnswSZNo4Pu8
	4zE1j6HQwy0xBMNI2MOy/HYt9fUoDkrgGOvOnkfhkG58+KWqFQfOw9zNXKqBs39vUYfj1G
	lRi3Kx+/aao3QyztH/HJpZsokym+ja3sX00jZx9jMe+jv+SBTkSLJKptf2yW5Anlw39F6T
	i5mnW6JC1P9uZ4KNk5cUtfjfkmtXxfaHU1SyFcMZsEzlpGIzILof42ezhR64vg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745588457;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tK9StlpDYAp08qW4tTKOct1Yb3+IgiVio9GxX2VqMMU=;
	b=aumYIEdWhsA7beLGGtF+wZHthOSDwSHnVvccyzZ/yEYbkfNRCWQ9tbLDcmD1BpTu09y/1v
	hGbzB7rnw72Yb4Dg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Jan Stancek <jstancek@redhat.com>
Cc: Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH 08/19] vdso/gettimeofday: Prepare do_hres_timens() for
 introduction of struct vdso_clock
Message-ID: <20250425152733-0ff10421-b716-4a55-9b60-cb0a71769e56@linutronix.de>
References: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
 <20250303-vdso-clock-v1-8-c1b5c69a166f@linutronix.de>
 <aApGPAoctq_eoE2g@t14ultra>
 <20250424173908-ffca1ea2-e292-4df3-9391-24bfdaab33e7@linutronix.de>
 <CAASaF6xsMOWkhPrzKQWNz5SXaROSpxzFVBz+MOA-MNiEBty7gQ@mail.gmail.com>
 <20250425104552-07539a73-8f56-44d2-97a2-e224c567a2fc@linutronix.de>
 <CAASaF6yxThX3HTHgY_AGqNr7LJ-erdG09WV5-HyfN1fYN9pStQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAASaF6yxThX3HTHgY_AGqNr7LJ-erdG09WV5-HyfN1fYN9pStQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_064100_489592_1B0AD406 
X-CRM114-Status: GOOD (  50.00  )
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

On Fri, Apr 25, 2025 at 12:03:14PM +0200, Jan Stancek wrote:
> On Fri, Apr 25, 2025 at 10:58 AM Thomas Weißschuh
> <thomas.weissschuh@linutronix.de> wrote:
> >
> > On Thu, Apr 24, 2025 at 11:57:02PM +0200, Jan Stancek wrote:
> > > On Thu, Apr 24, 2025 at 5:49 PM Thomas Weißschuh
> > > <thomas.weissschuh@linutronix.de> wrote:
> > > >
> > > > On Thu, Apr 24, 2025 at 04:10:04PM +0200, Jan Stancek wrote:
> > > > > On Mon, Mar 03, 2025 at 12:11:10PM +0100, Thomas Weißschuh wrote:
> > > > > > From: Anna-Maria Behnsen <anna-maria@linutronix.de>
> > > > > >
> > > > > > To support multiple PTP clocks, the VDSO data structure needs to be
> > > > > > reworked. All clock specific data will end up in struct vdso_clock and in
> > > > > > struct vdso_time_data there will be array of it. By now, vdso_clock is
> > > > > > simply a define which maps vdso_clock to vdso_time_data.
> > > > > >
> > > > > > Prepare for the rework of these structures by adding struct vdso_clock
> > > > > > pointer argument to do_hres_timens(), and replace the struct vdso_time_data
> > > > > > pointer with the new pointer arugment whenever applicable.
> > > > > >
> > > > > > No functional change.
> > > > > >
> > > > > > Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
> > > > > > Signed-off-by: Nam Cao <namcao@linutronix.de>
> > > > > > Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> > > > > > ---
> > > > > > lib/vdso/gettimeofday.c | 35 ++++++++++++++++++-----------------
> > > > > > 1 file changed, 18 insertions(+), 17 deletions(-)
> > > > > >
> > > > >
> > > > > starting with this patch, I'm seeing user-space crashes when using clock_gettime():
> > > > >   BAD  -> 83a2a6b8cfc5 vdso/gettimeofday: Prepare do_hres_timens() for introduction of struct vdso_clock
> > > > >   GOOD -> 64c3613ce31a vdso/gettimeofday: Prepare do_hres() for introduction of struct vdso_clock
> > > > >
> > > > > It appears to be unique to aarch64 with 64k pages, and can be reproduced with
> > > > > LTP clock_gettime03 [1]:
> > > > >   command: clock_gettime03   tst_kconfig.c:88: TINFO: Parsing kernel config '/lib/modules/6.15.0-0.rc3.20250423gitbc3372351d0c.30.eln147.aarch64+64k/build/.config'
> > > > >   tst_test.c:1903: TINFO: LTP version: 20250130-231-gd02c2aea3
> > > > >   tst_test.c:1907: TINFO: Tested kernel: 6.15.0-0.rc3.20250423gitbc3372351d0c.30.eln147.aarch64+64k #1 SMP PREEMPT_DYNAMIC Wed Apr 23 23:23:54 UTC 2025 aarch64
> > > > >   tst_kconfig.c:88: TINFO: Parsing kernel config '/lib/modules/6.15.0-0.rc3.20250423gitbc3372351d0c.30.eln147.aarch64+64k/build/.config'
> > > > >   tst_test.c:1720: TINFO: Overall timeout per run is 0h 05m 24s
> > > > >   clock_gettime03.c:121: TINFO: Testing variant: vDSO or syscall with libc spec
> > > > >   clock_gettime03.c:76: TPASS: Offset (CLOCK_MONOTONIC) is correct 10000ms
> > > > >   clock_gettime03.c:86: TPASS: Offset (CLOCK_MONOTONIC) is correct 0ms
> > > > >   clock_gettime03.c:76: TPASS: Offset (CLOCK_BOOTTIME) is correct 10000ms
> > > > >   clock_gettime03.c:86: TPASS: Offset (CLOCK_BOOTTIME) is correct 0ms
> > > > >   clock_gettime03.c:76: TPASS: Offset (CLOCK_MONOTONIC) is correct -10000ms
> > > > >   clock_gettime03.c:86: TPASS: Offset (CLOCK_MONOTONIC) is correct 0ms
> > > > >   clock_gettime03.c:76: TPASS: Offset (CLOCK_BOOTTIME) is correct -10000ms
> > > > >   clock_gettime03.c:86: TPASS: Offset (CLOCK_BOOTTIME) is correct 0ms
> > > > >   tst_test.c:438: TBROK: Child (233649) killed by signal SIGSEGV
> > > > >
> > > > > or with:
> > > > > --------------------- 8< ----------------------
> > > > > #define _GNU_SOURCE
> > > > > #include <sched.h>
> > > > > #include <time.h>
> > > > > #include <unistd.h>                                                                                                                                                                                                                          #include <sys/wait.h>
> > > > >
> > > > > int main(void)
> > > > > {
> > > > >         struct timespec tp;
> > > > >         pid_t child;
> > > > >         int status;
> > > > >
> > > > >         unshare(CLONE_NEWTIME);
> > > > >
> > > > >         child = fork();
> > > > >         if (child == 0) {
> > > > >                 clock_gettime(CLOCK_MONOTONIC_RAW, &tp);
> > > > >         }
> > > > >
> > > > >         wait(&status);
> > > > >         return status;
> > > > > }
> > > > >
> > > > > # ./a.out ; echo $?
> > > > > 139
> > > > > --------------------- >8 ----------------------
> > > > >
> > > > > RPMs and configs can be found at Fedora koji, latest build is at [2] (look for kernel-64k).
> > > >
> > > > Hi Jan,
> > > >
> > > > Thanks for the great error report.
> > > >
> > > > Can you try the following change (on top of v6.15-rc1, should also work with current master)?
> > > >
> > > > diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
> > > > index 93ef801a97ef..867ce53cca94 100644
> > > > --- a/lib/vdso/gettimeofday.c
> > > > +++ b/lib/vdso/gettimeofday.c
> > > > @@ -85,14 +85,18 @@ static __always_inline
> > > >  int do_hres_timens(const struct vdso_time_data *vdns, const struct vdso_clock *vcns,
> > > >                    clockid_t clk, struct __kernel_timespec *ts)
> > > >  {
> > > > -       const struct vdso_time_data *vd = __arch_get_vdso_u_timens_data(vdns);
> > > >         const struct timens_offset *offs = &vcns->offset[clk];
> > > > -       const struct vdso_clock *vc = vd->clock_data;
> > > > +       const struct vdso_time_data *vd;
> > > > +       const struct vdso_clock *vc;
> > > >         const struct vdso_timestamp *vdso_ts;
> > > >         u64 cycles, ns;
> > > >         u32 seq;
> > > >         s64 sec;
> > > >
> > > > +       vd = vdns - (clk == CLOCK_MONOTONIC_RAW ? CS_RAW : CS_HRES_COARSE);
> > > > +       vd = __arch_get_vdso_u_timens_data(vd);
> > > > +       vc = vd->clock_data;
> > > > +
> > > >         if (clk != CLOCK_MONOTONIC_RAW)
> > > >                 vc = &vc[CS_HRES_COARSE];
> > > >         else
> > > >
> > > >
> > > > I'll do some proper testing tomorrow.
> > >
> > > That does seem to work for the 2 reproducers I have.
> >
> > Thanks for testing.
> >
> > > But why is this change needed?
> >
> > So far the only thing that I can say is that this logic was there before the
> > patch and was removed accidentally, so it should be restored.
> > Why the logic was there in the first place I'll have to investigate.
> 
> I think it paired with "vd advancing" based on "clock" in original code:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/lib/vdso/gettimeofday.c?h=v6.14#n264
> and to get back to "base", you needed to subtract same value:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/lib/vdso/gettimeofday.c?h=v6.14#n82
> 
> After this series, "vd" isn't manipulated this way, so the removal of
> that subtraction seemed deliberate to me.

Indeed. This change "works" because vsdo_clocksource_ok() rejects the clock and
instead falls backs to the syscall.

> > > Isn't 'vdns' here equal to 'vdso_u_time_data'?
> >
> > That is true, but in a time namespace the namespaced time structure is mapped
> > in place of the normal structure and vice-versa.
> > So __arch_get_vdso_u_timens_data() will get the "real" time datastructure based
> > on a namespaced one.
> >
> > I can't explain the special logic for CLOCK_MONOTONIC_RAW yet.
> > To me it looks wrong to calculate on a 'struct vdso_time_data *' in terms of
> > CS_RAW/CS_HRES_COARSE.
> >
> >
> > Another change that "fixes" the crash for me is:
> >
> > diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
> > index 93ef801a97ef..cdc3988a0ace 100644
> > --- a/lib/vdso/gettimeofday.c
> > +++ b/lib/vdso/gettimeofday.c
> > @@ -93,6 +118,8 @@ int do_hres_timens(const struct vdso_time_data *vdns, const struct vdso_clock *v
> >         u32 seq;
> >         s64 sec;
> >
> > +       OPTIMIZER_HIDE_VAR(vc);
> > +
> >         if (clk != CLOCK_MONOTONIC_RAW)
> >                 vc = &vc[CS_HRES_COARSE];
> >         else
> >
> >
> > This is obviously not an actual fix but indicates that something weird is going on.
> > Could you run this second change also through LTP to see if it would pass?
> 
> Agreed, this does "fixes" it for me as well.

Some more information:

The crash comes from the address arithmetic in "vc = &vc[CS_RAW]" going wrong.
This should just do "vc = vc + 1", advancing the pointer by sizeof(*vc).
But I get these example values of "vc" before and after the arithmetic:
0x00ffffbc060000 -> 0xfffffffffffd00e8
Which is obviously wrong.

The arithmetic can be fixed with any one of the following changes:
* OPTIMIZER_HIDE_VAR() as above
* Replacement of -mcmodel=tiny with -mcmode=small in arch/arm64/kernel/vdso/Makefile
  -mcmodel=tiny is supposed to cover 1MiB programs, the vDSO only needs 300KiB here
* Removal of the (clk != CLOCK_MONOTONIC_RAW) case

Shuffling code around, even without any impact on semantics, sometimes fixes
the issue. Compiling the vDSO with UBSAN didn't show anything.


Thomas

> > > > > [1] https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/clock_gettime/clock_gettime03.c
> > > > > [2] https://koji.fedoraproject.org/koji/buildinfo?buildID=2704401
> > > >
> >
> 


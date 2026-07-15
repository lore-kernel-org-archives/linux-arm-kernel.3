Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 568F2C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 07:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=siLOJ/PzH1Z/CI0gJ9d2mUYbY29fqJhH0h9UiXoFxCM=; b=hcSJ3mzjAQX99iNkn5hRpWRUcW
	v4ZmsAq1i0VTZZgTHm75/S88FXUs+kEjHzWF1RcQc746W4ca4AQcn3D8hHDHLzXS+G2VVy42K2kGG
	+YEiaQQE7ccqtyXTkGxWpJ6WhiRBzwzemjEDerErdz6BLsU2bk4DwOrac+i7wiotxlj2HspuUHpkZ
	CDJ2nqWSvHtSvpKFF8LmRiL8SrGcV0LTg5g1pLFVV6sCRo6zSY6y4oc5RaL/wjj4ojqfd8NLa31QP
	JmlpxzHpFEV44UsLr9q57keftSQGe4PnU39X+Z5sYbs5LRGlwfFZ9cuqjxbzOPKVBM6gk8i9S6ZdH
	3n/+oWnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wju9j-0000000E2y4-0vRz;
	Wed, 15 Jul 2026 07:35:47 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wju9f-0000000E2x7-3tYg;
	Wed, 15 Jul 2026 07:35:45 +0000
Date: Wed, 15 Jul 2026 09:35:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784100938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=siLOJ/PzH1Z/CI0gJ9d2mUYbY29fqJhH0h9UiXoFxCM=;
	b=x4KOqh2Yn2a1NNHe3H+t5FkH4lteZdt+ip8SlWkD8EjBUrZD803V/3J6n4/dUmX5IZRPza
	MVa49hWh7OVjcDixOk0pXPc44gZ0InNyfgZsy2LfOPwS7VxNnNHkf9MIWTEJttuSCiDWbk
	rNtbY9wvhvfIYjCUnoFhJgWQW5BVjjU9vAN9VX76I/L7wKa7iUvU12Xo4vU+K07o62R4Rf
	4JG7lDFulB37pBMviO7+Toy9JSX4bZ1lfVDw6/Szk9q/BiRYxLZx/QBkRWXBAjrtiOyGNT
	syMMHsSgyOUpUhRk8TYi4vwgT5pkJYb1lE76DkQBHHfJJESqV5QtoJP99CkjwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784100938;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=siLOJ/PzH1Z/CI0gJ9d2mUYbY29fqJhH0h9UiXoFxCM=;
	b=foV92jg5Rg8lolleRZiRokI1mtWDILP3qDC2YlA6beFcsirLHOOj9TJh4EevJ513dhEklR
	nEOXcJybVNFIsWBQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 2/7] vDSO: Make clockmode constants available without
 CONFIG_GENERIC_GETTIMEOFDAY
Message-ID: <20260715093143-bae66267-bbf6-4446-a6b5-2fd43999cca9@linutronix.de>
References: <20260709-vdso-arch-clockmodes-v1-0-3fd780bbf851@linutronix.de>
 <20260709-vdso-arch-clockmodes-v1-2-3fd780bbf851@linutronix.de>
 <87zezsogmh.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zezsogmh.ffs@fw13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_003544_138944_3C3B5872 
X-CRM114-Status: GOOD (  16.89  )
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

On Wed, Jul 15, 2026 at 09:29:26AM +0200, Thomas Gleixner wrote:
> On Thu, Jul 09 2026 at 13:32, Thomas Weißschuh wrote:
> > diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
> > index 15df9dcb42a5..2bc00c67dc54 100644
> > --- a/include/asm-generic/Kbuild
> > +++ b/include/asm-generic/Kbuild
> > @@ -62,6 +62,7 @@ mandatory-y += topology.h
> >  mandatory-y += trace_clock.h
> >  mandatory-y += uaccess.h
> >  mandatory-y += unwind_user.h
> > +mandatory-y += vdso/clocksource.h
> >  mandatory-y += vermagic.h
> >  mandatory-y += vga.h
> >  mandatory-y += video.h
> > diff --git a/include/asm-generic/vdso/clocksource.h b/include/asm-generic/vdso/clocksource.h
> > new file mode 100644
> > index 000000000000..e69de29bb2d1
> > diff --git a/include/vdso/clocksource.h b/include/vdso/clocksource.h
> > index c682e7c60273..63ee8c4ea15c 100644
> > --- a/include/vdso/clocksource.h
> > +++ b/include/vdso/clocksource.h
> > @@ -4,9 +4,12 @@
> >  
> >  #include <vdso/limits.h>
> >  
> > -#ifdef CONFIG_GENERIC_GETTIMEOFDAY
> >  #include <asm/vdso/clocksource.h>
> > -#endif /* CONFIG_GENERIC_GETTIMEOFDAY */
> > +
> > +#if !IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY) && defined(VDSO_ARCH_CLOCKMODES)
> > +/* Unlinkable dummy stubs */
> > +extern int VDSO_ARCH_CLOCKMODES;
> > +#endif
> 
> I'm utterly confused by this. What's this unlinkable stub for?
> The only usage of VDSO_ARCH_CLOCKMODES is in enum vdso_clock_modes where
> it is guarded with CONFIG_GENERIC_GETTIMEOFDAY.
> 
> And your change log says:
> 
> > Provide unlinkable dummy definitions. These can be used with
> > IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY).
> 
> which is even more confusing because that's related to the actual
> architecture specific defines and not to VDSO_ARCH_CLOCKMODES.

This is not a single stub for VDSO_ARCH_CLOCKMODES, but stubs for *each* of the
architecture-provided VDSO_CLOCKMODE_* constants.

E.g. on x86 it expands to:

extern int VDSO_CLOCKMODE_TSC, VDSO_CLOCKMODE_PVCLOCK, VDSO_CLOCKMODE_HVCLOCK;

> None of this makes sense to me.

I'll try to find a better explanation.


Thomas


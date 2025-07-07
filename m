Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9581C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 06:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6Nq2wlWcj6YING0FPFLwQLo2jrC6/nA6s1unWICjVI=; b=3y7yP2uyXCdgruW75f4dHgj9BN
	xJEnqvlHr6GGJz6Ok/VEeZp42tHTFrnqpfKXbhDVmjboy9DXFxCf3W+Q7fUHVn86EgcwT9XWjFUC4
	rloZfmaQ0dSMoUNKDyNqOhUw4ZfGQ+LdS21iXLVtho8qyfLWg6B0oKPNCfZ7HEXXhQBUGTii8OvEs
	mrXYKwuEeus5LueSCRauarmsdaeDsKSr/2UsBWXHJAWE4NtWLp5uInLkoNnCdlLwuzKljPzlGe6/6
	M15CoQMk0yi+5QAiFVIulyP5SMEzFRr/TmHBAnPw21pTBNKArAbRi+ad9189Bps3wEr0U6Sl08CHy
	Yu3vGVhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfMY-00000001YQr-1OQO;
	Mon, 07 Jul 2025 06:30:02 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfEN-00000001XLc-2fpr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 06:21:36 +0000
Date: Mon, 7 Jul 2025 08:21:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751869291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M6Nq2wlWcj6YING0FPFLwQLo2jrC6/nA6s1unWICjVI=;
	b=n0McAEBd5y6R5Cug4tP83Sunp+0n7kgn9ODazGWXwJDQ4Eia00Xdv/cbvLKzTEAHIS9Uwb
	eetOfHmufKgk/yIuksvOWumln3GMK4AgOq9lM+pQbLG9+3Kpcm9wUNz0iHUV00kutT+dYU
	WCmsPV21qfUw/EpeQfbU06iDpoMQam7H/CTqYHy24UqCPSlrhxJzpNROkl+JuWUgE0kCyw
	IVuSUsd1zho+aSgjHaB/oDBb6EeJXvV5gCSFJnAuD2QXk3hySPhANJpi7C+gDLwfrDVEHg
	98Nfjfo06Pqxyu+WK8zS6cSXNvtYHSAgyJHo08BcRynqiWo0UEI5IGKDaJ87DA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751869291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M6Nq2wlWcj6YING0FPFLwQLo2jrC6/nA6s1unWICjVI=;
	b=zV1dM3ArUP8VnI016Gn0Nf3+0JBjys1+YLcxyso463WRHrb0IsQb1/LEaCOwNkwftjTqds
	dSAm4pfANP55wKCw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, 
	Richard Cochran <richardcochran@gmail.com>, Christopher Hall <christopher.s.hall@intel.com>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Werner Abt <werner.abt@meinberg-usa.com>, 
	David Woodhouse <dwmw2@infradead.org>, Kurt Kanzenbach <kurt@linutronix.de>, 
	Nam Cao <namcao@linutronix.de>, Antoine Tenart <atenart@kernel.org>
Subject: Re: [PATCH 13/14] Revert "selftests: vDSO: parse_vdso: Use UAPI
 headers instead of libc headers"
Message-ID: <20250707081018-cdef0e77-5149-4a3b-a73b-bd8e38853f2a@linutronix.de>
References: <20250701-vdso-auxclock-v1-0-df7d9f87b9b8@linutronix.de>
 <20250701-vdso-auxclock-v1-13-df7d9f87b9b8@linutronix.de>
 <87a55hrqws.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87a55hrqws.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_232135_834832_A5106013 
X-CRM114-Status: GOOD (  13.05  )
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

On Sun, Jul 06, 2025 at 10:43:47PM +0200, Thomas Gleixner wrote:
> On Tue, Jul 01 2025 at 10:58, Thomas Weißschuh wrote:
> > This reverts commit c9fbaa879508 ("selftests: vDSO: parse_vdso: Use UAPI headers instead of libc headers")
> >
> > The kernel headers were used to make parse_vdso.c compatible with nolibc.
> > Unfortunately linux/elf.h is incompatible with glibc's sys/auxv.h.
> > When using glibc it is therefore not possible build parse_vdso.c as part of the
> > same compilation unit as its caller as sys/auxv.h is needed for getauxval().
> >
> > In the meantime nolibc gained its own elf.h, providing compatibility with the
> > documented libc interfaces.
> 
> I'm kinda surprised to find this here in this series. Isn't that commit
> c9fbaa879508 obsolete since nolibc got it's own elf.h?

Correct.

> So this should just go straight to Linus, no?

It could. But the next patch of this series depends on it for now.
So to avoid ordering issues I kept both patches together.


Thomas


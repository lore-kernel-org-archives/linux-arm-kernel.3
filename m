Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A9BCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 12:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iq9Rp/OuC3PCbtXKJ+rrICU+++sBXQCJ0QqJmyLjg+I=; b=1erTlWp+aBVFGcCRdAj588KyKX
	Sa++xMTttJ4qTpEKdO7wudbOXyECYqAWdqBMCqJZe6LZ9Y258Kbvw0cpgEtkQep9dpdvafPt6SebT
	Hdv9kNS0KfFZL/glSGW8a+5C6VVzIjrMT8ms1PnYN0u/zvCAwPgDj8DjyGC3t7EhC5ML5bDsfwL4z
	kI/mW0LJRozY5nYSxcMVyx4OnRkPCjGFweDyqLZJPh5N1g8qg/vkoLrCOPsUndEZgCuYzm3jW7qfm
	3mhsS0CpF/VB25FoAoB3TFCM9JxE+PGF+5KAOm5E8Ci7Vt03fS/rP5icQhgCciZNsHJkXWknyHhEe
	HHViixGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uohmE-0000000DXAY-0kVd;
	Wed, 20 Aug 2025 12:18:50 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uofqY-0000000D6fz-2ADg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 10:15:11 +0000
Date: Wed, 20 Aug 2025 12:15:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1755684907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Iq9Rp/OuC3PCbtXKJ+rrICU+++sBXQCJ0QqJmyLjg+I=;
	b=xk/l9YjbZxA1WTuNZDPDzZ8Wdc5Ml1Z8iLcrdiinHR/jwkPKoZe+/Yal4T3iQYwXywj3aL
	TuAdMOj+eQI0qmH4cwrwb6A3GMEaaVQoSspG8drK9wAs5SV2ideGv0qB3XhysuV56KbSJ4
	Ji1ZYj+TAl0GzjJEk9GVKmLEw7BefXb3EhPgFPnViqNPKbjRmStIhai3NtAluEf5PrZHVV
	T4448Dt1lvhIAkl03wcMAqvjtP2i+hGi5Mem2w/M3c9233P9HviyrsxwKIaTEioVDHmkb5
	w4lNJSNOF2EW+K8iCdf0/FKJRU8M0mcWk1yvh6VZByLxUK8W+1DJdnpNq/W+nA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1755684907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Iq9Rp/OuC3PCbtXKJ+rrICU+++sBXQCJ0QqJmyLjg+I=;
	b=uqPIa7gzVKO93eAxiDkhCF2+ypJHv38VRv3c6TBXEdvdEQOGkI4lmIgUVLp7mtuPYYNrwu
	m3d54o5VitT9DoBQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: John Stultz <jstultz@google.com>
Cc: Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arch@vger.kernel.org, 
	Richard Cochran <richardcochran@gmail.com>, Christopher Hall <christopher.s.hall@intel.com>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Werner Abt <werner.abt@meinberg-usa.com>, 
	David Woodhouse <dwmw2@infradead.org>, Kurt Kanzenbach <kurt@linutronix.de>, 
	Nam Cao <namcao@linutronix.de>, Antoine Tenart <atenart@kernel.org>
Subject: Re: [PATCH 12/14] vdso/gettimeofday: Add support for auxiliary clocks
Message-ID: <20250820113704-8b174953-f02a-4376-9359-e4007914ac2a@linutronix.de>
References: <20250701-vdso-auxclock-v1-0-df7d9f87b9b8@linutronix.de>
 <20250701-vdso-auxclock-v1-12-df7d9f87b9b8@linutronix.de>
 <CANDhNCqvKOc9JgphQwr0eDyJiyG4oLFS9R8rSFvU0fpurrJFDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCqvKOc9JgphQwr0eDyJiyG4oLFS9R8rSFvU0fpurrJFDg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_031510_695459_4433213B 
X-CRM114-Status: GOOD (  20.15  )
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

Hi John,

On Wed, Aug 20, 2025 at 01:03:56AM -0700, John Stultz wrote:
> On Tue, Jul 1, 2025 at 1:58 AM Thomas Weißschuh
> <thomas.weissschuh@linutronix.de> wrote:
> >
> > Expose the auxiliary clocks through the vDSO.
> >
> > Architectures not using the generic vDSO time framework,
> > namely SPARC64, are not supported.
> >
> > Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> 
> Just as a heads up, I've just been bisecting and this commit seems to
> be causing problems on arm64 devices, running 32bit versions of
> kselftest nanosleep or inconsistency-check tests. Running the 64bit
> versions of the tests are not showing issues.

Thanks for the report, I can reproduce the issue.

> From my initial digging, it looks like clockids that aren't vdso
> enabled (CLOCK_PROCESS_CPUTIME_ID, CLOCK_THREAD_CPUTIME_ID,
> CLOCK_REALTIME_ALARM, CLOCK_BOOTTIME_ALARM) are somehow getting caught
> in the vdso logic and are *not* falling back to the syscall (stracing
> the test I don't see syscalls happen before the failure), and the
> values returned don't look to be correct.

The generic vDSO code assumes that it can use the UAPI headers, also in the
compat vDSO. This is true for most architectures, as the UAPI headers work
correctly in 32-bit and 64-bit mode. On arm64 this is different, as the headers
from arm64/ are never used by regular 32-bit userpspace. So
arch/arm64/include/uapi/asm/bitsperlong.h defines __BITS_PER_LONG=64 even when
used by the 32-bit compat vDSO. The commit you identified uses __GENMASK()
which uses __BITS_PER_LONG. Due to the mismatch between __BITS_PER_LONG and the
real long datatype we run into an out-of-bounds shift and therefore undefined
behaviour. And of course -Wshift-count-overflow is explicitly disabled.

There are a few possible fixes, none of which is really great.
I'll send some patches.

> The inconsistency-check output looks like:

(...)

> Which hints we're returning nanosecond values in the tv_sec field somehow.

That seems to be an artifact of the UB from above, this happens even if
do_aux() just returns 'false'.


Thomas


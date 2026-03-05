Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC8BF30922
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H4GXwYR0kxFYmhDmvijfZa1t58+J78DwaweBUNYvjr8=; b=vEr8Wdk5NjE/KqVCWauNoemmsE
	59dWtVO2rVy47aCkDTDLbdey/bAR+aVLKuptan8PgGcKhelHCVo1guBbcBeRTubUf0IlA2x9vdZpv
	OS6p8E/wCgfwpEtVkToIh3HHIylCYkPEihv0tcw6uxE+7FVGEpdO6WGJ4U2k2vThLVPNWGp74TWKC
	v24EBFeqaXWMktMkjeSO7aEDxqRO5BPIOItt8H5jlRgNEWNLxCh49SvDWnMn0q5VVDQqszcrNMfR6
	aiXXljmMCZgaeJSVOpgdoVZBwxg/IdfNA4NC+GytmsmEX3ZVMaMCjTSfoSnDrDzzx4rM7/ZuvHFzC
	JUZLKYcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4wt-00000001N5h-2fd0;
	Thu, 05 Mar 2026 09:24:51 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4wr-00000001N4y-0PHv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:24:50 +0000
Date: Thu, 5 Mar 2026 10:24:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772702683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H4GXwYR0kxFYmhDmvijfZa1t58+J78DwaweBUNYvjr8=;
	b=py5S7KZW2CuzZ/LmXiMem3ylvhtEbuj0FCOCKDeq2Wc6KsV9V1LoQg+z36EHUZlGhXHVvo
	BzVtGoa/APPEJHLamSiAHWjfnaS2PYwSSyY9KJGH8siIMCMU9z7t+KAbuX9ueIiDNrZO2s
	WHmly7Y64XGEqu6JM3K46LWANj0hciKhqWcJ6nVQ6n0yyILovPcyBviHdPVzaj/Dww1as9
	3Y7Toc8mdZKrIQfXOYgxWl/t0ZzzO+lDpkNii33/tKYHPGSWQg00cTqL/xrTwM5YUeaLfI
	soWgDtj5zZ5FJO1anB8QntF6rSF8p4qP2gKbCx1Lo+Wt+yWXmdbQOMg06neR1g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772702683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H4GXwYR0kxFYmhDmvijfZa1t58+J78DwaweBUNYvjr8=;
	b=HD1bZlJ8IllrAB9QnfraiyO9HKNCZUT/73lSmsMraqGtujlap15j78l+ZMQGtyK/1uICTw
	Ty6p2+DloLYM3iCQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
Message-ID: <20260305080950-ff43457b-0551-480f-916e-6c252e6a64af@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
 <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
 <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
 <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de>
 <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
 <20260304081505-a2a3a376-20c9-46cb-8dc9-2c4deec1a55e@linutronix.de>
 <6909A81E-AE50-459C-9604-3EEAEFE3838E@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6909A81E-AE50-459C-9604-3EEAEFE3838E@zytor.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_012449_282647_D1E22DED 
X-CRM114-Status: GOOD (  28.40  )
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

On Wed, Mar 04, 2026 at 10:30:34AM -0800, H. Peter Anvin wrote:
> On March 3, 2026 11:35:52 PM PST, "Thomas Weiﬂschuh" <thomas.weissschuh@linutronix.de> wrote:
> >On Tue, Mar 03, 2026 at 10:11:52AM -0800, H. Peter Anvin wrote:
> >> On 2026-02-27 01:34, Thomas Weiﬂschuh wrote:
> >> >>>
> >> >> The thing about gettimeofday() and time() is that they don't have
> >> >> a 64-bit version and libc implementations are expected to call
> >> >> clock_gettime() instead. The result was that there was never a
> >> >> patch to turn the off either.
> >> > 
> >> > gettimeofday() is currently the only way to get the timezone of the kernel.
> >> > But I guess this is a legacy thing anyways. If you say we should drop it,
> >> > let's drop it.
> >> > 
> >> 
> >> The time zone in the kernel has never worked anyway, as it would require the
> >> kernel to contain at least the forward portion of the zoneinfo/tzdata table in
> >> order to actually work correctly. The only plausible use of it would be for
> >> local time-based filesystems like FAT, but I don't think we bother.
> >
> >sys_tz is currently used by a bunch of drivers and filesystems (including FAT).
> >It is also used when writing to the RTC.
> >
> >> A bigger question is whether or not we should omit these from the vDSO
> >> completely (potentially causing link failures) or replace them with stubs
> >> returning -ENOSYS.
> >
> >I am a bit confused here. You mention 'link failures' and in another mail
> >'weak references as fallback'. Both are things that happen during linking
> >('link failures' could also be interpreted as failures during loading).
> >Somewhere else someone also mentioned the vDSO to be 'linkable'.
> >But as far as I understand, only libc interprets the vDSO, it completely
> >bypasses both the linker and the loader. And libc already does graceful
> >fallbacks to the regular systemcalls if the vDSO is missing completely or
> >lacks one of the functions, as both cases may happen on normal systems.
> >
> >What am I missing?

> Weak references would be a way to work around the link failures. 

I am still not sure where "the link failures" should be coming from.
The only sense I can make out of it, is if somebody manually and directly links
to vdso.so. Like in the following example:

$ cat test.c 
#include <stdio.h>

#include <linux/time.h>

int __vdso_clock_gettime(__kernel_clockid_t clock, struct __kernel_timespec *ts);

int main(void)
{
	struct __kernel_timespec ts;
	int ret;

	printf("__vdso_clock_gettime=%p\n", __vdso_clock_gettime);

	ret = __vdso_clock_gettime(CLOCK_REALTIME, &ts);
	printf("ret=%d\n", ret);
}
$ gcc test.c /lib/modules/$(uname -r)/vdso/vdso64.so
$ ./a.out 
__vdso_clock_gettime=0x7ff6ba2eeb80
ret=0

This actually works on glibc (not on musl). But it is highly non-standard and
relies on multiple implementation details. Furthermore it can fail to run on
systems without a vDSO, as mentioned before.

Is this the usage pattern you have in mind?
Do you know of anybody doing things this way?


(...)


Thomas


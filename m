Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD066E99049
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 07:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcWWgAkaawlRZJPPVtqSkGlhDZHKznfQKlRnA0c5Grg=; b=4sMaleyO9NCHZxJhqWhazS7nqn
	YX01U9qsISTf70J1EX3SvYBFdRBEL5SAqnwt26i9coyOXnB3KJyQkp6KOk6tbXPmdH1SwIlxgaZF9
	RTh9QrR6JxMuTBmKsbtOGoh5YfaTIX5D9UZfb64w3WICdis9bgRxAAeYS+evrie0SHhBu5J5CjuXC
	oAeyokPhUoZDflXkkI56rj3IzJZhJSoZ/4LuFCjA4+/TMz42J3pcIzr4a9s5+HtWVVegAZRwD7QzP
	BQ1dZ1NRWXemmSHpazZq5BfCmIGGdL7kxVh8l0rsM8UIoBGtyN0Wgps4XKFnsGxW44vr3ql10DKbP
	OddLDM5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6Em-0000000BjPh-00pD;
	Fri, 10 Apr 2026 07:25:08 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6Ej-0000000BjO3-1Iqd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 07:25:06 +0000
Date: Fri, 10 Apr 2026 09:24:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1775805899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DcWWgAkaawlRZJPPVtqSkGlhDZHKznfQKlRnA0c5Grg=;
	b=2/IJa6AigsLTvo0bFTGC10WodpRLk8D/N7yIF4mk2hA0ic4uGfAfWjwTdg8E3Nlvtj2Lcs
	zUJp97laoQ7CRjYNtXcqrcN5fesVUCoUTHK9oEAkQLTjs5LDANQANe67xcylvjxcoOv7E5
	eDKnPcTyqgGMYYqyi/DFDQYfE2xe27tDKd0TrEyTes2t3NwXyMBw/gN5qP5Xipok4cZa19
	JmOfy8zJY8p9bTmBgL6Ouwuv+fZenOL0faKHsL3WbwGKwMVtW4TWiwBb4VX2pquCJ4GiPt
	2TWv/6h7txXmhveenNET8ahEPXsqpd+QkJw1NX7NDma4Qo7TFml40MkDAUuZvg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1775805899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DcWWgAkaawlRZJPPVtqSkGlhDZHKznfQKlRnA0c5Grg=;
	b=ZgqeBpjS2tQJJXjyUQm4vLhm1bLgw03s/xJ7/GPJfbak2qtTH8uDf4tZtuj4uuIZ044A61
	lpzZZ99OEq3Ku5CA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
Message-ID: <20260410091131-46b6354c-9d06-4e47-9345-ee224d8528f7@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
 <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
 <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
 <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de>
 <49b7c9f9-198a-49f7-880b-6ae74d7bd985@zytor.com>
 <2b1ac7b9-fcc8-4aa3-a0ad-eb37e4bce030@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b1ac7b9-fcc8-4aa3-a0ad-eb37e4bce030@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_002505_486663_AFC1626F 
X-CRM114-Status: GOOD (  22.75  )
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

On Tue, Mar 03, 2026 at 09:50:33PM +0100, Arnd Bergmann wrote:
> On Tue, Mar 3, 2026, at 19:11, H. Peter Anvin wrote:
> > On 2026-02-27 01:34, Thomas Weißschuh wrote:
> >>>>
> >>> The thing about gettimeofday() and time() is that they don't have
> >>> a 64-bit version and libc implementations are expected to call
> >>> clock_gettime() instead. The result was that there was never a
> >>> patch to turn the off either.
> >> 
> >> gettimeofday() is currently the only way to get the timezone of the kernel.
> >> But I guess this is a legacy thing anyways. If you say we should drop it,
> >> let's drop it.
> >> 
> >
> > The time zone in the kernel has never worked anyway, as it would require the
> > kernel to contain at least the forward portion of the zoneinfo/tzdata table in
> > order to actually work correctly. The only plausible use of it would be for
> > local time-based filesystems like FAT, but I don't think we bother.
> >
> > A bigger question is whether or not we should omit these from the vDSO
> > completely (potentially causing link failures) or replace them with stubs
> > returning -ENOSYS.
> 
> I see no harm in keeping gettimeofday() in the vdso when
> COMPAT_32BIT_TIME is turned on, as existing code will call it
> no matter whether it's in the vdso or the syscall.

We would still always keep them for 64-bit ABIs, right?

> Equally, I see no point in having either version of
> gettimeofday() or settimeofday() when COMPAT_32BIT_TIME is
> disabled, as clearly anything calling it would pass incorrect
> data for times past 2038.

Should we also drop the syscalls in these cases?
We will need to keep settimeofday() in some form to support the
timewarping call done by init.

Recap/Proposal:

* Keep the gettimeofday()/time() syscalls when they are y2038 safe or
  CONFIG_COMPAT_32BIT_TIME is set.
* Always provide settimeofday(). If CONFIG_COMPAT_32BIT_TIME is *not*
  set, reject passing any 'tv' argument where it may not be y2038 safe.
* The vDSO functions always mirror the systemcall availability.


Thomas


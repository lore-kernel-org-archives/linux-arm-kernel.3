Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3F5FD531F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 09:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/R2J51UoyPCadc/Pm8Qt+TaC7sLpOeizIXgFCmQh8ZQ=; b=DtoBoo8kFdwrH0SgjSpHleLpYu
	9NDY13fETlRB5ansq+u2rKssWAKF6rLkWI49lgAG2m/9/xAXYwI1zMdGeN7hRkZkdlSQh7zgazEmF
	KwPZwqBTAop4t0shOP7ZcwQYW7hBSsQ2iWBmHRlnxcyPfW4ZBApKGdBKHEydZ9dGmoG2dtdjrK7Tc
	CM9g2ZVOxNd2uWkeMSI0tBJZn1OR21qNYrTcwm7Zz1bS7eiVheybqxK0ceGp8MkesI41PEAEPVIP+
	cIgj8xHApBtCVGv7hdWSxo7RLL5L4KecgxUbmFSvgVEApFdaRQ4ZHev921OicetNC0XhQ8gEzuwAq
	q5jLajrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuF2-000000088vH-048a;
	Fri, 27 Feb 2026 09:34:36 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuF0-000000088u5-1JeX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 09:34:35 +0000
Date: Fri, 27 Feb 2026 10:34:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772184871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/R2J51UoyPCadc/Pm8Qt+TaC7sLpOeizIXgFCmQh8ZQ=;
	b=CGeabxmBw+/AZ7oTl4E2tz8AJVILisXZZ+HNXpb2gagxjIcuU2+QlmjVTBAFP3VTpXMqr+
	W4LZp+Y98Z5CymhdlUDmIV64Kea7ln250JaQXXgOvmXr0ziVAGXOUhHjOQPW37tYikya19
	ijGc3SnCUR0mMJA6wDzyZy7kzqN1z3+BsFswojH/kuj7OSLMqwIFbK91Wgzv2r0KNkXIpa
	QVzGpfZ54UM3MZbDS6QpSoIR/3BuCpDmd6uAIGVpBtOFvmw2nxGO5fRDlL8UZCBRpaYRoy
	sNf035yrsMm4QtLm60j1cvAUFKhO2cM/+nIq1+vGI+k7FW6Uj8XN0kGtxPVlVA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772184871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/R2J51UoyPCadc/Pm8Qt+TaC7sLpOeizIXgFCmQh8ZQ=;
	b=RkiVfxGB7rsEx+NudL1Y/YXS7uzosxv9jyyl7qgxbgo9VIT5IDWFrH11EpmknzII7KIYCe
	b8t8QbY2jBr8fVBw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <chleroy@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
Message-ID: <20260227103226-cc3bb32c-0107-4c09-b81a-ca33ea03ad5c@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
 <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
 <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03cd1e21-a2f2-46a1-a674-cbaef9712016@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_013434_498031_852E9100 
X-CRM114-Status: GOOD (  19.48  )
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

On Fri, Feb 27, 2026 at 09:58:35AM +0100, Arnd Bergmann wrote:
> On Fri, Feb 27, 2026, at 09:51, Arnd Bergmann wrote:
> > On Fri, Feb 27, 2026, at 07:57, Thomas Weiﬂschuh wrote:
> >> If CONFIG_COMPAT_32BIT_TIME is disabled then the vDSO should not
> >> provide any 32-bit time related functionality. This is the intended
> >> effect of the kconfig option and also the fallback system calls would
> >> also not be implemented.
> >>
> >> Currently the kconfig option does not affect the gettimeofday() syscall,
> >> so also keep that in the vDSO.
> >>
> >> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> >
> > Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> 
> Actually, I need to revise that. I think gettimeofday() should be
> guarded by CONFIG_COMPAT_32BIT_TIME for both the syscall and the
> vdso. Looking back at the history, I see that we added the #ifdef
> for each syscall we modified to have both time32 and time64 version.
> 
> The thing about gettimeofday() and time() is that they don't have
> a 64-bit version and libc implementations are expected to call
> clock_gettime() instead. The result was that there was never a
> patch to turn the off either.

gettimeofday() is currently the only way to get the timezone of the kernel.
But I guess this is a legacy thing anyways. If you say we should drop it,
let's drop it.


Thomas


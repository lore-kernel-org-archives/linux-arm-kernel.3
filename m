Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57225E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 06:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brEM+ootPH6y2/YCviVjC+RLeQ0QzlEBqocyy/WfD3U=; b=fxuMr3/Av1xUknF7ITs4CnRovz
	+Bs8DNnDtwR1G33hPqyNynZuyV6UPczMBOvOFZC4RhvTtUxvthwFvvn847sR9gDphYOmH7XKw9ZGD
	Ma03f+UNr9ESNe556H5bObzDqOMl84VaoI9ZQ0dkdNMDZSK4AoQznE9w8fYkf2j1DMDwCSC3eVMdc
	qYQQW5o8YiCr/95SHRHsPs3F6GaXQCwXJl4ljxwn8rIrFIircKT8/fQsgIk9O3pKKzs8J5xSr7oID
	5cNzw8P4yJsLD41HiVgw6Fws+CA9Bd07mIeNnF7nQJzhNS4ssOKFekhABwIBbeW3D5FKkToIDeP8r
	UZP4K/sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOA71-00000000z10-3sgb;
	Thu, 19 Dec 2024 06:34:19 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOA3J-00000000yF9-3biE;
	Thu, 19 Dec 2024 06:30:31 +0000
Date: Thu, 19 Dec 2024 07:30:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734589827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=brEM+ootPH6y2/YCviVjC+RLeQ0QzlEBqocyy/WfD3U=;
	b=XMcC+wO5/gyjwqszz2FEVmDMXZQx3pF5bzw/D/U+DhwYKJv9REWbX40X23G5YodGhMzxLG
	1UAr8nKjyY0Kf1RGg/8CcSlJteWhtoj0+amS1nzNd19YUishyFWMegPVlkma7haH/l0bQx
	UPXdUdr/bOcUjZEv7/IyAq5X8UvpyOl8Eoo1LOwkra69ZA9udzJSpGYhAqPejllDppzmui
	/1w9LTvVZWo0hHFiKy1wqjTm8CZxIqay1gQlNDOetKKVwrQU522w45o4hbBkEqiMJm3FRu
	2KrYtc6E7LcXV7UbkCQjg7cmZZOV9vw1zDDr9jgfGCnIhmX4pZsWlB8a3x2avw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734589827;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=brEM+ootPH6y2/YCviVjC+RLeQ0QzlEBqocyy/WfD3U=;
	b=lizvNDYmwqC1Sdr28wyZPYco75yXNbVdywOf7fbIN5mEEvywWt8AvsOHhKYx2j3f09NW7x
	awEMWr7EktvpdPBA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Conor Dooley <conor@kernel.org>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Anna-Maria Gleixner <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-s390@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	Linux-Arch <linux-arch@vger.kernel.org>, Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH 07/17] riscv: vdso: Switch to generic storage
 implementation
Message-ID: <20241219072552-7cd4512c-4f61-408a-9422-167a6f2810db@linutronix.de>
References: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
 <20241216-vdso-store-rng-v1-7-f7aed1bdb3b2@linutronix.de>
 <20241218-action-matchbook-571b597b7f55@spud>
 <20241218162031-ee920684-db10-4f17-b1cb-50373d7ea954@linutronix.de>
 <137c0594-e178-4c91-bc8b-5f99b3ddb2f0@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <137c0594-e178-4c91-bc8b-5f99b3ddb2f0@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_223030_175564_630C9454 
X-CRM114-Status: GOOD (  26.66  )
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

On Wed, Dec 18, 2024 at 05:35:31PM +0100, Arnd Bergmann wrote:
> On Wed, Dec 18, 2024, at 16:46, Thomas Weißschuh wrote:
> > On Wed, Dec 18, 2024 at 03:08:28PM +0000, Conor Dooley wrote:
> >> On Mon, Dec 16, 2024 at 03:10:03PM +0100, Thomas Weißschuh wrote:
> 
> >> Might be a clang thing, allmodconfig with clang doesn't build either.
> >
> > The proposed generic storage infrastructure currently expects that all
> > its users also use HAVE_GENERIC_VDSO.
> > I missed rv32 when checking this assumption.
> >
> > I can add a bunch of ifdefs into the storage code to handle this.
> >
> > Or we re-add the time vDSO functions which were removed in commit
> > d4c08b9776b3 ("riscv: Use latest system call ABI").
> > Today there are upstream ports of musl and glibc which can use them.
> > (currently musl even tries to use __vdso_clock_gettime() as 64-bit only
> > on rv32 due to a copy-and-paste error from its rv64 code)
> 
> Adding back __vdso_clock_gettime() wouldn't work on rv32 because there
> is no fallback syscall for it, and it wouldn't really help since
> there is no existing userspace that uses time32 structures.

My original paragraph was worded confusingly.
It was about re-adding time-related vDSO function *in general*, not the
specific 32-bit ones.
The new ones should be 64-bit only, indeed.

> > There is precedence in providing 64bit only vDSO functions, for example
> > __vdso_clock_gettime64() in arm.
> > I do have a small, so far untested, proof-of-concept patch for it.
> > This would even be less code than the ifdefs.
> >
> > What do you think about it?
> 
> Yes, simply exposing the normal time64 syscalls through vdso
> should be fine. I think this currently works on everything except
> rv32 and sparc32, probably because neither of them have actual
> users that are able to test.

Should it use the specific _vdso_clock_gettime64() naming or leave out
the 64 suffix?


General Note: I'll continue working on this next year.


Thanks,
Thomas


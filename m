Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3737E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 09:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rka3uWrK3MCyr0hfJh0ffhr2Lty5KOVMuvd6Op+l+RM=; b=o5HwIlpTCwjB+10tXfnuMWDnTk
	Vb2kCCGtVNaODiNC/C4pgq+qa3RdJ4b7XBMqPzWjmsYppkcH6qxcZi3IVcPToGoZk7EQR+HNLP2WA
	JRqG7YfvCbzLQXnfxLJl2zUIPaSvoHbDiNOMGuP2Pv8HNHYQH3cvt+COuRq0hHhsxkmRJ7zsYNqDm
	KZ/0g9wtJ80FTJjuRPvwTgcMWsmob3K9rEO6lxqWXMwRT3lR/7o5IPheXiOqhMoVQaTyR15NJHURH
	nQfkkyB4RB/+Lic/0+HMqd20EVHQbl+X4qgzMQj5+jjVfoy8sLSp2WH6R5VHplPRVtxI4kRfggOLh
	8uyHW1UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1md-00000003DJQ-16Wd;
	Fri, 13 Dec 2024 09:16:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1kS-00000003CUf-2SCu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 09:14:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rka3uWrK3MCyr0hfJh0ffhr2Lty5KOVMuvd6Op+l+RM=; b=QtmTa+KeLXA/34ueeEIk2NLJtK
	e7hFH4BPaIqy39ed3evrUQyqwf0ncaoLLu/euV8o6NkUoV+APH+fOMeEL//1+ABTuDcM31G/Mytyu
	IKtWDLOy3TrJMTSC1MQL4ny/IFUEht6RmD7gDS8usd1M0WLj2vlKVFGQZBPLHJxHQAXZde9vzKA3o
	gbeEQyud7Mz7uHmN6Xxc2j9HoEMybSa9gFuniaWT/pu90uQah4hwAbIEz8Xq2aLLIxH5APw3TdSSF
	NInxZKt+lWqgJKh6mKdij+rPbqRWPK2IUebz46lV+kAzDjqfprxUY1o94GOPtUejfNia8QdSHaOBy
	RUQ9DyRw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56840)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tM1iM-0006SP-1N;
	Fri, 13 Dec 2024 09:12:02 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tM1iH-0006CT-0h;
	Fri, 13 Dec 2024 09:11:57 +0000
Date: Fri, 13 Dec 2024 09:11:57 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Arnd Bergmann <arnd@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org,
	linux-rt-devel@lists.linux.dev, Ard Biesheuvel <ardb@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 2/4] ARM: Disable HIGHPTE on PREEMPT_RT kernels
Message-ID: <Z1v6XcaSK97Sa9Tz@shell.armlinux.org.uk>
References: <20241210160556.2341497-1-arnd@kernel.org>
 <20241210160556.2341497-3-arnd@kernel.org>
 <CACRpkdZaoD2vqbCi1AFUa6mF2_=c3Nu4R0CvxFAep0VMgtMtOQ@mail.gmail.com>
 <20241211152257.Igx3aT2Y@linutronix.de>
 <CACRpkdbYU=Txm0zUWDWvNXA0JHRNGpy1ccy0zQdiBb2Ya+UBFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdbYU=Txm0zUWDWvNXA0JHRNGpy1ccy0zQdiBb2Ya+UBFA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_011412_613371_7C170E5A 
X-CRM114-Status: GOOD (  20.08  )
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

On Fri, Dec 13, 2024 at 01:27:00AM +0100, Linus Walleij wrote:
> On Wed, Dec 11, 2024 at 4:22 PM Sebastian Andrzej Siewior
> <bigeasy@linutronix.de> wrote:
> > On 2024-12-11 14:29:29 [+0100], Linus Walleij wrote:
> > > So fast GUP is supposed to be lockless, and should just not
> > > have this problem. So it can't be addressing gup_fast_pgd_range()
> > > right?
> > …
> > > I'm more asking if HIGHPTE even acquires a spinlock anymore
> > > as it is supposed to be "fast"/lockless. If it does, it is clearly violating
> > > the "fast" promise of the fast GUP API and should not exist.
> >
> > This is lockless on x86. The problem is ARM's
> > arch_kmap_local_high_get(). This is where the lock is from.
> 
> Aha that calls down to kmap_high_get() that that issues
> lock_kmap_any(flags).
> 
> But is it really sound that the "fast" API does this? It feels
> like a violation of the whole design of the fast stuff.

If there's no way to do it lockless, then it has to take the lock.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


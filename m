Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA034E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 15:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bj3HLfAaTEgLybrOE17CqojJW6/IovPwqNCEJh+a3x8=; b=TsdJbvT7QsM9pINOHaWrectAry
	9IGNxzj0Tiqfb3dT/H66I1qcHMXNq3Xf6JDDmTbvqUxO2fucjlDCkahwW8YYQhgZznNRFb823zoUb
	P1AjtXxIa5ilrUaYroC2jI0xDgd+sPQmRCSKmIrOtkEMO9IfgS/CNMKLvKSvtf6vaNE6Sa8QUjMMH
	kvEHxAArp7O2ZyBd/mSCUsqRQSw7rFi6eS/49UZzeQA09JFVcwg3AdZ7ka2ayNXUChwrizo0uJ/zm
	40MtcmsmkOB6u65LZt2VKg+IZX588aS6FVzYCoXBIDSgRU6+Hk4XTE6QUpV5ADEeGNk/LOuztvq67
	BrimEDeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOaf-0000000FFpT-33NR;
	Wed, 11 Dec 2024 15:25:29 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOYH-0000000FFLP-2iEm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 15:23:02 +0000
Date: Wed, 11 Dec 2024 16:22:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1733930578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bj3HLfAaTEgLybrOE17CqojJW6/IovPwqNCEJh+a3x8=;
	b=jPnbSjYAsa/3sIBGYkpSL+Hfi0cotmj+NqQRjX4DYUGn8NA2Dv7MggsijYQ99IwrFB74T+
	K8xRV5yft1JGhjyBEH3ObAy0L4yqTDuCFEMoNcVa76sj1lRTOK/iFuiL7gASoGENOwzdTV
	hwOwiZLw1sP4f3iWyIx/91rA0DRySeA7gdLeYSCkM+nlBHlAXltDBaA73jP6DdV406N2Xk
	1+4CQwja+N77cYhux6O95ozJxvA1wARSq+kGfBF0LVPsk0RhoCZvCfTvHvMSL8Y8+fUUDw
	INuFoRhQeiJY4KK9u9xEWaq6Of5d+cljh99nfxZVkc0NPwJUsSNTnq7AqKARXQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1733930578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bj3HLfAaTEgLybrOE17CqojJW6/IovPwqNCEJh+a3x8=;
	b=2CAw6C3I9ByddGJoOgM225O/zgyu2W/7Ypk8MHxeGq8x/Shuiv2hVVY7QAANWiEVmyaF1u
	VXD6kQ4mJJ1TNfDQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev,
	Ard Biesheuvel <ardb@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 2/4] ARM: Disable HIGHPTE on PREEMPT_RT kernels
Message-ID: <20241211152257.Igx3aT2Y@linutronix.de>
References: <20241210160556.2341497-1-arnd@kernel.org>
 <20241210160556.2341497-3-arnd@kernel.org>
 <CACRpkdZaoD2vqbCi1AFUa6mF2_=c3Nu4R0CvxFAep0VMgtMtOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CACRpkdZaoD2vqbCi1AFUa6mF2_=c3Nu4R0CvxFAep0VMgtMtOQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_072301_823434_1CDCDC8A 
X-CRM114-Status: GOOD (  10.15  )
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

On 2024-12-11 14:29:29 [+0100], Linus Walleij wrote:
> So fast GUP is supposed to be lockless, and should just not
> have this problem. So it can't be addressing gup_fast_pgd_range()
> right?
=E2=80=A6
> I'm more asking if HIGHPTE even acquires a spinlock anymore
> as it is supposed to be "fast"/lockless. If it does, it is clearly violat=
ing
> the "fast" promise of the fast GUP API and should not exist.

This is lockless on x86. The problem is ARM's
arch_kmap_local_high_get(). This is where the lock is from.

> Yours,
> Linus Walleij

Sebastian


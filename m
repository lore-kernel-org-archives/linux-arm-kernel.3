Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58AA3CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 07:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZYU1yO04Vl6gQUd+zVeWV299Sxti2R9KNXPToDb1EC0=; b=wEXNSEHy20qbY9XPvO5MreKnPJ
	GWaE/4T0Q9Jirr1elWKyq2FO0mRCn1HvaXvXA2X+tRxuFDwUFZaMn2Uj91qTV8Rxwn4GtLxMRAeQM
	7eekn6zJFnS5cczMjtNg5/L9E7twyS5TGsARCwYMKTQjQVFMHLIhPSoaWnn8NmihBuD56bjKtY+4E
	Mny3ludPZCwJZDsav4cL5QXlkqk99gdvAuBnfTQksRjQUnKHktchsz7nsas5dsTyErtJ5tCnA1Qkx
	XG4tLmSe++B+Zcb8UfICcbiNLhSvz6OWOfkkqDdVLa0yf61xzWtcNThh0AfRm0/0v8Cyak9c5evmS
	/Z947rPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE0Kz-000000001NI-27tH;
	Wed, 29 Oct 2025 07:11:17 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE0Kx-000000001Mh-1EgI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 07:11:16 +0000
Date: Wed, 29 Oct 2025 08:11:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761721871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZYU1yO04Vl6gQUd+zVeWV299Sxti2R9KNXPToDb1EC0=;
	b=kjaq/1pT+5TEp1kbFkbDEgi1feSbH4Tv7i3gf32qkAM8/6LMPatatORoJIk5Rsce0RPDLv
	hg5EEBxXoV4qlE1o18gu/IoqXjXFMysgBVidsRWu52Flz4HyxaHSV05p0rvn0FxfMSwovR
	xBAst4yUAoD8VwlhVPJQ30E9sXoVUNmgH31uhO1Up+GZASBO0VRZ7MwekeIW2w6Ta5uuUF
	nn7C4bwhsL7JmXfl45oHSj3GdJWFeiuCMVfwFn51rG7obPHmhjux37JjxzFBg3OGAJ4a1+
	fh/V+ooVutCmV138b0F4jwmFOpwLylbCdbeDAsAdtdWAweeadwgbpKrgGdBGNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761721871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZYU1yO04Vl6gQUd+zVeWV299Sxti2R9KNXPToDb1EC0=;
	b=+Yxr1RWtc2zdAJXy4Hgexznn4Y82izDHEk6m30ZX92y9TlJ2RJIgkN1WEfTZ8dDfQ7g3Xm
	UkTv69J2pzUmuTDw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: akpm@linux-foundation.org, arnd@arndb.de, brauner@kernel.org,
	kuninori.morimoto.gx@renesas.com, liaohua4@huawei.com,
	lilinjie8@huawei.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
	lorenzo.stoakes@oracle.com, marc.zyngier@arm.com, pfalcato@suse.de,
	punitagrawal@gmail.com, rjw@rjwysocki.net,
	rmk+kernel@armlinux.org.uk, rppt@kernel.org, tony@atomide.com,
	vbabka@suse.cz, will@kernel.org
Subject: Re: [PATCH v2 RESEND 1/2] ARM: spectre-v2: Fix potential missing
 mitigations
Message-ID: <20251029071109.Hj1fO_B-@linutronix.de>
References: <20251028182052.nrRad87D@linutronix.de>
 <20251029024151.6005-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251029024151.6005-1-xieyuanbin1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_001115_477163_F4F097FE 
X-CRM114-Status: GOOD (  19.95  )
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

On 2025-10-29 10:41:51 [+0800], Xie Yuanbin wrote:
> On Tue, 28 Oct 2025 17:20:05 +0100, Sebastian Andrzej Siewior wrote:
> > If I apply both patches (of yours) then it sends a
> > signal with disabled interrupts which breaks my PREEMPT_RT case.
> 
> I am not familiar with PREEMPT_RT yet and do not know that signals cannot
> be sent with disabled interrupts and PREEMPT_RT=y.
> I apologize for this.

no worries.

> On Tue, 28 Oct 2025 19:20:52 +0100, Sebastian Andrzej Siewior wrote:
> > !LPAE does do_bad_area() -> __do_user_fault() and does not trigger the
> > warning in harden_branch_predictor() because the interrupts are off.
> > On PREEMPT_RT this leads to an error due to accessing spinlock_t from
> > force_sig_fault() with disabled interrupts.
> 
> This seems to be a more serious bug, and may require another patch to
> fix it. Not only !LPAE is affected, but LAPE=y is also affected:
> do_translation_fault() -> do_bad_area() -> __do_user_fault()
> This code path seems very easy to trigger.

correct.

> > I guess the requirement is to invoke harden_branch_predictor() on the
> > same CPU that triggered the page_fault, right? Couldn't we then move
> > harden_branch_predictor() a little bit earlier, invoke it in the >=
> > TASK_SIZE case and then enable interrupts if they were enabled?
> >
> > That would make me happy ;)
> 
> This seems to only fix the warning in harden_branch_predictor, but cannot
> fix the issue of sending signals with disabled interrupts mentioned above.
> 
> What about adding:

I was planning to just move it up. Let me try to form something in a
bit.

> Xie Yuanbin

Sebastian


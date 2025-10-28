Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 736C2CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 18:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oBT6KOoEoYz1LUZZyQiGr2v4dR0JIvwu42klUVecReI=; b=SyfIt8eN8yQ/prv2ppDma9t6L+
	U0CaDhOltCj4vqlHQSQu8tZdEjWreoqqWqC9lyS7tahJ8g3HrC4tntJ/xbGlp9nui5ambT9HLJztS
	zXl7MKP5GOGvqDKmT3OiVAKcyM1wCBE/ACAqnHBt6E1QasoMXSO4TlwHuVMPPlOEWgVbzijMgQG+w
	tCcM/wDlZ6UGa2V74OuAopiBDQqlqzy/wWqMJ/IGz6oqxmO+QnTwXVcupVyTsJF0jcoyYVga5yPEt
	PaP2YowtlaapAzz2TAQv2JC6kw6LGk6yU3HmoQF/yDabudcoCMDst4CXrk1vrxZTZoEH9+VZIY2aQ
	NYe+JXeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDoJY-0000000GUDl-1qbH;
	Tue, 28 Oct 2025 18:21:00 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDoJV-0000000GUDM-2oLl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 18:20:59 +0000
Date: Tue, 28 Oct 2025 19:20:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761675654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oBT6KOoEoYz1LUZZyQiGr2v4dR0JIvwu42klUVecReI=;
	b=LFWahYbGsUhyLZdoEXlErWVLrIB/T+rhvYb3KhhJdW/Gx+MgUNnIVITZlgXSmdCzYf4vLj
	YZILP2CWGI1WeNg7r9ASfPqDwsSoZ1BiWlnNwwVOMtz5jpObcDgRjOoLNUsZjRd0pZsWek
	oq408P1Reb8Tjxi10L6m0o4d462a9JOqT3weK6U/4P5bsicLkgtyu8B7ruEVzzwPOaNIad
	4hKcjybKwF8RinsMfsORJgDgSS3kbqk+HX3f4AB4bKB5iyr0zckVbOTXuURQLzc/JwSivF
	oMp49co9aRTFY8l14qCUAFFrm+HC42yUDF1CdhzROaSNz1XTJSK/xpns1wx9GQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761675654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oBT6KOoEoYz1LUZZyQiGr2v4dR0JIvwu42klUVecReI=;
	b=a7i45+r0qPK7te/RWB1jXuoYdegtH43cD4xjuDQQoV3NJmcBgP/+oSY2A3GG6deDow5qet
	tpB76aEDovNOwEAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Xie Yuanbin <xieyuanbin1@huawei.com>
Cc: rmk+kernel@armlinux.org.uk, linux@armlinux.org.uk, rppt@kernel.org,
	vbabka@suse.cz, pfalcato@suse.de, brauner@kernel.org,
	lorenzo.stoakes@oracle.com, kuninori.morimoto.gx@renesas.com,
	tony@atomide.com, arnd@arndb.de, akpm@linux-foundation.org,
	punitagrawal@gmail.com, rjw@rjwysocki.net, marc.zyngier@arm.com,
	will@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, liaohua4@huawei.com,
	lilinjie8@huawei.com
Subject: Re: [PATCH v2 RESEND 1/2] ARM: spectre-v2: Fix potential missing
 mitigations
Message-ID: <20251028182052.nrRad87D@linutronix.de>
References: <20251016121622.8957-1-xieyuanbin1@huawei.com>
 <20251028162005.bLKC89Hy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251028162005.bLKC89Hy@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_112057_870766_EE66689F 
X-CRM114-Status: GOOD (  14.31  )
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

On 2025-10-28 17:20:06 [+0100], To Xie Yuanbin wrote:
> On 2025-10-16 20:16:21 [+0800], Xie Yuanbin wrote:
> > Over the past six years, there have been continuous reports of this bug:
> =E2=80=A6
> > 2019.3.19 https://lore.kernel.org/all/20190319203239.gl46fxnfz6gzeeic@l=
inutronix.de/
> >=20
> > To fix it, we must check whether mitigation are needed before enabling
> > interrupt(with PREEMPT) or before calling mm_read_lock()(without PREEMP=
T).
> >=20
> > Fixes: f5fe12b1eaee ("ARM: spectre-v2: harden user aborts in kernel spa=
ce")
>=20
> Hmm.
> I was moving things back in 2019 but things shifted and this is no
> longer required. If I apply both patches (of yours) then it sends a
> signal with disabled interrupts which breaks my PREEMPT_RT case.

Now I got my things together.
LPAE enables interrupts early in do_page_fault(), therefore accessing a
kernel address from userland triggers the warning in
harden_branch_predictor() before sending the signal.

!LPAE does do_bad_area() -> __do_user_fault() and does not trigger the
warning in harden_branch_predictor() because the interrupts are off.=20
On PREEMPT_RT this leads to an error due to accessing spinlock_t from
force_sig_fault() with disabled interrupts. Therefore I did enable
interrupts early and would need end up with the same warning as in the
LPAE case.

Now Russell wants to keep interrupts/ preemption disabled for the
address > TASK_SIZE for the entire page fault path to so that
harden_branch_predictor() works properly.

If we need that, then it won't work with the preempt-disable suggestion
I had=E2=80=A6 We don't send SIGKILL because userland might want emulate pa=
ging
for the kernel regions. Okay.

I guess the requirement is to invoke harden_branch_predictor() on the
same CPU that triggered the page_fault, right? Couldn't we then move
harden_branch_predictor() a little bit earlier, invoke it in the >=3D
TASK_SIZE case and then enable interrupts if they were enabled?

That would make me happy ;)

Sebastian


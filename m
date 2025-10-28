Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC9DCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 16:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8h7AOYDZruOfs1ULNgBL4IWEkyKGXKFfNiYjMrc4/w=; b=No1cfGaWY0542T5gWm4Ql02O8W
	3kpSVJnj0sZorYZTEolJm0he/Y/RLq0E70lD6HtsmX/IaWnDGjlR+T95k/4cGI9dHYDqrewLB3kfB
	LEXJPjj7XtO308+2xhztg9yRjrAlCQCLSBitiau6gorfk5idRRgwfXFbw/lUIcVeGPO57spQzpW6h
	Zu36xYHzxVUdAuFDodOuZlS6Eo7ikNQZbhNd7mRV+l+d8VpCU6W96QCxw8U5tFSy41R/Tx7kFYTBR
	Dhibvm5ZrbPnj/GVUMYyz8fGp8RPD8w4Yz8j+RD85SBrtkq5dhljxrQjTBBFsAdOrfEmNFTn73ozr
	s8w6YdIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmQg-0000000GImH-48SS;
	Tue, 28 Oct 2025 16:20:14 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDmQd-0000000GIl1-380k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 16:20:13 +0000
Date: Tue, 28 Oct 2025 17:20:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761668406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z8h7AOYDZruOfs1ULNgBL4IWEkyKGXKFfNiYjMrc4/w=;
	b=SxROkConP9XTvM+6UcqbFbfFG78aNUyTCpFVZinZ32QvxMYSxBC5LskEG2FnZhmB/zl2Ph
	6QIvsGmmQH2N9iSipXZUB/rydS2bACJTNJCFOszHgHlmtL6lBMpHJNkY6whsmYS5MUHuUM
	ei7tzNQRFSlFeEYxJPUrWJZamyVRsFvqViR40WMHth9pdBToyqT4LhWkeGQdwKKKuL4MMb
	cRHOxiIeG9Mt27/lOZkmSahM2MwK0mswqTFbix6gIpC0K7Oym4x4ze63/hLAd2ZjePoLcz
	onvd7YFDjFCTnHw+zXhMuG51XRRg2jy8BqUr09el2clKKHCXuDYFZ5amG2uEbA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761668406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z8h7AOYDZruOfs1ULNgBL4IWEkyKGXKFfNiYjMrc4/w=;
	b=bTXt80ocon1BwX7ceW+7vM2bt6Yale++XWnLf8HNGx9JwanQ8xpWYveiV6MHyI4RC/Alt3
	mwczZncsVxqlBgCw==
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
Message-ID: <20251028162005.bLKC89Hy@linutronix.de>
References: <20251016121622.8957-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251016121622.8957-1-xieyuanbin1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_092011_925736_0E8B68F4 
X-CRM114-Status: UNSURE (   7.52  )
X-CRM114-Notice: Please train this message.
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

On 2025-10-16 20:16:21 [+0800], Xie Yuanbin wrote:
> Over the past six years, there have been continuous reports of this bug:
=E2=80=A6
> 2019.3.19 https://lore.kernel.org/all/20190319203239.gl46fxnfz6gzeeic@lin=
utronix.de/
>=20
> To fix it, we must check whether mitigation are needed before enabling
> interrupt(with PREEMPT) or before calling mm_read_lock()(without PREEMPT).
>=20
> Fixes: f5fe12b1eaee ("ARM: spectre-v2: harden user aborts in kernel space=
")

Hmm.
I was moving things back in 2019 but things shifted and this is no
longer required. If I apply both patches (of yours) then it sends a
signal with disabled interrupts which breaks my PREEMPT_RT case.

The requirement is to invoke the mitigation callback of the right CPU.
What about disabling preemption before getting the callback and doing
the invocation?

Sebastian


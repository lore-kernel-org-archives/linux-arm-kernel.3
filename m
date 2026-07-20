Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BEB1C44528
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 07:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOIkjNoxbfIFYVHLI4yFssH6Y/D7YgIxGoQqmFG14oA=; b=lcoSzMGxxlSGe8Wml4rZyVRfad
	gPDlLUZcArg0DcU7Tcy5Yz1sWfm8WLtk2J0x/M7H5IrRkw2zaUeoy36ZVc77x6JuU9p/LV0T0Jfa6
	xTpPeDpcX1dW2RHD0yoM/gesP87TBSc0Yd61c8UIP/IQdqxDwCBHUo5fe/qLYHogL7832MVY0bVA0
	Hw9TdN/guU6SU7ZneMR8UzjLRjPViQrLelzEjgcLP9oEKKGX4HMSndG6f5fD4h3h/08KksO/LCoWl
	NAB2LGCyx0abRXt/Ihp0LNWhDCgPQ2zZcvp7CJ/NYovnLPFn2WA9yq8fYTDmjP1D9vcoN8GZnGTb5
	AbcG2ZJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliOd-0000000659V-11Uh;
	Mon, 20 Jul 2026 07:26:39 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliOC-0000000655x-0Gy3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 07:26:13 +0000
Date: Mon, 20 Jul 2026 09:26:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784532368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UOIkjNoxbfIFYVHLI4yFssH6Y/D7YgIxGoQqmFG14oA=;
	b=QJ/OLNIyW/TJH6J6PqTmIYtUt9lmVMlIdgree2nKfMNGTc36QnTnHmf+sKdvE027+YDb8M
	1UQQpgFpcfcJ1MHRAktDNuoTd5WolIjay8KqgS2tyMu/09fD1PYaMTEYLXAEsF25IyRgAY
	UlLzkl1ZCqFBPHBl0Fc5jr88c5wdZY9ZxEnBQa6YwlfQKoLed31SMWKYMU8QbXbmgszL/i
	4ogU+9lctCBtAriK35nHSaQxNdnUiFNaSnbhIO/NJB8Tc5r9OuZQ7p9DC7QA3Hvx2iRB+g
	LSEcFjdoJcJ4z8T0ovUjFlAbSWhkeE51tQT8uhOsSuNkN25Y3B5b1roLaHUpTA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784532368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UOIkjNoxbfIFYVHLI4yFssH6Y/D7YgIxGoQqmFG14oA=;
	b=7MJS/yYaGQqNlruweePnxz+qv2CAtkdQic4wCsA+gkGoVgGutUGPHgTgTXLeXKBaW9mZ0f
	y/l5ATAdtkpM4YAA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	linux-rt-devel@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: select HAVE_POSIX_CPU_TIMERS_TASK_WORK
Message-ID: <20260720072606.8KxzuDAj@linutronix.de>
References: <20260718214515.11275-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260718214515.11275-1-kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_002612_277675_77909EC0 
X-CRM114-Status: UNSURE (   8.22  )
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

On 2026-07-18 23:45:15 [+0200], Karl Mehltretter wrote:
> Commit c6e61c06d606 ("ARM: 9463/1: Allow to enable RT") enabled PREEMPT_RT
> on ARM but did not select HAVE_POSIX_CPU_TIMERS_TASK_WORK. This leaves
> CONFIG_POSIX_CPU_TIMERS_TASK_WORK disabled, so CPU timers expire in hard
> IRQ context.
=E2=80=A6
> Fixes: c6e61c06d606 ("ARM: 9463/1: Allow to enable RT")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

> Found with a self-hosted syzkaller instance patched to fuzz kernels on
> QEMU's versatilepb machine (ARM926EJ-S, ARMv5TE). Runtime-tested before
> and after the change on that setup, and compile-tested mps2_defconfig
> with PREEMPT_RT (NOMMU, CPU_V7M).

I obviously got the rules confused while dropping the KVM patches.

Sebastian


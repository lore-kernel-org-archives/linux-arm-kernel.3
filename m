Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0AEBCD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 08:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bfKiKVq3hU3pjcBqUpBBITy3boOVHoqwPFPh0Ujjzk8=; b=P7tP9S9H3WZui4yPc9fnu5Pjox
	73ep/GFSTj/5enAaBv9GoRkDp+S90ozxt6+irDwqon9ffnM3yVwF7Veij999B5yoR2zqNHQA1a/X+
	tgx2RUBNVTiHh5BkFFCLxudQdZ1NqFPM0iW+crU/MB1SgZVDCla8xtrAPwKPQ2PmDynGYNjXXR4FZ
	HYPap83R6Tf8yIcTSX2rmLsx0B04pzDSf6z6NMe4x6LldHs0Md+PFa5hKrX2WnxeElpiOVm/eMLWf
	aZ8El9vMrE7UaozZXODliZT8dersQoYATULBbA204vyx0ie3j4C2oENp1NhKGeXxZ0J6m6g/0ANyd
	n8tJDzXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7us-00000000pgz-1g2T;
	Thu, 18 Jun 2026 08:16:02 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7up-00000000pgZ-47pj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 08:16:01 +0000
Date: Thu, 18 Jun 2026 10:15:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1781770556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bfKiKVq3hU3pjcBqUpBBITy3boOVHoqwPFPh0Ujjzk8=;
	b=r0y5D7NJYb4QTTOEoORJ6biEUdtaD8LliAbG4rfJBSYfP0u/4miH20xoNkr3VAJVDDr+hC
	2kw2RkVTQhqwfZ3NbbLjKlVNdqpSNWt05bqc2Cmou0QG4NwzmxuSAv0cZtsEvMfp4bst5e
	YyY6mDGnP6vXPicLqUmAjUycpPhx6b0CFwsKA5m1cGmF0wx5zPIVU5pypGLf2IpVyj8IWg
	4Dz+Ji6QZpVMFvIvCkBOWOtIp/rftXIsEtbwCmDputtdUXO6yOxWfmrHJvZAaBYGS/oAE+
	XQgLfSbYtvGuLL6Bjvyv9y1vmxnDnBRfP8kv1iniZV3g3lCp9K8AqP7ya9QmAw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1781770556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bfKiKVq3hU3pjcBqUpBBITy3boOVHoqwPFPh0Ujjzk8=;
	b=5CPeMOk3GIo1h9V/CqjAAL8dMVouMDzCVxeFdnTfaVIMu/N/0RPcwSBhdwm/hFObeI/2/w
	39FONTNnrS0xcEAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>, Mark Brown <broonie@kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn
Subject: Re: Question: SPEAr PLGPIO irq_enable on PREEMPT_RT and regmap
 updates
Message-ID: <20260618081554.zifCwv4I@linutronix.de>
References: <20260618023418.213453-1-runyu.xiao@seu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260618023418.213453-1-runyu.xiao@seu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_011600_174705_CC091830 
X-CRM114-Status: GOOD (  17.12  )
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

On 2026-06-18 10:34:18 [+0800], Runyu Xiao wrote:
> Hi,
Hi,

=E2=80=A6
> The repair I am considering is to keep the gpiolib resource updates in
> the fast irq_enable/irq_disable callbacks, but defer the actual PLGPIO
> IE/EIT register writes to irq_bus_sync_unlock(), after the IRQ core has
> dropped desc->lock.  The driver would keep per-line shadow state for:
>=20
>   - IRQ disabled/enabled state
>   - pending IE update
>   - edge direction state
>   - pending EIT update
>=20
> and then synchronize those shadow updates from irq_bus_sync_unlock()
> under a mutex.

Not sure how this will look like, but okay. I was looking at making the
a lock a raw_spinlock_t for fast_io. Since it is just a read and write
it shouldn't be a problem. But then there is the regcache and the sync
of many registers might be painful. The actual problem is the type MAPLE
and RBTREE which have an allocation in their write callback. That is a
no but the FLAT ones should work since there is just one alloc during
init. Well, wouldn't it be for the lock that is acquired during the
callback.

I don't think this is required given that it is init time so
holding the lock shouldn't be required. This was introduced in commit
fd4ebc07b4dff ("regmap: Hold the regmap lock when allocating and freeing
the cache"). This change broke gpio-104-idio-16.c, pio-pci-idio-16.c,
pio-pcie-idio-24, gpio-ws16c48.c and pinctrl-apple-gpio.c.

So unless there is something that I miss=E2=80=A6

> In other words, the fast callbacks would only update local shadow state
> and call gpiochip_enable_irq()/gpiochip_disable_irq(), while the sleepable
> regmap writes would be batched into the irq bus sync phase.
>=20
> Does that sound like an acceptable direction for SPEAr PLGPIO, or would
> you prefer a different fix, such as changing the underlying syscon regmap
> locking model or handling only the IE register path?
>=20
> The draft patch I have locally is roughly:
>=20
>   pinctrl: spear: defer PLGPIO IRQ updates to bus sync
>=20
> and it changes only drivers/pinctrl/spear/pinctrl-plgpio.c.
>=20
> Thanks,
> Runyu

Sebastian


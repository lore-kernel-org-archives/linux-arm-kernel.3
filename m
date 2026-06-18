Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D608CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 07:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SjiRzYxjlgb1391C0ySksvTAaXp/63Cihk5oFrsX1z4=; b=DUDEQ2bdwhuyelfaXQGpW45eBi
	RVRsHIU9rLAyI5SSui49MYmSCvewMkBbNzNB4I+/2T3UjQAiSWo5VBJWdkuMCtmxdrB66/EgXaM5S
	c3htzrNkRQ54wav0Wzq9yjzfkHwp5Ld2Tvf78748YFAeaLhyakttK4uI80KnAOCkkROXipWG8WVAm
	87U5K3m9tbXPurQEAPwa+5nwZ4e1wbK0qGGu4cVmlv9k7EykrbISE3K937vkBiPzsLQ5dYv6b2se5
	aRNX/szczKs3SYCUE7j6IjHIIoCP9G3OH3zV5aexNFdafVSLYT5xYDObKfkODXwWXMPY1EkMNkrDk
	znrjZ6qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7Mc-00000000msB-10y3;
	Thu, 18 Jun 2026 07:40:38 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7Ma-00000000mre-0YW2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 07:40:37 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8453a67659fso313175b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 00:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781768435; x=1782373235; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SjiRzYxjlgb1391C0ySksvTAaXp/63Cihk5oFrsX1z4=;
        b=FLmZkjfWKZPcdkmcEIq5asC5twYDgLkeBgI56c976dBfQ2CQgTF7niaGrGrc+wNFsL
         f4BXIkn2tfDpNiKk2jdmTj+pJ9Du31fC6Cyu81tHFa2rOMLrhOxkRv1EMHLdYHiHT3hp
         CNCSGDIZt8X7AbyFoshpREZIBZmdGUyvBSPxt7RFZAaK9lRR+dd7GOTpT5b2Wrvf+DTy
         PGXecbpp9YKC+neUtGkGSUfKHAvnUVlk5QIAAU63lCXSxtUwTHew9Ox+xPPCna48O3uz
         em4uK7rObYjZbr14P5H8UE0YWG90K1MOkriyE6WFgSkzhtv5yO2ZVvwiFBxrnUUe6KZ+
         DH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781768435; x=1782373235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SjiRzYxjlgb1391C0ySksvTAaXp/63Cihk5oFrsX1z4=;
        b=swajGAWhV325Q7ZmulAHwnq1YxJwhhOH0/ztFlFIhARriOyRM45EWDRUiORDtrQe0F
         SitsEBPbSINrTA4jdRucguUgIf80qyksLC9WQXF9aloqen1pIreHimXruvcrmyfIXkwC
         Ll1h439Kid7rAST/AQLhF8LXxfxysZc5C1oeg+emLWCTpKvWBlRpa4REMMl3FWj57z08
         9qCZpicTIhsBTa2oE8dZB+lYrt2MFyg+t5M7hlgs7XXj3AFnM8H3EB7RyVbPUSqxfFqQ
         q+hmVgclMK4GbQKcJUjCHV4LcsVcdP1pTThh7XMAJ5oGHbvpTkBvrL8HUKnOouvtR55B
         qihQ==
X-Forwarded-Encrypted: i=1; AFNElJ+6zsZwKAyRHHqqxQlrfijMGOK+k6Crz+IbrJoryqcT0yJhQajODaqg8RamSE4DbUq9mCg1XU8P5vOsxFFT5Ygf@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/EVIYw0KE8c3UpeDlASgODR16bfK2nOubvixmKkbDO9CrU+pv
	sjG/DMVMF5wgdpl5GB6q5a9r02qUikDweb5Zd+i2dCG+9dE3JZ5FmzOfPZpiqRgeQKk=
X-Gm-Gg: AfdE7cmXLwj0l4bMHXweEr9eGzemoGuioEiS1E6J+A4cAOoI3ldryrlCeMLGgZLj2zG
	7BVzF2s/iygyPpM6ny3pt4nNkYzfmdsx3NpynHMUym+9pM8avUFLaZoIAHNNwsjEe8M1TzZcbiB
	pAtgFRk4Y5c0QStYJA72WfjKbBv/8BFJmGtuHG0HmkBT8l+JhTa60M9wqQWlurJqOaXKn6HQZJ+
	vm8GEmCb82ZH9XapnoVxrIKKv50SOZr/ddBzfazlH6sYbbbZaP3shfjh+orThOLOiF/S2c/lMgC
	bZznF/hIHq+fszJS/wppfrUKDAUblsiO5VLI2Ayeu8zAuIem2vDxuyvrrgM+5ZU143gdzltfPEu
	/E7rrTWjJWFzSz0zPjEZpFXKvdRWXoC9hptg3M4qLfZ65wnLO0igE8uaW5c0tjvXls5xccCMayJ
	AJL2SjcM8Rhbkp
X-Received: by 2002:a05:6a00:cce:b0:842:2419:6bfe with SMTP id d2e1a72fcca58-8453b0df8eamr2701471b3a.7.1781768434721;
        Thu, 18 Jun 2026 00:40:34 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b020b53sm17785056b3a.47.2026.06.18.00.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 00:40:33 -0700 (PDT)
Date: Thu, 18 Jun 2026 13:10:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>, 
	Herve Codina <herve.codina@bootlin.com>
Cc: Viresh Kumar <vireshk@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev, linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn
Subject: Re: Question: SPEAr PLGPIO irq_enable on PREEMPT_RT and regmap
 updates
Message-ID: <sj3oxg5ymbe2ac2geznsidsxz23rkqzqc4ir3pkjc7bsrzaorw@cw3waaj6xxkx>
References: <20260618023418.213453-1-runyu.xiao@seu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618023418.213453-1-runyu.xiao@seu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_004036_206467_7A56638A 
X-CRM114-Status: GOOD (  23.36  )
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

+ Herve (the last guy to work on this driver).

On 18-06-26, 10:34, Runyu Xiao wrote:
> Hi,
> 
> While auditing GPIO/pinctrl irqchip callbacks, our static analysis tool
> flagged the SPEAr PLGPIO irq_enable path, and we manually reviewed it
> against the current tree.
> 
> The path is:
> 
>   irq_startup()
>     -> plgpio_irq_enable()
>        -> gpiochip_enable_irq()
>        -> spin_lock_irqsave(&plgpio->lock)
>        -> plgpio_reg_reset()
>        -> regmap_update_bits()
> 
> On PREEMPT_RT, plgpio->lock is a regular spinlock_t and can become a
> sleeping lock.  Since irq_enable/irq_disable can be called from IRQ
> management paths while the IRQ descriptor raw lock is held, taking that
> regular spinlock there looks unsafe.
> 
> A minimal Lockdep reproducer preserving this irq_chip::irq_enable carrier
> reports:
> 
>   BUG: sleeping function called from invalid context
>   irqs_disabled(): 1
>   plgpio_rt_spin_lock_irqsave
>   plgpio_irq_enable
>   request_threaded_irq_probe_path
> 
> My first thought was to convert the PLGPIO register lock to
> raw_spinlock_t.  However, that does not seem sufficient because the IE/EIT
> updates go through regmap_update_bits()/regmap_read()/regmap_write().  For
> the syscon/MMIO regmap used here, regmap may still take its own regular
> fast-IO lock unless the regmap was created with use_raw_spinlock.  So a
> raw_spinlock_t conversion in the PLGPIO driver alone may just move the
> PREEMPT_RT problem one level down into regmap.
> 
> The repair I am considering is to keep the gpiolib resource updates in
> the fast irq_enable/irq_disable callbacks, but defer the actual PLGPIO
> IE/EIT register writes to irq_bus_sync_unlock(), after the IRQ core has
> dropped desc->lock.  The driver would keep per-line shadow state for:
> 
>   - IRQ disabled/enabled state
>   - pending IE update
>   - edge direction state
>   - pending EIT update
> 
> and then synchronize those shadow updates from irq_bus_sync_unlock()
> under a mutex.
> 
> In other words, the fast callbacks would only update local shadow state
> and call gpiochip_enable_irq()/gpiochip_disable_irq(), while the sleepable
> regmap writes would be batched into the irq bus sync phase.
> 
> Does that sound like an acceptable direction for SPEAr PLGPIO, or would
> you prefer a different fix, such as changing the underlying syscon regmap
> locking model or handling only the IE register path?
> 
> The draft patch I have locally is roughly:
> 
>   pinctrl: spear: defer PLGPIO IRQ updates to bus sync
> 
> and it changes only drivers/pinctrl/spear/pinctrl-plgpio.c.

I haven't worked on this for a very long time now (15 yrs). There are some
people who use this hardware, and so it is not removed until now.

Also I am not sure if RT kernel is a valid use case here for this SoC family.

-- 
viresh


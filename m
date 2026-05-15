Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5820BCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 07:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5i3jr/Ze5LIkO9MuiHcaAM6dwhzewxwm2J6/ovcRNo=; b=cYbDMjyIjpBvkoj1U8Gxf86dhh
	fdaKrVNxv0GV/3WXqkBrCD/qjlZYtmqhXMOqFspV8Me2qFmrgCGEpzrA0Bmr6iQRDJza7bTVKfvpF
	IFf5QK+ZdzWxsWDdvl+DgSEWRv4eghXdGjVMMkszVZVuvk22XAapU/u3IDVDwvugqzZMtLNUV1+1c
	YBbo9WUwwCJOSuTTqoC6EaKULE/aaTg5Zef9oFKJyL7tGK/raf5UejCOXPnASsYxyXXmLdme2hald
	e5M6mwOoKV8ZfJEd6t2LhuCSXeSDfzf0J2HIllaalywFTOqrlSJdZG/lxEyMqh9uHZ7rNvE0tOeh6
	084uAamw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNnMy-00000007fKa-3Ytd;
	Fri, 15 May 2026 07:54:04 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNnMv-00000007fJW-3Zjb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 07:54:03 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1778831636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P5i3jr/Ze5LIkO9MuiHcaAM6dwhzewxwm2J6/ovcRNo=;
	b=qtpUpvocYMS6ga/mG6+yHhgkECgfN4/AWHu4OEWfwDxipL5TsdQ5X3k+V+I7b14vol/Ctv
	LpOvxyM8j8DcbYElrkoCF4USg0Lz7TKZMixJ4X1GEElr76JRimy/rGExHvpN/mrdb65GAW
	Gc77mhFCmV1DUq3wnCiPLUmslcUvKlBQpEPW+dzhPRlGUMbflE3JJl5GUP5p/3x3KtYgMx
	7ZEghSFNU3wSI5T898bHC4ltszzph/Mv7J+ibXEOR2XJ56jj7LNt0FNxcZunVNUB6npV9g
	XpgT7vJpFDejIJEdJDPY6myZJhftYdOLHgFgzvdR/lv4jJVSrKgRs/ww97oMGw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1778831636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P5i3jr/Ze5LIkO9MuiHcaAM6dwhzewxwm2J6/ovcRNo=;
	b=8QaW9UMC9D6WJDmRgFabqQSsEY7fzsi0K5cWTpOqVGgiQzDFkqENkkeARQkt0ciOL8/adq
	qTcPuuNMZL70cODQ==
To: Krzysztof Kozlowski <krzk@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andy
 Shevchenko
 <andriy.shevchenko@linux.intel.com>, Thomas Fourier
 <fourier.thomas@gmail.com>, Kees Cook <kees@kernel.org>,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, sparclinux@vger.kernel.org, Peter
 Griffin <peter.griffin@linaro.org>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, =?utf-8?Q?Andr=C3=A9?= Draszik
 <andre.draszik@linaro.org>,
 Alexey Klimov <alexey.klimov@linaro.org>
Subject: Re: [PATCH tty v4 2/6] serial: Replace driver usage of UPF_CONS_FLOW
In-Reply-To: <1a5abd2e-e9ab-4a48-94c2-5e082f57adde@kernel.org>
References: <20260506121606.5805-1-john.ogness@linutronix.de>
 <20260506121606.5805-3-john.ogness@linutronix.de>
 <87lddvy2dl.fsf@jogness.linutronix.de>
 <1a5abd2e-e9ab-4a48-94c2-5e082f57adde@kernel.org>
Date: Fri, 15 May 2026 09:59:55 +0206
Message-ID: <87wlx56rcc.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_005402_032173_6FA57660 
X-CRM114-Status: GOOD (  15.31  )
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

On 2026-05-13, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> (This email is particularly directed at the Samsung folks.)
>> 
>> Responding to Sashiko:
>> 
>> https://sashiko.dev/#/patchset/20260506121606.5805-1-john.ogness%40linutronix.de
>> 
>> On 2026-05-06, Sashiko wrote:
>>>> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
>>>> index e27806bf2cf3e..2f94fc798cffb 100644
>>>> --- a/drivers/tty/serial/samsung_tty.c
>>>> +++ b/drivers/tty/serial/samsung_tty.c
>>>> @@ -319,7 +319,7 @@ static void s3c24xx_serial_stop_tx(struct uart_port *port)
>>>>  	ourport->tx_enabled = 0;
>>>>  	ourport->tx_in_progress = 0;
>>>>  
>>>> -	if (port->flags & UPF_CONS_FLOW)
>>>> +	if (uart_cons_flow_enabled(port))
>>>>  		s3c24xx_serial_rx_enable(port);
>>>
>>> This isn't a new bug introduced by this patch, but does this code
>>> result in a recursive spinlock acquisition and deadlock when console
>>> flow control is enabled?
>>>
>>> The serial core framework calls port->ops->stop_tx() with the
>>> port->lock spinlock already held. When uart_cons_flow_enabled(port)
>>> evaluates to true, s3c24xx_serial_stop_tx() invokes
>>> s3c24xx_serial_rx_enable().
>>>
>>> Looking at s3c24xx_serial_rx_enable(), it unconditionally attempts to
>>> acquire the exact same lock again:
>>>
>>> static void s3c24xx_serial_rx_enable(struct uart_port *port)
>>> {
>>> 	struct s3c24xx_uart_port *ourport = to_ourport(port);
>>> 	unsigned long flags;
>>> 	...
>>> 	uart_port_lock_irqsave(port, &flags);
>>> 	...
>>> }
>>>
>>> Because spinlocks are not recursive in the kernel, it appears this
>>> sequence would cause an immediate deadlock on the same CPU.
>> 
>> Although out of scope for my series, the reported issue is real. Perhaps
>> something for Krzysztof or Alim to look into.
>> 
>>>> @@ -493,7 +493,7 @@ static void s3c24xx_serial_start_tx(struct uart_port *port)
>>>>  	struct tty_port *tport = &port->state->port;
>>>>  
>>>>  	if (!ourport->tx_enabled) {
>>>> -		if (port->flags & UPF_CONS_FLOW)
>>>> +		if (uart_cons_flow_enabled(port))
>>>>  			s3c24xx_serial_rx_disable(port);
>>>
>>> Similarly here, s3c24xx_serial_start_tx() is also called with
>>> port->lock held, and s3c24xx_serial_rx_disable() will attempt to
>>> acquire port->lock again:
>>>
>>> static void s3c24xx_serial_rx_disable(struct uart_port *port)
>>> {
>>> 	struct s3c24xx_uart_port *ourport = to_ourport(port);
>>> 	unsigned long flags;
>>> 	...
>>> 	uart_port_lock_irqsave(port, &flags);
>>> 	...
>>> }
>>>
>>> Could this pre-existing locking issue in the samsung_tty driver be
>>> addressed so that the rx enable/disable helpers do not try to take the
>>> port lock when it is already held by the caller?
>> 
>> Also legitimate. But out of scope for my series.
>
>
> Thanks for letting us know. Deadlock did not happen so far, so something
> is missing in Sashiko's report. :)

Nothing is missing. I am guessing you never use console flow
control. The deadlock is clearly visible:

->stop_tx() (always called with the port locked)
  s3c24xx_serial_stop_tx()
    s3c24xx_serial_rx_enable()
      uart_port_lock_irqsave() (DEADLOCK!)

John Ogness


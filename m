Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285D6C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 07:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CaUBwKIEL6gYu/LhMMd/q2hSFrXFhJp+PTp1JhKEikg=; b=a7az99BdnPv31SrxC7Imf2KQ4r
	MsHSz7rqAP+HT0tPZqhUDMTVS/xGHq66sXaoEpZpCyG2CbAt6/xh19TekgYb+o1PdJc592Hkde2Hz
	uVoU4PxY0Z/z0jS25ru6VtXXyBz7SVHeLOXu1ILSh3AwucfTVCQUdVBE9oTSjgvBZl13EY1f+bmxi
	+ILfpcffAdxWxWAmp2BtHhVjz5prY5PFQ/2t0GAOlnZ7jCqiRvXjqvaaEC/Yg/qyno2z/bb01+a0Z
	HYobQ+gTJZdhhuDlyL1iAziRkP9qjRbog30w+D/iBflxlvbwVCh3GSxuJyeKxBjJ9LlpUbMKczA2D
	5En+UGtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMiz5-0000000CoKf-0D90;
	Wed, 04 Jun 2025 07:56:27 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMiv9-0000000Co1C-2WSV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 07:52:24 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749023540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CaUBwKIEL6gYu/LhMMd/q2hSFrXFhJp+PTp1JhKEikg=;
	b=BBG70Qvg7fI5r/SBmAdFEu06d3IMuZuMq4Vi4Lo91jbiWSPT7QqEEJh+PcnjWMELb3Szjd
	L9oSzQStJ7sR+vBQx+M43+ranfV/BjiI3awSQP82ZKk4QSDrp5WFux8msZCeTqaMftxl0/
	6cxj49JeWUEZ4ROxvGj2ICjVObu4OTzq0j3CLK4BBtpOOHtzYqtcT0DP4VQV/zr69m6Q3D
	6RzjW/qdVIxatvS5ptEDE2r8axsDlRqcQ17JGFSRQcoND5lznMW1HqvdUREBSI6T/aZSUZ
	W1WH6SbYnCQAXv+iKOO1e4IkPBoEODztXQfXDnCPlFL5p7RZE86kcUppeJTxYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749023540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CaUBwKIEL6gYu/LhMMd/q2hSFrXFhJp+PTp1JhKEikg=;
	b=psY2YnPHoLBZUoEQmkEOMxqILHQXXXfL7mmtNEiRqoU8yoAAegO6WTHBsHdrhrRw0Wlcp3
	ZOLksnkr5Bqu+jDg==
To: "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com>, 'Michael Kelley'
 <mhklinux@outlook.com>
Cc: "pmladek@suse.com" <pmladek@suse.com>, 'Ryo Takakura'
 <ryotkkr98@gmail.com>, Russell King <linux@armlinux.org.uk>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
 <linux-serial@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "Toshiyuki Sato (Fujitsu)"
 <fj6611ie@fujitsu.com>
Subject: RE: Problem with nbcon console and amba-pl011 serial port
In-Reply-To: <TY4PR01MB13777674C22721FCD8ACF4FCCD76CA@TY4PR01MB13777.jpnprd01.prod.outlook.com>
References: <SN6PR02MB4157A4C5E8CB219A75263A17D46DA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <OS7PR01MB13775FE1A20762D1EA4A38D0ED76DA@OS7PR01MB13775.jpnprd01.prod.outlook.com>
 <84y0u95e0j.fsf@jogness.linutronix.de>
 <84plfl5bf1.fsf@jogness.linutronix.de>
 <TY4PR01MB13777674C22721FCD8ACF4FCCD76CA@TY4PR01MB13777.jpnprd01.prod.outlook.com>
Date: Wed, 04 Jun 2025 09:58:19 +0206
Message-ID: <84tt4wndu4.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_005223_799650_AA15E5F5 
X-CRM114-Status: GOOD (  18.40  )
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

On 2025-06-04, "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com> wrote:
> This is a proposed fix to force termination by returning false from
> nbcon_reacquire_nobuf when a panic occurs within pl011_console_write_thread.
>  (I believe this is similar to what John suggested in his previous reply.)
>
> While I couldn't reproduce the issue using sysrq-trigger in my environment
>  (It seemed that the panic was being executed before the thread processing),
> I did observe nbcon_reacquire_nobuf failing to complete when injecting an
> NMI (SError) during pl011_console_write_thread. 
> Applying this fix seems to have resolved the "SMP: failed to stop secondary
> CPUs" issue.
>
> This patch is for test.
> Modifications to imx and other drivers, as well as adding __must_check, 
> will likely be required.
>
> Michael, could you please test this fix in your environment?
>
> Regards,
> Toshiyuki Sato
>
> diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
> index 11d650975..c3a2b22e6 100644
> --- a/drivers/tty/serial/amba-pl011.c
> +++ b/drivers/tty/serial/amba-pl011.c
> @@ -2577,8 +2577,10 @@ pl011_console_write_thread(struct console *co, struct nbcon_write_context *wctxt
>  		}
>  	}
>  
> -	while (!nbcon_enter_unsafe(wctxt))
> -		nbcon_reacquire_nobuf(wctxt);
> +	while (!nbcon_enter_unsafe(wctxt)) {

I realize this is just a test patch. But for the real patch, there needs
to be some comment here about bailing out. On panic, the driver is
leaving the clock enabled and not restoring REG_CR. At a quick glance
this appears to be a bug. So the comment is needed to make it clear that
the driver is exiting on purpose without proper completion. And perhaps
also mentioning why this is safe during panic. Thanks.

> +		if (!nbcon_reacquire_nobuf(wctxt))
> +			return;
> +	}
>  
>  	while ((pl011_read(uap, REG_FR) ^ uap->vendor->inv_fr) & uap->vendor->fr_busy)
>  		cpu_relax();

John Ogness


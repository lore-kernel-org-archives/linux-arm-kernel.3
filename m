Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7386FCC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 17:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZUoUIhvbfC88KaoKHqYu/qRtIDZmc0/E3twtrLwIIw=; b=IZsWbdbFKBy3Pn6KtamEbEud9C
	zPETWnaCvq2l303uLDic0r02BjShylfGL+Jq/1AV0yJmTcQKBhI3CTsA2e7M3zOSJN5VjuKqbr2HW
	OHS2RMdhbLYizgbLk7qHEbYP8jECJOVXzphUikACRjsNUeC74248w8AJK4L+Fe1UV8+IRgjdifdcQ
	+BwyWVdqtKUxq3ZHcuhMFJTnh2EXyWzaXevoLBpeks/yfT+XO4IX2X7+ft57YPxj7M2E+AAZTpqIt
	IHX5JAlnCkrqqGMwp23xioDrFMdTiCKP+sszj9koRpQd7Kf3LKTDoxYWwaExfMg68QUsXJNwfUA3L
	O3ULai8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlYQ-00000003XbT-4ANR;
	Fri, 16 Oct 2026 17:17:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlYP-00000003Xa2-28he
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 17:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4ZUoUIhvbfC88KaoKHqYu/qRtIDZmc0/E3twtrLwIIw=; b=ft1e8iy4BdodMqSrO0VgNd9gWs
	4FPlisJfRwv0CygdC6AgQqiBoryrjRhglvN9GzOIXk+V4wg9yopAacC48SyhEiXTnI/oH8d+4uinq
	YlkHzsllL9sb30JjRVWQkg1NMEnb/G+KlCaHMdEBIV3ByqLpkmXmy07XcZs2FrPhozh87yGbFmzM2
	nleHHeE2W0KwFf9CFQEi/CroyEDUV3Fn5yUEj+eLCBPuHhg8A/jhgFVnU/QlenKTOmAm5niYf8vmZ
	PtQhP5JA5EvqE6USLlH51drqLJi0IEi3EFMmEEkDAsFuFTnLeF2quDV0XSq67idqSEJUlvv8U9jNZ
	hwcHtNrw==;
Received: from mail.hugovil.com ([162.243.120.170])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHlYM-00000001mn2-2u4j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 17:17:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=4ZUoUIhvbfC88KaoKHqYu/qRtIDZmc0/E3twtrLwIIw=; b=Y5jyN7+6fkrqvRGCCNcN/Vv9PN
	/YKyPjNLZhH3ACLt6EV0NMevlYRKfyhgXmwj+071FePYm88/hsCj3z6hvDwiysuu27EKKu27xroek
	WeC+SSVAzvq/W9ZPJD+AMVMNx4PyQG5hR+/WKB1L/Ox3ZVDxFkTouOOE4/KnOwAV8s0s=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1xHlYF-000000006as-28rg;
	Fri, 16 Oct 2026 13:17:01 -0400
Date: Fri, 16 Oct 2026 13:17:00 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Jiri Slaby" <jirislaby@kernel.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 "Hugo Villeneuve" <hvilleneuve@dimonoff.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev
Subject: Re: [PATCH 1/2] tty: serial: remove hub6 multiport support
Message-Id: <20261016131700.b93fa4f7e31f3d2355d4a132@hugovil.com>
In-Reply-To: <5743b352-ffa2-4d38-9abb-a06085dea56d@app.fastmail.com>
References: <20261016130328.1037616-1-arnd@kernel.org>
	<20261016115604.a89ef44986bb3620c327feaf@hugovil.com>
	<5743b352-ffa2-4d38-9abb-a06085dea56d@app.fastmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam_score: -2.0
X-Spam_bar: --
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_181710_778945_9797F300 
X-CRM114-Status: GOOD (  19.84  )
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

Hi Arnd,

On Fri, 16 Oct 2026 18:16:20 +0200
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Fri, Oct 16, 2026, at 17:56, Hugo Villeneuve wrote:
> > On Fri, 16 Oct 2026 14:59:47 +0200
> 
> >>  	retinfo->custom_divisor  = uport->custom_divisor;
> >> -	retinfo->hub6	    = uport->hub6;
> >> +	retinfo->hub6		 = 0;
> >
> > Would a comment here help?
> >
> > 	retinfo->hub6		 = 0; /* No longer supported */
> 
> Good idea, added.
> 
> >> @@ -924,7 +921,6 @@ static int uart_set_info(struct tty_struct *tty, struct tty_port *port,
> >>  	change_port = !(uport->flags & UPF_FIXED_PORT)
> >>  		&& (new_port != uport->iobase ||
> >>  		    (unsigned long)new_info->iomem_base != uport->mapbase ||
> >> -		    new_info->hub6 != uport->hub6 ||
> >
> > Maybe keep this so that change_port is true if someone sets hub6 to a
> > value other than zero (see below)?
> 
> Right, this would be fairly harmless as nothing looks at the field
> afterwards but it makes sense for consistency.
> 
> I've moved the hub6 check up before change_port now to behave the
> same way for regular users and root:

Yes that works too.

Reviewed-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>


> 
> @@ -935,6 +935,11 @@ static int uart_set_info(struct tty_struct *tty, struct tty_port *port,
>                 if (uartclk == 0)
>                         return -EINVAL;
>         }
> +
> +       /* hub6 is no longer supported */
> +       if (new_info->hub6 != 0)
> +               return -EINVAL;
> +
>         if (!capable(CAP_SYS_ADMIN)) {
>                 if (change_irq || change_port ||
>                     (new_info->baud_base != uport->uartclk / 16) ||
> @@ -950,10 +955,6 @@ static int uart_set_info(struct tty_struct *tty, struct tty_port *port,
>                 goto check_and_exit;
>         }
>  
> -       /* hub6 is no longer supported */
> -       if (new_info->hub6 != 0)
> -               return -EINVAL;
> -
>         if (change_irq || change_port) {
>                 retval = security_locked_down(LOCKDOWN_TIOCSSERIAL);
>                 if (retval)
> 
> Thanks for taking a look!
> 
>      Arnd
> 


-- 
Hugo Villeneuve


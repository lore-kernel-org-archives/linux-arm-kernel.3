Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFDACCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 17:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKQ62B/68glF3VJQl3TwnzQ09ixoOo9aoTa47BHK5rg=; b=X1489fuTUoGeMiWobI7KPkfnPw
	uDiXYACfuFv+wWs+TmGcqNw8qcnw45AbC54hCzWD0EFg5NCrQwLpMco8akfuJD87HTFJ+x5a01b8N
	NqHhgqc3ZOTUqyyE0dzmNqujloptctOpQgGK2nSGMEgodeX8Sw30NJcV0CGQewnXqfc9GbvUqqpM6
	YcFvlykpG8IAnztCmveru9JzGBl0FrzdEmmVSVOmyRcwK5ytKpGDc9aC58MvvAfTEHXlw8UuRZIgW
	OLryNSXdSm2z4WHAtPLEa1lU/it5A/axuKMzlKDanLhD+kd/dVsJWmiReyscWTBzTSarNNvGccc3b
	NWesmTSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlXl-00000003XEo-46zo;
	Fri, 16 Oct 2026 17:16:34 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlXi-00000003XDx-3WGD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 17:16:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=dKQ62B/68glF3VJQl3TwnzQ09ixoOo9aoTa47BHK5rg=; b=lr+bokTDzJ+s+ioETGpBVlCIxj
	KWS1zr5+gCEXjzc4fwVwvQQ12wlJvQg9pX34AuWejVkS7CfuQWTNWVCyHa9Yjst5M08WNJEK3T02H
	wqcGY7WUHkSIv1E6UGzHLtS8yj7rvUSbE9fsBRkVa64lkd//g7TEppVJ/KQJCPBpIBOk=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1xHlXf-000000006af-2Iq4;
	Fri, 16 Oct 2026 13:16:25 -0400
Date: Fri, 16 Oct 2026 13:16:24 -0400
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
Message-Id: <20261016131624.0fda5a185bf5c5ae67f09112@hugovil.com>
In-Reply-To: <aace8c7a-61ab-4b54-8563-3e1ab0f99e56@app.fastmail.com>
References: <20261016130328.1037616-1-arnd@kernel.org>
	<20261016124839.0d5564f7d7e036ee782a0486@hugovil.com>
	<aace8c7a-61ab-4b54-8563-3e1ab0f99e56@app.fastmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam_score: -2.0
X-Spam_bar: --
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_101631_455358_88564153 
X-CRM114-Status: GOOD (  14.90  )
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

On Fri, 16 Oct 2026 19:12:19 +0200
"Arnd Bergmann" <arnd@arndb.de> wrote:

> On Fri, Oct 16, 2026, at 18:48, Hugo Villeneuve wrote:
> > On Fri, 16 Oct 2026 14:59:47 +0200
> 
> >> -			scnprintf(buf, size, " I/O:0x%lx, offset 0x%x", port->iobase, port->hub6);
> >> +		scnprintf(buf, size, " I/O:0x%lx", port->iobase);
> >>  	}
> >
> > With this simplification, you can now remove the {} braces...
> 
> Done
> 
> >> diff --git a/drivers/tty/serial/sunsu.c b/drivers/tty/serial/sunsu.c
> >> index 4ff3e5c41dab..f43b802add12 100644
> >> --- a/drivers/tty/serial/sunsu.c
> >> +++ b/drivers/tty/serial/sunsu.c
> >> @@ -106,10 +106,6 @@ static unsigned int serial_in(struct uart_sunsu_port *up, int offset)
> >>  	offset <<= up->port.regshift;
> >>  
> >>  	switch (up->port.iotype) {
> >> -	case UPIO_HUB6:
> >> -		outb(up->port.hub6 - 1 + offset, up->port.iobase);
> >> -		return inb(up->port.iobase + 1);
> >> -
> >>  	case UPIO_MEM:
> >>  		return readb(up->port.membase + offset);
> >
> > Maybe change to a simple if/else?
> >
> > 	if (up->port.iotype == UPIO_MEM)
> > 		return readb(up->port.membase + offset);
> > 	else
> > 		return inb(up->port.iobase + offset);
> >
> 
> I think I'd rather not change sunsu.c any more than necessary.

Ok


-- 
Hugo Villeneuve


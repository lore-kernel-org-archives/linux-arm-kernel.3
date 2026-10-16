Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDE2CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 17:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1eCJyYP6zvzSL58EPlStO4BsCLHm7I3zghN15Chmro=; b=w8Du6PK3ty5Vv3r6IHUrpswEv2
	iB39ruXsdRL1v7LwgnEA6iqMWMtYiBjwpeL0vgWk4KvE1eyTib9VEcYDERVT81GF85rwbgSo2xTtt
	eAvSKMrm3m8pmMkVOp2ojUI0lbAHqDy4SosJa+tUr2ibtRCyZLluICsI9lENamarYFLjnhxlqZCUI
	yOucX9Nvgo7pCXQL53KQ//m8rgy8bQEgn8aGbx0bwvqgDWp5q1b/WrOgnq9iUm8GUKMgt3J2ZstR5
	mh9evQ/P8tqL7MEyvrlm3jnDHjOsi9faCe2ZLJpvM3YK5Qic6cdHhiwPZdZkvX4S15cKNA55lf5xT
	TgppKNeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlUC-00000003Wu0-1eTS;
	Fri, 16 Oct 2026 17:12:52 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHlUA-00000003WtY-1UeU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 17:12:51 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 22DB1140009C
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 13:12:49 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 16 Oct 2026 13:12:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792170765;
	 x=1792257165; bh=S1eCJyYP6zvzSL58EPlStO4BsCLHm7I3zghN15Chmro=; b=
	CuBbJFPUiluyvjyq5F+i8FcDlyoPrXkt5CzfLsrimQVoBPpCZYtsLQcRw1Qz3njI
	30fz+ooNdUo6fwxi+DweoBU+ydL2YFYDmsoAohoLVmT/XsCAFojsQ4rnlM9QIjiW
	NLLml28s2kOdZbZEQkujU8Hcl6Lr9ijwKaClCS1p/bze8UQw9raUD1U0LOO1ofoo
	MbQQaGNhhT5bj0atQvgYR/5VnakgXin/o3k5gvWGZGeri3nZg3MfnbMVmIGKrNgq
	zuqwAaOO3OgmCXiQrCLv+o+DhkTjX93ybBvzgpfR55aMcrCFuAid7E2E1Rlp7l10
	hGQBmqmza/W/AzFdYhICuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792170765; x=
	1792257165; bh=S1eCJyYP6zvzSL58EPlStO4BsCLHm7I3zghN15Chmro=; b=K
	47iH6m+21jSE13QQDkWi3fyW7VE6AoSHX2SsNSl18ZbmKGWSdip2WOSIxM48OuZu
	27zUgYuD04SoHLpyaCdzgcqBAdNqyteA4SrNnsCcQsTjCN0t94fkSB5lKTpstE2g
	NQbK6xLn1JwxewwCoCFQr/8esrhoxo0Op7FJs+ed+a5I5iFVJ91V4nqbsmk5/o/V
	X7fNxgr0XU+a6Fp6ctYQaSzeA9blgmt3DQRKPaNTs75Zi4znzKdtujsE504NEo8v
	uazNEwy9x1uNzXp7SNggxLctYzFeCkgcWW5pYOJpp5qhe8eKPmg49aCq6XexQWvr
	XX5wv8gZVyaZ0adAwuc/g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792170765; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:IRf6WPqYo7n5ZZqsB8WbCBl/peYefH27hXKc61nBfuS/gCT
	OsMA2dVVOaN5OcOwXZv0afc9tV0uGIUgiy7pmn3NYbh+tQwe58aE1KzKWF+scfMs
	Ob2e80YBbrl+w4WSCXlYiifTFC0+eUkf1p6cdnd3S8h0GSOBlO5FE7VsOtSynTnY
	Ta8ZPFinRXBN3cUwyqfOCTa0tO6ggvRMKCc75b4h/gojnYV5eeuPdTHJXsrXgJWP
	CjUHzWZRGWB1Lhu2ureeJMvF4w0EVN+a1xcScJ86OXS02CuEKJynbKniCJKugpPn
	605jZ8jrNL6SVvZD/VM/rsO2verewWAIZNMg9pA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:cDtuQHZVCFgaSoidsPDi/aAYkhqTeRG54fWVxKdPpN0=:bRX4vdTwM0uOkJPPEDFyz3oV42mOf5PihQ8xFO95TNU=;
X-ME-Sender: <xms:CFvSaqA2pehRpXgV9syxx7nBjYjv4JtdP75XiXJ8WUGN7WkHvOCPxQ>
    <xme:CFvSavXVenSOPhs8VSDPQkp3rgTGy4FJ7XXhGlvHkX8UV5hcKdRWxu5RanAg-OGIM
    LD-ebC1eNykIxZlbNY2WUm4ahjilKyv1SuDsjoaCs7VTiPwdaSiUzWO>
X-ME-Proxy-Cause: dmFkZTEePUHGAZhuWrU9DSd/9CBcIP0ODRfy6jaCyM2UMwXEhqrm4+Ely0VpVZcrsM5ce4
    zbNa+k+TvmAhyKYsdVQPaRiRStkGnBIiOYOdo79JO1LkYc5Dp26jcrgVK/Lp4v/wfIxIUL
    J7EcNPSBkc3y4SxkJOZNSH4U3u1S1h6MAgMfrPiCc7JaqnJWvmx/DUcu3OApMHYkOoe2wa
    Ar6uUvk8zMkoUL3yob2bPdkH9g7oApcvHGuYDrDITUYG1u8qoCHY+RiAzwX3ABkd7UX8Tp
    a18Cd23UIHCEi5OzVerQL2diprke7uH/XooUZn3GAOtgjFTNTISv/cs3MjCTy5pexvuBO8
    rQKAnbol0sgFTUiwfOK4uEmyNs/BBl6dynj27C0aXMFOWSqrs6cX9khewKqzDBWAL/OGnx
    JCXxG87gxC3VpHlIVCjl6bJDvbiLojzTQ83s1RGJLpQyoR0UAkXH/AY+wYWkh0/rXexVpX
    tNLlSptMTP/VZ4qLvzU6dpTsgOUMFqYxqo9iKiSiXC4+ZmPlZ+7ql+AKEUBSSpsnfwpFYW
    qfcThBjjMXFHNBAz8ImL9mYWUwochXms4wt8+RPKZ48JjZRS9hDl6XXuPCXFpLIAkK8Byu
    utfDAAxtckoOOELtAu+M13EIYK7vbED74OxhwJ+cLkU5dNhTZgxrLQ6nJVBA
X-ME-Proxy: <xmx:ClvSan5ZzT8sfCyUhOHvN8lKazYZAWzAG32mlGo1Se3AcygTW6H8_A>
    <xmx:ClvSalAg_ZfV5V6Yol2gCDqRaHO10Wt2jTXTihpwjoyCohm1916cbg>
    <xmx:ClvSat-vJxXUmrn8ENu5W6fqp06ig7KxzayIjCrW0QYap4y__6CKmQ>
    <xmx:ClvSaoG65n9UMSGQDrhfl7ojV0HbBAcVt3uUfLF8QgwmoqyhhINrxA>
    <xmx:DVvSarOYx1aAg05uKqzR6kHlJtXfeItkKZg-g-wwX0QgBTJKsvK2JXDz>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 373FC32A008F; Fri, 16 Oct 2026 13:12:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A4WN0AQLOakc
Date: Fri, 16 Oct 2026 19:12:19 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Hugo Villeneuve" <hugo@hugovil.com>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 "Hugo Villeneuve" <hvilleneuve@dimonoff.com>, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev
Message-Id: <aace8c7a-61ab-4b54-8563-3e1ab0f99e56@app.fastmail.com>
In-Reply-To: <20261016124839.0d5564f7d7e036ee782a0486@hugovil.com>
References: <20261016130328.1037616-1-arnd@kernel.org>
 <20261016124839.0d5564f7d7e036ee782a0486@hugovil.com>
Subject: Re: [PATCH 1/2] tty: serial: remove hub6 multiport support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_101250_464887_ABA48E50 
X-CRM114-Status: GOOD (  11.54  )
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

On Fri, Oct 16, 2026, at 18:48, Hugo Villeneuve wrote:
> On Fri, 16 Oct 2026 14:59:47 +0200

>> -			scnprintf(buf, size, " I/O:0x%lx, offset 0x%x", port->iobase, port->hub6);
>> +		scnprintf(buf, size, " I/O:0x%lx", port->iobase);
>>  	}
>
> With this simplification, you can now remove the {} braces...

Done

>> diff --git a/drivers/tty/serial/sunsu.c b/drivers/tty/serial/sunsu.c
>> index 4ff3e5c41dab..f43b802add12 100644
>> --- a/drivers/tty/serial/sunsu.c
>> +++ b/drivers/tty/serial/sunsu.c
>> @@ -106,10 +106,6 @@ static unsigned int serial_in(struct uart_sunsu_port *up, int offset)
>>  	offset <<= up->port.regshift;
>>  
>>  	switch (up->port.iotype) {
>> -	case UPIO_HUB6:
>> -		outb(up->port.hub6 - 1 + offset, up->port.iobase);
>> -		return inb(up->port.iobase + 1);
>> -
>>  	case UPIO_MEM:
>>  		return readb(up->port.membase + offset);
>
> Maybe change to a simple if/else?
>
> 	if (up->port.iotype == UPIO_MEM)
> 		return readb(up->port.membase + offset);
> 	else
> 		return inb(up->port.iobase + offset);
>

I think I'd rather not change sunsu.c any more than necessary.

      Arnd


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD86CF532D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 07:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GIkhEVZgzQ5l9z+TpFF/vXtfyDLL3bNPkDPBRcbRDA0=; b=Xl4IGeIKKo2y3pu/I+7yfuZg8+
	m34whshkSh/L0F/IY7ueyAl/8gRRFCo4eJyBrsSVTWoaro1FcDjyIHS6JLPGYsBFJhqPMH/fnny3e
	twvwyVFW6VbsLdMNQKduBmVqf9RQDJQtB4J7aHcaYJb4QkNKSukPiLlukbbg6qP1EORKtaWDVcrBP
	ktI0b1xK+LZGUO7DMs3lnXe/8qYBxEvaJfJ2umNxIrSz/Lc4XGkwd9AIDmzcbALlQ12WXtCBKOch3
	yIEDs7Bgz/pBz2mmw9zdH1E8SQohtsGRQXfOPCz592rjn0G0hsJ0xkqWsx87yWf6mDEsVXrbZ/fHu
	vetdruew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vsm-00000000rZs-2BWI;
	Tue, 24 Mar 2026 07:08:56 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vsi-00000000rZU-1DFg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 07:08:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EEF554E427BF;
	Tue, 24 Mar 2026 07:08:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AE74C6011D;
	Tue, 24 Mar 2026 07:08:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 54BD410451149;
	Tue, 24 Mar 2026 08:08:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774336126; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=GIkhEVZgzQ5l9z+TpFF/vXtfyDLL3bNPkDPBRcbRDA0=;
	b=ZMUuE5m6NiK7jvGLCp/w4wTzG7j7jdnQvFOfbav/a0tPLKNczRh9ZsPa6mAgO1KFstWGSf
	Vn7lM10TwpQzSlHCnmpksnT4knUpUChGYxZoKiDQVY/ubDgiaAe+n32/h6Y99AFbr/8ASx
	LL9PDmy87nyX4DKh3GIA9HqqlVrTUK41OfRP5xrIY/8J+Yx9rHPsSZbDktBWPEU3GH32DG
	0jajmfGku+NnK9Vj0ixCOcIEwanLUKeFcW0w7x+a0rRTZlPlpwjne/+8w1fHQHkdBZUvGS
	tEe1yNkuEG88uBszSQApsxtYsnI7mpcUoteXhHy+E3qshTi1t6/3OKXoLwPjSQ==
Message-ID: <89bc9543-9fcb-4563-b6ff-01b186231ce8@bootlin.com>
Date: Tue, 24 Mar 2026 08:08:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tty: atmel_serial: update outdated reference to
 atmel_tasklet_func()
To: Kexin Sun <kexinsun@smail.nju.edu.cn>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org
Cc: nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 julia.lawall@inria.fr, xutong.ma@inria.fr, yunbolyu@smu.edu.sg,
 ratnadiraw@smu.edu.sg
References: <3bd295ee-1607-49db-a12e-5a4d4fc81c5c@bootlin.com>
 <20260324024857.3244-1-kexinsun@smail.nju.edu.cn>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <20260324024857.3244-1-kexinsun@smail.nju.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_000852_812330_A5E8E449 
X-CRM114-Status: GOOD (  14.26  )
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

Le 24/03/2026 à 03:48, Kexin Sun a écrit :
> The modem-status comparison that used irq_status_prev was
> moved from atmel_tasklet_func() into atmel_handle_status() in
> commit d033e82db9a5 ("tty/serial: at91: handle IRQ status
> more safely").  Update the comment accordingly.
Double space here, but I don't think it's necessary to send another 
iteration for that.

> 
> Assisted-by: unnamed:deepseek-v3.2 coccinelle
> Signed-off-by: Kexin Sun <kexinsun@smail.nju.edu.cn>
Acked-by Richard Genoud <richard.genoud@bootlin.com>

> ---
>   drivers/tty/serial/atmel_serial.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
> index 08dd8f887956..5d8c1cfc1c60 100644
> --- a/drivers/tty/serial/atmel_serial.c
> +++ b/drivers/tty/serial/atmel_serial.c
> @@ -1927,7 +1927,7 @@ static int atmel_startup(struct uart_port *port)
>   		atmel_uart_writel(port, ATMEL_US_FMR, fmr);
>   	}
>   
> -	/* Save current CSR for comparison in atmel_tasklet_func() */
> +	/* Save current CSR for comparison in atmel_handle_status() */
>   	atmel_port->irq_status_prev = atmel_uart_readl(port, ATMEL_US_CSR);
>   
>   	/*

Thanks!


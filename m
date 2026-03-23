Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7D4EC01A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HtFy15itLGzLwxNiNWI7+ij1bS2Q37ajrwG17A30oWo=; b=4faOC46mlAiOeIHiGYPWGt5mIQ
	GqV4msAL9NovpytkK/yIw47ExxXoAJhDn7kXdPvNzrc8YJkoBY6enZQbgbpoQQ333fKuQDfxrFT9Z
	+xdYm8/Z1mALJtNcTDZklzFq5IDxbAgKtHUznsZIpYm3c1Lupw/dkMNxjIckIdXh75nJqW6uBS91E
	pqLFle9D0v9Csx445m2nMRFZ35FiohpO2T2fdj/O/w0AJUplcBWRi+i2zhsqXnzxY7Z6s5snU1cBH
	WNIthzn8Ic0tkZ2YGwJQXMo9gicPK6R92wsdGYlktfvZbqu3OwWOwsApzL4dDViO9hBQRUkaBiE+2
	s7r/0VRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bbP-0000000GNYU-0dFa;
	Mon, 23 Mar 2026 09:29:39 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bbL-0000000GNY8-25CX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 09:29:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 57D2C1A2F92;
	Mon, 23 Mar 2026 09:29:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 21C285FEF6;
	Mon, 23 Mar 2026 09:29:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 16B8A10371E62;
	Mon, 23 Mar 2026 10:29:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774258167; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=HtFy15itLGzLwxNiNWI7+ij1bS2Q37ajrwG17A30oWo=;
	b=SxboF6qzmWdCjfkaCQZfvJel6DR73V5hoEe/qvMCpeU+IoeNThHjEV+WwZvxXDY17O5Y2y
	A1H2ur9iztf3+HIeWmtepeTU9z1oQFQ5qI/+S7X0P2SB2UlMSvVBzY8h1Z3SBQhXZOaPFi
	JVHv4KVeb9HeFUYnbdGlJFE20Bo5CBJmYOHQtqMChikyUBWbf+wySXfUddzs1XQi9aRgQx
	xGdLJylgHGKZn1E7zDydcimyp4BQ34XrmqWazX7RPvkEkRIM7l/ERHC92ya5m9/EgrM767
	gzlqtzMoE7Jfi3MZBFYnOnzHelWXTHzDJ3Z1sqFwcijKf4Nhxc0/sH8Wfgr5XA==
Message-ID: <3bd295ee-1607-49db-a12e-5a4d4fc81c5c@bootlin.com>
Date: Mon, 23 Mar 2026 10:29:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tty: atmel_serial: update outdated reference to
 atmel_tasklet_func()
To: Kexin Sun <kexinsun@smail.nju.edu.cn>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: julia.lawall@inria.fr, xutong.ma@inria.fr, yunbolyu@smu.edu.sg,
 ratnadiraw@smu.edu.sg
References: <20260321105956.8401-1-kexinsun@smail.nju.edu.cn>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <20260321105956.8401-1-kexinsun@smail.nju.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_022935_724084_E3A583A4 
X-CRM114-Status: GOOD (  16.48  )
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

Le 21/03/2026 à 11:59, Kexin Sun a écrit :
> The modem-status comparison that used irq_status_prev was
> moved from atmel_tasklet_func() into atmel_handle_status() in
> commit 2c7af5ba65cf ("tty: serial: atmel: rework interrupt and
> wakeup handling"). atmel_tasklet_func() itself was later split
> into atmel_tasklet_rx_func() and atmel_tasklet_tx_func() in
> commit 00e8e65870cc ("tty/serial: atmel: split tx and rx
> paths").  Update the comment to reference
> atmel_handle_status(), which now performs the comparison.
Actually, it was in commit:
d033e82db9a5 ("tty/serial: at91: handle IRQ status more safely")
That irq_status prev/actual comparison was moved from 
atmel_tasklet_func() to atmel_handle_status().

And we don't need the rx/tx tasklet splitting history there.

IHMO, only the last sentence should suffice, but now that I've done the 
right commit research, you may add a reference to it :)

> 
> Assisted-by: unnamed:deepseek-v3.2 coccinelle
> Signed-off-by: Kexin Sun <kexinsun@smail.nju.edu.cn>
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


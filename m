Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5432CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 07:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HsCQcaBl/J5SnD9OVdDsExA6U4aXBq1UPmmg8tgJyV0=; b=gwT7Q8JUSA3vc0c0osC4WGqfs6
	cOnruKKhaYh+ts6oYdJsJltTSFYBE6KW0vswCI8CINcq1mu2N2wkrRTmmPyIXtfS+GQzExsHRz4Ai
	RYd4ENCQvHPrQjrD8tCtnLRRdNJ3e2rNeiWslN8q38D7HgrWRwpEqAYre+vWHWs547GWL5xa3eB6I
	RyBzKOwPx7o8nc8a4PhgTzWsIUzebN5Qp+01Wm4TtlFVfRPPt6YV0wdAiuELtCzdxBIWrUoxENHVa
	wKTbC/xDfDll3FDUnpeAjcZECOTbnyiy5AMnqqP8Mk83JpVH98UKkDQXT76+HSS/OT0o7MaNhRuv3
	LB3cVDTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsHR-0000000EZ2Q-1mwK;
	Mon, 18 May 2026 07:20:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsHP-0000000EZ26-3luO
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 07:20:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HsCQcaBl/J5SnD9OVdDsExA6U4aXBq1UPmmg8tgJyV0=; b=UcTOWo+PzacyEunDMK41pwalFV
	8Cb5ZK0KufVGQDqEHp5w5QlgX2P15pWuxKS7ykXVtJAjFGltd6wj2/HwDOPpNgv3IwGOiyD78saiK
	Op+YIvgU6ldVHCBl51gPcuKOM31mGllRNU6foDo5h9XS3Z63jR6fTYO5bEU5eWKVQiIu2Dcytmnhu
	C3nT0ZU+Wn3XrGcikTbc12M0SoxIGBhHneDHx47DSywHaOZoDoqvi9b+9OgWZvb/V7YSchjVQwySy
	yu0ha7XRLousGwSWqYjW3/WXjufP/HnINweh1tjUMQ5QgsQvbPFmtSqEFaw4yaOeftSFt5OlUuxkE
	BtkHxv8Q==;
Received: from mout01.posteo.de ([185.67.36.65])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsHF-0000000A9GM-2Xy6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 07:20:40 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 1937E24002B
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 09:20:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1779088826; bh=HsCQcaBl/J5SnD9OVdDsExA6U4aXBq1UPmmg8tgJyV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:Content-Type:
	 Content-Transfer-Encoding:From;
	b=h5I26kyQKCoFpo1K3oXXPDgjrNi2cYOFOKpAC0YzXO3olpabdlTHqQTT/+qmPOxjP
	 b3FNu5SyMMhHyg3y3qzmRt2R5dkZhaw4HuJFXECmgr+Lsu6AoEApgCIdGwDIGbJtLq
	 EjBgaFN+7KOazMyLub42oDM7sK5TjeMS+R6tUJo7Uz+eI1NfOwrc+m1QRGUjO1raB1
	 cBQmaVIjxHdUBjHce59JmHeKjEBxfdaQJWe8o8P6SPi3zkmr6evTKp00Ke2W9ZQmH2
	 lKALp2TWpP4gZDT7WB5fdwLH1gNgWEqRszgil0eH9q32TK0CiBQieWpmzbbf69WKKT
	 gr130iC07ZM8Q==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4gJq2c2sxsz6twZ;
	Mon, 18 May 2026 09:20:24 +0200 (CEST)
Message-ID: <466b32f4-29f9-4f64-ad38-27f770f981d7@posteo.net>
Date: Mon, 18 May 2026 07:20:25 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] tty: serial: atmel: Ignore chars when CREAD is cleared
To: Rakesh Alasyam <alasyamrakesh77@gmail.com>, gregkh@linuxfoundation.org
Cc: richard.genoud@gmail.com, jirislaby@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <2026051106-obliged-dismount-d85f@gregkh>
 <20260511165913.36467-1-alasyamrakesh77@gmail.com>
From: Richard GENOUD <richard.genoud@posteo.net>
Content-Language: en-US, fr
In-Reply-To: <20260511165913.36467-1-alasyamrakesh77@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_082038_096926_18EB2FE2 
X-CRM114-Status: GOOD (  16.43  )
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

Hi Rakesh,

Le 11/05/2026 à 18:59, Rakesh Alasyam a écrit :
> Ignore received characters when CREAD is cleared by adding RXRDY
> to ignore_status_mask.
> 
> This replaces an existing TODO in the driver.
> 
> Tested on hardware.
Could you be more precise?
Which board(s) did you test with? (e.g. sama5d3_explained, custom...)
Which SoC? (sam9g35, sama5d2...)
With DMA, PDC or none?

Regards,
Richard
> 
> Signed-off-by: Rakesh Alasyam <alasyamrakesh77@gmail.com>
> 
> ---
> 
> v2:
> - Add blank line before comment
> - Tested on hardware
> ---
>   drivers/tty/serial/atmel_serial.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
> index 5d8c1cfc1c60..5c756dc904b0 100644
> --- a/drivers/tty/serial/atmel_serial.c
> +++ b/drivers/tty/serial/atmel_serial.c
> @@ -2184,7 +2184,8 @@ static void atmel_set_termios(struct uart_port *port,
>   		if (termios->c_iflag & IGNPAR)
>   			port->ignore_status_mask |= ATMEL_US_OVRE;
>   	}
> -	/* TODO: Ignore all characters if CREAD is set.*/
> +	if (!(termios->c_cflag & CREAD))
> +		port->ignore_status_mask |= ATMEL_US_RXRDY;
>   
>   	/* update the per-port timeout */
>   	uart_update_timeout(port, termios->c_cflag, baud);



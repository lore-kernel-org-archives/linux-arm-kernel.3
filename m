Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A810E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 10:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZEnoKWVnNWxWfpvM4CKXWKQ2zlo+dYmzvVDMOYSnHk=; b=ZHb5t2mrh7Sn/Oy10p6ICjSU8W
	SCbZKFviVG6YgfIr5wKX8T3ZFQ+3pi8MmpWsTzUMBqMD2NRj008x1pOszlgdKcsrtmKrxTmZ2bj+n
	+OGRvjVZgr8uPXUAZkvfH05ysB6d5yRafx5UyCc+QkkFQfUhMb0QzusfFPbRvtLbzmSYXQ3oEg4NN
	3OoCOQrSWX++0Jv198htLL3HrLjW0AJAchEplmJSui6ViyFrY6qU9F2ndh7tp/grGwKfYthSVdRHv
	c11qvXujqFVQeMiK7Vz3HtaiVh05siGokpyxjTNiA7hSotQwDxSM8DJDWZNH2AoAQ/cUv6QEpzkSP
	zxNoMyfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCJb-0000000Ey7P-037m;
	Fri, 10 Jan 2025 10:32:31 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWCCq-0000000EwCY-2J7F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 10:25:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B8671486AEC;
	Fri, 10 Jan 2025 11:25:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1736504728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XZEnoKWVnNWxWfpvM4CKXWKQ2zlo+dYmzvVDMOYSnHk=;
	b=vALKgF6qgEd0igT7VNytsLCV0DUpK0yJL2uouCVImkOs3L1XzAPOMzM/lznYTfq2ucfS2J
	cV4dDlLUcHyytiJFODvoHrcbwYFNyGbLwNa4wZJ+1FAZdVYNxeZQLqyNKnfLSZ5WhCUTMa
	gJbj4CHqcKSYnYwcBiHM8K1ogLSXmu0YSbnVl63/8wHS3/Ew9+cQPQ1yd1u4UR6ogF/kxz
	S4Z17ooV/vKUpAswGmwmMH4H1q6U4POOMi1PzVBT+HOlEAF0kPzNgY3tLwhxJnazrofuwr
	eVjKFC+n+nnZ2jGz5CNw9oZjf7z6Cb/3hidU8jAPc9Sxa1YMB3F4FvsL61KxFQ==
Date: Fri, 10 Jan 2025 11:25:24 +0100
From: Alexander Dahl <ada@thorsis.com>
To: Mihai Sain <mihai.sain@microchip.com>
Subject: Re: [PATCH] spi: atmel-quadspi: Print the controller version and
 used irq
Message-ID: <20250110-reshuffle-thrower-3212ad741403@thorsis.com>
Mail-Followup-To: Mihai Sain <mihai.sain@microchip.com>, broonie@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241008083226.51163-1-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241008083226.51163-1-mihai.sain@microchip.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_022532_752285_6480B8A2 
X-CRM114-Status: GOOD (  19.17  )
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
Cc: alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, broonie@kernel.org, claudiu.beznea@tuxon.dev, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello Mihai,

just saw I made a similar patch for myself lately, so regarding the
discussion of the need of such a patch, I would opt for it.  However,
see below …

Am Tue, Oct 08, 2024 at 11:32:26AM +0300 schrieb Mihai Sain:
> Add support to print the controller version and used irq
> similar to other at91 drivers (spi, twi, usart).
> 
> Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
> ---
>  drivers/spi/atmel-quadspi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
> index 95cdfc28361e..757f07132585 100644
> --- a/drivers/spi/atmel-quadspi.c
> +++ b/drivers/spi/atmel-quadspi.c
> @@ -687,6 +687,8 @@ static int atmel_qspi_probe(struct platform_device *pdev)
>  	pm_runtime_mark_last_busy(&pdev->dev);
>  	pm_runtime_put_autosuspend(&pdev->dev);
>  
> +	dev_info(&pdev->dev, "AT91 QSPI Controller version %#x (irq %d)\n",
> +		 atmel_qspi_read(aq, QSPI_VERSION), irq);
>  	return 0;

I think this should go above pm_runtime functions, because it does i/o
on a register.  This is how my diff looks like:

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index 3d95b887235e6..7405b66e14b30 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -1356,6 +1356,7 @@ static int atmel_qspi_probe(struct platform_device *pdev)
         struct atmel_qspi *aq;
         struct resource *res;
         int irq, err = 0;
+        u32 version;
 
         ctrl = devm_spi_alloc_host(&pdev->dev, sizeof(*aq));
         if (!ctrl)
@@ -1470,6 +1471,12 @@ static int atmel_qspi_probe(struct platform_device *pdev)
                 pm_runtime_dont_use_autosuspend(&pdev->dev);
                 goto dma_release;
         }
+
+        version = atmel_qspi_read(aq, QSPI_VERSION) & 0x00000fff;
+        dev_info(&pdev->dev,
+                 "Atmel QSPI Controller version 0x%x at %pR (irq %d)\n",
+                 version, pdev->resource, irq);
+
         pm_runtime_mark_last_busy(&pdev->dev);
         pm_runtime_put_autosuspend(&pdev->dev);

Greets
Alex



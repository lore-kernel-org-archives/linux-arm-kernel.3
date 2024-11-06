Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3ADD44D78
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 15:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5hkMYCqGlZpFOC6ewIYYqBz7g5jw0DRXZWzNXBRAr8=; b=f5dHaJfchzYII8xELc908XbAz2
	HAODiGvoblmljUaRCdsM6kncOU37QuBD5w/bTcnY+Fy7n+2ysKhtzWxy2gTjAPWLsrT6QQeiI34Gj
	yJ0OIwfSs1hkXYykElsYP+TEf0d9ghS1qT8noVfHavpO7E2QTf3v1Y59FLlDsTG/I8ufdLgQVubIH
	7VFGsjonD97BB9M3ll5vZZo7uurueWMXJ08TfxU7wVj5awFgAl30pv3Kpgn8S7edyl+xVa4fYpXun
	lTTZA33yS7vgPCmMsMcc8fxLmfVXkIaQoINpjb7CGCjY+v4jOCAKkzyWoJi18Sfk57Y3PO51faknS
	ynztgJIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8hk0-00000003luP-3E9O;
	Wed, 06 Nov 2024 15:14:40 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8hiF-00000003lWm-3AhS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 15:12:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 18EAEFF80D;
	Wed,  6 Nov 2024 15:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730905968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d5hkMYCqGlZpFOC6ewIYYqBz7g5jw0DRXZWzNXBRAr8=;
	b=CIhO9yWAhWDMpDu3VqyrvyTROhVJeTtEDGC7jyCggwttz2tKoVNfKffH+x/sAALnIewrdE
	e6dYRjjeBj+5oFm5XDBg4tdiCRHWDRmH2LzjEHwLAn8LJfvu3FH9vftYqFtvtFo6rmi3bV
	+WVL3Ov4z/n/Hibn2AhD4TZsZ1ZsmeTFMcFL6c0TkF/VJkKY2xkQV3DI1Byslq8MzwXzRY
	VLhcNDJNp3INZ8L3R80NTRoYP63BHNkYaniOURNzi9Z2w/rlzbaAw1iUpBeHf342qh8pyh
	/0lnVTZg3X1I75pcrbeodkwPsjBCazLP4k9q2X9XFxn1NG94OGpizljQ7rK00g==
Message-ID: <0c891f4d-3e59-40b6-9bca-5207d2cbaad1@bootlin.com>
Date: Wed, 6 Nov 2024 16:12:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tty: atmel_serial: Fix typo retreives to retrieves
To: Shivam Chaudhary <cvam0000@gmail.com>, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, Hari.PrasathGE@microchip.com
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241106142720.41351-1-cvam0000@gmail.com>
From: Richard GENOUD <richard.genoud@bootlin.com>
Content-Language: en-US, fr
Organization: Bootlin
In-Reply-To: <20241106142720.41351-1-cvam0000@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: richard.genoud@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_071252_039875_8DF7232B 
X-CRM114-Status: GOOD (  12.42  )
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

Le 06/11/2024 à 15:27, Shivam Chaudhary a écrit :
> Fix typo 'retreives' to 'retrieves' in atmel_serial.c file.
> 
> Signed-off-by: Shivam Chaudhary <cvam0000@gmail.com>
> ---
> 
> v1->v2
>   - Improve subject line.
>   - Improve commit message.
> 
> v1: https://lore.kernel.org/all/20241024172300.968015-1-cvam0000@gmail.com/
> 
> 
>   drivers/tty/serial/atmel_serial.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
> index 09b246c9e389..bb1978db6939 100644
> --- a/drivers/tty/serial/atmel_serial.c
> +++ b/drivers/tty/serial/atmel_serial.c
> @@ -1166,7 +1166,7 @@ static void atmel_rx_from_dma(struct uart_port *port)
>   		port->icount.rx += count;
>   	}
>   
> -	/* USART retreives ownership of RX DMA buffer */
> +	/* USART retrieves ownership of RX DMA buffer */
>   	dma_sync_single_for_device(port->dev, atmel_port->rx_phys,
>   				   ATMEL_SERIAL_RX_SIZE, DMA_FROM_DEVICE);
>   
Acked-by: Richard Genoud <richard.genoud@bootlin.com>

Thanks!


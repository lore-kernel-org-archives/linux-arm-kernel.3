Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E146DCC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 14:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o4aBxesv+vBtVvSxWhefHeqzqJtPvappSmoCf4blYE0=; b=BOVIQ4mRCLRgw197lwj0B5nB/s
	X8baBpKIuB0//GDtgk1HXnxc+La60f0JHMCXjrg8T60MmhRsL0sbFVzj6x+9WTIoBtb6zoZHR/2CL
	2XzCefkJjXu2jT5cNjus770jOxrI4Zkmlc30HNn8E14KCsKDrQaSZC40TFkKW9WO4w8gI0dNU0Dxe
	TzGlYVll3rtkQ5MXTYUZ75h91YIYFpj5AQYfH4d4/KJHvDMRzAJrjPqy7FDiUm4+XExmtkgYxGeH1
	mZnbbHkaQNKRArsw8QZ8FEkbjaKkWktPjYhAtfvFZkpgEDS2cZ+fvHS/h+OBQO1ulQxxgXR7IUpxZ
	i5osNvmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH080-0000000FkM4-19dP;
	Wed, 14 Oct 2026 14:38:48 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH07x-0000000FkJd-2tXX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 14:38:47 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E5032148FDFB;
	Wed, 14 Oct 2026 16:39:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1791988746; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=o4aBxesv+vBtVvSxWhefHeqzqJtPvappSmoCf4blYE0=;
	b=s335Ao7XbUWldgKyMzh7twRWMfboqYdP5YUN75P/riJ/gatq/juIoGx5fRSOkdKgsQVHWP
	m5L5cV0J3k0Ou80A/58TPlpKx+ILfZVMJWiyMjS9XfItgcfenhyWZoUPheSVVPtuswQm4a
	aDITQ55NfAkuXZmge3K+KVniUXDGdXwpwLNTHB8rgoFqu3n2LAjXQ1Wgwdu3Wqf975ctya
	s1DyIGkFwirgJz0hzTNWvWHOgnM9x8sc8fHWKzksxHWyRfVU9lAhABvXcMh8ZiFPndntqC
	RuyBH+g8ggh/swxROklZtU6IAY50kQFg7DKw33POQrXgmSoCGqEtgW3bl9+yXQ==
Date: Wed, 14 Oct 2026 16:38:34 +0200
From: Alexander Dahl <ada@thorsis.com>
To: Mihai Sain <mihai.sain@microchip.com>
Cc: stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: host: ehci-atmel: Use dev_dbg() for debug messages
Message-ID: <20261014-smugness-lather-c65cb20cf37e@thorsis.com>
Mail-Followup-To: Mihai Sain <mihai.sain@microchip.com>,
	stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261014121656.1634-1-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014121656.1634-1-mihai.sain@microchip.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_073846_186744_FBF36E1C 
X-CRM114-Status: GOOD (  16.29  )
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

Hello Mihai,

Am Wed, Oct 14, 2026 at 03:16:56PM +0300 schrieb Mihai Sain:
> Use dev_dbg() instead of pr_debug() in the probe function
> to provide a more specific device message.
> This ensures the log message is properly associated with
> the corresponding platform device instance.
> 
> Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
> ---
>  drivers/usb/host/ehci-atmel.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/ehci-atmel.c b/drivers/usb/host/ehci-atmel.c
> index 65747270fd88..b6ba7005be69 100644
> --- a/drivers/usb/host/ehci-atmel.c
> +++ b/drivers/usb/host/ehci-atmel.c
> @@ -99,7 +99,7 @@ static int ehci_atmel_drv_probe(struct platform_device *pdev)
>  	if (usb_disabled())
>  		return -ENODEV;
>  
> -	pr_debug("Initializing Atmel-SoC USB Host Controller\n");
> +	dev_dbg(&pdev->dev, "Initializing Atmel-SoC USB Host Controller\n");
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0) {

Reviewed-by: Alexander Dahl <ada@thorsis.com>

Greets
Alex



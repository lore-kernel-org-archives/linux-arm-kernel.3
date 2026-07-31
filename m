Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3FDC55172
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 22:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4O9p1HgfmCPNuO8NrFXNLQh/x3qwmv7rnJHjHYwKXww=; b=r10sVL4ZgrROOu4/eo5gLVjocL
	pF7bSGU3x6fQb/9HFdPmsnoqeiCSLHQjrqCADXa2VZUlnuuF0Z5ihFq9V+75C4gwYNadyx++yTZ9T
	zXUcsH4cHizIpgdge50YGsLqgbsz8hC3Rp1/zlJJAHc8fISVlgUuN09Zzj8hODJXHcpvE845wKK+J
	JqFlgeTy+f9ZzGRJjNjPUX3H7TI14tCz3PNA7cGVH2nIzk4XEMabSp/3uncXAqiMybiduNZX2pz13
	KdT/d8hxqbtWglwwU+gJCcHF8cnII1Xi1jaF3ZGa7GfEo/VtGEttBo0KSsGjqLEF3e+U441TLBdXY
	HNApF6pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpvvW-0000000DhCM-0blT;
	Fri, 31 Jul 2026 22:42:02 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpvvT-0000000DhBr-0c8y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 22:42:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 574C84E4106E;
	Fri, 31 Jul 2026 22:41:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 28C286039A;
	Fri, 31 Jul 2026 22:41:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7D8111C16E1E;
	Sat,  1 Aug 2026 00:41:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785537711; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4O9p1HgfmCPNuO8NrFXNLQh/x3qwmv7rnJHjHYwKXww=;
	b=0KKjty0dM7ebLLjGiCJKPaCQjGBzRbPIr9XjLPmQ+bpL4q8cu7H+1zyFd243pIJXOUxI0w
	qnBF5o7cj1TrnAd/fVBsJHnH/ld2r57x/y5hLhI55HrSEiYfyCz6wQHxAsvWWD96Ccy2/b
	Swtkbry9la+J/VJCnTZENyD2ySfmF+XqxORC72KxAKuQiuIpe6dDmyqnUWF5OjqDr9blqk
	JN+kWNzw9s+jr483d76Abh8yTTefuISnO8INgZunCszadmPo46Wwo4uVcMo91k9QD59Scj
	a49XNG8fcD9K5/8kB6wR1lcsE0TG+2ziyLzOobChCWqCEmgkseaNvn9VjG9R5g==
Date: Sat, 1 Aug 2026 00:41:43 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Pan Chuang <panchuang@vivo.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Neal Liu
 <neal_liu@aspeedtech.com>, Cristian Birsan <cristian.birsan@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
 <jonathanh@nvidia.com>, linux-usb@vger.kernel.org (open list:USB
 SUBSYSTEM), linux-arm-kernel@lists.infradead.org (moderated list:ARM/ASPEED
 MACHINE SUPPORT), linux-aspeed@lists.ozlabs.org (moderated list:ARM/ASPEED
 MACHINE SUPPORT), linux-kernel@vger.kernel.org (open list),
 linux-renesas-soc@vger.kernel.org (open list:RENESAS RZ/N1 USBF CONTROLLER
 DRIVER), linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT)
Subject: Re: [PATCH 05/11] usb: gadget: Remove redundant dev_err()
Message-ID: <20260801004143.1b0d864d@bootlin.com>
In-Reply-To: <20260731035448.252289-6-panchuang@vivo.com>
References: <20260731035448.252289-1-panchuang@vivo.com>
	<20260731035448.252289-6-panchuang@vivo.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_154159_364691_82ED00C7 
X-CRM114-Status: UNSURE (   8.05  )
X-CRM114-Notice: Please train this message.
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

Hi Pan,

On Fri, 31 Jul 2026 11:54:39 +0800
Pan Chuang <panchuang@vivo.com> wrote:

> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"),
> devm_request_irq() and devm_request_threaded_irq() automatically log
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() calls.
> 
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---
>  drivers/usb/gadget/udc/aspeed-vhub/core.c | 4 +---
>  drivers/usb/gadget/udc/aspeed_udc.c       | 4 +---
>  drivers/usb/gadget/udc/atmel_usba_udc.c   | 5 +----
>  drivers/usb/gadget/udc/r8a66597-udc.c     | 4 +---
>  drivers/usb/gadget/udc/renesas_usbf.c     | 8 ++------
>  drivers/usb/gadget/udc/snps_udc_plat.c    | 4 +---
>  drivers/usb/gadget/udc/tegra-xudc.c       | 5 +----
>  7 files changed, 8 insertions(+), 26 deletions(-)
> 

LGTM for renesas_usbf.c.

Reviewed-by: Herve Codina <herve.codina@bootlin.com> # renesas_usbf.c

Best regards,
Hervé


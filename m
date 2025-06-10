Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08E0C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 03:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPCNvaiweglADLcDUZiaSHWSdRXaEgPafPmAEsUXP6w=; b=GOdgDOeX/tQnppCEM45h11GNrw
	Xivyj6Uy6OwHSjKQZoSATTBTPUMY7J7tBH+/HqMThCJimaU1lMZrVrKc3/b+T7gFX7PHvduM0l9Xo
	nWly44YpG3fbA0Gnm38EYO3OUMFc4pEupc1XB66TA3AiqzyVJZOoZbtp62/HyPZ+41VQTCQ28bYxC
	hHWggS0giGhi0ackqPxpkAkkptvDvvqasd6ttLMdoAIJ4vtOQejGlOZ9hZBaqMRZ5fQhOR8T0Xy9D
	+s2mhzqud9hOP/1yd61pL3BU+2k7K8M5vVmOnNdoRwdDrLhaid3PEjMJ46axBAL7Gn1/O4TpffN2e
	8FKIIakw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOpKz-00000005fjt-1Gsp;
	Tue, 10 Jun 2025 03:07:45 +0000
Received: from mail-m16.yeah.net ([220.197.32.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOpIe-00000005fYF-37Cf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 03:05:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=bPCNvaiweglADLcDUZiaSHWSdRXaEgPafPmAEsUXP6w=;
	b=T3fXJE10vejU41LKzdrPWuTUns6SjQOmeRrEvrVLgaqIwiKIYITKGz/9ph0Ai+
	SwFdd1vMNo9CS4O2Jq9oe8fBNWttECuh9a+YO4tbkdX4bg57EX6TFJ56d226VDgV
	4mkiQTOFF04SAc0BgQ1L6ZmDAy4Ha0+YNtT/7t2DEVSM8=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3HzjXoEdoKoVPAA--.46618S3;
	Tue, 10 Jun 2025 11:04:56 +0800 (CST)
Date: Tue, 10 Jun 2025 11:04:54 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: John Ernberg <john.ernberg@actia.se>
Cc: Xu Yang <xu.yang_2@nxp.com>, Peter Chen <peter.chen@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: i.MX kernel hangup caused by chipidea USB gadget driver
Message-ID: <aEeg1s9A0F8x0U2+@dragon>
References: <aEZxmlHmjeWcXiF3@dragon>
 <c56pgxmfscg6tpqxjayu4mvxc2g5kgmfitpvp36lxulpq4jxmg@ces5l7ofab6s>
 <aEbstxkQmji4tfjf@w447anl.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEbstxkQmji4tfjf@w447anl.localdomain>
X-CM-TRANSID: M88vCgD3HzjXoEdoKoVPAA--.46618S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr4kZr1xtFyDJr4DZw1DJrb_yoW8XFyrpF
	4fCr17AFsYqa4UJr1qqrsxuryrJa1kJrW8KFy2939YqrWa9w45Kr1UX3s5WF9rKry7W3W8
	tFs8Jw1UC3WxCF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UjYL9UUUUU=
X-Originating-IP: [117.82.86.8]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBhoZWhHgimwwAAAsl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_200521_219890_094FD2D3 
X-CRM114-Status: GOOD (  19.71  )
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

Hi John,

On Mon, Jun 09, 2025 at 02:17:30PM +0000, John Ernberg wrote:

<snip>

> We probably ran into the same problem trying to bring onboard 6.12, going
> from 6.1, on iMX8QXP. I managed to trace the hang to EP priming through a
> combination of debug tracing and BUG_ON experiments. See if it starts
> splatin with the below change.
> 
> ----------------->8------------------
> 
> From 092599ab6f9e20412a7ca1eb118dd2be80cd18ff Mon Sep 17 00:00:00 2001
> From: John Ernberg <john.ernberg@actia.se>
> Date: Mon, 5 May 2025 09:09:01 +0200
> Subject: [PATCH] USB: ci: gadget: Panic if priming when gadget off
> 
> ---
>  drivers/usb/chipidea/udc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 2fea263a5e30..544aa4fa2d1d 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -203,8 +203,10 @@ static int hw_ep_prime(struct ci_hdrc *ci, int num, int dir, int is_ctrl)
>  
>     hw_write(ci, OP_ENDPTPRIME, ~0, BIT(n));
>  
> -   while (hw_read(ci, OP_ENDPTPRIME, BIT(n)))
> +   while (hw_read(ci, OP_ENDPTPRIME, BIT(n))) {
>         cpu_relax();
> +       BUG_ON(dir == TX && !hw_read(ci, OP_ENDPTCTRL + num, ENDPTCTRL_TXE));
> +   }
>     if (is_ctrl && dir == RX && hw_read(ci, OP_ENDPTSETUPSTAT, BIT(num)))
>         return -EAGAIN;
>  
> ----------------->8------------------

Hmm, I just tested the change on i.MX8MM but didn't see the splatting.
Maybe we are running into a slightly different problems?

Shawn



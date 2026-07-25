Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38C8C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 23:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+RBwhLME/iRlsoD3xj/9o1j7XDqnjEXQBMs9cqxKEJU=; b=3eMDeU0/vpxpl7l/sSLwt38N+v
	dwxGGFwIjErZ+pbHEnxUThsKqPmYhEdBSOZLMmPjQzJOSoRPDUZbknFpJImxyWYPzVe650LLHTqSu
	XpAYZ6LS7WmiQFSJLZev16sXIg9Hh+JR2LCN97AeRJ+aZDj0+EZY/2XTSHRlESatgKsx5vPqjscja
	1rZrSxrWKiXQGwR0aiaQuVFWCEiGCf7tUuuRrx1J2n/5+FAsBZF3z5mZCTOByM8cT4DPQS1KGDMaM
	0VyR4sQhCorqOy7X0DWWxw1AKNfPQBglfVS4QxBbx/NUsttwp2XdWoldgNjepEPirw4q7lHWgouwE
	pKlR80Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnlhA-00000000lnR-0jid;
	Sat, 25 Jul 2026 23:22:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnlh8-00000000lnL-25nM
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 23:22:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F263360A91;
	Sat, 25 Jul 2026 23:22:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42441F000E9;
	Sat, 25 Jul 2026 23:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785021732;
	bh=+RBwhLME/iRlsoD3xj/9o1j7XDqnjEXQBMs9cqxKEJU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=LP0wmIxdY6fl0lRc4GwFXjGdE11rnt9so3UPAb7Nx7b08P6YgdyGmYnxaa+fd1SmV
	 c2N4LJ1VG2o/E6LO0eSPc6f1zM4tTRyPNx4jrqNPR3zAroQyqx1O2KCjvvcKeMhKsD
	 mk0EmEGX/0X/vxkSS8aifYH/mOTZiweXMnxP/E0hwJ13Mynd0QZAqXOxW4dv9WCKVe
	 XfMb3cRwn8+Ta26hrP9MvlnyHEe4H7WzoS615TmmNCqTaFIU5l42PXo5wD4g13fxId
	 dsB+5SxzLVPCdHgaG2pryiygcmmbMIFejqzVTKA6xmMMHKaWxultgXd785/DgdYTAa
	 7gt+npQKoMA5w==
Date: Sun, 26 Jul 2026 00:22:07 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Amin GATTOUT <amin.gattout@gmail.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: at91_adc: use const char * for DT string
 property
Message-ID: <20260726002207.0ca83c96@jic23-huawei>
In-Reply-To: <3314a217-5e6c-44cb-af8e-1327c375c4dd@baylibre.com>
References: <20260722-master-v1-1-ab0591897e4b@gmail.com>
	<3314a217-5e6c-44cb-af8e-1327c375c4dd@baylibre.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 22 Jul 2026 14:47:08 -0500
David Lechner <dlechner@baylibre.com> wrote:

> On 7/22/26 2:39 PM, Amin GATTOUT wrote:
> > Declare the local variable as const char * and remove the unnecessary cast
> > when passing it to of_property_read_string().
> > 
> > Signed-off-by: Amin GATTOUT <amin.gattout@gmail.com>
> > ---
> >  drivers/iio/adc/at91_adc.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/iio/adc/at91_adc.c b/drivers/iio/adc/at91_adc.c
> > index f610ad729bf3..0ac74ad92fca 100644
> > --- a/drivers/iio/adc/at91_adc.c
> > +++ b/drivers/iio/adc/at91_adc.c
> > @@ -988,7 +988,7 @@ static int at91_adc_probe(struct platform_device *pdev)
> >  	struct iio_dev *idev;
> >  	struct at91_adc_state *st;
> >  	u32 reg, prop;
> > -	char *s;
> > +	const char *s;
> >  
> >  	idev = devm_iio_device_alloc(&pdev->dev, sizeof(struct at91_adc_state));
> >  	if (!idev)
> > @@ -1023,7 +1023,7 @@ static int at91_adc_probe(struct platform_device *pdev)
> >  
> >  	st->res = st->caps->high_res_bits;
> >  	if (st->caps->low_res_bits &&
> > -	    !of_property_read_string(node, "atmel,adc-use-res", (const char **)&s)
> > +	    !of_property_read_string(node, "atmel,adc-use-res", &s)
> >  	    && !strcmp(s, "lowres"))
> >  		st->res = st->caps->low_res_bits;
> >  
> > 
> > ---
> > base-commit: 248951ddc14de84de3910f9b13f51491a8cd91df
> > change-id: 20260722-master-23179d7c00c4
> > 
> > Best regards,  
> 
> Makes sense.
> 
> Reviewed-by: David Lechner <dlechner@baylibre.com>
> 
> Although perhaps could be simplified instead by using
> of_property_match_string().

Whilst I would prefer that it 'might' break a bad device tree given
the current code is a match against one of the two values.  If we start
matching explicitly against them any issues would become a probe failure.

So given it's ancient and I don't want to mess too much with it, applied
this lower risk patch.

Jonathan



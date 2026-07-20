Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDA6C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 17:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1spDH2aWpNawTi0FWzkm9K/w4h9xxsbHldprDmhqKsY=; b=1KdHg5UVOifBEcvKvVBFoTgxKO
	N2EB+Lz5ndPEwcTdeTu6+PEZSoVbuQReTj9Fv6g/IFBJ4QVhwkimX0xysfW6xjjVOlZeT62Fujnqd
	Gbr4Rp3SmgLokkhonRg04dihNiIYeHlJL0+3Uqlyc4TRp8vzjVX7U85RMw/tZXuHY1ExQI99cb/dO
	wgexVl5eDKdCU6GFIdHy726uX70o9tde2F2O0k7SgzhUyLU7Njq3A0N8PcGieH/1tYhS2Ipkn+MSa
	If9wEB2k/ouVNA/XECyZiJEbPYs2D/twBvYEhUx9mHf4HmcO14YbfJTUDCaQUEQlFQN+NA5ta9yPN
	Ep2RFKDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrSb-00000007TVQ-2JdI;
	Mon, 20 Jul 2026 17:07:21 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrSZ-00000007TUh-12X4;
	Mon, 20 Jul 2026 17:07:20 +0000
Date: Mon, 20 Jul 2026 19:07:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784567231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1spDH2aWpNawTi0FWzkm9K/w4h9xxsbHldprDmhqKsY=;
	b=RT5H9kx3G44z2XjMJsjzGLqwn4nQ/Mr4/ossQTkxVUJTH0uxkCSFLJ9SwmAd2rlaDcWlfF
	vQ5dWDszbRMuQ8fFo87nnehRNxsx3JHlSB75MkAQi/TfUc9E2K0KnYac4I89Qd/A8FhhBh
	jG04FWyPMhs6E7m88cw0NOs59MRTKIjwzpzEI6xL9TrRaAjYHyvgV7DtLxq8Hoz5D+ywCh
	fpbgsZxYbBi0dLFDc7e6xxkbDTGlml0m4VDQPRRfiOdy8DXGv58GEhmCULSzS3J2tX5HfZ
	C/h6ZpoQXEEVR8GJKgxWJwbkm3BnmuxeFNA51e4e06k8t99IVs28dX7tXy5uKQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784567231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1spDH2aWpNawTi0FWzkm9K/w4h9xxsbHldprDmhqKsY=;
	b=+jTIHKGjppA7EJKqPdXiM7obdAt7VNTHbDUO7gYxpaB4llwkHJKu9Z+aXMXm24fZ2X6toi
	SulR1eRipcFVc9CQ==
From: Gregor Herburger <gregor.herburger@linutronix.de>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-pm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pmdomain: raspberrypi-power: add remove function
Message-ID: <ifzlb2b3rdoo3hckhga7ggmmd3j5ub4a2krb4g25sh6naoxeyj@64ownhquehue>
References: <20260715-rpi-pm-remove-v1-1-e4eed226e08a@linutronix.de>
 <CAPx+jO8EPX2br9vsuFXBDPoQTF+Ks09MFcFQzchZxZVaj7y=-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPx+jO8EPX2br9vsuFXBDPoQTF+Ks09MFcFQzchZxZVaj7y=-w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_100719_438543_73E920A7 
X-CRM114-Status: GOOD (  28.92  )
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

On Thu, Jul 16, 2026 at 02:28:15PM +0200, Ulf Hansson wrote:
> On Wed, Jul 15, 2026 at 10:16 AM Gregor Herburger
> <gregor.herburger@linutronix.de> wrote:
> >
> > The raspberrypi-power driver registers resources with
> > of_genpd_add_provider_onecell and pm_genpd_init but never removes them.
> > When the driver gets unbound and bound again this causes error. Add a
> > remove function to cleanup all registered resources.
> >
> > Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> > ---
> >  drivers/pmdomain/bcm/raspberrypi-power.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/drivers/pmdomain/bcm/raspberrypi-power.c b/drivers/pmdomain/bcm/raspberrypi-power.c
> > index b87ea7adb7bea..2c2135c17afb0 100644
> > --- a/drivers/pmdomain/bcm/raspberrypi-power.c
> > +++ b/drivers/pmdomain/bcm/raspberrypi-power.c
> > @@ -232,6 +232,17 @@ static int rpi_power_probe(struct platform_device *pdev)
> >         return 0;
> >  }
> >
> > +static void rpi_power_remove(struct platform_device *pdev)
> > +{
> > +       struct rpi_power_domains *rpi_domains = platform_get_drvdata(pdev);
> > +       int nr_domains = RPI_POWER_DOMAIN_COUNT - 1;
> > +
> > +       of_genpd_del_provider(pdev->dev.of_node);
> > +
> > +       for (int i = nr_domains; i >= 0; i--)
> > +               pm_genpd_remove(&rpi_domains->domains[i].base);
> > +}
> > +
> >  static const struct of_device_id rpi_power_of_match[] = {
> >         { .compatible = "raspberrypi,bcm2835-power", },
> >         {},
> > @@ -244,6 +255,7 @@ static struct platform_driver rpi_power_driver = {
> >                 .of_match_table = rpi_power_of_match,
> >         },
> >         .probe          = rpi_power_probe,
> > +       .remove         = rpi_power_remove,
> 
> In general it's not a good idea to allow unbinding power domain
> drivers, as it will probably break consumers and their drivers.
> Although, I don't know whether it makes sense in this particular case.
> 
Ok. I stumbled on this when I was trying to fix an error in the remove path of
the raspberrypi-firmware driver. I have not checked if all the drivers still
work so you are probably right.

> Another option is to prevent user-space from unbinding by adding the below here:
> ".suppress_bind_attrs = true,"

That would be the simpler solution. If I add this for this driver, it should
also be added to raspberrypi-firmware and to bcm2835-mbox. Because without those
drivers this driver wouldn't work anyways. Should I add this to those drivers?
And remove the remove callbacks?
> 
> >  };
> >  builtin_platform_driver(rpi_power_driver);
> >
> 
> Kind regards
> Uffe

-- 
Gregor Herburger
Linutronix GmbH | Bahnhofstrasse 3 | D-88690 Uhldingen-Mühlhofen
Phone: +49 7556 25 999 35; Fax.: +49 7556 25 999 99

Hinweise zum Datenschutz finden Sie hier (Informations on data privacy 
can be found here): https://linutronix.de/legal/data-protection.php

Linutronix GmbH | Firmensitz (Registered Office): Uhldingen-Mühlhofen | 
Registergericht (Registration Court): Amtsgericht Freiburg i.Br., HRB700 
806 | Geschäftsführer (Managing Directors): Dr. Wilfried Wessner, 
Katharina Kopp, Alexander Gieringer


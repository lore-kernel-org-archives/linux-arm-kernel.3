Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B61C021B6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 11:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RTZ1pFb0GwQ0Xe6JYNVrHT61A4fsLhTBRgXmYjxO+58=; b=W1PiaJcHf1NSmyOsSAYJz9LYLg
	EBiWmJmsPWaOQaAJfSWd4lErGbk6g6pWmd9Js4eWg4NYxhMNKCxB/UT4FGg5MA6YE4lrEUt1KcJ5/
	uGzs9eyGhJ9HRbPQ2mxnaU39BpEp3V/A62Ml3LA0Coj3rqcdpyjStvAJF6V4+KzY8zTmz9v0jh1W2
	66pMWoenRLxdXJ7+kheR8oM6UAFD7MibfN/UN2fN29QdcBLSLzLPHqgRZXzhH/3PBAqQ6RlbN92Eu
	jigXaEKajefy/qK6XHvPnopg3Ojbt8eP8AsY9aCR9t5b25DGH2p1jLREXhdtaUQegz5fpG98MdS10
	JdZSzQ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmt1p-0000000H1Gk-0nbU;
	Tue, 25 Feb 2025 11:23:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrkt-0000000GjF7-1Pgv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 10:01:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740477695; x=1772013695;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=80W3jRUeJgHuN6c6wY/5SS6Zo5/zBaxfdTgmqQWxMCs=;
  b=w3Ff8o7DJRgvg2fSik2IZiC4y2r0q9rhmG3ZRRKOq0zeTPEU915oI4cL
   ZHWGsqLxvrIQQyDY9LI6icDf8PAPjRqgVVsCnT0kGvyOnElt68gL9cifq
   8xNWhrp7zDeGZXtpNnnxLBE36icHhjgN+51yAoy1s4c7LSLu0Ej8/xHF5
   uf2Pnim//VI6vHLMghctYLM+ZVfo1TQnsRUgAZd4WeCGliIDbcj6hyuYT
   dHED5yygBdSQ3R/ajktNdzESsddMl7IoBKpYsADWUlB33KPBtBiGautz4
   D4ioiF6lY4Z3t0bHFR0Xui7MWNMR7LAo7+6XLKh3VcIqPGzYytmtLYIs7
   g==;
X-CSE-ConnectionGUID: u5EGqvTPRrG+qo0rh3KUuA==
X-CSE-MsgGUID: Tmg3facpSDOUyzGW72MZwA==
X-IronPort-AV: E=Sophos;i="6.13,313,1732604400"; 
   d="scan'208";a="38095043"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Feb 2025 03:01:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 25 Feb 2025 03:01:22 -0700
Received: from localhost (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 25 Feb 2025 03:01:22 -0700
Date: Tue, 25 Feb 2025 10:59:30 +0100
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: Herve Codina <herve.codina@bootlin.com>
CC: <p.zabel@pengutronix.de>, <Steen.Hegelund@microchip.com>,
	<daniel.machon@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] reset: mchp: sparx5: Fix for lan966x
Message-ID: <20250225095930.paeqka2z2tjuxp6g@DEN-DL-M31836.microchip.com>
References: <20250224092923.2648680-1-horatiu.vultur@microchip.com>
 <20250224140443.42ddc57c@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250224140443.42ddc57c@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_020135_591425_EADF9780 
X-CRM114-Status: GOOD (  29.54  )
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

The 02/24/2025 14:04, Herve Codina wrote:
> 
> Hi Horatiu,

Hi Herve,

> 
> On Mon, 24 Feb 2025 10:29:23 +0100
> Horatiu Vultur <horatiu.vultur@microchip.com> wrote:
> 
> > With the blamed commit it seems that lan966x doesn't seem to boot
> > anymore when the internal CPU is used.
> > The reason seems to be the usage of the devm_of_iomap, if we replace
> > this with of_iomap, this seems to fix the issue as we use the same
> > region also for other devices.
> >
> > Fixes: 0426a920d6269c ("reset: mchp: sparx5: Map cpu-syscon locally in case of LAN966x")
> > Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> > ---
> >  drivers/reset/reset-microchip-sparx5.c | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/reset/reset-microchip-sparx5.c b/drivers/reset/reset-microchip-sparx5.c
> > index aa5464be7053b..5a75f9833a91a 100644
> > --- a/drivers/reset/reset-microchip-sparx5.c
> > +++ b/drivers/reset/reset-microchip-sparx5.c
> > @@ -8,6 +8,7 @@
> >   */
> >  #include <linux/mfd/syscon.h>
> >  #include <linux/of.h>
> > +#include <linux/of_address.h>
> >  #include <linux/module.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/property.h>
> > @@ -72,14 +73,17 @@ static struct regmap *mchp_lan966x_syscon_to_regmap(struct device *dev,
> >                                                   struct device_node *syscon_np)
> >  {
> >       struct regmap_config regmap_config = mchp_lan966x_syscon_regmap_config;
> > -     resource_size_t size;
> > +     struct resource res;
> >       void __iomem *base;
> >
> > -     base = devm_of_iomap(dev, syscon_np, 0, &size);
> > -     if (IS_ERR(base))
> > -             return ERR_CAST(base);
> > +     if (of_address_to_resource(syscon_np, 0, &res))
> > +             return ERR_PTR(-ENOMEM);
> >
> > -     regmap_config.max_register = size - 4;
> > +     base = of_iomap(syscon_np, 0);
> > +     if (!base)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     regmap_config.max_register =  resource_size(&res) - 4;
> >
> >       return devm_regmap_init_mmio(dev, base, &regmap_config);
> >  }
> 
> In the Lan966x PCI device use case, the reset driver can be loaded, unloaded
> and re-loaded.
> 
> When the driver is unloaded, resources have to be released and so with a
> call to of_iomap(), a call to iounmap() is needed.
> 
> Maybe .remove() function in this driver should handle the needed iounmap()
> call.

Thanks for the comments.
I think you are right. I will update this in the next version.

> 
> Best regards,
> Hervé

-- 
/Horatiu


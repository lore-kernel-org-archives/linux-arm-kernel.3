Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CD5C19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 08:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9W0Stky2rc2DskFljw6MIbRpH2pH9Q9lpK48Bj21oU=; b=wD/2uZUGPxTp/eS7hdIdIk1ZUN
	It7flp2oXfYZE69B8WRISMjRAakEog9H3pmT5d9OZwvFoqJ7KG3mw4Nt+hfhM+taeucoh4SNbw9xU
	r6Lrt5bShHsULhH3Soq71K2MiOAExfN4gk97JZqWFKhZ9by8Xe2lvauu4Qu0fIW1mC9UH19YF0Gqx
	SAqrXPV0v7KMlxl+kH+ae5DzrPjOfmUmH/74ZyI9gDmfv9uOmojFyEmJOts3scgE2Bisp/midkIsb
	7lH0foyDkuI0tQSF5v5J0PU54ieQ1UqdfsJA3dilj5sOjLL5xoQccgNIAh2Q2n2XqonZUc/Yxlkoc
	XogX+1bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZgG-00000006mSq-3zMb;
	Thu, 27 Feb 2025 08:55:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZeh-00000006mDo-2qB6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 08:54:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740646447; x=1772182447;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XAbrctXtesSLToALyuGAt+44obnQxRaAX9V/KR/oWfI=;
  b=AVYje7Vo8Zg6B8inws00j+PLpN5PgX7D7QysV9VP2aWmQL8QJ66NZHtd
   6GpYL4htnMmO2kOvmtYMOivsw896vpVrjJcwPi/fVidOZNFGdJxQaiI1H
   hIvY+mBLriuTiVQsFfssZ64FUy5YsfDVlR2t3hfkqshZzeGhCjVYDLNhL
   1KMgdYs4LOa/sFj3JlBtaSyh8OskMUDH+cC1Y5v3g7xLEWHEnwN+liZRh
   Jg2Vndo2ycnCbFga+lDZk8w02pcJf8ifer9OOIuakZC3jA/XoJ0bx5t7t
   ibnprqBbnawynAihwFn/cMFNlJwwktnFZW9waCzt6O64xFJclzVOCNJlW
   A==;
X-CSE-ConnectionGUID: qCYUNJyrRXGyNKYkLUQ6tQ==
X-CSE-MsgGUID: Iq7AC7y9TEiNnIH5R9rQJQ==
X-IronPort-AV: E=Sophos;i="6.13,319,1732604400"; 
   d="scan'208";a="38620683"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2025 01:54:05 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 27 Feb 2025 01:53:42 -0700
Received: from localhost (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 27 Feb 2025 01:53:42 -0700
Date: Thu, 27 Feb 2025 09:51:48 +0100
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
CC: <Steen.Hegelund@microchip.com>, <daniel.machon@microchip.com>,
	<UNGLinuxDriver@microchip.com>, <herve.codina@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] reset: mchp: sparx5: Fix for lan966x
Message-ID: <20250227085148.ulqc2n7xvc2fa745@DEN-DL-M31836.microchip.com>
References: <20250226144645.1950451-1-horatiu.vultur@microchip.com>
 <5cc5cd05e0a481773212fff0bce574dcfea3f74d.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <5cc5cd05e0a481773212fff0bce574dcfea3f74d.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_005407_896003_4BC0B46A 
X-CRM114-Status: GOOD (  33.23  )
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

The 02/26/2025 17:32, Philipp Zabel wrote:

Hi,

> 
> On Mi, 2025-02-26 at 15:46 +0100, Horatiu Vultur wrote:
> > With the blamed commit it seems that lan966x doesn't seem to boot
> > anymore when the internal CPU is used.
> > The reason seems to be the usage of the devm_of_iomap, if we replace
> > this with of_iomap, this seems to fix the issue as we use the same
>             ^^^^^^^^
> The is not accurate anymore.

Good catch. I will update in the next version.

> 
> > region also for other devices.
> >
> > Fixes: 0426a920d6269c ("reset: mchp: sparx5: Map cpu-syscon locally in case of LAN966x")
> > Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> > Tested-by: Herve Codina <herve.codina@bootlin.com>
> 
> Is this still correct?
> 
> > Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> > ---
> > v2->v3:
> > - forward error from of_address_to_resource
> > - use devm_ioremap instead of_iomap
> > v1->v2:
> > - make sure to use iounmap when driver is removed
> > ---
> >  drivers/reset/reset-microchip-sparx5.c | 16 +++++++++++-----
> >  1 file changed, 11 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/reset/reset-microchip-sparx5.c b/drivers/reset/reset-microchip-sparx5.c
> > index aa5464be7053b..176b3f46e9243 100644
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
> > @@ -72,14 +73,19 @@ static struct regmap *mchp_lan966x_syscon_to_regmap(struct device *dev,
> >                                                   struct device_node *syscon_np)
> >  {
> >       struct regmap_config regmap_config = mchp_lan966x_syscon_regmap_config;
> > -     resource_size_t size;
> > +     struct resource res;
> >       void __iomem *base;
> > +     int err;
> > +
> > +     err = of_address_to_resource(syscon_np, 0, &res);
> > +     if (err)
> > +             return ERR_PTR(err);
> >
> > -     base = devm_of_iomap(dev, syscon_np, 0, &size);
> > -     if (IS_ERR(base))
> > -             return ERR_CAST(base);
> 
> It would be nice to add a comment here that devm_of_iomap() can't be
> used because the resource is shared with other devices. Do you know
> which ones?

Yes, I will add a comment in the next version.
Looking at the device trees (lan966x.dtsi), it looks like it is shared
with the clock driver (clks).

> 
> Otherwise, this looks good to me.
> 
> 
> regards
> Philipp

-- 
/Horatiu


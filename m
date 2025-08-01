Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6820EC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 14:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPOaoJOxoogHEJY9OnCsfnhHseVyLNZosFa8aUPuduY=; b=STr3muyhFF3Ty119Pi8NS82nzs
	vnAT/rH/xB06j0zupAWKdwfcd6zGSHk/stjzGQ2Ta5Lkc1kStRQjg4FdvvVLGHD2kAuTg+OMXMuaI
	PHGu80nXvL/9gscZAp9m5e7cwxRosSiwVbZz4e77zOf1rqltBdI2DVB8Wc8pyIKpNViH3BIKRnIfM
	Jck0tVIOhq9xV9rFhI3F8JFg1kWOMk8MMhFguq3KrCtFty3zzCIeTmb/8j/jm8nm/LdNyyjOQR8q4
	9ytKwCu8aJgT6y0zs8z/7Q9qhgZ0zzRIXvhAfVZwlNwmUJ2cvyQ/ZXniA81I0/dmTbvwWrKJz+0aZ
	5rZ+Zs4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhqQ6-00000006BQi-3lSb;
	Fri, 01 Aug 2025 14:07:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhqNX-00000006Ayt-2GGs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 14:04:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EC3F66112C;
	Fri,  1 Aug 2025 14:04:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C909CC4CEE7;
	Fri,  1 Aug 2025 14:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754057098;
	bh=rhp32RlGZQWi0qaev57mn8Lf6Y/ncV8+flahaYlr1h0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mhVN12b1haQLw3UTPQ/OFTK0vLoR4Uo4zSoTd60d5dOaQ1WJlLYg7Qlx1xxKm5s9k
	 vhz9T8jXHuQw46BMDWAadLcZ1IorBaBgg5u4BIc+Rbw5viXuqUgmNNWcrSX++Ryku6
	 g1tsqfwMLbJ6pkrE1gQhSoahrjZ6YspUJh8sCxEI14tNJ7UBKK3imB4/A3PmcD20Qs
	 kLghoGA0WUoDvuDuJBSPaBFIxO14FLmvewJC78oc2WU44eI/REQTvu8QclIRV2Gmlg
	 B1zb/dnAKk2F48m7wtWXmbIUGfSbZ/BX7CqwcmINAjHnDR2dlHh+ChqRpY9Q6U4xK3
	 EmLnOzxuWHD1A==
Date: Fri, 1 Aug 2025 16:04:54 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] irqchip/gic-v5: iwb: Remove module boilerplate
Message-ID: <aIzJhqnooJ/hO2Tv@lpieralisi>
References: <20250801-gic-v5-fixes-6-17-v1-0-4fcedaccf9e6@kernel.org>
 <20250801-gic-v5-fixes-6-17-v1-2-4fcedaccf9e6@kernel.org>
 <86v7n76xgm.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86v7n76xgm.wl-maz@kernel.org>
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

On Fri, Aug 01, 2025 at 01:24:57PM +0100, Marc Zyngier wrote:
> On Fri, 01 Aug 2025 08:58:19 +0100,
> Lorenzo Pieralisi <lpieralisi@kernel.org> wrote:
> > 
> > The IWB driver cannot be compiled as a module and is as matter of fact a
> > builtin driver at present.
> 
> What is blocking that?

Yep, you read my mind I need to test this but AFAICS at the moment
the answer is: nothing.

> > Make it explicitly so by removing useless boilerplate and by using the
> > builtin_platform_driver() helper to initialize its registration
> > functions.
> > 
> > Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Marc Zyngier <maz@kernel.org>
> > ---
> >  drivers/irqchip/irq-gic-v5-iwb.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/irqchip/irq-gic-v5-iwb.c b/drivers/irqchip/irq-gic-v5-iwb.c
> > index ad9fdc14d1c6..c3a3b30e9f4e 100644
> > --- a/drivers/irqchip/irq-gic-v5-iwb.c
> > +++ b/drivers/irqchip/irq-gic-v5-iwb.c
> > @@ -263,7 +263,6 @@ static const struct of_device_id gicv5_iwb_of_match[] = {
> >  	{ .compatible = "arm,gic-v5-iwb" },
> >  	{ /* END */ }
> >  };
> > -MODULE_DEVICE_TABLE(of, gicv5_iwb_of_match);
> >  
> >  static struct platform_driver gicv5_iwb_platform_driver = {
> >  	.driver = {
> > @@ -274,4 +273,4 @@ static struct platform_driver gicv5_iwb_platform_driver = {
> >  	.probe				= gicv5_iwb_device_probe,
> >  };
> >  
> > -module_platform_driver(gicv5_iwb_platform_driver);
> > +builtin_platform_driver(gicv5_iwb_platform_driver);
> > 
> 
> I'd rather we make the driver buildable as a module if at all
> possible, instead of forcing it as built-in for everyone. It would
> definitely help pipe-cleaning the potential missing dependencies.

Yes - I took a shortcut by removing boilerplate (that the
compiler/linker remove anyway) - it makes sense to rework the
build to make it possible to build as a module instead.

This patch can be dropped then, I will work on the follow-up.

Lorenzo


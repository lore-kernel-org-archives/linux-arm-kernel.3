Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A7CCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 11:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYSYiyvXyor7KrqB2qwh+HMbYWrpEEYsRn2Otkuizdk=; b=omEjlf8jBHBqcwPWj0y5WjRz+4
	hID0RLeVrSZ5i+CMVjeLk6I2Q8RSa2GfmoZm9kSTz5KL4j4IstKVZXaGpzzRVGu0KDAFgTPh873Sg
	EPHdv3wlkMZ0BFSMAcI56ApDwVPnQWjxPxuNbAavgGnA36RKpohc3qTdXuJcJFu9TI1Rd9U8f5Z+h
	Fb9GGWoRmI4HQb7PqvsxsS8epVCJySI7ek3Q+rHtC9fqLSHb/do+IXzOCn+AuWtYK93+R3MTuGL3Y
	shjQmRgMMyFV2OGYbNBTEK3MaS2Br1hhAC+NUwxHBqe0XxUkho85uvpC03mRnIADcqQvYQSDTajM4
	ji1GtHFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uogbg-0000000DHGc-1va7;
	Wed, 20 Aug 2025 11:03:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoeXk-0000000Cnv7-0tek
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 08:51:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3684F5C66A3;
	Wed, 20 Aug 2025 08:51:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF10C113D0;
	Wed, 20 Aug 2025 08:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755679898;
	bh=4oua5PIgVVAEVMnYyVUn4XS1CrIkF9Hwpeex3Quwcb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mpEFMySVY9zwdYL/PI0llyD+bGJ3ttBiagkS+mV/jiVtuThzzKk2fNXyUZ/YV/SEN
	 jud6yj5a7E2lgZWsaarCLavnXqr/7TvDAlu/HIvA6V4kJ0rlffInfJykzsMADxZwgS
	 iNX8JQ46rz4ixJnWTwCIouGny8+hkN+8mt4IHyrYNyZzig8twlKVzjXPKoSRwtGQIZ
	 WDvf1OfMtAaNxt8owBPxTp7O1CjBNQZBjJlzFGmYYbSFNSiGqVvpEh3DWcVn/5vkds
	 dK0/HFjg3gFQU569U6Llue74QL7jR7IrYbmhrx3GVxlK3O4WvXLYkJ9/6+LOnuKuoo
	 ZLNaXsXoYWheQ==
Date: Wed, 20 Aug 2025 10:51:34 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] irqchip/gic-v5: Delete a stray tab
Message-ID: <aKWMliisXtcezqrl@lpieralisi>
References: <cover.1752777667.git.dan.carpenter@linaro.org>
 <670bb1dc-7827-4916-84f3-bb46ee408b20@sabinyo.mountain>
 <3a1aa279-718f-4e45-add0-05727ba41706@suswa.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a1aa279-718f-4e45-add0-05727ba41706@suswa.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_015140_293985_78670AE1 
X-CRM114-Status: GOOD (  21.76  )
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

On Thu, Aug 07, 2025 at 05:55:50PM +0300, Dan Carpenter wrote:
> Hi Thomas,
> 
> Sorry, I screwed up the over letter so it was sent as a different
> thread.  These three patches are still required.  Lorenzo reviewed
> and tested them.

Hi Thomas,

forgive me the bother, just wanted to ask please if patches (2-3) in
this series are on your radar (patch 1 technically isn't a fix) or
should we resend them ?

I am going to be away for 2-weeks and wanted to make sure they did not
get lost (Dan sent them before the GICv5 driver code was queued in -next
for v6.17).

Thanks,
Lorenzo

> Reviewed-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Tested-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> 
> regards,
> dan carpenter
> 
> On Thu, Jul 17, 2025 at 01:45:24PM -0500, Dan Carpenter wrote:
> > This line is indented one tab too far.  Delete the tab.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > v2: no change
> > 
> >  drivers/irqchip/irq-gic-v5-irs.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
> > index f845415f9143..ad1435a858a4 100644
> > --- a/drivers/irqchip/irq-gic-v5-irs.c
> > +++ b/drivers/irqchip/irq-gic-v5-irs.c
> > @@ -568,7 +568,7 @@ static void __init gicv5_irs_init_bases(struct gicv5_irs_chip_data *irs_data,
> >  			FIELD_PREP(GICV5_IRS_CR1_IST_RA, GICV5_NO_READ_ALLOC)	|
> >  			FIELD_PREP(GICV5_IRS_CR1_IC, GICV5_NON_CACHE)		|
> >  			FIELD_PREP(GICV5_IRS_CR1_OC, GICV5_NON_CACHE);
> > -			irs_data->flags |= IRS_FLAGS_NON_COHERENT;
> > +		irs_data->flags |= IRS_FLAGS_NON_COHERENT;
> >  	} else {
> >  		cr1 = FIELD_PREP(GICV5_IRS_CR1_VPED_WA, GICV5_WRITE_ALLOC)	|
> >  			FIELD_PREP(GICV5_IRS_CR1_VPED_RA, GICV5_READ_ALLOC)	|
> > -- 
> > 2.47.2


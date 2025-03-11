Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21BEC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 09:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0cgf7pDS3ZEN7lDdy8FO07onfj2Tasy5sT842LonhZc=; b=j4CKwzglyg8DyltDHiSIlOmDwp
	LnW6G1Aueo7OtvriV8sug07IveesKZYrcBNN/13NS+lHH35n4EZdjffsXFML9aVAS4tSRHvoVWywn
	7YBl9HLEn8W/JUHO4sacLjUn0/U93mwBqtiqKRsdwP1HPwmJx5NAD8vtuOsNTPGk75c7YhQUQxzK9
	ZH6YYtRYkdbc6omUoWxWWLAVHhXLzn/sA8k9D+4raqs6NzH7fpF5+LccSrW9KqXhpkZVzPyUmidDm
	A/burYYruaoWibaXIUgHKvifWWtEzAv76eqaFwc13h0v7TAOPT6Pht5BEp5QLJ7sVDLk8/+c492Yb
	qPwS4IvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trvjT-000000057KK-31qa;
	Tue, 11 Mar 2025 09:17:03 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trvTZ-000000054jp-3EV2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 09:00:38 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52B90Rgt1142731
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 04:00:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741683627;
	bh=0cgf7pDS3ZEN7lDdy8FO07onfj2Tasy5sT842LonhZc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=VK/8XLPhPLd6nIpV64hf9SX17OEGTVvGFN0aZ5lLYJGTHC653FMfU9koPJpa7zjY5
	 GiIDGOo8DayilpacV58I5eKRmOCgkhqY+vmsgsvZPILx15TqQMEUBMmL5hKEASoYqb
	 gtxQtbdyyBlihw3llcTpZyPNSSKORAVdmFF1YkyQ=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52B90RDv030844
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Mar 2025 04:00:27 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Mar 2025 04:00:27 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Mar 2025 04:00:26 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52B90Pi9111975;
	Tue, 11 Mar 2025 04:00:26 -0500
Date: Tue, 11 Mar 2025 14:30:25 +0530
From: "s-vadapalli@ti.com" <s-vadapalli@ti.com>
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
CC: "s-vadapalli@ti.com" <s-vadapalli@ti.com>,
        "andrew+netdev@lunn.ch"
	<andrew+netdev@lunn.ch>,
        "dan.carpenter@linaro.org"
	<dan.carpenter@linaro.org>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "jpanis@baylibre.com" <jpanis@baylibre.com>, "srk@ti.com" <srk@ti.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "pabeni@redhat.com"
	<pabeni@redhat.com>,
        "horms@kernel.org" <horms@kernel.org>,
        "edumazet@google.com" <edumazet@google.com>,
        "rogerq@kernel.org"
	<rogerq@kernel.org>,
        "vigneshr@ti.com" <vigneshr@ti.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "kuba@kernel.org"
	<kuba@kernel.org>
Subject: Re: [PATCH net] net: ethernet: ti: am65-cpsw: Fix NAPI registration
 sequence
Message-ID: <20250311090025.kyc657febhgxrhoa@uda0492258>
References: <20250311061214.4111634-1-s-vadapalli@ti.com>
 <421a4c67865215927897e16866814bd6eb68a89d.camel@siemens.com>
 <20250311085109.q3g32v3ycoskhsko@uda0492258>
 <dbeb0d830c41eefe127d13af55fbaf6243164b0a.camel@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dbeb0d830c41eefe127d13af55fbaf6243164b0a.camel@siemens.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_020037_898543_67E9CCAA 
X-CRM114-Status: GOOD (  22.44  )
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

On Tue, Mar 11, 2025 at 08:56:49AM +0000, Sverdlin, Alexander wrote:
> Hi Siddharth!
> 
> On Tue, 2025-03-11 at 14:21 +0530, s-vadapalli@ti.com wrote:
> > > > Registering the interrupts for TX or RX DMA Channels prior to registering
> > > > their respective NAPI callbacks can result in a NULL pointer dereference.
> > > > This is seen in practice as a random occurrence since it depends on the
> > > > randomness associated with the generation of traffic by Linux and the
> > > > reception of traffic from the wire.
> > > > 
> > > > Fixes: 681eb2beb3ef ("net: ethernet: ti: am65-cpsw: ensure proper channel cleanup in error path")
> > > 
> > > The patch Vignesh mentions here...
> > > 
> > > > Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> > > > Co-developed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > > > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> 
> ...
> 
> > > > --- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> > > > +++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
> > > > @@ -2314,6 +2314,9 @@ static int am65_cpsw_nuss_ndev_add_tx_napi(struct am65_cpsw_common *common)
> > > >  		hrtimer_init(&tx_chn->tx_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_PINNED);
> > > >  		tx_chn->tx_hrtimer.function = &am65_cpsw_nuss_tx_timer_callback;
> > > >  
> > > > +		netif_napi_add_tx(common->dma_ndev, &tx_chn->napi_tx,
> > > > +				  am65_cpsw_nuss_tx_poll);
> > > > +
> > > >  		ret = devm_request_irq(dev, tx_chn->irq,
> > > >  				       am65_cpsw_nuss_tx_irq,
> > > >  				       IRQF_TRIGGER_HIGH,
> > > > @@ -2323,9 +2326,6 @@ static int am65_cpsw_nuss_ndev_add_tx_napi(struct am65_cpsw_common *common)
> > > >  				tx_chn->id, tx_chn->irq, ret);
> > > >  			goto err;
> > > >  		}
> > > > -
> > > > -		netif_napi_add_tx(common->dma_ndev, &tx_chn->napi_tx,
> > > > -				  am65_cpsw_nuss_tx_poll);
> > > 
> > > ... has accounted for the fact ..._napi_add_... happens after [possibly unsuccessful] request_irq,
> > > please grep for "for (--i ;". Is it necessary to adjust both loops, in the below case too?
> > 
> > Yes! The order within the cleanup path has to be reversed too i.e.
> 
> Not only reverting the order...
> What I'm referring is: when requesting i-th IRQ fails there has been 
> i-th NAPI already added, but the cleanup loops start from [i-1]-th instance.
> It looks like a potential leak to me...

Thank you for clarifying. I will address this and the previous feedback in
the v2 patch.

Regards,
Siddharth.


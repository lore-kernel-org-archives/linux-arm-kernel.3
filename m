Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280A8F99351
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 09:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wDBCWCKH25r3rzgbP56Jfhz7Hk9W93MZ0Xv826+RJBw=; b=Ov7n4fjVLUf4WAyR5qjqYYuFYd
	WeFBeTAdqjvA3bpTshBvNfxpbGJqHNdK381253rPd7NZaKLxvaHFE5FANcfBJdhIWE5ZCQ90ZA0NU
	+sYcRWK0fHB5dUAKvQC3PF/h09p/MMgXCk1LwXjgyiTaX4lrUmNAyDgVOKA/oXMlXQCYeNExniPPw
	EgtRNQNoWCCtbKgZNLncyRH7lgyNblVZZOfcPTngi9PW2CHbgUAyuIa9MirA/F0tSsobU0FubSi3S
	+8HN7cc3GA0voFPIM8M8WrRA+v3nzNNm7wBharBlduR5S3yZYrkzrEGx9yliJkNFzokoLk9LIDuf9
	b4rjtaiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFq36-0000000BJFp-1XzU;
	Thu, 23 Apr 2026 09:08:40 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFq30-0000000BJEp-0zIM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 09:08:38 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260423090828euoutp02fe09c7a1d97ab292c9727389fb2e5005~o8T_vFgz40327103271euoutp026
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 09:08:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260423090828euoutp02fe09c7a1d97ab292c9727389fb2e5005~o8T_vFgz40327103271euoutp026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1776935308;
	bh=wDBCWCKH25r3rzgbP56Jfhz7Hk9W93MZ0Xv826+RJBw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=N00BaMEHjfQ8ysK/zJO0guD2i953Z2z8NHQqo5I2qmfPJrM9w5C539OBF6OFyef5E
	 d6TnEiVWxfHYQ1ztF5WqbkkDa+A9KMVyzjkS7a+cfGkfgsl2w76a+RPB/bAFiYHo9Z
	 Ehn/Js6B/jr+nyAGlWIYhnM403tgH2ym0Wv/R1m0=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260423090828eucas1p204606b1be37253296ac938bad852e8f4~o8T_JYoD82360223602eucas1p2l;
	Thu, 23 Apr 2026 09:08:28 +0000 (GMT)
Received: from AMDC4622.eu.corp.samsungelectronics.net (unknown
	[106.120.77.34]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260423090827eusmtip2f7824fdaa66107f46994835bd820dac6~o8T9sjupi0699706997eusmtip2L;
	Thu, 23 Apr 2026 09:08:27 +0000 (GMT)
Date: Thu, 23 Apr 2026 11:08:24 +0200
From: Jakub Raczynski <j.raczynski@samsung.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org,
	davem@davemloft.net, andrew+netdev@lunn.ch, kernel-janitors@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] net/stmmac: Fix typos: 'tx_undeflow_irq' ->
 'tx_underflow_irq'
Message-ID: <aenhiHCZge2dMBFw@AMDC4622.eu.corp.samsungelectronics.net>
MIME-Version: 1.0
In-Reply-To: <52b06f0a-8283-4903-9d8a-2bbdf637dd5d@lunn.ch>
X-CMS-MailID: 20260423090828eucas1p204606b1be37253296ac938bad852e8f4
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----hExaTKD8pSV4C1.mHO0xNjZioIzStKhMnOXfyxqZoi0.l2l2=_2e513_"
X-RootMTR: 20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6
X-EPHeader: CA
X-CMS-RootMailID: 20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6
References: <CGME20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6@eucas1p1.samsung.com>
	<20260421115008.2690541-1-j.raczynski@samsung.com>
	<7eb9e4d4-909c-4203-833d-bd8b664fdfbc@lunn.ch>
	<aeiJ3zr4WJAm1UCk@AMDC4622.eu.corp.samsungelectronics.net>
	<f1d51362-ca8f-481a-b9c1-400ab6422686@lunn.ch>
	<aejYCYObZyFPpLat@AMDC4622.eu.corp.samsungelectronics.net>
	<52b06f0a-8283-4903-9d8a-2bbdf637dd5d@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_020834_857065_CA282144 
X-CRM114-Status: GOOD (  31.06  )
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

------hExaTKD8pSV4C1.mHO0xNjZioIzStKhMnOXfyxqZoi0.l2l2=_2e513_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Apr 22, 2026 at 06:15:20PM +0200, Andrew Lunn wrote:
> On Wed, Apr 22, 2026 at 04:15:37PM +0200, Jakub Raczynski wrote:
> > On Wed, Apr 22, 2026 at 02:47:38PM +0200, Andrew Lunn wrote:
> > > > I don't see anything wrong with it?
> > > > - naming is correct, same as stmmac_extra_stats from common.h, as it
> > > >   wouldn't compile otherwise
> > > > - string length is ok, as max name length is ETH_GSTRING_LEN=32 and it is
> > > >   not close
> > > > - ethtool just polls data from driver and in my tests it is ok
> > > > - all instances of 'undeflow' are changed
> > > > - 'underflow' semantic is ok, 'undeflow' is just not correct
> > > > 
> > > > Please correct me if I am wrong, but imo no issues with this patch.
> > > 
> > > ABI
> > > 
> > > This name is published as part of the kAPI. You are changing its
> > > name. User space could be looking for this name, even thought it has a
> > > typo in it.
> > > 
> > >      Andrew
> > >
> > I don't think it is? This part of extra stats (struct stmmac_extra_stats) and
> > is not part of standard ABI from
> > Documentation/ABI/testing/sysfs-class-net-statistics
> > nor is mentioned in
> > Documentation/networking/device_drivers/ethernet/stmicro/stmmac.rst
> > 
> > These extra stats are specific to stmmac driver and most of these are more
> > than standard
> > https://www.kernel.org/doc/html/v7.0/networking/statistics.html#c.rtnl_link_stats64
> > This name does not exist outside stmmac driver, so while some application may
> > expect this (stmmac specific app), question is should this typo stick?
> 
> 47dd7a540b8a0 drivers/net/stmmac/stmmac_ethtool.c                  (Giuseppe Cavallaro      2009-10-14 15:13:45 -0700   81)     STMMAC_STAT(tx_undeflow_irq),
> 
> It has been exposed to user space for 17 years. In that time, there
> could well be stmmac specific apps using it.
> 
> Just because it is not documented as ABI does not make it not ABI.
> 
>      Andrew
>

Sure, up to you whether NAK or ACK this change.

IMO this name is specific to stmmac and should not be part of any app,
as monitoring tools should be more universal. When monitoring interface this
field will show some other way, via dropped packets and then you would use
driver specific fields for debugging.

Problem is, quick search on github shows this change propagated through
hundreds of Linux forks or different RTOS. But no public app using this found,
at least C app (but well, I didn't browse everything for obvious reasons).
Funny how typo will live everywhere and not be fixed.
So this change would make it differ from all the forks/RTOS'es that will
probably never fix this. So thats the downside.

Question is whether this should then remain that way forever?
And was it really part of some ABI if no one noticed?

Regards
Jakub Raczynski

------hExaTKD8pSV4C1.mHO0xNjZioIzStKhMnOXfyxqZoi0.l2l2=_2e513_
Content-Type: text/plain; charset="utf-8"


------hExaTKD8pSV4C1.mHO0xNjZioIzStKhMnOXfyxqZoi0.l2l2=_2e513_--


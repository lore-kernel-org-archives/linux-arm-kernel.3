Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B04FA1FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 16:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYxyLvufwZHnbxYQy/qzz6gAcWR7dlYuMmEysLwxlSI=; b=5Dyv/aYvL66zfe7EeXPaF3sfqA
	/f9hhdz9X6ebB48wkGIqvyh9hvd+lSX/t6RV3007E2ViMnQsC5qKhwiGfR9gIom3E+cCq9vnTDAbt
	467VcRpQ2fkh9WCl3Wh3K4B3rK75Zb0dXJ/SER0KHzodABR/zs1w7VzZFIYVXUkMgey27XgVY+eeb
	8jA+0gsFJCU8xsjr59VDDqX8zcJv+bespcyeYzT/M7snXqH57frZzBCdJciHlYq85KM8yi7tqDuIN
	BeuWwmhSenNhdnU4H73LSXqucjXW9hxAondx6M1se2mRErjrN0FOb1ggNUANZB1HZDBuAH4Kz/1Bn
	eqkU/47g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFaEm-0000000AU7J-28Fx;
	Wed, 22 Apr 2026 16:15:42 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFaEg-0000000AU6Z-1OV1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 16:15:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=gYxyLvufwZHnbxYQy/qzz6gAcWR7dlYuMmEysLwxlSI=; b=V/pOPKOWSD5uiySVRNqp6A7iNB
	uT2OL2EmTUkjnqs5Kibj2+hMMuwMf+l5MG0yd6wuTSbZyDeKluuv+YbyZZC/m1FiYpV/8gr1W0CoR
	NfJjE+bCx+I+PEtmFdqvipRIXuelyDo0xOtXQvQX6t9x/wXAaOy2Hy1t9V5j1LdD3ihU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wFaES-00H3Xk-Hr; Wed, 22 Apr 2026 18:15:20 +0200
Date: Wed, 22 Apr 2026 18:15:20 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jakub Raczynski <j.raczynski@samsung.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org,
	davem@davemloft.net, andrew+netdev@lunn.ch,
	kernel-janitors@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] net/stmmac: Fix typos: 'tx_undeflow_irq' ->
 'tx_underflow_irq'
Message-ID: <52b06f0a-8283-4903-9d8a-2bbdf637dd5d@lunn.ch>
References: <CGME20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6@eucas1p1.samsung.com>
 <20260421115008.2690541-1-j.raczynski@samsung.com>
 <7eb9e4d4-909c-4203-833d-bd8b664fdfbc@lunn.ch>
 <aeiJ3zr4WJAm1UCk@AMDC4622.eu.corp.samsungelectronics.net>
 <f1d51362-ca8f-481a-b9c1-400ab6422686@lunn.ch>
 <aejYCYObZyFPpLat@AMDC4622.eu.corp.samsungelectronics.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aejYCYObZyFPpLat@AMDC4622.eu.corp.samsungelectronics.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_091534_392182_1A7AF43D 
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

On Wed, Apr 22, 2026 at 04:15:37PM +0200, Jakub Raczynski wrote:
> On Wed, Apr 22, 2026 at 02:47:38PM +0200, Andrew Lunn wrote:
> > > I don't see anything wrong with it?
> > > - naming is correct, same as stmmac_extra_stats from common.h, as it
> > >   wouldn't compile otherwise
> > > - string length is ok, as max name length is ETH_GSTRING_LEN=32 and it is
> > >   not close
> > > - ethtool just polls data from driver and in my tests it is ok
> > > - all instances of 'undeflow' are changed
> > > - 'underflow' semantic is ok, 'undeflow' is just not correct
> > > 
> > > Please correct me if I am wrong, but imo no issues with this patch.
> > 
> > ABI
> > 
> > This name is published as part of the kAPI. You are changing its
> > name. User space could be looking for this name, even thought it has a
> > typo in it.
> > 
> >      Andrew
> >
> I don't think it is? This part of extra stats (struct stmmac_extra_stats) and
> is not part of standard ABI from
> Documentation/ABI/testing/sysfs-class-net-statistics
> nor is mentioned in
> Documentation/networking/device_drivers/ethernet/stmicro/stmmac.rst
> 
> These extra stats are specific to stmmac driver and most of these are more
> than standard
> https://www.kernel.org/doc/html/v7.0/networking/statistics.html#c.rtnl_link_stats64
> This name does not exist outside stmmac driver, so while some application may
> expect this (stmmac specific app), question is should this typo stick?

47dd7a540b8a0 drivers/net/stmmac/stmmac_ethtool.c                  (Giuseppe Cavallaro      2009-10-14 15:13:45 -0700   81)     STMMAC_STAT(tx_undeflow_irq),

It has been exposed to user space for 17 years. In that time, there
could well be stmmac specific apps using it.

Just because it is not documented as ABI does not make it not ABI.

     Andrew


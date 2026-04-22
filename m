Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8ABF9EDD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 14:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5TRuoEZ4QJYPP3Pw1mvOMEiOGYnpwQfSAA/hUqjUCNs=; b=WSgLcWtmvUrN9DdBZxHU7b3Y9m
	Ujsg3MtD0mJSP6d6YreFetmrT1xNTLlqOdcre995opYM/P4gFpOOO14EvCBf8waA3hE2rx4XbBXek
	mKxc9gAYxkTiPFAxKmbGZUp276kK+QwTLKxjKbDfiY/36tuaFtc0iIWyz62FqkASXdhFYWHBUgptF
	c4Sw3ZeDEseCNFBzbA+/mAzYbExuvM81V6k03zxGN+j2gPwHxu9rtZa7opzeqaDP9p0PtSuJl7H7Y
	BypdrqkDLK/rR1fAeQ35Rk7rlyaBnCeYOLpXrSo9NA5pSJ3sKJlzkPGklthYDgxt3PFDRedoDyDOj
	xGedQLvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFYMp-0000000ALre-3ifP;
	Wed, 22 Apr 2026 14:15:51 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFYMj-0000000ALqy-3GDF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 14:15:49 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260422141541euoutp016a6ed74f6fcf0569504839605bdbca4f~os261OXC62064820648euoutp01Y
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 14:15:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260422141541euoutp016a6ed74f6fcf0569504839605bdbca4f~os261OXC62064820648euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1776867341;
	bh=5TRuoEZ4QJYPP3Pw1mvOMEiOGYnpwQfSAA/hUqjUCNs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mKyXyrF+n82XA33u0SGIGDQNCQ7dH4KodlRrt6FXUzWSF6QPl8bvHAsUact8qmSnZ
	 wxrjTmsd8LIJIYuvXAkJHtDuCedpM9ZitVWIQXmJlhfF1w8XLIDD8hDZOLjJw0dXt0
	 CwovohvKHA/dR35P7HtELGDB93JflxGk6YroA+xg=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260422141540eucas1p1f97c4c7a893f2fe7e8e847952e3b6f09~os26mX52C1742517425eucas1p1K;
	Wed, 22 Apr 2026 14:15:40 +0000 (GMT)
Received: from AMDC4622.eu.corp.samsungelectronics.net (unknown
	[106.120.77.34]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260422141540eusmtip28d405d9149856677d74e51eae49a63a2~os26KFPAN1791517915eusmtip29;
	Wed, 22 Apr 2026 14:15:40 +0000 (GMT)
Date: Wed, 22 Apr 2026 16:15:37 +0200
From: Jakub Raczynski <j.raczynski@samsung.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org,
	davem@davemloft.net, andrew+netdev@lunn.ch, kernel-janitors@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] net/stmmac: Fix typos: 'tx_undeflow_irq' ->
 'tx_underflow_irq'
Message-ID: <aejYCYObZyFPpLat@AMDC4622.eu.corp.samsungelectronics.net>
MIME-Version: 1.0
In-Reply-To: <f1d51362-ca8f-481a-b9c1-400ab6422686@lunn.ch>
X-CMS-MailID: 20260422141540eucas1p1f97c4c7a893f2fe7e8e847952e3b6f09
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----hExaTKD8pSV4C1.mHO0xNjZioIzStKhMnOXfyxqZoi0.l2l2=_277a9_"
X-RootMTR: 20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6
X-EPHeader: CA
X-CMS-RootMailID: 20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6
References: <CGME20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6@eucas1p1.samsung.com>
	<20260421115008.2690541-1-j.raczynski@samsung.com>
	<7eb9e4d4-909c-4203-833d-bd8b664fdfbc@lunn.ch>
	<aeiJ3zr4WJAm1UCk@AMDC4622.eu.corp.samsungelectronics.net>
	<f1d51362-ca8f-481a-b9c1-400ab6422686@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_071546_083953_0DBA148B 
X-CRM114-Status: GOOD (  22.02  )
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

------hExaTKD8pSV4C1.mHO0xNjZioIzStKhMnOXfyxqZoi0.l2l2=_277a9_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Apr 22, 2026 at 02:47:38PM +0200, Andrew Lunn wrote:
> > I don't see anything wrong with it?
> > - naming is correct, same as stmmac_extra_stats from common.h, as it
> >   wouldn't compile otherwise
> > - string length is ok, as max name length is ETH_GSTRING_LEN=32 and it is
> >   not close
> > - ethtool just polls data from driver and in my tests it is ok
> > - all instances of 'undeflow' are changed
> > - 'underflow' semantic is ok, 'undeflow' is just not correct
> > 
> > Please correct me if I am wrong, but imo no issues with this patch.
> 
> ABI
> 
> This name is published as part of the kAPI. You are changing its
> name. User space could be looking for this name, even thought it has a
> typo in it.
> 
>      Andrew
>
I don't think it is? This part of extra stats (struct stmmac_extra_stats) and
is not part of standard ABI from
Documentation/ABI/testing/sysfs-class-net-statistics
nor is mentioned in
Documentation/networking/device_drivers/ethernet/stmicro/stmmac.rst

These extra stats are specific to stmmac driver and most of these are more
than standard
https://www.kernel.org/doc/html/v7.0/networking/statistics.html#c.rtnl_link_stats64
This name does not exist outside stmmac driver, so while some application may
expect this (stmmac specific app), question is should this typo stick?

This type of typo is even mentioned in scripts/spelling.txt.

Regards
Jakub Raczynski

------hExaTKD8pSV4C1.mHO0xNjZioIzStKhMnOXfyxqZoi0.l2l2=_277a9_
Content-Type: text/plain; charset="utf-8"


------hExaTKD8pSV4C1.mHO0xNjZioIzStKhMnOXfyxqZoi0.l2l2=_277a9_--


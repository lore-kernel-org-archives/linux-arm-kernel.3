Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6DDF9B5E3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 08:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YrPgAfVKB+qxDc2CcSoeSAb6iAceV4edZfrbKmtZrQI=; b=ElF8lUhUKqkMXWrw6rY7SmpoFL
	zYUTf82F9olbkfQVsP8XdIKSWtKhDhiY3v+zz6fsxEKdeVSY26j4518Y+JPVB7n0VFCpkAYFn9kFG
	CfOnB3AWjY1VH2eIN31USf7lealZ2A0/it1QucGMedtaHl7aq9XE3j3AHJpxvpo4f2+et4eGZbLzd
	FQnCuTkF+sw7y26jlPJcAgDpRu9n4d8EW+f5mUp39tVUVTR9JOdVUHPSUBn5Ch0PQGsn0Yr1wEVnx
	ra24Vl+SdsiXDU8M5+L+vzpK/wIxXjk+/ciwNcd6k/zvG272AWAi/I+TcXZfsirxvUxfxZodxPr18
	TaZ317Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFTA1-00000009nEa-00Of;
	Wed, 22 Apr 2026 08:42:17 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFT9y-00000009nEA-2zu9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 08:42:16 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260422084208euoutp02bde2f1f90fb4b5c9e05939ce0c0c8760~ooTsm0TnQ0592005920euoutp02h
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 08:42:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260422084208euoutp02bde2f1f90fb4b5c9e05939ce0c0c8760~ooTsm0TnQ0592005920euoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1776847328;
	bh=YrPgAfVKB+qxDc2CcSoeSAb6iAceV4edZfrbKmtZrQI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ut+6VcWqnwBTF9NoOJ1778Dtgk6DwTujz0tNMOrl+XSJhLEP753HmZgb0RiD177Af
	 3tHjIWF/a3W1ndJLEnZhsb+IOdv83NH3l7BlOD21/sJaqph4ovi7EeuzvSeAMa6pCv
	 PWNQqT3fo2/oACq2NycAnD+2AeaJCJYUyg0M0/1k=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260422084208eucas1p137123bfccf5ca996ba7f0c56ecf1c1e9~ooTsZ4yvQ0209102091eucas1p1-;
	Wed, 22 Apr 2026 08:42:08 +0000 (GMT)
Received: from AMDC4622.eu.corp.samsungelectronics.net (unknown
	[106.120.77.34]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260422084207eusmtip283f6f1250b08ee1a384856d03b43da69~ooTr9v0DZ1239612396eusmtip2K;
	Wed, 22 Apr 2026 08:42:07 +0000 (GMT)
Date: Wed, 22 Apr 2026 10:42:07 +0200
From: Jakub Raczynski <j.raczynski@samsung.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kuba@kernel.org,
	davem@davemloft.net, andrew+netdev@lunn.ch, kernel-janitors@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] net/stmmac: Fix typos: 'tx_undeflow_irq' ->
 'tx_underflow_irq'
Message-ID: <aeiJ3zr4WJAm1UCk@AMDC4622.eu.corp.samsungelectronics.net>
MIME-Version: 1.0
In-Reply-To: <7eb9e4d4-909c-4203-833d-bd8b664fdfbc@lunn.ch>
X-CMS-MailID: 20260422084208eucas1p137123bfccf5ca996ba7f0c56ecf1c1e9
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----LmDszmo.tbCNUa4xLp9F.eTPx2S9.ufKTU9pfAqIN0sGcyaX=_213c8_"
X-RootMTR: 20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6
X-EPHeader: CA
X-CMS-RootMailID: 20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6
References: <CGME20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6@eucas1p1.samsung.com>
	<20260421115008.2690541-1-j.raczynski@samsung.com>
	<7eb9e4d4-909c-4203-833d-bd8b664fdfbc@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_014215_217709_8192A05E 
X-CRM114-Status: GOOD (  15.54  )
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

------LmDszmo.tbCNUa4xLp9F.eTPx2S9.ufKTU9pfAqIN0sGcyaX=_213c8_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Apr 21, 2026 at 02:39:15PM +0200, Andrew Lunn wrote:
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> > @@ -78,7 +78,7 @@ static const struct stmmac_stats stmmac_gstrings_stats[] = {
> >  	STMMAC_STAT(rx_vlan),
> >  	STMMAC_STAT(rx_split_hdr_pkt_n),
> >  	/* Tx/Rx IRQ error info */
> > -	STMMAC_STAT(tx_undeflow_irq),
> > +	STMMAC_STAT(tx_underflow_irq),
> 
> Please take another look at this one and think about it.
> 
>     Andrew
> 
> ---
> pw-bot: cr
>

I don't see anything wrong with it?
- naming is correct, same as stmmac_extra_stats from common.h, as it
  wouldn't compile otherwise
- string length is ok, as max name length is ETH_GSTRING_LEN=32 and it is
  not close
- ethtool just polls data from driver and in my tests it is ok
- all instances of 'undeflow' are changed
- 'underflow' semantic is ok, 'undeflow' is just not correct

Please correct me if I am wrong, but imo no issues with this patch.

Regards
Jakub Raczynski

------LmDszmo.tbCNUa4xLp9F.eTPx2S9.ufKTU9pfAqIN0sGcyaX=_213c8_
Content-Type: text/plain; charset="utf-8"


------LmDszmo.tbCNUa4xLp9F.eTPx2S9.ufKTU9pfAqIN0sGcyaX=_213c8_--


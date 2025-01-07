Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDD3E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 05:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbXyA0kvTR/wYiNAyrxIIwWMWIbGtt4QXDL2aJ5f6W0=; b=KVxdJ58ahfjlytg4Rru6WrBfUL
	QmM4TcfhIVnQK2dvSbvNFuKaxIWjTsddwUSqYlDhra/KZcu1gRtv9SBkkmmFJtKTuHJJX+Zoi0lqR
	AMac0TdFjFLbY9lRD/40AzgIl/5+1SrgU6KAd8sGyZteQ3yyJfJuFxsAyZQTgA4nF+OiWBJ8obwJj
	9NKMiqX9DK0nRhYhgz45GqImt72fYgvx4uHu0g7yISf7WlWAtGhDOkpJcAzL8TEqY4q7Q7EARNRmz
	GnJVJLqGVLJffkiwCnUbdV1ttwjczNHyI37gy8m55TE98qxJDWbUqWdgwtMmN3twiMUF5Leoag4OE
	ienwHxUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV1z9-00000003Wsy-0Zst;
	Tue, 07 Jan 2025 05:18:35 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV1xt-00000003WnY-02XP;
	Tue, 07 Jan 2025 05:17:20 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5075H6xZ113433;
	Mon, 6 Jan 2025 23:17:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736227026;
	bh=NbXyA0kvTR/wYiNAyrxIIwWMWIbGtt4QXDL2aJ5f6W0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=KAMKsQVigCiDdOc9kI8/quu3qUFNZkPYIUEVg1+zfAiDvujkgxNtcL2gr9bPT9ba7
	 zmKmUXVw1VPMQmgpxQcgouSoWjDa6TAwADEaXbjyjahYHl3od43vokT9PySdYzlpJw
	 dzhmhAVUqgDoV30a6eJszMAjzZwbbPOLEwOmgTEs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5075H6IZ001896
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Jan 2025 23:17:06 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 6
 Jan 2025 23:17:06 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 6 Jan 2025 23:17:06 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5075H5ka124043;
	Mon, 6 Jan 2025 23:17:05 -0600
Date: Tue, 7 Jan 2025 10:47:04 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <vkoul@kernel.org>,
        <kishon@kernel.org>, <sjakhade@cadence.com>, <rogerq@kernel.org>,
        <thomas.richard@bootlin.com>, <u.kleine-koenig@baylibre.com>,
        <eballetb@redhat.com>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH v2 1/2] phy: cadence-torrent: Add PCIe multilink
 configuration for 100 MHz refclk
Message-ID: <bdqmoqipcx6a3w7x4nkk7bsc2hzgxpwgopmyeb3odn2qvvew6j@tk3nu3slvlrf>
References: <20250106131925.263240-1-s-vadapalli@ti.com>
 <20250106131925.263240-2-s-vadapalli@ti.com>
 <1483780d-115f-4555-82b3-3e9cffe82dce@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1483780d-115f-4555-82b3-3e9cffe82dce@wanadoo.fr>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_211717_184418_BF1F4DD4 
X-CRM114-Status: GOOD (  20.24  )
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

On Mon, Jan 06, 2025 at 11:00:14PM +0100, Christophe JAILLET wrote:
> Le 06/01/2025 à 14:19, Siddharth Vadapalli a écrit :
> > From: Swapnil Jakhade <sjakhade@cadence.com>
> > 
> > Add register sequences to support PCIe multilink configuration for 100MHz
> > reference clock. Maximum two PCIe links are supported.
> > 
> > Signed-off-by: Swapnil Jakhade <sjakhade@cadence.com>
> > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > ---
> > 
> > ***NOTE***
> > Since I don't have the hardware required to validate PCIe Multilink +
> > USB functionality, kindly *do not merge* this series until it gets a
> > "Tested-by" tag with proper validation of the functionality.
> > 
> > Regards,
> > Siddharth.
> > 
> >   drivers/phy/cadence/phy-cadence-torrent.c | 130 +++++++++++++++++++++-
> >   1 file changed, 129 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/cadence/phy-cadence-torrent.c
> > index a281c0dfae97..b0b5f4bdd7e2 100644
> > --- a/drivers/phy/cadence/phy-cadence-torrent.c
> > +++ b/drivers/phy/cadence/phy-cadence-torrent.c

[...]

> > @@ -3131,6 +3134,101 @@ static void cdns_torrent_phy_remove(struct platform_device *pdev)
> >   	cdns_torrent_clk_cleanup(cdns_phy);
> >   }
> > +/* Multi link PCIe configuration */
> > +static struct cdns_reg_pairs ml_pcie_link_cmn_regs[] = {
> > +	{0x0002, PHY_PLL_CFG},
> > +	{0x0601, CMN_PDIAG_PLL0_CLK_SEL_M0}
> > +};
> 
> I think that some, if not all, of these new struct could be const, as
> elsewhere in this file.

Thank you for reviewing the patch and pointing this out. I will change
them to 'const' in the v3 series.
> 
> > +
> > +static struct cdns_reg_pairs ml_pcie_xcvr_diag_ln_regs[] = {
> > +	{0x0100, XCVR_DIAG_HSCLK_SEL},
> > +	{0x0001, XCVR_DIAG_HSCLK_DIV},
> > +	{0x0812, XCVR_DIAG_PLLDRC_CTRL}
> > +};

Regards,
Siddharth.


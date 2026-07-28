Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C542DC54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 13:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xq7HKOIIa8ncRr+wMTsqxSmeFE2Qyn66JXVuWHKvI7E=; b=Lt3uVzDbcRdD5CIe0Qs+WaAwmh
	vPFIFYOVWRV4LLlMgFAl/mzvccsJPSJtzNf/GVDS5y+0csTWJV2xg3pTjG6DLzGbxJ7qJNYxN9XCU
	vGl6N0AdeS0jgldYBckZAYvuXgywFMM1SQQStfOZY0uBpkzMudMvzXwfaj3LRQ/HqnP5mAczin6bF
	eNJK/RRyVjauLxd+TBRx7yhlOqwQm2KaGEabBCw6lcOUbtMJ3tMKkTHmxifKaQwZvr3Ci8OqEg6lS
	lBcTmvOas6L4o/BBecSVFoLcfeLCbsJvEwDZsEZOiMMAtqnvSF2suHt2+5Bqjd3mbJEkolVln7zzC
	8FZEJWRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wohSc-00000005JHB-0OGU;
	Tue, 28 Jul 2026 13:03:06 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wohSY-00000005JGA-3ZZv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 13:03:05 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id EF5092029DD;
	Tue, 28 Jul 2026 15:02:53 +0200 (CEST)
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1wohSP-001iqa-2s;
	Tue, 28 Jul 2026 15:02:53 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1wohSP-00000009qkK-3F93;
	Tue, 28 Jul 2026 15:02:53 +0200
Date: Tue, 28 Jul 2026 15:02:53 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Zxyan Zhu <zxyan0222@gmail.com>, andrew+netdev@lunn.ch,
	rmk+kernel@armlinux.org.uk, alexandre.torgue@foss.st.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, hkallweit1@gmail.com, mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: phylink: add phylink_pcs_loopback()
 method for PCS loopback support
Message-ID: <amiofc_3xi5nAt5w@pengutronix.de>
References: <20260727120704.2319467-1-zxyan0222@gmail.com>
 <2c0c6864-99ea-48d6-a889-c886bb91c351@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2c0c6864-99ea-48d6-a889-c886bb91c351@bootlin.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_060303_047339_AC6FBFAD 
X-CRM114-Status: GOOD (  25.92  )
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

On Tue, Jul 28, 2026 at 10:41:12AM +0200, Maxime Chevallier wrote:
> Hi,
> 
> On 7/27/26 14:07, Zxyan Zhu wrote:
> > Some Ethernet MAC drivers (such as stmmac) need to perform PCS-level
> > loopback for selftest purposes when no external PHY is present. Add a
> > new phylink_pcs_loopback() method that allows MAC drivers to request
> > PCS loopback mode through the phylink framework.
> > 
> > Implement the pcs_loopback callback in the stmmac integrated PCS
> > using the GMAC_AN_CTRL_ELE register bit. Add a helper function
> > stmmac_selftest_get_pcs() in stmmac selftests to unify PCS lookup
> > across glue driver PCS and integrated PCS. Update the selftest
> > enable/disable paths to use the new helper.
> > 
> > Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
> 
> I'm actually seriously wondering if we shouldn't just stick to MAC loopback only
> for stmmac selftests. I even have a patch ready to send for that, as I've
> been struggling with selftests in the past days because some PHYs will
> either stop their RXC while in loopback, or bring the carrier down which
> makes the dev_xmit drop the packets we're sending to ourselves.
> 
> Using an external loopnback (in PCS, in PHY, somewhere else...) doesn't
> bring anything to the table given what we are testing today, which is
> internal stmmac behaviour. The MAC loopback (on dwmac1000 and dwmac4 at
> least) happends at the GMII level, so everything we are currently testing
> happens before that.
> 
> If the goal is to validate what comes after (RGMII, PCS behaviour and so on),
> I think we should instead add some other, more generic selftests that aren't
> stmmac specific, that we could run on any netdev, such as the ones Oleksij
> has added in:
> 
>   3e1e58d64c3d net: add generic selftest support

Ack, it is better to push the effort towards generic selftests.

Best Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


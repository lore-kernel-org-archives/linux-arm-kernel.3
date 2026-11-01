Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C795B606A325
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 19:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SuJqhYxF;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=VxAMb9Yk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mPcWOwuHmd2vb2lc/1veBqXCg/9uHVaMceIoosx5SG8=; b=SuJqhYxFInaHyG
	BXGY33Mx3gFD/j+G+Ws+rhYYnD9NaAchHcmhPg4RGvW38gePrMIxU/7vLRdbdax/J+i0A0KjMgRj9
	OjkX4918bcfuzRv0oLjooNoo9/tFC1LIh83YDZ2fMdijrH0F0sWrv1qRVqnDGNJVrbvLc0qYavDVi
	B/hTjFtVOirzvEf5WmUGm31hTWpfbtlaywFQVm4I/tviwHmf68T+s5udK+dnBuWFoEzYl4cv1Lv9y
	UmouR9TkfXQp7h7Og/JkoXF7HJhsu/0gWGVMohQljq2XnMdH4hdsZsGz9rFitXQiUX4/X47QhgRbn
	Ji20RmYx4tLHeu4MwqVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNaxb-0000000Enej-207D;
	Sun, 01 Nov 2026 19:11:19 +0000
Received: from sender-op-o15.zoho.eu ([136.143.169.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNaxY-0000000EneI-0zC1;
	Sun, 01 Nov 2026 19:11:17 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793560235; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=iRBtL5ZI127nRPDqqbTqjRcbsDS30mPeVHezXgaqcjUFMkQDqoK8sp0ijTBCmafp/flXvwvfocEKXG6gqj9RTAhrFG7X6e6PqPbMiPY+ZQKGq+3Uy6mFnYxWh9c6qf3xJwGMrnom/aDUk+LAwkjhpyQjzaWduNH2LiXxDDtZj1M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1793560235; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mPcWOwuHmd2vb2lc/1veBqXCg/9uHVaMceIoosx5SG8=; 
	b=V9p49xnybzD+e3S8j1KhS/QP1iZM8Qkb2xIwizMus9rJS4YRbKeP/jFbaZwVwRaiMzJaLTSKo6lT+f5izvfYny9BInMU6MJOsy2DIsWxpJxsnMgz1isgcTzmVyA5qte7msiZOtUB8Lj75msKPXTYRmW4veWRqcIbsM0jlbIomS4=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=VxAMb9YkFS0HWxIAL9v0QH3eV836oDrQf3tt3baPOt8693zNFZPNp1MlPM0j8dZAgVWcHVzmB2Eor+Q691r/iKGybzsFXRXVcPnGSLheFezn/xMsRaZHqLXZEDyQIiceVoSNrTionsswenYr487X/bcDE33WAf8HieHx4WNrtPQ=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=mPcWOwuHmd2vb2lc/1veBqXCg/9uHVaMceIoosx5SG8=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1793560234157386.45816168150634;
	Sun, 1 Nov 2026 20:10:34 +0100 (CET)
From: Igor Velkov <iav@iav.lv>
To: netdev-bot+sashiko@kernel.org
Cc: iav@iav.lv, andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com, lukas@wunner.de, rafael.j.wysocki@intel.com, wei.fang@nxp.com, niklas.soderlund@ragnatech.se, paul@pbarker.dev, florian.fainelli@broadcom.com, opendmb@gmail.com, Thangaraj.S@microchip.com, shenwei.wang@nxp.com, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v4 5/5] net: phy: postpone PHY interrupts during sleep with MAC-managed PM
Date: Sun, 01 Nov 2026 21:09:52 +0200
Message-ID: <179356019298.3385307.17700170309730679223@iav.lv>
In-Reply-To: <179352219781.3131.16504721138901563596@kernel.org>
References: <20261031-b4-phylib-mac-pm-irq-v3-v4-5-5ba23b3ff9a4@iav.lv> <179352219781.3131.16504721138901563596@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_111116_570841_4F16AFF5 
X-CRM114-Status: UNSURE (   4.76  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -3.1 (---)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Path 1 is real for a PHY that keeps its link interrupt enabled while
armed for WoL. phylink_suspend() calls phylink_stop() before
phylink_speed_down(), so the driver's suspend runs first. RTL8211F and
AN8801R mask the link interrupt there; on Helios64 (stmmac + RTL8211F,
wakeup-source) WoL suspend passed 4/4, though I did not log the link
speed. Of the wakeup-capable PHYs in drivers/net/phy, BCM54210E leaves
it enabled. Before this series, the link-up after the downshift could
arrive after stmmac gated its clocks, and phy_interrupt() would read the
PHY over a dead MDIO bus: the hang this series fixes. An aborted suspend
is the safer failure.

Path 2: phy_stop() with wol_enabled leaves the copper link up
(rtl821x_suspend() skips genphy_suspend()), so the MAC causes no link
interrupt. Counting netdev->ethtool->wol_enabled as a system wakeup is
what phy_interrupt() already does for PHYs without mac_managed_pm.


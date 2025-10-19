Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0003BCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 21:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eenAxMjIeldA+zxHFfckTsl9LnonghykutSollA6fAQ=; b=4YnDZs1z2GKMmX6YY+jWmbcz9l
	CSdCOvdTj45qvpC/t51yxjmVI1WP3BlDLFveUk4czAZo1zBZlxmlmfyEP31qA+CUP9tEiGKyUJYEn
	F/MFXfgDAoR71kHMsx7FHw0eJgyuNzyPaeePQ3L75cu8+c/wyuGuFcC2/qOWOlXUgLTHMMk2A2Qtf
	JBKEfb0yPtIh0fa1GUzbFF+kbobpy6R+7UE/zTxeiXHNJCrxkOuSnsn30YGIHeSyzzfBDQENM4MGj
	H+AvZqFumALlqHz9RZCDMpakndbFZW0SuL3fIU/4tVSOWnYG3Ata7qN2kOZJz7NnNtsW5pN+60btI
	cusC9Oig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAaiY-0000000BRda-0P69;
	Sun, 19 Oct 2025 21:13:30 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAaiV-0000000BRcl-24YD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Oct 2025 21:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eenAxMjIeldA+zxHFfckTsl9LnonghykutSollA6fAQ=; b=DDWPScIPLCw0DfEas9sSnrqwnl
	924rKv9Y9u9qfoZfas7/Qr6FGRpBUxS8BnyqKUFxCoUBMOkOonczyDrjqwiCB5Pb7araz8LK81dnf
	FI3wZOhObn3NQBuReVlAfSSLuXoFgeOHOjX1wBwyc4YWhT5G5oJeGESzQq8EDq1kC/CERg0rqqSXd
	Dc8MmjXY7lztAYxEDIWIEXa+ydtzMt0vpvDF+Aq3m4EYZPcyTuyZrcHxDMg1JdOaUqhrcWWLPMc28
	CY4e5PkiqYHcPvlnGh5LhOcNRkETqSFJUF9tFEhdVZlakgKKv8mP6TLEhRwycx/zLuxhvhUZMy5Og
	teXOzw5A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38750)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vAahy-000000001Ws-1Xwg;
	Sun, 19 Oct 2025 22:12:54 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vAPeu-0000000068f-3P1z;
	Sun, 19 Oct 2025 10:25:00 +0100
Date: Sun, 19 Oct 2025 10:25:00 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>,
	netdev@vger.kernel.org, sophgo@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] net: stmmac: dwmac-sophgo: Add phy interface filter
Message-ID: <aPSubO4tJjN_ns-t@shell.armlinux.org.uk>
References: <20251017011802.523140-1-inochiama@gmail.com>
 <34fcc4cd-cd3d-418a-8d06-7426d2514dee@lunn.ch>
 <i5prc7y4fxt3krghgvs7buyfkwwulxnsc2oagbwdjx4tbqjqls@fx4nkkyz6tdt>
 <c16e53f9-f506-41e8-b3c6-cc3bdb1843e1@lunn.ch>
 <aPP9cjzwihca-h6C@shell.armlinux.org.uk>
 <370d13b7-bba8-449d-9050-e0719d20b57c@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <370d13b7-bba8-449d-9050-e0719d20b57c@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_141327_837219_51C74983 
X-CRM114-Status: GOOD (  18.51  )
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

On Sun, Oct 19, 2025 at 02:04:02AM +0200, Andrew Lunn wrote:
> > "rgmii-id" doesn't mean "there is a delay _somewhere_ in the system".
> > It's supposed to mean that the PHY should add delays on both tx and
> > rx paths.
> 
> When passed to the PHY it means that.
> 
> However, DT describes the hardware, the PCB. "rgmii-id" means the PCB
> does not provide the delays. So the MAC/PHY combination needs to add
> the delays. We normally have the PHY provide the delays, so the
> phy-mode is normally passed straight to the PHY. However, if the MAC
> is adding a delay, which it is in this case, in one direction and
> cannot be turned off, the value passed to the PHY needs to reflect
> this, to avoid double delays.
> 
> And because the MAC delay cannot be turned off, it means there are PCB
> designs which don't work, double delays. So it would be nice not to
> list them in the binding.

Well, I find this confusing. I'd suggest there needs to be common code
to deal with it so we can stop thinking about it, and just push everyone
towards using the common code.

phy_interface_t phy_fix_phy_mode_for_mac_delays(phy_interface_t interface,
						bool mac_txid, bool mac_rxid)
{
	if (!phy_interface_mode_is_rgmii(interface))
		return interface;

	if (mac_txid && mac_rxid) {
		if (interface == PHY_INTERFACE_MODE_RGMII_ID)
			return PHY_INTERFACE_MODE_RGMII;
		return PHY_INTERFACE_MODE_NA;
	}

	if (mac_txid) {
		if (interface == PHY_INTERFACE_MODE_RGMII_ID)
			return PHY_INTERFACE_MODE_RGMII_RXID;
		if (interface == PHY_INTERFACE_MODE_RGMII_TXID)
			return PHY_INTERFACE_MODE_RGMII;
		return PHY_INTERFACE_MODE_NA;
	}

	if (mac_rxid) {
		if (interface == PHY_INTERFACE_MODE_RGMII_ID)
			return PHY_INTERFACE_MODE_RGMII_TXID;
		if (interface == PHY_INTERFACE_MODE_RGMII_RXID)
			return PHY_INTERFACE_MODE_RGMII;
		return PHY_INTERFACE_MODE_NA;
	}

	return interface;
}

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


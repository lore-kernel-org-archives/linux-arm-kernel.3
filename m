Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34AC1048925
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 00:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZdE3v1uM6dshlMijAz4RF1iw09aYz2wg0tBwp/dyGA=; b=nXE2ypBh4Ud7AkANZPbaqVwlsP
	aAVI00Kx7Qwww0NbtoP7+bQptN8zUICWGtUYOq094nbIMWyehQMV66SRaJxBbex9xD3HpS4ANErlI
	2UhOZ5LuO4jWh4wR3/7NzZISsZLwzxNMqUKgueq+Ygr2d8N4rh4rSLgg8WkqlKy583s6Z28VXJsXr
	YFcEp9D8a2PyYkPhIiC3FNxOJz1D0KNEVgBEjIgToT9ZGHdSb/QUkERw6sfZmg4KsgRnc2b2bi+2K
	wMeykvmhN7i7ewMgYe0C+v/60qnCvSneMzG5JIi8teC55T5/rSdCrZg4su+7tGnea/FpiidBePyoY
	Jl/CWa6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw7vz-00000009JD6-1SrQ;
	Sat, 28 Feb 2026 00:11:51 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw7vw-00000009JCh-2r5v;
	Sat, 28 Feb 2026 00:11:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GZdE3v1uM6dshlMijAz4RF1iw09aYz2wg0tBwp/dyGA=; b=XlYnerF5xK1Ql3eFDyGif3TCY2
	lfIAnzkBeHR3C7xAuoMd0iZlod2dCvxiH0kDHYgoxRbb2hPiQ3d8W5ER859VOyBAYAdOKf8cs7NTJ
	Me1GZrqatduWjJVAio3hJRolyvfJkQ1VfGuyFKnzC+O8Oc6LT/vjJKxMaB4RRiqSvur17Yb4LN0zC
	cHIzkBRkf5Qx+kZfdWnscVzDOZ0bu03U2P11u82Yp8thQpexjjSWxx5Z9xzRop9apWv+tyit5ihu3
	/xNEh60H0vH8sU1tfSghfrBv+Ucx5M9JQu8IYeO30o5BJ+YGyycDBvbLTvApaoifmtps/5GKE8BKb
	dQDPhLoQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46012)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vw7vj-000000001Rv-3OlC;
	Sat, 28 Feb 2026 00:11:35 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vw7ve-000000003WJ-2CMn;
	Sat, 28 Feb 2026 00:11:30 +0000
Date: Sat, 28 Feb 2026 00:11:29 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RESEND2 net-next 0/8] net: stmmac: qcom-ethqos: further
 serdes reorganisation
Message-ID: <aaIysVxy-WxbiJz9@shell.armlinux.org.uk>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_161148_718948_FD3EAEF3 
X-CRM114-Status: GOOD (  18.12  )
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

On Thu, Feb 26, 2026 at 11:07:16PM +0000, Russell King (Oracle) wrote:
> This is part 2 of the qcom-ethqos series, part 1 has now been merged.
> 
> This part of the series focuses on the generic PHY driver, but these
> changes have dependencies on the ethernet driver, hence why
> it will need to go via net-next. Furthermore, subsequent changes
> depend on these patches.
> 
> The underlying ideas here are:
> 
> - get rid of the driver using phy_set_speed() with SPEED_1000 and
>   SPEED_2500 which makes no sense for an ethernet SerDes due to the
>   PCS 8B10B data encoding, which inflates the data rate at the SerDes
>   compared to the MAC. This is replaced with phy_set_mode_ext().
> - allow phy_power_on() / phy_set_mode*() to be called in any order.
> 
> Mohd has tested this series, but it would be great to get acks/reviews
> from the generic PHY maintainers.

So, PW says "changes requested" - please let me know what changes have
been requested.

The AI review for patch 7 says:

  This commit fixes a bug but lacks a Fixes: tag. The commit modifies
  behavior introduced in 360000820ae2 ("phy: qcom-sgmii-eth: add
  .set_mode() and .validate() methods") by making phy_power_on() call
  qcom_dwmac_sgmii_phy_calibrate() to restore the previous setup, and by
  making qcom_dwmac_sgmii_phy_set_mode() check if the PHY is powered on
  before attempting calibration.

  Should this commit include:

  Fixes: 360000820ae2 ("phy: qcom-sgmii-eth: add .set_mode() and .validate() methods")

which is _wrong_, this isn't a bug fix.

So, in light of AI review being incorrect, my comment about re-sending
due to the AI review is no longer relevant, and no changes are required.
The only thing that's necessary is to have Vinod's ack added to patches
4, 5, 6 and 7, as he gave them against the very first posting of these
on Wednesday. This is despite waiting the required 24h before sending
the first resend.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!


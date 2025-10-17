Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C440CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 12:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7o6kaIE75Lvkn1Hzsa0EHqdnim3Q6JNR3QONO2lEd0=; b=JU3v8ErzVMBmWrM9xvwUEKWmv1
	Oa+fTcDd6cjXOCEkXd8WwhRpEJt22e2x7n5iuxIQq02NDNH95vG1ujGK2qESyOmdoqXM9q41ZX1Rv
	dGwbTlBGKAYiqqMphV1Xk2gJ/U5nl2FxXglHFAhmg27aT15EHic0zc1zZS4T5qbJj4MpsqCWmWAiT
	bSbW62B15f+l09nSuqLEOoMw4KnLnGVuvaIphJYUXMAhu1lKZrnrvQGS7b0UHJC5RTsBjhYIIeWvK
	bfiHOxGSS3mbeh7HLcGqSWclosXgnR9O6LoKWbh2lS9BFGSL8BWCaHjcAQy9GGD+aFtCidmPNHMxQ
	em6BP/IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9jCm-00000007lAU-0cm7;
	Fri, 17 Oct 2025 12:05:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9jCk-00000007l8J-0q3R
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 12:05:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=S7o6kaIE75Lvkn1Hzsa0EHqdnim3Q6JNR3QONO2lEd0=; b=iwMVgzQTduo2SFpNh18RAIgwrz
	Y9LxB06CHqQZmj3Aa3TCFnLKyHkpAtAmxQ0r3YscIFIcEpaJnJOKYvf1SOEvbMykf9j14v2J8LdPv
	sBNJAOhtN8hROPM+PJZyr/FhfZ7vUxixoflTo13CRJhLlbUR0HWsACqci/7e7StGEmu4okurjaMO7
	ALWesuKNRGVW9T91K0NwKlutiKcLGKepbk4cXQb6MtRTn60hk2DY3WQXqlM6Tb19mweEIwpoQ1wws
	6MfkkkApSErMnRDQQDvkK1YDG1cpJGWQgq7tSHHTvHQw+gi08H8t+T3DIBBBE6AHnBisC/4we/3c+
	JOPJxmNQ==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9jCh-00000007Yez-1GFJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 12:05:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=S7o6kaIE75Lvkn1Hzsa0EHqdnim3Q6JNR3QONO2lEd0=; b=A1AgL6yoYlhCaXvlRRCKMen+6J
	m7k4cJGOC14N7C0C5vRzSs/bT7KWPqEpw1h91BImYgYB5h3uX81i01LWyaOKXyIwX86mRKibLxKKt
	rnfuiAfk2EkVOwsdjEUucJx5Ud6mKrrcScBNXZWQYSnKqFaBkiLMlNiVOHcyrr7+FdMZ1bzefy5Hz
	dmwiEewKRmsNTN/1R3xgMTuSIJQF57FntFspxo3/sbcVtWXjH9tesutwheL6moXe9AzEtBqjXCAwl
	rE2cUpkqoousaa50RYZvtywW2zyI7I/mJBckP8vxQa00zCYrhbBzyZcnE5MCm5aKbV/4Q92gSFl30
	rko6Wa9A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35850 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v9jCb-000000007qJ-0783;
	Fri, 17 Oct 2025 13:04:57 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v9jCZ-0000000B2PP-2cuM;
	Fri, 17 Oct 2025 13:04:55 +0100
In-Reply-To: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
References: <aPIwqo9mCEOb7ZQu@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 4/6] net: phylink: add phylink managed wake-on-lan
 PHY speed control
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v9jCZ-0000000B2PP-2cuM@rmk-PC.armlinux.org.uk>
Date: Fri, 17 Oct 2025 13:04:55 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_130503_468987_9C0EF1F6 
X-CRM114-Status: GOOD (  13.35  )
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

Some drivers, e.g. stmmac, use the speed_up()/speed_down() APIs to
gain additional power saving during Wake-on-LAN where the PHY is
managing the state.

Add support to phylink for this, which can be enabled by the MAC
driver. Only change the PHY speed if the PHY is configured for
wake-up, but without any wake-up on the MAC side, as MAC side
means changing the configuration once the negotiation has
completed.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/phy/phylink.c | 12 ++++++++++++
 include/linux/phylink.h   |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 939438a6d6f5..26bd4b7619dd 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2576,6 +2576,12 @@ static bool phylink_phy_supports_wol(struct phylink *pl,
 	return phydev && (pl->config->wol_phy_legacy || phy_can_wakeup(phydev));
 }
 
+static bool phylink_phy_pm_speed_ctrl(struct phylink *pl)
+{
+	return pl->config->wol_phy_speed_ctrl && !pl->wolopts_mac &&
+	       pl->phydev && phy_may_wakeup(pl->phydev);
+}
+
 /**
  * phylink_suspend() - handle a network device suspend event
  * @pl: a pointer to a &struct phylink returned from phylink_create()
@@ -2625,6 +2631,9 @@ void phylink_suspend(struct phylink *pl, bool mac_wol)
 	} else {
 		phylink_stop(pl);
 	}
+
+	if (phylink_phy_pm_speed_ctrl(pl))
+		phy_speed_down(pl->phydev, false);
 }
 EXPORT_SYMBOL_GPL(phylink_suspend);
 
@@ -2664,6 +2673,9 @@ void phylink_resume(struct phylink *pl)
 {
 	ASSERT_RTNL();
 
+	if (phylink_phy_pm_speed_ctrl(pl))
+		phy_speed_up(pl->phydev);
+
 	if (test_bit(PHYLINK_DISABLE_MAC_WOL, &pl->phylink_disable_state)) {
 		/* Wake-on-Lan enabled, MAC handling */
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 59cb58b29d1d..38363e566ac3 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -157,6 +157,7 @@ enum phylink_op_type {
  * @lpi_timer_default: Default EEE LPI timer setting.
  * @eee_enabled_default: If set, EEE will be enabled by phylink at creation time
  * @wol_phy_legacy: Use Wake-on-Lan with PHY even if phy_can_wakeup() is false
+ * @wol_phy_speed_ctrl: Use phy speed control on suspend/resume
  * @wol_mac_support: Bitmask of MAC supported %WAKE_* options
  */
 struct phylink_config {
@@ -178,6 +179,7 @@ struct phylink_config {
 
 	/* Wake-on-Lan support */
 	bool wol_phy_legacy;
+	bool wol_phy_speed_ctrl;
 	u32 wol_mac_support;
 };
 
-- 
2.47.3



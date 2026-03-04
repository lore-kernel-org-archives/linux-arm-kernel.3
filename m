Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92657EB7EB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 08:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QpVZHAyEJ8psaVdJL6ep6frfkNeyqoUFSmGxnRhF8MY=; b=hggx99RaMYl6iMuq5ycOckS2aD
	p4oAzTK6Tbufa9FSceZw1KCPEm8QiUZ9b9ycvjtbyOOJdKyAFK4O+mpBO/yBeDNAvGIk7KWO15d7i
	ATYPbUS28jeEKYfvlEAaw82WirHI96aux6+8lzvCf+CUKbd06D9+Gimi9gVvW52kR/x/Oxyg38Bhz
	NL3Bd0whCqoHnJFgxK3aemPwxrCSVYdN4W/CdLAfGAQJZyKZd/pTzkJePfcGEQ7fkQ1kSZmoCoGsb
	2mnj6onxCzmdj9jY403oz2rGQQn6OiYa4Y68sPSSmV3Oz5HxrjOzdp1S+ZByzM9lEOwzPVDZLwnUH
	koEyJ0Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhvL-0000000Gmb2-0AUg;
	Wed, 04 Mar 2026 08:49:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhvJ-0000000GmXx-0zoK
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Mar 2026 08:49:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=QpVZHAyEJ8psaVdJL6ep6frfkNeyqoUFSmGxnRhF8MY=; b=E4FVYXN6p7IbK+PqmFiMfTHr6p
	oaX5kah+qz2YF8JOzw2Db93Yk2TkN8+OLTP8FJlCgqNAu3s48vtU7gUp45j7moyBCDIXSc9uA9aia
	8qpx64U3vzAryWsQQfcx3aU90Hts1zOi1qMa3T9/PbGbxkOt5CHWZOCPmz2mrwn+7cKt3hSU17Xgz
	DVumEN92KD5ouGl6tEk3N1WVv/XG4lM1Uka5l9JeCReBmuLscOodl73zD2j8Xwlc4PuGYro9/Hpqc
	R4acCL+AiqC+Lc2kGdxnvh5c8+2bWl+63Xuy6ygp54Mhjbf6sa+pov6oIC41iMQ1dNWswwIavTrwU
	+cOi6JUw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxhvG-00000004AZ2-1jvN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 08:49:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QpVZHAyEJ8psaVdJL6ep6frfkNeyqoUFSmGxnRhF8MY=; b=bu/xsFZTbDAztM6khsx6TJTzI5
	lldNIvO3V7OLpAee24johonSOJx5uT/3cpHV1I4fTGYSgvg7ZUTRN9L6ZH89OVAcqE05Y4x79z0XV
	FtADvtqcgO6XrGKZFkXaXi4j5nub6YRvWYgD4CW/O957Y3EJ8rINjeQS6goub6J4xwpIClnbh3mCj
	XFXvt7p5UB4u2UoOrxSfaRhLF09iWw/HYj628HZvYEBobJS7XWZAzh4RUZiOmDdZnsRSQEGLpmGhp
	wLwIze/shASbjcbb5cHvsaLvnAhwMVScuqU5+xVmcM9AUP5Z9heWsOWGxXfNwor3gaYi0hDQ5U7Pi
	X7YargNQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35044 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vxhv6-000000006AS-3NAN;
	Wed, 04 Mar 2026 08:49:29 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vxhv3-0000000BqGp-23Ql;
	Wed, 04 Mar 2026 08:49:25 +0000
In-Reply-To: <aafxqCvJ_XY4YbWw@shell.armlinux.org.uk>
References: <aafxqCvJ_XY4YbWw@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH RFC net-next v2 6/7] net: stmmac: configure SGMII AN control
 according to phylink
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vxhv3-0000000BqGp-23Ql@rmk-PC.armlinux.org.uk>
Date: Wed, 04 Mar 2026 08:49:25 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_084938_657393_683A9DE2 
X-CRM114-Status: GOOD (  12.83  )
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

Provide phylink with the integrated PCS autonegotiation capabilities,
and configure the PCS's AN settings according to phylink's requested
requirements.

This may cause regressions.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 24 +++++++++++++------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index ba0cf51e67f7..0f9616fad4ef 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -32,6 +32,9 @@ static unsigned int dwmac_integrated_pcs_inband_caps(struct phylink_pcs *pcs,
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
 	unsigned int ib_caps;
 
+	if (interface == PHY_INTERFACE_MODE_SGMII)
+		return LINK_INBAND_ENABLE | LINK_INBAND_DISABLE;
+
 	if (phy_interface_mode_is_8023z(interface)) {
 		ib_caps = LINK_INBAND_DISABLE;
 
@@ -139,22 +142,29 @@ static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
 				       bool permit_pause_to_mac)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
-	bool changed = false, ane = true;
+	void __iomem *an_control = spcs->base + GMAC_AN_CTRL(0);
+	bool ane, changed = false;
+	u32 ctrl;
+
+	ane = neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED;
 
 	/* Only configure the advertisement and allow AN in BASE-X mode if
 	 * the core supports TBI/RTBI. AN will be filtered out by via phylink
 	 * and the .pcs_inband_caps() method above.
 	 */
 	if (phy_interface_mode_is_8023z(interface) &&
-	    spcs->support_tbi_rtbi) {
-		ane = neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED;
-
+	    spcs->support_tbi_rtbi)
 		changed = dwmac_integrated_pcs_config_aneg(spcs, interface,
 							   advertising);
-	}
 
-	dwmac_ctrl_ane(spcs->base, 0, ane,
-		       spcs->priv->hw->reverse_sgmii_enable);
+	ctrl = readl(an_control) & ~(GMAC_AN_CTRL_ANE | GMAC_AN_CTRL_SGMRAL);
+	if (spcs->priv->hw->reverse_sgmii_enable)
+		ctrl |= GMAC_AN_CTRL_SGMRAL | GMAC_AN_CTRL_ANE;
+	else if (ane)
+		ctrl |= GMAC_AN_CTRL_ANE;
+	else
+		ctrl |= GMAC_AN_CTRL_SGMRAL;
+	writel(ctrl, an_control);
 
 	return changed;
 }
-- 
2.47.3



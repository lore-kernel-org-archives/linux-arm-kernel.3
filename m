Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF4FC197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z915uYURLS9YYBK3HUBsVHhjYSPFcN02eHGGjD1vORo=; b=kaItgvcwG8u3OLLDPr/tQa8TYS
	Cv8hXgI/AS2U1JeW7EVd8WVrWLVkKamVoGbgMScguN2vSwGYpe2H2rzYvyCHgk71igZxDnG9NqlMH
	w94y8XmLxuhQoZrHkUS54PddFbKZazTCI1Mu+LlMty9/J5mkSJsbIDtko4aM7wcWCyxiL7Aob+YEB
	PRtM48aPv3DqT/e2d+OmA0IvBGPKHpDFcMSe+c3i6gT6s4hmsJSC9u3K4wbAs4cUS/rXMkAehxjtU
	7Q0OdJqeF0gVkCDWIuV7KynPbAy0EDawZftYkogVaYkC8QWFBuOATJKPSHR63KXJKseQZOmSfI/jO
	As7P4pnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjh1-00000008TeL-2gSU;
	Thu, 27 Feb 2025 19:37:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf1z-00000007lnP-3ww6
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 27 Feb 2025 14:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=Z915uYURLS9YYBK3HUBsVHhjYSPFcN02eHGGjD1vORo=; b=qTNmiz9UgcCMsC5At+o2cmahLi
	ws+TAILeOp5lgVfZJwBvWSVR2fbKsCpYGn78y85FHCtaMFDDrcid8SOypiYbmTXlFqZ7UHbl4u9MX
	/LV/IS1yxtR12PK2ejL4DNuXHNSXzG6ESoNTr3wtBbpax+W12WJkZrhD8WsF+Q9wOE5AuIRSBx7fI
	DbMXI0L3Jj/3RLEow/9eJtq2SbEHuCO8zVt4xjz3nszAYaC/6HTYmyKGFXFRrinwC+oeGItatgrVi
	buE2QCFG55mgf7FSx39xCIjGUkBJRYKTvwwDvfjzHM3dWLn6jZ6Hobqa01wl1Ru8k3BI9SWLuRR1B
	Es2iR7dw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf1x-00000003oSF-0vrJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 14:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Z915uYURLS9YYBK3HUBsVHhjYSPFcN02eHGGjD1vORo=; b=hhiZzwczH9Jwtadlk7SMudUeFF
	XLSnG+YnH9bmqrRioM9+hniodnLIItH5IQk14TNZ4+Hbsa1kgzAylRWI1L0lNXz8QwWXXQJOU4o/u
	vHUg11YFlr88KC6I7w140r+cI83jfmFgGOFxx9tByGPC6UHsdmPrXsNiNkRxvNsCxgpe/nIfhQH4H
	op8/6arxw0G8A2P0eKaISlNJFq0v1fgsiYlxumE6cR8kpxgJGiwZEy4gyUlmKoA32iBOTmwtzgbB0
	4kZrZTjqaTTi+oh6VhAJUeyXoe5SZAsgzcPSMqRATmFbne7xSb7CrAQnCRKjcE7thmWKcK6kLfM6Z
	ViGD3M5g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35842 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tnf1r-0007R1-1z;
	Thu, 27 Feb 2025 14:38:23 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tnf1X-0056LI-9i; Thu, 27 Feb 2025 14:38:03 +0000
In-Reply-To: <Z8B4tVd4nLUKXdQ4@shell.armlinux.org.uk>
References: <Z8B4tVd4nLUKXdQ4@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Thierry Reding <treding@nvidia.com>
Subject: [PATCH RFC net-next 4/5] net: stmmac: move phylink_resume() after
 resume setup is complete
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tnf1X-0056LI-9i@rmk-PC.armlinux.org.uk>
Date: Thu, 27 Feb 2025 14:38:03 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_143829_374824_70D73C06 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
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

Move phylink_resume() to be after the setup in stmmac_resume() has
completed, as phylink_resume() may result in an immediate call to the
.mac_link_up method, which will enable the transmitter and receiver,
and enable the transmit queues.

This behaviour has been witnessed by Jon Hunter on the Jetson TX2
platform (Tegra 186).

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index fbcba6c71f12..23c610f7c779 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7924,12 +7924,6 @@ int stmmac_resume(struct device *dev)
 			return ret;
 	}
 
-	rtnl_lock();
-	phylink_resume(priv->phylink);
-	if (device_may_wakeup(priv->device) && !priv->plat->pmt)
-		phylink_speed_up(priv->phylink);
-	rtnl_unlock();
-
 	rtnl_lock();
 	mutex_lock(&priv->lock);
 
@@ -7948,6 +7942,11 @@ int stmmac_resume(struct device *dev)
 	stmmac_enable_all_dma_irq(priv);
 
 	mutex_unlock(&priv->lock);
+
+	phylink_resume(priv->phylink);
+	if (device_may_wakeup(priv->device) && !priv->plat->pmt)
+		phylink_speed_up(priv->phylink);
+
 	rtnl_unlock();
 
 	netif_device_attach(ndev);
-- 
2.30.2



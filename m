Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B688C10775E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 16:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FihZi7bONKdybIQigzqa4p0oM8MhTq/34NbRQUirsLk=; b=xV2165eQ44N6Io5EfaRbntV78A
	wCIiMBaV2dJHYzK3vP4+OwPNFJZTzZ8fskiql0eYofBaSUDTau7NO6Vi+XNP8X+ICzbCbux2DngS2
	UMif4988TXykmSS234WHsHh4Sq3ahumwxKA87l94xXiI56BhGaMyfPwhji0WMNNyvJqk6K5ik2V8O
	7doP1OHEmhyp0lAYddQL+UXDfhvnpXdNDppEiQc8dhbymPqiCSYWX8uyNt2Dq4sZY50OnHpq+LKF4
	N/EVjkOwCaC+4sV3S3hne3yZarzrZ61ERS9Y8sA+s4Q6jWtUA7NGirkQ8CiqHNFcKFxgla7bIX/J1
	zl9XiEXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tQ1-00000008tCp-33Aw;
	Wed, 18 Mar 2026 16:06:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tPz-00000008tAG-3gtV
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 16:06:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=FihZi7bONKdybIQigzqa4p0oM8MhTq/34NbRQUirsLk=; b=TBITwswfP91vqlYpXL/wKhC/fs
	u03/2lxr2+6bZs54K0wJjKz9231+Ya3iVcw35UxUXh2KMm2+EMlNJOHH+rmip+Sfg69WvFygRx+Fz
	vCBgM/K49LaDJmWaHCIpRMx1X8zPPgXThCbFMQTl8HNcJbbNApp59YcW3dGRxhTWboj6nOg5H9A+u
	NmFh2ik1GN7EReH/C2V2/eKoLeSLwhN6ILHlVKMVF1BYFOswiCgToPd+mjkhWFBLC+kxHJPUOnxA6
	O5FSaAXvd99g6dnB9ipw3YqCk0Ul7DXorZzdHR1e3bcdAN5+7GAZ9HgLo7Mn5XrNy/3xDVqnE4gr+
	z+XPyuVg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tPw-0000000BfcJ-2Ztb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 16:06:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FihZi7bONKdybIQigzqa4p0oM8MhTq/34NbRQUirsLk=; b=Q2ZiMJsgx3eXApFZOxJSrxg7tH
	WULxzb7NAlMd0zYnODtz15zSqSnwF+S6+JAhsGvrVXKz8RYm9Z2xtLiUNY7ZKcrTNDOVwarg7wQsB
	eu65PpEEj5IbKfYzKvDaaShjrX/Se2U9+qOSj9UjlztnG6A2t5KAUL4KIZaPJ6N03NFGu6Hyby9xb
	GBfH0OlHcS/h+Efo+lIfZJwrj7nfyd8d7Sp/Up6M1j9gUYTw0DAwd0GHpzT9N3xb05NGfLAz4wxaA
	NOgcxn8/3bj5Dwl17+mkrMVS6efXE05nlOIAlqxB7Kbeweo4F6BhFrQFW8+gJHCw/adutznakW1OK
	SGRA1u5g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38286 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w2tPm-000000003fP-2xh0;
	Wed, 18 Mar 2026 16:06:34 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w2tPj-0000000DYAv-2JcZ;
	Wed, 18 Mar 2026 16:06:31 +0000
In-Reply-To: <abrNYVfZ1Iwff2EI@shell.armlinux.org.uk>
References: <abrNYVfZ1Iwff2EI@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next v2 maybe? 5/5] net: stmmac: use integrated PCS for
 BASE-X modes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w2tPj-0000000DYAv-2JcZ@rmk-PC.armlinux.org.uk>
Date: Wed, 18 Mar 2026 16:06:31 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_160644_816155_D9549D31 
X-CRM114-Status: GOOD (  14.17  )
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

dwmac-qcom-ethqos supports SGMII and 2500BASE-X using the integrated
PCS, so we need to expand the PCS support to include support for
BASE-X modes.

Add support to the prereset configuration to detect 2500BASE-X, and
arrange for stmmac_mac_select_pcs() to return the integrated PCS if
its supported_interfaces bitmap reports support for the interface mode.

This results in priv->hw->pcs now being write-only, so remove it.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/common.h      | 4 ----
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index f1628de8ed18..c9dac55d0c02 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -278,9 +278,6 @@ struct stmmac_safety_stats {
 #define FLOW_TX		2
 #define FLOW_AUTO	(FLOW_TX | FLOW_RX)
 
-/* PCS defines */
-#define STMMAC_PCS_SGMII	(1 << 1)
-
 #define SF_DMA_MODE 1		/* DMA STORE-AND-FORWARD Operation Mode */
 
 /* DMA HW feature register fields */
@@ -632,7 +629,6 @@ struct mac_device_info {
 	unsigned int unicast_filter_entries;
 	unsigned int mcast_bits_log2;
 	unsigned int rx_csum;
-	unsigned int pcs;
 	unsigned int num_vlan;
 	u32 vlan_filter[32];
 	bool vlan_fail_q_en;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 90af7212b8d8..fba12a7a380e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1027,11 +1027,8 @@ static struct phylink_pcs *stmmac_mac_select_pcs(struct phylink_config *config,
 			return pcs;
 	}
 
-	/* The PCS control register is only relevant for SGMII, TBI and RTBI
-	 * modes. We no longer support TBI or RTBI, so only configure this
-	 * register when operating in SGMII mode with the integrated PCS.
-	 */
-	if (priv->hw->pcs & STMMAC_PCS_SGMII && priv->integrated_pcs)
+	if (priv->integrated_pcs &&
+	    test_bit(interface, priv->integrated_pcs->pcs.supported_interfaces))
 		return &priv->integrated_pcs->pcs;
 
 	return NULL;
@@ -1290,7 +1287,6 @@ static void stmmac_check_pcs_mode(struct stmmac_priv *priv)
 
 	if (priv->dma_cap.pcs && interface == PHY_INTERFACE_MODE_SGMII) {
 		netdev_dbg(priv->dev, "PCS SGMII support enabled\n");
-		priv->hw->pcs = STMMAC_PCS_SGMII;
 
 		switch (speed) {
 		case SPEED_10:
-- 
2.47.3



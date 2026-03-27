Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AC210BA44F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 08:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91aFdcZ4XqhYUXG8pjH2NRoyqYtPZcFZqsGvYKtLHds=; b=1yR374nwcL84gmdnLM6eStOR9q
	LSgWr4YtsFKNcAIavZSFZnevkEbJb7YBYndm77aVBiNOcp9GGPjPk36/8ImFGV61lOO6AurRTuvBG
	NuiOF3Bofk4Q+IS0Cvx+r0e41ZRRlwRY66SgwXn1P4+upRgqSSxI1gigHTCmZ84ztHp0wCw0fK9bk
	gcI8r+HJ/Ozu0cJLjcH7wliqm/BGOtCjMBeRw5zZ5DGM487vQPi46qM8vU5kwfsUq9/TjaeKR6A7I
	zBmKg48fVYNnzAZcLwS1VMHwjKNSPmsvjU0WDSlnJebHEG6AabBHJ9XkGnDU+SRULPcL60M73djnj
	EToCdBQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62oQ-000000070Qn-1ob0;
	Fri, 27 Mar 2026 08:45:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62oG-000000070I3-1X70
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 08:44:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=91aFdcZ4XqhYUXG8pjH2NRoyqYtPZcFZqsGvYKtLHds=; b=R0Fg8vBROv6dzSevoKTokvORQG
	nc2WyrD+eVqRXwjpyRjusSAzWk9gEC9j9WMkrA57H4D3BvnTRo/GazT1aZ57Abhcbd3LDWY+Ax1d/
	6NWbu9m/IExBik2PD26MmqxkLSuCrPfx3Ja1SRfHmbT8eEWng3PtwinAgTJscj7f9n2JWx6gaAkDj
	x//okXPo9arzB4Q+nDtq4wqOAD65gvf1cCfJrYcg3Yejfvsra6gTWKBHw8/B/v7WfASEsqaynnSH5
	5kH6x1I4mvQQ5KxYuysS3EEoHyH2UC+ZTpghYqKHmDxkhlX/H2Xieexf75B/0TWuFmAb+tfHs1qt6
	m4Q/OGdA==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62oC-00000009zz1-13AG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 08:44:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=91aFdcZ4XqhYUXG8pjH2NRoyqYtPZcFZqsGvYKtLHds=; b=IGbqXh0gq9/IgZnjxawZpojuu/
	Zq1EzKZFWSnD3uJcMKLmPghl5CH1uwivgbcjAczYbn9BA+zjrs3SERKb5R922BLbb9PTw7/4yNjNG
	Z5r6RngAu9WfdSSim4kVH4sHTnototjxLRgxgWm5N1aDF6EH42wn5HH9Gp/qqTAczuJ6VM7TxA+hE
	5LNol7y0NWZBdUUmkUztq2d9CEOapSzWy+A6r9jM4hHqV0prvY5ChUpTSwAlDOAcK3Ml54IwmDCn/
	Gb3P7EQnfR2ufrU3jJVjoSEH9qQ6wRGxz6tAd/aI9jHtHzrL2/+8l4r5kN5Bqr9qKtf3UaX+UghJl
	KZjyzJaQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37304 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w62o5-000000005sc-3tqY;
	Fri, 27 Mar 2026 08:44:42 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w62o3-0000000E3DE-3Vf8;
	Fri, 27 Mar 2026 08:44:39 +0000
In-Reply-To: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
References: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 15/15] net: stmmac: qcom-ethqos: move phase_shift
 to register update site
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w62o3-0000000E3DE-3Vf8@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Mar 2026 08:44:39 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_084448_578658_199E6A40 
X-CRM114-Status: GOOD (  11.76  )
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

Move the determination of the phase shift enable alongside the register
update, and make "phase_shift" unsigned.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 667676c29a95..ad3a983d2a08 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -375,14 +375,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 {
 	struct device *dev = &ethqos->pdev->dev;
 	unsigned int prg_rclk_dly, loopback;
-	int phase_shift;
-
-	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
-	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
-	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
-		phase_shift = 0;
-	else
-		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
+	unsigned int phase_shift;
 
 	/* Disable loopback mode */
 	rgmii_clrmask(ethqos, RGMII_CONFIG2_TX_TO_RX_LOOPBACK_EN,
@@ -416,6 +409,14 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 
 	rgmii_clrmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
 		      RGMII_IO_MACRO_CONFIG2);
+
+	/* Determine if the PHY adds a 2 ns TX delay or the MAC handles it */
+	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID ||
+	    ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_TXID)
+		phase_shift = 0;
+	else
+		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
+
 	rgmii_updatel(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN, phase_shift,
 		      RGMII_IO_MACRO_CONFIG2);
 
-- 
2.47.3



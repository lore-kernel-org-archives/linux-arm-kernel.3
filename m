Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B50810BA44F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 08:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9yYgHH46k8miSUiyGhGc2WsnL2hXAEwgSYhG9voR70=; b=BL+g4V1NjQrqoDnqdOX8xnl4yN
	ywOFuuYrdFstUGc1MfNUVOU4TMnFH6rMh0E4I/D7Lpm1TP3h9IK3SuMc560FNTCr3q071jmsGxd2j
	5grAt0CBUrcW1OT6jSPFvN17xjtX8NZlNh++GLXPGHGwxrvESD1+zOGNS1ocxc448OR1qhXD1f3tL
	VLaWOKHModUzZS7LY9OXbvO0L9+7pguIv1BTBw++xnn6YslVzOmpE9jMkyCq6ZAPQ11hgu5stagp2
	mZnIWELoM55R3zxola7qyDn/rpo4JtPgwO67R+j69eQlSZzlVzsnu6RNH5knPmgIwQFOJjQtQ773q
	v/DaBCdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62nN-00000006zcN-32a6;
	Fri, 27 Mar 2026 08:43:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62nI-00000006zZT-0dIA
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 08:43:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=O9yYgHH46k8miSUiyGhGc2WsnL2hXAEwgSYhG9voR70=; b=XODS3xQ8FgquEqYKUqYa7rjIz+
	abYakPBqQ9JOWQpLWvJ0YozVRgRW6AtvkHidPxa8eVMhpA2OURxcIKbY0idPS7+H5uGUkZqZpKXRk
	UjCzLfjeYw7b7rR3I4H1qblnP+KHYjg3mOiCdHw+2IgJdypTALO2y3T/dV53t2VZwC9gz/xZwCVJ+
	3kn+nCrSBCxLYxONYcGWdqaRgj5kE4QyyavC2ko0M0T/rasJTvTxd2kZErdIpmx+x1AY2+Sp45NY/
	cNOpHXjKNXj33YOzrkG+O7O2RX58ZRgkx5Lj2FsGu2yygrAuxAzqhLoEWP4/kR7JT42iSkwcNfem8
	bEVn2L4Q==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62nF-00000009zna-0XjJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 08:43:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=O9yYgHH46k8miSUiyGhGc2WsnL2hXAEwgSYhG9voR70=; b=WKwU8uR5HSxwgOXLYDOWTVMnmG
	vmGvEGCrScnecLiCQX+2B0h8OvqH8dlvqbX46GjXt391gE5GPw9L5hegQ4st9YrGnQTajqN8eW35L
	KNipF1PydDm4xZK8eNJ/MYTON/xIBlUSq+HPNSpmRmV0g6uL65NKpZmRu3bFOT09rktipdkj9P97x
	Np3HZb4l6O3qfhoFtDsQnnpJqEkQ2impWuqkUdvhLWeyZUJpa7jgET6YDcY6D6SXrfEFLppNgrzeH
	4c7F0h030rf8WunFLm/MeHMRltDe6MlWQP6PVXLgD4ygVqwOfbcSz4DPHffOV33o27YAzjkm5/4IS
	+kWxj6UQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57576 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w62nA-000000005pB-3qpq;
	Fri, 27 Mar 2026 08:43:44 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w62n9-0000000E3C9-2Zkr;
	Fri, 27 Mar 2026 08:43:43 +0000
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
Subject: [PATCH net-next v2 04/15] net: stmmac: qcom-ethqos: move detection of
 invalid RGMII speed
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w62n9-0000000E3C9-2Zkr@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Mar 2026 08:43:43 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_084349_293694_41A67391 
X-CRM114-Status: GOOD (  10.75  )
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

Move detection of invalid RGMII speeds (which will never be triggered)
before the switch() to allow register modifications that are common to
all speeds to be moved out of the switch.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index f7e3a2b8803f..d19331067459 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -397,6 +397,11 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 	/* Select RGMII, write 0 to interface select */
 	rgmii_clrmask(ethqos, RGMII_CONFIG_INTF_SEL, RGMII_IO_MACRO_CONFIG);
 
+	if (speed != SPEED_1000 && speed != SPEED_100 && speed != SPEED_10) {
+		dev_err(dev, "Invalid speed %d\n", speed);
+		return -EINVAL;
+	}
+
 	switch (speed) {
 	case SPEED_1000:
 		rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE,
@@ -510,9 +515,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN,
 			      loopback, RGMII_IO_MACRO_CONFIG);
 		break;
-	default:
-		dev_err(dev, "Invalid speed %d\n", speed);
-		return -EINVAL;
 	}
 
 	return 0;
-- 
2.47.3



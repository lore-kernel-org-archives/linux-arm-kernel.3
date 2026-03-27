Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95E510BA44F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 08:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0vrlqWAvzqtkE7Yq3Q3lXBFXSsrrLWdunkj6F4t/aJA=; b=iLGbKllmamfGiVCEYqcyEzjSJc
	m/NMohPasUn6m9gYc7KafT5wZFe6R7y6qyZkxo75nqu9uEVfWpRXGt2BvmWtDYsgeE9rzoCZ33Qsk
	ojRRhAWEd4QA1tipUJUwRrhTpuWAkpD9ND3UCKqKwEj0foJUY33eSaZ0mbsmF/DP4MME6DMjRafqi
	xiWNSMnT71RX9EI3cOOOzji7dJAIdfLYDrlUD8w4qSWoVF07U/0YaRomQzy1frqTMInbGzPJ4C8F7
	5tzIJj0uVAXF9igIC2mrdzccMmWo9GsA3T3dc/g6MRQzsP417FNVg42K6YZzPCPzcNn75Z0pKc6+a
	i/XyqsSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62o7-000000070AO-3tHF;
	Fri, 27 Mar 2026 08:44:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62o0-0000000703j-06ba
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 08:44:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=0vrlqWAvzqtkE7Yq3Q3lXBFXSsrrLWdunkj6F4t/aJA=; b=TCwBPjKt2yVvZAiIZKmgMwsVkJ
	jHc12+BcKEsutw0wAH5Z5+XB/UKxB/ynSjDJFlz3WQNcXuyns/QEKBKmkt6xOQDFS4xNFPH8W82ah
	SQm/5vJWdaV6NmCO518GmPCIbJYCpvB/8UekPXPiaXkX8nzx6/nuko0QQHNl+T4kQuy+VuFYAyJIO
	naRtSXddj9uJ24F45H+2EWwd+vktMhvPhPDoQGqz2pbyIpjs0AY8XFthKoyakbAGAR2gCPIaOU6e9
	18xeCBjnUNWysBYMGkbiS4V24rEZ3NCVj5HwPGaVlOl7bs2VqVwrvym1F646SjZF4hg2yzihtLKnn
	MwcsV/bQ==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62nv-00000009zwq-3vlX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 08:44:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0vrlqWAvzqtkE7Yq3Q3lXBFXSsrrLWdunkj6F4t/aJA=; b=l8WxvpID/4w74usGue7jxKgtBS
	hDIhK8BL2FaVWpQFYZAaaN+BepKlx7Bon2k0rBwrh+ZNG5SBmH50lVJfKMHv/0HKanalkzN6ByF/o
	jFjHjK9WEpKm5vZQIiZfdLndeUYTLqkdvfzBUbd3PEj3Pm8Xw9PQMM18SoUp4B5XArqQk19Ifd6V+
	VgpnbgpbTJvlmplMwXo//FVawilXm3ijfsLsx8aEemoQBgiZ0uMNVo4fVlrxrVNKu5py9r/a8faje
	FMlmah7LD30i5Q8X5Z7exStQaSoOZ4YXzVDfwlOsqb18RmH7GBbcd87eshhRnUQhSfFPiutF0lM77
	SMMRjjZA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56498 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w62nl-000000005rJ-29xb;
	Fri, 27 Mar 2026 08:44:21 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w62nj-0000000E3Cq-1lPL;
	Fri, 27 Mar 2026 08:44:19 +0000
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
Subject: [PATCH net-next v2 11/15] net: stmmac: qcom-ethqos: finally eliminate
 the switch
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w62nj-0000000E3Cq-1lPL@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Mar 2026 08:44:19 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_084432_813538_E443A677 
X-CRM114-Status: GOOD (  11.46  )
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

Move the RCLK delay configuration out of the switch, which just leaves
the RGMII_CONFIG_LOOPBACK_EN setting in all three paths. This makes it
trivial to eliminate the switch.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 47 +++++++------------
 1 file changed, 16 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index b4c61cb24e1d..7690ae0bb008 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -444,8 +444,18 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		rgmii_clrmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
 			      RGMII_IO_MACRO_CONFIG2);
 
-	switch (speed) {
-	case SPEED_1000:
+	if (speed != SPEED_1000) {
+		/* Write 0x5 to PRG_RCLK_DLY_CODE */
+		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
+			      FIELD_PREP(SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
+					 5), SDCC_HC_REG_DDR_CONFIG);
+
+		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY,
+			      SDCC_HC_REG_DDR_CONFIG);
+
+		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_EN,
+			      SDCC_HC_REG_DDR_CONFIG);
+	} else {
 		/* PRG_RCLK_DLY = TCXO period * TCXO_CYCLES_CNT / 2 * RX delay ns,
 		 * in practice this becomes PRG_RCLK_DLY = 52 * 4 / 2 * RX delay ns
 		 */
@@ -460,39 +470,14 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 				      FIELD_PREP(SDCC_DDR_CONFIG_PRG_RCLK_DLY,
 						 57), SDCC_HC_REG_DDR_CONFIG);
 		}
-		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_PRG_DLY_EN,
-			      SDCC_HC_REG_DDR_CONFIG);
-		rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN,
-			      loopback, RGMII_IO_MACRO_CONFIG);
-		break;
-
-	case SPEED_100:
-		/* Write 0x5 to PRG_RCLK_DLY_CODE */
-		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
-			      FIELD_PREP(SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
-					 5), SDCC_HC_REG_DDR_CONFIG);
-		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY,
-			      SDCC_HC_REG_DDR_CONFIG);
-		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_EN,
-			      SDCC_HC_REG_DDR_CONFIG);
-		rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN,
-			      loopback, RGMII_IO_MACRO_CONFIG);
-		break;
 
-	case SPEED_10:
-		/* Write 0x5 to PRG_RCLK_DLY_CODE */
-		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
-			      FIELD_PREP(SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
-					 5), SDCC_HC_REG_DDR_CONFIG);
-		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY,
-			      SDCC_HC_REG_DDR_CONFIG);
-		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_EN,
+		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_PRG_DLY_EN,
 			      SDCC_HC_REG_DDR_CONFIG);
-		rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN,
-			      loopback, RGMII_IO_MACRO_CONFIG);
-		break;
 	}
 
+	rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN, loopback,
+		      RGMII_IO_MACRO_CONFIG);
+
 	return 0;
 }
 
-- 
2.47.3



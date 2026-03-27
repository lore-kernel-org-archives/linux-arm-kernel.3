Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1A710BA44F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 08:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Vvgj2pPT8XKTkkvlCbrP20rwaNhlKqdZd5dSa/DWEA=; b=hAUZCtgWxmHwMlXmGCo1RFRaI5
	oCk70WEGhNPuLKWZnOBtmetmwKGJkVM3vp2Wp+CqD7cIn9ZhpcpDCenN/384cLEMGzl0lw+SghJqi
	Y/pRcdT5oqeqoHNgXSYbpMIU2Fbcr0jT4iFgGP1bgBltJSl7tO2V2M6QP+qlsNwlfcjxOrjRShg5p
	DrnTjZR7AIOr5tXPO1kGAeFq7tNXJ4OOCGM+JJ/LBg5zu4jGpoNCHkTZJfLne5msgkkpIB/OSXyNc
	49+N89w68JhAlHBf11QWMCbjFC8nF4qAsNiq1Pd8W9wZzjNrjlTGezie/nO/1BpuEf0gjFxmwmTnl
	HlsZKsOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62na-00000006zjs-2lAE;
	Fri, 27 Mar 2026 08:44:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62nU-00000006zfR-1mk4
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 08:44:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=7Vvgj2pPT8XKTkkvlCbrP20rwaNhlKqdZd5dSa/DWEA=; b=itW+EKWqbhPhlpEU0r2jr0XPW/
	Z9Cosd+R23TX2w/bl/a+Ed8jZAz2BKRLKygHx5vztpO9iFlWh5BThgrNwTlhps2tRJ+gCAjfzr8jX
	xhuKt68tyE7hHTZv3tzMFzQoKUcgnk7DM/9oo2gHtnkpRa2K8/7SsNa4XUOaLxAx1qS+6WfGLhR5y
	lYkW6+vEMUbP6G33oPyE8Zy8eUXXGjyoeM81qi+527DYZgrcJksY295MSGmA7hDT2LZaPWswDtxNh
	k3thFUUO8HM8hETuAV/kAg+7vFh8j98dFBdE1yjAhucQs6JwAgZI+LXxR8DsX0Ql+fREkXdYUUW8A
	9nmkjSvQ==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62nR-00000009zp8-2qkK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 08:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7Vvgj2pPT8XKTkkvlCbrP20rwaNhlKqdZd5dSa/DWEA=; b=iSy+NvnBIhBSrnaVMD6B0mD8pL
	N8P61rdQGkFyueNLmSyQGeqwuiHwoEZTr7PkC9n7NQ6G5slJDj9QhvWL2SJ+8ryS3cbbVO7bI2+vO
	83QjKXT7Ec1SUDniCbr5Wgp3xJmRrYz/lVf1GNB2DQuy5KUkK49oDnnDGrfmeuwjl0+YEFRHQt4Ls
	Wowaeg1rruVZQi22icZKQ7550UguffvUcRr5B3JMLkeFmJ5vbokaCh2ZjqmNPRf7v19BREVa7iB4d
	6WLUOU8mdO0g3uOkdDbbk3EIofUOCoCeRWfvDXP2R/EROKh+cqXp3wtVkct7V5YO6aDc+3wk44nI5
	xiO7SqHw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53138 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w62nL-000000005pp-1O76;
	Fri, 27 Mar 2026 08:43:55 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w62nJ-0000000E3CL-3YSr;
	Fri, 27 Mar 2026 08:43:53 +0000
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
Subject: [PATCH net-next v2 06/15] net: stmmac: qcom-ethqos: move 1G vs
 100M/10M RGMII settings
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w62nJ-0000000E3CL-3YSr@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Mar 2026 08:43:53 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_084401_819285_4C5EF772 
X-CRM114-Status: UNSURE (   9.37  )
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

Move RGMII_CONFIG_BYPASS_TX_ID_EN, RGMII_CONFIG_POS_NEG_DATA_SEL and
RGMII_CONFIG_PROG_SWAP. There are two states for these: one group for
1G, and the logical inversion for 100M and 10M. Move this out of the
switch into an if-else clause.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 26 +++++++++----------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 34d9a6b2d023..e9d8c8a7146a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -404,14 +404,24 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 
 	rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
 
-	switch (speed) {
-	case SPEED_1000:
+	if (speed == SPEED_1000) {
 		rgmii_clrmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN,
 			      RGMII_IO_MACRO_CONFIG);
 		rgmii_setmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL,
 			      RGMII_IO_MACRO_CONFIG);
 		rgmii_setmask(ethqos, RGMII_CONFIG_PROG_SWAP,
 			      RGMII_IO_MACRO_CONFIG);
+	} else {
+		rgmii_setmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN,
+			      RGMII_IO_MACRO_CONFIG);
+		rgmii_clrmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL,
+			      RGMII_IO_MACRO_CONFIG);
+		rgmii_clrmask(ethqos, RGMII_CONFIG_PROG_SWAP,
+			      RGMII_IO_MACRO_CONFIG);
+	}
+
+	switch (speed) {
+	case SPEED_1000:
 		rgmii_clrmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
 			      RGMII_IO_MACRO_CONFIG2);
 
@@ -443,12 +453,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		break;
 
 	case SPEED_100:
-		rgmii_setmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN,
-			      RGMII_IO_MACRO_CONFIG);
-		rgmii_clrmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL,
-			      RGMII_IO_MACRO_CONFIG);
-		rgmii_clrmask(ethqos, RGMII_CONFIG_PROG_SWAP,
-			      RGMII_IO_MACRO_CONFIG);
 		rgmii_clrmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
 			      RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
@@ -479,12 +483,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		break;
 
 	case SPEED_10:
-		rgmii_setmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN,
-			      RGMII_IO_MACRO_CONFIG);
-		rgmii_clrmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL,
-			      RGMII_IO_MACRO_CONFIG);
-		rgmii_clrmask(ethqos, RGMII_CONFIG_PROG_SWAP,
-			      RGMII_IO_MACRO_CONFIG);
 		rgmii_clrmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
 			      RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
-- 
2.47.3



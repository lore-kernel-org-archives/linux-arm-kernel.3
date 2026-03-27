Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1563910BA451
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 08:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v5zv1KoW+UBKxbZ895MWOl/70blKXnrG1j2mMoFeT8s=; b=4f2B069RBKgfKrhmQZoAKavbcb
	bQjuNFbGXKDELVB89T8g9IemIm/ioPYpIaSLYNxb4TNL/8oNaj2cPDWe9ezB5U3byTnOGvbm+vXea
	iOau9Ee2NmCQCPgXPwkxLD37s/W46nkozd4Y8bQLQn+HuIkN9+AsBLL1H9/RkL4H6VS3HbnIhLNBa
	tDO4mCe+wGOtVBs7rl8Vxi8AaOVX78jmQuTN5Do8KaJfU0OLPS2Xw0Dxcdvzjiaw+9VF+e/I7nMM0
	+SVp0JIEn1GHTfy7GFPeQsuj9NFXKQCV6tZqlbxZqbz5vm2y57sw8vj+v0HzMp5F4LdeXsF0Ww5p4
	eQb5gcJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62nU-00000006zfY-05EV;
	Fri, 27 Mar 2026 08:44:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62nO-00000006zcI-1fFX
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 08:43:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=v5zv1KoW+UBKxbZ895MWOl/70blKXnrG1j2mMoFeT8s=; b=YOAgP1QklrZWblVIsm2gBZdY8V
	leHvN00FDuyjGZaUK+vWCJGnefMKnX3QSOIc7znBfwzbWVNpgwG35o/ZRYsFDiQW29gum3zfLFV+z
	D7lXQU/BNErLSlfnv21+mxnofgsRsZSRwDFJ9VguqXd53e6jKltb/P+viJP80gaQcBF7pa90kKsJ6
	ppssoucLzL7bSFkbJ/rS22ccaNJaq01jQnHNVjCpn1rhvLSwUVbhhZBA4+JdKKdroveBlu9FVf4vR
	2Fl7ELgNhRzfT/Oyrjm1tQAm9mrEkZi3KbIQ/Ty05CazbK8oPOlag+mMDbNunaq5M2022ELz2NxJB
	7Uj+oUWg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62nK-00000009zoT-4BTY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 08:43:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=v5zv1KoW+UBKxbZ895MWOl/70blKXnrG1j2mMoFeT8s=; b=Z7NPIW5puVRFmo2a7gj+mDitUO
	4QQjZtQie1BMAhRpbEsHUuapb7ri+FhyS75KPzolQ3C0WgGK82pm/NQUM4BgzW+E9WQFHw9kUPVi4
	e7X+78+TfdgBNT0jCZiJ5S86VW9zDs52HUiWsFDRuCR/lcElC7BPyY6QYbNFkjUprzwmw9XAbMkpC
	DZc5052DPlX+DjB2CZXnyfD9PUlBHscQaVL9iS/8RLUgLdkF9bIgo6s4VrQ80r0+QBt11KMd3RAiY
	Dkql7BJVf/NoIoSaAbnhBhxEq316EFW+Kvx3rbtqZvRer94mLKqfLIWYDwdUYB7X6HJSWZhxkULIE
	DQ4Y+liw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53130 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w62nF-000000005pW-445J;
	Fri, 27 Mar 2026 08:43:50 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w62nE-0000000E3CF-331r;
	Fri, 27 Mar 2026 08:43:48 +0000
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
Subject: [PATCH net-next v2 05/15] net: stmmac: qcom-ethqos: move
 RGMII_CONFIG_DDR_MODE
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w62nE-0000000E3CF-331r@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Mar 2026 08:43:48 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_084355_677356_444B2833 
X-CRM114-Status: UNSURE (   8.97  )
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

RGMII_CONFIG_DDR_MODE is always set irrespective of the speed. Move
this out of the switch.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index d19331067459..34d9a6b2d023 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -402,10 +402,10 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		return -EINVAL;
 	}
 
+	rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
+
 	switch (speed) {
 	case SPEED_1000:
-		rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE,
-			      RGMII_IO_MACRO_CONFIG);
 		rgmii_clrmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN,
 			      RGMII_IO_MACRO_CONFIG);
 		rgmii_setmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL,
@@ -443,8 +443,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		break;
 
 	case SPEED_100:
-		rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE,
-			      RGMII_IO_MACRO_CONFIG);
 		rgmii_setmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN,
 			      RGMII_IO_MACRO_CONFIG);
 		rgmii_clrmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL,
@@ -481,8 +479,6 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		break;
 
 	case SPEED_10:
-		rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE,
-			      RGMII_IO_MACRO_CONFIG);
 		rgmii_setmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN,
 			      RGMII_IO_MACRO_CONFIG);
 		rgmii_clrmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL,
-- 
2.47.3



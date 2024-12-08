Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4B6E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 07:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KXUKUf+0SF76THFk57e33zgLbiORDIy5CN/un9OCYYM=; b=4pmVsJaHB6zoD1hXBHqCoKMqQj
	J8DC7KACGiarryAckmMNj3jy7qZeKW54P9BZPdfSD+vZx03gIuyB3ya3ZIPfBdvHiQbxq/4dU92wD
	vgSJA+5EJgRJ6vasKwkygBt8HwlJ0ozCpXLCezvzAf046uPY07VT+zoj8eTKDvnlFJ0k0tEQwldP1
	8Swh8ct2a14QsvBPp9LurRfj4+iUbIbZQDY5K7vkOK/eqnyqAFXp++4h4j3k91t4Ry9veKov0tcpE
	ir2irRA3irsH8Oxcnqm4+EOc4AhGLoNReoVbR28WVNWdDabHlU7MVIyrneUxmzj56vtlg7AHkPwwr
	x1oo/VEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKBK4-00000004xNM-149P;
	Sun, 08 Dec 2024 07:03:20 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKBJ3-00000004xHa-03oX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Dec 2024 07:02:18 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2163bd70069so3237185ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Dec 2024 23:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733641335; x=1734246135; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KXUKUf+0SF76THFk57e33zgLbiORDIy5CN/un9OCYYM=;
        b=d/48RaWM8kWIlrxdOw9aWY0lLN6zfEfUkFlj8NiqKndLMAfFyT7V+c8N5QiMClTqDk
         xB2koon08QaSajlGRzkgVhwoeiuUePX5H7ry7BJbXn5eKMFUlCfsIj/7hT0hTG6Yzzzo
         ZT8lb/GjGFK684MZZ+lP1+iTY8eBdGfqmiQvjNkTmHSAmzgmbFYgsdNdmEQBfDg/mi3g
         I7aM5mRbPWJcL9GdSY0+M1QqkysgBkgNLx+sEngulQpLs2G+P14cNvfzhi+jeZZvslMf
         +XDnTPt6sr5vy4GvNvMD6qA/S4q0vXZba59kzhyjQCiW9TgGURVRQyPPDCw7IWDh3Al7
         DCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733641335; x=1734246135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KXUKUf+0SF76THFk57e33zgLbiORDIy5CN/un9OCYYM=;
        b=Q2BybTZLNnDiXC4J86vTImlaIEWMW2BmgQqbk0ranNvp6bsNGPh6LNhc3hoPoblrRT
         hIhywof+D5qrAgTcl4eVBq0hNKrpQcJ/hFlCYa9vzRBvH4qDfkQnUfmEZMYXULo60Q81
         6o5TvNTCLmxusZt24yO22+8rJeOHLZzo6FPfgxaQBeot+vwM3NJZ+O9vf1HNtWHEkqro
         OXfdybsEDZtubVS16X8L18f08MMmxSqE/rUUkkw+4J4jAoDlgH6oT4StA6qHnldZwyEW
         wtJ2PMoy7vWP38FnBRW08ydoyW5b37/9yJe2gF7MyZwHlU7eVq5yz9ZPRHMygeT7lrSy
         jA/g==
X-Forwarded-Encrypted: i=1; AJvYcCUD9mUIj8B6IM2qU0N8UPIkRLVsqXhYwMoGLoBmu3vzeAYZwUBt857EodZbuOUs4yA+4NO9xgYyfTwPtLpRsxeB@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm5hwLnDBRCmhUzgQzYel1M3dwLyBlOu1ahbllNyW0rJcq4YN8
	AnsBfnR85s8CQgfXH8TC/QacVXxR3eE6OcQaePcvISEPKnkRbvUj
X-Gm-Gg: ASbGncv+BXbtBs4DsRu+qC26ufEWqwnFd3dmIjF9b/A6axSWNv1fdGbYWe5w+YVfUVu
	L2wHJx0/YNx8VyZfvB4cdGFtyt5fsqV5y4GTjsgvjH3sBlklzQ1nuv3sq8NWVOYl/Hqz9wjVZhJ
	OFHqQ0p7j1EPq3MEYT80kSfQ4PuOWOqp2fG3DeUplX+jv8XhIg777cxEfDTyupprdyqstM9NVey
	FN0mXsS1hSmJ7DJcDEoLkg/xXDsdwUopgebB3pRM7Yj5gepPDxfRw6Gb7fENEg=
X-Google-Smtp-Source: AGHT+IEEcAin+aWPC3AV5wr/aZQOsP3NZQnwUgmYE78w2zS/hoJm9C12M0otPQyTvLsXpbG5GY7beQ==
X-Received: by 2002:a17:903:41cc:b0:215:a18c:88fa with SMTP id d9443c01a7336-21614da3f4dmr143381415ad.38.1733641335193;
        Sat, 07 Dec 2024 23:02:15 -0800 (PST)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-215f8f08f8bsm52521675ad.179.2024.12.07.23.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 23:02:14 -0800 (PST)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>,
	Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH net-next v1] net: stmmac: Relocate extern declarations in common.h and hwif.h
Date: Sun,  8 Dec 2024 15:02:02 +0800
Message-Id: <20241208070202.203931-1-0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_230217_144381_350A1002 
X-CRM114-Status: GOOD (  15.18  )
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

The extern declarations should be in a header file that corresponds to
their definition, move these extern declarations to its header file.
Some of them have nowhere to go, so move them to hwif.h since they are
referenced in hwif.c only.

dwmac100_* dwmac1000_* dwmac4_* dwmac410_* dwmac510_* stay in hwif.h,
otherwise you will be flooded with name conflicts from dwmac100.h,
dwmac1000.h and dwmac4.h if hwif.c try to #include these .h files.

Compile tested only.
No functional change intended.

Suggested-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h     | 14 --------------
 .../net/ethernet/stmicro/stmmac/dwmac4_descs.h   |  3 +++
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h   |  5 +++++
 drivers/net/ethernet/stmicro/stmmac/hwif.c       |  2 ++
 drivers/net/ethernet/stmicro/stmmac/hwif.h       | 16 +++++++++-------
 drivers/net/ethernet/stmicro/stmmac/mmc.h        |  3 +++
 drivers/net/ethernet/stmicro/stmmac/stmmac_est.h |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h |  3 +++
 8 files changed, 27 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 1367fa5c9b8e..fbcf07d201cf 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -543,18 +543,8 @@ struct dma_features {
 #define STMMAC_VLAN_INSERT	0x2
 #define STMMAC_VLAN_REPLACE	0x3
 
-extern const struct stmmac_desc_ops enh_desc_ops;
-extern const struct stmmac_desc_ops ndesc_ops;
-
 struct mac_device_info;
 
-extern const struct stmmac_hwtimestamp stmmac_ptp;
-extern const struct stmmac_hwtimestamp dwmac1000_ptp;
-extern const struct stmmac_mode_ops dwmac4_ring_mode_ops;
-
-extern const struct ptp_clock_info stmmac_ptp_clock_ops;
-extern const struct ptp_clock_info dwmac1000_ptp_clock_ops;
-
 struct mac_link {
 	u32 caps;
 	u32 speed_mask;
@@ -641,8 +631,4 @@ void stmmac_dwmac4_set_mac(void __iomem *ioaddr, bool enable);
 
 void dwmac_dma_flush_tx_fifo(void __iomem *ioaddr);
 
-extern const struct stmmac_mode_ops ring_mode_ops;
-extern const struct stmmac_mode_ops chain_mode_ops;
-extern const struct stmmac_desc_ops dwmac4_desc_ops;
-
 #endif /* __COMMON_H__ */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h
index 1ce6f43d545a..806555976496 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.h
@@ -144,4 +144,7 @@
 /* TDS3 use for both format (read and write back) */
 #define RDES3_OWN			BIT(31)
 
+extern const struct stmmac_mode_ops dwmac4_ring_mode_ops;
+extern const struct stmmac_desc_ops dwmac4_desc_ops;
+
 #endif /* __DWMAC4_DESCS_H__ */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index a04a79003692..20027d3c25a7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -493,4 +493,9 @@
 #define XGMAC_RDES3_TSD			BIT(6)
 #define XGMAC_RDES3_TSA			BIT(4)
 
+extern const struct stmmac_ops dwxgmac210_ops;
+extern const struct stmmac_ops dwxlgmac2_ops;
+extern const struct stmmac_dma_ops dwxgmac210_dma_ops;
+extern const struct stmmac_desc_ops dwxgmac210_desc_ops;
+
 #endif /* __STMMAC_DWXGMAC2_H__ */
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index a72d336a8350..4bd79de2e222 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -9,6 +9,8 @@
 #include "stmmac_fpe.h"
 #include "stmmac_ptp.h"
 #include "stmmac_est.h"
+#include "dwmac4_descs.h"
+#include "dwxgmac2.h"
 
 static u32 stmmac_get_id(struct stmmac_priv *priv, u32 id_reg)
 {
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 64f8ed67dcc4..e428c82b7d31 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -665,6 +665,15 @@ struct stmmac_regs_off {
 	u32 est_off;
 };
 
+extern const struct stmmac_desc_ops enh_desc_ops;
+extern const struct stmmac_desc_ops ndesc_ops;
+
+extern const struct stmmac_hwtimestamp stmmac_ptp;
+extern const struct stmmac_hwtimestamp dwmac1000_ptp;
+
+extern const struct stmmac_mode_ops ring_mode_ops;
+extern const struct stmmac_mode_ops chain_mode_ops;
+
 extern const struct stmmac_ops dwmac100_ops;
 extern const struct stmmac_dma_ops dwmac100_dma_ops;
 extern const struct stmmac_ops dwmac1000_ops;
@@ -677,13 +686,6 @@ extern const struct stmmac_ops dwmac510_ops;
 extern const struct stmmac_tc_ops dwmac4_tc_ops;
 extern const struct stmmac_tc_ops dwmac510_tc_ops;
 extern const struct stmmac_tc_ops dwxgmac_tc_ops;
-extern const struct stmmac_ops dwxgmac210_ops;
-extern const struct stmmac_ops dwxlgmac2_ops;
-extern const struct stmmac_dma_ops dwxgmac210_dma_ops;
-extern const struct stmmac_desc_ops dwxgmac210_desc_ops;
-extern const struct stmmac_mmc_ops dwmac_mmc_ops;
-extern const struct stmmac_mmc_ops dwxgmac_mmc_ops;
-extern const struct stmmac_est_ops dwmac510_est_ops;
 
 #define GMAC_VERSION		0x00000020	/* GMAC CORE Version */
 #define GMAC4_VERSION		0x00000110	/* GMAC4+ CORE Version */
diff --git a/drivers/net/ethernet/stmicro/stmmac/mmc.h b/drivers/net/ethernet/stmicro/stmmac/mmc.h
index 5d1ea3e07459..1cba39fb2c44 100644
--- a/drivers/net/ethernet/stmicro/stmmac/mmc.h
+++ b/drivers/net/ethernet/stmicro/stmmac/mmc.h
@@ -139,4 +139,7 @@ struct stmmac_counters {
 	unsigned int mmc_rx_fpe_fragment_cntr;
 };
 
+extern const struct stmmac_mmc_ops dwmac_mmc_ops;
+extern const struct stmmac_mmc_ops dwxgmac_mmc_ops;
+
 #endif /* __MMC_H__ */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h
index 7a858c566e7e..d247fa383a6e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.h
@@ -62,3 +62,5 @@
 #define EST_SRWO			BIT(0)
 
 #define EST_GCL_DATA			0x00000034
+
+extern const struct stmmac_est_ops dwmac510_est_ops;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
index 4cc70480ce0f..3fe0e3a80e80 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
@@ -104,4 +104,7 @@ int dwmac1000_ptp_enable(struct ptp_clock_info *ptp,
 void dwmac1000_get_ptptime(void __iomem *ptpaddr, u64 *ptp_time);
 void dwmac1000_timestamp_interrupt(struct stmmac_priv *priv);
 
+extern const struct ptp_clock_info stmmac_ptp_clock_ops;
+extern const struct ptp_clock_info dwmac1000_ptp_clock_ops;
+
 #endif	/* __STMMAC_PTP_H__ */
-- 
2.34.1



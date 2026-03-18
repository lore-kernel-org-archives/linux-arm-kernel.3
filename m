Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA23710775FE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 18:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aG0MZ1FrqlLkIWWb0/pP6zOGbt5rJFmJ6VnrEOyxv8M=; b=m/06kCAkOQ2E9diaus2jJBlXah
	V3FlcnyXbAWhd8K054buIw8uE31hfgY+YX+tEMHPf873PFiPP+5xWmmQ80kLRjB349xEuLJg62Fhc
	sO1Me7mSYtFPJKhE5FIM1iV3huDcun8TAUmEInf+VNXGinbp567O/7wVmTQKZtwf51EJw3zAl8yMp
	91ay2/Imxe1+2IsBfmMVyl0hhvZkJf2oJU0R8XsUld08Ghdw+apSE74P/6fQO8J126TeoWIE1juwb
	h2T7e4wBsE6m7F2jI2L9L2Oj0+TS0cvEWV/6/T7Bc/SGBAuE4rx+BWDL4V01MO+xNe89ZkfhrHAjC
	Hs7BOUPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2vbX-00000009AGt-1c5r;
	Wed, 18 Mar 2026 18:26:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2vbS-00000009AFG-35FY
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 18:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=aG0MZ1FrqlLkIWWb0/pP6zOGbt5rJFmJ6VnrEOyxv8M=; b=Dt6woYhCm0B0jq0Qv52aN9VGGz
	Y/0GurJuKTrRNvZO6qgR0+ECRqkqOdeIhe8zu0bcQaPmcDmzN5Ga4s21hByNZNbkKgZFGTGi72q67
	HjCGtT+k4siRk+DjmH6NwaIEvHjKza3CBG6XHOxm+E7tShHhMlHU1JaEA0ibjZaEBswKE2gHBFOj6
	2obq5CtE+lxxMKgm+2hC+KwCDmczzKt/G0+J6b7mYqSMq8pZzEXTq8gEzujeUATEafgawRyxyTAU7
	D1RTQbsR84sD9Fyr3EvD3A9D9BoLOYYl5UC49zyeO0UYiGzBCK8uZ9VcbgCNWe0uvRvfcfqJZtDf9
	hZoQCJ8g==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2vbP-0000000C1XX-3Dac
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 18:26:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aG0MZ1FrqlLkIWWb0/pP6zOGbt5rJFmJ6VnrEOyxv8M=; b=UXH24HS24wHx9n3ZrU1w+ZQ/tc
	N7DWsOAZ/Lw6v80LZ0VcxyCkN0SKsC/y1rmvib7tkyTxIIWrO4EmMlOY+U37hm1W4qxp0Zgi80Es4
	uivU+57+tSrmiehBOR+NSM82z/+6mmxagZk67p/+T53qdq+XjaBUVqYt66pU6ZaW+ZMVpnocctxqq
	v6L+ODUUQTDMIXLI06oo+4wTalaWh/RUMLJ9/UxvLjarZYSQJZTmI/+F6XQ2blQL8EYWPEsJ/jjit
	aHMhxacfhFhT9wIxFKecdjPvy5ZwFzeOhij09hCz0K/xO2kFJQbW8J+M9CV4HHLWna+Flp7DE+4o/
	xNLmeCNA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44958 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w2vbL-000000003pF-3WOT;
	Wed, 18 Mar 2026 18:26:39 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w2vbL-0000000DbWW-0PON;
	Wed, 18 Mar 2026 18:26:39 +0000
In-Reply-To: <abruRQpjLyMkoUEP@shell.armlinux.org.uk>
References: <abruRQpjLyMkoUEP@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 2/5] net: stmmac: more mode -> descriptor_mode
 renames
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w2vbL-0000000DbWW-0PON@rmk-PC.armlinux.org.uk>
Date: Wed, 18 Mar 2026 18:26:39 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_182643_903213_402997A1 
X-CRM114-Status: GOOD (  12.59  )
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

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac4_descs.c    | 12 ++++++-----
 .../ethernet/stmicro/stmmac/dwxgmac2_descs.c  | 12 ++++++-----
 .../net/ethernet/stmicro/stmmac/enh_desc.c    | 20 ++++++++++--------
 drivers/net/ethernet/stmicro/stmmac/hwif.h    | 12 +++++------
 .../net/ethernet/stmicro/stmmac/norm_desc.c   | 21 ++++++++++---------
 5 files changed, 42 insertions(+), 35 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
index d5c003f3fbbc..2994df41ec2c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
@@ -289,12 +289,13 @@ static int dwmac4_wrback_get_rx_timestamp_status(void *desc, void *next_desc,
 }
 
 static void dwmac4_rd_init_rx_desc(struct dma_desc *p, int disable_rx_ic,
-				   int mode, int end, int bfsize)
+				   u8 descriptor_mode, int end, int bfsize)
 {
 	dwmac4_set_rx_owner(p, disable_rx_ic);
 }
 
-static void dwmac4_rd_init_tx_desc(struct dma_desc *p, int mode, int end)
+static void dwmac4_rd_init_tx_desc(struct dma_desc *p, u8 descriptor_mode,
+				   int end)
 {
 	p->des0 = 0;
 	p->des1 = 0;
@@ -303,8 +304,9 @@ static void dwmac4_rd_init_tx_desc(struct dma_desc *p, int mode, int end)
 }
 
 static void dwmac4_rd_prepare_tx_desc(struct dma_desc *p, int is_fs, int len,
-				      bool csum_flag, int mode, bool tx_own,
-				      bool ls, unsigned int tot_pkt_len)
+				      bool csum_flag, u8 descriptor_mode,
+				      bool tx_own, bool ls,
+				      unsigned int tot_pkt_len)
 {
 	u32 tdes3 = le32_to_cpu(p->des3);
 
@@ -381,7 +383,7 @@ static void dwmac4_rd_prepare_tso_tx_desc(struct dma_desc *p, int is_fs,
 	p->des3 = cpu_to_le32(tdes3);
 }
 
-static void dwmac4_release_tx_desc(struct dma_desc *p, int mode)
+static void dwmac4_release_tx_desc(struct dma_desc *p, u8 descriptor_mode)
 {
 	p->des0 = 0;
 	p->des1 = 0;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index 1009ef436a1e..b5f200a87484 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -130,12 +130,13 @@ static int dwxgmac2_get_rx_timestamp_status(void *desc, void *next_desc,
 }
 
 static void dwxgmac2_init_rx_desc(struct dma_desc *p, int disable_rx_ic,
-				  int mode, int end, int bfsize)
+				  u8 descriptor_mode, int end, int bfsize)
 {
 	dwxgmac2_set_rx_owner(p, disable_rx_ic);
 }
 
-static void dwxgmac2_init_tx_desc(struct dma_desc *p, int mode, int end)
+static void dwxgmac2_init_tx_desc(struct dma_desc *p, u8 descriptor_mode,
+				  int end)
 {
 	p->des0 = 0;
 	p->des1 = 0;
@@ -144,8 +145,9 @@ static void dwxgmac2_init_tx_desc(struct dma_desc *p, int mode, int end)
 }
 
 static void dwxgmac2_prepare_tx_desc(struct dma_desc *p, int is_fs, int len,
-				     bool csum_flag, int mode, bool tx_own,
-				     bool ls, unsigned int tot_pkt_len)
+				     bool csum_flag, u8 descriptor_mode,
+				     bool tx_own, bool ls,
+				     unsigned int tot_pkt_len)
 {
 	u32 tdes3 = le32_to_cpu(p->des3);
 
@@ -219,7 +221,7 @@ static void dwxgmac2_prepare_tso_tx_desc(struct dma_desc *p, int is_fs,
 	p->des3 = cpu_to_le32(tdes3);
 }
 
-static void dwxgmac2_release_tx_desc(struct dma_desc *p, int mode)
+static void dwxgmac2_release_tx_desc(struct dma_desc *p, u8 descriptor_mode)
 {
 	p->des0 = 0;
 	p->des1 = 0;
diff --git a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
index ead468f4b645..051253601225 100644
--- a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
@@ -245,7 +245,7 @@ static int enh_desc_get_rx_status(struct stmmac_extra_stats *x,
 }
 
 static void enh_desc_init_rx_desc(struct dma_desc *p, int disable_rx_ic,
-				  int mode, int end, int bfsize)
+				  u8 descriptor_mode, int end, int bfsize)
 {
 	int bfsize1;
 
@@ -254,7 +254,7 @@ static void enh_desc_init_rx_desc(struct dma_desc *p, int disable_rx_ic,
 	bfsize1 = min(bfsize, BUF_SIZE_8KiB);
 	p->des1 |= cpu_to_le32(bfsize1 & ERDES1_BUFFER1_SIZE_MASK);
 
-	if (mode == STMMAC_CHAIN_MODE)
+	if (descriptor_mode == STMMAC_CHAIN_MODE)
 		ehn_desc_rx_set_on_chain(p);
 	else
 		ehn_desc_rx_set_on_ring(p, end, bfsize);
@@ -263,10 +263,11 @@ static void enh_desc_init_rx_desc(struct dma_desc *p, int disable_rx_ic,
 		p->des1 |= cpu_to_le32(ERDES1_DISABLE_IC);
 }
 
-static void enh_desc_init_tx_desc(struct dma_desc *p, int mode, int end)
+static void enh_desc_init_tx_desc(struct dma_desc *p, u8 descriptor_mode,
+				  int end)
 {
 	p->des0 &= cpu_to_le32(~ETDES0_OWN);
-	if (mode == STMMAC_CHAIN_MODE)
+	if (descriptor_mode == STMMAC_CHAIN_MODE)
 		enh_desc_end_tx_desc_on_chain(p);
 	else
 		enh_desc_end_tx_desc_on_ring(p, end);
@@ -282,24 +283,25 @@ static void enh_desc_set_rx_owner(struct dma_desc *p, int disable_rx_ic)
 	p->des0 |= cpu_to_le32(RDES0_OWN);
 }
 
-static void enh_desc_release_tx_desc(struct dma_desc *p, int mode)
+static void enh_desc_release_tx_desc(struct dma_desc *p, u8 descriptor_mode)
 {
 	int ter = (le32_to_cpu(p->des0) & ETDES0_END_RING) >> 21;
 
 	memset(p, 0, offsetof(struct dma_desc, des2));
-	if (mode == STMMAC_CHAIN_MODE)
+	if (descriptor_mode == STMMAC_CHAIN_MODE)
 		enh_desc_end_tx_desc_on_chain(p);
 	else
 		enh_desc_end_tx_desc_on_ring(p, ter);
 }
 
 static void enh_desc_prepare_tx_desc(struct dma_desc *p, int is_fs, int len,
-				     bool csum_flag, int mode, bool tx_own,
-				     bool ls, unsigned int tot_pkt_len)
+				     bool csum_flag, u8 descriptor_mode,
+				     bool tx_own,  bool ls,
+				     unsigned int tot_pkt_len)
 {
 	u32 tdes0 = le32_to_cpu(p->des0);
 
-	if (mode == STMMAC_CHAIN_MODE)
+	if (descriptor_mode == STMMAC_CHAIN_MODE)
 		enh_set_tx_desc_len_on_chain(p, len);
 	else
 		enh_set_tx_desc_len_on_ring(p, len);
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 010b4d32484a..e6317b94fff7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -38,21 +38,21 @@ struct dma_edesc;
 /* Descriptors helpers */
 struct stmmac_desc_ops {
 	/* DMA RX descriptor ring initialization */
-	void (*init_rx_desc)(struct dma_desc *p, int disable_rx_ic, int mode,
-			int end, int bfsize);
+	void (*init_rx_desc)(struct dma_desc *p, int disable_rx_ic,
+			     u8 descriptor_mode, int end, int bfsize);
 	/* DMA TX descriptor ring initialization */
-	void (*init_tx_desc)(struct dma_desc *p, int mode, int end);
+	void (*init_tx_desc)(struct dma_desc *p, u8 descriptor_mode, int end);
 	/* Invoked by the xmit function to prepare the tx descriptor */
 	void (*prepare_tx_desc)(struct dma_desc *p, int is_fs, int len,
-			bool csum_flag, int mode, bool tx_own, bool ls,
-			unsigned int tot_pkt_len);
+			bool csum_flag, u8 descriptor_mode, bool tx_own,
+			bool ls, unsigned int tot_pkt_len);
 	void (*prepare_tso_tx_desc)(struct dma_desc *p, int is_fs, int len1,
 			int len2, bool tx_own, bool ls, unsigned int tcphdrlen,
 			unsigned int tcppayloadlen);
 	/* Set/get the owner of the descriptor */
 	void (*set_tx_owner)(struct dma_desc *p);
 	/* Clean the tx descriptor as soon as the tx irq is received */
-	void (*release_tx_desc)(struct dma_desc *p, int mode);
+	void (*release_tx_desc)(struct dma_desc *p, u8 descriptor_mode);
 	/* Clear interrupt on tx frame completion. When this bit is
 	 * set an interrupt happens as soon as the frame is transmitted */
 	void (*set_tx_ic)(struct dma_desc *p);
diff --git a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
index 7c3a818c33c1..c4b613564f87 100644
--- a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
@@ -108,8 +108,8 @@ static int ndesc_get_rx_status(struct stmmac_extra_stats *x,
 	return ret;
 }
 
-static void ndesc_init_rx_desc(struct dma_desc *p, int disable_rx_ic, int mode,
-			       int end, int bfsize)
+static void ndesc_init_rx_desc(struct dma_desc *p, int disable_rx_ic,
+			       u8 descriptor_mode, int end, int bfsize)
 {
 	int bfsize1;
 
@@ -118,7 +118,7 @@ static void ndesc_init_rx_desc(struct dma_desc *p, int disable_rx_ic, int mode,
 	bfsize1 = min(bfsize, BUF_SIZE_2KiB - 1);
 	p->des1 |= cpu_to_le32(bfsize1 & RDES1_BUFFER1_SIZE_MASK);
 
-	if (mode == STMMAC_CHAIN_MODE)
+	if (descriptor_mode == STMMAC_CHAIN_MODE)
 		ndesc_rx_set_on_chain(p, end);
 	else
 		ndesc_rx_set_on_ring(p, end, bfsize);
@@ -127,10 +127,10 @@ static void ndesc_init_rx_desc(struct dma_desc *p, int disable_rx_ic, int mode,
 		p->des1 |= cpu_to_le32(RDES1_DISABLE_IC);
 }
 
-static void ndesc_init_tx_desc(struct dma_desc *p, int mode, int end)
+static void ndesc_init_tx_desc(struct dma_desc *p, u8 descriptor_mode, int end)
 {
 	p->des0 &= cpu_to_le32(~TDES0_OWN);
-	if (mode == STMMAC_CHAIN_MODE)
+	if (descriptor_mode == STMMAC_CHAIN_MODE)
 		ndesc_tx_set_on_chain(p);
 	else
 		ndesc_end_tx_desc_on_ring(p, end);
@@ -146,20 +146,21 @@ static void ndesc_set_rx_owner(struct dma_desc *p, int disable_rx_ic)
 	p->des0 |= cpu_to_le32(RDES0_OWN);
 }
 
-static void ndesc_release_tx_desc(struct dma_desc *p, int mode)
+static void ndesc_release_tx_desc(struct dma_desc *p, u8 descriptor_mode)
 {
 	int ter = (le32_to_cpu(p->des1) & TDES1_END_RING) >> 25;
 
 	memset(p, 0, offsetof(struct dma_desc, des2));
-	if (mode == STMMAC_CHAIN_MODE)
+	if (descriptor_mode == STMMAC_CHAIN_MODE)
 		ndesc_tx_set_on_chain(p);
 	else
 		ndesc_end_tx_desc_on_ring(p, ter);
 }
 
 static void ndesc_prepare_tx_desc(struct dma_desc *p, int is_fs, int len,
-				  bool csum_flag, int mode, bool tx_own,
-				  bool ls, unsigned int tot_pkt_len)
+				  bool csum_flag, u8 descriptor_mode,
+				  bool tx_own, bool ls,
+				  unsigned int tot_pkt_len)
 {
 	u32 tdes1 = le32_to_cpu(p->des1);
 
@@ -176,7 +177,7 @@ static void ndesc_prepare_tx_desc(struct dma_desc *p, int is_fs, int len,
 
 	p->des1 = cpu_to_le32(tdes1);
 
-	if (mode == STMMAC_CHAIN_MODE)
+	if (descriptor_mode == STMMAC_CHAIN_MODE)
 		norm_set_tx_desc_len_on_chain(p, len);
 	else
 		norm_set_tx_desc_len_on_ring(p, len);
-- 
2.47.3



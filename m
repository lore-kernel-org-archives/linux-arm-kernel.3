Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DB4606EE89
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BYz21oxe;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=i7783GZc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hdB7q81mTRiafyTU90+Nru1Z7mdwITDPN9ZjuiDmuj4=; b=BYz21oxeOurD2e
	MeNyWmYMVJH4CFJQjNmj4M4PKVqYQiVEMg6qTwsoATpj2Hp9z/+a+VBCMxzg5tugdCzzynVW1jHEN
	JjRRbVuPMh7Ai3JSSQ1mmKm1hGTo6QhoqkEfBdXhWdDMn1cP+NkV1oby2TgI/VIraZGkaY3ZGwW4d
	oPM0LCKzhht/ozyXwHVip7XMou8TI3z3aMhzzbf8+VHd0lvboCv63Dh4vw8WeWQgAovm3SqqfPRov
	8sPjtvJx1Z/iAPeK9h3vm6A11+tqwN9solDKq7k86Ba4rIjkWdP/x1fKup1Fg5wD3WLsrHb/a36vu
	OoibqkTTaGOc9pPNmljQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxxp-00000009Bcl-0olI;
	Thu, 05 Nov 2026 13:57:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxxj-00000009BYp-0CSD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 13:57:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1793887026; x=1825423026;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=YyUtvcvn5oJhn+gogAh9fUM8vO0gq8//Wrd0z2MWH+g=;
  b=i7783GZcf4+vzK25ls86IdTjE/pGtHscn5WxGwSu36v5qLcMni7WZOjS
   ZXCl5QUV0525ca9avKv6/Niq/8L8hEe3ejpr17h+jZDCcMWm43vEMjrKQ
   IKVVa9BY7OzmKao/SdLcEf8A5yE0ApBaAGitQ92GqZkE0NpYf/jZw6xxs
   xXoikSY521u8R6FHviWvU8xnJf+HTgu/y7ILQuyK8ocK/5cjwDtnBXUqe
   dbunv9TyjWTTT70VJkf2V9PlHw7ZKsj34pXOHWNpQegBsoNuCfZ8iZCfQ
   6he+XBUyoeQjkZoCxcZQr0F2F5vjfr6klj6VnhKzxxmo9O4HH3h9R5QXr
   w==;
X-CSE-ConnectionGUID: I8o+1O/kTI+TII5nkTt4LQ==
X-CSE-MsgGUID: uGUqt2EvTC2hBa8NXhFNyw==
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="65112457"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Nov 2026 06:57:06 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 5 Nov 2026 06:57:05 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 5 Nov 2026 06:57:03 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 5 Nov 2026 14:56:37 +0100
Subject: [PATCH net-next 2/9] net: sparx5/lan969x: free the FDMA buffers on
 init errors and deinit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261105-sparx5-mtu-change-v1-2-f27bab580463@microchip.com>
References: <20261105-sparx5-mtu-change-v1-0-f27bab580463@microchip.com>
In-Reply-To: <20261105-sparx5-mtu-change-v1-0-f27bab580463@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Richard
 Cochran" <richardcochran@gmail.com>, Russell King <linux@armlinux.org.uk>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Robert Marko <robert.marko@sartura.hr>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_055707_145726_F734371C 
X-CRM114-Status: GOOD (  21.13  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The FDMA RX buffers are skbs on Sparx5, and pages from a page_pool on
lan969x, which are handed to the FDMA through the RX DCBs. On lan969x,
the TX DCBs also have an array holding the state of the TX buffers.

These are not all freed. On Sparx5, the RX skbs are never freed, and
if the TX buffers cannot be allocated, the RX DCBs are not freed. On
lan969x, if the RX DCBs cannot be allocated, the page_pool is not
destroyed, if the TX buffers cannot be allocated, only the RX DCBs are
freed, and lan969x_fdma_deinit() never frees the TX buffer state. On
both, the return value of fdma_dcbs_init() is also ignored for RX, so
if a buffer cannot be allocated while filling the RX ring, the FDMA is
started with a partly filled ring, and on lan969x,
lan969x_fdma_free_pages() later puts the pages that were never
allocated.

In preparation for MTU support, add sparx5_fdma_rx_free(), which frees
the RX skbs and DCBs, lan969x_fdma_rx_free(), which returns the pages to
the page_pool and frees the page_pool and the RX DCBs, and
lan969x_fdma_tx_free(), which frees the TX buffer state and the TX
DCBs, and use them on the error paths and on deinit. Check the return
value of fdma_dcbs_init() for RX. To know which RX buffers are still
owned by the driver, clear the RX buffer slot once the buffer has been
passed to the stack on Sparx5, and make lan969x_fdma_free_pages() skip
and clear the empty slots of the ring.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../microchip/sparx5/lan969x/lan969x_fdma.c        | 54 ++++++++++++++++------
 .../net/ethernet/microchip/sparx5/sparx5_fdma.c    | 30 ++++++++++--
 2 files changed, 65 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
index 053d125eda658..d162bea02cbfb 100644
--- a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
+++ b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_fdma.c
@@ -90,12 +90,29 @@ static void lan969x_fdma_free_pages(struct sparx5_rx *rx)
 	struct fdma *fdma = &rx->fdma;
 
 	for (int i = 0; i < fdma->n_dcbs; ++i) {
-		for (int j = 0; j < fdma->n_dbs; ++j)
+		for (int j = 0; j < fdma->n_dbs; ++j) {
+			if (!rx->page[i][j])
+				continue;
+
 			page_pool_put_full_page(rx->page_pool,
 						rx->page[i][j], false);
+			rx->page[i][j] = NULL;
+		}
 	}
 }
 
+/* Return the pages in the RX ring to the page_pool, and free the page_pool
+ * and the RX DCBs.
+ */
+static void lan969x_fdma_rx_free(struct sparx5 *sparx5)
+{
+	struct sparx5_rx *rx = &sparx5->rx;
+
+	lan969x_fdma_free_pages(rx);
+	fdma_free_coherent(sparx5->dev, &rx->fdma);
+	page_pool_destroy(rx->page_pool);
+}
+
 static struct sk_buff *lan969x_fdma_rx_get_frame(struct sparx5 *sparx5,
 						 struct sparx5_rx *rx)
 {
@@ -169,14 +186,18 @@ static int lan969x_fdma_rx_alloc(struct sparx5 *sparx5)
 		return PTR_ERR(rx->page_pool);
 
 	err = fdma_alloc_coherent(sparx5->dev, fdma);
-	if (err)
+	if (err) {
+		page_pool_destroy(rx->page_pool);
 		return err;
+	}
 
-	fdma_dcbs_init(fdma,
-		       FDMA_DCB_INFO_DATAL(fdma->db_size),
-		       FDMA_DCB_STATUS_INTR);
+	err = fdma_dcbs_init(fdma,
+			     FDMA_DCB_INFO_DATAL(fdma->db_size),
+			     FDMA_DCB_STATUS_INTR);
+	if (err)
+		lan969x_fdma_rx_free(sparx5);
 
-	return 0;
+	return err;
 }
 
 static int lan969x_fdma_tx_alloc(struct sparx5 *sparx5)
@@ -202,6 +223,15 @@ static int lan969x_fdma_tx_alloc(struct sparx5 *sparx5)
 	return 0;
 }
 
+/* Free the TX buffer state and the TX DCBs */
+static void lan969x_fdma_tx_free(struct sparx5 *sparx5)
+{
+	struct sparx5_tx *tx = &sparx5->tx;
+
+	fdma_free_coherent(sparx5->dev, &tx->fdma);
+	kfree(tx->dbs);
+}
+
 static void lan969x_fdma_rx_init(struct sparx5 *sparx5)
 {
 	struct fdma *fdma = &sparx5->rx.fdma;
@@ -353,7 +383,6 @@ int lan969x_fdma_xmit(struct sparx5 *sparx5, u32 *ifh, struct sk_buff *skb,
 
 int lan969x_fdma_init(struct sparx5 *sparx5)
 {
-	struct sparx5_rx *rx = &sparx5->rx;
 	int err;
 
 	lan969x_fdma_rx_init(sparx5);
@@ -375,7 +404,7 @@ int lan969x_fdma_init(struct sparx5 *sparx5)
 
 	err = lan969x_fdma_tx_alloc(sparx5);
 	if (err) {
-		fdma_free_coherent(sparx5->dev, &rx->fdma);
+		lan969x_fdma_rx_free(sparx5);
 		dev_err(sparx5->dev, "Failed to allocate TX buffers: %d\n",
 			err);
 		return err;
@@ -390,14 +419,9 @@ int lan969x_fdma_init(struct sparx5 *sparx5)
 
 int lan969x_fdma_deinit(struct sparx5 *sparx5)
 {
-	struct sparx5_rx *rx = &sparx5->rx;
-	struct sparx5_tx *tx = &sparx5->tx;
-
 	sparx5_fdma_stop(sparx5);
-	fdma_free_coherent(sparx5->dev, &tx->fdma);
-	fdma_free_coherent(sparx5->dev, &rx->fdma);
-	lan969x_fdma_free_pages(rx);
-	page_pool_destroy(rx->page_pool);
+	lan969x_fdma_tx_free(sparx5);
+	lan969x_fdma_rx_free(sparx5);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
index bcae0bbd5e44e..f4e8ac00dbe2f 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
@@ -174,6 +174,10 @@ static bool sparx5_fdma_rx_get_frame(struct sparx5 *sparx5, struct sparx5_rx *rx
 	skb->dev->stats.rx_bytes += skb->len;
 	skb->dev->stats.rx_packets++;
 	rx->packets++;
+	/* The skb is passed to the stack, so clear its slot in the ring, so
+	 * that sparx5_fdma_rx_free() does not free it.
+	 */
+	rx->skb[fdma->dcb_index][fdma->db_index] = NULL;
 	netif_receive_skb(skb);
 	return true;
 }
@@ -239,6 +243,21 @@ int sparx5_fdma_xmit(struct sparx5 *sparx5, u32 *ifh, struct sk_buff *skb,
 	return NETDEV_TX_OK;
 }
 
+/* Free the RX skbs owned by the driver, and the RX DCBs */
+static void sparx5_fdma_rx_free(struct sparx5_rx *rx)
+{
+	struct fdma *fdma = &rx->fdma;
+
+	for (int i = 0; i < fdma->n_dcbs; i++) {
+		for (int j = 0; j < fdma->n_dbs; j++) {
+			consume_skb(rx->skb[i][j]);
+			rx->skb[i][j] = NULL;
+		}
+	}
+
+	fdma_free_phys(fdma);
+}
+
 static int sparx5_fdma_rx_alloc(struct sparx5 *sparx5)
 {
 	struct sparx5_rx *rx = &sparx5->rx;
@@ -249,10 +268,12 @@ static int sparx5_fdma_rx_alloc(struct sparx5 *sparx5)
 	if (err)
 		return err;
 
-	fdma_dcbs_init(fdma, FDMA_DCB_INFO_DATAL(fdma->db_size),
-		       FDMA_DCB_STATUS_INTR);
+	err = fdma_dcbs_init(fdma, FDMA_DCB_INFO_DATAL(fdma->db_size),
+			     FDMA_DCB_STATUS_INTR);
+	if (err)
+		sparx5_fdma_rx_free(rx);
 
-	return 0;
+	return err;
 }
 
 static int sparx5_fdma_tx_alloc(struct sparx5 *sparx5)
@@ -425,6 +446,7 @@ int sparx5_fdma_init(struct sparx5 *sparx5)
 	}
 	err = sparx5_fdma_tx_alloc(sparx5);
 	if (err) {
+		sparx5_fdma_rx_free(&sparx5->rx);
 		dev_err(sparx5->dev, "Could not allocate TX buffers: %d\n", err);
 		return err;
 	}
@@ -434,7 +456,7 @@ int sparx5_fdma_init(struct sparx5 *sparx5)
 int sparx5_fdma_deinit(struct sparx5 *sparx5)
 {
 	sparx5_fdma_stop(sparx5);
-	fdma_free_phys(&sparx5->rx.fdma);
+	sparx5_fdma_rx_free(&sparx5->rx);
 	fdma_free_phys(&sparx5->tx.fdma);
 
 	return 0;

-- 
2.34.1



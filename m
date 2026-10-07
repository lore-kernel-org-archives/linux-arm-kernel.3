Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEE3CA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 03:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ZsRuBkhBUg+LwbJLoNuYgv5+8GqPNF2cVHjSy/4rFo=; b=wADixwuFNNnf3DH0UfLvQgc3cI
	6SutX5qcDKMEdD3E/XLUEbKFsNmf/7XYVqYAankutfUqeFk2DybROiFWaRP2MLWs+irPMPa6OBdja
	VCTeD73Xe1xliDxdO3kpEOylovtyIgZZYIlGehLQcLrv4lslFWig8CX5z71P0V1QdrYMV5RWYIWB4
	Nlkpjzv95RJdypEBVs7I2U373X7RQ9yO+cOBCUaUUSPCRWC+GZ+fzHYL77J4Ijmz+OTpCulIz5jNQ
	zO4rY6i/LDFkn1A6yxTyByn1YFM7H+GkdMaNaclVTKq1Zm95mcdAbXvdOVMukDMGm05GGPlUN7oC3
	+mFEvI6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEIbu-00000001gL2-3XAp;
	Wed, 07 Oct 2026 03:46:30 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEIbs-00000001gKf-0m3Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 03:46:29 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so40136265e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 20:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791344786; x=1791949586; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ZsRuBkhBUg+LwbJLoNuYgv5+8GqPNF2cVHjSy/4rFo=;
        b=dL8ZCsmJX3s6BbTElLyvaK5/xQ+RmQHqQYoinOr2Ja+jXv5QBfszyBVystwBzoZfE3
         DLHt8eyR+LaJVFDSXtfTE+rTsfE1/0/keFnU/EaJvZt2R9qtfAAFBoToHEKUcmBBZs3d
         2PYpsBlHGcVfnuOPRLF/EVTfzA67L10URDlQXfd1zfAwXhI2wkhdc6EuFphymY9+4TPn
         AJ4gECAS/ZzAbBWP38n1bQx31c8c96XkD7PU0ljJkFPQjOp+lwiO9PNb+D8r5T3Yjp4n
         Flaj6iok5eRW7r5z06LMlRUkKA5ca+VaqyRme75CHOeF8thA+8Ip7iUP2/T5isOIKma4
         iN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791344786; x=1791949586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ZsRuBkhBUg+LwbJLoNuYgv5+8GqPNF2cVHjSy/4rFo=;
        b=t0yliZgmG3+ww7qk9OIwaFnJTkAVi5NT8LASlJTJmMITfvVr2CZYCivB+sHyHyv9lz
         EAlNk+4/GOsF1jKmOj2InmSXQ6erVNrOnOOBfXEAzQ/y4RVk+PMRD2GF+iGzLbZ4awcl
         nd03YceI0BWBjB6lbJ3dZkSj9DoaF5jMfCHpMaoanbMgRIBRXweVG4b0qnRGCGgRI73h
         TwOcE6h9hcLlvNFv91HNixC85JnTP8JxtQkWW+PTH7S9u8jK2Tzh51mEv3d01YY8sCZG
         pd4+j0k40ZCO5H9sO3qP53LThpYKrzTf4HXkxLraqdLknxHPqL8DFbvEgelqBaIihToC
         aHXw==
X-Forwarded-Encrypted: i=1; AKwUvByxuLU1Tf8veJe+x+CVZOw9YAGlA3GaZkOnZbW+yp1e9PaHYf1Nab8aZibuzYwyBAQxaBZZ0UmYQ7gikMMGUIOZ@lists.infradead.org
X-Gm-Message-State: AFuF++mRSpB4Bekn/M418wnqzAjilzMHOd1I4lihz8mz1Uk45A02n5ZV
	QIz1cG9HH3yN2+wFo/jBlp7k+Zoq4Vi1csyEkl3KF5Tol218DpfCo075
X-Gm-Gg: AYBFou1xQ5IRHos/B3dwOYWIiYgq2ggxK/ERN5uoM4z+dihvXxD4EY22CdZlh4pBDk2
	UuMD9P1qGakEEYukjvTUjen5JFyvXaFDCfyZDmUAF/T+TwxrN61DyVD4xTfIbdVBp95kSh058oH
	hwfsC/lV6ivO1wgEAsIoX4llvVaXMMUf9lYKzgEjcOiSS0AxeSNlTuHxwHrGKa1sWotnmYzfsjJ
	ZKi8EQze5CGM7e2hCy+gummRaAQAUgWjsgJOTRIV737dhQBl+6XnGGBzQlGbFD1fpMKXRb/EWyJ
	Ckbr7G99DwoCemICKsSanNs5JodfPU6HeNcH4REuc5Lx+PU4vM7qOlKxf/8KuK6B8k3tEbjDYTa
	Phn8mKETH6JJEm6PcdnfMgf0DuG2Bfxj3bBY4ontMw6EpRz0J063psTLdiNcyb9yBCkq0gTaMiP
	MmXCaF9WiB8FfUEpNQAVdQuj8TeHwNnt00sJAn4lbq8UCJRFe9j4VZr0tP7GBeKTLopyf8xj+6K
	CjhiR/M9jHmMI8NxoQcxFMYCiURa9nQNPakPNd1
X-Received: by 2002:a05:600c:c165:b0:49c:ffab:551f with SMTP id 5b1f17b1804b1-4a181b33928mr731065e9.22.1791344785546;
        Tue, 06 Oct 2026 20:46:25 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1ffbcsm2763573f8f.36.2026.10.06.20.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 20:46:24 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: netdev@vger.kernel.org
Cc: radhey.shyam.pandey@amd.com,
	michal.simek@amd.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	daniel@iogearbox.net,
	jacob.e.keller@intel.com,
	joe@dama.to,
	suraj.gupta2@amd.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net v4] net: axienet: free outstanding TX buffers in axienet_dma_bd_release()
Date: Wed,  7 Oct 2026 06:46:20 +0300
Message-ID: <20261007034620.1360542-1-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20261004083759.1016519-1-maimon.sagi@gmail.com>
References: <20261004083759.1016519-1-maimon.sagi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_204628_288860_906B91B9 
X-CRM114-Status: GOOD (  28.96  )
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

axienet_dma_bd_release() walks the RX ring to unmap and free every
receive buffer before releasing it, but frees the TX descriptor ring
with dma_free_coherent() alone.  Any descriptor that
axienet_free_tx_chain() had not yet reclaimed still holds its skb and
its streaming DMA mapping, and both are lost.

axienet_stop() disables TX NAPI and stops the DMA engine before calling
it, so nothing reclaims those descriptors afterwards.  Bringing the
interface down while frames are in flight therefore leaks up to
lp->tx_bd_num skbs and mappings each time.

axienet_dma_err_handler() already walks the TX ring this way before it
restarts the DMA engine: it unmaps every descriptor whose cntrl is still
set - axienet_free_tx_chain() clears it on reclaim - frees any skb still
attached, and clears the descriptor.  Move that loop into a helper,
axienet_free_tx_bufs(), and call it from axienet_dma_bd_release() too.
This relies on axienet_stop() having stopped the DMA engine first, as
the RX walk in the same function already does.  The helper frees the
skbs with dev_kfree_skb_any(), as drops: in the error handler, which
runs from a workqueue, that frees them directly rather than deferring
them to softirq as dev_kfree_skb_irq() did.

The walk must not run on a ring that is not there.  axienet_open() does
not check the result of the reset that runs axienet_dma_bd_init(), so
when that reset fails tx_bd_v is either still NULL or, after an earlier
close, points at the ring that close freed.  Clear tx_bd_v and rx_bd_v
once their rings are freed, and skip the walk when tx_bd_v is NULL.
That also ends the second dma_free_coherent() of a stale ring which the
same path already did.  On the axienet_dma_bd_init() error path the TX
ring has just been allocated zeroed, so the walk does nothing.

This was reported by the Sashiko AI review bot.

Tested on the AXI Ethernet MAC of an ADVA TimeCard X2 (PCIe card, with
the built-in AXI DMA): traffic passes, and after each of ten down/up
cycles and five module reloads, all made with traffic running and each
running axienet_dma_bd_release(), traffic resumes and nothing is logged.
The leak itself was not measured, and neither the failed-reset paths nor
axienet_dma_err_handler() were exercised.

Fixes: 8a3b7a252dca ("drivers/net/ethernet/xilinx: added Xilinx AXI Ethernet driver")
Reviewed-by: Joe Damato <joe@dama.to>
Assisted-by: LLM sparse
Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>
---

Notes:
    Changes in v4:
    - Move the TX ring walk of axienet_dma_err_handler() into a helper,
      axienet_free_tx_bufs(), and use it from axienet_dma_bd_release()
      instead of a second copy (Joe, Jakub).  The error handler now frees
      the skbs with dev_kfree_skb_any() instead of dev_kfree_skb_irq().
    - Kept Joe's Reviewed-by, as the helper is what he asked for; dropped
      Jacob's, as the error handler changes too.  Jacob, Joe: please take
      another look and say if either tag should change.
    - v3: https://lore.kernel.org/netdev/20261004083759.1016519-1-maimon.sagi@gmail.com/
    
    Changes in v3:
    - Clear tx_bd_v and rx_bd_v after freeing the rings.  v2 only caught a
      NULL tx_bd_v from a first open; after a close followed by a failed
      reset the walk would have read the freed ring (Sashiko).
    - Reword the comment on the skb free: a descriptor can complete after
      TX NAPI was disabled, so "never transmitted" was not always true
      (Sashiko).
    - Say in the commit message which hardware the test ran on.
    - v2: https://lore.kernel.org/netdev/20260930133851.663023-1-maimon.sagi@gmail.com/
    
    Changes in v2:
    - Skip the TX walk when tx_bd_v is NULL (Sashiko).
    - Free the skbs with dev_kfree_skb_any(), so they count as drops as in
      axienet_dma_err_handler() (Sashiko).
    - v1: https://lore.kernel.org/netdev/20260927081034.350422-1-maimon.sagi@gmail.com/

 .../net/ethernet/xilinx/xilinx_axienet_main.c | 74 +++++++++++++------
 1 file changed, 50 insertions(+), 24 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 09443623a3e2..318ff03b04e6 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -173,6 +173,46 @@ static dma_addr_t desc_get_phys_addr(struct axienet_local *lp,
 	return ret;
 }
 
+/**
+ * axienet_free_tx_bufs - Release the buffers still held by the TX ring
+ * @lp:		Pointer to the axienet_local structure
+ *
+ * Unmap every descriptor whose mapping is still live, free any skb still
+ * attached, and clear the descriptor for reuse.  axienet_free_tx_chain()
+ * clears cntrl when it reclaims a descriptor, so a non-zero value means
+ * the mapping is live.  The DMA engine must be stopped.
+ */
+static void axienet_free_tx_bufs(struct axienet_local *lp)
+{
+	struct axidma_bd *cur_p;
+	u32 i;
+
+	for (i = 0; i < lp->tx_bd_num; i++) {
+		cur_p = &lp->tx_bd_v[i];
+		if (cur_p->cntrl) {
+			dma_addr_t addr = desc_get_phys_addr(lp, cur_p);
+
+			dma_unmap_single(lp->dev, addr,
+					 (cur_p->cntrl &
+					  XAXIDMA_BD_CTRL_LENGTH_MASK),
+					 DMA_TO_DEVICE);
+		}
+		/* not reclaimed by axienet_free_tx_chain(), so a drop */
+		if (cur_p->skb)
+			dev_kfree_skb_any(cur_p->skb);
+		cur_p->phys = 0;
+		cur_p->phys_msb = 0;
+		cur_p->cntrl = 0;
+		cur_p->status = 0;
+		cur_p->app0 = 0;
+		cur_p->app1 = 0;
+		cur_p->app2 = 0;
+		cur_p->app3 = 0;
+		cur_p->app4 = 0;
+		cur_p->skb = NULL;
+	}
+}
+
 /**
  * axienet_dma_bd_release - Release buffer descriptor rings
  * @ndev:	Pointer to the net_device structure
@@ -186,11 +226,18 @@ static void axienet_dma_bd_release(struct net_device *ndev)
 	int i;
 	struct axienet_local *lp = netdev_priv(ndev);
 
-	/* If we end up here, tx_bd_v must have been DMA allocated. */
+	/* tx_bd_v is NULL if axienet_dma_bd_init() did not get as far as
+	 * allocating it, and is cleared below once the ring is freed;
+	 * dma_free_coherent() accepts NULL.
+	 */
+	if (lp->tx_bd_v)
+		axienet_free_tx_bufs(lp);
+
 	dma_free_coherent(lp->dev,
 			  sizeof(*lp->tx_bd_v) * lp->tx_bd_num,
 			  lp->tx_bd_v,
 			  lp->tx_bd_p);
+	lp->tx_bd_v = NULL;
 
 	if (!lp->rx_bd_v)
 		return;
@@ -221,6 +268,7 @@ static void axienet_dma_bd_release(struct net_device *ndev)
 			  sizeof(*lp->rx_bd_v) * lp->rx_bd_num,
 			  lp->rx_bd_v,
 			  lp->rx_bd_p);
+	lp->rx_bd_v = NULL;
 }
 
 static u64 axienet_dma_rate(struct axienet_local *lp)
@@ -2749,29 +2797,7 @@ static void axienet_dma_err_handler(struct work_struct *work)
 	axienet_dma_stop(lp);
 	netdev_reset_queue(ndev);
 
-	for (i = 0; i < lp->tx_bd_num; i++) {
-		cur_p = &lp->tx_bd_v[i];
-		if (cur_p->cntrl) {
-			dma_addr_t addr = desc_get_phys_addr(lp, cur_p);
-
-			dma_unmap_single(lp->dev, addr,
-					 (cur_p->cntrl &
-					  XAXIDMA_BD_CTRL_LENGTH_MASK),
-					 DMA_TO_DEVICE);
-		}
-		if (cur_p->skb)
-			dev_kfree_skb_irq(cur_p->skb);
-		cur_p->phys = 0;
-		cur_p->phys_msb = 0;
-		cur_p->cntrl = 0;
-		cur_p->status = 0;
-		cur_p->app0 = 0;
-		cur_p->app1 = 0;
-		cur_p->app2 = 0;
-		cur_p->app3 = 0;
-		cur_p->app4 = 0;
-		cur_p->skb = NULL;
-	}
+	axienet_free_tx_bufs(lp);
 
 	for (i = 0; i < lp->rx_bd_num; i++) {
 		cur_p = &lp->rx_bd_v[i];

base-commit: 23609bce9e1de525d1d0e73fc68c6e7971d0b49e
-- 
2.47.0



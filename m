Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81607CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 21:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-transfer-encoding:
	MIME-version:References:In-reply-to:Message-id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bJPU9678+y1cp2+iUvq03ogPthNxCP++IVi7e5ZAngg=; b=jSEaNjjqmZdr8HAwCZ6QVo55be
	DokWrp8G4uDjDdiGU1ZMQk3cO/QWF9eiUSyzK+RVC6ZGNrP5ofcUBWJ8DsFNS8JG0nfh6o6yHb/xB
	Vp/lw+1H1hw02LMittqqgvcvmLu+3bxuDOQ4kMSIAXoKvE7JCVjWPvukQq3raGSS07KJaQsNxcNMk
	5Ux4ZfLf6HRREDA139FJ+BIUnJkPGd5ShGIwd/gKfnfWgJzbvWcgCMngEdHj/4bI9b+Zyr+PcnkMK
	2+e5otOQCsNppVTLXLzzOUCCR6ZBZLJnTJ0MZFoCTql/uuvgit3nWXXLj4UsjzMyjMZBNkoke8qBo
	NsTQn1SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNe1M-00000006eN5-3yMd;
	Thu, 14 May 2026 21:55:08 +0000
Received: from acj35aaf116.lhr1.oracleemaildelivery.com ([130.35.116.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNe1H-00000006eIQ-0i7I
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 21:55:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oracle-uk-012026;
 d=raczylo.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=bJPU9678+y1cp2+iUvq03ogPthNxCP++IVi7e5ZAngg=;
 b=RYZ+LyyThoTN0uoikiaeNHzMw+Dit+4i+4kIokUY+an9EnjPqTzBB2fbue2l+d+OGyXU1ADYgnZo
   NUVl9HWbKsOTY0vbGEsRXk59AdZwb1gn8vosjMmoIK1M4GzO/At/FiiZxqRCgMCzTkqfHL1SvINQ
   x7elnb/7sirc6+5TqZfGu9K/KrNgVlXVm5BDxDFusTh2CIuPlA+Lj0xctJ/K2cDag0QAPx2BqkDK
   CuWgxLkSgVHkix3quqy4UNQ0b8XbTM9WIEwvEQUUCzknbkK/8Xe+olsj9DDbhPW8k36gwAJ8mYw7
   +RnwvClAqD06zK7f1BXgP1h9FD2TG5rzX/v+6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-lhr-20191104;
 d=lhr1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=bJPU9678+y1cp2+iUvq03ogPthNxCP++IVi7e5ZAngg=;
 b=SLm8OrvJEes6XY0hZlxbWPRD+1p+1DPPsAk4nlI426hZBADcohdXF/6+S36693Fs+LGzKjSULHFL
   V0h8M3QHyJXZNMjoCGn81kgaT9HI2hmbSkndNLpum4OBFazJJqODKFYgYS0Dlhp93sBLqDg4G8uz
   aYYCQJuTwe6DlNcZhCLavnvpVz5DPHVmRxhJEAJpChTfdQ0VhfzHhRi18bjUO+N7KJ4g06SsR4TE
   2S9Y6RAIGxUEGs9OD1PrNFei0YVh0k8PQ8dKK/ExH/7ywa32WpEetgaW88ue/Lm8hjI6Ju5q1Pap
   hBXR+iJ+YEx12lHzWK8PgXnT3i/Z6ecFqhe0zg==
Received: by omta-ad3-fd3-1401-uk-london-1.omtaad3.vcndplhr.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20260212 64bit (built Feb 12
 2026))
 with ESMTPS id <0TF12GSUXRJOC1B0@omta-ad3-fd3-1401-uk-london-1.omtaad3.vcndplhr.oraclevcn.com> for
 linux-arm-kernel@lists.infradead.org; Thu, 14 May 2026 21:55:00 +0000 (GMT)
List-Unsubscribe-Post: List-Unsubscribe=One-Click
From: Lukasz Raczylo <lukasz@raczylo.com>
To: netdev@vger.kernel.org
Cc: Theo Lebrun <theo.lebrun@bootlin.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,	linux-rpi-kernel@lists.infradead.org
Subject: [PATCH net-next v2 1/3] net: macb: flush PCIe posted write after
 TSTART doorbell (PCIe-only)
Date: Thu, 14 May 2026 22:54:57 +0100
Message-id: <20260514215459.36109-2-lukasz@raczylo.com>
X-Mailer: git-send-email 2.54.0
In-reply-to: <20260514215459.36109-1-lukasz@raczylo.com>
References: <cover.1777064117.git.lukasz@raczylo.com>
 <20260514215459.36109-1-lukasz@raczylo.com>
MIME-version: 1.0
Content-transfer-encoding: 8bit
Reporting-Meta: AAHf+Z0YX8zBMsksb6gSGL9ZV3VCbo9am2PhbSO1iipMaVnbSZPP4U7YWpbXzRHK
 g669lhZ1JQctwueluqlqYAuNG1sS6Qw9c234jNAQjF0OSGMpjo9d9YYdMKKx6MfD
 whK1c+rSJFpjeNkbWQmyzJmCkhJCR5aD+w5Lr84BzQtRGRL79Svl/i7oW1M6D8Z8
 5xT2OTrIXalVT++981em134AvXQj6p9LMWijMnp/+t0EgYfo1cIdscLNIBuR+G/h
 q3GcuXCt52nO2fY9fyJWxAEndm1x5ERH5eFFnNhGgC25abxovatYn8QIkRJi2Hnr
 31hf84UQHaQpV/8X8+Jk5x+dNzFcRlz5lNZvicPnlRDe4qUm6fOHK//IXjlTor7u
 n3odvfkIrc1kktAvfEAwczjua5Alb+2bRBphXfUNhSdZ9JHh55kbO7H6fREbESxI 9vOt2sjTHA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_145503_214128_EEB32CD2 
X-CRM114-Status: GOOD (  18.45  )
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

macb_start_xmit() and macb_tx_restart() kick transmission by
OR-ing MACB_BIT(TSTART) into NCR.  On PCIe-attached macb
instances (BCM2712 + RP1 PCIe south bridge on Raspberry Pi 5 is
the case I have in front of me), writes to NCR are posted PCIe
writes: they are not guaranteed to reach the device before the
issuing CPU returns.  If the TSTART doorbell does not reach the
MAC, no TX begins, no TCOMP completion arrives, and the ring
remains quiescent without any kernel-visible indication.

Add a read-back of NCR after each TSTART write.  The read is an
architected PCIe read barrier for earlier posted writes on the
same path; it ensures the doorbell has reached the MAC before
the function returns.  As a side effect on macb_start_xmit() it
also flushes the preceding macb_tx_lpi_wake() NCR write -- not
just TSTART -- since the barrier applies to all prior posted
writes by the same requester.

The cost is one non-posted PCIe read per TSTART.  To avoid
imposing this on SoC-integrated macb variants (Atmel, Microchip,
SiFive, Xilinx), where NCR is on-chip MMIO and no fabric
posted-write concern exists, gate the readback behind a new
MACB_CAPS_PCIE_POSTED_WRITES capability set only on
raspberrypi_rp1_config.

Note that the raspberrypi/linux vendor fork carries a local
patch around the TSTART site (a queue->tx_pending breadcrumb
that is promoted to queue->txubr_pending by the next TCOMP
interrupt, triggering macb_tx_restart()).  That workaround makes
the loss recoverable under traffic, but it cannot help if TCOMP
itself is not raised because no TX started -- which is exactly
the case targeted here.  The handshake is not present in
mainline.

Link: https://github.com/cilium/cilium/issues/43198
Link: https://bugs.launchpad.net/ubuntu/+source/linux-raspi/+bug/2133877
Signed-off-by: Lukasz Raczylo <lukasz@raczylo.com>
---
 drivers/net/ethernet/cadence/macb.h      |  4 ++++
 drivers/net/ethernet/cadence/macb_main.c | 15 +++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
index 2de56017e..ce9037f9e 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -791,6 +791,10 @@
 #define MACB_CAPS_USRIO_HAS_MII			BIT(26)
 #define MACB_CAPS_USRIO_HAS_REFCLK_SOURCE	BIT(27)
 #define MACB_CAPS_USRIO_HAS_TSUCLK_SOURCE	BIT(28)
+/* Register writes are posted on the parent fabric and need a non-posted
+ * read-back to guarantee delivery.  Currently set only on RP1.
+ */
+#define MACB_CAPS_PCIE_POSTED_WRITES		BIT(29)
 
 /* LSO settings */
 #define MACB_LSO_UFO_ENABLE			0x01
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index a12aa2124..6879f3458 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -1922,6 +1922,14 @@ static void macb_tx_restart(struct macb_queue *queue)
 
 	spin_lock(&bp->lock);
 	macb_writel(bp, NCR, macb_readl(bp, NCR) | MACB_BIT(TSTART));
+	/*
+	 * On PCIe-attached parts, flush the posted-write queue so the
+	 * TSTART doorbell reliably reaches the MAC.  Without this the
+	 * write can sit in the fabric and the MAC never advances,
+	 * causing a silent TX stall.
+	 */
+	if (bp->caps & MACB_CAPS_PCIE_POSTED_WRITES)
+		(void)macb_readl(bp, NCR);
 	spin_unlock(&bp->lock);
 
 out_tx_ptr_unlock:
@@ -2560,6 +2568,12 @@ static netdev_tx_t macb_start_xmit(struct sk_buff *skb, struct net_device *dev)
 	spin_lock(&bp->lock);
 	macb_tx_lpi_wake(bp);
 	macb_writel(bp, NCR, macb_readl(bp, NCR) | MACB_BIT(TSTART));
+	/*
+	 * Flush PCIe posted-write queue; see comment in macb_tx_restart().
+	 * Also flushes the preceding macb_tx_lpi_wake() NCR write.
+	 */
+	if (bp->caps & MACB_CAPS_PCIE_POSTED_WRITES)
+		(void)macb_readl(bp, NCR);
 	spin_unlock(&bp->lock);
 
 	if (CIRC_SPACE(queue->tx_head, queue->tx_tail, bp->tx_ring_size) < 1)
@@ -5674,6 +5688,7 @@ static const struct macb_config raspberrypi_rp1_config = {
 	.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE | MACB_CAPS_CLK_HW_CHG |
 		MACB_CAPS_JUMBO |
 		MACB_CAPS_GEM_HAS_PTP |
+		MACB_CAPS_PCIE_POSTED_WRITES |
 		MACB_CAPS_EEE |
 		MACB_CAPS_USRIO_HAS_MII,
 	.dma_burst_length = 16,
-- 
2.54.0



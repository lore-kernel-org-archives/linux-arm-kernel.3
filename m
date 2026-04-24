Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C55FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 22:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-transfer-encoding:
	MIME-version:References:In-reply-to:Message-id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G7jLGar8TG1IVsYdC7k9CyHPoJnsdAXy6l5eRrUEDPc=; b=tyBkPbeYnx1+xXEwfp7P/0VxQP
	B1YZlRd6XevUsFqcwtVbHBY1ESE/X8HJmI2zuHfk4sfPNGT7xZrw0y+BfsbRTsMyvE6edd0aDPvWD
	1rB+6osrsW6q9F/lSrL+YwuksVCqT9mFkTqooHEvtQIzddtixr9GnCUUUBVk4av8nQT8tZCooB2Rj
	WBBAmqYYdEyfEBWqcu5WlQuwXZ8wjUNO9tAsyAE8UammQPS/vknHEbKQUsamB6ZVIQeD67OBMfzIK
	9SmRg2mSTobWS1d66fobpdNZTD/vu+riVIih5w8qya0s3n2CtpvDq9Ulap2zw7cSWtMCr2gxth76x
	4QEcMj9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGPAf-0000000Dp0u-0gUQ;
	Fri, 24 Apr 2026 22:38:49 +0000
Received: from acj35aaf121.lhr1.oracleemaildelivery.com ([130.35.116.121])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGPAW-0000000Dox3-2q2f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 22:38:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oracle-uk-012026;
 d=raczylo.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=G7jLGar8TG1IVsYdC7k9CyHPoJnsdAXy6l5eRrUEDPc=;
 b=Tt+f3bp7TK8O7ceSTuZrw0od7GEUijqte4Rqci7q6Tez5vLkH6uRwHcs1Ff2lyWPdp+aiEadY3+7
   rjGjuthBEqEtrSxRoNbmFBLsnWb0bmwq3Hj9Jr1AKrhjMsljAU5XTDXZxdTQRz7IJ1eiIfTUNxza
   lNj2YED8RBPm23Znk61xx7WLcs+vmCLV1uftXNrYL6KhgdKpB1HqXMOiIJqSla6+kXl2hb63WlE2
   f0weLWFKw6L4QFNaRO0pzNCg0QK8m6S6ny0B4hkAZ+PcZ6IcQ/ynzPnfVybVAVxTdTlJESiDu8uZ
   Q14iLxkILwH/+qhi1BamknRcSkQ89vsur0bs0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-lhr-20191104;
 d=lhr1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=G7jLGar8TG1IVsYdC7k9CyHPoJnsdAXy6l5eRrUEDPc=;
 b=xv+EmgbkYGv6LS8vdqEgbGkl5+ghBoiHBCTvg1GWIm+BsW5Du6+6uPFrKKa8gQ1clC/K6kYXiAXg
   ET4E6y/Oz3O6dARIeruzfdN1+yXYK60zmPqKiqIXC6WNMIpZ6uqKbzyAekH3Hc7wPCav5RRyu8Ev
   sID/HE749cHijF+/MK+ZcmKzwZs0xJPAjLVcEK/WxVZ64SaUWcVDI07VxcnvviAQIvvz01Qez0Q3
   +mzXXWo9rYY7bEidN/B6Rg6sAKFZHk3stT3BU7avmfI4Io2rPokdk3WYnnK8vqkLI5DsAuDkS3te
   uRYby1y5Vg3XbGRH5KAj30ZfxQPIEYFDgDGhfg==
Received: by omta-ad2-fd2-401-uk-london-1.omtaad2.vcndplhr.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20260212 64bit (built Feb 12
 2026))
 with ESMTPS id <0TE000AXCS8ANFB0@omta-ad2-fd2-401-uk-london-1.omtaad2.vcndplhr.oraclevcn.com> for
 linux-arm-kernel@lists.infradead.org; Fri, 24 Apr 2026 22:38:34 +0000 (GMT)
List-Unsubscribe-Post: List-Unsubscribe=One-Click
From: Lukasz Raczylo <lukasz@raczylo.com>
To: netdev@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,	linux-rpi-kernel@lists.infradead.org
Subject: [RFC PATCH net-next 1/3] net: macb: flush PCIe posted write after
 TSTART doorbell
Date: Fri, 24 Apr 2026 23:38:31 +0100
Message-id: <3106d546d494f2f52ec832e7f7d04f534286e254.1777064117.git.lukasz@raczylo.com>
X-Mailer: git-send-email 2.53.0
In-reply-to: <cover.1777064117.git.lukasz@raczylo.com>
References: <cover.1777064117.git.lukasz@raczylo.com>
MIME-version: 1.0
Content-transfer-encoding: 8bit
Reporting-Meta: AAFzDiYTuS9jvqSCDQoXiqVnkU2yDl7DFh57yZB8VktRLO86c1eFyO5ekvNWCLwV
 PHyd9gw8WA5srfV/TRD+0HPcqN0ckK5QcJJ9SXd+hiicCqCjttoRKUA9zK9i0dyt
 tBaDYONlDAtM3MCCHzE1pjljrQkET8BwRV0b5q33g3JKqNqyLYR2u3gJFL8mP18l
 GIQhnaHVM0NNsLPkijjjJxac6kfDQxkiOAbNywneKirW1YUQCwlS1sTYHYSLL0Zv
 XQMtDLo2peLk8mrwDtTqBdDwMr4M+Q5clyCcFd6cro5QogkGhc5P6hqW2aman4kv
 iehelXA1UkRMvKjaBV0SY6ohN+CqauP1b7aWSotOowPGcqNxDxg7OcYuI0rwfmNl
 vPeuX8GpcpuROa0DuNX4cjhlEdMdKi7Ug8zYjG1/Uz/pkbh1yMsterzyA+2rW1Qz wnWuDvUi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_153841_364606_D60B9AF8 
X-CRM114-Status: GOOD (  16.75  )
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
OR-ing MACB_BIT(TSTART) into NCR.  On PCIe-attached macb instances
(BCM2712 + RP1 PCIe south bridge on Raspberry Pi 5 is the setup we
have in front of us), writes to NCR are posted PCIe writes: they
are not guaranteed to reach the device before the issuing CPU
returns.  If the TSTART doorbell does not reach the MAC, no TX
begins, no TCOMP completion arrives, and the ring remains
quiescent without any kernel-visible indication.

Note that the raspberrypi/linux vendor fork carries a local patch
around the TSTART site (a queue->tx_pending breadcrumb that is
promoted to queue->txubr_pending by the next TCOMP interrupt,
triggering macb_tx_restart()).  That workaround makes the loss
recoverable under traffic, but it cannot help if TCOMP itself is
not raised because no TX started -- which is exactly the case we
are targeting here.  The handshake is not present in mainline.

Add a read-back of NCR after each TSTART write in macb_start_xmit()
and macb_tx_restart().  The read is an architected PCIe read
barrier for earlier posted writes on the same path; it ensures the
doorbell has reached the MAC before the functions return.

We do not yet have direct hardware evidence that TSTART is being
lost on the RP1 path (that would require a PCIe protocol analyser,
or at minimum a before/after counter on queue->tx_stall_last_tail
with and without this patch applied in isolation).  This patch is
one of a three-patch series ("candidate fixes for silent TX stall
on BCM2712/RP1"); see the cover letter for context.  We have
verified the series compiles and applies cleanly against mainline
HEAD and against raspberrypi/linux rpi-6.18.y @ f2f68e79f16f;
runtime verification is pending.

Link: https://github.com/cilium/cilium/issues/43198
Link: https://bugs.launchpad.net/ubuntu/+source/linux-raspi/+bug/2133877
Signed-off-by: Lukasz Raczylo <lukasz@raczylo.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index a12aa2124..b6cca55ad 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -1922,6 +1922,13 @@ static void macb_tx_restart(struct macb_queue *queue)
 
 	spin_lock(&bp->lock);
 	macb_writel(bp, NCR, macb_readl(bp, NCR) | MACB_BIT(TSTART));
+	/*
+	 * Flush the PCIe posted-write queue so the TSTART doorbell
+	 * reliably reaches the MAC.  Without this, the write can sit
+	 * in the fabric and the MAC never advances, causing a silent
+	 * TX stall.
+	 */
+	(void)macb_readl(bp, NCR);
 	spin_unlock(&bp->lock);
 
 out_tx_ptr_unlock:
@@ -2560,6 +2567,11 @@ static netdev_tx_t macb_start_xmit(struct sk_buff *skb, struct net_device *dev)
 	spin_lock(&bp->lock);
 	macb_tx_lpi_wake(bp);
 	macb_writel(bp, NCR, macb_readl(bp, NCR) | MACB_BIT(TSTART));
+	/*
+	 * Flush the PCIe posted-write queue; see the comment in
+	 * macb_tx_restart() for the reasoning.
+	 */
+	(void)macb_readl(bp, NCR);
 	spin_unlock(&bp->lock);
 
 	if (CIRC_SPACE(queue->tx_head, queue->tx_tail, bp->tx_ring_size) < 1)
-- 
2.53.0



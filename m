Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D700CCD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 21:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-transfer-encoding:
	MIME-version:References:In-reply-to:Message-id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FZvXfQHwc0uytzMRSej+dYkhKiNEOLiffrYDTYx5G6s=; b=Gql75R6AtRIouhlGfo7wnaPtfV
	avc/oay0/ty2QCJ/UOiavLJbVOLfqgcS+t9whVv+gjPWyPPkI1ml86IuIkldCSMhi8s57verWCNAL
	iGN9Ep6pbABbeGV+94pcEIitYwDkV7J7nGMbl8usLENEBKJpZMftrtn/LBzI+B/PMf17MK1dxJVHp
	dGYkBgij+hVmxqBZtx09q/zqa0SMFIysfrckT+VKssTqBdJ/hauFJdoy1FHWyusoknEU6SkjLT+TK
	9MVj/9eBP/pjipfpyD8FqcE1jFLbsd2I0+ibz80bZZkWU8yy0Ajs/aZsospd5twb/lZvtjKeReZGs
	K+wkTeoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNe1M-00000006eN0-3UDJ;
	Thu, 14 May 2026 21:55:08 +0000
Received: from acj35aaf86.lhr1.oracleemaildelivery.com ([130.35.116.86])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNe1H-00000006eIX-0WC1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 21:55:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oracle-uk-012026;
 d=raczylo.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=FZvXfQHwc0uytzMRSej+dYkhKiNEOLiffrYDTYx5G6s=;
 b=EA8ZdcVepopCnaxBB7WOtC0sbJ/Mk/Yp53FWoe2hSACCW3HxcX/ONKlrpYLgG0mwpOLncjGPlElg
   wJhSz165YN8yV7hUVhpMpMgwbbkhVgQx2IEMDU64dj/jhqFJk3uwCmLspi9PV3byu9xVIFJTQIY3
   yX7GBOlf6aMUFnEL5+a+TQqZqpEKQ5jtRqaarlGvPIA6HHG2RGoxViXyWkziyn17F6TJPutCFCrs
   8pd/hmLlH5F1Ydi+c+vBIw16IA+T3fLGuvhjZ0csx9vm6ai4t4ibR4GyuueVwuKtKzKO4Vjjr6sN
   Bb0l3dx75ql0njlO5CQ29iKOPihXFOmCaDD9wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-lhr-20191104;
 d=lhr1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=FZvXfQHwc0uytzMRSej+dYkhKiNEOLiffrYDTYx5G6s=;
 b=RhJ4BhM4P7kH722XIpi4BwXfdGbAQp/szA6bZZ25A3F+2fyj9mC04rgVcyNwN4PO3Fzvup15MTBz
   gLpG0tiByyjwJptnsj8JfTNQv00XZjUYIGiZVuphTnPgDE/gfea3TOD9tdKtWGzJH7ydm2XNTgB1
   Tk44lC15lEABTdvqjVa+bPHDFUAZlcHMfxs9OEMGCzdiTomWBOV0NUjCPqzc60Sbl5QVv9RDvcFR
   NP8/mLnRX8qK69Jdw705a11v0LQkjTW8TYfUV3xKcxWfrvfP5of0d1NMIcmAwrZNMa6a2xd2hJSO
   q70kcpXk+YuupyUQhksRQrZiw05TvoJtp+uVuw==
Received: by omta-ad3-fd2-1402-uk-london-1.omtaad3.vcndplhr.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20260212 64bit (built Feb 12
 2026))
 with ESMTPS id <0TF108300RJORXD0@omta-ad3-fd2-1402-uk-london-1.omtaad3.vcndplhr.oraclevcn.com> for
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
Subject: [PATCH net-next v2 2/3] net: macb: insert PCIe read barrier before TX
 completion descriptor check
Date: Thu, 14 May 2026 22:54:58 +0100
Message-id: <20260514215459.36109-3-lukasz@raczylo.com>
X-Mailer: git-send-email 2.54.0
In-reply-to: <20260514215459.36109-1-lukasz@raczylo.com>
References: <cover.1777064117.git.lukasz@raczylo.com>
 <20260514215459.36109-1-lukasz@raczylo.com>
MIME-version: 1.0
Content-transfer-encoding: 8bit
Reporting-Meta: AAHf+Z0YX8zBMsksb6gSGL9ZV3VCbo9am2PhbSO1iipMaVnbSZPP4U7YWpbXzRHK
 g669lhZ1JQctwueluql4YAuNG1sS6Qw9c23I9AkTLjAMXVAmazPQEa0MrzDBe6HB
 rqznXiHc0F+XamZ0tVdaurJN5NZcnBRgtO6xjN+MDjyyzR2xjgBU/Xh9HdPro8va
 Lx9dH8vGHV10GYi4G99wCjQrhYRFyXjeNGW2LmA3pErTklpH1S8Omic/9AsXpya/
 XRTmCAsvSvV5FOyv66H814r05QnfMOTmqU1rhw9kzosTkHK1Bs7UKD/Q1T+4zuiQ
 M6PWhPHq/kTCi7emgQFZTUPM2NXNUmhyV3B5bqtXOF1Zc0QiYiKycXoEu4PXePxg
 vjClf0bb+ng+dMSNtyxJYhE4/nP+WdApmXymM5q1PylMCEylvmVbAtwouzTarVyC gqlJIs2dpg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_145503_163576_C4C9C32E 
X-CRM114-Status: GOOD (  14.25  )
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

macb_tx_poll() runs with TCOMP masked, drains the TX ring, then
calls napi_complete_done() and re-enables TCOMP via IER.  An
existing comment in the function notes that completions raised
while TCOMP is masked do not re-fire on IER re-enable, and
mitigates this by calling macb_tx_complete_pending(), which
inspects driver-visible ring state (descriptor->ctrl, after
rmb()) and reschedules NAPI if a completion is observable in
memory.

On PCIe-attached parts (BCM2712 + RP1 PCIe south bridge on
Raspberry Pi 5 is the case I have in front of me), the
descriptor DMA write that sets TX_USED may not have retired to
system memory at the point macb_tx_complete_pending() runs.  The
rmb() synchronises the CPU view of earlier CPU writes; it is
not sufficient to retire an in-flight peripheral DMA write.
Under that ordering the in-memory descriptor can still read
TX_USED=0 when the hardware has in fact completed the frame;
the check returns false; NAPI exits; the quirk above prevents
the re-enabled IER from re-firing; the ring goes quiescent.

Add a side-effect-free MMIO read between the IER write and the
macb_tx_complete_pending() check.  The read functions as an
architected PCIe read barrier for earlier peripheral-originated
DMA writes on the same path, so any in-flight TX_USED update
retires to system memory before the descriptor read.

The register chosen is IMR (the read-only interrupt mask
mirror); reading it has no side effects on either read-clear or
W1C ISR silicon (it is not the ISR), and the read still flushes
prior DMA writes via the PCIe completion-ordering guarantee.

Link: https://github.com/cilium/cilium/issues/43198
Link: https://bugs.launchpad.net/ubuntu/+source/linux-raspi/+bug/2133877
Signed-off-by: Lukasz Raczylo <lukasz@raczylo.com>
---
 drivers/net/ethernet/cadence/macb_main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 6879f3458..f7fa9e7ad 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -1984,6 +1984,14 @@ static int macb_tx_poll(struct napi_struct *napi, int budget)
 		 * actions if an interrupt is raised just after enabling them,
 		 * but this should be harmless.
 		 */
+		/*
+		 * PCIe read barrier: flush any in-flight peripheral DMA
+		 * writes (descriptor TX_USED updates) so the subsequent
+		 * macb_tx_complete_pending() check observes them.  IMR is
+		 * the read-only interrupt mask mirror; the read has no
+		 * side effects on either read-clear or W1C ISR silicon.
+		 */
+		(void)queue_readl(queue, IMR);
 		if (macb_tx_complete_pending(queue)) {
 			queue_writel(queue, IDR, MACB_BIT(TCOMP));
 			macb_queue_isr_clear(bp, queue, MACB_BIT(TCOMP));
-- 
2.54.0



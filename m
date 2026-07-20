Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427ACC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 16:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:From:Cc:To:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=18TgNI8MYp1LbNuXLtYtpwaKmD22eZReAWzfss1RBUE=; b=L1HKT2vY3YgIp3viJp/QEgia6n
	kFTRrWW59baqJNbFxAFx6O+gtQlN3OUVD7dO3tAkbSXzFIXZVXDhL9NCyR/W+HLY0wYB9IsPp6TXL
	5bT/s3fmSFXmX+alGc2NWZ2QFQ8BJFqdzlJdinhmdEpB7cH57h/VnOJ06sSQCRMPV/gMP8qSda4yh
	Z2ffHcM6PaJkseljMtHYZgNhTfLfLeIEVdEECt3MA2jU6GWidpIs6i2oU/JQPKL2nShgpacYtEyWf
	JqNa0bMstmPD+Hs4TTWUE+vh0fU5QrhdOo22qmQ5eT/NaN+k1ouReCDU1gdj+Hvksfcd4mr6kr/8y
	U8gDpRSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqcq-00000007KHx-0dp1;
	Mon, 20 Jul 2026 16:13:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqco-00000007KHf-23d6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 16:13:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 945BF601DE;
	Mon, 20 Jul 2026 16:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91B61F00A3D;
	Mon, 20 Jul 2026 16:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784564029;
	bh=18TgNI8MYp1LbNuXLtYtpwaKmD22eZReAWzfss1RBUE=;
	h=Subject:To:Cc:From:Date;
	b=FDenRoGKiFZwuJLBvtz7+YKFyqcAiir5ip0KNtpPVdjHvGeADrQU8JTLMhx6Y21O8
	 kpR0F2o5S63VDPQI5zd2DrD07JDVhMyw26NMmYb7xU077M8WfpDYO5TcQsiuYBc7v4
	 t/cEmpUgYxsNf9wa12T0JLmyy81bII83Nz7Xmk9U=
Subject: Patch "net: ethernet: ti: icssg: guard PA stat lookups" has been added to the 6.18-stable tree
To: danishanwar@ti.com,gregkh@linuxfoundation.org,horms@kernel.org,kuba@kernel.org,linux-arm-kernel@lists.infradead.org,philippe.schenker@impulsing.ch,rogerq@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 20 Jul 2026 18:11:14 +0200
Message-ID: <2026072014-each-bruising-a439@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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


This is a note to let you know that I've just added the patch titled

    net: ethernet: ti: icssg: guard PA stat lookups

to the 6.18-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     net-ethernet-ti-icssg-guard-pa-stat-lookups.patch
and it can be found in the queue-6.18 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 27b9daba50609335db6ca81e4cccf50ded21ec76 Mon Sep 17 00:00:00 2001
From: Philippe Schenker <philippe.schenker@impulsing.ch>
Date: Thu, 18 Jun 2026 11:30:24 +0200
Subject: net: ethernet: ti: icssg: guard PA stat lookups

From: Philippe Schenker <philippe.schenker@impulsing.ch>

commit 27b9daba50609335db6ca81e4cccf50ded21ec76 upstream.

icssg_ndo_get_stats64() unconditionally calls emac_get_stat_by_name()
with FW PA stat names regardless of whether the PA stats block is
present on the hardware.  emac_get_stat_by_name() already guards the
PA stats lookup with `if (emac->prueth->pa_stats)`; when that pointer
is NULL the lookup falls through to netdev_err() and returns -EINVAL.
Because ndo_get_stats64 is polled regularly by the networking stack
this produces thousands of log entries of the form:

  icssg-prueth icssg1-eth end0: Invalid stats FW_RX_ERROR

A secondary consequence is that the int(-EINVAL) return value is
implicitly widened to a near-ULLONG_MAX unsigned value when accumulated
into the __u64 fields of rtnl_link_stats64, silently corrupting the
rx_errors, rx_dropped and tx_dropped counters reported by `ip -s link`.

Every other PA-aware code path in the driver is already guarded with
the same `if (emac->prueth->pa_stats)` check.  Apply the same guard
here.

Fixes: 0d15a26b247d ("net: ti: icssg-prueth: Add ICSSG FW Stats")
Signed-off-by: Philippe Schenker <philippe.schenker@impulsing.ch>
Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Cc: danishanwar@ti.com
Cc: rogerq@kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: stable@vger.kernel.org
Link: https://patch.msgid.link/20260618093037.3448858-1-dev@pschenker.ch
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 drivers/net/ethernet/ti/icssg/icssg_common.c |   49 +++++++++++++++------------
 1 file changed, 28 insertions(+), 21 deletions(-)

--- a/drivers/net/ethernet/ti/icssg/icssg_common.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_common.c
@@ -1315,28 +1315,35 @@ void icssg_ndo_get_stats64(struct net_de
 	stats->rx_over_errors = emac_get_stat_by_name(emac, "rx_over_errors");
 	stats->multicast      = emac_get_stat_by_name(emac, "rx_multicast_frames");
 
-	stats->rx_errors  = ndev->stats.rx_errors +
-			    emac_get_stat_by_name(emac, "FW_RX_ERROR") +
-			    emac_get_stat_by_name(emac, "FW_RX_EOF_SHORT_FRMERR") +
-			    emac_get_stat_by_name(emac, "FW_RX_B0_DROP_EARLY_EOF") +
-			    emac_get_stat_by_name(emac, "FW_RX_EXP_FRAG_Q_DROP") +
-			    emac_get_stat_by_name(emac, "FW_RX_FIFO_OVERRUN");
-	stats->rx_dropped = ndev->stats.rx_dropped +
-			    emac_get_stat_by_name(emac, "FW_DROPPED_PKT") +
-			    emac_get_stat_by_name(emac, "FW_INF_PORT_DISABLED") +
-			    emac_get_stat_by_name(emac, "FW_INF_SAV") +
-			    emac_get_stat_by_name(emac, "FW_INF_SA_DL") +
-			    emac_get_stat_by_name(emac, "FW_INF_PORT_BLOCKED") +
-			    emac_get_stat_by_name(emac, "FW_INF_DROP_TAGGED") +
-			    emac_get_stat_by_name(emac, "FW_INF_DROP_PRIOTAGGED") +
-			    emac_get_stat_by_name(emac, "FW_INF_DROP_NOTAG") +
-			    emac_get_stat_by_name(emac, "FW_INF_DROP_NOTMEMBER");
+	stats->rx_errors  = ndev->stats.rx_errors;
+	stats->rx_dropped = ndev->stats.rx_dropped;
 	stats->tx_errors  = ndev->stats.tx_errors;
-	stats->tx_dropped = ndev->stats.tx_dropped +
-			    emac_get_stat_by_name(emac, "FW_RTU_PKT_DROP") +
-			    emac_get_stat_by_name(emac, "FW_TX_DROPPED_PACKET") +
-			    emac_get_stat_by_name(emac, "FW_TX_TS_DROPPED_PACKET") +
-			    emac_get_stat_by_name(emac, "FW_TX_JUMBO_FRM_CUTOFF");
+	stats->tx_dropped = ndev->stats.tx_dropped;
+
+	if (!emac->prueth->pa_stats)
+		return;
+
+	stats->rx_errors  +=
+			emac_get_stat_by_name(emac, "FW_RX_ERROR") +
+			emac_get_stat_by_name(emac, "FW_RX_EOF_SHORT_FRMERR") +
+			emac_get_stat_by_name(emac, "FW_RX_B0_DROP_EARLY_EOF") +
+			emac_get_stat_by_name(emac, "FW_RX_EXP_FRAG_Q_DROP") +
+			emac_get_stat_by_name(emac, "FW_RX_FIFO_OVERRUN");
+	stats->rx_dropped +=
+			emac_get_stat_by_name(emac, "FW_DROPPED_PKT") +
+			emac_get_stat_by_name(emac, "FW_INF_PORT_DISABLED") +
+			emac_get_stat_by_name(emac, "FW_INF_SAV") +
+			emac_get_stat_by_name(emac, "FW_INF_SA_DL") +
+			emac_get_stat_by_name(emac, "FW_INF_PORT_BLOCKED") +
+			emac_get_stat_by_name(emac, "FW_INF_DROP_TAGGED") +
+			emac_get_stat_by_name(emac, "FW_INF_DROP_PRIOTAGGED") +
+			emac_get_stat_by_name(emac, "FW_INF_DROP_NOTAG") +
+			emac_get_stat_by_name(emac, "FW_INF_DROP_NOTMEMBER");
+	stats->tx_dropped +=
+			emac_get_stat_by_name(emac, "FW_RTU_PKT_DROP") +
+			emac_get_stat_by_name(emac, "FW_TX_DROPPED_PACKET") +
+			emac_get_stat_by_name(emac, "FW_TX_TS_DROPPED_PACKET") +
+			emac_get_stat_by_name(emac, "FW_TX_JUMBO_FRM_CUTOFF");
 }
 EXPORT_SYMBOL_GPL(icssg_ndo_get_stats64);
 


Patches currently in stable-queue which might be from philippe.schenker@impulsing.ch are

queue-6.18/net-ethernet-ti-icssg-guard-pa-stat-lookups.patch


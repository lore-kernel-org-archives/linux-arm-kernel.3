Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD5F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 11:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=csAtD1Pk;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=dtqePmvo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wgRJiQVz8iSlUoLifug2XMB1d1PAGIF3uc3BCAEBSwQ=; b=csAtD1PkPuOkEusqlw1WMZ96sM
	LGt6IdttwW3MzQbSvXEBuJ9OP2JTQNZOccviwn6z/zRTNe7MjaiJXnExxm3yKFsrEu3T4KvIwebCw
	P0adtV+LqKPF16q0Nv3Iuzx3Nc8n/1eKJbZ9cfjgxanyhY5S29yNulbQYN3FvQO99Kz9VIwyOsI1y
	r5b29P8EOMmMkzpl2GgIQewiH51rLvANUrI4tN0g2AKcylweoV3naM2XYXlmR3xyYrj8qApVgd6e6
	z7+4MNVpm5yNbOhloKOiyjif11HfCzR73VV96HuJw3OSRELHfzhp/iZhOdQuYo3kG3cT5Pcw6NDWV
	1vBbaCvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMOcL-000000095F5-0q4W;
	Thu, 29 Oct 2026 11:48:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMOcI-000000095Ed-1Kf0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 11:48:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1793274503; x=1824810503;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=NrWs0H/8FTS4htfLqAWNH4tb30RFLulr7f3QGcQV3Mc=;
  b=dtqePmvosfTkfQnc9Af1YR+SDUdmK5kzsjAwOzfI03PG9P97ZuiluOYZ
   8LLgNzWXR0/bsnz8JBSYSqKAL6aYKLkS25H0SiDlxP7I83ft90P8BJYZ1
   RRB+GJN8J8fZodaQ3d55JB2mTyxS2vgVrPS2k4/aPmcmTeoXqHEFHLGrc
   lOz5X5zXMNXD/lzfcMi8GEzZ4SD9jkum4AmOIxMTLh9w4qsC+eTo5a15A
   UrV5gjbFsFxgEcVdFT2ut1DC3gM9mvm6YHek0xo7J94owQyO3+PjmI4Jl
   0eZWoMDEB2Jf/QguSEBHZR1GCrQ31G7Fvjl5pywTwlwNJ+gAV95lf4geH
   w==;
X-CSE-ConnectionGUID: bmYkYbLbQBaaX2C6L6Wqqg==
X-CSE-MsgGUID: xWvmY8vNSz67/E9Yt9TTDg==
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="297149642"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Oct 2026 04:48:21 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 29 Oct 2026 04:48:19 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 29 Oct 2026 04:48:17 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 29 Oct 2026 12:48:10 +0100
Subject: [PATCH net] net: sparx5/lan969x: release the in-flight slot of a
 stale TX skb
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261029-sparx5-ptp-stale-tx-slot-v1-1-ec15f391bbb7@microchip.com>
X-B4-Tracking: v=1; b=H4sIAHky42oC/x3MwQqDMAyA4VeRnBeogVq2Vxk71DVqQGppwiiI7
 27Z8Tv8/wnKVVjhNZxQ+ScqR+4YHwN8t5hXRkndQI6m0ZFDLbE2j8UKqsWd0Rrqfhiyp2cIc0p
 pJuh5qbxI+6/fkNngc103jkfSgW8AAAA=
X-Change-ID: 20261020-sparx5-ptp-stale-tx-slot-e52977bdddb2
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Richard
 Cochran" <richardcochran@gmail.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_044822_369586_C48AD7B2 
X-CRM114-Status: GOOD (  17.32  )
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

sparx5_ptp_txtstamp_request() counts every two step TX skb waiting for
its timestamp in sparx5->ptp_skbs, and refuses new ones once
SPARX5_MAX_PTP_ID are in flight. sparx5_ptp_txtstamp_old_release()
frees the skbs that have waited longer than SPARX5_PTP_TIMEOUT.

Before this patch, old_release() does not decrement ptp_skbs, so every
skb whose timestamp never arrives, for example because the switch
discarded the frame, keeps its slot forever. Once SPARX5_MAX_PTP_ID
slots are lost, two step frames fail to transmit on every port of the
switch.

Return the number of released skbs from old_release() and subtract it
from ptp_skbs in txtstamp_request(), under the ptp_ts_id_lock it already
takes.

This fixes the accounting only. A port's stale skbs are still aged out
only when that port sends a two step frame, so a port that stops sending
them keeps its stale skbs, and their slots, until it sends one again.
That behaviour is unchanged by this patch.

Found by an AI code review agent. Reproduced on a lan9696 board with a
modified kernel that drops the TX timestamps of two step frames, after
which two step timestamping stopped working on the port. With the fix,
timestamping keeps working on that board and on a sparx5 PCB135 board.

Fixes: 70dfe25cd866 ("net: sparx5: Update extraction/injection for timestamping")
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c b/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
index 2826e48af1033..9f61692b243b7 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
@@ -204,9 +204,10 @@ static void sparx5_ptp_classify(struct sparx5_port *port, struct sk_buff *skb,
 	*rew_op = IFH_REW_OP_TWO_STEP_PTP;
 }
 
-static void sparx5_ptp_txtstamp_old_release(struct sparx5_port *port)
+static unsigned int sparx5_ptp_txtstamp_old_release(struct sparx5_port *port)
 {
 	struct sk_buff *skb, *skb_tmp;
+	unsigned int purged = 0;
 	unsigned long flags;
 
 	spin_lock_irqsave(&port->tx_skbs.lock, flags);
@@ -217,8 +218,11 @@ static void sparx5_ptp_txtstamp_old_release(struct sparx5_port *port)
 
 		__skb_unlink(skb, &port->tx_skbs);
 		dev_kfree_skb_any(skb);
+		purged++;
 	}
 	spin_unlock_irqrestore(&port->tx_skbs.lock, flags);
+
+	return purged;
 }
 
 int sparx5_ptp_txtstamp_request(struct sparx5_port *port,
@@ -226,6 +230,7 @@ int sparx5_ptp_txtstamp_request(struct sparx5_port *port,
 {
 	struct sparx5 *sparx5 = port->sparx5;
 	u8 rew_op, pdu_type, pdu_w16_offset;
+	unsigned int purged;
 	unsigned long flags;
 
 	sparx5_ptp_classify(port, skb, &rew_op, &pdu_type, &pdu_w16_offset);
@@ -236,9 +241,10 @@ int sparx5_ptp_txtstamp_request(struct sparx5_port *port,
 	if (rew_op != IFH_REW_OP_TWO_STEP_PTP)
 		return 0;
 
-	sparx5_ptp_txtstamp_old_release(port);
+	purged = sparx5_ptp_txtstamp_old_release(port);
 
 	spin_lock_irqsave(&sparx5->ptp_ts_id_lock, flags);
+	sparx5->ptp_skbs -= purged;
 	if (sparx5->ptp_skbs == SPARX5_MAX_PTP_ID) {
 		spin_unlock_irqrestore(&sparx5->ptp_ts_id_lock, flags);
 		return -EBUSY;

---
base-commit: 829a09df899dcce860dcf5f70e09c1b2d7d425ab
change-id: 20261020-sparx5-ptp-stale-tx-slot-e52977bdddb2

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>



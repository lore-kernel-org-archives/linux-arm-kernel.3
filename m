Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FCDCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 17:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JOBVDpQhcALaIzkC77Wo3szremCm3YfuK4sl2yMWQVE=; b=3XjLnk7Egbm2g7EHzbA3Mxrmde
	+Tx2qZ/bCtOj1mBzOil7vSGTJNPE5HyBgEytcEIMAcWNd5Z/2/2iTOw1HK4XqapcetqD9/cG5o3+C
	yz7IvoJPWvzCTMHyAajaqxVuVX7goqINqisM0N2ew4tx2B5b62htB0vSsysKnUWQs7dn9mmuGaxiV
	ZKe5iSpFadK6h2e2cnhIzmJ3t5LiIFichG12+QvDmWp2BV0gIdZcF9BYuwHG1n+x5F8BgA0wJVW7r
	tWZXb32ts3uos76zeJfx+PMllXuY3j9o1kHUj6kl0r4/dNxCcVGXGgvIwdrMEPu/tz8ltR8k6rhaO
	HyLk52wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Goi-0000000947T-3zPI;
	Fri, 10 Oct 2025 17:22:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Goh-0000000946d-2uvV;
	Fri, 10 Oct 2025 17:22:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=JOBVDpQhcALaIzkC77Wo3szremCm3YfuK4sl2yMWQVE=; b=gcEYe2chk4WcNBuNVsfNSf6vrD
	KlY+YkS9kM4QUDtm49MRAIEIWir3HqrKkRNkoP9UjCvmZ6KND4h9mY87zTy6++nILjlMtWOBvxVQj
	DQO7wei6+DDniE9x1WVvAO4KDBXT49Q48pm7jmfWj6pNcaCOAV4gIiFBBE1xW6g+nCRqT6IKi3QkQ
	/kKhYe2r9ntO5iiRJ8OQaJrL+lsq3gkYFi5ZLzVLslkZBbssTMXr9gza223kLdUFkoFLXMZqf8Lhl
	9vHjLo+trtBS+JyZItXbxhofpex6omaL/cr9YzLOjTQsZOS5xwo0M4JaLyfkhSyj3HbDjGgSiiwk9
	A4v4jsbA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Goe-00000002KlC-2eFl;
	Fri, 10 Oct 2025 17:22:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B52C745168;
	Fri, 10 Oct 2025 17:22:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12CD9C4CEF1;
	Fri, 10 Oct 2025 17:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760116920;
	bh=OdBoAtR499cMXnZcUh2ZuDSK7qu4WgMS/ZlAlocCV9M=;
	h=From:Date:Subject:To:Cc:From;
	b=KNXM0Tqj/WkRTA3AroCpsxgUjpqtpfh416eJ3+YwL4J8LbJsCdDe8heXIDVMJpukH
	 lOqnXRhhuyZ0Jc4fY+sPbDmzc06CbKqJuSibwPFb+gY5sXyl2aV40SwhWe3cv6pUrI
	 7+I3KVWlifs27uJeIMevpHAB8EkNAO7+bRoRMpy7aEJI0Thif/RhW/jAZaUPbCAHHr
	 Y3/MYMe40cSuqEv8s4P20TBjH8I2N62P1Ief4gmajt6P3YZJzkOTKvdfbE4XDDU9Aj
	 F+bO4i1F8tx1ZnRiXt2F6ddMagVPgAd/8APm+eEaSXgX0Cn6EpLNk/PbGEj0juW1I/
	 PpdcPgkRbMHqg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Fri, 10 Oct 2025 19:21:43 +0200
Subject: [PATCH net] net: airoha: Take into account out-of-order tx
 completions in airoha_dev_xmit()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-airoha-tx-busy-queue-v1-1-9e1af5d06104@kernel.org>
X-B4-Tracking: v=1; b=H4sIAKZA6WgC/x3MQQqDMBBG4avIrDuQUQriVYqLmPw2s0lqYooi3
 r2hy2/x3kUFWVFo6i7K+GrRFBvk0ZELNr7B6pupN/1TjBi2mlOwvB+81HLyVlHBi19FHNw4wFN
 LPxmrHv/tiyJ2mu/7BwJujplrAAAA
X-Change-ID: 20251010-airoha-tx-busy-queue-bdf11cec83ed
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_182204_999512_1C707374 
X-CRM114-Status: GOOD (  12.17  )
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

Completion napi can free out-of-order tx descriptors if hw QoS is
enabled and packets with different priority are queued to same DMA ring.
Take into account possible out-of-order reports checking if the tx queue
is full using circular buffer head/tail pointer instead of the number of
queued packets.

Fixes: 23020f0493270 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 833dd911980b3f698bd7e5f9fd9e2ce131dd5222..5e2ff52dba03a7323141fe9860fba52806279bd0 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1873,6 +1873,19 @@ static u32 airoha_get_dsa_tag(struct sk_buff *skb, struct net_device *dev)
 #endif
 }
 
+static bool airoha_dev_is_tx_busy(struct airoha_queue *q, u32 nr_frags)
+{
+	u16 index = (q->head + nr_frags) % q->ndesc;
+
+	/* completion napi can free out-of-order tx descriptors if hw QoS is
+	 * enabled and packets with different priorities are queued to the same
+	 * DMA ring. Take into account possible out-of-order reports checking
+	 * if the tx queue is full using circular buffer head/tail pointers
+	 * instead of the number of queued packets.
+	 */
+	return index >= q->tail && (q->head < q->tail || q->head > index);
+}
+
 static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 				   struct net_device *dev)
 {
@@ -1926,7 +1939,7 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 	txq = netdev_get_tx_queue(dev, qid);
 	nr_frags = 1 + skb_shinfo(skb)->nr_frags;
 
-	if (q->queued + nr_frags > q->ndesc) {
+	if (airoha_dev_is_tx_busy(q, nr_frags)) {
 		/* not enough space in the queue */
 		netif_tx_stop_queue(txq);
 		spin_unlock_bh(&q->lock);

---
base-commit: 18a7e218cfcdca6666e1f7356533e4c988780b57
change-id: 20251010-airoha-tx-busy-queue-bdf11cec83ed

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9306E606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 10:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h4mtOy9J;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=zFHic1Hg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HFVvyD1aHnlLu1dMDSGzg74kJ9XSDJgZ4PQQxQ1rwMM=; b=h4mtOy9Jwvr8jW2G7G550buzIS
	o/0/WOYpW6OctRTgyGQ63mbHLRlCXmMoAKVXReLMweN0GBBqyf09mC7aGp+cQYQUkvYoCAAaCx7/U
	UvxOd7H/lnSPoIc4B/GmW8TJLWD9Jv0JMlvbsL9lmqlxfH2mWx13lAR8elmyN0hZXo2lowcKGno6m
	j24Lx82rDv7+LxRiijgVmHhNmIVk8ZfGdJSCkeaGSKmuEsptQD8hxiBXpTSFtxUOrK0pcBJwZIxBp
	B72PfEnfGPyX5HxSnrgR7MPhMCQShpBOiDoBcD+n4ODRNj22j1D9HNm5lrQIPbPWjFhP75iQ4rtyJ
	21sgfK+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTsd-0000000BeLR-0S0u;
	Wed, 21 Oct 2026 10:49:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTsa-0000000BeKj-1XeU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 10:49:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1792579754; x=1824115754;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=Gj1oYLTBDiA87DUaik7BYJ9swhiu1prPvBcMftysvEE=;
  b=zFHic1HgX2kDdaUG0wrb6ZLBt/4EQg6NBfQx1LlWW9X8w5PQhjkZYkfY
   k8qcJTsBs+LpLGIwsqUaLM+kc+DA2TojVuRpH7eI+hO+9NK/rhhgXCmqO
   dWT7O9PkpHFsmsZuedvNd0gZZSdVFrgMkR0e3ZYN9aciuGBbEERPH99sx
   dvruSi6gQOVuWGsqOYOmwVU+SZYxvPteF8TZCvq1DpDzYD0roTLfeNbQW
   LXf7H5Bu7XFrkGcmfTamL060yRE2Pz3ukg/Q5eSztWuLM9LKROW927TaQ
   Gcb0fnYgqWcwHF8m0UKsjfd5P/iVQCzAfmNPbPbEdqz+r/J58PQU73tW4
   g==;
X-CSE-ConnectionGUID: Io7L0h0CT6WwngO0rpe36w==
X-CSE-MsgGUID: kTsDSRMPSsePhOScqVszTw==
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="75804722"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Oct 2026 03:49:13 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 21 Oct 2026 03:49:06 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 21 Oct 2026 03:49:04 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Wed, 21 Oct 2026 12:48:26 +0200
Subject: [PATCH] net: sparx5/lan969x: do not read past skb->len when
 injecting a frame
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261021-sparx5-inject-tail-bytes-v1-1-7dcc035c8ddf@microchip.com>
X-B4-Tracking: v=1; b=H4sIAHmY2GoC/x3MQQqAIBBA0avErBtQwYiuEi3MxpoIC0eiiO6et
 HyL/x8QSkwCXfVAopOF91ig6wr84uJMyFMxGGUarYxCOVy6LHJcyWfMjjcc70yC1Gofgrejaiy
 U/EgU+PrX/fC+H+mnxbFqAAAA
X-Change-ID: 20261020-sparx5-inject-tail-bytes-e81cffc5b065
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Bjarni
 Jonasson" <bjarni.jonasson@microchip.com>, Lars Povlsen
	<lars.povlsen@microchip.com>
CC: Steen Hegelund <steen.hegelund@microchip.com>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_034908_638577_B889724E 
X-CRM114-Status: GOOD (  15.49  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

sparx5_inject() writes the frame to the injection FIFO one 32-bit word
at a time, and pads frames shorter than 60 bytes with zero words.

Before this patch, the last word is loaded whole even when skb->len is
not a multiple of four, so 1 to 3 bytes past the end of the frame are
read. For a frame shorter than 60 bytes those bytes are also
transmitted, as VLD_BYTES marks the whole last word valid and the
padding starts at the next word.

Write the trailing bytes from a zeroed word. The number of words written
and VLD_BYTES are unchanged.

Found by an AI code review agent, and reproduced on lan969x and sparx5
with register injection: bytes 57 to 59 of a 57 byte frame were not
zero. With the fix they are zero, and traffic still passes on both
chips.

Fixes: f3cad2611a77 ("net: sparx5: add hostmode with phylink support")
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_packet.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c b/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c
index f713656f1fae..14c9ae673e35 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_packet.c
@@ -169,8 +169,8 @@ static int sparx5_inject(struct sparx5 *sparx5,
 			 struct sk_buff *skb,
 			 struct net_device *ndev)
 {
+	u32 val, w, count, last;
 	int grp = INJ_QUEUE;
-	u32 val, w, count;
 	u8 *buf;
 
 	val = spx5_rd(sparx5, QS_INJ_STATUS);
@@ -189,14 +189,23 @@ static int sparx5_inject(struct sparx5 *sparx5,
 	for (w = 0; w < IFH_LEN; w++)
 		spx5_wr(ifh[w], sparx5, QS_INJ_WR(grp));
 
-	/* Write words, round up */
-	count = DIV_ROUND_UP(skb->len, 4);
+	/* Write the whole words of the frame */
+	count = skb->len / 4;
 	buf = skb->data;
 	for (w = 0; w < count; w++, buf += 4) {
 		val = get_unaligned((const u32 *)buf);
 		spx5_wr(val, sparx5, QS_INJ_WR(grp));
 	}
 
+	/* Write the last 1 to 3 bytes, zero padded to a whole word */
+	last = skb->len % 4;
+	if (last) {
+		val = 0;
+		memcpy(&val, buf, last);
+		spx5_wr(val, sparx5, QS_INJ_WR(grp));
+		w++;
+	}
+
 	/* Add padding */
 	while (w < (60 / 4)) {
 		spx5_wr(0, sparx5, QS_INJ_WR(grp));

---
base-commit: d06ae66516e1aaf023808912af6292aef09d46c3
change-id: 20261020-sparx5-inject-tail-bytes-e81cffc5b065

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>



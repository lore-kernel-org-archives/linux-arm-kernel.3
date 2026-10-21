Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14069606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 14:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BWcJSw6q;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=LnDF2sZJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FrXrhGc84F0SEW6ngQZtjtWKdGiIcLodKB76mx9Tm3A=; b=BWcJSw6qGsvgPp4oH58eBZ4fpC
	RbhclUy82sdoNVSXGuCdMf6ORQjcA+d0wZGDkn7fXZlfMbVBiFrfDOb43k8BDSthAQVelNm7zbFuL
	15Yh38j6VyIPEpdQl2uoXx/Yr7uIFF2dkI0sYBLrSsDHY4PBQ3KoSo6Z6UHN1EbYp7UvCG18UE2uL
	3E9nL+GqCfbU7bpmvXPUW0kI43JJ4boqR2Sa8yvttOD1FhYbsTAPzscvJPkI6xMlYMsiEo03u8hPz
	o89OY1VJlC2RnVMpQXpuYxajCWMTl033VnyOkI9SR1YjK0S3BlzdBaO3LYMhpJ6gYuEoUho71hd4B
	fQTEZdQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWwN-0000000C2fJ-2wB1;
	Wed, 21 Oct 2026 14:05:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJWwK-0000000C2eW-2YUx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 14:05:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1792591518; x=1824127518;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=yW1XgpoWielDMW3UIfBB+wESIDB5LYWkKc7wBm5oMgY=;
  b=LnDF2sZJFDEQqQPIkMpFyGxjstKmffU5nqrJzNStEzSdJQCEaJ3JJUaU
   I10Dr1kQbfcARXpiNGntNRsWrSjbkhmO/NJ72DXojw6aO1ePl5gHTpT+H
   Jq/6DXURLG1qKjlzov8UnZ6OBkA8xNYcjwB1DIALwzV/JaM1SJam7VXai
   N+odYh0aa7fA8+iGPjrCM3GYbxuqCjnlRt0i5GFnAlOzOu2O88xVGB6oU
   kYAOFhxXtkGQNMR5hkZpQxVG1pk+rE5yDapYPaUzh06g3CGANHcrHWZGU
   Nal5xirHZqqwReo6VO/2ihLeon+XRBXldgun2qMNKeQpMSpZaHlv4NvAS
   A==;
X-CSE-ConnectionGUID: u22Z2VIBR/KVsPTy3Nax2Q==
X-CSE-MsgGUID: oZgFHj/kSEKlmX0aTh2m5A==
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="75812527"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Oct 2026 07:05:17 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 21 Oct 2026 07:05:11 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 21 Oct 2026 07:05:09 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Wed, 21 Oct 2026 16:04:59 +0200
Subject: [PATCH net v2] net: sparx5: fix tx DCB index drift in fdma xmit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261021-sparx5-fdma-last-dcb-v2-1-7b8fabdb9239@microchip.com>
X-B4-Tracking: v=1; b=H4sIAIrG2GoC/22NwQqDMBBEf0X23C1uqKnpyf8oHmKy1oVqJBGxi
 P/eYK89vhnmzQ6Jo3CCR7FD5FWShCmDuhTgBju9GMVnBlUqTSUZTLONW4W9Hy2+bVrQuw5ZcX0
 z1N19rSFP58i9bKf2CRMv0OZwkLSE+DmvVjqrn1WV/60rIWHfGWsqTUZ734ziYnCDzFcXRmiP4
 /gCgxSEp8EAAAA=
X-Change-ID: 20261019-sparx5-fdma-last-dcb-e2e8491b7d86
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>,
	=?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_070512_950246_99EA7E1D 
X-CRM114-Status: GOOD (  15.59  )
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

sparx5_fdma_xmit() advances dcb_index before checking that the FDMA is
done with the DCB, and does not undo the advance when the check fails.
Before commit f4aa7e361ae2 ("net: sparx5: use FDMA library for adding
DCB's in the tx path") the next DCB was always the one after last_dcb.
Since then dcb_index drifts one DCB further away from last_dcb on every
failed transmit.

While the ring is full, this drops frames even though completed DCBs
sit behind dcb_index. After a run of failures, dcb_index can also land
on last_dcb itself. Re-adding last_dcb loses the frame, because the
FDMA has already passed the tail of the chain, and that DCB is never
completed again.

Fix this by making dcb_index the next DCB to use, and advancing it only
after the DCB has been added, as the rx path does. dcb_index and
last_dcb now only move together, so dcb_index always points at the DCB
after last_dcb.

The issue was found by an AI code review agent. It was reproduced on a
sparx5 PCB135 board with a modified kernel that forces 63 consecutive
transmit failures. Afterwards, about 1 in 64 frames is lost for good.
With the fix, the same test loses no frames.

Fixes: f4aa7e361ae2 ("net: sparx5: use FDMA library for adding DCB's in the tx path")
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
Changes in v2:
- Advance dcb_index only after the DCB has been added, instead of
  rejecting last_dcb. This fixes the drift itself (AI review).
- Reword the subject and commit message to match.
- Link to v1: https://lore.kernel.org/r/20261020-sparx5-fdma-last-dcb-v1-1-fb9a956196dd@microchip.com
---
 drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
index dbe86f937b21..15ec9b053824 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
@@ -217,7 +217,6 @@ int sparx5_fdma_xmit(struct sparx5 *sparx5, u32 *ifh, struct sk_buff *skb,
 	struct fdma *fdma = &tx->fdma;
 	void *virt_addr;
 
-	fdma_dcb_advance(fdma);
 	if (!fdma_db_is_done(fdma_db_get(fdma, fdma->dcb_index, 0)))
 		return -EINVAL;
 
@@ -235,6 +234,8 @@ int sparx5_fdma_xmit(struct sparx5 *sparx5, u32 *ifh, struct sk_buff *skb,
 		     FDMA_DCB_STATUS_BLOCKO(0) |
 		     FDMA_DCB_STATUS_BLOCKL(skb->len + IFH_LEN * 4 + 4));
 
+	fdma_dcb_advance(fdma);
+
 	sparx5_fdma_reload(sparx5, fdma);
 
 	return NETDEV_TX_OK;

---
base-commit: 07bd391eb9572e74f073c49acef327611234f9bb
change-id: 20261019-sparx5-fdma-last-dcb-e2e8491b7d86

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>



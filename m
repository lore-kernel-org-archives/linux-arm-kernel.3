Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F04606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 13:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c7zFSers;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=rCRpc4N3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=CMDpq3SX25eoltOh6fRlQWDgSOu/p9POGr2uOh69ti4=; b=c7zFSersOtKnuLZ3c6lE37TQu1
	lBM7j6lNOkxBsNpLaDIFIUk5cUW28rgrtVa9tVlpphHMKuLxOyxdySqbseuT+pRApVJS8TJ5aVLVA
	H3IKsOHurqWsUuN+82OFDPp49KTHScAbisCq7CpAEnZ9sEeWlO93CLy080MsH2Nt6fzuwHtNySPBt
	RiASYn+BYGRdzgbI0b/xcnRq20Frb/mhIQo6Xki1REMOyBNYHwLH4pqoVqFyZlSS2wGZENpHLHIZ3
	Vaf64tjWbwia7GYG7OViMV5iQf1kBRUKEHa0GepAjfaCQYWTILskpkl2kxLbcX6NceGUfmSnufxZ+
	7luJ6nuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLL2i-00000002dOg-2Hp0;
	Mon, 26 Oct 2026 13:47:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLL2e-00000002dO5-2Vml
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 13:47:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1793022432; x=1824558432;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=FZSsuCVIS62A5Iur16KkQlWqBTNAz42t+vGvyVs+4/g=;
  b=rCRpc4N3Cy7F6zoBe5sJNI/SqAPzF9UR8x2mZ7gSwXKO5GLAFIWxj/fn
   /FwrnaZrxbXGk/csNR9dehtvBwAf7B+vw3eWAYGDC/QtGSz0tlsSFM+TB
   40zIrw7yXI9Arhe3GlqdQ0iI1xr4UxX3I9ZV5oxuSgScLLpCqmWxjgeYD
   LpdEc3uegNpqv44+RN3P2ljM/N1VOVyQZ+8NdkTm9lmtwRz4RjyhtbMaB
   2e9NYAezLMPiaKh5HsHariLqYvaJKuL/LzxPKUR1ZEg11kSnD2t8MfOV3
   9+J2JAC27CPeUjU1DHCzCbvK6EOCwnjdN8cKeHcARBLwdN/GD9N9n+Lq1
   A==;
X-CSE-ConnectionGUID: R18wWG9GScO7v44QD2uZqQ==
X-CSE-MsgGUID: 05SZEdVXT8GhKjkO5jeCGQ==
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="76044859"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Oct 2026 06:47:11 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 26 Oct 2026 06:47:10 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 26 Oct 2026 06:47:08 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 26 Oct 2026 14:47:05 +0100
Subject: [PATCH net] net: microchip: fdma: fix DCB corruption under
 sustained load
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261026-microchip-fdma-dcb-corruption-v1-1-36dab6caca07@microchip.com>
X-B4-Tracking: v=1; b=H4sIANhZ32oC/x2MQQqEMAwAvyI5G7BFBPcryx5smq452JbUFUH8u
 2EPc5jDzAWNVbjBq7tA+ZAmJZu4vgNal/xllGgOfvCTM3AT0kKrVExxWzBSQCqqv7pbiVNI4+D
 DPAfnwR5VOcn5/78h8w6f+34AthLrJHQAAAA=
X-Change-ID: 20261026-microchip-fdma-dcb-corruption-6bf402b99b12
To: Steen Hegelund <Steen.Hegelund@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
CC: <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_064712_878400_5F55AB58 
X-CRM114-Status: GOOD (  16.68  )
X-Spam-Score: -4.7 (----)
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

__fdma_dcb_add() prepares a DCB and links it into a channel's chain by
writing its address to the NEXT_PTR of the current last DCB. The FDMA
may be processing the chain while this happens.

Before this patch, the link is written before the new DCB's own nextptr
and info fields, so the FDMA can follow it to a DCB that hasn't been fully
prepared yet. Under sustained load this stalls the FDMA.

Prepare the new DCB fully before linking it, and update the previous
DCB's NEXT_PTR using the two-step sequence from the datasheet (poison
the LSB and flush, then clear it) so the FDMA never observes a
partially-updated pointer.

Reported by a customer running iperf3 --bidir against a lan969x board.

Reproduced on lan969x with iperf3, throughput collapsing to zero:

  [  5]   1.00-2.00   sec  73.9 MBytes   620 Mbits/sec    0    305 KBytes
  [  5]   2.00-3.00   sec  73.9 MBytes   620 Mbits/sec    0    305 KBytes
  [  5]   3.00-4.00   sec  13.9 MBytes   116 Mbits/sec    2   1.41 KBytes
  [  5]   4.00-5.00   sec  0.00 Bytes  0.00 bits/sec    1   1.41 KBytes
  [  5]   5.00-6.00   sec  0.00 Bytes  0.00 bits/sec    0   1.41 KBytes
  [  5]   6.00-7.00   sec  0.00 Bytes  0.00 bits/sec    1   1.41 KBytes

The race is timing-dependent: across three reproductions the stall
appeared anywhere from ~400s to ~3000s into the run.

Fixes: 30e48a75df9c ("net: microchip: add FDMA library")
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/fdma/fdma_api.c | 30 ++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/microchip/fdma/fdma_api.c b/drivers/net/ethernet/microchip/fdma/fdma_api.c
index f7a42348e932c..fed41da550c59 100644
--- a/drivers/net/ethernet/microchip/fdma/fdma_api.c
+++ b/drivers/net/ethernet/microchip/fdma/fdma_api.c
@@ -43,9 +43,19 @@ int __fdma_dcb_add(struct fdma *fdma, int dcb_idx, u64 info, u64 status,
 				u64 *dataptr))
 {
 	struct fdma_dcb *dcb = fdma_dcb_get(fdma, dcb_idx);
+	struct fdma_dcb *prev = fdma->last_dcb;
 	u64 nextptr;
 	int i, err;
 
+	/* Per the FDMA datasheet, adding a DCB to an active channel takes
+	 * three steps:
+	 * 1) Write NEXT_PTR of the current last DCB with the LSB forced to
+	 *    FDMA_DCB_INVALID_DATA, and flush that write.
+	 * 2) Clear the LSB to complete the link.
+	 * 3) Reload the channel (FDMA_CH_RELOAD); this is done by the caller
+	 *    once the chain has been extended.
+	 */
+
 	for (i = 0; i < fdma->n_dbs; i++) {
 		err = __fdma_db_add(fdma, dcb_idx, i, status, db_cb);
 		if (unlikely(err))
@@ -56,13 +66,25 @@ int __fdma_dcb_add(struct fdma *fdma, int dcb_idx, u64 info, u64 status,
 	if (unlikely(err))
 		return err;
 
-	fdma->last_dcb->nextptr = cpu_to_le64(nextptr);
-
-	fdma->last_dcb = dcb;
-
 	dcb->nextptr = cpu_to_le64(FDMA_DCB_INVALID_DATA);
 	dcb->info = cpu_to_le64(info);
 
+	/* On the first DCB of fdma_dcbs_init() prev is the DCB itself;
+	 * don't link it to itself.
+	 */
+	if (prev != dcb) {
+		/* Write NEXT_PTR of the current last DCB with the LSB forced
+		 * to FDMA_DCB_INVALID_DATA, and flush that write.
+		 */
+		prev->nextptr = cpu_to_le64(nextptr | FDMA_DCB_INVALID_DATA);
+		dma_wmb();
+
+		/* Clear the LSB to complete the link. */
+		prev->nextptr = cpu_to_le64(nextptr);
+	}
+
+	fdma->last_dcb = dcb;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(__fdma_dcb_add);

---
base-commit: 6430fb7f1cc4e329e386521b7b208df443de92f2
change-id: 20261026-microchip-fdma-dcb-corruption-6bf402b99b12

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>



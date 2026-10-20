Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC59606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 08:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tFAUnrkR;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=db1Q3yN4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/3Wq3q5zJibO+/ypQKvyVSj+5oRUgcCIqCtsRgxRLW0=; b=tFAUnrkRSwXqBnYJtUzjfQMbin
	EArLqcPUitjsHhduR/qRBs9Cg6Zl5CQkNIG+HaY4dYFTTIiF5PU4AVQp9ZggsmO9ONhPeF81ygV/o
	MkKQCpfH5uDojIxCVo0DjYt5PtrupmAE4Pn9IPzB2RiP7C7i/f1Db0kNJF0z0raBA3l4Fl0jLZ6g/
	UcrJ2BOaDXqSJiR7T+2y9LSAwSiiQYP4+rRV7ZULrjO/izvFvbbzVH/uKx7E9Uh4+tjRpSrBOuH5c
	UTcny05EvEUjdyJ8lr5LJyuxTtPlB3BHxPzeE4IfCMtDTNJAxjyhv56GrRPd1NHkkfnK7CqvYJbD5
	rQtlX9+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5h7-00000009Fd2-3kJB;
	Tue, 20 Oct 2026 08:59:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5h4-00000009Fc6-3E0r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 08:59:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1792486778; x=1824022778;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=PqqolydTHxuVAc5gOeVz22tU0KJ0OwLnMV9tvA+bGuU=;
  b=db1Q3yN4b+9HIq9mjFjQ/d/XJGUdxrOtlznbX7p3bI1d39TImZVsoW25
   l4jSD+aMBO0PBTaREZOwjX747YVaKdMWG3H7LP/7WjUfTWHD02JQ/sBfC
   JSLKbWuRT/PcD5JJI5/khgIn0LZnGBQM3ecOS3Q++xiXM/DAHISukTE19
   3432rYl+MzRSiSwQ+5d/zCucTC68y2dCQIBTKc2DlruvI3yyXs9/L2H9s
   hfT4ICUJSb/30jOHbYE1/9z7ztVR7GjNO2PUJQ/pkzsv49A8Vhm29MkxT
   LT4fDkFyYxBAxFQiLOiRNlVGx3q5Jfh8xC8FV3OCrOmaFOCczcUGiAvNH
   g==;
X-CSE-ConnectionGUID: mf+Nmy+dQleBqoTYdmd+ZQ==
X-CSE-MsgGUID: XdUIh4SQQRK1L1Hc3PtmAw==
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="232382489"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 01:59:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Tue, 20 Oct 2026 01:59:37 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 20 Oct 2026 01:59:35 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Tue, 20 Oct 2026 10:59:32 +0200
Subject: [PATCH net] net: sparx5: don't reuse the last DCB in fdma xmit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261020-sparx5-fdma-last-dcb-v1-1-fb9a956196dd@microchip.com>
X-B4-Tracking: v=1; b=H4sIAHMt12oC/x3MSwqAMAwA0atI1gZs0fq5irioNmpAqzQiQvHuF
 pdvMRNBKDAJdFmEQDcLHz5B5RlMq/ULIbtk0IU2qlAtymnDU+HsdoublQvdNCJpaspWjbVrDKT
 0DDTz82978HTB8L4fdiu4cWsAAAA=
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
X-CRM114-CacheID: sfid-20261020_015938_842979_52BCD9C6 
X-CRM114-Status: GOOD (  14.14  )
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

sparx5_fdma_xmit() advances dcb_index to the next tx DCB and, if the
FDMA is done with it, adds it to the end of the chain, which makes it
the new fdma->last_dcb.

Before this patch, sparx5_fdma_xmit() can pick last_dcb itself. A
failed transmit advances dcb_index without adding a DCB, so dcb_index
no longer follows last_dcb, and after a burst of failures it can land
on it. Re-adding last_dcb loses the frame, because the FDMA has already
passed the tail of the chain.

Also reject the DCB when it is the last one in the chain, using the
same !fdma_is_last() guard that lan966x and lan969x use to pick their
next tx DCB, so the tail is never re-added.

Found by an AI code review agent and confirmed by code inspection; not
reproduced. Tested on sparx5 that traffic still passes, with ping floods
in both directions.

Fixes: f4aa7e361ae2 ("net: sparx5: use FDMA library for adding DCB's in the tx path")
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
index dbe86f937b21..221b2f1932f6 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_fdma.c
@@ -218,7 +218,8 @@ int sparx5_fdma_xmit(struct sparx5 *sparx5, u32 *ifh, struct sk_buff *skb,
 	void *virt_addr;
 
 	fdma_dcb_advance(fdma);
-	if (!fdma_db_is_done(fdma_db_get(fdma, fdma->dcb_index, 0)))
+	if (!fdma_db_is_done(fdma_db_get(fdma, fdma->dcb_index, 0)) ||
+	    fdma_is_last(fdma, fdma_dcb_next_get(fdma)))
 		return -EINVAL;
 
 	/* Get the virtual address of the dataptr for the next DB */

---
base-commit: 07bd391eb9572e74f073c49acef327611234f9bb
change-id: 20261019-sparx5-fdma-last-dcb-e2e8491b7d86

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>



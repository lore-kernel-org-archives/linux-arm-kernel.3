Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED0A606A335
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 12:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4L/ctHhp;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=F6YE22RR;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=E1vDLF87
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KyxfxjW/8VDPKJgBAnzu1y19pEFt/f6bAY6Eie7zFQ8=; b=4L/ctHhpyqU62r
	qKgPGAhhaoiqgmtNCdFHP/Dq05Bd2FuobM3i+PEGvf/Z1NMq/hF1CvbJZ/u2uLZCBVupyxK5ks6em
	QTXnPQ+utCeyQo/TpfG0NrKbE3pFEXkfCSmmViH4TDEpJJ2/K4OsNJ4w0uSjdsdL8GbS5AV37P07/
	tLIRdfaOT9Lv8gvVhTLgE8V20Cakzh9XpdRaGHHD0iiWl1uJD6W2HVZXf1GiB+y7IgleVl/g4jjjM
	ozDparJTJU055OPIynA3pA9omMEyRFLSwY3r3//fi5XGNMn/63lWVOM1CRclitZAY+F7IeFVliTzV
	zwe/wNucA5iHQLQ2g/eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNr2q-0000000GSek-1g0e;
	Mon, 02 Nov 2026 12:21:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNr2o-0000000GSa5-0q2H
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Nov 2026 12:21:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=KyxfxjW/8VDPKJgBAnzu1y19pEFt/f6bAY6Eie7zFQ8=; b=F6YE22RRcSk61AJku0nNKneO0x
	KpQDIwvaHmtOuKM9kXx2kHwVu9maz09kcu+lJWr8EpKMv+DVx8h8ecd++kJgStHSbp14Qaua+sEt8
	LTdgS+amxYWxIysyifOR+scjwQXuJBQn+CIt6p/Kkxjhnhd9KMpiiwj+q8VEKPVljTZM34KWi/Zqa
	QlP5kREo8CgtNPz3VHXJXMaR4qy13POpbLbC3JC+HpJpAiz3dA89imC95gL6wi2fY8l2xhmLAVNHD
	PedeKwblYHxUh/afCwIk1YfGpmB1Y2SUvfSVXIo5F8IO3SF76WSu2YN0lVmzmSSIbQrxXD1IQp9qq
	XWA7MieA==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNr2i-00000002UfF-2215
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 12:21:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1793622100; x=1825158100;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=jbs1hV8RpQNtB6iGB5BNnN+jReoKu4QeubwuJTVpu4I=;
  b=E1vDLF87+BcQH/mJxJREfCEhuv2mQpfOBEiFziEcKI5VNcRQRshUaYST
   DrIsGWV7WZdVH2e6qWhj2X1ehxCuGf7GMPumX9nUpwxVHJiizX4/uyG4p
   aPfpCGc3P62jOhWyn6AT9ibvZZd9uVwqoBR1lvQ7KZle6sulcEuuJ3C0B
   GP+y1PKwE6nfI56/XTVErNw6OxuRa+JLmwrCpzcWxKxzDvADguemt/9SX
   2bcauhFo3+jPV3e2jXlHbyGYX2yYyLYsWa8qCd7XVe8+Y6AiaXQua6X0f
   biKZNl+E2/WS8U4tVTkrrsAvQ4wyWxd9WCT5362e8yUJJ10Pml0Fw+KCb
   w==;
X-CSE-ConnectionGUID: bffwQnA3Rnmq0lQzbNJzTA==
X-CSE-MsgGUID: t5yxBdrDRm+gUiLSnXkC3Q==
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="232950949"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Nov 2026 05:21:34 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 2 Nov 2026 05:21:33 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 2 Nov 2026 05:21:31 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 2 Nov 2026 13:21:24 +0100
Subject: [PATCH net-next v2 1/5] net: sparx5: Drop redundant POL_ prefix
 from POL_UPD_INT_CFG
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261102-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v2-1-3bd47ec1b227@microchip.com>
References: <20261102-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v2-0-3bd47ec1b227@microchip.com>
In-Reply-To: <20261102-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v2-0-3bd47ec1b227@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>
CC: <robert.marko@sartura.hr>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_122143_053210_037C8A8D 
X-CRM114-Status: GOOD (  12.47  )
X-Spam-Score: -2.5 (--)
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

The macros for the ANA_AC_POL:POL_UPD_INT_CFG register are named
ANA_AC_POL_POL_UPD_INT_CFG*, repeating the POL_ prefix that is already
part of the target name.

Rename them to ANA_AC_POL_UPD_INT_CFG*, so that the port policer
registers added in the next patch can use the same short form.

No functional change.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_main.c      |  6 +++---
 drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index e039f5369b95e..68c80c63f9087 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -616,10 +616,10 @@ static int sparx5_init_coreclock(struct sparx5 *sparx5)
 		 sparx5,
 		 HSCH_TAS_STATEMACHINE_CFG);
 
-	spx5_rmw(ANA_AC_POL_POL_UPD_INT_CFG_POL_UPD_INT_SET(pol_upd_int),
-		 ANA_AC_POL_POL_UPD_INT_CFG_POL_UPD_INT,
+	spx5_rmw(ANA_AC_POL_UPD_INT_CFG_POL_UPD_INT_SET(pol_upd_int),
+		 ANA_AC_POL_UPD_INT_CFG_POL_UPD_INT,
 		 sparx5,
-		 ANA_AC_POL_POL_UPD_INT_CFG);
+		 ANA_AC_POL_UPD_INT_CFG);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
index 1464fd1a1d447..219c7f0e516e9 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main_regs.h
@@ -939,15 +939,15 @@ extern const struct sparx5_regs *regs;
 	FIELD_GET(ANA_ACL_SEC_LOOKUP_STICKY_SEC_TYPE_MAC_ETYPE_STICKY, x)
 
 /* ANA_AC_POL:POL_ALL_CFG:POL_UPD_INT_CFG */
-#define ANA_AC_POL_POL_UPD_INT_CFG                                             \
+#define ANA_AC_POL_UPD_INT_CFG                                                 \
 	__REG(TARGET_ANA_AC_POL, 0, 1, regs->gaddr[GA_ANA_AC_POL_POL_ALL_CFG], \
 	      0, 1, 1160, 1148, 0, 1, 4)
 
-#define ANA_AC_POL_POL_UPD_INT_CFG_POL_UPD_INT   GENMASK(9, 0)
-#define ANA_AC_POL_POL_UPD_INT_CFG_POL_UPD_INT_SET(x)\
-	FIELD_PREP(ANA_AC_POL_POL_UPD_INT_CFG_POL_UPD_INT, x)
-#define ANA_AC_POL_POL_UPD_INT_CFG_POL_UPD_INT_GET(x)\
-	FIELD_GET(ANA_AC_POL_POL_UPD_INT_CFG_POL_UPD_INT, x)
+#define ANA_AC_POL_UPD_INT_CFG_POL_UPD_INT       GENMASK(9, 0)
+#define ANA_AC_POL_UPD_INT_CFG_POL_UPD_INT_SET(x)\
+	FIELD_PREP(ANA_AC_POL_UPD_INT_CFG_POL_UPD_INT, x)
+#define ANA_AC_POL_UPD_INT_CFG_POL_UPD_INT_GET(x)\
+	FIELD_GET(ANA_AC_POL_UPD_INT_CFG_POL_UPD_INT, x)
 
 /* ANA_AC_POL:COMMON_BDLB:DLB_CTRL */
 #define ANA_AC_POL_BDLB_DLB_CTRL                                               \

-- 
2.34.1



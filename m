Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48316606D81E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RB6zZfOj;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=JuJF7pdg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KyxfxjW/8VDPKJgBAnzu1y19pEFt/f6bAY6Eie7zFQ8=; b=RB6zZfOjXjJxPK
	S2uoDLfD5pibE9+oQKdm12ml3Tz2nFi+YaZmIv94FcxP0N3i9KtsZEHh7VC4u28YavwAnIoGo8PcV
	EA625mBOAikMVTPtT/M31qrLjopQ0Rs6pjCZwbgpMpiL3cIVwDM/VwyDO6dRnrHQ2hQWZhJXampZE
	Skecc8Tig7c5RHtUAbfTynGICPMfUgjxMwaEIX4UIGp5bHj4u9vLiiVTyW19K1qUAf0EOpedzDQAB
	iSogyvWkvwPMi8MG0aF734TriqFICFhtjDej4q7DZhaGp69nXQ6dKb9IAvlpqJpKsR4PjyIIMWX0m
	zLJkHiJioxh50Ef32ExA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxNi-000000095xY-0l9I;
	Thu, 05 Nov 2026 13:19:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxNe-000000095wP-3nKK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 13:19:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1793884797; x=1825420797;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=jbs1hV8RpQNtB6iGB5BNnN+jReoKu4QeubwuJTVpu4I=;
  b=JuJF7pdguGYQ7E6DLyw9J9/zBnvZnvT53cZG04QFQ2OJSSXd1/YOYQmJ
   V/T8sVmFllUYdlN/Ko7Hl1aW4MlrqYJxWgg0D17L3Gx3htyVRxFNfPTGe
   hQudwrYKCIrsN9VTNDblKbrgOc7pOtJU9u+UONyXOWwcJzrFCQocdIRmB
   JtjDMgVvyRjuJgSq3KrmF4g+2i9tm4n2FygefxfpDYtdBYiBzBfPflvXL
   bnucQFyCGCsbB0ELUT2jsVFqsCGfTyOgwacXqajT6KxNUFrNN9DPlw9ST
   VJG7IVtQgt1MZDkw+h8NX8qNWFPKvRPKuU6MwowGHC/v4k+EVRUTPlmdE
   A==;
X-CSE-ConnectionGUID: l3viPxNyQEyhuYbassbLqA==
X-CSE-MsgGUID: u9Ad0Q3eSLm1K1O6penkeg==
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="76685348"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Nov 2026 06:19:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 5 Nov 2026 06:19:49 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 5 Nov 2026 06:19:47 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 5 Nov 2026 14:19:35 +0100
Subject: [PATCH net-next v3 1/5] net: sparx5: Drop redundant POL_ prefix
 from POL_UPD_INT_CFG
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261105-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v3-1-b45a3a26bed5@microchip.com>
References: <20261105-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v3-0-b45a3a26bed5@microchip.com>
In-Reply-To: <20261105-b4-lan966x-pci-fdma-sparx5-lan969x-port-policers-v3-0-b45a3a26bed5@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>
CC: <robert.marko@sartura.hr>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_051950_958998_16F0507F 
X-CRM114-Status: GOOD (  10.41  )
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



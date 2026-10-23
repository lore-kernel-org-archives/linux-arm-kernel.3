Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1C9606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 06:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IMELQY9/;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=D1d4j1y1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=LfiU4EaGH2mzKnUAqT1yCPBUuJRXe4MmrmSz1Hb5dfc=; b=IMELQY9/TKvEsIclfumtXKqSL3
	9Q6lyaOfiUYcPauNf7/Nylhp6e0SKPD+v6k3To0joPEvZLOC2jxwQJAHa8D5txgi3b+daHX89pGSW
	jTkX1bWDC8I1sKwUyC93iPauDFFDRk6x6YwU7vvk5yAB2GYQShSG848M6kXmbAlNmlC/T3fF5u8XF
	vWqe7+slBdtR6vSN6ARjGarVHkEdQm0FnWXuvHgdiOXege5Fgo6TvAStAIxjT729uqNsJIsT5GbAI
	zTPnM4/M63kZ0dw5BkqF9p0lkiH1Sn+3do7vhKYDlxUhSD0sg5xOw/tZFAREzDrjyziUZZCnWgsTS
	wve/UY+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK96q-0000000Fe8C-0uou;
	Fri, 23 Oct 2026 06:50:36 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK96n-0000000Fe3V-1gqh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 06:50:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zNh26LC/d9AyXdc61qdv3HEX3hPivass9brdassYGD7Kcx+xAG5sEiFQF5j5VW/XTxdzjuYC0q1AnhNn8TYVdvnET13i/M0oQqC9rpPV5LD/7Mxk19mBle9dNb/hqP+fmnrnr/whVA8G1EUzZ9Aq0E1JHNep4XlfJ3+NAUkxm0PwUQ2T3oHq4KMvz9Kje6EA4zFZNxn7/NY97hXidOiBM/Hku1T+p4z3L6rSF2tlHP5KXxqZ3FWowDYDhUeQYuZUNuAbFqOYsvoIZLA5mFUnu4PtUUUwADFvdQA9JdLUzyQuswaLS1TJEqUuSyjqm2/9rT0pDHCUqRu/IhaMT26WPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfiU4EaGH2mzKnUAqT1yCPBUuJRXe4MmrmSz1Hb5dfc=;
 b=PSAbx6F1j9ivngkUMHV4Zwhzf3XxvaI99OwMVELIh5VRvc4PGEQaOVWegEsPEjtCsVBXXiT0Ggl4/YWBnf8VB02BaRB6KTL4QNZnjiVfqA3R4u59beR9YvibuCIjX/gVpsfCw2BN7Vi0v+BkXMLJGnCaadPqD412JNpY6C2BkpkfeIWQMLNXwaXp5PQCxoGGlYBDXl172SA/UzIJbR1YC6ahDW+HzB0JFP1FCItPVA/cs375vl6ZVvoEA9+QJLdWXZvDSdT2dQ6IvnYtDZCPRGrKx9cMiDdkZqnXYW/TyZywEj1iJhzcW4CmFs9yxL9aJNe+ePCm5zRBVVrUQ4P0jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LfiU4EaGH2mzKnUAqT1yCPBUuJRXe4MmrmSz1Hb5dfc=;
 b=D1d4j1y1JeIxPkFmaBmbxHCexQJJqht3wCU5CUi5P4pQAHejVnZPp+MES9LjVFu8m9meXB8QhBMKvi7FmrTgNqVkErN674ANF1/IJvn4GIID8PzkjjO6zSUP7GIm+Ia6OJva1pQA0TpUFPSqw/aIU1EpjQTY1927pbQVNepvtpnFgMfImNkcUMTB6imVxo+nwUC9/gMKJ+LjlRnXoLIYZBO+fB9bfIn66F3jVZYlzFs88lkhG2fI1p3fdyAI/ybjhCBorOvE+P7u1XqXRga9Cawo2PcO8kmTb80hdLW0wTVAA3tbKwurKhUToQeMGHkmlDi2uwg4MlP6Ble6JRyJcQ==
Received: from BE1P281CA0273.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:84::17)
 by DB4PR10MB7064.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3f0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.3; Fri, 23 Oct
 2026 06:50:26 +0000
Received: from WA1PEPF00009B38.eurprd05.prod.outlook.com
 (2603:10a6:b10:84:cafe::4d) by BE1P281CA0273.outlook.office365.com
 (2603:10a6:b10:84::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.3 via Frontend Transport; Fri, 23
 Oct 2026 06:50:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 WA1PEPF00009B38.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 06:50:25 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 08:50:45 +0200
Received: from localhost (10.252.16.117) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 08:50:24 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 23 Oct 2026 08:50:23 +0200
Subject: [PATCH] clk: stm32mp25: allow MDF kernel clock rate changes to
 propagate to parent
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261023-ups_mp25_clk_mdf-v1-1-3043b3fd4bc9@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAK4D22oC/x3MTQqAIBBA4avErBNsKMGuEiFiYw39iVIE0t2Tl
 t/ivQyJIlOCvsoQ6ebE51HQ1BW4xR4zCZ6KASWqRiKKKySzB+yM21azT15o7WzXem2dVlCyEMn
 z8y+H8X0/hI8nNmIAAAA=
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Olivier Moysan <olivier.moysan@foss.st.com>, Gabriel Fernandez
	<gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792738223; l=1247;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=UYJe92XofvwW9024M6MvYoAscbsOueX8CFhCXRbov3k=;
 b=kzM4V5eYaJYY3DiUDiNaeot5DRVy4DMrdBKkjQUT7WEa97Wh5MoAlaVXqE75m5yHn8dxsswR6
 Kaurs+VedX+CZbVzDHtJQHgrn6F1Bj3B8knDv015MmW5qDuCje8uAyo
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF00009B38:EE_|DB4PR10MB7064:EE_
X-MS-Office365-Filtering-Correlation-Id: e8ceafd7-b1a8-4f39-eb2b-08df30d1eab1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|56012099006|11063799006|261021123027099003|261021121427099003|261009223027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: Dh0D5FMNn8/qOp4Zyt93cIwadN0C7OsLDnDQ6UspeA6G75YjpjOlic5Dr/Yjp5BLgwGfA4UyldPohTBxN152KdBh1KnEvY71mNcK5Tn7xRiOLBR92lqxOSNt9NG78ijURX8fwYgscVg7Ekk/kP1scybZJrKnxC9TknaKAysmyJG/1pwQtHJnEHKyhdO91ti+3mlucgM/xOVXxKG0LSHEXQrWfdKrLcHMAPOsEfVgyfKXp8eqBUimpyShkavK926gUYlfc3heO2E3u/7w2QqdAKHGX8/oQ+d0oMjVi9HemdaJNRSe7j4mv8OZl3BSwGTGAjlc1NR89nUujqrDeaIAmEYWkHqTKwNLFhDuNuFy21klIw2wOry+dgM3xSWgiH8iIYDUPszkuyV0OZdTcT08AtJivKKW0nMH+uWksFVQ0ywV8njanPylvXQxwH0x48111EXIienBs1sdPBq4mfl18p5ZM0L8sg9kUXkKXFusbgPWxxpMSJ9fHhWJAkPQwl0auLz1aKGrcrc7muIK/3TvXHYMCOwqjoHp2OmmtMv5JNHOVN4t/+pau2OaktXxfJNU23O/8930RdlaCrHA6pCoiREsgzAeB9yJ/x49ruaesjnI0vkUb6NKu0w4MkA1bTZs21iY3W8/dPD3eZqNrCIUZdYGGr93d5NLkYxqgz8iSO4uZF3mkqRhNGO7FDkeBnCboVLQivLJr7BvEYUDnrVpuw==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: g7NtxhIDu44z3Z2Uq+RiJ/Qc8GZfV4u5bjHs7Q9yNrxQerktwcUeIGc+CWGtw2163rpGqUuQztgPWB+6zdH1+tyyHXud7jK4BXxsmPRW0otsrCbzTwo2c9/e/bDcKNcOojdgjPlpoXcQ6qPLXpoCnmLj6QsDrog898L+fRpMxIDt13ldQxvPPMcs/4yaVE7MjPtWO6KfUwMsHyhINROE0mzE11vgexnkShFigNwBmN1DDouOThNxgtKknRGS3TGP/4ckEshOcYuLM18lU6xYKI5H/oLJptwBW4btd2NnZ6Sg5Av6uS730Wcm6fcDN2CSNUFNiR6uAtBOZ/OvK4jkh16sOf17cuow3N4g6xqg16HYvjVkgA777KjNXuBG+aybSzppsjTgQav6cOQXXTloWtQ66h934y8OBq/5/GKAxWK/1NYWsMLhkoQXUGI06ohf
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 06:50:25.2751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ceafd7-b1a8-4f39-eb2b-08df30d1eab1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: WA1PEPF00009B38.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB7064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_235033_799981_99ABD306 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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

From: Olivier Moysan <olivier.moysan@foss.st.com>

Add CLK_SET_RATE_PARENT to ck_ker_mdf1 to allow rate requests on the
MDF kernel clock to propagate to its parent clock, FLEXGEN_23.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
This patch is independent from the other STM32MP25 RCC changes that I
am sending separately, and can be applied on its own.
---
 drivers/clk/stm32/clk-stm32mp25.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
index eb0bc918ecee..8f6fe30b19ca 100644
--- a/drivers/clk/stm32/clk-stm32mp25.c
+++ b/drivers/clk/stm32/clk-stm32mp25.c
@@ -999,7 +999,8 @@ static struct clk_stm32_gate ck_icn_p_mdf1 = {
 
 static struct clk_stm32_gate ck_ker_mdf1 = {
 	.gate_id = GATE_MDF1,
-	.hw.init = CLK_HW_INIT_INDEX("ck_ker_mdf1", FLEXGEN_23, &clk_stm32_gate_ops, 0),
+	.hw.init = CLK_HW_INIT_INDEX("ck_ker_mdf1", FLEXGEN_23, &clk_stm32_gate_ops,
+				     CLK_SET_RATE_PARENT),
 };
 
 /* OSPI */

---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261022-ups_mp25_clk_mdf-99ca54f9ac96

Best regards,
-- 
Gabriel Fernandez <gabriel.fernandez@foss.st.com>



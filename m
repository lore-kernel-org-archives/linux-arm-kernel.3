Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E04606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 01:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EOyyuaLN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KrVBe5x9E7InxP1BW2HQNZrtx0xeZJdcUQeaxJDjM6I=; b=EOyyuaLNDXMc+M0iNF5FJOf3AQ
	IdrzQmd3QZ0lzLxusAcxD5f5lB3FNuF+XZnB5YQpkDQlJdx++vXyhBTMVZB+TWL3WQcnxulDUGzph
	YmHCgA+WSV1B/6i7RdWowsSL5WTBVvlzDaD1e46Th5scvkTUBY96PLgmnDOxiEcFdYSXvkPVoa05R
	StLQPdd1YQPpwGZmYQaWUzRLy38vOvgW6G0L50/kevX0gxy8d0rEcKmMH99wL2Q7L7peAQZMRfEsn
	Sq23J2MqtFr3UcP0VXnCoeqNU+p02+wTvkouQ+OE51x74KpYiR1ofE9EMRG8iE2vHJPQy06l24QKb
	ffG4gRDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP8rD-0000000Az18-1rPX;
	Fri, 06 Nov 2026 01:35:07 +0000
Received: from mail-koreacentralazon11023133.outbound.protection.outlook.com ([40.107.44.133] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP8rA-0000000AyzM-0HNc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 01:35:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hJivQN069WSTYYU8UvM7FinmN+NsDQLgENDXrMMK66qWONSRtq3j9Y0h9rY13Oj418IvniHGSYdKRtAv9CZtKwQ7zZnp/M3xAHYrw8NSn+P4Wd4VCuW0Gg96U8UkCzwxhZ1qiG7MAxWIaAlS1YlxcdpVrGwNGmDwOWUBaSjiR344bLxtGs27k5u5rrSwkEuc7FX7NKXBQenY42v5NBSKfY+Djlzeyzeh/fD1h0QNbXTzA0YF3+zX5haFmYFgqy/4GHT8abyx5OYhMebRcmnTATkwcXwBQ7GganJxOtwhE3U0eydLVCcvN7t/GTDxh0uZuRve32pbAefGUzJj+WbUrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrVBe5x9E7InxP1BW2HQNZrtx0xeZJdcUQeaxJDjM6I=;
 b=Iulo9YBCQQiTty4mhc2t7QntSrcmUQ6QApklKp8XueXO35jkTX7qPZx2yqD8So7JJjgZsr4pjwzBt+G2TUllIc1hjAjsDKsfGBCqCwpSt1V4XR8GZ7SbVk3MrMkAHRD8EaYFKR58Da9s5ff7yf077gtMASwbLHiPKNE2RDnPMHJ8GeN/bzsyANJ2TET6Fsw+OBFpw/mwaHLaZ+SficKvVZHDPQkEPe/ArXwBdRwfxBCyh4EQ2RHr65UVX2K7KYdbkidb3C3wOxO72FOgEu5nSEYgQH4lgHI7XXV1G2cmEIei0+LHtUTyaCMGYEYZqanheMyFxjbQb1EdareJJ401bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR04CA0034.apcprd04.prod.outlook.com (2603:1096:990:78::24)
 by KL1PR06MB6621.apcprd06.prod.outlook.com (2603:1096:820:f9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 6 Nov 2026
 01:34:55 +0000
Received: from SG1PEPF000082E5.apcprd02.prod.outlook.com
 (2603:1096:990:78:cafe::6) by JH0PR04CA0034.outlook.office365.com
 (2603:1096:990:78::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 01:34:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E5.mail.protection.outlook.com (10.167.240.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 01:34:54 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id AF39F4102E6B;
	Fri,  6 Nov 2026 09:34:53 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com
Cc: devicetree@vger.kernel.org,
	Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v6 1/5] dmaengine: arm-dma350: Fix source trigger bit
Date: Fri,  6 Nov 2026 09:34:49 +0800
Message-ID: <20261106013453.1134239-2-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106013453.1134239-1-Jelly.Jia@cixtech.com>
References: <20261106013453.1134239-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E5:EE_|KL1PR06MB6621:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 59b10f3f-d27f-440f-41f9-08df3ba628f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|36860700016|82310400026|376014|7416014|261102123227099003|261028144727099003|261021123027099003|261026140227099003|56012099006|261021121427099003|261009223027099003|261026121527099003|261022105027099003|22082099003|18002099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: Xv9EV29A3DnxrMQKHHExXl+JeOX+kzqqmMCkQJqgph+95ePhXzDkruC7UW742CMZMnAgdwFvwk2atLUmYENitvdGftf6j133ZRbz3NTIoT73UAyB5bS5NiEf+9TrD/lp7Hz3AS/CJaRpU5wuPrMozfGcpR7WX6XG5ECFSkICdou8UtskkJ1IP9paa82UULoE7IKE3iAlvBvPweES28it8QSMHf7osnxpYxQTsZSCIqLXh3qP3nD734rYOfFtBJusVCASjTkfy6pk/QcCIbdP3JtrzZBtjDkzqBjrTjso9B6CDRn+VqX1/7CJrsmJx66QUjnbXZdzvZ2r7Yg1BFUKAIzXbXWXwC5QR/a6he5oke9lcizVjVm4zWErxyanVhEW0TA+GZ67pg/XZ2m3+XhNE6LkEAp1O7tbQmi3EwmqNsjr8GGOpqGm8ZvIb01BDdYxoTLmoDyPS2cceYClNgY8KpdEYrXN0UYoMUTA3YyrqFPVtybS+DojoOfF6PHTKecCZm3lffYJC41mI+HsKrfKZcwEAleLl9MmkGc3dRpnxqhHU5aADCjXKpCwgcQZ2PzTZ8GT9gCXOnt+0u0/DcT6Jx6IfFk39vDZQuP+IzcF7nVKlTcYhk3pMfDzPUgVJJx7LNv+kKyJ4lIIlJkZ58JyfKwTF1/aRPROkrSdqLvQd5P7uT/ZHXuQQuZ7uDZHSoDmvH3oiRVVkARMBgpBuwZzQw==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(82310400026)(376014)(7416014)(261102123227099003)(261028144727099003)(261021123027099003)(261026140227099003)(56012099006)(261021121427099003)(261009223027099003)(261026121527099003)(261022105027099003)(22082099003)(18002099003)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mlMHyVVjFFGqASOXe+ogX2lNjGKkhb7h0OkSBucI75DuRnR5Seaaa0fH7kE+CnIInmuYpqiTt6F+bpfR2JVUqjn9YP36qDVQdDjNjcoi7/h9/twlkSZw0bk69a1B2xQEjL7NRagnXEcmMtbdj2hWgQCB7WwpjhcQxQUzVws8A/Crh7pUvFWgxMrk9J4m9JcYJolfaSX9XcVgSVx/kbNHUTreRWom57Ij9hFvKvFF+i67nGbqmq6Xsf4sx1f94sm0iY+Pcau7WAD79cgV5EgoTywxTqvt0Kgg5mic4p2PbmDlhz26MtjoKSeYCuXZY5GseJo/cZ97S17LwapIArbd41x/7NRbWtgT5vLt4KYcQ0KVbi2OaCxpJtVCLU9wOsHR/yhMxC5IGsxSFndlKUu1eGR3NWKhtMtc1V0p4wcde37qfTSYDXr1UuinONbeJXy8
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 01:34:54.5748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b10f3f-d27f-440f-41f9-08df3ba628f5
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E5.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6621
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_173504_119922_023C6CF6 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CH_CTRL_USESRCTRIGIN is the source trigger enable bit in CH_CTRL and must
use bit 25, not bit 26 which is the destination trigger enable bit
(CH_CTRL_USEDESTRIGIN).

The constant has no users yet, but enabling the source trigger input
would silently enable the destination trigger input instead, breaking
any transfer that waits for a peripheral request. Fix it before the
first user arrives.

Fixes: 5d099706449d ("dmaengine: Add Arm DMA-350 driver")
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/arm-dma350.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index 52f5242ea332..fdc4cd224579 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -63,7 +63,7 @@
 
 #define CH_CTRL			0x0c
 #define CH_CTRL_USEDESTRIGIN	BIT(26)
-#define CH_CTRL_USESRCTRIGIN	BIT(26)
+#define CH_CTRL_USESRCTRIGIN	BIT(25)
 #define CH_CTRL_DONETYPE	GENMASK(23, 21)
 #define CH_CTRL_REGRELOADTYPE	GENMASK(20, 18)
 #define CH_CTRL_XTYPE		GENMASK(11, 9)
-- 
2.54.0



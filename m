Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FFC606D838
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mBFKgQSQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KrVBe5x9E7InxP1BW2HQNZrtx0xeZJdcUQeaxJDjM6I=; b=mBFKgQSQxdhTTQIGmLdTgEUvip
	6fvjE0akXyJFp5XuLMcUBs/Oiui508aJiF0cSGZOml3piPLux0KPyFubMuSuPCW19XpsYbDQqc8G8
	CjNOLfhl4H7Y04SC7CcEKWKSm5OHZhsxoVio0bGl69H5Mo+Wjv9EFuawaZ6OrcSXq7Oyj6h+YiyRw
	dBab/xo8P+wivTbBfpsGhhfmAjHROxYxOWuesNc9+fU2cnGAVNg5tsQAW5dw0/djf9Nz6/c/sQYW/
	nhkOX0jogiezyOIkfcp3idMkWYmMd/EJKJMsMReyQqoaOImPxVT81oVZ4QAOCP6MrCp/2UVIHNsTn
	gXYu8HhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaRi-00000005Nkg-0w9F;
	Wed, 04 Nov 2026 12:50:30 +0000
Received: from mail-japanwestazon11022128.outbound.protection.outlook.com ([40.107.75.128] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaRd-00000005Nfj-2U99
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 12:50:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCFTIqKvsLDaALWLBUAoCfU470zrC1i656kRuHcO3hE7szCos21K54+xttksNAoEEP9ZM077JFKcOePFsvUIRUab/amye9cmXYrGFbta05o0AdsDg5rDjsYic/DAo5PpHylQcmLUd5hUlNC/qH8AHk5MoHROd/x+kvwc8f+2z9o+NHgiekleMZ/RGgLEh986K0yljCoWJrjfPsG+UApUUBhOQZQVkk5havyRimW98AeQBKMWyLDXfN2tDKtbXXnskU0dG0GQWBlCtSfqSDe79cBqDnDHpGwE1MWvOT8G1T0+8/1S04DomL4DG2WxJxjHHuXAaDbVGP2Ik783Wr6c6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KrVBe5x9E7InxP1BW2HQNZrtx0xeZJdcUQeaxJDjM6I=;
 b=HDi/4TcOxq83w6n0XetnUA0ZEmYbneNBirgbbtFxSuoj+T4uHJjNAE4xP3pVPDvwNy2EI+DcY0pLqclufPj2UtvKLVlszoaUYTSrF02aS+qad+yBb+XqqV8RZkCLzmCT6LcwQ+aCfh2VBVv4U6FOuMysZtflxEcSQOtHVljLotq1fhAaOjFyWE6hokFFfSKdijOCOh5I6fuc3ltzOFqAgfAHjhP+Uj9Xi2A7lp5Ti0NzMbBZkfLn/70in0E7W6qC8a6HrRHxtHU6iWPOIs7ZvEGdRhuAQL4bf6tQfnn4JWWvHrzkVHxnF52+N0pM+R0O6cX336fun9Cy7iWBiaLUkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7) by
 SEYPR06MB6661.apcprd06.prod.outlook.com (2603:1096:101:168::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.9; Wed, 4 Nov 2026 12:50:16 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:4:140:cafe::9e) by SI2P153CA0001.outlook.office365.com
 (2603:1096:4:140::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4 via Frontend Transport; Wed, 4
 Nov 2026 12:50:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 12:50:14 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id DBA594091E3F;
	Wed,  4 Nov 2026 20:44:12 +0800 (CST)
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
Subject: [PATCH v5 1/5] dmaengine: arm-dma350: Fix source trigger bit
Date: Wed,  4 Nov 2026 20:44:07 +0800
Message-ID: <20261104124411.296640-2-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104124411.296640-1-Jelly.Jia@cixtech.com>
References: <20261104124411.296640-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|SEYPR06MB6661:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a97affcf-a908-4fb5-0957-08df3a722c6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|82310400026|36860700016|261009223027099003|261022105027099003|261021121427099003|56012099006|261026140227099003|261021123027099003|261102123227099003|261028144727099003|261026121527099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: l6vrMVnfjjBnktiRnemYbBUBMFNk/myABm0KOMIYlsBAwlPmbm2jPG4skOaySeJRDwQzL6fUw+DFcAPZdMJi8g2cbj49FtW0mrvFUbZXrPpDikDabBwy0pqAQo6U9mgM10QyQU4Hjyb2vlfmXTEYgFoseyUjNjWkYqHRwmkMiBWZ2IxYDVo2Jg5BK4tbcsPfSgZC7BvCGBN3dzorZOKhSzvAFHeRWwqrREufuUXU5sKo2puMcUIvGsG7zXMMg2GzYQEyseHmw4ROF2+845dTLU833uk9J8iTC+ANYn4OLk5rymDC19ruNS9/mZKmus6BNwcPbyWTCtvfw49VM+fV4H4tLz79GMSdGk7X6YT/12Dj2hqD3pDKQ7zHy3oYTI/k+MKvqq7c3GfEATc1QzsEkWUlDancb4caSPA8t9R/EOzpZBtPZO5H7pDmWPC3Ks+fLR4Dr4F2s+JolMhgDyKSnLFqhGwthnie7RvB0qT+mX4MCmctutoc+uO7D1gyIhRQzuH0pcFuPyNUlmkedZzHs0OLXNyIbbwPPVhChE0gWMKbPiA8FC3lmfAytBIYTU7JCydKWCJlmDZC2BoBlboM6rk3H9xkcUTTP2imaJ3VDhTXxSawt67g+3tkowzqFW1uArt5hJEvKxKLWKcdbolDHIm9KH9rpOvfNrYkYA/XHTDLzqd53OBA6jnX4mHxt4a3JPQQi7t+yFRJ2uo1BJn/mQ==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(82310400026)(36860700016)(261009223027099003)(261022105027099003)(261021121427099003)(56012099006)(261026140227099003)(261021123027099003)(261102123227099003)(261028144727099003)(261026121527099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PSPUbCpg4Jr2/Ri8hmCG6O3qPGrFpID1qpkxTbfZ2+b5wy37Wr6uJwb2wLM+X9Y4WVqCqcOB9K/CqwXc5em4ZWbEbVTzzAGrhf949QHUnHMNyHfyl72aSFsrSA2qWGsziwAKGj5t5jDrE2ca5wF5zjF0qV3acZkOEo49AtZFZ17j4yyrnP/kfTV0Y3hjX7fKMdsVss2B9e4UEk3NqwqlSrmdANP8ec6KqekfSIAsMQX8v9fU6M53/RR7Wig/4cMqbjrGLCOGDmbd12DzBzWqou2t3ZNc2FUpGKZ1JTmEcUqKC2thjFlJKx2HoR4kU7rfxlkhXq4mU1mnWlZgeMPb1ub6CMboVTGiMU5PSBUJn/z7nshfTGp4HUH9aaBNraxYY0moGZUFtEiKDlfJZmMck/n9fKK9zq7J8p6lCtNZTK8WEEKC9/urZ0qIm+rnqLcX
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 12:50:14.8959
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a97affcf-a908-4fb5-0957-08df3a722c6f
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6661
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_045025_661135_4AE1A7DD 
X-CRM114-Status: GOOD (  11.14  )
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



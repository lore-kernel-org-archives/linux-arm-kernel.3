Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D80606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f0cT3zjS;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=f5k5Hy9g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=F97tPVGtx1yY2rB1USTNBH+TmJ2RECZc/az9jThvsQs=; b=f0cT3zjSu5Ywzb
	vDs8vbgfXnzKLLtdkZQ0L0hG7+qQS6+10UZVEw99Ff94cu1naR160/mvIQYfTpOXGMSMw/a1SD7dx
	nMl5sG/IwpRoxfnaaJwWAzyPLPPViVkMp0uflnkPrptIa4RjzIpcltPa88wrm82h/dREo2GM4xXX8
	czI/0hSYvOtriHMOOVKJG41uQVpaJMQh1efRe5sqcbbcozV7Tqes2shj+qA/U6yGut6HEqkOeDYDx
	/Yd15c8xBvv45vnQwolp2iOnavO0CsGlAWzRUNCeGjOKCf55rdBKQxsWR/RCDhFZ/7RlDjHgNAoJk
	QsXzdGAO47T9eRARZBFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGxf-0000000BsY2-3cIm;
	Fri, 06 Nov 2026 10:14:19 +0000
Received: from mail-centralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c111::5] helo=DM1PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGxc-0000000BsXF-1jc8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 10:14:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ojlRRCejGknEh1rTRkYkip2WNLIs07O6oKEiV6w/fu7HS/Lpu6QnLFuysXxlc6QXIbVI0OuzHCf3aEJ+MBBypOZIKW4HTUwrv53QlKwswo9OJi27CekhWyd1/04l4karRbZAzUb5UfVqw1yn4PAQb6LgZPdGAHZoRNAme7VlzWRrcvS5GK+YEyfor8zpHQp7Zss3ueHYwg3Gcd0RGrQEqWlYY6782tR1/9Dl2BqIKbJ0qgnJJGKFXmihrMUnYuhAxSTlS60WYdKoFrBcy70dfiKDvcKzOAFrJ+LjE3agTaN5YToxYdGnIvBsHFebXudz1pMtJmwAFQBI4hiPRN+rqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F97tPVGtx1yY2rB1USTNBH+TmJ2RECZc/az9jThvsQs=;
 b=onB62B++cpG255wqJL3IHSkmDzunMaHA/YS+hZJE5ZOzBjFB4Fd4dwC2lhZpCiHCokc6C2cmeTdd9m7qZjRPznBuxpkJh1+rf0siay0jl1ZmuR7BebMOQxWky36qc0gNdc/eM2T7dwhpG/k8fMjOLO4LjZcOT3NYh0RNvjIUM15P7gQ+kMXvfWh7gtndKCWWtG7mdyJeKrvLjSXz1yHeH1DtTKvyCIJBiYQGP43qai01IJmxwyLa6/gT9rHwFAKsHTJRaoGUWr+hDoYzbGd50czg1pCbL50HE+EXjAc1HWLKddcC/VGoWy+oIOFgEePTV9PaMoWRvxEsFiOsxrfT/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F97tPVGtx1yY2rB1USTNBH+TmJ2RECZc/az9jThvsQs=;
 b=f5k5Hy9gV8p1xGXTUqE3cGCu6TBViImiPAeNRpiZOYqO7TZ9COvU9lWzQHfTufRYgQxs8pMwkuGsIoZInJJpVxVz18DaOCZnyrvzUkce1xQv+WONOA/96v0CrIQUsjFZ3n7S6Yod75P0fpxo4ZVFunEgrB3/RmWWiStR5302fdM=
Received: from BN9PR03CA0791.namprd03.prod.outlook.com (2603:10b6:408:13f::16)
 by DS7PR12MB6240.namprd12.prod.outlook.com (2603:10b6:8:94::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 10:11:05 +0000
Received: from BL2PEPF000352D4.namprd02.prod.outlook.com
 (2603:10b6:408:13f:cafe::a3) by BN9PR03CA0791.outlook.office365.com
 (2603:10b6:408:13f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Fri, 6
 Nov 2026 10:11:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL2PEPF000352D4.mail.protection.outlook.com (10.167.254.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 10:11:05 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 04:11:00 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 04:10:59 -0600
Received: from xhdnaggolla50x.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 6 Nov 2026 04:10:55 -0600
From: Golla Nagendra <nagendra.golla@amd.com>
Date: Fri, 6 Nov 2026 15:40:25 +0530
Subject: [PATCH v5 3/4] dmaengine: zynqmp_dma: Add new compatible string
 for Versal Net
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261106-adma_per_channel_reset_v5-v5-3-f9990669362f@amd.com>
References: <20261106-adma_per_channel_reset_v5-v5-0-f9990669362f@amd.com>
In-Reply-To: <20261106-adma_per_channel_reset_v5-v5-0-f9990669362f@amd.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, Michael Tretter
	<m.tretter@pengutronix.de>, Harini Katakam <harini.katakam@amd.com>, "Shyam
 Pandey" <radhey.shyam.pandey@amd.com>, Abin Joseph <abin.joseph@amd.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, <dmaengine@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Golla Nagendra
	<nagendra.golla@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793959842; l=1554;
 i=nagendra.golla@amd.com; s=20261008; h=from:subject:message-id;
 bh=WbV+yEAmZHt/s2moE6AN1DUsYzWJfVKL+bfOyuK2Mt8=;
 b=Sb4DdD0hN3WpnYWm43ZiIzCN4hY6H/LgmSt5tHLbkZ9v1/dmBptNvYO+NeTNRsFINP2maqU5K
 oPEK5HxGZfPCA4Rc2UQjK3FLcHOPqm7+7pNnwBQnFyAW4y+G6XKZQb8
X-Developer-Key: i=nagendra.golla@amd.com; a=ed25519;
 pk=pCRGj/0mb0C3aDMpVVZeyBqOIQZUKGJjCKL4QZTu7nQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL2PEPF000352D4:EE_|DS7PR12MB6240:EE_
X-MS-Office365-Filtering-Correlation-Id: b6e5c96e-1d0e-4d8c-5230-08df3bee44c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|36860700016|7416014|1800799024|82310400026|921020|56012099006|11063799006|261021121427099003|261102123227099003|261009223027099003|261022075727099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ZpdiKzFAlJDCCtx6MUMpkGpN0vv4PXlajhetJq5BUQMJpTG5ke8SlwlyUcFVIZMNNr8VebSKH+E++VYShHiCsbtNbDYQ+glXQcIzgwjy/OmmHUckRIfAvVC21QbWNktCNyhoNFJIwSb1pUAlN4hhV9K6icn7+OZsHMzrj8NKJFyvQImf3rs45Oa/ODvnClkooqYSYNlRWJaVoc17BX71fSB649C9h+KscUQ7xfkbnwmva6ijkJhukc78L1XbaOPLitjPXEDnh6uC1OFMv3P5VvOG8ltxnvhDEY5TglQIgmY8PvT6R1oeyN0H/wcpECU6nsY6iFw/VpZvrs2EsYs4KBRqBD7WCO2X0olk8sdxIq1O5KVQcC6ugvHEBi59lB9hMwfe0KtCx+vabqyALwJ+MGAA2lXveXZwSLRrQI3uEIRWb7ap/W8e0m0UGu7QbGStfd7YpOCF137yOqH7KOEKvrEJS8VFvaSDwLCJHbMv9x8t4DUvkcCvh1JigStqkGNCaeK+Cpbbn5qT0uYEUNCuxGdkdtX94yXRQdmRYSJsnQSe+BMEa57KMUI6Q8iQU0soR0l/qPfdR1BS6IEddyrYNLFy9VfIpb/Scgoy41Iz/T9A9RpRb7Bl84I4a6BSAsPjD76qp99esh8fH73ipVTfZciE912lsxcNXmgC6dDs8E3Y8PK9/m4U59klLBVO67MBCFHgI37q1pBkZUJlWL/XSCBAyJ9tVgL2V/loElwLdv1CgaMyFg2PCWdw1Du9t86r
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(7416014)(1800799024)(82310400026)(921020)(56012099006)(11063799006)(261021121427099003)(261102123227099003)(261009223027099003)(261022075727099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: u40hTlVjthdUcU0W32tu1JpenwbkCvW2ew+I+R1diod5U4TyX9Cc0uveTyi+2tYKIXbdjMkvBL4vHRZZ9Ol4qzqYi5iPrmiPe6aHB0ZCYjcrMMTswNIFLv2jCS+DYHD2R1D96qfzqtAfonkWl17rH+7AEWegSCYYFL80VY+rbl1vWUSV9YakxjDNUBCT44khk5xh2vzSWzLZayYNRGH3meytb6ibh0gB2C0rnY2dMwer+pC5440ZeoDkygNKybEi6cx1UUEGodWoAB34ouMMeSdJRkXj9vwNNDFh3iz5kBkFAJGVVkfvDMc7ptMpPSgyVs0WwnO2lorOMHjYhTPD33xJn0iL3/SrG2/iGscT7476uiAPexSFVpUcxZt1Nsv+4faABJl2FtUOfajzVreG8Rg8pTRnNBc0acFw1HkRzqu8vX5en8JFhlUt6QatJPQM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 10:11:05.1392
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e5c96e-1d0e-4d8c-5230-08df3bee44c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2PEPF000352D4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6240
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_021416_461703_A1FF85CC 
X-CRM114-Status: GOOD (  12.70  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Versal Net previously used the legacy xlnx,zynqmp-dma-1.0 compatible
string. Add amd,versal-net-dma-1.0 to the of_device_id match table
with SoC-specific match data via versal_net_dma_config.

Introduce a has_reset field in zynqmp_dma_config to indicate whether
the compatible requires a per-channel reset during probe.

Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
 drivers/dma/xilinx/zynqmp_dma.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index 3b7dfa53f972..cb0eb13f9b05 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -257,13 +257,20 @@ struct zynqmp_dma_device {
 };
 
 struct zynqmp_dma_config {
+	bool has_reset;
 	u32 offset;
 };
 
 static const struct zynqmp_dma_config versal2_dma_config = {
+	.has_reset = true,
 	.offset = IRQ_REG_OFFSET,
 };
 
+/* offset = 0: Versal Net uses base IRQ register address */
+static const struct zynqmp_dma_config versal_net_dma_config = {
+	.has_reset = true,
+};
+
 static inline void zynqmp_dma_writeq(struct zynqmp_dma_chan *chan, u32 reg,
 				     u64 value)
 {
@@ -1193,6 +1200,7 @@ static void zynqmp_dma_remove(struct platform_device *pdev)
 
 static const struct of_device_id zynqmp_dma_of_match[] = {
 	{ .compatible = "amd,versal2-dma-1.0", .data = &versal2_dma_config },
+	{ .compatible = "amd,versal-net-dma-1.0", .data = &versal_net_dma_config },
 	{ .compatible = "xlnx,zynqmp-dma-1.0", },
 	{}
 };

-- 
2.43.7



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C56260A2614
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 09:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h8wdLIHo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ExE8VHlcy5atEQBKRME3h9gGQ3lOlGxZcjmk5Gv0WAs=; b=h8wdLIHoEh/XeIiKD5Q1XZktlU
	j1dnwib932EcIpcWOIarfPGiaJyNFy6BzTqtlEzjorbiI6OeGTyLdlx041Ca14pgJjmMWgAgiZHL0
	vuYMqpy3GBcNObtHWc9zosXALgk/jEoOxbl7AdNj8nqfVsYXDuynFRcv0ac+mhp/iPCP1jq3YLjTm
	92+dJoPJfhi/NT7TF1tacPItX6Ki2S9bHlfYaXiG3QxGVivoxK8K/9B6tTno63TeZCKw1i7I70bKt
	iE7gzzZ85u2WFm170ou1ux0yRMCZlplZdJzReb7teUv/uvUjd36wDtAemXCAK5EM6czBB+V+B5NcI
	m4f78efg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBbY-0000000G2Lq-3Wpo;
	Fri, 23 Oct 2026 09:30:28 +0000
Received: from mail-japaneastazon11022083.outbound.protection.outlook.com ([52.101.126.83] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBbV-0000000G2Kk-116C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 09:30:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMPAbWcZC8Og/WW+RSzljN4EjRKyo72jVwz9HlPoTeyjsTVmWXF+ulsYD3RTz1k/7UYC188BBtM9l+zSCif4ByJ9IdWZZxMIRIaIhe71hlghHvNXXwwq3/QRsXrNC8Zib7ZDDJOHEx8l1+ocbPDqcVH/OrzQUfvbM+9KsrKogdM7FVmbNpXJh253qmqMSmZc0zYBQ9aQ42TfnQOjIVXGxFyS/ntfbTqnLjfzKPFrnDNOyhIBtagu7Y8cgEgEDLNvucmKk7y4QEtODnmuSdBn5ns/R1ve2X0jf2+YxoT8P5ZQdX5Oo/Imh58YehJU/HyElaK2kSeo8/VbQTbguT1XNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ExE8VHlcy5atEQBKRME3h9gGQ3lOlGxZcjmk5Gv0WAs=;
 b=UIOqSCnYhqUH9yQ+/QPpTCwTVmah4b9BorI8nlAh2x4wVUCAgHZS5iEcjqrS82GFv8vnbO2Gui+y4Y4o4cV4VRLgmkGVOuZ8tcrcfAPHypygsEJvsjW4oKITgn3VCkxv/ADR+ppf+p+N0AIaK/Hy60duijRBQgtDY0jwVE+kOc96xEDIp1CGgDTKd0DUA9L3s40ywuv/nooKetcMWCuWS5z7OclQR+7b2fXvNFaRXARDRMok9863A4gu+ssaMGX+uxD6BYi6Mzz7IzHx7ZTMMGC9CscSRV4iwx/4A/ava70K1igKxI0+4yHxWVgtZ67jezQE61BN2q36J4pILSiU4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0024.apcprd02.prod.outlook.com (2603:1096:4:195::18)
 by SEZPR06MB6038.apcprd06.prod.outlook.com (2603:1096:101:e7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.4; Fri, 23 Oct
 2026 09:30:20 +0000
Received: from SG1PEPF000082E7.apcprd02.prod.outlook.com
 (2603:1096:4:195:cafe::a2) by SI2PR02CA0024.outlook.office365.com
 (2603:1096:4:195::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.18 via Frontend Transport; Fri,
 23 Oct 2026 09:30:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E7.mail.protection.outlook.com (10.167.240.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 09:30:19 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 2C3484102B47;
	Fri, 23 Oct 2026 17:30:18 +0800 (CST)
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
Subject: [PATCH v4 1/5] dmaengine: arm-dma350: Fix source trigger bit
Date: Fri, 23 Oct 2026 17:30:13 +0800
Message-ID: <20261023093017.3248454-2-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023093017.3248454-1-Jelly.Jia@cixtech.com>
References: <20261023093017.3248454-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E7:EE_|SEZPR06MB6038:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2808309e-4376-4109-4e20-08df30e8411f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|82310400026|36860700016|261022105027099003|261021123027099003|261021121427099003|261009223027099003|10067099003|56012099006|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: ZUxa/g82gKhyLuJmNhq5owBZ4FsGZBRwtc/3LuraagvcCY77ZZML3lXy0LXGv5IsVndFiqm6pwBZMEwEr5BeZn43VmYLvEDveez/49SmwZTYC5ne9YnW1Vkw/Jmz/iWHijE9II8bwdYy7AnyTr3+xtI2XUcv+M8S8YctSKX0Yj+TVbxbZb98dyiVakjHjSO3Hj8BFA/Vmh5MNNnhFIYUpXyFkIqOr1SJnOOiItv6xrwLeCaXHsy//tZENG8kV2Odx9xxuknAR91j55MptZHFG6RI492CUWTSCD3b233YSTuivDoNgSZLc/MZTudjs5cUpTYqzWxiBEc5RZYJqYvUAXdqdyHn4DR4pdCNAflzT7WUHBYGH/p2dt+DYvf/VPImROvwlIDDu7dYm7aatbK1DcVXTZAfm6djVzWiSP3XQ7QUcLRzuWFeftO5i/oK/X/lrWv/53KNrsLMXmELLC8W9b3Hn/uceLckslaIgLjPzL26UEZpHeJBwkuWdTNLulu2+MoGOA8gjHCd0B7bUBRxmImUa99rAg+KYK0UOJ05N7yJ8cDVUyle8CHmVMVrSajHp4qHrF/GNS+l89Wj+93ootVIdOyokuKLD0pxvrStAb/FBFDE0FwElLAT4GjVqB+exqjx86CIg61MCQMzIlv7fqt8m8tK43sltuk+29io2uNUy+P8i3BWm/cECR4cVP1tWv00Rqo/qDfQUy7WiZv3vw==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(82310400026)(36860700016)(261022105027099003)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003)(56012099006)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lY/oeFefdH863qLReB0grDi8aDVvV+1vHshPiQ8dFXmf7t2sxh0X/hIOfMoPBvU7KpV074vZWkI9BBRwKkjCCy7XdfY/GKLLG252mdl8I3VUnn3su8V2SjkVDnLqJMBhpocgUXAjV/sGWh7Nhu/q7Jzl/DhvZZOOeGtLatxYIbBl40THu81p0f/CecNOMdDNDx/1tKPRgGdgi9jFu5QmGX3uOR8GsHSk77vDfxDtpSj2TokNLtsznAp0UmB6D9HWMUnoyxptkRiihGIPlAhyy9ipFRE+66N9F/Xzp8lhXtgWrv5kuVrYUQUG+4di3CdbtE9wI2gjotITsd5qDlrMUmCLWsaurYBhCylosHgBlpeIuwxTKBqiZb/wA5QZOBnnBxlWARnlUXT7WNOIQX2G2Ukr35R4dohFJW3TAEo5qE3ZNoTL1PI3GD2izzTbAwsD
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 09:30:19.1100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2808309e-4376-4109-4e20-08df30e8411f
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_023025_283551_4BE09D30 
X-CRM114-Status: UNSURE (   9.79  )
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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
index 09403aca8bb0..4e17130de6c8 100644
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



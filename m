Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A6BFF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 08:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sMNmze9D/smZWTbqcmnj/N8fgqgsTRWcKHnTetGUt/Y=; b=H/WiUMPgtCjD8O6/F8JCSpAyP5
	CNl171KlvXhe13yycHf4Zo60RSQ7NOa8bg0L1ErpiWi1ILYM4yu3Flz1RdrWDwoDDHCZjJnGJZWPy
	L9sBX5qhbcfh6vwW8B9OT2xBZHi6PLiRD5q0dhQkqzs+XPL5Qops9Xr1LC+xaUZCipmLS6Lo6as9b
	iiezY+OYzP8AZB/lDDaBiavIxNIaNkHSzY7fQgUwz4tmY4I/LfFPhz9UsTFsu6krGRu/p/KykYExm
	YD5SYkr56KCh20cvM8EiAu4XPm7+eLtleh8r0B7meFJPnzLfWgB+B6v+ykk0aW6ld/l5X8uy4DD9R
	HB93qRjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeCu-00000000wf4-2ukh;
	Tue, 28 Apr 2026 08:54:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeCp-00000000waR-1Lgc
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Apr 2026 08:54:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sMNmze9D/smZWTbqcmnj/N8fgqgsTRWcKHnTetGUt/Y=; b=Lehzn208/C/VRxw7G85wXh80xz
	dPZR+eC7vrWJnKAf1GoYcV8xOMvr2YWaRREIX7XMVNCT99gfFODV5NMsIN+g2MzZZgoJlZmEUZyKB
	GekltouMOc80xOOlikaa0MHWHG2MXFJM/KahdHWaMYxF1Nc5yGgvTMO3ZjWWw/FOod0hqBjFXGa9+
	nrPBntdiJVqbobf3U/QUaTSJcpRy9w/GMt7hy2OQTfQnzOOEFmpO7JdHE/kBS3OKrNg3qmkGyd4qK
	vo5nFwVk8ATV2+vgvtU0igWK364hoiBlift5cnOR+FhsktKv4th4VWNlS/6XIJoL8/W5BcZMGxzuk
	84XS9ypw==;
Received: from mail-westus3azon11010026.outbound.protection.outlook.com ([52.101.201.26] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeCl-00000002UOL-4Bw3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 08:54:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MdpFcg76LhOFjZNV4t4/ahWUhMpXhzdiX1pzsD0+Ya/QEArfEW57fkKbdv0ks8tIivxUasYs7OsY5Hs/9k6u45dnBvb4rX4NQjrX6dFsUclOR/vqh7sQBMusnUuk6kaTNMzhAEJ7BZL67zpuJd4eiGKvIMqEcceGNPWQE/YM/mXm4lTwRX9bauAH/1DSy6EDuzp6kkUEU+3+7ERfwdm0NStAAqLQai7+S7GdaulmQ1w8wIOfoluonD5m1WyQ6dsPgIBpbGQDWPNE4lyZxYjLpYKPyDeVqrO24yT9H9HLGAleIWpvj1yytmpbHIlLC5rt/fqsZZPvQ+y1zUxyRHrkIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMNmze9D/smZWTbqcmnj/N8fgqgsTRWcKHnTetGUt/Y=;
 b=asfjswpWcaEtIKb7s91GK+gc/LI50SEEGwG8sfzns72IU/VnIFPrQWH3abE67kuioEody5/6IK3GGK8Job+U6ak/n5WPnIaw2dNR6H1rI0JwsMT3ftIh/GrfCvp6/wrOtqMKORfRLln1h9i+SJ2QFt3ASZHoQor7IO65BqfvyRVpeXcNtARu3KWJzvIXXRS/YiTggJTu8dva5uBZ/gIO2K7wW3ZLSE9Ou7tRE60gnnPYQaFBG3pS1bne+OSIIXVOOucMgi+TsGDnSxX3ZQvozYXUznHnul6r+DtVDEB9yn8K/P8T6c/Svgqc7x0brgYJQBkVXcI9pQi/yWImnPgt2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMNmze9D/smZWTbqcmnj/N8fgqgsTRWcKHnTetGUt/Y=;
 b=XdhI5C1lP97c0IMiuw3t8N73gX8LLcVuS6NLDdAYsXAT7Cs4hHRA2LQJvbWGV9yhqrp0o84IQQ6icVKoFUB75V1EOKwG4sb3hX5d3+xHnV0qlE9wgxN1ZSN34EdyVREd3EJgTIShOhBaEvjM83TlUuCjzLLc6fhqFqp2Hb3pQ9U=
Received: from MW4PR03CA0209.namprd03.prod.outlook.com (2603:10b6:303:b8::34)
 by SJ0PR10MB4560.namprd10.prod.outlook.com (2603:10b6:a03:2d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Tue, 28 Apr
 2026 08:54:01 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:303:b8:cafe::a0) by MW4PR03CA0209.outlook.office365.com
 (2603:10b6:303:b8::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Tue,
 28 Apr 2026 08:54:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 08:53:59 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 03:53:39 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 03:53:39 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Apr 2026 03:53:39 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [172.24.233.239])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63S8q6Mb623293;
	Tue, 28 Apr 2026 03:53:34 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
	<ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
	<Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v6 19/19] dmaengine: ti: k3-udma: Validate resource ID and fix logging in reservation
Date: Tue, 28 Apr 2026 14:21:48 +0530
Message-ID: <20260428085202.1724548-20-s-adivi@ti.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428085202.1724548-1-s-adivi@ti.com>
References: <20260428085202.1724548-1-s-adivi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|SJ0PR10MB4560:EE_
X-MS-Office365-Filtering-Correlation-Id: 2105cdf1-2af9-4006-f1e6-08dea503b046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|7416014|1800799024|376014|22082099003|921020|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: MTAzQ8n3aao/b9YSiEV7ODHS1Zb0SluDPWakMYtent7TEJlitl4GgEgmXic2MjWr9sKFUPkYaffYaSGHgOoSE1mAdDVIKqIWXOGV+d6d25vdaCGbtyYVSikjj1q7rqzRinVLQk+Hs/Do3URvAcbDXVelGzBiWP127wtS6v+Nz6ACKOzlLVPRPveXOjmT1X6/23z20foVQ2ZKpOtn/ofcJoSRq0CRU3I8ThUcVdL3RiUEu4/alANGlNDEnob4CNTx6+bMkNKtVwLI/c2w8UW/l8LlZ5Cg/cWU/A0KGuFun6I5MtFTSJWt4QHv6QE6uViYHMvnDfavF+KLGk7IPtWBXHkjrUs6yHWW7MQ/f+kvSuy/b/EwBctiXNH2+GzS3gGxwkhLWgtJJ3Digjczzeyq8Z98hV434x+YI15pK1BWN4ZG567T0B0yDA001afQVua6p8vBIDtO/dySFIidSCWVphwLR7HklFwLdLfa2pGdS8WVCIA3Yw7kOEJOs2FErs8RnF+qGxxK50VE5Jo0E4s3u1c6/mQD7s9NRWrPrhdsqqYsLfK9eXihc8snlWIcbGhCmCVIaqRzb0FZSfnUeMT35xQRMCR36i6lZAjfoHdaP0SR389tpmCJM9pUbub7xCEMZuYTekUIOKCSjyPIPA3McZbraBIMh+Bnnnckokk2yLo/JJCUTwcufBpn3/X4AeaOlk0ocCzoh7iHhQEOKzn79A5zLcu2i3rZVcY0FJX5WlUUfAjCJZdLlr1vs5r99sn4woQEIPuXEd0X8OH9dvUw7sLXRKWS2lPFpHJTWaZmiJ7HLomH3DNBw7x9OBqw93Dw
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(1800799024)(376014)(22082099003)(921020)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oDj3qW0PLq/yTQfWanSXsw+lqzxl8lq14TIVCaeScUhuRk/9bRCgYYyfPqANt9jPq719oWlk0UvKdwyC9+Axx+OCG1cs18pEdGPNyHvtHTTNLQk8K0tZPQ6c1XEsDDyRy63eIoDub2e0L9dKKDQFqBNtU14pcWyXyaj6wvU75WK/WlyfP3dhZMBahJ5/VZsY4ChWcOTXDRqlj3VxmFmdC7u0Idg+/52gNoWVGnM20RpTSB94Z0isLLBflU1p+zp7iTtWSCa6CiOXOHNr3iIDiDd7ydOGGa1NiYeectIHNSqVTWteMaC3jZ40LSYx/a6H+83s5lHoh8ZO5CZTt58fzlJ15XaV+cpCAVbns0j0m3k7hpeBqNHUnBU9/zCrvrhLfosooLYXrbf9SFRPnekYdzHdCT1PtK7hFG2DbpI9iq7tiuYav3Yjw0rZlriVlk08
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 08:53:59.2778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2105cdf1-2af9-4006-f1e6-08dea503b046
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4560
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_095408_342613_325742CA 
X-CRM114-Status: GOOD (  13.44  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The `__udma_reserve_##res` macro currently lacks a bounds check for
the provided `id`. If a caller passes an ID exceeding the resource
count (`ud->res##_cnt`), `test_bit()` performs an out-of-bounds
memory access on the bitmap.

Additionally, the macro returns `-ENOENT` when a resource is already
in use, which is semantically incorrect. The logging logic is also
broken, printing the literal "res##<id>" instead of the resource
name.

Update the macro to:
1. Validate `id` against `ud->res##_cnt` and return `-EINVAL` if out
   of bounds.
2. Return `-EBUSY` instead of `-ENOENT` when a resource is already
   reserved, correctly reflecting the resource state.
3. Use the stringification operator `#res` to correctly print the
   resource name (e.g., "tchan") in error messages.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index 304dad59bf183..92b14b0b620a8 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -2010,9 +2010,14 @@ struct udma_##res *__udma_reserve_##res(struct udma_dev *ud,	\
 					       int id)			\
 {									\
 	if (id >= 0) {							\
+		if (id >= ud->res##_cnt) {				\
+			dev_err(ud->dev,				\
+				#res " id %d is out of bounds.\n", id);	\
+			return ERR_PTR(-EINVAL);			\
+		}							\
 		if (test_bit(id, ud->res##_map)) {			\
-			dev_err(ud->dev, "res##%d is in use\n", id);	\
-			return ERR_PTR(-ENOENT);			\
+			dev_err(ud->dev, #res "%d is in use\n", id);	\
+			return ERR_PTR(-EBUSY);			\
 		}							\
 	} else {							\
 		int start;						\
-- 
2.53.0



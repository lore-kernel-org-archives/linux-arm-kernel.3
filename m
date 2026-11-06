Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9479606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 01:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mSP50ehX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EDuVqxkdA7TNhtKgzT5nGFPcQOr6c1k+LexfKKs9tpc=; b=mSP50ehXLRMe+yowAfR0oe/Nw6
	nDi17bjq+pWNQWX3/sFMG/de9uOrgDA7tCgVtGM1KnIy9OOAh1gQYZJn7eGwDJ8jYRxE84nY52a4T
	FJ7+08AbVoZZAmO3+dXp5GOGhnJ3fqS2Yn8K6k0yRxKu/oEszrZDtVlGZrmdJQXybuonshdppOGeN
	Jh+TUV3omM8bCLbL7cGxc19NCKxgZcZhbt45rpdPKdOW381ykpwQwc9U/MGuunhWqPX9P/u/dpEUG
	oi/sxmCGsKFmFWxzSd7sDaYWQLTAaB+Gl5R5AV/sBisV26wzvETzRBGoenUm5r9+u//hRNXUlm5SD
	doToQCBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP8rH-0000000Az3R-32Hh;
	Fri, 06 Nov 2026 01:35:11 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP8rA-0000000AyzR-13Gs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 01:35:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=otoDkwAxag48j7qlArVgFFgHiTDWK/YJ0JYyTPeyquJCbCMMeNkptwDbxf+1R0JcKawXFmnyyLgD4X57a7PXcQdiStDYZAJwS1922fns4r1bwGygXxQOXOgS9Pu5cIlz5J0y4YybUd+x+hP3JVX0x0h/hgrR/+e4GkqKvSR0AR1fPG60PU4Pv/JaDDU0yUHu9u7MwI+ftha4fI3a8zkUNg6+5GVQr7zkKHoXqiWucGzKUEGUpvFwcOjbOQ3OlcwbEow9+Yo1Qh7mYzAj2Ocq/m2JpD4uNtOnDIyuYHsNHqzFfx+PznoQZgulGwvPhhWcnnCPgFcSvi6oad71vh2mqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDuVqxkdA7TNhtKgzT5nGFPcQOr6c1k+LexfKKs9tpc=;
 b=JI+P95TL4i8e783PWooPJP3AGLZAlh8Gex6bq/59LYZqXxN0IyAPnC14cB5bkcWJrSCAMAv6IFvbt2iDH8oBZdNDRq5m2mGFusoWTri2iV3m0cwEolB4zLtJc9W968v2wJMekILOXpwNqcVFbFkxOzd8qW597e64j9yzXS6mDC3iwXOwP2B971TiHnaCCkiVaoexLrCL2P/t/TtJzvqEi+QXMtS/AknifIqVp6a0JdVfj3u25BkVJvTkQILSF4fquNGWcv9T4GhAD9sVOsdUrEQU0UZop/1hDKUl/039aGdZLnXkGElSj7KqFfgt//B5OA/LIAQ9Nh+8GKX8k7oGKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR04CA0034.apcprd04.prod.outlook.com (2603:1096:990:78::24)
 by KL1PR06MB6179.apcprd06.prod.outlook.com (2603:1096:820:d9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Fri, 6 Nov 2026
 01:34:55 +0000
Received: from SG1PEPF000082E5.apcprd02.prod.outlook.com
 (2603:1096:990:78:cafe::72) by JH0PR04CA0034.outlook.office365.com
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
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 01:34:55 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id B2D9E40920E5;
	Fri,  6 Nov 2026 09:34:54 +0800 (CST)
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
Subject: [PATCH v6 4/5] dmaengine: arm-dma350: Support integration clocks and resets
Date: Fri,  6 Nov 2026 09:34:52 +0800
Message-ID: <20261106013453.1134239-5-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106013453.1134239-1-Jelly.Jia@cixtech.com>
References: <20261106013453.1134239-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E5:EE_|KL1PR06MB6179:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fdc411de-9e19-4dc5-a007-08df3ba62991
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|82310400026|36860700016|56012099006|261021121427099003|261022105027099003|261102123227099003|261022075727099003|261009223027099003|261026140227099003|261028144727099003|18002099003|22082099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: u9HWtFG0cZ5tsq//M2s44itjrAJJwUdTp0qxiO2RDeEMKI5S7lS83dbcgGm47h3+Ue+fFkvdMbihtL6xUyQe0Hp2ffffwOOpd36FKKor4w2POZzhapOxht5FN0sNMV1zg+iLCfJACrEaowS7Q59iIchGCqMyuvSya/Yt6PhQYzkiJOcfvq7JuoXFiTFqwRKbCnMAdO/BIvUjCzOHcTGk27Y/qtAwjfz20r6hKZjqCquNjIZW87vcomAAFEYBw6Z8stEqHc/xCRDOqheNH3WVgxUFc5dlrx/XzY8Vb3DQxZWGeCmoryi6f6Eb/FyRRA+ZKIMq79B0D7r48cqsPT5HqBzJ5scJFI/9bbVmVyX82xnqX6P6bIeRs1T+nlElFHpPkCGgX4vdwLKKxxp51p23F2dnSK2CHzufoI4aEqY20lay/q4IVngbj3D27C56tWuDVI1qKT14fGewt+UDUt93bYiNa1wNM5zfrM/bIjMuwmjOJRB7Owi3EPUcgVjEDSEHJFQeEsMomtpMxrGfCb0S7xonv5UO9PobihE/PHijqekQCLolTPHPhVf2WXfzezeUdBRqB8jt18zL0W5tffvpjYFyLdAf7Ta34WXIipps1pnzo90iBD/jG7tshgxobeKKlYOcT6tUgX6MKLU0fp1niLWYDJD9liEzmi1xh6dcLbcxegHIknWfYdsf8SPNcozqAPQfW7CC4EzaRyyyBUcdcA==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(56012099006)(261021121427099003)(261022105027099003)(261102123227099003)(261022075727099003)(261009223027099003)(261026140227099003)(261028144727099003)(18002099003)(22082099003)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TjA9iEs07O31DBlhdY/u8dQ62EhA5T4pl0BOpj4lmQo4/OsISLNnIzDYQ8AwxGcFzaoIvQ6Qw1NVugWa4YDbSLFdPx6GCITVZpA4T6S1cLc3yIjh1Ux1mEQnhGw8w4zNmmqEwSlHXkUP9RJ6uF/vcc9f1zRsQA0nLFGeM7XLemYAPSqiLuaBnvUefi43+bEntT/Bp1t2vJKkUbpMR+ycbwaWD1d8BZmNJM+4Jj3hu+UxjNMtXKChPfqCLE4yhkIc/dH9/iOqTlYIxMpywhvuGzuWHagAwlfBiHwtaf5dURYwjYLuKReFJWwlRV3uLvyewP8tuQHgA3NXxVEZvydaYgk2SiJHdny396NdbmCBn+ep5NbGT3NxvOVyETwOJxWWBbpwqXLDn7UWv6xo3BTlyhMrLBuy8cHk1QFCXDVrXX1sUwquv6SQpE7+FcPEeBa1
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 01:34:55.6005
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdc411de-9e19-4dc5-a007-08df3ba62991
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E5.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_173504_295996_CB5CA31A 
X-CRM114-Status: GOOD (  12.22  )
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

DMA-350 integrations may gate the controller with a clock or hold it in
reset. Enable an optional clock and deassert an optional reset before
accessing the controller registers.

Use the deasserted reset helper rather than requesting a reset pulse.
This also supports reset controllers that only implement assert and
deassert operations.

Both resources remain optional, so existing integrations without them
are unchanged.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/arm-dma350.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index 608541a04bc0..c0ed7e86a269 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -4,6 +4,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
+#include <linux/clk.h>
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmapool.h>
@@ -15,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/overflow.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 #include <linux/string.h>
@@ -1259,12 +1261,24 @@ static void d350_free_chan_resources(struct dma_chan *chan)
 static int d350_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct reset_control *reset;
+	struct clk *clk;
 	struct d350 *dmac;
 	void __iomem *base;
 	u32 reg;
 	int ret, nchan, dw, aw, r, p;
 	bool coherent, memset;
 
+	clk = devm_clk_get_optional_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to enable clock\n");
+
+	reset = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(reset))
+		return dev_err_probe(dev, PTR_ERR(reset),
+				     "failed to deassert reset\n");
+
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
-- 
2.54.0



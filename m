Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691DB606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 09:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1B5d9hUe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gMnUJ3HSB6w4gtaWT2o5XgljD5jvGPNR/PyYuPCO2Ws=; b=1B5d9hUedDHIBYs7UVvHt4c68A
	2NJ0WFFentJthdIIK7UxSTKHe3EADUXGD4yeC7KsdhC25Vpafof9ihL/tCuBTfPfABTqP3WzFG5p1
	eUUeewyooiy06dpdML8hgzFpAxxKUAIn8kEF1qXYQvQcXmKuft5gh16GT1GkC6gFRYt9lYDnhCCTc
	zLBFw6SJJo/coQKj1Na05qs/22Ju84pOhiclvNWLjZ9QJfpywS9bkhecATKe8nKEwx9DJHndNuIWZ
	U46Q71vpmhoJWR0UFKH7G8EMRpnthVmvcCLaW2bgJz2B2bXYcN2H/YZUz95tFh9wEXkWFgRRbLmz6
	qrJL4VFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBbj-0000000G2QQ-1Sdc;
	Fri, 23 Oct 2026 09:30:39 +0000
Received: from mail-koreacentralazon11023083.outbound.protection.outlook.com ([40.107.44.83] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBbc-0000000G2NM-4Byd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 09:30:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KvsUuTrWeFjDZ/8kNdmt7SV6aS3Q3pMnFtYlY1JBuaf/4gQ9vPUHwDFxm6bTxutn2zemPLvRCGc+Qr80raqvDsaJfrSrEomFBMZJQvPX1lOEvGLIR956j1IFIPQ3dNs0UXsZqvusI05DXBUik184E6Q7QobNGXAAN7y8GH7b4nz4FCRFkmn/NzmjtaLfsaf8HCJVpczagBqR53kIQLd4RlBkbhdp1VRXgUuDTNtrPvKVoVccKzuUfEuSVupAEBHbNt8clYyu0qdKSfV3B1gillk6QQHS9EIOIkiDTNss8z2T4YrmQTUt1oydiwFhhUNO8CmQZCRCuf4qQZo1KPmwtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMnUJ3HSB6w4gtaWT2o5XgljD5jvGPNR/PyYuPCO2Ws=;
 b=Xv/SIkPGkYqcw6ed1sQaIeuQOw+RSE0Z04OOhqJYbhFTp0Dmkhl0/XsXyfbWu6nZzFOF+lj4MOwxohwnXCiEbyqsg7kvvbbKhuq2fNEtyYFFalkRFU0NF7Iylida9SBqwbxjQ6/jlR8M6rymxQsoeU21eZs3bjZDDSFYual/zcxWeZEODdKXXtEuzv3b1vBEFASv8Hpb+yAphZsFKG3n89ehdHIBCgPXU9DTFow5mm5NatBWzfJ9TXSahNYqAvVHQfAbATd9pLUtM34B2q1lhj6jnpmDobIIHhROL95icTLaGN+Tw7hGUa6a6yQcaaKtNqK/K4RfjO66H5OsTF694w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0049.apcprd02.prod.outlook.com (2603:1096:4:196::7) by
 SE3PR06MB9217.apcprd06.prod.outlook.com (2603:1096:101:333::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.2; Fri, 23 Oct 2026 09:30:21 +0000
Received: from OSA0EPF000000CA.apcprd02.prod.outlook.com
 (2603:1096:4:196:cafe::77) by SI2PR02CA0049.outlook.office365.com
 (2603:1096:4:196::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 09:30:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000CA.mail.protection.outlook.com (10.167.240.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 09:30:20 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 238FB40920F2;
	Fri, 23 Oct 2026 17:30:19 +0800 (CST)
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
	Jelly.Jia@cixtech.com
Subject: [PATCH v4 4/5] dmaengine: arm-dma350: Support integration clocks and resets
Date: Fri, 23 Oct 2026 17:30:16 +0800
Message-ID: <20261023093017.3248454-5-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023093017.3248454-1-Jelly.Jia@cixtech.com>
References: <20261023093017.3248454-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CA:EE_|SE3PR06MB9217:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 81533a57-f34d-4117-04b0-08df30e841bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|36860700016|82310400026|261022105027099003|261009223027099003|261022075727099003|56012099006|10067099003|18002099003|22082099003|6133799003|261021121427099003;
X-Microsoft-Antispam-Message-Info: H9YcaW7yQXFRMmx+LeECV5UVbotqL90R1If/Z4UC3mQm0YQNNnKo76wJEYf2AwnUpgcmX1U6HEsmf7SCe8Pfcp+WiAWJXOjZzL0uX/f0arwcw80woZ3jD1nlvRiCvx7OumhxhvzB1zMcF6/Yl+n6Tgp3aIxYwUHeEHMGA/i0ykwFzKFyDmJ22hbRRxnPFGno7oUDZSRCEDvik4AFKc9Qfa2nokr0EbyaM5PROnyj3qJwnQXy4l9iiBGyC9D76X+RtQujxEm0ao4o8FjknjSNDBG492ppL4PNQR90QzAZWB/d8q4Blb+1E4C9R3PBPH1ar52LiUMyAJFTupPCK7M3cUhnjez+wYGH2cxuAl3L2dxI9xQkcoguH+hVQKcvLF82HkxbukMMKHg0BtfT8Zd1AtFNJCWKcFzQ+90MOkQ/6traFQy3pHt77lJ2JpWAxNkelJCyyWa6a8XDaA6jQ0TzRQbO8/QPFZxvapPA+5T0M8RIo4sQ4zSluyUCC79CG0BZGUYLQY2QLQ7T90RXdZwNnM8PDsOz7ssyWdx+EDgEM4x2tJPT01kjLpnKop8Ougl/KkYUrjaktOXxUjGUQDIZ3R3N+4cU1+twS8lZNkuV8Bq7+BggIS+bYFdCksVekKaYFLIqKrtLPfNaH/ElT5ADz3sgXIQZnfS5EqDAeAmZrkADoHEsKb2Jg1vZhDPo+lPw61CL+l+m1fTlf2tSJ5kUYw==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(36860700016)(82310400026)(261022105027099003)(261009223027099003)(261022075727099003)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003)(261021121427099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: D2hxLwNs0S6N3Pl3r5+RgmKxpFtSZSnkkSy4ndu1sRdxlFwfjM2RSUh6nEq1LvD/dKd2Hh5nKNipWhC3CqrRphjIex4Qo2AodLjdx1ooXBC/KxAHUUKeqP9PmrHyaXIVV4bGMstu0/I98p7TbCUUw9Qijx6vrcHJxV+x7BQFRSkhHE4WCjD3KdaVbIyjBg0qzZeizM17wR54txEyhEu6h6yYIgPVbQ7fCph2KHOvCScKaYkGmoWGo7Ea6QZiTYHZdWZzH4MXjXkBZqqy5Jw6opPqYahGZiNJXoIWlDm5/RhAZXdaHuWeTSRDUBe0Z+u+tiMOkGj+ShCl0GmJWN0GNigoU/LEGb2GUtzXWptL7JPjjepcEltjSdUMfjfJfiKPOz2z5SNcIgUGRtxI4+1OnjDWsbHii0mIfG0Xng2ygcrnXx4fBGFd/yiDjD9towp7
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 09:30:20.1273
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81533a57-f34d-4117-04b0-08df30e841bf
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000CA.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB9217
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_023033_042882_E1F3F986 
X-CRM114-Status: GOOD (  12.57  )
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

DMA-350 integrations may gate the controller with a clock or hold it in
reset. Enable an optional clock and deassert an optional reset before
accessing the controller registers.

Use the deasserted reset helper rather than requesting a reset pulse.
This also supports reset controllers that only implement assert and
deassert operations.

Both resources remain optional, so existing integrations without them
are unchanged.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/dma/arm-dma350.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index f62ff6a9f490..9cb5b2f03113 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -4,6 +4,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
+#include <linux/clk.h>
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmapool.h>
@@ -14,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/overflow.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 #include <linux/scatterlist.h>
 #include <linux/slab.h>
 
@@ -1199,12 +1201,24 @@ static void d350_free_chan_resources(struct dma_chan *chan)
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



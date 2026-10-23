Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7D0606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 09:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kibDARky
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=e2DCRe2vxGhYuzWx0kViGsFjMQWVNzYzaZ2IqYJZNzE=; b=kibDARkyIk0w9hh1TKCpS5aHof
	b1fATGMQEuvjR2+JuJv2FSGZYsED06ylxTHhDw4moxuC8yNaQuda5zpp7bHOMGfm7IQDS+Suw+pCZ
	6FWqh7sh9PLDnsGajkKUvtxnby3eAH620cxAqMS/YOYusMG837tRxa2vfPPLuMILIVW8nHm8mb9zh
	WDTkHd3ZaeDnC0pd6nEDjl6j7GKiyHgZ9B0kgpNVZproQbXramqu+pRx41lorq1VGndy2ZtSrtSzw
	/SjBYHohxv8UgQpyLhVJ3TzEP3nyaxHOBf9XvjYj4QGGkuSqWap9nShY9hVwMWCQnD2a6yRtkpQSk
	jR+DGNJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBcD-0000000G2mX-33bE;
	Fri, 23 Oct 2026 09:31:09 +0000
Received: from mail-japanwestazon11022072.outbound.protection.outlook.com ([40.107.75.72] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKBbx-0000000G2Yq-1e7a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 09:30:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d4yC5SNgnxl+D0PLlrzaV/csbG6ZpRowIaEH26tPUrkAaFmMsLRpVRyagzI5Bs2JjJHqhYY2Vz0ChaxBqAI9Datlokp3X/RvR0TDdiEuBwKDPtKIt7zb+C/wdZx7b678dB3gkydTHWMKtqIeqoUpuDwTmt5wfEdd3WlS3EPPwnlCcMoatbnGmDoIuqOuzLUD56V1G0+C60QFWfIZ1qJbsrepciO2n2Iw8HwvtVJQD4+UyYtiPdvZvoA+w6HMxaal3LzpW9w2SD0g3hNHYPCA3Zbzuc81vIVSsMIGs9LCE6SCxN9WbIsaiYI+dOYi4YiqTWEsyjA87caCSGcmDoQN/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2DCRe2vxGhYuzWx0kViGsFjMQWVNzYzaZ2IqYJZNzE=;
 b=RNnQtZ0O/unwNEFQToppYKMhxn5Xfu3cymri8Ga8giMNJlo6slw86TArYq7sMBIEnLQHcpjCpVcaKubA0xkpf+TBSXcTtTVL1kg3o+DEW1mdFsC3KnEqQfWO0i1Nhrcn7KG0TxhCiSOVPAVazq/rui9w33sifAH4gIKXwIS/KUuPY+QGAPli+jlRXpNXqI6mKe0++whnvKuVKMtuUPVJsURi9tliMS7bx4V0MuZu+ky80UcUa7GDPJcebGLKWSb6sYTnMykYaX353cw39Oo4lK/wXxSqNxeJTagEk5bVDAnG6+6TVU9UpXVWEjEjAmT/XAhzntcvUBODsbD3uCTjMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY4P286CA0044.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:36e::15)
 by KUXPR06MB9107.apcprd06.prod.outlook.com (2603:1096:d10:6e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.2; Fri, 23 Oct
 2026 09:30:49 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:405:36e:cafe::4) by TY4P286CA0044.outlook.office365.com
 (2603:1096:405:36e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 09:30:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 09:30:48 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 5212D40920F2;
	Fri, 23 Oct 2026 17:30:47 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com
Cc: devicetree@vger.kernel.org,
	Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com,
	linux-clk@vger.kernel.org,
	joakim.zhang@cixtech.com
Subject: [PATCH v1 4/5] dmaengine: arm-dma350: Honour dma-channel-mask
Date: Fri, 23 Oct 2026 17:30:44 +0800
Message-ID: <20261023093045.3248630-5-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023093045.3248630-1-Jelly.Jia@cixtech.com>
References: <20261023093045.3248630-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|KUXPR06MB9107:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c98be298-2dec-4125-93af-08df30e852b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700016|23010399003|6133799003|10067099003|22082099003|261021123027099003|261022105027099003|18002099003|261021121427099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: OvS5Jk0D1M5ck/XnhwFkSDQBNcyTby2SwzVf7InsLw+mhv1dJdDu9KBNQg3GTAbo6ywBDV+QGKKIFYN8iIOSG5/izI+ZLYA5man82B0OaAoNES6+C9YZZje6sE7kHUfD4/+akU336D73pJo2fzkDF769n1e7LDgSbnYSINRvyt2WgssQIyqIrZF3CzbQl14DQhd5lzzjOHgw0Ozpx3Il7PEPH/60jfwtMIIOV2V3gtkkqLPigmmuW5nJHguOls27DxXYlRrsqo9NcWceyewFVGNw2HZg0kZwd5SdkFcrNXLZgQpMWLSllSK7CDLxrgoRDJeFV7rM47S/Y+A+08GxXwSSpBVJiWTb+/9sgYKWm+81fKv2QW/sPyWxmURafw9VvazBFmu9EObAxbjtUKbov9uPy26uZYCDeAudsyEPg0NdLF5y+LXtsS0jJPb170Y18d/Q/EeVKm6+ClkeISX1CarHszT+yEFXYM8ebkYHnI2DAzPk3vz6Y+/vkZT2owDW3aJX5UT4Cj8JueQKWWjCQ/IXu/uYJ4f0J9qynD61GbrPrNiYNOWAWPswsO2MKY4Sebb2RFr9+sQTzV+nLgg3JeiRqPYuIzbRZUaQt4daVsQ9e0uxsnXeuL+O8HxwFeXrX5EnsSigVxASnaNCMd+YfauEwfgwXK+/g7EGd9DRmd5cNu163oCtah4lIe+HdBDb0Klgmq4TkiOautyIc6NWyQ==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700016)(23010399003)(6133799003)(10067099003)(22082099003)(261021123027099003)(261022105027099003)(18002099003)(261021121427099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1pZE3jklaTHrTu97JW1+yOyxJop/xi0kHk3uoovd/GQTJwiwUrjcYJ5Zgu5Zmn1ZcNupWzOBCf4xWF8VMSuGfcGD3Wi1WW78olD1ju2G7/SerOlh6oJhGhXseMHTMxnNnRhwYxd7Gg4wReh5yeptMk+eQa8VJxgN6BWI+uaJYe3Am1ehrMvusf1EXGDIo5sdZ5nJC6px016QwAsUEr0gea9+MqARs6DDszHtmZtYhOATwxzzZrjEnzM2nHPAspjYkq38XqnW0a2mCWBWkK/Uwjmw+N/Zm6oJnbgNiMfcmCi3+Qkyp/S4PfeaX9Z2UcAjlDE9PgT8Fc/O+gJihC2Mny+5w8vO++nNSEUwCjghGZFZvJQJp7B2bJaQF4e6vts3thq2NqxNAWWEPp43rNYvCAfu8kq2dFximlzIFhNP2f0cmTjhCjnhF5AVplYlR+HT
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 09:30:48.5892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c98be298-2dec-4125-93af-08df30e852b5
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB9107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_023053_614359_9F058EB0 
X-CRM114-Status: GOOD (  11.99  )
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

DMA-350 channels may be reserved for firmware or another processor.
Read the optional dma-channel-mask property and register only the channels
whose bits are set. If the property is absent, preserve the existing
behaviour and expose every hardware channel.

Skip masked channels before accessing their channel registers or
initializing their interrupts and virt-dma state. This avoids clearing
or configuring channels reserved for firmware or another processor.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/dma/arm-dma350.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index 9cb5b2f03113..32ec6f061ee9 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -1205,9 +1205,10 @@ static int d350_probe(struct platform_device *pdev)
 	struct clk *clk;
 	struct d350 *dmac;
 	void __iomem *base;
+	u32 chan_mask = U32_MAX;
 	u32 reg;
 	int ret, nchan, dw, aw, r, p;
-	bool coherent, memset;
+	bool coherent, has_chan_mask, memset;
 
 	clk = devm_clk_get_optional_enabled(dev, NULL);
 	if (IS_ERR(clk))
@@ -1285,6 +1286,19 @@ static int d350_probe(struct platform_device *pdev)
 	dmac->dma.device_config = d350_config;
 	INIT_LIST_HEAD(&dmac->dma.channels);
 
+	/*
+	 * dma-channel-mask is optional. Firmware-reserved channels stay
+	 * clear; if the property is absent, Linux may use every channel.
+	 */
+	has_chan_mask = device_property_present(dev, "dma-channel-mask");
+	if (has_chan_mask) {
+		ret = device_property_read_u32(dev, "dma-channel-mask",
+					       &chan_mask);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to read dma-channel-mask\n");
+	}
+
 	reg = readl_relaxed(base + DMANSECCTRL + NSEC_CTRL);
 	writel_relaxed(reg | INTREN_ANYCHINTR_EN,
 		       base + DMANSECCTRL + NSEC_CTRL);
@@ -1294,6 +1308,10 @@ static int d350_probe(struct platform_device *pdev)
 	for (int i = 0; i < nchan; i++) {
 		struct d350_chan *dch = &dmac->channels[i];
 
+		if (has_chan_mask &&
+		    (i >= 32 || !(chan_mask & BIT(i))))
+			continue;
+
 		dch->base = base + DMACH(i);
 		writel_relaxed(CH_CMD_CLEAR, dch->base + CH_CMD);
 
-- 
2.54.0



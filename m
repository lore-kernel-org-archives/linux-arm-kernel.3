Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D66606AAED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 15:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4muAR/cY;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=DsIPHkxq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zFM+MkcwJp1zO+Y5r/YfnIESelkmYZM6BMS6zWZSQo0=; b=4muAR/cYcjelxiCz14e4u5fehJ
	6aHBR2oN/kE5u0nw+PsYn8xTTzwRPFuwKYi4ThOO2pwYYu8zCwFcK8J0xmwbpuUETU2m4jlHNcT+2
	6y8Q28xJgm7x68Zo5fOE3jFz2OEJ+s9ttaEb0KAby5l3MuCI0DK3rsMEpanq+A6xArs+wuQTzOyJx
	zmA1gLsAqYq+2cGpvMXq0fBx5bYqLA/hx2d4fcEbFe7aWpfwLrU/W7lMWE2RmuesphSjo8Ala/xpB
	O3Ga/l5pDEEbD3hckz0FwfWbcq6t8as4BVq3yCNGxnMyY0F5MjgKyE0UKEzr9J0rZNWeM6zJSse7j
	WMA5gFjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIpkb-00000007uJa-0fzB;
	Mon, 19 Oct 2026 15:58:13 +0000
Received: from mail-japaneastazlp170100000.outbound.protection.outlook.com ([2a01:111:f403:c405::] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIpkX-00000007uHm-2Dol
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 15:58:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJ+G7TIHICGzxSN0PH1pGwfQzuH7VnZEYCX2JxvDfgM563A9sSOOkoNHWzURZMEynDPbCqj0GHFliX+Qwu/EFk9Iw4qNzrEb1AkfdXUbWpH08mhYaT5AQQwgg5GZGqSaeJ04PUtA89stVK26e2Yll9tXqVcEd/dkG3UX/J2oeleOb+GB7mag+1Xv9iZpRNIiggOraHxP2nlOMc9zm779PcfBrzBcWyxcBR5YDWrXpQuIkUP8eQN+lI9OdasBInygn1HTv/O64R721rdddUNbQIuX4N2SXA2CqwO6/097Co/VgPXXUBNcQUiDqdfyR3HCw22kh+i4sFzJgjqnBEzvww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zFM+MkcwJp1zO+Y5r/YfnIESelkmYZM6BMS6zWZSQo0=;
 b=kX3Jmc+0tYYoXEW5TifTQSCfO2r/n23zyN5EuriMaPtMWrWx5x3VXmi8DxRwk5YF3+UAAcpCYu9vEJDAgAYmh+anr3zDsovInsNQzkMIuqURpwesVWal0gElKuVjo2kdqkQ90tqsBob4QOWb8bEjpxy4JEeeTd2d8dP+STGjqV0PBnWGX1OE+Z3RIsGvClnT2XgYKmJ1Hu1V0veIDQekpHndBzFtT/Rijf78JdhCz1w+p7k5row+aD8FZC61mM2rAaRiiw0pOfdwAgnOMXMMOkztjfd7cFTlhH3w0De3NU4iKOTRHQral/edV7gf1xWyTV1QTVB3b5BuqsMYCJRO4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zFM+MkcwJp1zO+Y5r/YfnIESelkmYZM6BMS6zWZSQo0=;
 b=DsIPHkxqSNmMhxFN4gm/xFS4I/GRfsgrsnr9qlWpaGzutVKL5B9XI7j+8onijo9zZL0pJ/KI/Wit5quPnEzjdJhTa3i0d7oaJ255IEzmFjX0kd3VK+itCXL/FxGtzVodZ1lAMe8KsmoeIbZkiRvFWJlDF14eJFzf4jb1ClrjcRc=
Received: from OS7PR01CA0023.jpnprd01.prod.outlook.com (2603:1096:604:24f::10)
 by OSZPR01MB6584.jpnprd01.prod.outlook.com (2603:1096:604:fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 15:57:42 +0000
Received: from OS3PEPF0000003D.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:24f:cafe::79) by OS7PR01CA0023.outlook.office365.com
 (2603:1096:604:24f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Mon, 19
 Oct 2026 15:57:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 OS3PEPF0000003D.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Mon, 19 Oct 2026 15:57:42 +0000
Received: from vm01.adwin.renesas.com (unknown [10.226.93.174])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id A03BA3000298;
	Tue, 20 Oct 2026 00:57:37 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	xiaoliang.yang_1@nxp.com
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: [PATCH net v2 1/1] net: stmmac: Track the TX DMA threshold per queue
Date: Mon, 19 Oct 2026 15:57:28 +0000
Message-ID: <20261019155728.85318-2-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019155728.85318-1-ovidiu.panait.rb@renesas.com>
References: <20261019155728.85318-1-ovidiu.panait.rb@renesas.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PEPF0000003D:EE_|OSZPR01MB6584:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1b85de8a-6217-4d1b-2018-08df2df9b590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|36860700016|82310400026|56012099006|10067099003|11063799006|5023799004|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: kXTSnLYdbiYXVJ+zpdmSjqDfkOJkw/07FKqFVe6ZcPU6MXPlKkBiDiDbdb4jNBEdg7kwhwnwuuueyTBQz09i1R/FFX6+pCOtV+NUzmAmw28yKITw3skDrvlQjYN6YAflXomi9XiumxKWYGGirQpE/NSinbjX6jgBxO4HccEpI19dAUnnvfRQPsLM7XLqxucqNhAC/5+pe9IPl2PqsnQqfEK9JbeW3FOUG1Eeo9S8DWWnc2zz4W8db0FzhUYOWGihGE7cCsBLOWyqiunkSvIN6mSb4HpltnvqGplWP/82UJ3EdsGqcySpjBK1wi39IYVM2SanpwK4RRWAxRTWXHff7ty/viN033JSSRshPFq9m2VoAq6ecfiVIJejYUbX1aEFKTa8kX9fE2E8uZAOZYwIzFLkXcKu++TjIl3kv/zgDC5pV9T0XLoPtATG/P7IaXc7fuBPzcXcAP/VbOegAKwGj3ff9GAyaEAB8e+nakyiLVi4HNhRO6OyUcE/lvmETm5rr3dFGzjw9/KILhBR1DLtCY9QD29mIssqTZmgu7HFeeatEuRTAYW3qy6Of36hQDYCFJ1HF0qIwsHEiohqOK1l034+y/NWC1YFhHv3HMm7z8vUYGSjrqdr75uu3TLDTiYjHavzBWs+9PG7SdsObqiXVL1hKVKQBhwca12J7sFZFuqLXt66gIsmDLiByRFOAzyUHJwt/z8dsMhj46sRrThdIQ==
X-Forefront-Antispam-Report: CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(56012099006)(10067099003)(11063799006)(5023799004)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6OI8SHJ8DKt14ITm2s8M3BTmRO3/7LRgRn69VB733abdL/h5u28NLhohQ4F15NkpYapHFrx11W9iVDEliRfMwUmMCt5lBYLiH2slaAnq4Fj/DUQhMlL4BCGVoufbwcXWqrPWX1DENlTqI4b70/gNL5Tw3g9MucQFJj5pcqexCHU4nmXJS+SekTnw0KWz2a5AaGW+a/bLfOD73GTAM5PrTUNtl0tTYLRJ+kwzoy81eStzgjOuuuLf0/IoBVpQh5nCp1Ejj0fJAHQI3mzOiDzTyE3T25hVO2UCfcxT9KdQ/BG2TW566u9/sSuLY9jtDMN2hExJrtWyuxZ4ObBX0x0xVTcE8y75iJnILMr1x/J5a35ncY7kbbx6wQNWvCKTYhBMevacKdW1LLQ5wO/MX7QCaCJaWh4TtwbCYJ8bO5Erd319VWMDEEbgEPjjniHZfMnw
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 15:57:42.5489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b85de8a-6217-4d1b-2018-08df2df9b590
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS3PEPF0000003D.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6584
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_085809_582908_A9EE3A33 
X-CRM114-Status: GOOD (  18.27  )
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
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit 3a6c12a0c6c3 ("net: stmmac: bump tc when get underflow error from
DMA descriptor") made dwmac4 raise the DMA threshold of the queues that
report TX underflows. This is done by incrementing a module global
parameter 'tc' by 64 on each underflow.

This leads to inconsistent TX DMA thresholds between queues and causes
issues on platforms with multiple stmmac controllers, as 'tc' is shared
by all of them. Once 'tc' goes over 256 the bumping stops, and queues
that did not underflow before are left at the initial threshold.

On the Renesas RZ/V2H platform, which has two dwmac4 controllers, we
observed sporadic iperf3 TCP TX failures:

  iperf3 -c <server> -t5 --bind-dev end1
  ...
  [  5]   0.00-5.00   sec  1.00 MBytes  1.68 Mbits/sec   87       sender
  [  5]   0.00-5.00   sec   768 KBytes  1.26 Mbits/sec            receiver

This happens because the TX queues of end1 were underflowing on a large
fraction of the packets, but the DMA TX threshold was never raised from
the default of 64 bytes. The threshold was not raised because end0
had underflowed first and had already pushed 'tc' past 256. Which
controller is affected depends on which one underflows first.

To fix this, make the TX DMA threshold per queue instead of global.
Each time an underflow happens on a queue, its TX DMA threshold gets
incremented, without affecting other queues or controllers. With this
change, 'tc' is only used as the initial value, and the RX threshold
is no longer bumped together with the TX one, as TX underflows have
nothing to do with the RX side.

Fixes: 3a6c12a0c6c3 ("net: stmmac: bump tc when get underflow error from DMA descriptor")
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
v2:
- Added "Reviewed-by" tag from Maxime.

 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 +
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 33 +++++++++++--------
 2 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 08b68441f9c8..0d717e1bc45d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -270,6 +270,7 @@ struct stmmac_priv {
 	bool sph_capable;
 	u32 sarc_type;
 	u32 rx_riwt[MTL_MAX_RX_QUEUES];
+	u32 tx_threshold[MTL_MAX_TX_QUEUES];
 	int hwts_rx_en;
 	bool tsfupdt_coarse;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 53782ab55e12..7b0aae71005b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2622,7 +2622,6 @@ static void stmmac_dma_operation_mode(struct stmmac_priv *priv)
 	}
 
 	if (priv->plat->force_thresh_dma_mode) {
-		txmode = tc;
 		rxmode = tc;
 	} else if (priv->plat->force_sf_dma_mode || priv->plat->tx_coe) {
 		/*
@@ -2636,7 +2635,6 @@ static void stmmac_dma_operation_mode(struct stmmac_priv *priv)
 		rxmode = SF_DMA_MODE;
 		priv->xstats.threshold = SF_DMA_MODE;
 	} else {
-		txmode = tc;
 		rxmode = SF_DMA_MODE;
 	}
 
@@ -2655,8 +2653,11 @@ static void stmmac_dma_operation_mode(struct stmmac_priv *priv)
 	for (chan = 0; chan < tx_channels_count; chan++) {
 		qmode = priv->plat->tx_queues_cfg[chan].mode_to_use;
 
-		stmmac_dma_tx_mode(priv, priv->ioaddr, txmode, chan,
-				txfifosz, qmode);
+		if (txmode == SF_DMA_MODE)
+			priv->tx_threshold[chan] = SF_DMA_MODE;
+
+		stmmac_dma_tx_mode(priv, priv->ioaddr, priv->tx_threshold[chan],
+				   chan, txfifosz, qmode);
 	}
 }
 
@@ -2822,17 +2823,20 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 
 static void stmmac_bump_dma_threshold(struct stmmac_priv *priv, u32 chan)
 {
-	if (unlikely(priv->xstats.threshold != SF_DMA_MODE) && tc <= 256) {
-		tc += 64;
+	u32 thresh = priv->tx_threshold[chan];
 
-		if (priv->plat->force_thresh_dma_mode)
-			stmmac_set_dma_operation_mode(priv, tc, tc, chan);
-		else
-			stmmac_set_dma_operation_mode(priv, tc, SF_DMA_MODE,
-						      chan);
+	if (unlikely(thresh == SF_DMA_MODE) || thresh > 256)
+		return;
 
-		priv->xstats.threshold = tc;
-	}
+	thresh += 64;
+
+	if (priv->plat->force_thresh_dma_mode)
+		stmmac_set_dma_operation_mode(priv, thresh, tc, chan);
+	else
+		stmmac_set_dma_operation_mode(priv, thresh, SF_DMA_MODE, chan);
+
+	priv->tx_threshold[chan] = thresh;
+	priv->xstats.threshold = thresh;
 }
 
 /**
@@ -8154,6 +8158,9 @@ static int __stmmac_dvr_probe(struct device *device,
 
 	priv->xstats.threshold = tc;
 
+	for (i = 0; i < MTL_MAX_TX_QUEUES; i++)
+		priv->tx_threshold[i] = tc;
+
 	/* Initialize RSS */
 	rxq = priv->plat->rx_queues_to_use;
 	netdev_rss_key_fill(priv->rss.key, sizeof(priv->rss.key));
-- 
2.34.1



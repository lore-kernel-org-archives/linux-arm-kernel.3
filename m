Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6D9606A335
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 05:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X3aXOM7j;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Us0+dQbH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SKAybtCaSespV9yhryUm5dH+x/VTnVxornDOCTSAvpU=; b=X3aXOM7jK2OZw0fNTH96ew/Icr
	PpdU23dLSUD5yabQ274Ka3dGggaZK8d7eF09G7YW5G2yj7yiTSFpVXRQnth2oN34wRE5dB7tlagFN
	Yxc3hyc6ITO4uskMLoje9sZtPcd4h8DpHn4Y3n6eFcAsc1omXqs6fg8zWIZNd/dVOTODDmLdoEAts
	v4IU+3eyHG4v/tNmDVDfLcfsywh7gYTZA1I2Kje9/iLL5DcLpe+gJSakdgOD1M2gPW/iOjuWwxNuG
	cOVLcBvwLQzVFLlQVdDPbVhTMVy+CLIwSQ4kW9obykQfti50+QiKMyMEmHEXD6k0G355SdMQajAQM
	BqgMkzjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpsd-00000007rhU-2GY9;
	Thu, 05 Nov 2026 05:19:19 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOpsb-00000007rex-1fgx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 05:19:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vgd/s7ns10m+jdhmBBinGeOwQYTM3Xk0ZOD0KMK17Gy+YVwpXe35kTU8cYdm7T5fBGOSdpDHf7oDk/DlWIUGf5oahxkPTKhITVVk6qHbHv/98OhteYu0WQpZ5YhWjZgZzMnOvxEX08N6Ym5/YkYEuz+xtUeeNrOuBGARpHYstCN/1zxcAUmm6f/GIegvFl7ymtA0MAHxi3+XdVgiJH2UqENrx8caYibAMzw/L7RppvFlQLmRtinmIAeX6Kq2tgW5f97aaQj7a6Ef+No2gtcmMcw/r8MvEL55CFxWFk3JI5Ml9m/oVnXGCKYkN2UerXM0ReEjzx3Ws5cqnTUWfwTZUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKAybtCaSespV9yhryUm5dH+x/VTnVxornDOCTSAvpU=;
 b=ybq75Rp+Uc6/zos+ygoWFxNOm29oGMCK+Sd7QVmXrNq7M3+G6zFPc+UlEhiV5RO21iX9XPGr3VDPLpCh508vXBWmvRD2m6Tjx5kKQhC1eXj5K/NKyjsQCwPjpw2PnrJ2AkDiHWFB9sp53J/t2swdQjIhKx4y0kJx1itenhulx/FbTUyJnb2tYbRyvRtgdv1Do9505t0plkrVDC6DNd2Ra4wLXkpfvpuy6txp+5Jfr7btvT3zqxLQoWn2tgaR0TIVwj8yMM6gMLPRImWtoZtqlW+f8ZzssG7MC3a4S0HuGDBtOCrpUE4YsGareuTnacXWOPNlarfcR6K9kLMnELPc3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SKAybtCaSespV9yhryUm5dH+x/VTnVxornDOCTSAvpU=;
 b=Us0+dQbH3JM0oBm50j5iUqetK0qVPQxcZBs6coVLW4jAVyxEe3b+I/ogk0UH/mMjbSUpRO1pDRY85sVqJvHgncaaZXgyQNPwi4s28cKDWXog1+tEnrFPRghxXY/sj3M/AN/fCUQOoZg85hj1jHP4l0fz0obqbXgw1ORkS/ETnck=
Received: from SJ0PR03CA0020.namprd03.prod.outlook.com (2603:10b6:a03:33a::25)
 by SAEPR12MB231369.namprd12.prod.outlook.com (2603:10b6:802:204::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 05:19:11 +0000
Received: from SJ5PEPF00000203.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::42) by SJ0PR03CA0020.outlook.office365.com
 (2603:10b6:a03:33a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Thu, 5
 Nov 2026 05:19:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF00000203.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 05:19:11 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 4 Nov
 2026 23:19:06 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 4 Nov
 2026 23:19:05 -0600
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Wed, 4 Nov 2026 23:19:04 -0600
From: Ben Levinsky <ben.levinsky@amd.com>
To: <jassisinghbrar@gmail.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <michal.simek@amd.com>, <tanmay.shah@amd.com>, <ben.levinsky@amd.com>,
	<linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/6] remoteproc: amd_mbv_bram: Restore reset GPIO direction after PL reconfig
Date: Wed, 4 Nov 2026 21:18:58 -0800
Message-ID: <20261105051902.1646651-3-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105051902.1646651-1-ben.levinsky@amd.com>
References: <20261105051902.1646651-1-ben.levinsky@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000203:EE_|SAEPR12MB231369:EE_
X-MS-Office365-Filtering-Correlation-Id: 07c78f21-b182-4853-7b60-08df3afc5372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|82310400026|36860700016|11063799006|56012099006|261022075727099003|261009223027099003|261021121427099003|261022105027099003|261102123227099003|261021123027099003|261028144727099003|261026140227099003|18002099003|22082099003|6133799003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: zYzg5PMXjkeQ0O8yy0n+8J+qnGnFOvY+dP+dsxktoMibioYHDejr/jhuOllnpV5jfOnT9dr2VQO8ur47QV2rK0HiTn3mhM8naZpgeG/4XkZXsgN8etiXdLSahQ6EJUV6FY6xv50s2eQj4olB8kWhLTsyHjudG5FJjlOPY8VYQAPAaNtmP0C2hR4JSYrhzDWYa67r2sCpt9/n0BgXikikpKrL/BCGO5ssWZH2skpVrENvtR0EJlysHDDKtJwBeeCgi/644rrKkwbLeoFsJZvyrXr1AudJU6/D0kMDZv0C3G1JsunctJ/0T3uxZWjC/SmuaSRdubzqpxPaqJTTpk1RRpRm157JsmrtYP7RnNE3GNPUprEYHNb30HN/no/238NAeKnl0S28egf57dc+D+yAcogfCb2PwhWCtaykytNBCYJZLaGWNKdSUNDh5fBSYQRQsB414n2MEyXfRpUXoWiMFMPc4actHkWlHgRm9jEtthwT2Y0846sL2zDOQsuNY91jWpS34rbIaYJzxvvzxQAlmhuKwgvXPj9s+3jmkuEAgpxMHu/qDcxe8jljCpKEk/SmD+NyJ0F2vA/lh8ecfBLYZOTyCsAvpZvSxzp9v0emUDXawYJqweRCvSfbLDU24BhAjEX1dqesIsm2NCAKaV4LP7tjpZ1JGI86aq5eSa9SbsmKHHrgM4rPD4lIoJzfnj4tUcJDzZEbD/TQV4rwFxIziA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261022075727099003)(261009223027099003)(261021121427099003)(261022105027099003)(261102123227099003)(261021123027099003)(261028144727099003)(261026140227099003)(18002099003)(22082099003)(6133799003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1h9x4qGLlx1Vf6C0lPblkNkCCJ8PtXsm9sCwLo0odhKA6uGBU9uBp+Ew/pWvQKQE+xf9D9+yebO0x/tvT3t2A12uln7D64jz7/FBTTHdqh++LFdtMDYV4XxvSyivj6mS2l/AL9vljRy/Z1RSlxys7hPiWY/+tOOeOHelZmm7NtaZTB/qwjTxDPf8FxujvRGtlWdzdxALoyA/Uw29i6TZJPzlpImFHS8T2t37rUtGBNMd+Nb7pJTtqA/T+CQe7DXd+KsUPG9mLnU0gJp/Gy7doHhu/B34oQAznBkvHrM+F3HZIFWX3eXEBjBzagXKyfXahrhpxUjsQjLM1jo9N0uggDF0kR5hXwEnwL1a0HyUrjTBs2x4nAGD8tTEJ5uWJZy+9DPbYCilHkdrzbzyyUOO38PZmoN6tQzH6NOzGAevLelaa03J+hbJCJGEec9CaO8i
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 05:19:11.5004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07c78f21-b182-4853-7b60-08df3afc5372
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000203.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAEPR12MB231369
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_211917_452743_ED5AC7E7 
X-CRM114-Status: GOOD (  15.60  )
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

Partial reconfiguration of the programmable logic restores the AXI GPIO
that drives the soft-core reset to its hardware default direction, but
gpiolib keeps its cached output direction. gpiod_set_value_cansleep()
then only updates the data register, so the processor never sees a
reset transition: remoteproc reports it as running while the newly
loaded firmware never starts.

Use gpiod_direction_output() for every reset transition so the output
direction is re-established, and assert reset briefly before releasing
it so each start produces a clean reset pulse after the firmware has
been loaded.

Fixes: f87b4998994e ("remoteproc: Add AMD MicroBlaze/V BRAM-based remote processor driver")
Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 drivers/remoteproc/amd_mbv_bram_rproc.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/amd_mbv_bram_rproc.c b/drivers/remoteproc/amd_mbv_bram_rproc.c
index 6cf33c7b7e64..da621f62f7df 100644
--- a/drivers/remoteproc/amd_mbv_bram_rproc.c
+++ b/drivers/remoteproc/amd_mbv_bram_rproc.c
@@ -16,6 +16,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/dma-mapping.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -94,8 +95,24 @@ static int amd_bram_rproc_start(struct rproc *rproc)
 		return ret;
 	}
 
+	/*
+	 * Partial reconfiguration restores the PL GPIO hardware defaults but
+	 * leaves gpiolib's cached direction unchanged. Re-establish the output
+	 * direction and generate a reset pulse after firmware has been loaded.
+	 * gpiod_set_value_cansleep() is insufficient here because it changes the
+	 * value without restoring an output direction lost during DFX.
+	 */
+	ret = gpiod_direction_output(priv->reset, 1);
+	if (ret) {
+		dev_err(priv->dev, "failed to assert reset: %d\n", ret);
+		clk_disable_unprepare(priv->clk);
+		return ret;
+	}
+	/* Hold reset asserted long enough to provide a clean reset pulse. */
+	usleep_range(10, 20);
+
 	/* Deassert reset and let the processor run. */
-	ret = gpiod_set_value_cansleep(priv->reset, 0);
+	ret = gpiod_direction_output(priv->reset, 0);
 	if (ret) {
 		dev_err(priv->dev, "failed to deassert reset: %d\n", ret);
 		clk_disable_unprepare(priv->clk);
@@ -110,8 +127,8 @@ static int amd_bram_rproc_stop(struct rproc *rproc)
 	struct amd_bram_rproc *priv = rproc->priv;
 	int ret;
 
-	/* Assert reset before disabling the processor clock. */
-	ret = gpiod_set_value_cansleep(priv->reset, 1);
+	/* Restore the output direction after DFX and assert reset. */
+	ret = gpiod_direction_output(priv->reset, 1);
 	if (ret) {
 		dev_err(priv->dev, "failed to assert reset: %d\n", ret);
 		return ret;
-- 
2.34.1



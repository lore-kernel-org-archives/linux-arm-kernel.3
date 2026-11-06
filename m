Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2193606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qnvCUwej;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=c24nzm2r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WPlVlU2UV9mHMfaomqo6/Sg61l5uabak2Vep0xvsPN0=; b=qnvCUwejKv9vTVFXtC9ayRaUr7
	p0CsiFz4fnf3KEStbKYUiR5d81SjFSD+irH7+Uyx+bE52Jk3WRoT1ezCW6yCHkHvZ+Q+/aEAgT9yf
	5A1FldQhkkHWiXaT3+a22y5n185cUpOuDHgOf31ZCAzAMr+tkrQ723EdgKGh94izUqBxyVfITa/cW
	2wCtq5BTCYJ26UDUC3tGSGKjYmawXV7mZsofDQNR6k3Sl/pHZVhG0vD6TUCxkRxJlR4dzRblIWI0k
	IOO2A1yh4UUB4j7R47G4NeNs7Wuxbg5IAaz63zx83opXsRr+SODd/eKGSE5hvuf3+6G3LNeckLo/J
	n2tb9VcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHUD-0000000C1IW-33LF;
	Fri, 06 Nov 2026 10:47:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHUA-0000000C1Ef-3hXO
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 06 Nov 2026 10:47:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WPlVlU2UV9mHMfaomqo6/Sg61l5uabak2Vep0xvsPN0=; b=c24nzm2rg3a/a3cl+9mmcZmrLX
	zC3ZBOGsdrAO0eambkm+fPmS8owMcv9sv1ICTXyAHa3di5KikdRIK/uI+BDx7fNbHYESRgBL9uCvt
	YPKd4SKaOAW0U4aTHp1LywhuUc3boPZm1hRJNfqSGSbZ/fXflKFcZSOfBNlKb1D5DYnOO54BMy6/D
	q8LST6c2YYLD7LuUtFF4L41tTydvpChDLw0r6V4HUzeLCrYVEsO8GM6jIBATwe18XOQBHKksp4FUO
	w9k9JmUykAg/FBQN9y/efMZUIgVlLKVlNTzbLHQBDL+a9jGgqlNNp0hLsHBos8oyMyGBcXnlLjqFy
	mmBvQO/g==;
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHU5-000000047XM-0mbS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 10:47:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VEk/Iz5eoMkHGHX5GlZfBbtq1/DJmyBodBF879VneXHiGIfHtSu2zUzvLEUkSnvNJPSat9PU1sEWnzJaZbbkHuz9AdMTTi5tCzlCYGWKCtWlF5xRkbHB4yi0h5GPnTuV40Gwvo9I8d7+SwoUSHUoMifJAolqhANWWMzBeSCw3jrH+bHpfbVWCLB0gMUOjsR1r/9ghYKJy7dIH0Mom59NNgW4HabYh2QvwsaxAibtsRssQfsSFbPgzkv0tHxTW7XOYYce176l6D+Y9A7n8MovpxyipnJYIFgbddKOkkHGDsgM8+2MJTeGw/4yFgjC3Wt19DzCM8+aylL7+TjsfZt0Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPlVlU2UV9mHMfaomqo6/Sg61l5uabak2Vep0xvsPN0=;
 b=gU3+PyWTsjFaRp7UajWsX0/GnxU4pFYw1+Jb4XeBndXFYTKG2qQKFzyRnVHh8bSJCizwyhz+CO26TxEV+q7byguE25M2a7fFlkolstOQHP1iZzlVzu2ckg463lqMIfd6EnnIYaV13K7zQ8tOFPfh16C6z6KO74pLCinEJnIVu99I3BxhZQK+Suv/YFWFkrg0wNUa1+BnNLK52r4/q1/RF+QWKldDEUIQbZkEZxaYI7hhPEIsD3mE+geW/XGH5arMuLm3ON3L1nj+ZwKZbFe0W56KcBZyriJTGqCueVrXoSJVTV7FL6tUxMnKet4QDgzxhgiXgtgKv/Ru/GySif6DxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI3PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::19) by KUXPR06MB8294.apcprd06.prod.outlook.com
 (2603:1096:d10:5f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Fri, 6 Nov 2026
 10:47:37 +0000
Received: from SG1PEPF000082E4.apcprd02.prod.outlook.com
 (2603:1096:4:296:cafe::7b) by SI3PR01CA0006.outlook.office365.com
 (2603:1096:4:296::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 10:47:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E4.mail.protection.outlook.com (10.167.240.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 10:47:36 +0000
Received: from cix (unknown [172.16.64.42])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id B4C9D40920E1;
	Fri,  6 Nov 2026 18:47:35 +0800 (CST)
From: Cunyuan Liu <cunyuan.liu@cixtech.com>
To: boris.brezillon@collabora.com,
	steven.price@arm.com,
	liviu.dudau@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gary.yang@cixtech.com,
	fugang.duan@cixtech.com
Cc: daniel.almeida@collabora.com,
	aliceryhl@google.com,
	p.zabel@pengutronix.de,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	robin.wang@cixtech.com,
	cunyuan.liu@cixtech.com
Subject: [PATCH 2/3] drm/panthor: Add initial support for CIX Sky1
Date: Fri,  6 Nov 2026 18:47:34 +0800
Message-ID: <20261106104735.1651267-3-cunyuan.liu@cixtech.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106104735.1651267-1-cunyuan.liu@cixtech.com>
References: <20261106104735.1651267-1-cunyuan.liu@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E4:EE_|KUXPR06MB8294:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 08bd4072-ed13-489b-f634-08df3bf35f09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|36860700016|7416014|1800799024|82310400026|261026121527099003|56012099006|261022075727099003|261102123227099003|261021121427099003|261028144727099003|261026140227099003|261021123027099003|261022105027099003|261009223027099003|22082099003|18002099003|6133799003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: aJP1yRTLnRPT+s9HCOIY9c8PmyfhdRi4Hfk8IXuWlyum7dJ8wO6LyivxkBmQOmmCs90YDebSD8IDA4qJ5VdvvmoyiiCj3lbiVjh1qOKQ1iowkKSShMm6ReBRBSPTCMrgZc/M/Kpnz2wwrFtmwy6uuuxxFE1DB7iQbTy+f/HQEEZl2z8xi/yO7niCFO0g4+Y6Anj/+AxNTghUtaUGebHhZUYl7bvbEOmx/5gpdgLiO02OXVeKORWsvJNgu1uqKKnj6zy2LGB5uDbG9btGzy0pQO0jMeWWhN5ZhDuFpCr3ndiu63GFDFfiCtTAx1CBqQ9seg+fj7t2LBlRRyxGUlfSwdf9yquVYLrGrnZNe0u05lGUOPidjU3lpffxBuJvAhlbzilt9uO11y/2pbHAxunIBOrVFfmhpLhV1BtQXSgf+88mYqMZVR1cxGF4+hC4M9eDwO0VbQq03ojAAYJsiY8dvTLA64nVHhh7oTdQ0UZPEELYbQZHxuqem7I43XrI0VyfaXUJtMSCFd3EAWsbn5Wpq5wB+QTgC12g4CNdPGqIvii2KXapBhtbF/oSnn4vynl2Nt6tQoRUHe2as+Pzki5YaI0oSy5N3khKe7U6GIysb26gqrqF3QaX7T9nL4EvjFVeTgasUW45pz7UE0mmFHNu2K14WmwVzRHeHsIp40gNVMmZ/Opw7DCtCbGjm2sxqkrPsfksZCMCmh24bGBIOROmEA==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(7416014)(1800799024)(82310400026)(261026121527099003)(56012099006)(261022075727099003)(261102123227099003)(261021121427099003)(261028144727099003)(261026140227099003)(261021123027099003)(261022105027099003)(261009223027099003)(22082099003)(18002099003)(6133799003)(10067099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rhqusBKyonV5xorBIASXDSIv+G/WZ+ptxkOTELtTZpTyN6d5q1EpsF80L1cVPUTQww9k6WMEOcNNkLZdjNyQc4NOwHJsQMh1FourJ6Q3zF8vwvgngMaOJ6NVbc4Pya/LEthXW7CbFMYG9dhUTAmDu7iK/CO6FhOsK8Jgg98foP0/ZbgfUqvQE8gSKe981wcu+mgxvlE66pRc6mA6NufrN0xRxTbV+nYb3v89zvz1Z9oz2zXpkIBE16xC75PQOsPdoWWYubIFojuJh8OAnQ0sg/m6ryAQX+4o2hwduED7Dk9W3bfraMe3fyZd72IuEq4fRNcPNzDyHTcExbCyYaxs4aNNNA7dDl9wj1CC8fthM1/ovXUbD1te+MrMXBhOd5Bo63SecrPa1LXGBQCr9ax3ePi4Hru7wybws8MhD/Sg0i8AMKJmQe+ieBQPubyZqF0D
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 10:47:36.3687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08bd4072-ed13-489b-f634-08df3bf35f09
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB8294
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_104749_353984_E4D74AB3 
X-CRM114-Status: GOOD (  24.91  )
X-Spam-Score: 0.0 (/)
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

Add Sky1 SoC data to support the external reset and system-level cache
settings, and to skip devfreq.

The GPU on CIX Sky1 needs an external reset before the driver first
accesses the hardware. Without this reset, the GPU hardware cannot be
accessed correctly.

Configure SYSC_ALLOC before L2 power-on. Without these settings, GPU
rendering results are displayed incorrectly.

Keep the clock settings provided by the PM firmware. This first version
does not read OPPs or enable devfreq. It does not register a GPU cooling
device.

Tested on Orion O6: offscreen pixel readback, kmscube, glmark2 at 1080p,
runtime suspend and resume with a retained EGL context, software-triggered
reset-worker tests, and module unload and reload. Display tests used
local Komeda support.

Signed-off-by: Cunyuan Liu <cunyuan.liu@cixtech.com>
---
 drivers/gpu/drm/panthor/panthor_devfreq.c  | 11 +++++++++-
 drivers/gpu/drm/panthor/panthor_device.c   | 15 +++++++++++++
 drivers/gpu/drm/panthor/panthor_device.h   | 25 ++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_drv.c      | 15 +++++++++++++
 drivers/gpu/drm/panthor/panthor_gpu.c      | 14 ++++++++++++
 drivers/gpu/drm/panthor/panthor_gpu_regs.h |  2 ++
 6 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
index 2249b41ca4af..1914549f7b1f 100644
--- a/drivers/gpu/drm/panthor/panthor_devfreq.c
+++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
@@ -154,6 +154,12 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
 
 	ptdev->devfreq = pdevfreq;
 
+	/* Keep the firmware clock settings until Sky1 devfreq is supported. */
+	if (ptdev->soc_data && ptdev->soc_data->skip_devfreq) {
+		ptdev->fast_rate = clk_get_rate(ptdev->clks.core);
+		return 0;
+	}
+
 	/*
 	 * The power domain associated with the GPU may have already added an
 	 * OPP table, complete with OPPs, as part of the platform bus
@@ -323,8 +329,11 @@ unsigned long panthor_devfreq_get_freq(struct panthor_device *ptdev)
 	unsigned long freq = 0;
 	int ret;
 
-	if (!pdevfreq->devfreq)
+	if (!pdevfreq->devfreq) {
+		if (ptdev->soc_data && ptdev->soc_data->skip_devfreq)
+			return clk_get_rate(ptdev->clks.core);
 		return 0;
+	}
 
 	ret = pdevfreq->devfreq->profile->get_cur_freq(ptdev->base.dev, &freq);
 	if (ret)
diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 9687c59de350..1d682731a181 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -229,6 +229,13 @@ int panthor_device_init(struct panthor_device *ptdev)
 		return ret;
 	}
 
+	if (ptdev->soc_data && ptdev->soc_data->needs_external_reset) {
+		ptdev->reset_control = devm_reset_control_get_exclusive(ptdev->base.dev, NULL);
+		if (IS_ERR(ptdev->reset_control))
+			return dev_err_probe(ptdev->base.dev, PTR_ERR(ptdev->reset_control),
+					     "Failed to get GPU reset\n");
+	}
+
 	ret = panthor_devfreq_init(ptdev);
 	if (ret)
 		return ret;
@@ -511,6 +518,12 @@ int panthor_device_resume(struct device *dev)
 	if (ret)
 		goto err_disable_stacks_clk;
 
+	if (ptdev->reset_control && !panthor_device_is_initialized(ptdev)) {
+		ret = reset_control_reset(ptdev->reset_control);
+		if (ret)
+			goto err_disable_coregroup_clk;
+	}
+
 	panthor_devfreq_resume(ptdev);
 
 	if (panthor_device_is_initialized(ptdev) &&
@@ -553,6 +566,8 @@ int panthor_device_resume(struct device *dev)
 
 err_suspend_devfreq:
 	panthor_devfreq_suspend(ptdev);
+
+err_disable_coregroup_clk:
 	clk_disable_unprepare(ptdev->clks.coregroup);
 
 err_disable_stacks_clk:
diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index b55a3f9edd41..0923cc5df042 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -19,6 +19,8 @@
 #include <drm/gpu_scheduler.h>
 #include <drm/panthor_drm.h>
 
+struct reset_control;
+
 struct panthor_csf;
 struct panthor_csf_ctx;
 struct panthor_device;
@@ -34,10 +36,30 @@ struct panthor_pwr;
 struct panthor_vm;
 struct panthor_vm_pool;
 
+/**
+ * struct panthor_sysc_config - GPU system-cache configuration
+ */
+struct panthor_sysc_config {
+	/** @alloc: System-cache allocation policies for GPU access types. */
+	u32 alloc[8];
+};
+
 /**
  * struct panthor_soc_data - Panthor SoC Data
  */
 struct panthor_soc_data {
+	/**
+	 * @needs_external_reset: Reset the GPU after enabling its clocks
+	 * during initial probe.
+	 */
+	bool needs_external_reset;
+
+	/** @skip_devfreq: Keep the firmware clock settings without devfreq. */
+	bool skip_devfreq;
+
+	/** @sysc_config: System-cache configuration, or NULL to keep defaults. */
+	const struct panthor_sysc_config *sysc_config;
+
 	/** @asn_hash_enable: True if GPU_L2_CONFIG_ASN_HASH_ENABLE must be set. */
 	bool asn_hash_enable;
 
@@ -138,6 +160,9 @@ struct panthor_device {
 	/** @soc_data: Optional SoC data. */
 	const struct panthor_soc_data *soc_data;
 
+	/** @reset_control: Optional external GPU reset. */
+	struct reset_control *reset_control;
+
 	/** @phys_addr: Physical address of the iomem region. */
 	phys_addr_t phys_addr;
 
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index dc8d0191aef4..766df6505a7b 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1872,12 +1872,27 @@ static struct attribute *panthor_attrs[] = {
 
 ATTRIBUTE_GROUPS(panthor);
 
+static const struct panthor_sysc_config sysc_config_cix_sky1 = {
+	/* Sky1 needs these SYSC_ALLOC policies for correct display of GPU output. */
+	.alloc = {
+		0x00230000, 0x00000023, 0x00000000, 0x00000000,
+		0x00523222, 0x00523200, 0x00000022, 0x00000032,
+	},
+};
+
+static const struct panthor_soc_data soc_data_cix_sky1 = {
+	.needs_external_reset = true,
+	.skip_devfreq = true,
+	.sysc_config = &sysc_config_cix_sky1,
+};
+
 static const struct panthor_soc_data soc_data_mediatek_mt8196 = {
 	.asn_hash_enable = true,
 	.asn_hash = { 0xb, 0xe, 0x0, },
 };
 
 static const struct of_device_id dt_match[] = {
+	{ .compatible = "cix,sky1-mali", .data = &soc_data_cix_sky1 },
 	{ .compatible = "mediatek,mt8196-mali", .data = &soc_data_mediatek_mt8196, },
 	{ .compatible = "rockchip,rk3588-mali" },
 	{ .compatible = "arm,mali-valhall-csf" },
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index a383b04f101e..9a6963fe62ae 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -63,6 +63,19 @@ static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
 		  ptdev->gpu_info.selected_coherency);
 }
 
+static void panthor_gpu_sysc_config_set(struct panthor_device *ptdev)
+{
+	const struct panthor_sysc_config *config;
+	unsigned int i;
+
+	if (!ptdev->soc_data || !ptdev->soc_data->sysc_config)
+		return;
+
+	config = ptdev->soc_data->sysc_config;
+	for (i = 0; i < ARRAY_SIZE(config->alloc); i++)
+		gpu_write(ptdev->gpu->iomem, GPU_SYSC_ALLOC(i), config->alloc[i]);
+}
+
 static void panthor_gpu_l2_config_set(struct panthor_device *ptdev)
 {
 	struct panthor_gpu *gpu = ptdev->gpu;
@@ -317,6 +330,7 @@ int panthor_gpu_l2_power_on(struct panthor_device *ptdev)
 	}
 
 	/* Set the desired coherency mode and L2 config before the power up of L2 */
+	panthor_gpu_sysc_config_set(ptdev);
 	panthor_gpu_coherency_set(ptdev);
 	panthor_gpu_l2_config_set(ptdev);
 
diff --git a/drivers/gpu/drm/panthor/panthor_gpu_regs.h b/drivers/gpu/drm/panthor/panthor_gpu_regs.h
index 4c5b953796e4..f9b65a4dae83 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_gpu_regs.h
@@ -116,4 +116,6 @@
 #define   GPU_COHERENCY_ACE				1
 #define   GPU_COHERENCY_NONE				31
 
+#define GPU_SYSC_ALLOC(n)				(0x340 + (n) * 4)
+
 #endif /* __PANTHOR_GPU_REGS_H__ */
-- 
2.53.0



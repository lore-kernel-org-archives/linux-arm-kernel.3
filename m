Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2443E606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 13:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v5atgAYb;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=EDJj4Sfc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=x+x3myP3dhgp56Q/KxWhhIcXg+i8PROVfJPxptEdG3Y=; b=v5atgAYbhhvvWZ
	McMRc/Xc4J+nVl89LYSMQffEGM+TtVr3Bt7WWgTh7PGKOyezle9yoykYCH/GvEZFJUZ3SmO7RPlEq
	Bfn1+UsQT2PFtypDkP+jh3aQRTvSsZhxEKxwg+EzDlQOWZsFQbshhBFZwlvxh2lJUtXROB99kDq2F
	xS74PIHrmo/KeSl1SdjaBqmS+/ZFOc3yWvzoJVPhYDl99SbnZ6W4G/WeiQ1q5JWlyU74bfKf2Z63l
	XUnyIIJ617fBZh+1BKqlbXw75zOSAS/FjuGHQItueA/sxOqW6Evr3VzEdDxD4X0bcutHV4ZOxBi7s
	sOOurSa4IHojdHElm0/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFJq-0000000GNIN-023V;
	Fri, 23 Oct 2026 13:28:26 +0000
Received: from mail-westeuropeazon11013044.outbound.protection.outlook.com ([52.101.72.44] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFJg-0000000GNDy-2e9Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 13:28:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gyLZDXmFI2Z/FMhN+DUYw6vJ/0SV3Lg3WrQQPh0U7RD2UoZbHxxLNma5MzueefoTBQ/HH1a1amQiyKmMS1iBb7sbqxygLITtTeyCrBVZDJbUzZzUpGSZjAk1heNRnieHJRS2t2oqV6KXnIyvDFFVAO7NiLOeufQpHIdCUCBFICH3nMrs1ql3vnd9/M2VlH1VaxEnVh62i2HI803rUAa3RaZaWnsAY9zAGMe7SSozCwW6S+ue9tWxagw4liFdvO+zJl5gbWsKY4rmZXs4v70NsFj15+f0bKY6VpahTWY81RYsPsTuqdeytnop5wyID9jH7/uY19mSecllc813D20Tsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+x3myP3dhgp56Q/KxWhhIcXg+i8PROVfJPxptEdG3Y=;
 b=eKRopNif1/Wm4voAJI66lIQKlzRCxALkDTgaT/bvtXXbMOjUVOHUt8kNX5AtJQ6Uh+RG1WavNG8eby0pGiT8uRvadKT8EyFzsbkTtZSCX2n1kfA03KEeX1BjPsZpYVq4c6rHLYg3gV7IW7aO019FRkkG4Zop0We/LbzuFgGYVuWZ03p4cluH9EXEEyG2skMCnuTfANyrqB4M39CcP/HIi4sf3UH/rrLx+tbo3ewa//FEk9LWEv5aVW6+rvm8ZnziHwskOxgjx0nnFSnGRwbdJEXzy34WZ/KyU8ySubnb1Ah1dmVV1bhSdgUIZKiHB9IOUTLDMsA5d2nYAtIVTTOQnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+x3myP3dhgp56Q/KxWhhIcXg+i8PROVfJPxptEdG3Y=;
 b=EDJj4SfcQ3UgkDfmJd5MrSrlhsjfKhxMP2l11Ab+DjNYow3k8Kj0AdmD3h64ufCQiV5E0qjU8Dt+XSnskrB+ebGN8PwpRWFD7gcPCOy3QtL1ZpSVng2zzbKn2YvuOw/uI15eWO0mim8VNcv85D//ZeAJmXXWlfc4+FznvmWYYlV6ECz/U9OFJItB96Ltlgkn6AbCJAiLCqXVECfga+pzO0hpzVjZwglxRvi7DlrfFxLGNklSRxyOuZ8UELGYzvN+hLw67GjM2y/C3mJ366OlPjKClCBVetjYdKkdPqo5QTrNQZo7cDD7LjbI8nPiRhQOT2L/P0zkVFz/u85GxalSog==
Received: from AS4P192CA0023.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::9)
 by DB9PR10MB7171.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:453::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.3; Fri, 23 Oct
 2026 13:28:12 +0000
Received: from AM1PEPF000C1AD6.eurprd02.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::a9) by AS4P192CA0023.outlook.office365.com
 (2603:10a6:20b:5e1::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.19 via Frontend Transport; Fri,
 23 Oct 2026 13:28:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM1PEPF000C1AD6.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Fri, 23 Oct 2026 13:28:11 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 15:28:30 +0200
Received: from localhost (10.252.9.175) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 23 Oct
 2026 15:28:09 +0200
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Fri, 23 Oct 2026 15:28:08 +0200
Subject: [PATCH 3/7] clk: stm32mp25: update register with reference manual
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261023-ups_mp25_clk_update-v1-3-e906e7a38cb3@foss.st.com>
References: <20261023-ups_mp25_clk_update-v1-0-e906e7a38cb3@foss.st.com>
In-Reply-To: <20261023-ups_mp25_clk_update-v1-0-e906e7a38cb3@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792762086; l=760;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=IR7Qf83XRHd9KKifUWIA16iA5fTVyfnLbI2U7E5fr7U=;
 b=SwJI4vx4MdEbxD8eYkRhKOyyxLyTjT+/zsBEPFEHKe/RkfyleH6bmJbd7AapYzcHMkhmTHooV
 OlYPAmA5N+VD8UyaXgDzY3EHs7NMninVQsTkPd7OVIFIMd+oWJQSNc+
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000C1AD6:EE_|DB9PR10MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f38e9fc-ecc8-4580-6dbc-08df31097c13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|82310400026|36860700016|56012099006|11063799006|261021123027099003|261009223027099003|261021121427099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: RbcmSY4yg2Zag6gvQLQiSiA2xwjr//Yqv2hMMQ1KiFbNAbliq5S+bDCZRvLZl6NVmyu3YYFhPUkU4rtPuC6/adLGxx9hRHMVX2yIUPY3Vg2L0Wm4eCK0cmboohUJl/bDKMBsgDAUbQFuguhGg2a5+PBUp3yRzbKfdddR8kuRY4/URWLgX+tfkQwg3ClYgB8AFftJK3xkJ8KnLXGb6yw5kzLc2Lqmj+682urMmWXkJ7dqPlS6UaGJV3eVY+IXwevErpdP1cbLoDcmueRR8dK4Kqlkc/P8bFBG46SGhgIZg24/8Us9PPnyILkGxF+84Tvjv6OUtzkZPHI6vYSHWY7HanQ9s+H2dD0ltJ9XprCh4F+mLLr6Wn6T7WifulP5EnrxghQFhGGfNgHGbRuwzvz15PcR6wOho3tUV1TvMp4oHksiKmw3lmxtnyWJxvMqcryc1LeIJO1JwGrxwMuKOTQWrSTukP5K6CFXY1Nlf6uiUnIYNq/0XWYvqkYx4sB2OUZQZSucWG8qEHKH7OjG+DjCr+xhuXGdrtjL29ZCg03JmFk4bTRC64k7TM3x1jXajAGjt7HKIzHc0gztXvODVN4AXurFcdxzvGhztLBwRdhnRWgyor4GkE/xE9knBywWYF4Ik6W7GLbK03cMOBSi22YXafH6+Pjoq1y7j/t8EvO6Ph8eJurR+dxP1JkhjESWb8BF7HsAcUdOzgTDCFwz8W6wBQ==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(82310400026)(36860700016)(56012099006)(11063799006)(261021123027099003)(261009223027099003)(261021121427099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cHIPP098Px1ZoODJq0Tc2FXHXfxAx1H2U9bAdHRawJ/lmjv3aS3TGJJhpRTOnkuHyAENiFmPzAr4uvyaZocbYUwXa+JIQ32aRxbobDZqoMcvZQIMxW/CIhwYXimSGGKKEOD3U/0tMzmtp6Fk5Plauj29d5bfCMRm0/Xgbh+DnNA9nyKotfyEMtiBJ2Volbpwj3oyd+wsBw+FKOAlSPS9GOs8TepAJfLff+zIi62cFjJRyuac+aJXrHhaFMHiqVsmmE/t5MKCXctqZa4zgyKgYOQ/I/GsqxfdrWXQ7K6Goo1/cWXKw9fHXnES/SMUlbiKnkfJWyCE70DP9Vk3KhhybSHu8bG0gV1TfmyszeqNs9q/Kr/iwmnEVkMUp9WoBFHZzUEb63sLntSN6gjCbCHZZIqbHpjqcZyttI9JZ4mW9m6gXiqozvrTCOqoo6MBZL9/
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 13:28:11.5119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f38e9fc-ecc8-4580-6dbc-08df31097c13
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000C1AD6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_062816_678388_8D72EF91 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Rename RCC_STM500CFGR into RCC_STMCFGR to match the reference manual.
No functional change.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 drivers/clk/stm32/stm32mp25_rcc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/stm32/stm32mp25_rcc.h b/drivers/clk/stm32/stm32mp25_rcc.h
index 687bc6a78627..421c74dadf8c 100644
--- a/drivers/clk/stm32/stm32mp25_rcc.h
+++ b/drivers/clk/stm32/stm32mp25_rcc.h
@@ -319,7 +319,7 @@
 #define RCC_OSPI2CFGR				0x518
 #define RCC_FMCCFGR				0x51C
 #define RCC_DBGCFGR				0x520
-#define RCC_STM500CFGR				0x524
+#define RCC_STMCFGR				0x524
 #define RCC_ETRCFGR				0x528
 #define RCC_GPIOACFGR				0x52C
 #define RCC_GPIOBCFGR				0x530

-- 
2.43.0



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9812960A2600
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oB1y6LCM;
	dkim=pass (2048-bit key, unprotected) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amdcloud-onmicrosoft-com header.b=gGoQhJ4C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eovo9E3TkWEKqlfEpGfcreWTGJtPYIimMj2M7HliDLk=; b=oB1y6LCM4D6wJm
	vhWhGRPBe+Xn0nLxsmWTnhNXXe8OTQ5+wCgAImpZFjMEyuekGpXELN8H+hkJhhbwup1YUOFnZvndP
	NCrbWoCRskvfUNgLRrm3Xj8gJ49VS5zXCVzWznYJSu1lXulm/7633ds0QI383+HY1P+DaexhpxbaT
	nJ5bOaDA/E7RL+UlmzuO+kDyhF2ZSK6N76X+OHY/cSvhifjgzX4oRMO+yDUQZscLTux8QXS728WL1
	FOuq3Y7t84LzsJjtIx3mhTQj/OmQcxYpouYHDFQczwCReTNpWESSAhpDaPFQryRUjw0vzMR2i9Tiv
	/NuozpuDYn1p4U29bYzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQOa-00000009NTA-12C6;
	Thu, 29 Oct 2026 13:42:20 +0000
Received: from mail-westus2azlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c007::2] helo=MW6PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQOG-00000009NBq-0hCe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:42:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPHPXa438Eeaofqc4ediYCvukbJOAy8s9tyiSv+dUIKu3YJTrLppJorAI43PVa9HA9qtRh7+QSQzj4I+ydxGTIVXoonkiSQGvei2T2fObq0nEE2GJ072wgOfjGz7B/oZt3/QZX3MarOrYHetcKxYME+jX6/+BBUHDPNK0D0XvrXODZ715Lc1zlkY1CzCUAeVLbi8Dt96cjHTfnBI/m3XEMkq/I8EPEiyFBzt574LnwHJeRKX19q17A5+fCuoMOz40CnCL1t4LJ5Yt7WbjFRZHVbQq4S3W72z9m6SHLM8CtHiF9J7ZrHnPjgcouYuHYDPD5C7mLwspsIBNdEP1mhcTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eovo9E3TkWEKqlfEpGfcreWTGJtPYIimMj2M7HliDLk=;
 b=MJK0kCjdcPowrAOlvpEzQz9sddYPpch6oqplcvdkWXsRehR+3kj7K8fXkSuAWsGId5XhttDZA0ypkQ7hkxL64N8KzgF1L3tAX5skrayop1BCjrixtdgcg2/rr0c/GQOJ1O2bFUNkJ5a9r7Vsbif5sLB6NGUAPNfOBXDUoYMmOjyT+dqvUef8c8T6N/zmprtU7nbuR+8U49CMkR7HRKp8io6dKb9lqlZIwCzs27538XBn9t1hnBlw3uf+1/jxHySBcbY3AWTlSdVE7Dh7yvBx6o1UXhkPrubDXUkIGrsJEdgK0Ha1RbEXhSGwA+T8SPrHG7G8j9K3KmCghgPQpBFzmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=aspeedtech.com smtp.mailfrom=gmail.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eovo9E3TkWEKqlfEpGfcreWTGJtPYIimMj2M7HliDLk=;
 b=gGoQhJ4C+EFJK2K1nBCGyrqitaButUjnLKVlCx6DMCBcN6u/8JLnhsWvalrs7pqopTszCM2GkQrfTQuUU29pLydxc9RADEi1hZvHqdb/NNDtrf5OrRtsdt1wldAj2a4xci7OqRrgctisBQDZPRUrIJrap8jn8GzT5X2Tpb5981NeDGfchKdA2lZ4ek3FkDDp5gu42c/U/aqZwIJXcNkvcERiKKdvlsocsIgHG6ax+hJu+USu7k1gpsA2aq/pz1bNTJV71VY3DauM0AcgHgHWfs8qx5lYkmFYHGU2jDSXmx6WAAuE+kydlavJBqPM2yagSnCCto0ftFZ0CZiYXpFZrw==
Received: from CY5P221CA0111.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:1f::25)
 by IA0PR12MB7554.namprd12.prod.outlook.com (2603:10b6:208:43e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 13:41:49 +0000
Received: from PH3PEPF0005961B.namprd05.prod.outlook.com
 (2603:10b6:930:1f:cafe::12) by CY5P221CA0111.outlook.office365.com
 (2603:10b6:930:1f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.7 via Frontend Transport; Thu, 29
 Oct 2026 13:41:48 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 165.204.84.17) smtp.mailfrom=gmail.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 165.204.84.17 as permitted sender)
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH3PEPF0005961B.mail.protection.outlook.com (10.167.243.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 13:41:48 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 29 Oct
 2026 08:41:43 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 29 Oct
 2026 08:41:43 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 29 Oct 2026 08:41:40 -0500
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 29 Oct 2026 21:38:37 +0800
Subject: [PATCH v10 08/16] ARM: dts: aspeed: anacapa: evt2: Add shunt
 resistor values for HSC monitors
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261029-anacapa-devlop-phase-devicetree-v10-8-26ee3cf9d9d0@gmail.com>
References: <20261029-anacapa-devlop-phase-devicetree-v10-0-26ee3cf9d9d0@gmail.com>
In-Reply-To: <20261029-anacapa-devlop-phase-devicetree-v10-0-26ee3cf9d9d0@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>, Peter Shen
	<peter.shen@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281119; l=2046;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=2hNvv3dzcGY7YC5SlE8BBJWHSA7m9aG/DD9F7WuX2b0=;
 b=hjJ9HOPmS+wKVheTzney4r2Bf28uNfRnkRJoLHni3sHV78vFVXvdFWeq7bSPpLXV7VJKGM4qJ
 PLpVKOLOcjcBjW3e0/NhZ/Nisbb3Y85pdZUt9zH3QZV4olzOQaeYlip
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PEPF0005961B:EE_|IA0PR12MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: 14906b39-f1a1-4209-dd43-08df35c26193
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|61400799027|35950700016|7416014|376014|48200799018|7093399015|82310400026|261028144727099003|56012099006|11063799006|261009223027099003|261022075727099003|261022105027099003|261021121427099003|261026140227099003|10067099003|18002099003|22082099003|16102099003|4128699003|6133799003;
X-Microsoft-Antispam-Message-Info: nkyceT8eyyhPswgIM2gfgi0DftjsEWES+elu+SFVwAN0TowB4ypPEgD2u9XQLfZtIiUb68mTSbhjlowhegumUE18DNUnuI5BhZ+U5ukUf+64n9tIUGoTlf0qkKOXAMKYQksugCRFJca9v9RrIYZrqAPskuNbZHK6BHJyLsNxAhY/Ss4vyG2lWHEFpIEV6s0kO3JwiL0J3zm2I0XR0Na6PyYeOqu457Kt9HQeT30tyKsXPkrrxgu4kJKWCwoHqMKtouM1MLheBIWwO5vpZu5NkxEXKbmjaidfa3uT6+LzOt/ra5PaUP9XQ5OvDZ92mn1/reNJqrNAg2FE2UTQa+EQBAULuKTpGgVik3jeDaxkPtD+cQy5aIt+RSbTmWhuPJZb012f6gypHmIx8NoX46cvLBnKlymMPp+j/oJfyS8b2YjE1huV3h4Z70rReyAk1QPsdabITNLEO48c74a9NaNlbVQyHCccvWa0wFGUz0ebJZkNim0nL5h7iehj8FH/f1sE6AhNKW9ZsmvV28bwe2Z+RBIdijEsvQSupE7HhmBRrR67u8dDvuZG61xxOtH40I4bBvhEjEvMnUwOAYmWPMGfavwKEdPr5/07qdXwzI4qwgftT/DHxqkiEYVJGp1j1lVmf1jGZSExfLfNf3wqqtJWc3L9JcQbP1DwoP1gyHYQtxmxTWKQED0qTBAWDlPsRcWKFbQkxfVRv1k6hho07T519A==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(35950700016)(7416014)(376014)(48200799018)(7093399015)(82310400026)(261028144727099003)(56012099006)(11063799006)(261009223027099003)(261022075727099003)(261022105027099003)(261021121427099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(16102099003)(4128699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kJ3op4OvhYBZgeC3wuJAhcWY906CYIZjmfXlzn5MaEVgjGDGXnfG/nMshq5s8+eNtnvNUHqEPG7ji9Auq80Pbva4djMS4g4GFBk5VoS7wKBLsDqKOlAgxbMgvAhxY8TOGnrRKkF6OD0R8N9sZgP6hvqxyu9wsGLgRK/zDMPx1rkmXLyTRpZ1iZjVE4tTLzbpH7pHnlqpw1T1/NBW32U/b/YbFqpX6hHYfV9GsNXq+6IgsRJdtF4AS0v1Ul18Y+O3wW3fu4szTnCCrjuTSymDA7W247r6UPna6fyXXS4uIj5mQLoruy8I+14gwJwXbm4KpAFmemqoPTqNbvuBrKE1cAf2etCDr81loAg8n3Z1n6y33d9tbb+2/ZLe0nFSRGrCS6AKyTZ4fBYUVZnQddADzbki43HMJiXyom3nAFlgXTYdFUIdQAd+m5X6e8qcSvX1
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:41:48.6266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14906b39-f1a1-4209-dd43-08df35c26193
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: PH3PEPF0005961B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7554
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_064200_254797_34CFE4F8 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 1.1 (+)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,WEIRD_QUOTING
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Peter Shen <peter.shen@amd.com>

Add shunt resistor configuration for LTC4287 hot-swap controllers on
Anacapa EVT2 platform.

The resistor values are required for accurate current and power
measurement by the driver. These settings reflect the actual BOM used
on EVT2, where different sense resistor values (150 uOhm and 250 uOhm)
are populated across rails.

Without this configuration, the reported readings would be incorrect.

Signed-off-by: Peter Shen <peter.shen@amd.com>
---
 .../aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi   | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
index ab16e5ad5871..5f849bd21fe0 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
@@ -37,6 +37,30 @@ gpio@24 {
 					"RPDB_FAN7_PRSNT_N_R", "RPDB_FAN8_PRSNT_N_R",
 					"", "";
 			};
+
+			power-monitor@42 {
+				compatible = "lltc,ltc4287";
+				reg = <0x42>;
+				shunt-resistor-micro-ohms = <150>;
+			};
+
+			power-monitor@43 {
+				compatible = "lltc,ltc4287";
+				reg = <0x43>;
+				shunt-resistor-micro-ohms = <150>;
+			};
+
+			power-monitor@44 {
+				compatible = "lltc,ltc4287";
+				reg = <0x44>;
+				shunt-resistor-micro-ohms = <250>;
+			};
+
+			power-monitor@45 {
+				compatible = "lltc,ltc4287";
+				reg = <0x45>;
+				shunt-resistor-micro-ohms = <250>;
+			};
 		};
 
 		i2c@1 {
@@ -51,6 +75,24 @@ gpio@24 {
 					"","",
 					"","";
 			};
+
+			power-monitor@40 {
+				compatible = "lltc,ltc4287";
+				reg = <0x40>;
+				shunt-resistor-micro-ohms = <150>;
+			};
+
+			power-monitor@41 {
+				compatible = "lltc,ltc4287";
+				reg = <0x41>;
+				shunt-resistor-micro-ohms = <150>;
+			};
+
+			power-monitor@45 {
+				compatible = "lltc,ltc4287";
+				reg = <0x45>;
+				shunt-resistor-micro-ohms = <250>;
+			};
 		};
 	};
 };

-- 
2.34.1



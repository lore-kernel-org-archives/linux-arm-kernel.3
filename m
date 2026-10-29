Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11FA606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bx9i4+ME;
	dkim=pass (2048-bit key, unprotected) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amdcloud-onmicrosoft-com header.b=dNJl/Cn8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=d0Ss/jHN0gD8nntXnawTWe7fsmC2YUBpZ4fCL+67+6o=; b=bx9i4+ME+HuXVi
	BmmdMcjNVvTAPWPWiLoK02OXNJBw3rYkx8/NCCEZNS+Eyg65CJT9yKYzn8+8bYmq2kIty2KI5EHUY
	gLcwvipfuZXnb7rXwTkv5Vv9yFGWA43zHo9jMfXtDvpHauqMP8kVATVXC1RjhDky/3YohtUvKcw41
	SzVcIFf+BPHVBtwDnDxnnuA6bNQxjzNpCYnppPP9auvk5dJx0MxCy7vpKsrYA9InjS5wiKnl9SFgl
	R8m3geLSgGLWsiFUz+B8wp9E1jZs5gywvuAQ+tB4VhQbsFsAA301vxawIVA0nC421psxZc2RNhcFF
	U6M4buFQoiqjuHIxQbmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQPC-00000009O46-2fQK;
	Thu, 29 Oct 2026 13:42:58 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQOj-00000009Nag-0RZz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:42:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rQGN4GTJ26u6Q2Svrw9lj4POKMBsbGRu/ZYPfSOBy/T5uraJOZWKDKG4BD+Tqa1saX0Sud6TvRlmll+1nOHjyzE1CwtCmL1fh44JQ4MlCN6/qvUjMc/cwyuM3bSTSg3HXqrFtnzGfM6fWIFadeWHs57JQPlvvV9b2efGh2iioubFRFfWgjBZjd1qknxKDGVoVM4+efuitO6baqeFpfi1KDwrR0WwZuV1aYDIMO0nTsI8q7D1wZo25DaUU4Mc3S08eOmEh1pe6j3Zfwx4a/ilLpCKlwgrHzDGvrllysNmLR3eA43LLBUODE7Z/ke+Oh5svCKOGkG4Yhu7oyrvrmXEcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0Ss/jHN0gD8nntXnawTWe7fsmC2YUBpZ4fCL+67+6o=;
 b=RuQp8xikrcnvGt8Wu5iebRGv5jA0Z9ZcLIW5pDmJSK2Dd0g5fTAwInfxreOTOkJvBNiALck4VUGCAyc/MA52hoCGA1LBCGI+LydQ84eBOzTRsmM1Fq3NPStIO2f98YugcKKMBcSGdvkqJ6ivOVWUkHo2gelzQWhwZ9EI0AblbEcj5zdzT4JSc9C9TFLqFzTU58lHq6iP38g42jFMxw6LKoA9l6b1/EJ6L2ul1IsQmt+oDNcj8cz/qpEgpVgkeFtFZdRbb4nrCYjxTbbpu0bA8Tgubus8rwnKJuu8B06AmVm9RAQjPKlDaJSfiAf62VddabaKG4jzfR3Q4paDVML/PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=aspeedtech.com smtp.mailfrom=gmail.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0Ss/jHN0gD8nntXnawTWe7fsmC2YUBpZ4fCL+67+6o=;
 b=dNJl/Cn8+NhEk50Gt/BjJ1srcbVz2mY6rsFy9rWbUkjND5EVt+zB6D/33l9w8XUsEwutyMuQVGtcSMMQmJpG8GFlAnpXH37z1MlCrRBKW/iwLBw+8fBX58A13a/sJGzpFyy0tgIOUaj7h9Gvntv4xfDy3IcgUO5muMhO/yRHRJV9s9paTcX1hb0M4nFM8m5cTthZttRCxgxilCVKbwdy5LfNgxtUG602J+mYbd2PSY/lqy9kTuUQTUhM4H+ekazNAT5bOV420J5wrggg9Pi2kkMW9cHy7fXT3KqRw+wpEwCymhuc8w2Xh+lYAO4flA4F95TTKKDcjD7z2wNO0J120Q==
Received: from PH7PR02CA0008.namprd02.prod.outlook.com (2603:10b6:510:33d::27)
 by MW4PR12MB6921.namprd12.prod.outlook.com (2603:10b6:303:208::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 13:42:20 +0000
Received: from PH3PEPF00059619.namprd05.prod.outlook.com
 (2603:10b6:510:33d:cafe::7f) by PH7PR02CA0008.outlook.office365.com
 (2603:10b6:510:33d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Thu,
 29 Oct 2026 13:42:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 165.204.84.17) smtp.mailfrom=gmail.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 165.204.84.17 as permitted sender)
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH3PEPF00059619.mail.protection.outlook.com (10.167.243.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 13:42:19 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 29 Oct
 2026 08:42:05 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 29 Oct 2026 08:42:02 -0500
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 29 Oct 2026 21:38:44 +0800
Subject: [PATCH v10 15/16] ARM: dts: aspeed: anacapa: Add E1.S FRU EEPROMs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261029-anacapa-devlop-phase-devicetree-v10-15-26ee3cf9d9d0@gmail.com>
References: <20261029-anacapa-devlop-phase-devicetree-v10-0-26ee3cf9d9d0@gmail.com>
In-Reply-To: <20261029-anacapa-devlop-phase-devicetree-v10-0-26ee3cf9d9d0@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281119; l=1800;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=2kliQUULy8lLWicSSHzMuRcWpjJiX8vYuBhJaoJDw+o=;
 b=wse9HpR/Ul90+UvNSbn/i8neori2AiFGNlSNGkXuyC6Fi6pUuBSVKuD4UduEBOxf43aKOf7YC
 3GVKAAgAHjvBpXAo4CaOJN7pr4+2BWn+sv0wbG1hfKmw/La4+mBloqq
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PEPF00059619:EE_|MW4PR12MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: d498e09a-4dc8-42f7-83fe-08df35c27404
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7093399015|376014|7416014|48200799018|82310400026|61400799027|35950700016|4128699003|16102099003|22082099003|18002099003|261028144727099003|56012099006|11063799006|10067099003|261026140227099003|261021121427099003|261022105027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: 71W3aG1HlkRgZIMDeXEtnUUcfcySMP8UkruGhZ2Id8I4nVkCRPZHVco2wxr9bp4zZNHDbz2I1U2RnFmjGVNq6HWaQLibFgurB+xlLUFXf4Eo4bkOthVHgvJgxvqGTY56V1wOa2dKTNUdcwiV9Zv4cEpiYYFPXwWxnu+aCF3lolalwVjBFnzlcK0UVXAhZ6MDqDUJms6Ythw7m95WrIrBjd0rpSBLgGbbr5lHiOKako6xcCmFBqpSXnClbGn8bzJVASisZOxstXWSkRvpUNQGn4/7XFMcYkEKm7jGP5DpYPzop6eC8CAVZHFurcWxQ0EacEs8qYi3FFV9/iJ1hFYHL2gmknxbYCyIACHZODWzSEuHly5dMzZN5ujid+1/vr+C90M5VPMgj31w0f+e2psTyaWKyYNqWy8EZ6TSIs7NopCgy5xv5zVtTCD3CpXYsc/wXcQQmbngYKZaJaYduSLDLzkRwzuOfBmvEKe0tUZ+FPb08abRQ6FA2LaxvrGHM1wK5OWADNAIC9GpQUCL2Mvf8OjlU5XP7/IAaMsok9IVS4+Pv1xE3ed6azGKxn5/uZYJfyR7LOm0GcIBMSE5ac6pSD2qIq0asi62EvgAPC33QyNm+y2mJiryYb0ATS3CpIZd5bHp8KZPF/AaKVNHG7i4yYS/rowZ3cDzjlhETI/z9ifaCV/mwFjJi7uJcwPu9pnT0hzhUGGLkiJemoww3r77rg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7093399015)(376014)(7416014)(48200799018)(82310400026)(61400799027)(35950700016)(4128699003)(16102099003)(22082099003)(18002099003)(261028144727099003)(56012099006)(11063799006)(10067099003)(261026140227099003)(261021121427099003)(261022105027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: th4IClS4D/1iuPMwrVUqzubzLglaNuv6evAMIJHdtxyE6Hxw9JPC53LWlaHfT/Y9A2AWIVPFUnWAbgmDuMhrCAgAF7G32I3VWsFVU4AKtMfa7bYLXCBEkKoZ+x8hqbfXqHnVM3XCJfK3ELunQiBY6a/ilZ8fmj6AwE6F0oR5nnHM3h8TWisRmg/RPhlhf9RT3/WNiNKB199sH+bXCaBjn7qwIqb8aPZMXlgQFHgI3YBQPcsyjb+vl8lxNLPgugeFlv+iUAwVjnR9SeZy7WO0q1dh75WLCtFugA5hN0XNxq/YXfHCMzh7oKUrcygvNxFF0QaeIx/vn2tKOXxpCOgX4XUatOXcczXOQpNZlgdvNEygYVt7U8opPVd1EV9sh/XXV1qapBpoFvgUxlQ74jfzCWOtnKSuzPVaYRJHIR7vjiGz0vdFeNXo/p3BIG2qRuKD
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:42:19.5637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d498e09a-4dc8-42f7-83fe-08df35c27404
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: PH3PEPF00059619.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_064229_192846_8C8DA2F9 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 1.0 (+)
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add the FRU EEPROM definitions for the E1.S boot drive and the four
E1.S NVMe slots on Anacapa EVT1/EVT2 and DVT.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi   | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi
index f61cf5b3718c..7745802d3640 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi
@@ -404,30 +404,65 @@ i2c4mux0ch0: i2c@0 {
 			reg = <0>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			// E1S_Boot FRU
+			eeprom@53 {
+				compatible = "atmel,24c02";
+				reg = <0x53>;
+				pagesize = <16>;
+			};
 		};
 
 		i2c4mux0ch1: i2c@1 {
 			reg = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			// E1S_0 FRU
+			eeprom@53 {
+				compatible = "atmel,24c02";
+				reg = <0x53>;
+				pagesize = <16>;
+			};
 		};
 
 		i2c4mux0ch2: i2c@2 {
 			reg = <2>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			// E1S_1 FRU
+			eeprom@53 {
+				compatible = "atmel,24c02";
+				reg = <0x53>;
+				pagesize = <16>;
+			};
 		};
 
 		i2c4mux0ch3: i2c@3 {
 			reg = <3>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			// E1S_2 FRU
+			eeprom@53 {
+				compatible = "atmel,24c02";
+				reg = <0x53>;
+				pagesize = <16>;
+			};
 		};
 
 		i2c4mux0ch4: i2c@4 {
 			reg = <4>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			// E1S_3 FRU
+			eeprom@53 {
+				compatible = "atmel,24c02";
+				reg = <0x53>;
+				pagesize = <16>;
+			};
 		};
 
 		i2c4mux0ch5: i2c@5 {

-- 
2.34.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CC6CA5FBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 06:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eovo9E3TkWEKqlfEpGfcreWTGJtPYIimMj2M7HliDLk=; b=Z6bFlclP/Zja0TXMch1Ufj8nyy
	P30PY6n207lfNvreYtsg3ttcxkfa7Bp87AedfDvFdkHyiS+7W+euPHKwbXT06n7m1eJhjTVCrN45w
	mnocz3WMz3UANt8JoYQiw8ga+6FzNnxfUb0oh5pQUm8zbWunghdlbLMQc8erC2RdJg4QjNPkCbrfD
	4jf48mnw13wwDa1I8zmTsUOza68k72/k1tSKa2C5/Y96DXX28HRTSI62LSu7iZiUBeylSrhYR2KLL
	Tnc2FcKgHjBG4gMSPX/QYgTBuNpWuh4twsDsWms9v28XPSE02d2S7JbmWJVBSRGnNbwm3NIjKMl51
	VYIlaCeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnaX-0000000573d-1MHj;
	Wed, 30 Sep 2026 06:14:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnaN-000000056yz-2VAk
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 06:14:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=eovo9E3TkWEKqlfEpGfcreWTGJtPYIimMj2M7HliDLk=; b=rMWLlSFdENnaSpDnVpDTDFvwsq
	3p2pZTaH+TaTbY8lSg0D1OjIn9CUv0+lJ/cRUFIqHivIDLC8n0T9GBzqFu0Li7YgnEvTtW4poQIrs
	CnG+jt6+naJZMkiyKCK4mkY5tBp9PXdni7UB8oWkQkWlOPcW9qrBWAsOEAhgcHzilOrAt7lZA7puh
	LbIlmCCpHHzaH+0f544M4zzcyqp/qoIjwjXc7lnpnApTRqQEsIpeYrHEBcPuPb2MVd9vrNlZ8ERY7
	UpA9//bYyP9iWWuZeev+vc2e2/FWwoHzfe4ckiiSmngwS/phnPC9m8tRaGcVem1d4oxRxT5WeJpYC
	g+NaVJQg==;
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBna2-00000003P3n-16xH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 06:14:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dMNewjGE1sxgmeOTd2davI/EKGRBfsIabnUBgmC54tjypXTDknbR4o4d6alRi8gbVoNQwecnll5xCp75VnrwBOa1YJ8fa0lB3Wl/BvYjMREbx4MzU0xJhFdTNwhVXS5eE+urRh3Es/DQPW2iXmcuj7y+Ta7G07g5bxmvwH38UAaPcXAHIqsnmH+/M4m9McGc1T+KLZhN7QncDrTQibnGaxcOOzXXqkFQWQ/sOUvGh45uIvpJfbd+NXvIu9QMoA0P0yUj27AFZ36tStciX0uZ4P3+hficeBn9j8r4gXDeHVDC3qsf61S+v10pP86dyQGaqvNuWmfO5qExbQVAbRMIug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eovo9E3TkWEKqlfEpGfcreWTGJtPYIimMj2M7HliDLk=;
 b=T4Op2cDs7JI+xBoisqEXXy/ZALgnSHSYQRqK8R4egBQ3I+XtFJlz9nJuffA0G+5clw6klns8KcOV9OQnj7MyieySZIfTqEcSWGeeMmhCja0l03WLBrzizR8gvV9xkR012OUBC39VFoSzJmwb3fZJ18aOVO9pdH0v7abD9QcBNNW+G3AXl7EorOjJkP1kQRCzZknbs9erfSMRklJeao2QQ7NzBSU7kxrrSp1KLXvHQmNx1cZEph05BzYzm9JYVISRf3uowdUZVS++WQawAdwD84kxTGdltNgXGRQN4PUgO2oeaI1hdCTAFHyhPdE32GvTFNpQjIqPf8LcnbXEJBa0SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=gmail.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eovo9E3TkWEKqlfEpGfcreWTGJtPYIimMj2M7HliDLk=;
 b=TR/H6yfJh1iuMrDm+EB4ZoyU58U7xqlSieKsmtF0MMLhj9XOCzxXq91NBIaIr+q2EUghcNFpPDDOP2T8+NONdHf34RwrtJXbT5PBqQIEBtPjJLo9vpTNuQQ/yghWudnjFzYvX8JC+eaKKR6fmkGNFZdJD82KgeVjFFEnLv/BiJDnFQjUKG8psmanPrY/b1P2wrhHzcdGCT9yyDCutD0KKVfYFxz25dUniTTBX/H9xMtxGxVXLOo7dsTB7mu2fl4gd78SJA2Ndln+1KWDYpocwei5F3ZZd8ag59UF/Ht1IzUPgqcO7KIsZMtFl/pDbJOS/zA2zhjBaq2ePRGW0w44Mw==
Received: from CH0PR04CA0033.namprd04.prod.outlook.com (2603:10b6:610:77::8)
 by DS6PR12MB422600.namprd12.prod.outlook.com (2603:10b6:8:46b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 06:14:04 +0000
Received: from BN2PEPF0000A7FF.namprd02.prod.outlook.com
 (2603:10b6:610:77:cafe::4a) by CH0PR04CA0033.outlook.office365.com
 (2603:10b6:610:77::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Wed,
 30 Sep 2026 06:14:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 165.204.84.17) smtp.mailfrom=gmail.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 165.204.84.17 as permitted sender)
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000A7FF.mail.protection.outlook.com (10.167.245.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 06:14:04 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 30 Sep
 2026 01:14:02 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 30 Sep 2026 01:13:58 -0500
From: Colin Huang <u8813345@gmail.com>
Date: Wed, 30 Sep 2026 14:10:16 +0800
Subject: [PATCH v9 08/15] ARM: dts: aspeed: anacapa: evt2: Add shunt
 resistor values for HSC monitors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260930-anacapa-devlop-phase-devicetree-v9-8-f08aa0d7182d@gmail.com>
References: <20260930-anacapa-devlop-phase-devicetree-v9-0-f08aa0d7182d@gmail.com>
In-Reply-To: <20260930-anacapa-devlop-phase-devicetree-v9-0-f08aa0d7182d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>, Peter Shen
	<peter.shen@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790748641; l=2046;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=2hNvv3dzcGY7YC5SlE8BBJWHSA7m9aG/DD9F7WuX2b0=;
 b=lbBMz0G96RyQQ6PR5pBFPxt07NaS8H0BC2tKWbBfbkSLY7E0k2+d/qKAJBRjxklgHVO+xCrla
 /2x+jjC6jSIAb8L4XrvhliUykkElhGakcZhjeojsJAVB5RRwoIr7eDQ
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A7FF:EE_|DS6PR12MB422600:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c06d956-4517-4e5b-a142-08df1eba0728
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|7093399015|35950700016|61400799027|48200799018|82310400026|11063799006|4128699003|10067099003|56012099006|6133799003|16102099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: garQMWYXljtd8ZpwgBoAVHcTe+IsRqlkOGargTqNgj4PYDSKWGC63RZg/x2ZMRh1MOM0XXBfWZbn3xusSxgkyzTQh0JNJ/ZGHp8foq8gNty9zZmNi1TW8I8Z/ScdEsslP1Txrg4B0Q//tDVXrW1PUwbHfA4XTsf8WF6rQLND6uqKQTN/6Eyb+k4NKameNZjnC5+Jp/zMTV1/71zDG1BN5dpIBof7yMgLM1TGLX/Gnk0r9ztDQYGvFGuhOMccD2L00TPpdXskxmEc3rmbauaTAXqn+UtieQOlfRrJtbaqC5OzFMqbsE6X6UxeYNh35KGxMpJ9UXAwpsKDtCKSicM8QDUaq2yY2+EyySk1/GfTDnjbcWY6xsaDPhozjElWVvOIzHhnIRGJ2FSbd2hIDYAm/suJMVB87vV7nqW2V/25LHPQFpYHBoyI+vNFci5SCYc2Nfu4VLSoZZGhc9+w89bl2raw/txY48E7yu3k0yN6cBTVk+eubk7HLCfgpcheGhEVHZhu+vwOXJ997VWvV9+1Mk9F1aD+Xxmpx6BJf8NTcZu66wiaidSUW7q9HJW33APl9nmx+qpHhGMmMBQd3iSwScVR21Z/jiDU3DYJSDiYGzoc4SK9CUbxcVZso+356HzW3zEQbIBwL/z5M07nGFiSgXtMSrNeURpuwORo/Gq5W0Fjw+yCxQlVDPx0bUjNvt3gM9GqxymI285UQwQTPA1FDw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(7093399015)(35950700016)(61400799027)(48200799018)(82310400026)(11063799006)(4128699003)(10067099003)(56012099006)(6133799003)(16102099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: A2iYGfEGrX7Ezo/307+t9Bpy/OvnhkFSjNi+ooIRn2hqQ7agKbELXmWqp08+3xFLe2V2BKgO5kO9bdn2XqnVDyDz90GZQEYJwZrWRmEFKPjHAA5esJaQGyK8zoLOMkb17rzScGUGDrcZMdF5thaRoWr+TgGPK+jGJxKUlqN7EZnY8eBWmqvgr5zd9pMg6MMaHhFUZTwffF38LloQZWtM6HacjhdvDNlVIo4Z647F3jbwl3UR9MwpnkOupdzJs9MKCCE55noQ/RYdB9Q+5gW/ch4D7NLOL+sWWsalVQiYCNAZlOAhrhlf53k4Wsa7oMjTKphXHuq8ELafwOzkyyLqJlJYUaOwNP//ISm1GHKBZ+ploPHON4g0oCvSQ+jcXeFFRB9dxk5xiL3sTSxqcNtFV2GcxL9WyubmAQPXoYdxF12l1/FzA7OaANmf2q3y3Rl2
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 06:14:04.2272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c06d956-4517-4e5b-a142-08df1eba0728
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000A7FF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR12MB422600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_071416_779606_5E455C72 
X-CRM114-Status: GOOD (  12.15  )
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



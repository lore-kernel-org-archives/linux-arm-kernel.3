Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405A7606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 07:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u7qvzHcT;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=PQ4ZKRVO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lCqP4nkIpavIwcddv32q2XNZJISPHzIlMAxvpcP2Cm4=; b=u7qvzHcTsw3xOT
	IJQIJqg3StojD1rAGVJMGcW22uTz3yYewpagFTp4XtIb1clU+SEwx1sbsqBIwpZ5lmrJ1/6XM0vSA
	761W5o/lCdrCqFanO0etMUb5bC99TWhCbZTtpl67xRFt5Mby+rVqUaSxBtS5S2k3DPYPUw233C3gm
	UzYm0G4JOTsHtU/GmlkgOVC9P1gF2/AqTNH58Qdmc6ffO28sj03EODBm2w3G2JWyVPKW83mL2bOFl
	FWoNZi1VPbtwHuSsJAcNK6NcyxGJzgQxg5XIiFK0bp3uJ02pzkbCyiwaT+xJOx6NT9ZCQztDnHloa
	t28I+SRRgE7RI4LIWu8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVZJ-00000004YC2-0KIT;
	Wed, 04 Nov 2026 07:38:01 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVZG-00000004Y9S-3ucL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 07:38:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZrZOZ/2QxdPkD+t97LLv3CM3lEnJMaJ/aO9lZV56cRrhgT7TEHo5qbqgWNVoH/34eRvA6g4Ko3OL5tFISO70zGPI3FaNe8pfrKXQgeM0yv2OqymSQhv72cui+hj158HQG6/l1TORqvlGnBtWokgjGZSko5p6g7TZFVcvh1BV5Legz4n0eanMDHTHQuVyxVgGvcRTZ5jfPs6LHL5ewu8dhCK7waV2M5XdJBs6mTxxx8aqo1C5xzmRypBcz39FUumQepqsiI0rf2OnwVBj6zUMjnaxyAQg5Fr4AP2Q7FuJgVPKjGkrKkApoLIC/lKTmkExmv3cJ7Ob1oS8MD2knUWeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCqP4nkIpavIwcddv32q2XNZJISPHzIlMAxvpcP2Cm4=;
 b=QJ7vTD3SME5QV28Ey0HbMcrjZU8Zh8YZqf+GvX8BhrJdREGmqbsscKfSp97gmnDsI3iTBWK4cCOYFyPysSJi+K0SzjMo4pNgm9dFs/NcCxxvGWRw4Af8xzfyWUEjHkcw6zoTeqn4WKzh9gycmOw/HXpYh9/eXMJYI4BeEEbJEg5S3QUxPyeelCl3UoiddftL1pZkGDyFda2a0zZEqkhg3gR4Bp/Pgw1MX8yZU64PGisjxv0KaJms0EwyVlVDl3hsQJ78/yxbAn4aAv+GBHTnuXQ/aBrShPtxKMIcE2OR/zLNuXFPbbt2aHsMU3DhFm59HxMhFOFbaRxRhLgKch0PDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCqP4nkIpavIwcddv32q2XNZJISPHzIlMAxvpcP2Cm4=;
 b=PQ4ZKRVOC5bKO8XwnojDt2J2dOzXatOK5aAz4nv4Bpy8AsRJAWThbDlhsTgFO3JAT9Il7Eyv395QI6DEqDv6L2pDaWZaGCZu2cRAA1FkkbTQxdZvLe1v/HDC6J0BLeEGRJsvW9x2m/E+7zpd4JM04RI8aQDJB0mlAMu1IKFKFb/JPQQTWJkHBj2Hai+DnsSGekeCC30B12omoqbe10xtqQKKezQBHbnkD2aqsGZgISkJETtwMMPWyQR0Hc8O96PFvK61VjK+LSiwKX9D4g3t0RIhi9vE6PFxAj8+gMyFU0xcgwCsnJ1t+I4gh4XIYahdmW3VPNyBDur7RW1ak4RUUA==
Received: from MR1P264CA0160.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:55::11)
 by PA1PR10MB8766.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:440::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 07:37:51 +0000
Received: from MAD0EPF000008C6.eurprd05.prod.outlook.com
 (2603:10a6:501:55:cafe::a1) by MR1P264CA0160.outlook.office365.com
 (2603:10a6:501:55::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Wed, 4
 Nov 2026 07:37:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.206) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.206 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 MAD0EPF000008C6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 07:37:51 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 08:37:25 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 08:37:21 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Date: Wed, 4 Nov 2026 15:35:42 +0800
Subject: [PATCH 02/10] dts: imx: Use minimum NAND ECC strength on BSH
 boards
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261104-add-bsh-smm-m2-v1-2-369f0a77e021@cn.bosch.com>
References: <20261104-add-bsh-smm-m2-v1-0-369f0a77e021@cn.bosch.com>
In-Reply-To: <20261104-add-bsh-smm-m2-v1-0-369f0a77e021@cn.bosch.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, Haoning Cheng
	<Haoning.CHENG@cn.bosch.com>, Michael Trimarchi
	<michael@amarulasolutions.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1310;
 i=Haoning.CHENG@cn.bosch.com; h=from:subject:message-id;
 bh=0ihmRnmTOHFsqdOKT49ZxDiS9tkt8/vKUkVB5qVqZjQ=;
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLJePVi+ck82W/Jdk9bbwmwzHPac5224ekL+wO9p01eut
 8gR9N71sqOUhUGMi0FWTJFFNcH7rOTVANNpM6vh5rAygQxh4OIUgInUTGP4w//T9kO5cE9k1Z6t
 m7ad/ZWo4ut53Hz3/eVBX/tvx/dq9DH8j7mhaM3SOdFJ++nNudY/Ds5S2isfrnNFntFm76xIw3f
 TGQA=
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008C6:EE_|PA1PR10MB8766:EE_
X-MS-Office365-Filtering-Correlation-Id: 98553750-6cc0-4ab2-374b-08df3a468812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|82310400026|36860700016|11063799006|56012099006|261021121427099003|261009223027099003|261102123227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: iIg7lHEqZWC7ZMuF+A9QncBJIp5oWJ6gIiC75/zKZTvvrLbU5R7hfxHlBOspgHjL+BUzoRXg5miK4JX7neXIXk9Y57oINT67AmBTLI285L/CUBBDgmGF6zJPz5hEQOhDqDOkwZ7eE/DVGh5bSv9LfdU93I5U6gtbwt1UlOEJoy1E0LYz0wtx3PTfYvRp2P9Wwt+tey59RF6uBXOJmqitarBO58k2vceetAZvgHr8BNiXLf9V161NCJh1HBXNMsL/5cD4n4ut+oUsrZR9OyqAkCNptL+0ILIuaFeOODS1FYuwgLaP8X1y1fC4JBdssy6Gbm//lWFUTd5qVnaWYWU1iMsHWC72jO8W4sdN0yjdHO9nXo5QuUzccfJhRoXs0iEiCWhbqsoSygi177GzwNLI4J4nlqwgJRN+gcaN/6qZOjXAyxVYzkztqlciW361lQuIcHZf4MlWQ+8BWz6CtascaaEHoVkkJU+oAR0oNq5t9YkWJCeonZzZIYTbiMrwflb7ywCWlIE4NBjr72YdlSMG/l74/bnEajBbwzkIHvjW69dOEDgzgUKq3/nFKNRtIYoRqXpb0/WEG300Hw0JQaad39AwxK86mZfsrIBl0HAj8JmpcPJA/rh7Yx24rsiJdbYTYppMLqFbGySzzWpdscYsGaDvqY12PcUMbP1fqR8k5EAbYI5+acejK1LoLrVo8EiBTyqpeJuuAf7eEp2BLRipUA==
X-Forefront-Antispam-Report: CIP:139.15.153.206;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(82310400026)(36860700016)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261102123227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: d0QSXzJ2r0vVEPdyP2UeWJS7SOmIhS3X8AxpMXi0ZmI+k191RswljhERBljNSI58hV7Sc8oxwKEACru13D+huiq61z/kOtrD6FIO342Rc+c/Trodr6CoE/MuIJM++Zm1U/1NtsK5raTPMw8wsPOVNa29shysjvhAuiU9x3I6R/F8JMjfthbB0wHBHSKzGPmW34jSvT6qnvQKfVi72wFI1fdVCUB0Yj2paXehgPfCadqRcpTqWZBvXNt87rQlUPXhX86wSMY2uVV9vPzVGEOeSoXB7UEZAapwe9ifVck48Q8dF+kLdBA4jm7ZxF1igvncsA9L1hWqHup2sloCM1eZ4yh0bsUUN45DhLZv13AsgPHS93Hzv4IpiT2vCj2lD7sZhMceISOo2zzZ698qIEPFhVLU3W2k8u3zpEtIOmmJVjDYA6ETF4p4R6JB2mA+LWSG
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 07:37:51.3895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98553750-6cc0-4ab2-374b-08df3a468812
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.206];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008C6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8766
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_233758_996431_77C98FDF 
X-CRM114-Status: GOOD (  11.01  )
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

From: Michael Trimarchi <michael@amarulasolutions.com>

Configure the GPMI NAND controllers on the BSH SMM-M2 and SMM-S2
to use the minimum ECC strength required by the NAND flash.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts    | 1 +
 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
index 2d9f495660c9..aac211a9f9eb 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
@@ -26,6 +26,7 @@ &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
 	nand-on-flash-bbt;
+	fsl,use-minimum-ecc;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts
index 11a1ba5bfdb7..df11f81ac50c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2.dts
@@ -21,6 +21,7 @@ memory@40000000 {
 &gpmi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_gpmi_nand>;
+	fsl,use-minimum-ecc;
 	status = "okay";
 };
 

-- 
2.43.0



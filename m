Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D119606A329
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 02:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3nnsuXar;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=iDK6Htbj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3EiSWqYW5qro8v5W+Nr83f4zTMRb1UlJSlM/AOmV9EU=; b=3nnsuXarzL7ERh
	pOPFgHmz4syjoztR1+d97NHiR0+33T+eq9g9kaj7k363t6FuCDuIn9uwYu04ccAB6IOCgVgcdnIyA
	Qb6e711NMDrm1ISY3GAuaHO0zd4GbWC29ux5OQtrK9OMjMnc3en4il9V5DsFoMPedLKSTVZysSP8o
	BLc6/WzW/oVrm+A+povBADrwyvFLzVSRPrAsrB5IXa6FkLJl+SYjwiyMmPETs5sFObWivFlD4lDm1
	RgXdrLrbeQYUpxw15ZxR46e21OGIRYsrGL3ng7FuOCznUvZRRfHDXulssKoD1X0HJ/lYx8Md4uuJl
	thF4y9+0q79yONF2RjyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOnQd-00000007byI-39gz;
	Thu, 05 Nov 2026 02:42:15 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOnQX-00000007bqc-40Ph
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 02:42:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RxlCnih6uYL9WGA7iYDdwjdjv48HofIBKK0OsOkzHO1ZmczV9WBP6LELd++FwqkuwdMfKY9wwcJ19StuiQtTIAiLbBylj6VvaWHffEfChXPRBfv9X2N1g2HUPrqNXgW9HCPsqJZvhyrggTqoQEuj+8bJN3u7CWMz96nomkUzyLA20SSoTSDxihmaPzj3H/sJC9l+yXYp2ahMPL9JDoiHsjyja+N+ZospBs/VCWAATHJZOg7r1hJwfUNeeJbHZtR69WfRMcuWub2SnKVhZCEaXDOohQfVsTr3MOKGCuExIVPndcH1sJGRquOxUOc88F9Qf7MrRDqoLUq9jqKoBC/PZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EiSWqYW5qro8v5W+Nr83f4zTMRb1UlJSlM/AOmV9EU=;
 b=LnBOBkKe5TVnJD0vuVbe8Iuk108v3mjC/dh/AVfDvMbQfJbfuud4JuekurOBiMNPs28iY5kkdVr73qyANkHNQSdO5gAYlGffkP1DWNzpVpr1cZWxQ31DgWIaSbDYK50cJdM7/wFpY5pbpPwoty/SArObL+9tV3bBKVVYAuLpwvIxwjlchujxaCbsmQnGfh5qP4MNUi3IWq27HD1xtjyYwNu+ZaZ5aZ0C+HAmm6mg9Fo8RUFD4w4dxyFaeYCm85NUL1BA/7wnq3hiiOokA3iiCwszHklY5NWV89HKwxOdKMGfFxd0Y90oCcfwu5t9hkrVO3T+haliBTtZHq0CHJZNuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=kernel.org smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EiSWqYW5qro8v5W+Nr83f4zTMRb1UlJSlM/AOmV9EU=;
 b=iDK6HtbjljiXxMmOBUIOFaM0FgIWYI7j4i80zjHaeAdjDf89VMus3FpJUvF1Je7ONwBSh6WgXE+50HjdSvWgY7H1+Tj58qiCle8S9jWKARBKIKvEsXTlvrVgI75UoOqSzXpRSEdwxapTwtwd5e0py1hqIcq/3bBMvJWC2mkgXtLf50Xwr8LNrheSnlNZeWpRgAh58aRV3SMWzdFjG4pd3wKH13vD0HXwDr71CMjMO0wi7lAiJPFCQhK63Zfio2nGwjlPVOQYJ6pOu9vj0sDUXiZtGdnoG2gyVhnO75FYYLAaj9vfXEpJ6l6zNUL7WmxGsK6j+NKPeB2Vjjx47X3Z/Q==
Received: from GV3PEPF0001DBEE.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::31b) by AS4PR10MB5895.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:517::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 02:42:04 +0000
Received: from WA1PEPF00009B3A.eurprd05.prod.outlook.com (2603:10a6:1d8::118)
 by GV3PEPF0001DBEE.outlook.office365.com (2603:10a6:158:400::31b) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.21.592.10 via Frontend Transport; Thu, 5 Nov 2026 02:42:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.205) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 WA1PEPF00009B3A.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 02:42:04 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 03:42:01 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 03:41:57 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Date: Thu, 5 Nov 2026 10:41:21 +0800
Subject: [PATCH v2 7/8] ARM: dts: imx6ulz: Configure UART2 pins on BSH
 SMM-M2 variants
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261105-add-bsh-smm-m2-v2-7-fb5ffc7da486@cn.bosch.com>
References: <20261105-add-bsh-smm-m2-v2-0-fb5ffc7da486@cn.bosch.com>
In-Reply-To: <20261105-add-bsh-smm-m2-v2-0-fb5ffc7da486@cn.bosch.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, Haoning Cheng
	<Haoning.CHENG@cn.bosch.com>, Akhil Narayanan <akhil.narayanan@in.bosch.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1075;
 i=Haoning.CHENG@cn.bosch.com; h=from:subject:message-id;
 bh=VqQvwx5DjvBuUeR/RiCBffb5oE02cLYBE8zFCfltHNk=;
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLJev7kx4drOB7nxW9/GBpVp3Zh1dU+s0IPqu2vW7rv/f
 9et4xsvp3aUsjCIcTHIiimyqCZ4n5W8GmA6bWY13BxWJpAhDFycAjARWx2Gf3Yf2VxiHl02uZfC
 Zymypfnkgun9O+Pzzm/6aMa6fG/0heMM/2wXS8ZyfnOMvuBbJ1SjsVnIaEFN5cpSrzdZPz8/lbN
 dyQIA
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF00009B3A:EE_|AS4PR10MB5895:EE_
X-MS-Office365-Filtering-Correlation-Id: bdf9cb65-aebf-4403-55be-08df3ae66069
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|7416014|23010399003|1800799024|376014|10067099003|22082099003|18002099003|56012099006|11063799006|261102123227099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: gU7q2syMW+YHi6+QpEga5acqPBb1YaLWtqZem8sT6h72CAt2t0YDzPIQxFW5RM9eidJPUYflzPh66Xz4x9Wxd0aQDUhwXJJeo60CjMCjVeDFuhkwdKWuNYLFnMl9YGL6+liLYg+e1DsqMrwX/LoAsDZ4m0vO8l3/qStpzDVj4vMOo0rQxSqzvEMU8oj+OO6+XgDJmpngLQucTjI+slE4imZ1L6KrrJ48PuPXPdKZWWUCFRaYy1FWag/MM4iuCdr0MLxgzAYFLwgrx6rkk5peeDyjM0D0i0kec19X+ef941V4EwaBTgYXJlijWtB9f2UFctmu3EAc48+KXGPWjcJfpkMfTr8L2CcckIfYkcnm1n4n5vZ3KDCgbfKzslZ4LOTARXT1O8nmovA4H8+HcSHjrJo+nr+qnMenupZxXiP/+4t0kHONPsLnxBeqj+lsv9vr4MJpfhb7LlagWPoIJHz03PdHFC5v8wn6iRwMpk9fxao2/0KE5h1oHdVMhZ4/VcHi1K67ee9zSHpq2dgCEPycj2J7AJdlAEmYq97vjiLi/35ZXvSuTTpPQqz49nJngMS00QHPnSQr32qVuxrU++0CXA7DcG/5Og7iNEe83f47pJSP3xHlDcb6OjefASe1/LJX6I5oR+inKyjft3umbxIi5Z+hrKlBm3uFOE0Re8LQ92EPGb9h6Z4ZwvwaAjX3HNM7BJHtvTMStBzztT67nbPN9w==
X-Forefront-Antispam-Report: CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(23010399003)(1800799024)(376014)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(261102123227099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: o6S93i0lqndv+3MdQX8E6R4X3H/apbeDtocJFDOoHe2D9AKAqRW7kc4TbbTa1aUvtMGwqVIrxYBDr0FqgAOnsW2/fRilxHrc2Ri+I8dFdDNPSXpsApH+RdpR+WfrJic7maY9IOvcQVzpvMl4V5U3zZM6ZM+DfUNkiQm+duh60vbD8rGjnkwBJJGUcqokFy9y1IHtq+SqpJun2vSFMZtLHPXx0I5GwPgF1NAu9/JwRSjxjeA/OTiXMI2JNs0tT10U0CuvKfGuI8xSvr8LPxOKokXk2tHWlFLbFtjw6m07HoF8xKU2Ri1FYw6R4/CRo+QXfJ7dvw5ZXOf1Np5IojsM+b++GodqBCVDn1VWcHwJ/H3rUCOjjMFdrgzqbiFvvtLPvBrdPUMpXE3U4TS1A2YxY/GBe4U1A+ASlolBdJwG+0bWhaKMARNqIgX3WyWyRCfi
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 02:42:04.3353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf9cb65-aebf-4403-55be-08df3ae66069
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: WA1PEPF00009B3A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5895
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_184210_024623_A3EC8892 
X-CRM114-Status: UNSURE (   8.41  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Akhil Narayanan <akhil.narayanan@in.bosch.com>

Configure the UART2 RX and TX pin multiplexing for the BSH SMM-M2
variants.

Signed-off-by: Akhil Narayanan <akhil.narayanan@in.bosch.com>
Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
index 83df5c696748..27c7b6acc658 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi
@@ -25,6 +25,8 @@ &snvs_poweroff {
 };
 
 &uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart2>;
 	status = "okay";
 };
 
@@ -77,4 +79,11 @@ MX6UL_PAD_UART4_TX_DATA__UART4_DCE_TX	0x1b0b1
 			MX6UL_PAD_UART4_RX_DATA__UART4_DCE_RX	0x1b0b1
 		>;
 	};
+
+	pinctrl_uart2: uart2grp {
+		fsl,pins = <
+			MX6UL_PAD_UART2_RX_DATA__UART2_DCE_RX	0x1b0b1
+			MX6UL_PAD_UART2_TX_DATA__UART2_DCE_TX	0x1b0b1
+		>;
+	};
 };

-- 
2.43.0



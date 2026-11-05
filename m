Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA1A606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 02:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Cga9xfOq;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=MxSxBStU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lCqP4nkIpavIwcddv32q2XNZJISPHzIlMAxvpcP2Cm4=; b=Cga9xfOqqEMnhb
	o9EW7g2Qur4fUgYcmhUtV0iRruKtKMLCD7w0+G/bAaL44dsX0YYumMrWOc+CKZmBSLSKIzkavD762
	Fb25qe9wg5g8DlVT+1Y0MwAYLGFOq7pZYwxfUePqkN7yFYr0DcuYFtLWnpHDxUERaeFyelHHDTBv1
	Nk60UIuzrhCEqRY10UHyJuE4ygZVEYv7LQIz1daimhNorWwohh2vJqjMgTolzMgMBYtWQlKmVEmMt
	XMT9jhEdhxpoKOdGY0UDdwJPK8AcSgrXv0Y2WM05hT9tgV7enlZLrhveb7Te8ecCqD1umdW0UvpqF
	SzzmQLLw6Cwru1jxEvRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOnQU-00000007bpI-0pJH;
	Thu, 05 Nov 2026 02:42:06 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOnQP-00000007blQ-0Zj6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 02:42:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LYWF0hh+XicqNWbdsI22iXmXjqiRxhtvP4lnjZ7xyiTLG5bOGM1jJE0YNzKNyEve6o81Z1AeyEnkPWzciLW9UCgf2wf4rGN904r5/bPjdx3ABwirObmSUxADV6066WXWF1ahNINwmE7OjpzBVjXt1qqICao3UAoBFsf/vilzpaanmvhvk6pZE/yzahyge3OKV08ppaQO3LdQuYBbVRKsFTd1OgPl/corLJUN2rWIX8pvEsFQxykkORYZQfYVI7TAC00jDz1PLp8s0SXD/EzJAETnf8oEHe5X/ljztaHVf2sh52NsRDmJnf+xrx/4D3xU7dnviTP7JbK/X5Cr3yg8NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lCqP4nkIpavIwcddv32q2XNZJISPHzIlMAxvpcP2Cm4=;
 b=exMbX6v4GA0otVEZkJOODQPquPXJu1H5u7y06lg6XQPrjXBz3MroqmVApO3ZGqZOgwytmQqBHqgvF1Lolhv7ggtK476K5CTkjXCghiVticl3LlH37Wlr4gMFNcLGzHjJIwhXiI4CflXnhkzOaLTkMaJlvjgM8WHyQmRSCVoJX5NzpI6n0hlrD6ZteJrkaQYPgBxZLrPDqiVcxp9JXE0Oc7m9Vy93xPoBu8geGip8Exu0cGeMZHdziUiHdJWS21AnQlIeiDOUg0YTkhMukzDN9emgx9g25OtrxiHdpssB137LpsgShoj/MZG3uZXHjxPB59Nmj6RDxtn9J4w/N923GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=kernel.org smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lCqP4nkIpavIwcddv32q2XNZJISPHzIlMAxvpcP2Cm4=;
 b=MxSxBStUXZJo5IQM5vY2QT8BaG/SZG0eWzh48K7sY/kxXRuGinm1ZuW1YdwLTVQClVeqlsT+7LZItNWmhQRGMGe3zknOhn0qVWKeAjOylCO15yIsHcUu+wuOi4r8sQu9MTUcLrswS6BQpdoOzyVoKAngRRBTg92fEHalrsPCpTJxoVh5Zjz74ZN37xEObUuahoLEwAe8bwhT44AsMr6rFnI2sQvAj6R2p4C67Vx+MGCvg5T+vcte54wbNITTX1LIxKvNOfdiB01QHcULjWP0LOqH1rNGUAnEKy6I8acGuzsc5EsTv7CcZUq1l/tF+y3z7BFchB1OCzN/g8QnZbPkCQ==
Received: from GV3PEPF0001DBFD.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::314) by DU0PR10MB6105.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:3e1::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 02:41:55 +0000
Received: from WA1PEPF00009B3A.eurprd05.prod.outlook.com (2603:10a6:1d8::118)
 by GV3PEPF0001DBFD.outlook.office365.com (2603:10a6:158:400::314) with
 Microsoft SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id
 15.21.592.10 via Frontend Transport; Thu, 5 Nov 2026 02:41:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.205) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 WA1PEPF00009B3A.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 02:41:55 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 03:41:41 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 03:41:37 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Date: Thu, 5 Nov 2026 10:41:16 +0800
Subject: [PATCH v2 2/8] dts: imx: Use minimum NAND ECC strength on BSH
 boards
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261105-add-bsh-smm-m2-v2-2-fb5ffc7da486@cn.bosch.com>
References: <20261105-add-bsh-smm-m2-v2-0-fb5ffc7da486@cn.bosch.com>
In-Reply-To: <20261105-add-bsh-smm-m2-v2-0-fb5ffc7da486@cn.bosch.com>
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
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLJev7mR3TxV78K5WwHf40I2/Yy+uoRNJOG26+TswN+Xn
 dJnef6X7ShlYRDjYpAVU2RRTfA+K3k1wHTazGq4OaxMIEMYuDgFYCKlAgx/eHl3ObAeYly5USOt
 6qaqwNHJeuLLcjSkG1cfCjwh0b44heF/MFPypNq9+1WN2bTEZ6xjcM2qVJt88bWV25yV/C9nML9
 nBQA=
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF00009B3A:EE_|DU0PR10MB6105:EE_
X-MS-Office365-Filtering-Correlation-Id: 8594a89f-4392-41fb-e80a-08df3ae65ada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|7416014|23010399003|376014|1800799024|10067099003|18002099003|22082099003|56012099006|11063799006|261102123227099003|261009223027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: 7K5jSEZhi4IHEFSVO8jGITbTsPsyZgJQSK0O39p9PJ7P2cRP5kyataCTvO5jXJvERMBApS31S0OCN+cxImFFcCf+NwVzO3TQTCdjdC/f+iot7WxCkB/RhRK+LK4ncNVd9IfQ24Ewsarsvuf+szAZsjw1oxM7WumcXVZM/hywouNfroEA5UyPirkFPqbkxry+RiUMJ2DBvb8l2r9rSF+tjixZFMdxJhUI+J+Fzt/HyEMj00A3ku5nJHrO/gkKCmWjkttdSXzmokDVIF8ubDu5AijSCfk3NrdyFbBD68SeFp2eZx5dGIxK1jSdO0/48IP/PxUVpSIr+bFu+KPW0MRhUgpTK8qfLzPkjCJD/Dw1kj/kLaHfvO/KeM2Zzbt7RqEc1JMRBQ+iZgDeRkVP6nc5ELjY9yT9ZB9FSkTmOcHmyj+LCNgKMB+SYd3P+Qf1XM61j4asExpe6f/aMsXfiazdik9dDQECq1CQtQANAGQme8wcvMwWE5aFgaDfw1USvE+kqTr9tDjXdmxVTJsGZSgmyT50139FbosoXi20Y/RbxDP4O4nRsK4uNIb/6NgIBbX14R0oiHDLC3y8oMS1iu2hNYJz0upX4xz2FGt0ZN/7yfjRw4TMIzgMQF2wevvKzajaYSoHL2YoRvnq1bAut0NGutaxcFDaLF5lir/6bVze1A2ZbYMd7jpANCHaxk1Yll6g1dBxr51AWuEup5hiS7n4SA==
X-Forefront-Antispam-Report: CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(23010399003)(376014)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(261102123227099003)(261009223027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: L9Sjcq1Of1ifinXFSLx6dzH7e+w46XfsivIq37iiefLeNRe4/RQSb2cMNFRMo7Nk7rGZYy3DQ0HZk2ReP6m87LVFyMKJL6ktm4h/21MszlUUO8Q8/odml1xK4NPnhSqX9F/uyOq6TnE6AraSci+rEUK0TdHcmL6x0NGkp4dhLwRBuwiqvQlcbvIaUECm+9sjZdcVumTdRaXI0o6l8SyKF4j0cyxrp9QJp7+wQwskbpZff1UbMET8sXjKU9V6yHYXfXCawQL/C+3kuBf/ZHTmPtaKdU1ocCzsQF0pCS3BCZeSgzE4y4p7PbiAaDGhI4W5tQTlbItz+ODLMbJUj/x6NnkQ3px/AXMHnyMYR66b60EgaGbWYCcEV/apEhDe2uxoY2vxZnBcBell93aODwR1g/PlYfceyNK9wuulj9uvO2gpnrM6F6aXVa7NZGxaXs5V
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 02:41:55.0069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8594a89f-4392-41fb-e80a-08df3ae65ada
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: WA1PEPF00009B3A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_184201_207802_16E8C3E6 
X-CRM114-Status: UNSURE (   9.69  )
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



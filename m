Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE419606D818
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 14:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wBuX4tkm;
	dkim=pass (2048-bit key, unprotected) header.d=phytec.de header.i=@phytec.de header.a=rsa-sha256 header.s=selector2 header.b=VqlCqGhJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Op6KfpUeeWzwK9z8FLWKm37+4oTkBnz/6pxiR59GP/I=; b=wBuX4tkmd1b555
	hFCitL/BQILjCiph3NhmBG37amjjNXnGrqLRzoGfnJHGAu5sJNPopiR3S1NJKgou9OqXd+bOx9DQP
	DXOOmN958q4sz94ZIXyAxqMoVVICMKR8FnlnzMkvrW5pqgQT0w5OKtq6WTQumMwVqpohZdswT2fUn
	Y7fP1xcO1iC/uai4IgjR7GPEOm8LLJHjoDH9yQd5NrigogR05PX4ne8YxuW8+uXZPr2WCs0D58ASl
	Pnly3Evtj4it0QG4R8kaivOfJ4ARHQ295uPnU70ZL97CDjR7arJlEPCdXG54nd7IsZnK4dyghSbKN
	txKJXKCOjaPRfU3ugd7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKcA-0000000CbXV-2DF3;
	Fri, 06 Nov 2026 14:08:22 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKc6-0000000CbVE-4BkV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 14:08:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVv5PMap7W1D1yJr9BhjMlMmNmxkt+6yvk3hKHssCn9tE9hyMmGO6O6QRGCW3pfBPhohxkyRKmmev+wKzAhn8RKANUs0FZBvqOE+yMr4hhxKvTH0woM41dMSNkExszokv+RwRCTk4XIEkjHhIgqw4PKYvqthjkSZPqoJWHrwM3fSvE6HeDwKfXTEt51tsfSQmLhE2Tfnl6S5C9LygH+ymeS1XpXdvnd8/u1CCiZhQxso5SN8cqyBoN0jAn/q48oLWtqZu6Zt6sXa/xW6inkfvVJeZjWnt5ctvybxiHE5e/cIvVvGdxeMY4oEkDl38U7edm9TNNXnjD3Qc6FWCPDUOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Op6KfpUeeWzwK9z8FLWKm37+4oTkBnz/6pxiR59GP/I=;
 b=U6nGqWmClrIj2/VHfWzj85U5ltGDpJcPejgQL+mVDDAAz53oziBYUv4K1Gk3Rr9t8VjQm6k6M/BXOvNcVVu1CmRkii72o1eUJ1rqUkevP6c4OqLK1GdPdlyA2f+c+E6PDc3DWnzivBLmFOUt0eEt5LqyxVuubM5cUAyv9IEPFdKZxH5Qr2uY3dwTfplikgDC6gmOQszAQ2SMe2j9ATf9E3neqcxgUpgcZpVGff7N5r88n6SlsStzPGomblGfphiB9oq8DW/sOtjvyNebYvxl7evDocqC+DAHrZRUuITuq1D/h/iUjSbqnE1JPbaWZ7oKQAMl88Uyr6+0QLBIaAeB5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Op6KfpUeeWzwK9z8FLWKm37+4oTkBnz/6pxiR59GP/I=;
 b=VqlCqGhJI7Dp4hEsc/pwlWAAQgyOz+siIwuseafJ504BbxZmGx7dQ0IuTCgKSF8v9Q4/tQC76Uu5lDndn1N3bnnzfeYcJiE8fPvPiFW/9Mc73ja2szK4Cmrf2e62Z9gETpm8bCb4XKurJ2aTZZkITHCZomqA6pTz4WZgpoAsVlhiPuW5RomRjuX3VAxO9UFWkOEdrejHyLZqq7J0xvyr9DKzSdZQ5q3mWYbwvsCXDubNww2znfu8LDaxMyHu1O6r3RTazfPZ1/ZPyKcUTXSNAP4qB1PxOISausN4tg9YbyBiF8rfj538pa5zMd+uER1OCEn2ULmS/oCTV4TUv6fOAA==
Received: from GVZP280CA0029.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:276::6)
 by DB9P195MB1370.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:29f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 6 Nov 2026
 14:08:11 +0000
Received: from WA1PEPF000099D0.eurprd04.prod.outlook.com
 (2603:10a6:150:276:cafe::4b) by GVZP280CA0029.outlook.office365.com
 (2603:10a6:150:276::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 14:08:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 91.26.50.189) smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: Fail (protection.outlook.com: domain of phytec.de does not
 designate 91.26.50.189 as permitted sender) receiver=protection.outlook.com;
 client-ip=91.26.50.189; helo=Postix.phytec.de;
Received: from Postix.phytec.de (91.26.50.189) by
 WA1PEPF000099D0.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 14:08:11 +0000
Received: from llp-jremmet.phytec.de (172.25.39.81) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 6 Nov
 2026 15:08:09 +0100
From: Jan Remmet <j.remmet@phytec.de>
Date: Fri, 6 Nov 2026 15:08:03 +0100
Subject: [PATCH 1/2] arm64: dts: imx8mp-phyboard-pollux: fix i2c3 gpios
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261106-wip-j-remmet-phytec-de-bspimx8m-4200_pollux_upstreaming-v1-1-aea3a86f3f57@phytec.de>
References: <20261106-wip-j-remmet-phytec-de-bspimx8m-4200_pollux_upstreaming-v1-0-aea3a86f3f57@phytec.de>
In-Reply-To: <20261106-wip-j-remmet-phytec-de-bspimx8m-4200_pollux_upstreaming-v1-0-aea3a86f3f57@phytec.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Jan
 Remmet" <j.remmet@phytec.de>, Yannic Moog <y.moog@phytec.de>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF000099D0:EE_|DB9P195MB1370:EE_
X-MS-Office365-Filtering-Correlation-Id: 973e6d43-f033-4d1c-7b4b-08df3c0f6411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|82310400026|376014|7416014|36860700016|261022105027099003|11063799006|56012099006|261009223027099003|261021121427099003|261021135927099003|261102123227099003|261028144727099003|261021123027099003|261026140227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: r2Z/dv3eVfS83e5Z+VKA1IAZcny7pXJpCbNABlYtqfr/xftDAC9KKSgSV0e5L0nhmTl/WKyN2Bhmz625JABVMFVciFqy5t9fZvA/iLL8uFZaGfz50X55fosUf6AKYOf5mRxAooH8Etm6tyevn2Tkrm+e4Lz4OAXjP4stZCtm7h0in3Vdmziot6Pv2OGn3EOpil+U1l3PD3pD/smfuRV/r1W4q+vedjk6nYtZ+RC2nxnSmWLOLmO1dTBrpTekqCBjuX5bjD1n3D40kAr6X1x+pYJbXhy6PWSuiTDuYAs17Ta5JaB4dOYb2AyBM7eTivDAaZ8MXuZhfNff/EmmIodDMtZhKjbZOPqKidq4AB+xS4VybYPk6U/gBJWZk4Tw04a3A9D9Lwo61wZYtzSlv7YgmNaQ1LrCVQ22ce7GDPq5qPt9EwLqCywgbjPSeZjz8kVCt3DnpL8gmOaoZ+rza/+aEa77iH8VkKJ1adIwR4zwc2qDBlwvzO8prJ+WdDro5o40YI6yYnGRosnRNl3E87bIqArsKGL01cQRMQIatgf7nO61WY3NAMPBWApp++NfPuvVQiZFNChkBPGxSCVjPStGztpFuJ+6QREY87fiIwY/unXYfSI+izHMTIUFDEoFXyEgJlLnvXh3yDAK0+tMqR50jNhfDG+LVyPbVhjIYVXQE4QuVZVNi8PAzWHR9Bdrc76c/MIJtUY2hy3vNkH2KYwVcw==
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(376014)(7416014)(36860700016)(261022105027099003)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261021135927099003)(261102123227099003)(261028144727099003)(261021123027099003)(261026140227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9wBoDWjcuNA6t25/WwMWyvyAbQr31i/UD2wuhwWwXRF4ADJaoQwujPNYA189FCvpNrtqyKHFp7x/XBjoERVaCXFYzmxrMleOI9lW4xr9q6+9PKottnxYogS6QsGlCXLNnD/MgzsSqt0IiQtnCN3Re7biQrLm1V6vwzzNusUub+/3jNR+mXkG6Y9v5FuKxY19L+sRv0X7KZtW4h74FmoSArIMzNGTZY/TILU1hZ0WTJdgKbSHoirApk4caypYzxX39j84SMxbUqJZB0OxbvxQqzYOcamTgTNh5MaQ9ub+ZhNZ53P2t9cApsTz0ruCLU+7V0ZNvnTw7bFFTO7auij2erZUSM/Zeoivs5NmPc7tXXqYzL0YIdiGVCw4mMMPb/lubjMAgqmDNuxv7gIzKQ3VFfUCVVCfl+BVUSk2ZAYnGk5voge7fkv53O8PUsK7vrOe
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 14:08:11.0371
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 973e6d43-f033-4d1c-7b4b-08df3c0f6411
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: WA1PEPF000099D0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB1370
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_060819_064213_B7567437 
X-CRM114-Status: UNSURE (   8.91  )
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

From: Yannic Moog <y.moog@phytec.de>

sda-gpios and scl-gpios were swapped.
scl is GPIO5 18 and sda is GPIO5 19. Assign the correct GPIOs.

Signed-off-by: Yannic Moog <y.moog@phytec.de>
Signed-off-by: Jan Remmet <j.remmet@phytec.de>
---
 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
index 4efdc6bdfe12..8bb2a8976df8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
@@ -289,8 +289,8 @@ &i2c3 {
 	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c3>;
 	pinctrl-1 = <&pinctrl_i2c3_gpio>;
-	sda-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
-	scl-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 };
 
 &lcdif3 {

-- 
2.53.0



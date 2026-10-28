Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3559F60A5BCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 17:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nngYiYW8;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dZ83+HfF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VRp6He+df6jnk4yVbTrWOHfgNaPmnw08rHN3iaNftp8=; b=nngYiYW83teLU7RWXej2nMWTFd
	WNBF1OGmbxmT7vVcHKhF1Ye6JA6kE53Y9L420teqXleb8VooaQSFWPjsqB7+i3Z0332feYk5QNqjA
	Ee3Y27pe8odLGxwnPCrTKAZTOo02Gxq/W51hM0AkRFezsyU5YBd9NNt9lgrWUSnSjofQ2lJBStnfm
	JqUa1Y7RGL57EQe+y+cWzcfuj1tiFl/lojX7GMxXizwv+s8TVAHdEGbqpRey2PrODpxIetZAYeal6
	MZxtkS5L0/1rn96GCFWzjfcAcHwJScTUgOCz4tdzEf/Jtd8e5z/eiUJ5QMNOAZ/9yPoDfXVxYyAK1
	S9ywFaDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM7ah-00000007gFT-2xyx;
	Wed, 28 Oct 2026 17:37:35 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM7ac-00000007g9A-294u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 17:37:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c3MQZr9tK6oIOeJHReyq20lkKvK6dN+KWW9YoHqryb4i3WVCsmUtaCGignzit9EvbNeR3VrZmIxcmSQ1GWDqVQMYDopppEaiw+UpMnyrQtUj1rIm8+o5M2c3rlDMk4ugi2mHBk6XlxYBSkeRte4CucSnH+k6IzlMtIw1z121dGBxFIsCRgzIz9lNoOnLo6DNNgG5OOLpv9hNhUvvDPSpaRuCc51TNXb04BDITAx4Il0LHmmSi6MCevNrUkDfxeGF7dyxPHTG6o4dVsSh3YaQ+7QsX0wq/eqYOneyduBxByR9Xqblg9Nheev4n7o3bqlgL2BOOqKwoa5Wn61FF58VHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRp6He+df6jnk4yVbTrWOHfgNaPmnw08rHN3iaNftp8=;
 b=RbYzQ6HVFO6S/iQZEVWEqBLmAEyrUUBGGBv1Nq4WpnfBtJ4J4NHW+nykfXicyIGejNxm8X1tnPZL3C7bPK9h5OJfFwCGy9fI+dfJ4MnERsXASiUDVvLN/uMZsWy/1WpE29IOzvOPQWC0ZMRxjQxe+4xe5/XnDn0AeXCx4bIHTe4Ppg2+rMbuJ2xUVfkr0HaEfx1fTPTGRX8MrcDkqqtI7Ptu+YLR2Y4FXqzjBxdiJxexpxQCYvrgHYtXi4htKPXD6umtXRFSMlysNN6hkUZcbG+tZjkC013cWnPu1bHxCXB4iSD4iH3eNsrpghZ3QGy86uH63s2pJLr0R9B0QRsYqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=codeconstruct.com.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRp6He+df6jnk4yVbTrWOHfgNaPmnw08rHN3iaNftp8=;
 b=dZ83+HfFYdjIWIkPoZ8Rj5CWLEmIcIGhmIq9buwGeIK7a3u693OT0u5Xsf7anhWOQoCluK+GRHEZ4lc+uMTd+84GlwjaqjdpTvGX0rLvgU1mWDgjap8mSOeWQx9S+ypQWHtvt1fOL6LfpPiHX8aFd3kvLHS6Zr/Wp33qhE9aSHZuRYzogS0DKdAnYRnz1cvWHaJ/rZUIN6SsF6q3hSC9hLSGZ4bH3nVugDiBBW/v9T3ZL6Qz/0cAzVL44YVIC/hHDHvwLtbC4VabBAC+fOcsAS/XvUSkyQRtHgKDfX+J/qGwVpHHwTgXFDMRgKezM+4uEyk4cU2oH6KtLCzUBBbAcw==
Received: from DS7PR03CA0207.namprd03.prod.outlook.com (2603:10b6:5:3b6::32)
 by PH0PR12MB8005.namprd12.prod.outlook.com (2603:10b6:510:26c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 17:37:18 +0000
Received: from CY8PEPF00000052.namprd05.prod.outlook.com
 (2603:10b6:5:3b6:cafe::9c) by DS7PR03CA0207.outlook.office365.com
 (2603:10b6:5:3b6::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 17:37:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY8PEPF00000052.mail.protection.outlook.com (10.167.247.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Wed, 28 Oct 2026 17:37:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 28 Oct
 2026 10:36:55 -0700
Received: from nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 28 Oct
 2026 10:36:53 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley
	<joel@jms.id.au>
CC: <devicetree@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, Jacky Huang <jackyhuang@nvidia.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
	<billy_tsai@aspeedtech.com>
Subject: [PATCH v2 8/8] ARM: dts: aspeed: g6: Remove board-level flash stubs
Date: Thu, 29 Oct 2026 02:36:15 +0900
Message-ID: <9a5af3be251d15aef269cc6c2c92eef1668f7cec.1793179064.git.jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793179064.git.jackyhuang@nvidia.com>
References: <cover.1793179064.git.jackyhuang@nvidia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PEPF00000052:EE_|PH0PR12MB8005:EE_
X-MS-Office365-Filtering-Correlation-Id: ce970946-6939-4cee-ea17-08df351a1c59
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700016|82310400026|1800799024|23010399003|18002099003|22082099003|56012099006|11063799006|261021123027099003|10067099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: Notg6GY3uFGSggBIdES02flPqO1QndcYuaWxtlNAF1GcH62zR0UAiyFzog6ioXbWmHMrE7FZSfNmsReGMR5qG0HMS2XpSxdyh1KOarFVMlZwS+O9BZwRAG1cmn5zy4TFq5M5tRRKpup3kQrMUCt6Njiw8U5P+BaN4wSi1477LxMDb+fuqWyjfmp9uCTq+LMrFcgwTu/EpGs0YkmeVUS+no98xEj0B6Q7MUUPiIhq9OHWZOgfVrE3Tw4bF7IfhN1MDPfEoD4f+P9tdSlqc6xcKSCE7DJLJSVHBOzmt6tm0jMRUs58sX9vPLXioihNowvfiM+ysyionK/NeUsI4Icv+bWVNDbikp+w4bMfxLqI38sNDohVlraWJJxln+sK0UeJZi1np6XsPCIXSrcNyFfGV1koL1t7PnQZt/BMson40b3s0qcTk3xxeFMFZuHA5oY6WoDzxJJozHtcrPui6azbRilVce8Yc0reKoHzhi49umDdNX6H5Jcr/kJRbXLojsymWYx+LXWZCvbxgAVclhVVPBhWwNSYgFjR3xlAjDrPpICpRVhkW7dmfjnMCMSTpJts1UDTcE+CByYCAmHMNmW/aSQB9KYXsezttXZjbtFrIC9cJDCVm3qrmbVdSe/wpIpWYZGf8IrpYx0WUZCy/yfRCjFKcXhf1pu56nMuMVqNRLNHOOUubmLn3ofwOgBstTiIA6inVW4J+gsXhdvf30U8+w==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(261021123027099003)(10067099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 2N3Inpe9Eb/o/Y8XT8ILJiAqboTni7cl4auZh79RHIIc0qFGk09ndzyO1M8jIIVx/3ssmEHZofFyRJXnQJUG1NT5QCWGy8KvCbKp5fV8BwCPDxZethdNxtxf39xIIpB92TgYStM1kTdzTH2+gk0XwfbGmXo73e1EWwQyhtScPQwxWRAnNQFoX5qy0+LN/WqhpRUmacwA1IwlwTY+DMXMp2w35HanpQidM4/9fN6MLJoQHBkSeUFWJ3alnwX6KLEowNI0TNpihqbj9qnri82Z9JjlxgXe/wpqbCT9o+suyypjmqOt2SiUixsa02vyL2+QQPvMOj9NbDiG/DSB2F8Bjd8n1DY2Ol1t2R6kex+RdMe4m7pf12UQOYV4sLD5vSEHSUH/HbbCNMoY/AWKGtra9RgdnmohWPjMQvWRT3LgivIW0Gd4OE3mcWLMx0WgQCeC
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 17:37:16.9686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce970946-6939-4cee-ea17-08df351a1c59
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY8PEPF00000052.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_103730_627048_20E29C8D 
X-CRM114-Status: UNSURE (   9.45  )
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

SPI NOR flashes describe board population, not SoC IP. With boards
now declaring the flashes they use, drop the disabled flash@*
stubs from aspeed-g6.dtsi and leave only the FMC/SPI controllers.

Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 56 -------------------------
 1 file changed, 56 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index edf4b74f5..de705c544 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -119,27 +119,6 @@ fmc: spi@1e620000 {
 			clocks = <&syscon ASPEED_CLK_AHB>;
 			status = "disabled";
 			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
-			flash@0 {
-				reg = < 0 >;
-				compatible = "jedec,spi-nor";
-				spi-max-frequency = <50000000>;
-				spi-rx-bus-width = <2>;
-				status = "disabled";
-			};
-			flash@1 {
-				reg = < 1 >;
-				compatible = "jedec,spi-nor";
-				spi-max-frequency = <50000000>;
-				spi-rx-bus-width = <2>;
-				status = "disabled";
-			};
-			flash@2 {
-				reg = < 2 >;
-				compatible = "jedec,spi-nor";
-				spi-max-frequency = <50000000>;
-				spi-rx-bus-width = <2>;
-				status = "disabled";
-			};
 		};
 
 		spi1: spi@1e630000 {
@@ -149,20 +128,6 @@ spi1: spi@1e630000 {
 			compatible = "aspeed,ast2600-spi";
 			clocks = <&syscon ASPEED_CLK_AHB>;
 			status = "disabled";
-			flash@0 {
-				reg = < 0 >;
-				compatible = "jedec,spi-nor";
-				spi-max-frequency = <50000000>;
-				spi-rx-bus-width = <2>;
-				status = "disabled";
-			};
-			flash@1 {
-				reg = < 1 >;
-				compatible = "jedec,spi-nor";
-				spi-max-frequency = <50000000>;
-				spi-rx-bus-width = <2>;
-				status = "disabled";
-			};
 		};
 
 		spi2: spi@1e631000 {
@@ -172,27 +137,6 @@ spi2: spi@1e631000 {
 			compatible = "aspeed,ast2600-spi";
 			clocks = <&syscon ASPEED_CLK_AHB>;
 			status = "disabled";
-			flash@0 {
-				reg = < 0 >;
-				compatible = "jedec,spi-nor";
-				spi-max-frequency = <50000000>;
-				spi-rx-bus-width = <2>;
-				status = "disabled";
-			};
-			flash@1 {
-				reg = < 1 >;
-				compatible = "jedec,spi-nor";
-				spi-max-frequency = <50000000>;
-				spi-rx-bus-width = <2>;
-				status = "disabled";
-			};
-			flash@2 {
-				reg = < 2 >;
-				compatible = "jedec,spi-nor";
-				spi-max-frequency = <50000000>;
-				spi-rx-bus-width = <2>;
-				status = "disabled";
-			};
 		};
 
 		mdio0: mdio@1e650000 {
-- 
2.43.0



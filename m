Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90E6606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 03:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o/yNS0Kh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PZdvWPMNEOdZTboayEPkrb6WCP5CvFdbFdfgscNHK2Y=; b=o/yNS0KhOZvre05Th0Clt2EOMv
	lt9hQX6RORTGy8zhjAUqId5cr9FWU5a+lMlrj3BsIpLZOvjzBfEOZXZFdIkmSJ8wfgw1hLpGAvgvn
	YMvpcRKDTAGh5s2sOg3n6DVZf9sa6tMMfRWt0T+YocaBRKcqdGNLr13YsD5+POx+benXxkJhOopmw
	0Gh+0QEFbIHfI6SkDdD80trmyyD7gRUc6k2cNaOSfjAeOtwyuhdm+OGjt0KdO2FOj//N0W6f3FV0L
	ZyaMtAkImyo4cSzD96vUiuNX/fOU8ovfxUwCmzlCKtYLg3Pz8JCJsdjsAT/gtlMouYH9qVnoWmkbd
	XgLGqutw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNiLe-0000000FQG6-1JRJ;
	Mon, 02 Nov 2026 03:04:38 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNiLc-0000000FQF0-01UD;
	Mon, 02 Nov 2026 03:04:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ymb+zVWy2PqXuo1U4aFvzeBNjWbh4QVUO8h9Ci8EwdKq9trT6vyCI86P33ONGQsMm5xm2vYJqHxlmtArjxK7VppTQpP43qWETq+DexfdMK7/nPZt0n0BsgVIPh87DeavD+tn2LxgtJkhfEw6e8nCWF3qNN9cazztg3tqTiYKJkbF+DA8riAGz0hi5wNCimXTUYykoh+KKccUnQRLTX4/HVvzvjs0HRyz6v0rKhYIt5cA+qbfP5PuuW38xBpYM/i02wN4VsxxunQB+o4NBdMG8V8nHW/EjtSAKkrwR8iYV3a3qybUfhTy9EaefN89vZsbelNBvAMx+nrd7+n/nIQcdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZdvWPMNEOdZTboayEPkrb6WCP5CvFdbFdfgscNHK2Y=;
 b=DHN+0iXXKCsk4bM/nBTM/DCyUAk3DoBcm2tjsbPktIAGRlHSxORoN22GqQEOnnlDmZp3T6jhGmurFOuTBxvk1lpB71GQNWlyBMkJewrjrmsqkVo7FcqkPyYPz/8wZfOZiUWY31i2PxBiL7sQlBht6IFwv1uB2KH/cJdfDy2m3eH3ZtjihVZ4zTEIEVbLxLiRF7axzPA0CqwhO2uQ4TyUObjjkDwiEM685fKO1B5ynEjBcmzo+KERwkaPupWys2+rgt1DprqjzMaJvwA12dbT9ERzm0tWA5xUKI9snwurhavrxTFBiTaqaLrEwq7SEVWBwzLOOzl8HTX6bzeqFAIyng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0029.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::8) by KUXPR06MB8368.apcprd06.prod.outlook.com
 (2603:1096:d10:81::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Mon, 2 Nov 2026
 03:04:27 +0000
Received: from SG2PEPF000B66D0.apcprd03.prod.outlook.com
 (2603:1096:4:192:cafe::b) by SI2PR01CA0029.outlook.office365.com
 (2603:1096:4:192::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 03:04:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66D0.mail.protection.outlook.com (10.167.240.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 03:04:26 +0000
Received: from localhost.localdomain (unknown [172.16.64.56])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id CC52940920E2;
	Mon,  2 Nov 2026 11:04:25 +0800 (CST)
From: Luo Liu <Luo.Liu@cixtech.com>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gary.yang@cixtech.com,
	fugang.duan@cixtech.com,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: cix-kernel-upstream@cixtech.com,
	p.zabel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	Luo.Liu@cixtech.com,
	Wuyi.Shen@cixtech.com,
	EastLake.Yang@cixtech.com
Subject: [PATCH v4 3/3] arm64: dts: cix: Add Sky1 DP PHY node
Date: Mon,  2 Nov 2026 11:04:25 +0800
Message-Id: <20261102030425.1957585-4-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261102030425.1957585-1-Luo.Liu@cixtech.com>
References: <20261102030425.1957585-1-Luo.Liu@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66D0:EE_|KUXPR06MB8368:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4cc904c7-90ae-448f-df2b-08df388e015c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|36860700016|82310400026|42112799006|921020|56012099006|261009223027099003|261021121427099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: F4kM/XaReDdwcSkUuwJW3zPh0puhb1FZMm0tFAXq2/LOfOQEO1A1EiynanSLyoewUfiaqbZTASXBLbeMVmD22ORDvOHl6GW3tPJVJH2zNweFd/JjM2OBHr7gNq/+tVcdX9CYmvdbMKlj3QloolgJDqy+DJi/ipH5+AXloYi31gdKABBSdyR09WEWRcKYP2pjtU4hJzw6W4W4EIKmKPhZrrLaEDddnvBKG2Bgo11QxYKKLnUh+m2eKxVRjEF8O3EJxkUuEWfRrmR0OZSsH7ow3LCOOrSRU8FEPJBjo/SForaMxQ7+PdgqXwo637w6NowrjuqkdMPulaBvIq7M863hhO/SPHiPBRDcAhAs4t54oQFux/mQr8qFXeRt0hM11GWYZQNeotkseQBAeK/BoT2jTq+Tkh1Q8lzdR0RnDSF0nk9CircMorE7zVHLguA6OrOTVL5FhJL9NShJ9LsjYsvEu6q41QNKSSya0YWXeRCDSCiHDStXEDx7uU4gnZMOpHnGU/S8tqWWT1x3rpjzDTkDaTkG/lTn1vUzRTeQIoDtACdod/pJGMluRgunxKdJs5dpn7SWuz2B6y2VP1mNZV6O649bS0dLj2mIMwRFg1se8N9J9kg1JQu/6ghubpnjJYYwJSNSiP/lZyaBzCsL9RqmwAOiOzcvws4LeN2UiTyJXY7m0QwiSay1EcQE105oohpGJqszKGYZ1Y9z7JExvyhBvZjUclp6soHSJUDsiMB9gDPMzIr+7C0Ab7ZZ3m1KYrY8
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(36860700016)(82310400026)(42112799006)(921020)(56012099006)(261009223027099003)(261021121427099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lQxs5mUNTxsFoqPBKesupAN4F2HgTzuJcJAjAxXE67xol5daTyZ6O/NS2Zrvl1yXaN6eh1zRoPRBrYV4C3O5L1pdSxiz2u11DQGT00nFkay3TcfxmiWgL82FizxPDtdh4/DnYdgFY5tx5CaWmhMUV/JBPHutfPXtCFQ8PAA4lP01GXjcMr6/9HM1sfq324xhLKUFCZBogdk32MPCiwhUE3wW4yvrW+9OPH8UN3hAiPgwSSFF9iEMDZF/NDltnovtVyha6/zUa2AW2VvbnScdVm1xNhcoP16qjUN7WPhTnOmOJedGgxcvxDGWAo5cJDRJ5HjB0UCoyPpCGFPE7r9b3ebydmyWhZkMxvPV0t1U6rWhKhOCgVkRGAc2bOHe7E5BXT/C8c7J/5tDB3oEDW0b5T/GJiYTCCOizhQnoNtGFJyxYyJ56m9c6sZPLNOE9tOO
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 03:04:26.7520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc904c7-90ae-448f-df2b-08df388e015c
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66D0.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB8368
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_190436_052005_851F8526 
X-CRM114-Status: UNSURE (   9.29  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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

Describe the Sky1 DP PHY in the SoC DTSI, including the DPC2 APB
clock shared with the DisplayPort controller, so DisplayPort can
consume it once the controller is enabled. Enable the PHY on the
Radxa Orion O6 board.

Signed-off-by: Luo Liu <Luo.Liu@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts |  4 ++++
 arch/arm64/boot/dts/cix/sky1.dtsi         | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
index e39c87774c12..b659c10f1f4d 100644
--- a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
+++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
@@ -36,6 +36,10 @@ linux,cma {
 
 };
 
+&dp_phy {
+	status = "okay";
+};
+
 &fch_gpio0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 0a820f45feb9..cbc14ac5b2b7 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -762,6 +762,16 @@ ppi_partition1: interrupt-partition-1 {
 			};
 		};
 
+		dp_phy: phy@1414c000 {
+			compatible = "cix,sky1-dp-phy";
+			reg = <0x0 0x1414c000 0x0 0x4000>;
+			clocks = <&scmi_clk CLK_TREE_DPC2_APBCLK>;
+			clock-names = "apb";
+			resets = <&s5_syscon SKY1_DP_PHY_RST_N>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		s5_syscon: syscon@16000000 {
 			compatible = "cix,sky1-s5-system-control", "syscon";
 			reg = <0x0 0x16000000 0x0 0x1000>;
-- 
2.25.1



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66BB606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 08:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KyfgXSs4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TALd2tD3KaCkVwTSjviOuKEa/hjB+/91eq4eMjUUc0U=; b=KyfgXSs4tDa8I60GaitUdJpIm3
	mNnWvgmVK9rSSxKQGP6J3E1KdLhhyQhMsNkFljY+X30hKdCE5s9ehKnOTltJM6OCRDS32WvX8M4L3
	Q3JbSriLCzhZUyaa8OrHnOB6Z1pl/Rp8lrxLa1DioiF/gZSXMGybzMT2Bi/v8wMuz6P0LTJpvz5A3
	3RogeCvRSjAUEUF8At4YSs7zLx4WNHn0hhmxtsUYTPVT0gfLywzw2d8Ujp8VaZoC3FxkzBV04cHGA
	ps3z3ucYHZ2MgiK83n7u1NlwroidIZFKcAm6A54pFM6KMuAxu4eLQkNLzEj+hlEiLFxl2bp0TldLA
	KgAwMPLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnCk-0000000Fqc7-3Oj3;
	Mon, 02 Nov 2026 08:15:46 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNnCh-0000000FqaY-3SoQ;
	Mon, 02 Nov 2026 08:15:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ujsOf9oSvc9yJDp/spRDErYs9DFcAgiDdQ2EzvOYZGgu3vm6xEeAJsFcVl3G1EdJRB85D/IoEB00JmcLZeJLQr3iLhHv2ud2iQLAx/H8ZEpvsGTtM+NL4x1aMoMEUhpMMsq+BO30Y5EVksXmbHTk8EStneqXgMVivHduptbxJLFPMeGQXFcbuk0C7QWCxYC5nsEjTYW5WhoSRvzGGuOzSj8dqIpB4HN1WvWm8DE0Z5weMWPyyZ/G1/FKb4IE9BeaHsSq5jxI0ZO0/hesdIdg1EcFoukMbb1eDb0Cg04UC5/TcKsUdBOhn5DjbK+0s6XoPDWQhZY2uA0S6qOdilKWQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TALd2tD3KaCkVwTSjviOuKEa/hjB+/91eq4eMjUUc0U=;
 b=Zn2UAqFaZxJXIIH+d9iDHQL7R7K0eDbAZX0yfqHqbMSqLvteCNjZa1xTyydj2VnYcqHYytgGZtT0MHQCMGHC//itoePn3Wisj8egDj7jj4jHfuQdTbhtWJFuDcT0Hc+DeR5/kGK5Dnq7b5UfqAdffQdy4eMZAi9fPGtRFg3M1eHtzKQ1B7K4hIEVDPGe1EAIni0BGXO/w+QmXyoHw5BvMjs8CXuK+oiZXmN+tp0i2OsmmAFCi+1QUhluWKq9MsFYIRMkG8v0w8oeMJ6VI3utUYdj4sr4xm7uMRMNyMRL/Ce+i+ENukWeJV7ax691hCjMVkjrUBEcUW2KsXzWdwe0hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PSBPR02CA0001.apcprd02.prod.outlook.com (2603:1096:301::11) by
 TYZPR06MB6192.apcprd06.prod.outlook.com (2603:1096:400:332::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.8; Mon, 2 Nov 2026 08:15:35 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:301:0:cafe::25) by PSBPR02CA0001.outlook.office365.com
 (2603:1096:301::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 08:15:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 08:15:34 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.55])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id C771640920E2;
	Mon,  2 Nov 2026 16:15:33 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH 3/3] arm64: dts: cix: add Sky1 USB/DP combo PHY
Date: Mon,  2 Nov 2026 16:15:32 +0800
Message-ID: <20261102081532.2305142-4-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261102081532.2305142-1-gary.yang@cixtech.com>
References: <20261102081532.2305142-1-gary.yang@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|TYZPR06MB6192:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 35edf797-eb58-4c78-d734-08df38b97868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|36860700016|82310400026|56012099006|261009223027099003|261028144727099003|261021121427099003|261026121527099003|261022105027099003|261026140227099003|261022075727099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Nm9OhhwNLzMkepy6aZpjqjQJfTepYbPlE6bsuOR+yqiL8DAB1u9aG6wIhJK9x6wBQaJcjmePLpP/5GhoW4uoNgVrLO2cUuVV+yrP0h1Q0zd3kw/MFUwR7m7iR2LChfu+pAkKx2uECQjiPTKSMccI5AoNCRCQdmobLT5XTnFaSS+V8zTaprLwWSBYmGVDGACgAdvtQ6FTebinLLHYvDUvC8vDaMRx7QBrAnRLFOTx9fnferuIhiasgyFHyO0JPItx705PNeuJWXnrGULf2SYXvpL+rU2Gwzx3d3itDLL2OqCDzW9Gh0trgj6O8aBl1KspnNwI2kfV1mpd5c0UBS3EUxVjeNxVhqAZpOn1HmomEG0Z3yRYo5wyoLqhon3QlAVhkMD3f01jO9nv+aAEWl+tX+Y0mV66ln0juVDj3oQBtjzBBZShQWKZPqPTs2DEStXF9yfv+zITPg0ZIVM+n0tmQDKxLs1GA0w2lioirg9o2mdY4XSc62Vn2zvqJObIlA0PTMDwpmIB6h0JJsKuJrFd2Xdyi6hFKONMjkqDck/lC0YI9l5gl16mU2AC+lis7c2DN9cpYbjZNbJkbt5D/QJoMONXfsNiv6GqPOm6hVRNZSYOooMTOxJy6tB4TjVO8cvhFEnWv0jp9ZYg9pUqzBh6FgSWxiX5tF83KLzZE0IXOqDzRcAMZv1OGkJ/VvhisvQu
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(36860700016)(82310400026)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261026121527099003)(261022105027099003)(261026140227099003)(261022075727099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FmPSYE7kT66ZDmkgwtkoxUcADCXkZ/zAecoBx9zTEo8zfpDNVkv639E0Yj9aGGgk0x1f3LavNvSipCMZWVpI36BKPKszIubwn/SjfigQbF7iwXTW1F2DjaKmNx+1IjJCZm6wbinJm1HLBHMXi53AfTBSmrp4PimPnAqOgIjLXNckco6d/pnzlePFZnCAD35Y+XiqrhSAXT6nqTxRelDMrFY3o7gq6RtSAdpCJ8zlURw/Kg2z3/0qSxoVDWD5oNm9T0YVKIE4Ca/n4wHlKYkqZyAJPa6xyq1irwy6XEr23n3U7rsGhN69RT05JXtHULuRS/Fz559zSmQeLu1uf7lChNX7PRUG9tiTvo0o9mqOjLuCGk16FE9me25t8N4TLi8ebMmx/IURYn1fFGo8kEE+rztcdMa+fPRafzqTDj/N6tzJ5C5T3LLPi7ayXgazegHu
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 08:15:34.7745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35edf797-eb58-4c78-d734-08df38b97868
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_001543_877994_1085C413 
X-CRM114-Status: UNSURE (   9.40  )
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

Add the four USB/DP combo PHY nodes to the Sky1 SoC device tree and
enable them on the Radxa Orion O6.

Each PHY node describes its USB and DisplayPort lanes as child nodes,
points at the S5 system controller instance that controls lane muxing
and plug orientation, and is disabled by default so that boards that do
not route the port stay unaffected.

Reviewed-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Gary Yang <gary.yang@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts | 28 +++++++
 arch/arm64/boot/dts/cix/sky1.dtsi         | 96 +++++++++++++++++++++++
 2 files changed, 124 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
index e39c87774c12..76f75185b6a8 100644
--- a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
+++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
@@ -117,3 +117,31 @@ &s5_gpio2 {
 &uart2 {
 	status = "okay";
 };
+
+&usbc_phy0 {
+	orientation-switch;
+	mode-switch;
+	cix,default-conf = /bits/ 8 <0x03>;
+	status = "okay";
+};
+
+&usbc_phy1 {
+	orientation-switch;
+	mode-switch;
+	cix,default-conf = /bits/ 8 <0x03>;
+	status = "okay";
+};
+
+&usbc_phy2 {
+	orientation-switch;
+	mode-switch;
+	cix,default-conf = /bits/ 8 <0x03>;
+	status = "okay";
+};
+
+&usbc_phy3 {
+	orientation-switch;
+	mode-switch;
+	cix,default-conf = /bits/ 8 <0x03>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 0a820f45feb9..672aade42d6f 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -606,6 +606,102 @@ mbox_ap2sfh: mailbox@80a0000 {
 			cix,mbox-dir = "tx";
 		};
 
+		usbc_phy0: usb-phy@9030000 {
+			compatible = "cix,sky1-usbdp-phy";
+			reg = <0x00 0x9030000 0x00 0x40000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&scmi_clk CLK_TREE_USB3C_DRD_PHY3_GATE>;
+			resets = <&s5_syscon SKY1_USB_DP_PHY0_RST_N>,
+				 <&s5_syscon SKY1_USB_DP_PHY0_PRST_N>;
+			reset-names = "core", "apb";
+			cix,usbphy-syscon = <&s5_syscon 0>;
+
+			status = "disabled";
+
+			usb3_phy0: usb-port@0 {
+				reg = <0x0>;
+				#phy-cells = <0>;
+			};
+
+			usbc0_dp_phy: dp-port@1 {
+				reg = <0x1>;
+				#phy-cells = <0>;
+			};
+		};
+
+		usbc_phy1: usb-phy@90a0000 {
+			compatible = "cix,sky1-usbdp-phy";
+			reg = <0x00 0x90a0000 0x00 0x40000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&scmi_clk CLK_TREE_USB3C_0_PHY3_GATE>;
+			resets = <&s5_syscon SKY1_USB_DP_PHY1_RST_N>,
+				 <&s5_syscon SKY1_USB_DP_PHY1_PRST_N>;
+			reset-names = "core", "apb";
+			cix,usbphy-syscon = <&s5_syscon 1>;
+
+			status = "disabled";
+
+			usb3_phy1: usb-port@0 {
+				reg = <0x0>;
+				#phy-cells = <0>;
+			};
+
+			usbc1_dp_phy: dp-port@1 {
+				reg = <0x1>;
+				#phy-cells = <0>;
+			};
+		};
+
+		usbc_phy2: usb-phy@9110000 {
+			compatible = "cix,sky1-usbdp-phy";
+			reg = <0x00 0x9110000 0x00 0x40000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&scmi_clk CLK_TREE_USB3C_1_PHY3_GATE>;
+			resets = <&s5_syscon SKY1_USB_DP_PHY2_RST_N>,
+				 <&s5_syscon SKY1_USB_DP_PHY2_PRST_N>;
+			reset-names = "core", "apb";
+			cix,usbphy-syscon = <&s5_syscon 2>;
+
+			status = "disabled";
+
+			usb3_phy2: usb-port@0 {
+				reg = <0x0>;
+				#phy-cells = <0>;
+			};
+
+			usbc2_dp_phy: dp-port@1 {
+				reg = <0x1>;
+				#phy-cells = <0>;
+			};
+		};
+
+		usbc_phy3: usb-phy@9180000 {
+			compatible = "cix,sky1-usbdp-phy";
+			reg = <0x00 0x9180000 0x00 0x40000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&scmi_clk CLK_TREE_USB3C_2_PHY3_GATE>;
+			resets = <&s5_syscon SKY1_USB_DP_PHY3_RST_N>,
+				 <&s5_syscon SKY1_USB_DP_PHY3_PRST_N>;
+			reset-names = "core", "apb";
+			cix,usbphy-syscon = <&s5_syscon 3>;
+
+			status = "disabled";
+
+			usb3_phy3: usb-port@0 {
+				reg = <0x0>;
+				#phy-cells = <0>;
+			};
+
+			usbc3_dp_phy: dp-port@1 {
+				reg = <0x1>;
+				#phy-cells = <0>;
+			};
+		};
+
 		pcie_x8_rc: pcie@a010000 {
 			compatible = "cix,sky1-pcie-host";
 			reg = <0x00 0x0a010000 0x00 0x10000>,
-- 
2.50.1



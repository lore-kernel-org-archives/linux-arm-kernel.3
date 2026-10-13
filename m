Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82383CC6B08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 09:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+G0vO2BFzHzK2W1JEdKydTUPF3CcnRQTI5XjaEM2Z1o=; b=DmCC0F4M15ijv4qA8/EvSnOWdt
	qBGKqaPX/aCMeXjIw8r0qllk61ACeGV9dLNBH+aORAlaypOMcEzb1rw4aF9xsyuhfbqZsIiHhqhew
	43k1xhUH56dlDYBQ9+85HzT8qDehPIUbeLoBKU0OHLe49qpCnlWDHio9Yp1HIdtS0F1xetE+pgPm0
	Cai7kOJkotnU7EXmbimm18SgUPBEY70sH7z7MAVBwhMA3j8Ww+R5LF6nJr5+jCG+IKP0yr0yVarTN
	RtpLjEBVxWFnLWMJHs9pGk+8sncuzJ8irbCxPU6XuqJpS1wrD+M/KVB7CJ1MrRTxnEmQzcoK5z4Ri
	GNQE5haQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZIF-0000000CVdf-3j52;
	Tue, 13 Oct 2026 09:59:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGZI6-0000000CVXC-27Wk;
	Tue, 13 Oct 2026 09:59:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+G0vO2BFzHzK2W1JEdKydTUPF3CcnRQTI5XjaEM2Z1o=; b=XFTHnehvAP008mg+yZhiWq1kkq
	7VPEpwcF6A7C7HCDdCaLlG16nf5YvdWMHuiDY/aJ/VvZesjyqGnCZYynpDm6iKfyV+1z/7M4diwSY
	w6Lt1W8Hu+t0T86dJx4UvZq+M2DiL8jV6lNXpec10KFmsrw0WXaPjxQpUtiTPTfn0v++E5Mq45pez
	F2HwRSu0MKkLQUbh8t0Eo0IAI1+LMTV2jSFOGMavm4GbbjfzTHewhCHWzkGh6mrEYw2bRoKMZ48CO
	0oM2rNJWNzEaokbbdVD3XvOEek5XCVnbzCm81Of59uuQwZ+rSpn11M3PZNgWx2nP02r596Uwlw4qY
	vFdvi1yQ==;
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGZI0-0000000FNpB-2XOF;
	Tue, 13 Oct 2026 09:59:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sIlclXz2vh6WVQfGQU0gC/7hBtV6Ipm60b1bdYnnOKSSFSNmKeZiWWGs0wXtR3UuqNpQ2jHBDtebn9jYomsV1fzFoGobV/FsN8/lTATanPsYtH8rVAhVhvqhXgy13BSD8RX4Qicg4PfG83bGeI5FW6sR7UYnUjfNiBm5YYIf+MJxkpNNLHc4oESMuQOcr19Cjvl1GKRjKuzGd8Yd2H8nCK6amuL0YBP3Z6l32ZSy0N+BEwPJGl11AfLU5AW+a99dpsTi9Cj11JpQj8mtydU/cfpV/uj6dLLeqGykMsPni9wEQ+8Jk0UyLpMJ5MBZF71z5Xq+VQkiVC1YlLCIZiV+qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+G0vO2BFzHzK2W1JEdKydTUPF3CcnRQTI5XjaEM2Z1o=;
 b=qczkSGhzOXu7yRLeN+GdowT92+BSxyVdH949UF8N5oNVfUwz0tU3d+tkpzDiJASn9rrp6xyWO8lC2+QIB4arnnlU31UQkCTqg+TzTT3VOMkPRl2Cn+CXD6evOBv94xCmuwXhHkavJTWyrJvwp0JMr/YbP7Vtxl4T2x/IN1Z8HAtG/cWR4lth/Jw1Iy3XiXMZjxUTHgqryvPvBk/sDgYAwIGkPfMSEjPr/j8u9MqczvHfY72pIuWHF9Tr13LsJmly3OpjEWn4tHi8vBClqppn458SQGcIVZeSSClzNHlAPbBaBeOhXfPsgl51eakyzayHt2TVQ2QLDBOmHlWBrHzqeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR04CA0208.apcprd04.prod.outlook.com (2603:1096:4:187::10)
 by KUZPR06MB8252.apcprd06.prod.outlook.com (2603:1096:d10:59::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 09:59:02 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:187:cafe::a6) by SG2PR04CA0208.outlook.office365.com
 (2603:1096:4:187::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Tue, 13
 Oct 2026 09:59:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 09:59:01 +0000
Received: from localhost.localdomain (unknown [172.16.64.56])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id F366840920F7;
	Tue, 13 Oct 2026 17:59:00 +0800 (CST)
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
Subject: [PATCH v3 1/3] dt-bindings: phy: Add CIX Sky1 DP PHY
Date: Tue, 13 Oct 2026 17:58:58 +0800
Message-Id: <20261013095900.758464-2-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261013095900.758464-1-Luo.Liu@cixtech.com>
References: <20261013095900.758464-1-Luo.Liu@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|KUZPR06MB8252:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 35ba96f2-a74b-468f-520f-08df29109ba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700016|82310400026|42112799006|23010399003|1800799024|921020|56012099006|261009223027099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: d08jq0JpZfP4ElilpemLdaUJs5JXwlxhHrbwGcKIUj7aUsyNjA5gbKxrXuYaWzTrd6WeB0FQGACYQH8EYFEyK5nGq9WlHmHmWvEgydahbGJ7qzrLukVhgmtQK7WRC7DMQFebW/QP2aUySnS58F+dpTRuN82ecoJDfYBR1XTWVlh+rMf2HIO5pfzJkxyozYW7M0gaGFqAySNQeeTienNVDAP7YObvAGkj+vY7rNib+r7cJJPFbb5atAA9A0nJLoFZHjLGY+heGraJUgqnPk0NOmEX1RKVwBPlx0fe5NcjHiQ5DSvR70GJsGAC/XSHzHwKnju+9P1Jdh3kjyLnkv9KceHkAwgnCH79RcvFlT7Ulz6faXodBjQ1zM7rHw2Ma59+sYLY73o83lGJJPV8xMXjLfJj0AwkF+Bwg19weWwAGPxx7rgl4JCnPKPNeWN0aUXlcjwB+g2go5+891uv68SpBxLkERczXcdQ5vZXbgcu7ma0KCDs4l4zu+SLXRwlt2TwoeqXDEXmRVyB+JyUwOppk+gAV9raZHfCQ9QpObwpkO36SeM+r2oJsnkZ5kOXIZyMhdMqpeTYD/I+4sqE0QGF+JP6DUy4TtaKgG+MlXoeCmH7oCfxmE6EXmqPrbRFTY0F3hCtwbn5HmGcNgTv5iIps+OCqWurDc00AmaSDPoqmW1CMY1xfz+/ZBRUyICrp4gt
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(82310400026)(42112799006)(23010399003)(1800799024)(921020)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6lFtNC6+oO9veUKLUn7AV/cHN9vk4ssK61QmAakWDVQn+xDiUUQLrsPTJLYKkoAaxEPIDOymmWZKJTEgKMq/oHnh5AjQAPm3iGnKNP7wKFMW6Gn+RpVpTnsNcoZNSUdyE2ta+M+yC/o/wTX82n7wojxMC/Ok/WtCpHhIxpMjxbn7lvGn07iGgPf4uTXFCaQAWLEnWcgmAqw+JTkwfl93i+yV6ukliPUhZuQeA183362aJGUlS5Cbvv40YEIOd9M4vCYMajv+oiNdUx26BFt6znH95Ut4MnLR0VCvxuDisn5KIhIbpCqK6Yib94KdnvyBrLSYdNEAYvp0x7XC8o0/f39M1+S7t0TmcpTBcAsNI7674IPnqN0pGDqInkA7BknfJlmVBOigyE9uQnEJGCkgJLT40gdolfLvgwM3tw6qhIHi3YhIPi0qxIkRiJLBwOV4
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 09:59:01.5749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ba96f2-a74b-468f-520f-08df29109ba5
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR06MB8252
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_105920_986265_42E94EE0 
X-CRM114-Status: GOOD (  15.57  )
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

Document the dedicated DisplayPort PHY on CIX Sky1, including the
optional cix,edp board property to select the eDP swing table.
Add a MAINTAINERS entry for the binding and driver.

Signed-off-by: Luo Liu <Luo.Liu@cixtech.com>
---
 .../bindings/phy/cix,sky1-dp-phy.yaml         | 56 +++++++++++++++++++
 MAINTAINERS                                   |  8 +++
 2 files changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml b/Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
new file mode 100644
index 000000000000..be0a4029a592
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/cix,sky1-dp-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CIX Sky1 DisplayPort PHY
+
+maintainers:
+  - Luo Liu <Luo.Liu@cixtech.com>
+
+description:
+  The CIX Sky1 DP PHY provides the PMA/CDB register interface for the
+  dedicated DisplayPort instance on CIX Sky1.
+
+  The PHY APB clock is physically shared with the DPTx controller and is
+  managed only by the DPTx driver.
+
+properties:
+  compatible:
+    const: cix,sky1-dp-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  resets:
+    maxItems: 1
+    description: PHY hardware reset
+
+  cix,edp:
+    type: boolean
+    description:
+      Use the eDP voltage swing and equalization table. Without this
+      property the default DisplayPort table is used.
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+
+    phy@1414c000 {
+        compatible = "cix,sky1-dp-phy";
+        reg = <0x1414c000 0x4000>;
+        resets = <&s5_syscon SKY1_DP_PHY_RST_N>;
+        #phy-cells = <0>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..b46d0f4220a9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6360,6 +6360,14 @@ M:	Satish Kharat <satishkh@cisco.com>
 S:	Supported
 F:	drivers/infiniband/hw/usnic/
 
+CIX SKY1 DISPLAYPORT PHY DRIVER
+M:	Luo Liu <Luo.Liu@cixtech.com>
+R:	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>
+L:	linux-phy@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
+F:	drivers/phy/cix/
+
 CLANG CONTEXT ANALYSIS
 M:	Marco Elver <elver@google.com>
 R:	Bart Van Assche <bvanassche@acm.org>
-- 
2.25.1



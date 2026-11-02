Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F76606A336
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 03:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2WMHcc+V
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oshhTtTAIEEjN/mrpPYmkDIAn5Lu3NZFglnc0Hhg0Jk=; b=2WMHcc+Vn3+4ulJ0tBDSk35BAn
	VzWxJx9VDeSzbbgg+0V7bDddHxsVTgReCQ5HFfFjOTfoAvb/j8Xar3pnf/ydmSLphX1ZjLM37Pbws
	WX1r74d2Z0kSlHjIfFhxIh3uSwnj8k0AdIxnjWk6i6+fyfslem1WSLuGVWB0DH1tOesyi2EEC1r8w
	IY+PQfLHuwe1B85hxZjJKaP5J4jjNwP/amiMEUKZfZIyntCoBhvgdIOLG2rggxB2AOiEn6qNelEQ5
	/XHq2zWtmUXfNPRKTo2814v+bv/oTYvjtKaRO/AM7t0i7draQKqOTK/Bnglaq0oZg3r2TVdY2qlS3
	cliZpzig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNiLi-0000000FQIo-3co3;
	Mon, 02 Nov 2026 03:04:42 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNiLc-0000000FQEz-0nCg;
	Mon, 02 Nov 2026 03:04:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qk4U0Ldqhqaz+Yn7JMsVZCnoMYMVYBTerR4bdk1FZ0cqD6UGSTNbYPpUAFzrjmz1sKQNAvngTm6q9yymtvwQ9IVgBPtExPQ4jsXoF7wh2l0dskxxCSSyaKGh/89NsbSRB6TpbM3o3Tu/TtluQFO5V/zEetbsu7K7SlPcv7e/RDJ3mCPHMtLhrlu3sXFCcY7YnmbF1q1kr+jiXz+c4aHQ7EOme0FVXo/6p9eGY7BeLL9vANZjR9gFZEYG43GAElzFofl/f1Fbm/9Qm3APmJlHTSR3yM6d6U2wT5hi8SYvBceIgebjhUDvkqkj/TK9IJ6rYyf4oYbFD2KcBM+jYRrs1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oshhTtTAIEEjN/mrpPYmkDIAn5Lu3NZFglnc0Hhg0Jk=;
 b=PH+fOOsM9gCZONNLr5dIHCbrMnow+oBB516c+wishfZ2rim+VOLpKNSQ6YOL4mUowkq1KE7tX6y+lkf4uuXK4GZDhkzQT7hoiZh30N4izef9/DDbZd+CCtdz3Shwli7aOgSielJeGZKRMCdpDlVloWesQRZda90Nph4XQuBM+s32jLQgEPdjAz1LeOGn/4QGiigOgkArF98/+cDWZ53rv+QmgTMyz0EZXRTgLomAyDEQUdmSwVsI/5JyxmUXrK6rpbkkrSWdT5acl2yv12n0fDuH9pr/QCrVh7+mekINzR6pcDIx2FmRYhaqMPtXdGx04frLYpLKrZr63vtVqGFCIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from JH0PR01CA0128.apcprd01.prod.exchangelabs.com
 (2603:1096:990:54::19) by KUXPR06MB8293.apcprd06.prod.outlook.com
 (2603:1096:d10:5f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Mon, 2 Nov 2026
 03:04:26 +0000
Received: from SG1PEPF000082E8.apcprd02.prod.outlook.com
 (2603:1096:990:54:cafe::5b) by JH0PR01CA0128.outlook.office365.com
 (2603:1096:990:54::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 03:04:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E8.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 03:04:26 +0000
Received: from localhost.localdomain (unknown [172.16.64.56])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id B489C4102B4B;
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
Subject: [PATCH v4 1/3] dt-bindings: phy: Add CIX Sky1 DP PHY
Date: Mon,  2 Nov 2026 11:04:23 +0800
Message-Id: <20261102030425.1957585-2-Luo.Liu@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261102030425.1957585-1-Luo.Liu@cixtech.com>
References: <20261102030425.1957585-1-Luo.Liu@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E8:EE_|KUXPR06MB8293:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ea2e3d10-8946-439c-26a4-08df388e0155
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|36860700016|42112799006|82310400026|921020|56012099006|261009223027099003|261028144727099003|261021121427099003|261021135927099003|261026121527099003|261026140227099003|261022105027099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: mJp2Wd7iC5oP3++eCnwM/BMJ/AuN0xkI/Ho4SfK+DMHGU2lYittdkWF9JJwH9QAvZqqmcZvS+WaAmYt0Yp4Mz1O9x/RIAS7dBLY+NF86zj18AsQqv6HOQjXZYaAgYJeI/b+aBUwDNJCSB/l+aYOOt5Z/mK6Uqnkswfy7frpkCuC/pfpjYNSouTbdZUloqcPr7LbfdzGpVL20ReGULRi+YapruMxIdBEDMwuXT4cG3ahUqLgDI2M0copHy6MHW/52kCpl6YHuN3b4Yyvfzq+/G8eMYgLQl6bHlLj0cDZsM1gqE8cv62EEHJq99PElxjyN+QZT2SfAggMo/TCc/XCvoQYv3K0Qs4+qTKqUocy5T+Q8KAHU6lUtflNvj4WxUe8dGSxI1/uQATEu2hJ5AmMKZBZIMsHNlgtFovdgsPsV88596G/5aP61arClmMWe7ucgHJOcAYnX+4gEqBYb7iweNYFWUw9u/b9t3BsmJ6TdH78HbL862L2KTfMkvaXtK5XMnr48ixr0SOCr1rtTLpkY5HO7A+757GTdDWU8xIAYv8PSMgiCgREB9qxEk5sDh6ijvsqJGFFblhFbu8N7ZjyBqpv6AHM51AieG5dgePDTKGmw8C9CzpdRmJ+8YSLiGjhBOr+TtfJMQT9iwSIqUPkj76q4mcVVDx3sKk5f+z7E0Ko8TDHOXKKwI5MRTFywe5rC
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(36860700016)(42112799006)(82310400026)(921020)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261021135927099003)(261026121527099003)(261026140227099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jPOg9HfE7fNlTJ8kPAebE2DBCiadl0C91e4BqJOnoeTKhtfwrvaUFZLT0uiizEU2MyjIRr+UkV7O9BO2vv1wno9/gUTe5YUf2WVdDXRblllZbiP2Cmo6wqgbet6OQZWcd+6eFwK7WSFTIk4n3Q5DNM8SvMo7innjKioGps38U9XbDFj2FHXbs7KW6e25YY5yuH68aKOf4z77vJbDFoak8keiNreN2wOeiGHr3/kpU/uAjqyDg94pQHoL88R6Tse3I1WbQ8ND8zVM71C+n1gDQtFUFrvfoPj8k04kvSYxmEnJnizvXTLQfk/MvIzmBjOmfv0VYhuU/cDR9I5Ry/utWm+djzkIcVIAiObpE5FwVy6PqUPdquivnxjqychoIWCg6ZXLySLpNdoy1/YSG/CyKOk6rl11wEUUOFIzaNYcejBoHCQqK2xk6hGIU9FXx3Vs
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 03:04:26.6861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea2e3d10-8946-439c-26a4-08df388e0155
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG1PEPF000082E8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB8293
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_190436_232218_BAD6F173 
X-CRM114-Status: GOOD (  14.69  )
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

Document the dedicated DisplayPort PHY on CIX Sky1, including the
required APB clock shared with the DPTx controller, reset, and the
optional cix,external-dp property to select the external DP swing
table instead of the default low-voltage values.
Add a MAINTAINERS entry for the binding and driver.

Signed-off-by: Luo Liu <Luo.Liu@cixtech.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/phy/cix,sky1-dp-phy.yaml         | 67 +++++++++++++++++++
 MAINTAINERS                                   |  8 +++
 2 files changed, 75 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml b/Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
new file mode 100644
index 000000000000..ea19f0aa0b1c
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/cix,sky1-dp-phy.yaml
@@ -0,0 +1,67 @@
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
+  The PHY APB clock is physically shared with the DPTx controller.
+
+properties:
+  compatible:
+    const: cix,sky1-dp-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: APB register interface clock
+
+  clock-names:
+    const: apb
+
+  resets:
+    maxItems: 1
+    description: PHY hardware reset
+
+  "#phy-cells":
+    const: 0
+
+  cix,external-dp:
+    type: boolean
+    description:
+      Use voltage swing values suitable for an external DisplayPort
+      connector instead of the default low-voltage values.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/cix,sky1.h>
+    #include <dt-bindings/reset/cix,sky1-s5-system-control.h>
+
+    phy@1414c000 {
+        compatible = "cix,sky1-dp-phy";
+        reg = <0x1414c000 0x4000>;
+        clocks = <&scmi_clk CLK_TREE_DPC2_APBCLK>;
+        clock-names = "apb";
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



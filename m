Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE187CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 09:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3IACskba7f2NyQ884jfy8TKqSTKGVp7LWm3BRkHuDk=; b=UNa6j9VK15p4rj0Jwa7MSjBwW1
	e8Z2Wzm9NiQn97dJ/MDh8HITdMQuHG8F7jR8XLCzHQGyvb1lvZSg7CRuFZGfGjG3EuiVK05qsW7qo
	JIF4fpwFW++PKi3U+327FyJ8cE/HC+m9VnEtsDWlMM1CJeutz2ctd9eFWwP3NrZZ6bTdiWvfaA3dr
	Y6KCFsWPMN9U0s4z8t6Zmh9CeWmt5qhQihL+YVfmn7rQZrd9af9uASWlvMMsGyriwL/6oHmGxVtLf
	ZIJ3Ien0IaV+JWo5a3R9JI2yC6JHCk9z2IcKbdtA48J97FIb0LkMGeJWN8r8xpN2u1b5tYfMCupWc
	mvDlFfmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7kI-00000000EV3-1uaq;
	Mon, 28 Sep 2026 09:34:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7k5-00000000EQW-0bP0
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Sep 2026 09:33:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=W3IACskba7f2NyQ884jfy8TKqSTKGVp7LWm3BRkHuDk=; b=muis+Lzl7syfHKvGylHRivzgw0
	bB4JmRHGRXuqg10zjpxS+GX5mETVf7nIIz1DG+yQo8fP/JoES7if53pU8nXcMZp6vxWBJ1c8jnJ5F
	oDMeBrKWfSnDPuQAKOzq56VOOhJxm0VooDqexJcnT8m6SllAli5LA44xo9zAvgy6BhSV+SpyrD+56
	9y2d8F70KKwd5fzq9BSz6XHEZdncjBEOIrsOC9vw8A5I+v5mDzSlpW+r2Jr843i9a4J6GgNnajIP4
	DHOuvZ6IaNQGMP+lV6WOyip4KH/OCYRJAxwuTVehTrfALgmXJEWiZFMzjiKxxat2ciSYt3Vf/mkSe
	WGMi5Pag==;
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xB7k0-00000001JBa-47B5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 09:33:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SqoI8/JD+xkadXI5PVj3X0Y49DWlprXvkHVGwFf1OVklMKH0YBhh6nKQNGhJfmSu3XithflZibrvnU5SyyDZUyf01xw5McIOXN9MJS1WuUtmZjY5liXaZQtNbiEJ8nDlcF4+KXzMieZpOUggT+PIHYCB6/k7oZLYJcF2qTv0e1kKjrRJdcEpdgNUJmvhxhoFo602yztfBOVqbTLm0t3Snv5Uz9EdmJZS8VufHedWP4Ohbr8SmiHt8vb8NqidPwChbUO4bVcZ4F2COxrQpo8TXn1Mo840A+7MaGic0MYkMW9LZg6wS78sTanu44pqQWPK8FVJNz2MApML0SGIJtEMNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3IACskba7f2NyQ884jfy8TKqSTKGVp7LWm3BRkHuDk=;
 b=ujizEopadh/WiafXgvT1SNIDet6dzRgffcP4gLmkWCMNsa1S1zWm+W/KnGFkzTxAqBt4GZQhC/zfZ4HcdhcyN1gJrHthL6Y0GczWKb0Cs9ddj+k72bwEBQ0eSpOS0hvPWBQT2i4Kvihcln+dmlP4nZPGa4OGKB7JnJCWgXAlFA38HA7v9pn9Ifv89r2dBbHWBwQ/z2xVktRyiThwDDFZQb5RFEccxm5smlh7UTKGbckDHwWL8UrR31PxZy4EWMv2eQ+/wqGfZWx02TlKtxcIhOyBp+W75f0d1QH8hbSyT1n/wLdu+y20Fbz23Uovq9tgCXhwjIEHFDMZl+vSfOZb3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3IACskba7f2NyQ884jfy8TKqSTKGVp7LWm3BRkHuDk=;
 b=qc/AnPY3rPgtQXgmHoFzTZclVlqmWv+sev+I8befEJRPDgI6aHznQ/teNsV7XXxeokzgJfS5/IsJHVOV21XCXUamDRN6NUc07C3RfNwnDC3rDXw9tA80KAEe3/8zD/g0qtY/RAvRlji7yBc1VffMnZUAAyP3cgaekHcMX/pu0yY=
Received: from SN7PR18CA0030.namprd18.prod.outlook.com (2603:10b6:806:f3::7)
 by CH3PR12MB7500.namprd12.prod.outlook.com (2603:10b6:610:148::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 09:33:26 +0000
Received: from SN1PEPF00036F40.namprd05.prod.outlook.com
 (2603:10b6:806:f3:cafe::7c) by SN7PR18CA0030.outlook.office365.com
 (2603:10b6:806:f3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 09:33:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F40.mail.protection.outlook.com (10.167.248.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 09:33:25 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 04:33:14 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 04:33:13 -0500
Received: from xhdtunimkar40.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 28 Sep 2026 04:33:10 -0500
From: Tushar Nimkar <tushar.nimkar@amd.com>
Date: Mon, 28 Sep 2026 15:03:03 +0530
Subject: [PATCH v4 1/2] dt-bindings: interrupt-controller: Add Xilinx
 Versal NET SMMU CSR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260928-smmu-changes-v2-v4-1-3c79a14cd806@amd.com>
References: <20260928-smmu-changes-v2-v4-0-3c79a14cd806@amd.com>
In-Reply-To: <20260928-smmu-changes-v2-v4-0-3c79a14cd806@amd.com>
To: Anirudha Sarangi <anirudha.sarangi@amd.com>, Thomas Gleixner
	<tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
CC: <git@amd.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Tushar Nimkar
	<tushar.nimkar@amd.com>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790587986; l=3235;
 i=tushar.nimkar@amd.com; s=20260917; h=from:subject:message-id;
 bh=Zezb2vSa70oEHIQQJ1UkCYfkaeQB9Tue7zLzFRuIeAE=;
 b=ZmfL2gSAWNqfBEseIYJ8hZzXSwf+vp4b1gyQwPF658L7MILZDsJpnXgRV/DYXAwRfcbiI1gCC
 jiRJ6ZgalXsCoeuzG5p/R5mhHfEdAoPzBlpiR3JUdO9Ug3dfVsMEDWL
X-Developer-Key: i=tushar.nimkar@amd.com; a=ed25519;
 pk=Uirerl/gKBwPgdWL9awJAJkw5FM33ZF2TlUTJ58DEYA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F40:EE_|CH3PR12MB7500:EE_
X-MS-Office365-Filtering-Correlation-Id: c9b5c432-af4f-4517-f3bd-08df1d438bbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|3023799007|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 8zxontaQfXGT7qlrod9gLumuuqEhWUwV5WIEFXUo2PaGj9nVNRhpFhGq3DteTBPlEAlxEEmMSwqzZCk9IJCBtsmp3/z37myCduJoPzruVjS3UZ7p866C4IvUywW9TwXYcCEwzqLZV2gQ58PLe7QsEia1T0mae6/AHdjqhX3BGTWlDzwLAE/UBKEt5e4Qzo6ZCbmFpRRVB6H4vZS8H30t8Uc7s3r1cg2BTWi+Qz20pmhx87Ueoq57nOsGJyIgKSmDS4TzeKWzU42piT3adyfofZg5GR7VYm304awlcJwjf9lY5nPYHVlHQ8YDfus03R41izA750x+J7aU0+Qr0aRSr7AW5W0khTYvNBRC0Cn5kxgDOdH0y2/UkPOIzeFzWd+nv9F6GW57aG0uKyUGYq0EjGXtJ+1OEsEofq1Aziq0L9+6RNVEiizPJy4MNGMe92YQiGfHPb7zVhZOnZ+XcL8n0RHdb/8SixF3oCzCBSyOqQ+RQJKwvzBCWCi6+oWCc83bWvOp+1xFmq/cBN5XhL1yVgAy5iVgyct6DDtaDXfPMdmKi8nTrtydi/NuFzLMiIez8rFafxYbeokm55d+gataE91BXRUOso6lXjAI6WsNKPONOsO02iKIk2WeL3gUVRz2Kt/MQ+J2qaasHKtKemA5Qg==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(3023799007)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: PBFzkbk7b+HzhzZre8wukSYMFgzU6dz7ZZabZoCf15dVaz2sB9kxaTHvi7QyYmYP+Cv6L1/+iR00jTg49kl+YHeDpr/wmohQpTx00Uicb5ULrm661qyETLpSkXFt0Gn3cB6c/HKXssx+hU5DnyM1TpxMsI9Snf39CISAOh/YBs913j1//yYtDcWgf0y0IgVFwWJ4ylsCeYwQste2I2PRhyq8taG+HTLSr9x3H7J8Ye4Ny/StWiG1VghZHKFEQpwsCc5jiJG9eAZP3LOpWpdoGMkl98UeZ9XKPuIT2++lmn74zX1TAD1uGHrBtv+akeKYUdrIc2Y0/kECm2pgnnfYI/DSgWcwMCuPeQaY24b0OH9EyK1h8hb6gQvZgyUQHm3F15BJ72E6sGwT2J7NEqScj90cYPqWNTEF/X/DXZxdk4bHOMfVQOx7oRTG2qpzhgTx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 09:33:25.4126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b5c432-af4f-4517-f3bd-08df1d438bbe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F40.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_103345_790672_BAAC1EA0 
X-CRM114-Status: GOOD (  16.03  )
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

From: Anirudha Sarangi <anirudha.sarangi@amd.com>

Add a device tree binding schema for the Xilinx Versal NET SMMU CSR
(Control and Status Register) interrupt controller.

The SMMU CSR block acts as a vendor-specific interrupt controller
in front of the ARM SMMUv3, providing registers to enable and clear
standard SMMU interrupts such as EVENTQ, CMDQ_SYNC, GERROR and PRIQ.
Interrupts must be acknowledged in this block before being forwarded
to the parent interrupt controller (e.g. GIC).

Signed-off-by: Anirudha Sarangi <anirudha.sarangi@amd.com>
Co-developed-by: Tushar Nimkar <tushar.nimkar@amd.com>
Signed-off-by: Tushar Nimkar <tushar.nimkar@amd.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../xlnx,versal-net-smmu-csr.yaml                  | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/xlnx,versal-net-smmu-csr.yaml b/Documentation/devicetree/bindings/interrupt-controller/xlnx,versal-net-smmu-csr.yaml
new file mode 100644
index 000000000000..38b63e51b732
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/xlnx,versal-net-smmu-csr.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/xlnx,versal-net-smmu-csr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx Versal NET SMMU CSR Interrupt Controller
+
+maintainers:
+  - Anirudha Sarangi <anirudha.sarangi@amd.com>
+  - Tushar Nimkar <tushar.nimkar@amd.com>
+
+description: |
+  The Versal NET platform includes a Xilinx-specific SMMU CSR (Control and
+  Status Register) block that acts as an intermediate interrupt controller
+  for ARM SMMUv3.
+
+  The block provides registers to enable, disable and clear the
+  standard SMMUv3 interrupt sources (EVENTQ, CMDQ_SYNC, GERROR and PRIQ)
+  before forwarding them to the parent interrupt controller,
+  typically a GIC.
+
+  The controller receives one parent interrupt and demultiplexes CSR
+  status bits into the following child interrupt identifiers
+    0 - EVENTQ
+    1 - CMDQ_SYNC
+    2 - GERROR (GLOBAL)
+    3 - PRIQ
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    const: xlnx,versal-net-smmu-csr
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 1
+    description: |
+     Single cell containing the child interrupt identifier
+      0 - EVENTQ
+      1 - CMDQ_SYNC
+      2 - GERROR (GLOBAL)
+      3 - PRIQ
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - "#interrupt-cells"
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    interrupt-controller@eca10000 {
+        compatible = "xlnx,versal-net-smmu-csr";
+        reg = <0xeca10000 0x1000>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+        interrupt-parent = <&gic>;
+        interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
+    };

-- 
2.34.1



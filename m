Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91F6606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 11:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VeYLzk0I;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rjpS24uY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5xZuzujW9c5zQXjxHKk/SR4ZaZokOPcXvhg6StESgH4=; b=VeYLzk0IY4ww0Qa58SekiAyaeE
	hIhvJQnisxGvCYxMEqx3nq4Uv7D5Y7W1o7yopinMxIRH7hKebB6GlNOAdbnlE2sV546YtscA7NrMc
	CZfil0sWJSwu/vp2GSUzg9n8RI1P3+292H6fO11p86ccr3mbuLiGobyraTry/zOvZhigsoaHIJl3w
	05rfhWVBwVVTLfmtYhiJqMySypxYl9bKM8wHhldK1DzMeggVgAEZ4KTTsUovdgeG9tdaPNxnowYil
	R+XZqLBRr9Q3/1V4XKKJGlo8rdDsfN+iU1SjoqYFFVB1lrPvXyM1Q7PJpJwtC95oID03Bo4aa48vj
	RMNjPHrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ80M-00000009XgW-2Zq4;
	Tue, 20 Oct 2026 11:27:42 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ80I-00000009XeV-0aPQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 11:27:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOWtj/SgclR7Td8pL1NQ4CRc1yv0G3eLrlreTkRJiqq2VLp4XYJlRrK1K8nZrn2mdU2vkyGqtj43OoCe1+D/UhxkOI08Anl+/Pv9MaViZMu164BlomTtJ7FSdcOERX8hMCkBXuJlrmReS9geFVmTQ4IaASmi9ElvCkzVufI6/ID9oK2Zfy745mZszdAl5dG1/mpqPz+czgvZslCvXpgbtn5FNJObR0RcZ3lNhGHmPfaHJXeVfE3E6fh0MUoEflbFvkFqTN/g/CH18iIAR7/bdsBSWh7dfciBfGq9FACnSKHUGT0awUCguGnZBxfpTyKoFH0aGGIJvqJQRQtQWGmumg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xZuzujW9c5zQXjxHKk/SR4ZaZokOPcXvhg6StESgH4=;
 b=j2d7lREkPrNdN1WzYF0+qk4g13d78bcdTkJiSLamxD1fbdY5decPrddPdglzbc0iSA1hsKmtW31ZBqUsZecBPz+WTHRr7g6JxM8gIWVaMCAJDniX80BlTHPntbUprBGNkGecz8BkuJ+ozkkfpvoZgSnlUzudcMwudYtYFHZcn4BBBltx6ahLmmHAXZPVPZJ5z36gqQW+Ya/H8CIDnSzBMj0CqxvARvZGbdykecgvweA1bBNhiCAlass5wrtKGifvMZtYShy5B2oN/O1hBJsYpfG1B9OP1MhU/QdN7aNI3CeKpW88pB2VsJN7ra2xdmapzYP2vwQ51AGbDRjBHo4LZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linuxfoundation.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xZuzujW9c5zQXjxHKk/SR4ZaZokOPcXvhg6StESgH4=;
 b=rjpS24uY4egQcgTnMb/2UM+YhEncM5r7hreq5drQGUnRBgl+OFbaXbkMxV9Ck5VJdHefIWj7cVYmc1msSHpP1x+odDcEk849t77T1sx1uqFdxEw605YbYdzs8QKHzq322ufQJ9OOLKUTItYm4uJg74U2/KpYhZKN3XCgEBjkc1M=
Received: from SJ0PR03CA0209.namprd03.prod.outlook.com (2603:10b6:a03:2ef::34)
 by BL3PR12MB6620.namprd12.prod.outlook.com (2603:10b6:208:38f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Tue, 20 Oct
 2026 11:27:30 +0000
Received: from SJ1PEPF00002318.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::86) by SJ0PR03CA0209.outlook.office365.com
 (2603:10b6:a03:2ef::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Tue,
 20 Oct 2026 11:27:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002318.mail.protection.outlook.com (10.167.242.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Tue, 20 Oct 2026 11:27:29 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 20 Oct
 2026 06:27:28 -0500
Received: from xhdradheys41.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 20 Oct 2026 06:27:25 -0500
From: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>, <michal.simek@amd.com>,
	<p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [PATCH v4 1/3] dt-bindings: usb: amd,versal2-mmi-dwc3: Add MMI USB support on Versal Gen2 platform
Date: Tue, 20 Oct 2026 16:56:33 +0530
Message-ID: <20261020112636.2661087-2-radhey.shyam.pandey@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020112636.2661087-1-radhey.shyam.pandey@amd.com>
References: <20261020112636.2661087-1-radhey.shyam.pandey@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002318:EE_|BL3PR12MB6620:EE_
X-MS-Office365-Filtering-Correlation-Id: 46967d81-e050-46c6-5bfe-08df2e9d2052
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|36860700016|82310400026|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: ZBX63YRbhcKTIANasGq6ZAtJMvyPK5tVt6k/+402vpR3V+ADJ8n3IwRRyuCVstmNdyNSa1wAJVrMNPOzXKmpmEMoRuK1Ncdvj75MS5gxrcKPrBSN3703dZPbISuWEAg6ZImOp9Gp7Pt+LGEoDT8/ee204Jl3H5b1avcZ/22Urqbq75yMPuM1FW9PbfZ6yA4fTr3QtrEL1WEkTvT6Tp9JEvhM4zMJpiYSi94V4fB9HRliE1BJAJZG1zLa+TuZu32YSgVzAKkin3lY0gAdxPuFhJ7r0DufJ7lhz2eGrdLIcck+vQXIm7sVdqFG2bt6R9KOx9Ce+eYYMoew0A+MPpxEw5SWC+Ne165ruB1PsgytFoTxCX7Lpwr9G1tGQIal3OcyTAO73l8bFgvTatKommgdD4lnMnvuJoWudUxuPdNLO2kYo6FDHSl771AeoSO6OSx1BsMR9RRZavjMzDUHi3K9A5LaQ8e6PhXF8N/RqbfL+zGSF/RBkJLtI3Afg15zA0a8ax7dTJuwpnBusVXP9eIdxIttSdss4YsUcbFORBVaI9+El6sQdleppDFhUk+TkQJpkMQNQVo6zbkYZeZeHF3NwP4JWVVkiiNZLa7jBAJTDNXNl1qQtoOffShu5an63cj+Qp+pPZPLuXr5Fc7KKoOXGA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(36860700016)(82310400026)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TU7fiN4JiyV/hRulNR9P04p/Bj7dlMXaqihA1jOL9wPXykx+ZKVLDN1CtK4opi1NKfG1rKzMQ7DfyxPBa7oDOJnc91+3kavHcBavEeKtlenROVr3zJsrd65+BfmYouU4mnftF7LtneTmIP9/qwtERpWqUDEqdTTkK76SXjzdN/jZmc/npcF8B0NkH8WL4CXLw2+DDj0qPx1VIdPbt5t+MjHQ5hytlWVS7dzFNk5HaJcfgzuvO09+1FzYciDGCvFyEHjm0GKWhO2+x+B22XPvmxWFyH5eI9ZXTgWUEsdK0hfvwbDE5Dg2m6pdAKfR2Dt+iZy1qUhXcRyy/hL0HPiFFY0GEDjAz9zaw89rryQGrWuMAA1lxboqCAhp92/6Onkxowio4aSSdWVaykLGqo3tTBylPsqusV3mi5xp6F04rFD1LA/ydUthnuhRQv2uwbsO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 11:27:29.5633
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46967d81-e050-46c6-5bfe-08df2e9d2052
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002318.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6620
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_042738_194167_75C5CE27 
X-CRM114-Status: GOOD (  17.53  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The Versal Gen 2 platform includes two distinct USB controllers. The
LPD controller is a USB 2.0 instance and reuses the existing
xlnx,versal-dwc3 binding. The second is the Multimedia Integrated (MMI)
USB 3.2 Gen 2x1 Dual-Role (DRD) controller, which natively supports USB
3.2 host and device operation over Type-C in a Gen 2x1 configuration
with a maximum data rate of 10 Gbps per direction.

Introduce a new compatible in <vendor>,<soc>-<subsystem>-<ip> format to
uniquely distinguish the MMI USB controller.

Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
---
Changes for v4:
- Switch to flat mode and rephrase commit description.

Changes for v3:
- Modify commit description to explain that there are two different
  USB controllers and difference between versal2-dwc3 and
  versal2-mmi-dwc3. Suggested by Krzysztof.

Changes for v2:
- Add blank line after compatible as suggested by Krzysztof.
- Retain the mmi suffix in the compatible string, as this USB 3.2 Gen2
  IP from Synopsys is part of the dedicated Multimedia Interface. The
  Versal Gen2 platform also includes a separate USB 2.0 controller,
  and the mmi suffix uniquely distinguishes between the two USB
  controllers. MMI is an independent subsystem particularly targeted for
  deployment in Multi-Media related applications. The MMI block include
  following submodules: UDH: USB3.2 Gen 2x1 Dual Role Device, DisplayPort
  Transmit Controller, Security Module (ESM) for DisplayPort and HDMI
  Controllers, DP AUX-I2C PHY.
- For MMI USB define parent address space i.e UDH block.
- Fix inconsistent MHz spacing to use SI convention with spaces.
- Move description before $ref and items in xlnx,usb-syscon property.
- Restore original zynqmp-dwc3 example, add new versal2-mmi-dwc3 example.
- Use 'usb' node name (without unit address) for versal2 example since
  it has no reg property.
- Use 1/1 address/size configuration in versal2 example, use lowercase
  hex in syscon offsets.
---
 .../bindings/usb/amd,versal2-mmi-dwc3.yaml    | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/amd,versal2-mmi-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/amd,versal2-mmi-dwc3.yaml b/Documentation/devicetree/bindings/usb/amd,versal2-mmi-dwc3.yaml
new file mode 100644
index 000000000000..f71fccd95b2a
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/amd,versal2-mmi-dwc3.yaml
@@ -0,0 +1,92 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/amd,versal2-mmi-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: AMD Versal Gen 2 MMI SuperSpeedPlus DWC3 USB controller
+
+maintainers:
+  - Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
+
+description:
+  AMD Versal Gen 2 MMI (Multimedia Integrated) USB 3.2 controller.
+  The MMI subsystem integrates a DesignWare USB 3.2 host/device controller
+  with platform-specific clock, reset, and power domain management. It
+  supports USB 3.2 Gen 2x1 SuperSpeedPlus operation. SuperSpeedPlus
+  operation uses an external combo PHY shared with DisplayPort, and cable
+  orientation and role management are handled by a USB Type-C PD
+  controller.
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+properties:
+  compatible:
+    const: amd,versal2-mmi-dwc3
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: SoC bus clock, has to be >= 156.25 MHz in SSP mode,
+          >= 125 MHz for SS operation and >= 60 MHz for HS operation.
+      - description: Reference clock, generates ITP when the USB2 PHY is
+          suspended.
+
+  clock-names:
+    items:
+      - const: bus_early
+      - const: ref
+
+  dma-coherent: true
+
+  interrupts:
+    maxItems: 1
+
+  phys:
+    minItems: 1
+    maxItems: 2
+
+  phy-names:
+    minItems: 1
+    maxItems: 2
+    items:
+      enum:
+        - usb2-phy
+        - usb3-phy
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    usb@edec0000 {
+        compatible = "amd,versal2-mmi-dwc3";
+        reg = <0xedec0000 0x10000>;
+        clocks = <&usb_bus_clk>, <&usb_ref_clk>;
+        clock-names = "bus_early", "ref";
+        dma-coherent;
+        dr_mode = "host";
+        interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
+        power-domains = <&scmi_devpd 0>;
+        resets = <&scmi_reset 0>;
+    };
-- 
2.43.0



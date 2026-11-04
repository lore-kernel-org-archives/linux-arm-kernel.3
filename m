Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0E1606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 11:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZGynPKRG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Bw3iYNs494OoZ2HUqf1eAnVbLeeNMMr6kGoN9P/R7gw=; b=ZGynPKRGMCMfjJrJtOrbDFrmTs
	cRvkZpGF6MReWraYuuyIdDLiJ7UPlMDx+CfWhUREe+V5y8iHvUGzM7d+TQvJxFFhjHQSTLQ4PdDnf
	xzOobULrV1RfZjWRXqNiglTpUR7ysMdWNwTbN6Sl7mQQ3oyiYYZ0O93CNyUwnaSBMig5tyOWm/u40
	Iso2ILOItYy+x0RqtY7zxMWFKyPfdQR97EVvp0ugivxvjE3VyNo9LKyxSZ8uTRDf0tLPIc8OCvUGK
	oJWfq6MW8ZDhCHM5Z/lv3Q38krw0fMCIb3grbFgS2x8HG3jaGWCcxX1nyrqjym+Jch8wM39lp6eUN
	s9crRpNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZFp-00000005Aeu-1av6;
	Wed, 04 Nov 2026 11:34:09 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZFc-00000005AXa-1Bli
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 11:33:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OizsH3LblUqzZS9QpAxYjcg7pUqjtMY5BgcCRT2gqaIdP8KQEcN+jkrZUsBkK2E4hrLWYPL+lf0dF3rp93DZwFXLq3dEWZMnKGUloWoqoyIVIGpwRuZDRFp4eaOHaAZOPxYS/lwht4w/WDJp4MBb6N12DODUI8oIRI1Vq9gKghaw5mhSzaMcfCqMuUVXljJP7oMnMxh0zuw8JkE89pjxgFHhVqTA7wL3y68TXyM1kLVKd6ifSMvUmzTXX6rDC0biljvLl9YPz0ir4jaRvzR6hZScsJiHJsmGebSQ5fbtulXmPnYTgzrSG27FghY3mYitY4EQQps+ApAUqrqXw5pVFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bw3iYNs494OoZ2HUqf1eAnVbLeeNMMr6kGoN9P/R7gw=;
 b=OWuwQ1vDj2p7yew3BfihOZncqUf7z9FJkP4rXhiKn43ggIGHPHY9ITKAtN0zhAqDM27VAGkZN/KVZxgBnn0VIREy9zmH7PjBIv1ub6WlfAtRUpV5jEXboGHjWNmw69t+4URYtVm5U6kPi0CdPd3aNGmIxeaNRpzkdyo0ogka3aZmp6agrBMSAePRYxwdqFR2p4NoO6iEtS9NizRkuhh1aPZEvYRzcvToJxRAEiDj42x1Nz+35Wufvu/Xbzbd01Ea4ZHzOcEU1H66e1Q+x3aEGUVGx2sdTxkPtnRYfnrtfM6eg4tBI22lp2XBdTrvbkoghxWr6Ro/3NmjeK0cklu5vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0141.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:31b::6)
 by JH0PR06MB7200.apcprd06.prod.outlook.com (2603:1096:990:9a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 11:33:47 +0000
Received: from TY2PEPF0000AB86.apcprd03.prod.outlook.com
 (2603:1096:400:31b:cafe::23) by TYCP286CA0141.outlook.office365.com
 (2603:1096:400:31b::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Wed, 4
 Nov 2026 11:33:47 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB86.mail.protection.outlook.com (10.167.253.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 11:33:46 +0000
Received: from cix (unknown [172.18.64.61])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id F3EA942CB745;
	Wed,  4 Nov 2026 19:33:44 +0800 (CST)
From: joakim.zhang@cixtech.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de
Cc: cix-kernel-upstream@cixtech.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: [PATCH v4 RESEND 1/4] ASoC: dt-bindings: Add Cadence I2S-SC controller
Date: Wed,  4 Nov 2026 19:33:39 +0800
Message-ID: <20261104113342.3660269-2-joakim.zhang@cixtech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261104113342.3660269-1-joakim.zhang@cixtech.com>
References: <20261104113342.3660269-1-joakim.zhang@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB86:EE_|JH0PR06MB7200:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4fd17688-214f-49d9-8632-08df3a677d2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|36860700016|82310400026|261021121427099003|56012099006|261009223027099003|261102123227099003|261026121527099003|261022075727099003|261022105027099003|261026140227099003|261028144727099003|18002099003|22082099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: UEicw/p18QQU7CuErj6Cryj0AsDRu3YnVSPqTdR4SX3KnO7Q8cLxB0Q4op0TT017p52JFH/MG5oXO1uVzPonMgHyAcXvj3H4jp7yVNvAQNXVpF33JCNMMSkGSpNbqI1zCRVolrOScniWgQonrzlEw519LEAhkAmxCHxHAKWLsgWJdmByr5OKUwWNi3r/63Nw3NEGW/nhDCdDKJkjsX1cYIt3ocFM7t77wuZdkpfrbS0xyXnhvyIM+B0vsX4JQgGJzbcjBu/9nN2SzJ7/uFQs6BYPRLc+H5LL41qAT1/Lr3s1n4elhy8rYPqnX276om5GB1lTADIiOyZChPLPj68nP2GA0bV0ujXFF24hVCEdwdR6vRiY2DV8RMriNYlZiUxooRLr73Q+NSGS52eA7rMNzVcsvWpvyVG8JCq4NPRsU0QEAC61aAF2PtmEGQPPRY8Z61jkcHkHIm4TIDQgUOKXlQE62P+UdRch13cJNuvlh9vvOtctIZ51BoI6mWW7mlj3sPVhL0fl1jlG3Z/WzHOfIK3jqNUFybF0Cu0k6YADPtyr4vafuxLMgZg5eGZCgpwp/QKLqq/fw6vh4WMYET8Mi5jehjiKATK9nlhY4znROFwmOPPKF8+/4xFJBnME4mcLDJOTgZOiNikwVWEDkIo0uQ==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(36860700016)(82310400026)(261021121427099003)(56012099006)(261009223027099003)(261102123227099003)(261026121527099003)(261022075727099003)(261022105027099003)(261026140227099003)(261028144727099003)(18002099003)(22082099003)(10067099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wxbfTGLos3O3yPnp8VBA8NDQ8xzPJ39HR4/8t5xexSUsXkh8I11hjFdX6rKSx8b8UefsetljD1B9ZrU9w5Fp8HOn1QC4WlRV8Y8DjN3SUAqjDVq/1n0yd1v8N2dIkP0LMGq/GnTMYDF61faBUYz6uQsItJwu1Kg0H9UzNeDvSvEIhhvvZryHjo4c9T80hkc+sQJr+HfGw62lZf74XG7pFogvI5g952voaKoZFEgNRe5HaeEdYmpnvpKiL0unJXmeYuicXQC39zbj9PuNDwi2+iDY+nE1D/f086GcVeeKJEwKYKnQnkfx33PE1uvFM8orZSBy4eZ3m8sixdKuqgW+CU7bMal7e2/SIFJBVyrY375Iy9J/Cs+V5j7/qqQCc0VptsWu0/racC6lTdhATZDchTIEQVFDsecjixougsByU63lStn6ex40StIV7A+B1FMd
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 11:33:46.3859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd17688-214f-49d9-8632-08df3a677d2d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB86.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_033356_325945_6EAFECE9 
X-CRM114-Status: GOOD (  13.29  )
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

From: Joakim Zhang <joakim.zhang@cixtech.com>

Add the DT binding for the Cadence I2S-SC controller integrated in
the CIX SKY1 audio subsystem. I2S-SC is a full-duplex stereo
controller supporting standard I2S, left/right-justified and DSP
formats, plus TDM operation with up to 16 slots.

Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/cix,sky1-i2s-sc.yaml       | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml

diff --git a/Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml b/Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml
new file mode 100644
index 000000000000..9ef11272d0fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/cix,sky1-i2s-sc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence I2S-SC controller
+
+maintainers:
+  - Joakim Zhang <joakim.zhang@cixtech.com>
+
+description: |
+  The Cadence I2S-SC controller integrated in the CIX SKY1 audio subsystem.
+  It supports full-duplex stereo playback and capture in standard I2S,
+  left/right-justified and DSP modes, as well as TDM operation with up to
+  16 slots. The transmitter and receiver are started and stopped together
+  by the controller.
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: cix,sky1-i2s-sc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    items:
+      - const: hst
+      - const: i2s
+      - const: audio-clk0
+      - const: audio-clk2
+
+  resets:
+    maxItems: 1
+
+  dmas:
+    minItems: 1
+    maxItems: 2
+    description:
+      One DMA channel for instances wired for a single direction, either
+      "tx" or "rx", or two channels for both transmit and receive.
+
+  dma-names:
+    minItems: 1
+    items:
+      - enum: [ tx, rx ]
+      - const: rx
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - resets
+  - dmas
+  - dma-names
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    i2s@7020000 {
+        compatible = "cix,sky1-i2s-sc";
+        reg = <0x7020000 0x10000>;
+        interrupts = <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&audss_cru 16>, <&audss_cru 26>,
+                 <&scmi_clk 100>, <&scmi_clk 101>;
+        clock-names = "hst", "i2s", "audio-clk0", "audio-clk2";
+        resets = <&audss_cru 0>;
+        dmas = <&audss_dmac 0>, <&audss_dmac 1>;
+        dma-names = "tx", "rx";
+        #sound-dai-cells = <0>;
+    };
-- 
2.50.1



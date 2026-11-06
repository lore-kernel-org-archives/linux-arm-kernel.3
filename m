Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3188606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 01:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aycwAAAw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9/Qx6qxUBJs47oWfsXb6FwWrl9mTlzB1y+GEf1YVQbY=; b=aycwAAAwOnrE0DNnSeOUoriJgV
	H1duwrfIxuFkhWv5JMFLm+kA2BXn21seziNP3RIKbWEZO+lX3PMkDDvsM5j0LezA7hq98dmeSl72U
	Z4y4OH+KnwqXLDUPwN5uXJ3QgW3+VWxaP+udgndW2ZJ0jqkgzra10BsSANtw4BleIUR6AUO6xrQxt
	ol9nWk7X+iBxSCbl6YjEtqOvYQ2Vl3/4XcOLnxATYpj2YRWPq5w2ajXIf3RHimvnzIPS7HbepNbeR
	rWeP/Vks55WD0TiHkVUNPuPrhsn8GZkXFtdmyws5TdRMrNAKexoPfz+SY1qwtF/mYtaLquX26BwFz
	kN6qjjDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP8rh-0000000AzQr-2sKW;
	Fri, 06 Nov 2026 01:35:39 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP8rc-0000000AzLq-2jJb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 01:35:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CMWS9ov5tgPgbUCOoJVV4azAYB9Nh4oIXWG/fjS2c96kDaXE7yteT/Ck/ZGiPv6Y2SNHasVLfY+8M4hDAjblUtA+vECrkjDwdV20OY5BYsdz0IavuEajuVVubpScmMADw86G4wbrLcYnbEpu5f8FVO/SmsLA1PWgUHvn8UkRklu6TmEqB+IgIuOAg+Fsa/TC5W3bj78JJ/Du3l7R32UUcE+r9VVZUcS34NIOKNMFI5Q+uj0qZZdSDwdlFWxki7wPr/eOwTLHYB8CyAMDf+dT+Aid7m5/JZYVlHFi/EgdiuB38lFphHFsj2VU9ZnTwaDMSN4wfqIsMYiubLTy3y0rCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/Qx6qxUBJs47oWfsXb6FwWrl9mTlzB1y+GEf1YVQbY=;
 b=Xu+VSKC9TcoHoxH2XBshrmDPKF/wAveKPk99n1RoOQBVE52w9VF3sf4xtEQuHwES8KjmvIRT/Kva3e5agySp6JmJmvsHsEYufP14HK8EJyhbWIB9PM/+VR3yATyo0fY4fTNLWTx5rJxJ5ZqbgPxSBu45pjsN6iKwfla9xe44im6GStASDkAVZQEAbl54sX801kgDn068G8n7CzvIpKnhHhYf6eyzWpDJaEDQ61rWSO1jRTzC3aY1tPy8AqY7bn58BvErmve1zMtLRWZWDNFwyTyJIRF/cs9TEqH46LvRYeVh2BiM2OJGpKJIVFUvtMetOy617zHIe3zCVb2Pq2rb0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:300:58::22) by KUYPR06MB8604.apcprd06.prod.outlook.com
 (2603:1096:d10:8e::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Fri, 6 Nov 2026
 01:35:24 +0000
Received: from TY2PEPF0000AB86.apcprd03.prod.outlook.com
 (2603:1096:300:58:cafe::5c) by PS2PR01CA0034.outlook.office365.com
 (2603:1096:300:58::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 01:35:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB86.mail.protection.outlook.com (10.167.253.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 01:35:23 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id D588640920E8;
	Fri,  6 Nov 2026 09:35:22 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com
Cc: devicetree@vger.kernel.org,
	Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com,
	linux-clk@vger.kernel.org,
	joakim.zhang@cixtech.com
Subject: [PATCH v3 5/5] arm64: dts: cix: Add the Sky1 AUDSS DMA-350 integration
Date: Fri,  6 Nov 2026 09:35:20 +0800
Message-ID: <20261106013520.1134450-6-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106013520.1134450-1-Jelly.Jia@cixtech.com>
References: <20261106013520.1134450-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB86:EE_|KUYPR06MB8604:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 14c296e6-33c5-4ce7-2a7c-08df3ba63a76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|36860700016|376014|1800799024|82310400026|56012099006|261026121527099003|261026140227099003|261021123027099003|261102123227099003|261022105027099003|261021121427099003|261009223027099003|261028144727099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Ofpz+T/t8XMC1M4nMnTyhLkOPnpWNxsFIliHk0B184qC78MsbzR8sN4FTh3lZLEpvW45RR/WwkJ+dx+NyWCMNSQE8UGeqjVnwKKEKUiFXnHk/gqXIRtGekmr9Zi/9l+X4Z8F+S9eeh5qQUASvc8p/xOe7kNc1jHVeMsigWDxio8Jmtw/EbU9qGNxBIKX90fbBSrt5FbTfP5fhUrAXteDTW7VxhrwOyP/E6pl7HbpLsioa7dlP6+1eCDTb4YBVwttyNcQkOjWmZ/vnAqj8v5vWSrySyNLS91bfkjr7OBHs0u7+xO/+Xi0cIK17TQJrY/FTxHfTKM89DSmABdIEx57Crr93l93F6roiCvjEcQrkePKdj6BamTorzQP34YmSgxaZJI1NB6BAqN4OZVgqxbngWlt0N1Pa9HhfGZeZZy9XE/n71uEmMPPkMJ2aPg67Umzd6s29Jd2FxzlwLSHWBC0mggGEnO2boz8lzMfW2F94njNzONg6W+kjE1SQBez/3s+aobDgk6NNNX1pxAaBTtL0QVsvIz/znKLEPaW3hph+wXGHmMQTmzovkZgg9yEaP3xzmTuK3o2ESY9xapd1WEXVHxquyCHwG4n8EeDvT0lI6+C2Bq8ID5U0Clj/dm0GN0D2uOvd3U1jvOJ7yakVYEz6VHmaJlyCgylmtFeBQj8XBNn/Z6IVdx/eUZS89ixODYmH+S/2Zl2aA1JxJgq7A2+XA==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(36860700016)(376014)(1800799024)(82310400026)(56012099006)(261026121527099003)(261026140227099003)(261021123027099003)(261102123227099003)(261022105027099003)(261021121427099003)(261009223027099003)(261028144727099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WwFMagnphGl6wQrzRziw1VBLS+MbnxZcNZ5DsZAuby2tn66RelII7wEIs8wmNdclWRZHYRPMQuWvvPLvpc/x4xgcWUCIOQ9ISgn3i65ckE1z5Nqib73N/FTpdx+0aGfZqa9c1GPWDJdO2E62pnHWpM7DzJgp78XVrW2I7z/0YtaCdKkSRrI1ot3vGIhx1ja2Sc9R/uq/dcqdAvDkdH+Yiry8U2MnXYk0fr20UlXQS+zZq0sUpXN3FukCxqKFvex/pcRYydMjl7Za50N1yhkj3Mvxg3CzWgJ9+Qu16cWpeDkYQpXQ5/t8IDIvZitAvpvIAR/TJmo0tLtd6tc0VBaWjiAxdV7LfAwysRmyMlqwxHSRqfHn6gXzkkuADUWwffX1LINrUGpXd30dxgireRq1SLX/4LkVHYT4ZRE2TKr1muqt5CvaU60xJg+fXAJMkJoQ
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 01:35:23.9260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c296e6-33c5-4ce7-2a7c-08df3ba63a76
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB86.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR06MB8604
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_173533_435681_7EA62FED 
X-CRM114-Status: GOOD (  10.49  )
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

The AUDSS DMA-350 master sees the CPU physical peripheral window at
0x07010000 through DMA address 0x20000000, and DRAM at CPU physical
0xc0000000 through DMA address 0x30000000. Describe the 1 MiB peripheral
window and 512 MiB DRAM window with dma-ranges on the parent bus, and add
the controller's clock and reset. Identify the Sky1 integration with its
compatible followed by the generic arm,dma-350 fallback.

Route the eight channel interrupts through the AUDSS CRU, whose AP gates
combine them onto GIC SPI 230. List child interrupts in hardware channel
order and set dma-channel-mask to 0xff to make all eight channels
available to Linux.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1.dtsi | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 5399eebe8eee..513f56eb1b6a 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -588,17 +588,41 @@ mbox_pm2ap: mailbox@65a0080 {
 			cix,mbox-dir = "rx";
 		};
 
+		audss-dma-bus {
+			compatible = "simple-bus";
+			ranges;
+			#address-cells = <2>;
+			dma-ranges = <0x0 0x20000000 0x0 0x07010000 0x0 0x00100000>,
+				     <0x0 0x30000000 0x0 0xc0000000 0x0 0x20000000>;
+			#size-cells = <2>;
+
+			audss_dmac: dma-controller@7010000 {
+				compatible = "cix,sky1-dma350", "arm,dma-350";
+				reg = <0x0 0x07010000 0x0 0x10000>;
+				clocks = <&audss_cru CLK_DMAC_AXI>;
+				#dma-cells = <1>;
+				dma-channel-mask = <0xff>;
+				interrupt-parent = <&audss_cru>;
+				interrupts = <0>, <1>, <2>, <3>,
+					     <4>, <5>, <6>, <7>;
+				resets = <&audss_cru AUDSS_DMAC_SW_RST>;
+			};
+		};
+
 		audss_cru: clock-controller@7110000 {
 			compatible = "cix,sky1-audss-cru";
 			reg = <0x0 0x07110000 0x0 0x10000>;
 			#clock-cells = <1>;
-			#reset-cells = <1>;
 			clocks = <&scmi_clk CLK_TREE_AUDIO_CLK0>,
 				 <&scmi_clk CLK_TREE_AUDIO_CLK2>,
 				 <&scmi_clk CLK_TREE_AUDIO_CLK4>,
 				 <&scmi_clk CLK_TREE_AUDIO_CLK5>;
 			clock-names = "x8k", "x11k", "sys", "48m";
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			interrupts = <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>;
 			power-domains = <&smc_devpd SKY1_PD_AUDIO>;
+			#reset-cells = <1>;
 			resets = <&s5_syscon SKY1_AUDIO_HIFI5_NOC_RESET_N>;
 		};
 
-- 
2.54.0



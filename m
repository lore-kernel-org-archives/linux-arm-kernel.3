Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E19E606D823
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=anwsxpg9;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=xIWUijSc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3G3Ms3FrlpWe/f5dkabpy9ia3gRBqsrXffwm0UQRSpA=; b=anwsxpg97TIlvS
	qbeYMYko46rffeK2duYwdHTUuiAmKuG6ELFALMMb5ECpcO4MFpxSLp3zeT8Y3FYKZQMTNgh2IGoLj
	l9/vOkSAabwgPfc+uFXuGd4YOih+NRsbBGsJpGn3irblAjhIpPyZQwlZwQIgWbwBpTZLjPpr90gsd
	kUfUsCoz+nKWODFqbZCQBkC29B6Wc6m/74/QVKxNiFvUpXs3VO51oaI9yo5DwNKJtb1I5cg6nDDSH
	quq1m1iodSGmujqIbyq62snP7PJ5Fur/YXhnKQC4RsAhdX0D4W4UXe4Fzz1Ibumb+u8wEzjY3FWsM
	H+AaKP+yxBb46jwB1Odw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGua-0000000BrOg-3Qv5;
	Fri, 06 Nov 2026 10:11:08 +0000
Received: from mail-westusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c001::5] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGuX-0000000BrMX-1Qr5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 10:11:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vb6/NHizMyhBbkp0bOBlb/NNzYRvGEPc+yqzbqNBhinRF0uNoXM0ZgbvW8jqRUfUlSYCdaw2G1EFABOk04brPCPicz1INC2tyHdmSwFKbJ8qNJinTmGQXJfdDqjSkQlzx8+l60TEFyDVvWDQ65Infh0nsJDZNbjhHfBhazZRCTy3nkig977d5IJrdXL2T2yPAyLx2zNE2zZxo8P4GFztbmyGGBnUx2xdvykjEnjoPhrMxPAEfp2BDtRnr4Sb16R8gjgJpaooHEqQV9goYT2A99EvhoJUHyKMhPczXwSrwIL4m2hpn3Tp3JWokJ2XGjGPZxZZMHTbjwjEdMA8AfQlYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3G3Ms3FrlpWe/f5dkabpy9ia3gRBqsrXffwm0UQRSpA=;
 b=DYatfm6CNgg+7f7FkHogplqKXcYNDm1C+VtGAHi2+X8HhHnBz4f2KTJU8O2Oa1VndwcrGh+2m/SnbC2uOq9rpyV9Zrro/74/38Zo00CYBO2s9m/BaByTuwa+HMR57lwt2fmRbJOU+86WzdA//yPgGDdaGx7IMHxWPxO/hlECsyjevARzLAKS9XYNKFHTnvJU5Mq8NG0MujFX8OIjBO+wJhr0Q+QXv0am3kPkmwmgfatDpzLQ4GpRJBHY1K3kpJHURgTYHlS/nHWTQSP9Y2xfgEg7ta68Mn12wJYX4h7o+h2g8F7hm2E0kuLboyf0ZZ5B6kIRrQ7Rl1+uMUmv9uRU6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3G3Ms3FrlpWe/f5dkabpy9ia3gRBqsrXffwm0UQRSpA=;
 b=xIWUijScLmIFIyyk5jNh+jIRFekLybfUQR1YUOx+50U/tyjlV9NC0yyLTuFeTuYRMDHruG4/viPpQCWwJ5137dCqxXNVuUyI9qMMNUlxKcsANFa2djwbROla5hMFoTZ+p7Rkv0XuGOvRzDAEiO8SfvBvqEKPD86K2kTYUD3h2kE=
Received: from MN2PR05CA0038.namprd05.prod.outlook.com (2603:10b6:208:236::7)
 by SAWPR12MB999116.namprd12.prod.outlook.com (2603:10b6:806:4e4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 10:10:59 +0000
Received: from BL2PEPF000352D3.namprd02.prod.outlook.com
 (2603:10b6:208:236:cafe::43) by MN2PR05CA0038.outlook.office365.com
 (2603:10b6:208:236::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4 via Frontend Transport; Fri, 6
 Nov 2026 10:10:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL2PEPF000352D3.mail.protection.outlook.com (10.167.254.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 10:10:58 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 04:10:56 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 04:10:55 -0600
Received: from xhdnaggolla50x.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 6 Nov 2026 04:10:51 -0600
From: Golla Nagendra <nagendra.golla@amd.com>
Date: Fri, 6 Nov 2026 15:40:24 +0530
Subject: [PATCH v5 2/4] dt-bindings: dma: xlnx,zynqmp-dma: Add Versal Net
 compatible
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261106-adma_per_channel_reset_v5-v5-2-f9990669362f@amd.com>
References: <20261106-adma_per_channel_reset_v5-v5-0-f9990669362f@amd.com>
In-Reply-To: <20261106-adma_per_channel_reset_v5-v5-0-f9990669362f@amd.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, Michael Tretter
	<m.tretter@pengutronix.de>, Harini Katakam <harini.katakam@amd.com>, "Shyam
 Pandey" <radhey.shyam.pandey@amd.com>, Abin Joseph <abin.joseph@amd.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, <dmaengine@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Golla Nagendra
	<nagendra.golla@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793959842; l=1939;
 i=nagendra.golla@amd.com; s=20261008; h=from:subject:message-id;
 bh=1dM6bYZyFD7c4YgM5KKlXplGTgnCCgTlT1C3K0HM1tY=;
 b=PmyQDEG2X5GbWgPGjeevsPyaxU5nfgkf6UUU9o8MXdemrsjbMZxck0Ed70Nuc+pq1iAkuxAFW
 ivwGx5aYZfnDIUUlXZ5CqKewKRAXitbiCwar9LZ5UGt4wJHi26dk6r1
X-Developer-Key: i=nagendra.golla@amd.com; a=ed25519;
 pk=pCRGj/0mb0C3aDMpVVZeyBqOIQZUKGJjCKL4QZTu7nQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL2PEPF000352D3:EE_|SAWPR12MB999116:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f8cfd46-c405-4f37-2124-08df3bee4117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|7416014|82310400026|1800799024|23010399003|10067099003|22082099003|18002099003|921020|261022105027099003|56012099006|11063799006|261026140227099003|261102123227099003|261028144727099003|261026121527099003|261022075727099003|261021123027099003|261009223027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: aLDHJfzHd5WMSzUrsh1XBfbnkm2re7H5a39zkEy0Ft2pDuCF6TR2xj5FRs2zodHsUrhitMR3wIJTvxOGKHlWE5mCqbFQdWXfN6MWMcqkv1o/9zKOqyzjXMRiM119Yl+pE0yeKpDTcS5Kkr39WWYlBeDH02SSRIPWeSQ+N3GEHUsdcU8yF0EyEE/f3MKeiSF3np8zgyUAJPLPchOxHczl1rs4atRM/MwBQhjxaVykxFZ/FpdCEHO+3uI5b3t/RGwLMciKk3S8ce5ypLE0++xlmnFoISDupnb7eE0qOHgbbMSPQjbOearA6r3Xaq3xu2Y2KBds/ETRGmFivFKI1W6hsPO7lQYTY8saFTg+gptbXuTqGk0yIDKVZpu4f27HLA8R9aP0eksj02SR7hIn8KRu5fnWDYj6qb4eDcALkcyYW6PaaonfeSGQpYI64yxqlupRtLgY0UXGXmOoP6VzdwAFtogfnUPXKIq9BfXQvh3mXvlWkPruQ4m10cBBqXLXrzx8rRBuLI9cVbdoMhrqeXMkVCftKo3TZkts6Iut0JMH+GlmQ7HWwfju9u49vXcLf5IGTv8o0fDLvRti3ofm6jboE5SixYhX370ZCvy3taiJE5cLAPQBtQtzNt0vyv4EytMYwjjnDEKvdcf8aQMA2ZuSNgYjR5Z0QdoysJJsgAspN64R7VbzmJylgOSe4fImqDhlF0hJobGEqu2vGLzu7ZoEZoxO/7zO5mXuAgw2Y9rCDOHOGXy7CSBCUNOUVLjUuhQM
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(7416014)(82310400026)(1800799024)(23010399003)(10067099003)(22082099003)(18002099003)(921020)(261022105027099003)(56012099006)(11063799006)(261026140227099003)(261102123227099003)(261028144727099003)(261026121527099003)(261022075727099003)(261021123027099003)(261009223027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fo9mZ1N5/HLztdV4onetZjHrvhgDqZNZjQGgT/HN8rOmVLU6h/ByX4W/sHjOt5KBOX89+g0IT9v9jzwLnYZO9oagXxcH2P53grOI+EIVKjxrqZYx7CM7khKO1UZ9K4HX7YV712y5dTh35HKijOaoD+f4VORpiSfG2lnUTV2bRROc+9uAeRdy06kDymoQG1aequedB0r2unOkOHdsd7Sxy/Vx4wFEf8VfYv38GR06YRARUGVWM8e8Xtb2pTqwuZcZOpi4uCYBC/61arRVuaEt3rF5aUv3ghWq20HWyqPLH98Mn1hy7w0Pwu7zZD4lUFv5qGkYIM0bcKBxgCOWwcZ/fDXvZ2yWh2JDYLjhz3vv8JYJxzpAafYqzkVdZSwiFkt0sFpUS0JG47gkEcOU63ej8aBs1puaT5X2NEJm3XKHXJji8YaN1KuloYwG9oBbJgKm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 10:10:58.9766
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f8cfd46-c405-4f37-2124-08df3bee4117
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL2PEPF000352D3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR12MB999116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_021105_395800_C9CD06D0 
X-CRM114-Status: GOOD (  10.43  )
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

Add support for the amd,versal-net-dma-1.0 compatible with
xlnx,zynqmp-dma-1.0 as its fallback compatible.

Include the Versal Net compatible in the reset requirements,
making the per-channel resets property mandatory for Versal Net
devices.

Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>
---
 .../bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml           | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
index 59dec441307e..7efbcf282a14 100644
--- a/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
+++ b/Documentation/devicetree/bindings/dma/xilinx/xlnx,zynqmp-dma-1.0.yaml
@@ -21,9 +21,13 @@ properties:
     const: 1
 
   compatible:
-    enum:
-      - amd,versal2-dma-1.0
-      - xlnx,zynqmp-dma-1.0
+    oneOf:
+      - enum:
+          - amd,versal2-dma-1.0
+          - xlnx,zynqmp-dma-1.0
+      - items:
+          - const: amd,versal-net-dma-1.0
+          - const: xlnx,zynqmp-dma-1.0
 
   reg:
     description: memory map for gdma/adma module access
@@ -78,6 +82,7 @@ allOf:
           contains:
             enum:
               - amd,versal2-dma-1.0
+              - amd,versal-net-dma-1.0
     then:
       required:
         - resets
@@ -91,7 +96,7 @@ examples:
   - |
 
     fpd_dma_chan1: dma-controller@fd500000 {
-      compatible = "xlnx,zynqmp-dma-1.0";
+      compatible = "amd,versal-net-dma-1.0", "xlnx,zynqmp-dma-1.0";
       reg = <0xfd500000 0x1000>;
       interrupt-parent = <&gic>;
       interrupts = <0 117 0x4>;
@@ -99,5 +104,6 @@ examples:
       clock-names = "clk_main", "clk_apb";
       clocks = <&zynqmp_clk 19>, <&zynqmp_clk 31>;
       xlnx,bus-width = <128>;
+      resets = <&reset 0>;
       dma-coherent;
     };

-- 
2.43.7



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A6A606EE85
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eLM2X1Ci;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=GEnSDthH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=N54DgVy4XZcAQ0m9k/l3C53+indIt2igxkY08LPZUU8=; b=eLM2X1CidTyrN/
	jmSEGzmOqJSVCIIZbxWzdTEPV4BbMUSP4QtRK0XDJ0kpRI32yHqsSW4JnmqxWF7hW3Zm/220XLOYx
	QiGmJIVT7F+HZW6XlEH8e5c/1zATNp5bsrK6qCdCvZws77klDVwrPCPOmVyIg2cJaVoBZEEy00YVs
	QfpVsWCyVJ3PWQdlBUQmLF0rrwsho9WL1ANw/DOiEYsMyqVaFvUAyDWiBEQ/UyecKknsxB5fESzj4
	xPaYb5mzcDUyiqxvHXQ0QZeX4Xl+PYTYj578Cpmdd7EJEXwcoGfPcIvE9ixl3DveQNzKsKllRzK0W
	sgzqjuY9gfzWjBWWCCFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwC7-00000008ofe-3qFa;
	Thu, 05 Nov 2026 12:03:51 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwBV-00000008oO5-2N2G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:03:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QNqG84UldlWEb3BmdptE3v1nw+PDGBVEG1EjtPOwqnN9ZjxKJNXQRJhixIJ7WyldXQB2EV6X9oqmwQXcrhjfA3kZCAZ90KM7dBszPeN41Ja8gnNb+XdF+fOfojbKu656B4lwwMc5t/F03i0CVMIFAIRczzNqSglA+7Fr8rOHMkkZ9XzFT6PJ/nBNcq6f1l6k9FKvuTam+FMyWgMVJpJ/l3qXIw4gLQeLphansq5op+Ol9/YCVMHt9PKK0Pez9SgvDAB3fnrKlMWLWoTZsZ+33Q4+cVb9NqkC9q5IVxsNAmly/Vlm0xSeqF+V8xHjZNjVJm5DA9xCGPRQhqVBjicDZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N54DgVy4XZcAQ0m9k/l3C53+indIt2igxkY08LPZUU8=;
 b=TiGiFORUBP1ii8w6+ke5sjImHFGrHkiDi8usAWoJwWHaPMEDrL5FzU+J/LL1rxIKxmT6MnbZ4niipbx2CgyUk68/rNdi09laNy8uux1Eprf+OJBiT0t1EV3DQa6IWexo47jLpamtEWNUnv+wlG6s5xUumqAbTm06TRmMV76/6rb5ynwD6WBJEj2r5fTpV9o4J0tSb2PFnknXAvWiEbjZdxg1K515+CuynwkyEDCyuHEZdy8/JaxDva03UtwDI4Fjlv+TdO8n7mcXGOceVxWfjSm6QIHuy8T2MNVX+cFtKA1UtvHA8o/c0f0QFuvUqdMax2/+sKD94HShMvG8ARumdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N54DgVy4XZcAQ0m9k/l3C53+indIt2igxkY08LPZUU8=;
 b=GEnSDthH08PUBRD1/4qwOZ9les7MivK7jLXs2w63HHyk4exZARz1uUPkUzc+BpRmFEotrrUvPoAl0+lsxTqLqDYLH/HYj7wGgIZVM05P1UO3XQsqqSG7D9WUhuCShbRM7Is2Krz9JH64oyG0Hv2iC6odZu+k57GWWvNe1PwuG/DCGldcXXiIh+EAJne7c3wAGDTiRO15gA1sMego46pjsm3UyRDQy02ZoUYZaBRLwKjIv9P46+a7RxTfqcfu7b8Pi0BNj2t2SfPYq7Wo2o3PP5E8CMd5UKiOI8y4xFLDFc+z6U+sZdBfKwOWKqIG9rVV0iioXoBuF+OiWMYQtcILAQ==
Received: from PAZP264CA0112.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1ef::15)
 by DU0PR10MB5678.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:319::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 12:03:09 +0000
Received: from MAD0EPF000008C5.eurprd05.prod.outlook.com
 (2603:10a6:102:1ef:cafe::3c) by PAZP264CA0112.outlook.office365.com
 (2603:10a6:102:1ef::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 12:03:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 MAD0EPF000008C5.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 12:03:08 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 13:03:36 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 13:03:06 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 5 Nov 2026 13:03:06 +0100
Subject: [PATCH v5 8/8] arm64: dts: st: add TAMP backup register in
 stm32mp251.dtsi
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261105-upstream_nvram_reworked-v5-8-ddf7dbf1b298@foss.st.com>
References: <20261105-upstream_nvram_reworked-v5-0-ddf7dbf1b298@foss.st.com>
In-Reply-To: <20261105-upstream_nvram_reworked-v5-0-ddf7dbf1b298@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>
CC: Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.16.0
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008C5:EE_|DU0PR10MB5678:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e1a7809-5378-43ee-00e9-08df3b34c207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|11063799006|56012099006|261009223027099003|261021121427099003|261102123227099003|261022075727099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: NNgb/NayDMNoyekex7HqTH0psA4fFyl9m0tWBTvovg/C4s3jl7Cfe9pA/NGm9PO26XQKHqPAGUDe90ZgWObN+3p4+vCO7Y/A9qwcBlhWgMJQGhkm16dvlnJrBo192r0kRGOqfMGweM88Jsvl5jZ6IY4wZnnHZcvTX2VQ4GMGXw6ZcwiP4JWd37/WsTVNrYmvnzV+ztCQG77SaDmX/VcFr6oZ9q87lR1ZVOwzvPVM6W4hZfwq9FnpcpQAN6B+SWP1wDt3OzROeWGhrJMWZ1+sFZ78a6MnpR4kGSb5EtP9UYqUvp/QbOd0wKqCJsPWT6BYI80udXcZjE0Kcf9OrIucM6qfnCTrq29ElKyxrGp8PafAzOxT8rxY8rqjfFVXkOcbNEOe3JQAIjLbwqQi6PUz/RYTseruUMUzvZ8JpR91SLZ3x60Tf8n0qkiq7Gv08FK5gYBrsgvtU4GOg6BJvHj7nFkfog1bz6Nkk6tEo2unOw2hqfyHG3EkveNWOn32ae/OnwnX4NZsy0cZp3jSpz1say5StkjlgwVBqk1BVR4xBd5xg6n6T9jMDpzx23z7RO9VIaJNumI+roo25B9JVhHBG0v7tMYbbcoBEC4JaIrfvkkHYXBnZ6mJuZmeLHfSu+XC0HZco2F0R5KCyt3bMj3CjV3slT9RcWux5SygENue+nRzRcoHG2SxevRtnJs6uj0Xn1qjzWnPFHzzEY3bgq7cbg==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261102123227099003)(261022075727099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dJ8zPJWArGhDivPuI+oIFM5tF8xnIbYk5mEWH3ikQlKw1ShOGrJrqNvwAdx6OcmWiYmmcU88aUdjDuF7Vv2f5DDb2YrTrRtbQQQeYtn2xCs0ACq5G1A5ZuuKcEN26SwoudM1p+z3cbqgG6M+7fG9bSexw37Ixx7O+RqVANWmLjzq4/wj9HZtGs/8i8sNWNeRAdwSh25poAQVRLZcdWy5dAu0oW/3945DqUz2aN/2aiYlOnJlX4Eifk4uLC7ksq+aRo7xYqiqFE4WB8nEPkOIAO3olhUXXPHgEKe7SJ9QgY4aHYHG+Lc9lTXeLHGTVQBj1wn60k2+4k2u5oUi6eQWhv4xtqnJ5Kyz1HUufRAHNnTCSe8NXi4CfqaAY7mVOZMr0jGLiL7AtNKuqycBfbWamkwRV/YjQCSV+6YbroUTYFvl+iKFDmdOBg3E3qiSVXva
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 12:03:08.8440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e1a7809-5378-43ee-00e9-08df3b34c207
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MAD0EPF000008C5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5678
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_040315_262889_CF85B647 
X-CRM114-Status: UNSURE (   6.79  )
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

From: Simeon Marijon <simeon.marijon@foss.st.com>

TAMP backup registers allow information sharing between different
software components/execution levels.
They are described individually as nvmem cells.

Signed-off-by: Simeon Marijon <simeon.marijon@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index dac3d2d23ff0..9748834ae9de 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -2242,6 +2242,37 @@ rtc: rtc@46000000 {
 			status = "disabled";
 		};
 
+		tamp: tamp@46010000 {
+			compatible = "st,stm32-tamp", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x46010000 0x400>;
+			ranges;
+
+			nvram: nvram@46010100 {
+				compatible = "st,stm32mp25-tamp-nvram";
+				reg = <0x46010100 0x200>;
+
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					boot_mode: tamp-bkp@180 {
+						reg = <0x180 0x4>;
+					};
+
+					rsc_tbl_addr: tamp-bkp@184 {
+						reg = <0x184 0x4>;
+					};
+
+					rsc_tbl_size: tamp-bkp@188 {
+						reg = <0x188 0x4>;
+					};
+				};
+			};
+		};
+
 		pinctrl_z: pinctrl@46200000 {
 			#address-cells = <1>;
 			#size-cells = <1>;

-- 
2.43.0



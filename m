Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DAA606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q6ipz14B;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=kAD5PXkv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=peFTPYaki5hbZwY8m1EKGJ0s5OlvPFjEOnjM/I72Ah8=; b=Q6ipz14Bbo1xfa
	JzIOul0vjTiEItBSf8YtV/Lmw3sDHbmEO6EuALsVjPEBeytEEtIE3mE5WJmEM96tnl3qmMRO/L1OA
	bxqbSU8ChWupc/524PtqTP0Gir1lth1brIl9Rzn9t/cpy4IVEQgbC9o/Sb+oj8NYe68LW0zP7zuzc
	Vqt5kfb/udTvLScXXyYiWGOyWyfdCexhQ+bZDYVQru5gzu4fhwx/vr4PCOx4hp1oKPJZtge0BcYUC
	wJVB6PKmlR+nhbLrwFJsAyJjNvNVbsMWfSNPvvsk1LuEAYI9heQfsqbXQMfqAtMZN5tpKv7D7ACrh
	Pa44Uvc2MUseN3jR3OCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwBi-00000008oTE-0U7N;
	Thu, 05 Nov 2026 12:03:26 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwBW-00000008oNs-0O62
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:03:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y4Vl/7SVzOxlvwJS6sbsLwgOCYVhxUpl4aAEONOojGHaQHqbBnaa9HDa7VPr1LDNekopkEv/KcFlljX03WYrLmHCjTudTShhPbx3at+cHD/Dy551pkrrjDsgjNqK+TlXDQyJ/V7P6fY2fmiAbgfp5kEx9jr1l6Rua7Wpd4qxaH/w8FBjO5p3ipe4B2xoNRxl5RonJqaan/ictZP5I4AnE+Qx82CAL7W+G15zuZGBjBkh9KWvkDxRwJmE1s3tYbpT6GaD4Fn4lgP1fAYdDxMX26NuFb/QMQpUqZdsADnduxkzZScfv4dGk5OZ1jstjPdTdBW6VT1FS+81ssoey5AQBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=peFTPYaki5hbZwY8m1EKGJ0s5OlvPFjEOnjM/I72Ah8=;
 b=E8pddMBUXP+PVXyk83W3C5BeNeTXilKIu7V09hI6RvhMyBmdUjjfNUylikWEtGDQTnu6v49HdReVnUJ3CSbn+3Ir9iD2MDhuCcC3Q4tQ+o3ofUdRUv0zrbRZb0PlIeSbpp6JQXslCHw9wuC3cPKkvjypnYuTigBcx7d/M1CLRx1QPJFD8ajkKcQnPevKuH8lAVgIMiPjTnjdRbWcl0499hIAO3hyDHXBNAT80yJinNy4on4dNAnj6eUiKm54Qpl9Zie2r1zoPwj4QnSj1bxbyqGUhJ12QHH1fewbH4x5Os2Gd6Del60Q0kCA4fQ98W0qPFtfQ15iAVwhrWNmoAOIPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=peFTPYaki5hbZwY8m1EKGJ0s5OlvPFjEOnjM/I72Ah8=;
 b=kAD5PXkvIv5HZIHDJXHe0tBglAPqapYxEfsXWd11pLbJZ+Yo719tvynGMK2+ifFCzsicK8PMS9czCIiUe4Q/GfmZGJx0gwCHwfovh5URNKHeC+yYo8x0I3mIP+PIFeECqqmCbZCMUspicwtNFAzD6h2hZZLqzPRwTfC/ZAPDXn2NRcDAsEMpv5DTT35E1y+UXwK8N8pix547dlgPbLOS+Ik8lptQjdvYRbREVU4KFKj7XWjfYEdBo/P4BJXx+UGIkZs/bDTsdvbS63IRJAzElcWfOY60qAwzEMHWn8MHkjQyGRN9bctGAYGHlV7TYkc+vsLvZsdUzRFB6ZCotHGk/w==
Received: from BE1P281CA0087.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:78::17)
 by VE1PR10MB3872.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:162::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Thu, 5 Nov 2026
 12:03:05 +0000
Received: from WA1PEPF000099CF.eurprd04.prod.outlook.com
 (2603:10a6:b10:78:cafe::84) by BE1P281CA0087.outlook.office365.com
 (2603:10a6:b10:78::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4 via Frontend Transport; Thu, 5
 Nov 2026 12:03:04 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 WA1PEPF000099CF.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 12:03:04 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 13:03:49 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 13:03:04 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 5 Nov 2026 13:03:03 +0100
Subject: [PATCH v5 5/8] ARM: dts: stm32: add TAMP backup register in
 stm32mp151.dtsi
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261105-upstream_nvram_reworked-v5-5-ddf7dbf1b298@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: WA1PEPF000099CF:EE_|VE1PR10MB3872:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a79350e-d17f-4a77-cc74-08df3b34bf86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|260925022911599003|260925021311599003|260925021911599003|11063799006|56012099006|261022115727099003|261021121427099003|261009223027099003|261022075727099003|261102123227099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: uC1QncelzZz+d0pELkLBiWndAYGJT+SaUdooXSPOwjwOdLhb8Yg0fgYgJrqrevhu8aphA1giVmPD5oDKpAXCuN0+iuDJi7K5z3BUW0oN3mJy/WYk/euvtOU5fuJOiK754mi5Tpzn8tZTsRoN+PgRGoPmNVCmUWrpFVUV6LJkUCM00TzNVEVND7sPmfbYHsFacyLdDjQACvVrYwlfB2Lz7kyd4bb2JcbdJIQAAtWfQ/F/0BvmQFMhPn+VrZOfa1kb+CKFibnTx3gtY1U9KHlX/Z+mVsYYpmS7+IaUDDY1UrpQnpb20WOLhwhvhOX6WJNOGoo6xEy0qt4ImFNt9s19zw7oVL38NniQ49pEdvOGYbXPAJIx54SrX2k6D4sXDAENGsxRATCazeN4S95yBw9ScQWROKn7YwgB4nl9SHqXdkwyrUwtGIyDiz/MsDchUQP9S/MIIe0FSnBJaczHgHzMzEhtHY5lK649URrJZq3/TsktdjAlbdZrZjWIcw5nj7tsu8qK0uQpaEH4Z3sbxHm12FaZEdBu/+N9zsNHQbquRTeimIJvbOrASl0KdcrMcicXlLq3r0049ZWEWs+FAxPdI5vH8jKuGZEvzrIJCN8D9Ftt5DJVYxqesGIKFdGUxz4DWzByyddQJFvaXH0oQM7DW9LaYZNk4hfCCgll2Lvijdd9Mh00V1468TZrzNmcMQR1AtqmUFpnLrO/DOm4WGywyQ==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(260925022911599003)(260925021311599003)(260925021911599003)(11063799006)(56012099006)(261022115727099003)(261021121427099003)(261009223027099003)(261022075727099003)(261102123227099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 45MT2a+VUosD/br+rQTDds7G6pjhtcO5VTCXxBVG0mTwbTiqcYsPCpMMkPrw5fX2RVW7KytkOUjME7ZmE/3BfLsJ94b4J7+BNBxq/VnILOkxNoZ/iaTJt0X5gY+cXaKePHMHbguVOS9K1MpaM1U6uCud4onmLmM34CW2lUwpt0HORg0qNzP9/FtSt0pu+g+3x/4AjgmWxnD9rRsrsb/twW0/KkMdgqEQQc4zsADx/iOZsaG+5ajD6sQvn3KHwtw1ooioXRmZqFuoqnRBqrq0M5ZeyZvMxUi4p8kptDQdO9igrQT6D3GEsqVnziSbI//850C7lLW/cdP6fSju4dyemaROdb0OcoC23v5GMY13Ba+SyXrWZAX6HumkdD0mR6PX0x5ySV//bQNTbCNVOUF9J5VY+RYas7TTMCo3HTiNLWnhNOrnqeNupbzVrwdMPGyD
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 12:03:04.6335
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a79350e-d17f-4a77-cc74-08df3b34bf86
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: WA1PEPF000099CF.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3872
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_040315_260160_BD2FEC4F 
X-CRM114-Status: UNSURE (   7.34  )
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
 arch/arm/boot/dts/st/stm32mp151.dtsi | 83 ++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index ae3188373238..ac7ed857cbf5 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -2060,7 +2060,90 @@ i2c6: i2c@5c009000 {
 
 		tamp: tamp@5c00a000 {
 			compatible = "st,stm32-tamp", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <1>;
 			reg = <0x5c00a000 0x400>;
+			ranges;
+
+			nvram: nvram@5c00a100 {
+				compatible = "st,stm32mp15-tamp-nvram";
+				reg = <0x5c00a100 0x80>;
+
+				nvmem-layout {
+					compatible = "fixed-layout";
+					#address-cells = <1>;
+					#size-cells = <1>;
+
+					wakeup_sec: tamp-bkp@0 {
+						reg = <0x0 0x4>;
+					};
+
+					m4_security_perimeter_exti1: tamp-bkp@4 {
+						/* see cortex-m4 wake up feature */
+						reg = <0x4 0x4>;
+					};
+
+					m4_security_perimeter_exti2: tamp-bkp@8 {
+						/* see cortex-m4 wake up feature */
+						reg = <0x8 0x4>;
+					};
+
+					m4_security_perimeter_exti3: tamp-bkp@c {
+						/* see cortex-m4 wake up feature */
+						reg = <0xc 0x4>;
+					};
+
+					magic_number: tamp-bkp@10 {
+						/* see ddr and cpu wake up management feature */
+						reg = <0x10 0x4>;
+					};
+
+					branch_address: tamp-bkp@14 {
+						/* see ddr and cpu wake up management feature */
+						reg = <0x14 0x4>;
+					};
+
+					fwu_info: tamp-bkp@28 {
+						/* see firmware update info feature */
+						reg = <0x28 0x4>;
+					};
+
+					copro_rsc_tbl_address: tamp-bkp@44 {
+						/* see cortex-m4 management feature */
+						reg = <0x44 0x4>;
+					};
+
+					cortex_m_state: tamp-bkp@48 {
+						/* see cortex-m4 management feature */
+						reg = <0x48 0x4>;
+					};
+
+					boot_mode: tamp-bkp@50 {
+						/* see boot mode selection feature */
+						reg = <0x50 0x4>;
+					};
+
+					boot_counter: tamp-bkp@54 {
+						/* see boot counter feature */
+						reg = <0x54 0x4>;
+					};
+
+					m4_wakeup_area_start: tamp-bkp@58 {
+						/* see cortex-m4 wake up feature */
+						reg = <0x58 0x4>;
+					};
+
+					m4_wakeup_area_length: tamp-bkp@5c {
+						/* see cortex-m4 wake up feature */
+						reg = <0x5c 0x4>;
+					};
+
+					m4_wakeup_area_hash: tamp-bkp@60 {
+						/* SHA-256 value see Cortex-M4 wake up feature */
+						reg = <0x60 0x20>;
+					};
+				};
+			};
 		};
 
 		/*

-- 
2.43.0



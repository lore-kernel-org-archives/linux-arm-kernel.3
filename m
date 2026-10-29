Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D92606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=myCnVgoi;
	dkim=pass (2048-bit key, unprotected) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amdcloud-onmicrosoft-com header.b=rjjq4kc7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6tR+tOnSm0nO6aYdD+sgZaNaveCUs07Nji9libm5IIU=; b=myCnVgoif2pr9p
	/UXU6nnJh0YS59/r/RV+55n2Uf3w+q6wvGVZ1WrE2KKNhXtZOLy52jdkbSCcr9rZ9V2MZC8t4ATTk
	slVDqS96MSk/sZaUHUJfEKa5EawCiynSsi8nkf6m9EqK0j5YeVNrC4p0r6mWct7/OF6EMReZ+tjWv
	1EGof/O+5MAw4w2UyRfThUreTgYiqlyH3EvVg2KSYakpR6hTneNVO9uhNa5FxPZrN3+m8e4x6O6Z7
	05WU4yiy1l+jn4xvRkEtFBA3eXQ6ZWO1ATY3F5yJh60IWAfayjtRdh7jN2oYDO/8TZoVGA1y1iKZK
	PvbqHFbj9AiKj3oJ19/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQOn-00000009NfI-0i6p;
	Thu, 29 Oct 2026 13:42:33 +0000
Received: from mail-northcentralusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c105::1] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQOg-00000009NY3-0w9w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:42:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WL4A+KE0POSHmPTmqmA3vQ5wYT49IreVEyMisEaazN4PRNWedLioL55UHZByWI/WqNdtTmF5BTrSTHFackmcv2yIOMQSUPPHlUjvIJFhme5mXricgwXhoO8nvMzLZsW3rV8EWShxvK9gRLrjFKVGmuxbgbh4Xyrgpd7uZm266ORS8xHbysecM05oBhTLMa4bFU8jNPOrnDd38eqh1KERZ09sditZU+6TZ2QE1K/Ij2YP9eBQT+W81XOkPzYFJSfy5VXvN2qOkHjLPNHpPy8Cl+JDYR8xsHhPFqsHfzJ5lZLnrHVmLXEaZQ6lYhW0Tf8u39fNcI66ai6HN7PtNaDX4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tR+tOnSm0nO6aYdD+sgZaNaveCUs07Nji9libm5IIU=;
 b=vODCDRts2YSF5Gppqx3xrOvb1lZCmcduMdshBJcW1QUYlf6ZBwx5bGtj/UHy1/nkaDl2aBpQAqUdpoDzsAJa5euu8HmqALYY3p7vp+3zk4kQ0lZEOoBJ1y2nhXqNBsaDnVWjRQHOuceZmTiFVv8WcVJPjNg9JjklaMu4EDOHb3m+SqvR6XkEYhSvUIEqUAk1+N9aRuq0Nw0JdZ0w4GcgluUQholzqixtvek2Mn3XDofYhz3tAyQNndu0Q79oZu/NlPmQZWZ4C1LJXRBmdsJAQnLl3u7B6xhAxoA814Y/b2foq+dJc39MNtID78YenMXcdJ6HcoHYNJEEJwcv+aQ09Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=aspeedtech.com smtp.mailfrom=gmail.com;
 dmarc=fail (p=none sp=quarantine pct=100) action=none header.from=gmail.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tR+tOnSm0nO6aYdD+sgZaNaveCUs07Nji9libm5IIU=;
 b=rjjq4kc7M4FM8VYbYUuvdB5F5udIylvMgdn+wtLQyegOy10uGsYJJArQJQnz5Tm25g95/lBmIuRW+gVAWclxphLgZYgOE8hP+9yonBaF5MHocf27nDaq46AxZJYYi8W4jx4/krYxCwcn7ngyezvqRd2wO4zXTCS0gBmNFkUOOwH2bSGHO0v+mR35r7ntbnwY7oseiCvNDYu4DnOr6/Ez1f96zwu0eOxO5AdN2iZlrU2UBKB6CH5K/X93wei79Q1RlAdaeH4LigM2YZdmfgUtZ57Qv0rjBFFlK3hVvpD2OLwP2bSrk1qovCC8nsoNrW5elgJ15LQbFSPLR0vIpMU4sg==
Received: from PH7PR02CA0009.namprd02.prod.outlook.com (2603:10b6:510:33d::11)
 by CHBPR12MB869915.namprd12.prod.outlook.com (2603:10b6:610:406::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 13:42:17 +0000
Received: from PH3PEPF00059619.namprd05.prod.outlook.com
 (2603:10b6:510:33d:cafe::5f) by PH7PR02CA0009.outlook.office365.com
 (2603:10b6:510:33d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Thu,
 29 Oct 2026 13:42:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 165.204.84.17) smtp.mailfrom=gmail.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 165.204.84.17 as permitted sender)
Received: from satlexmb07.amd.com (165.204.84.17) by
 PH3PEPF00059619.mail.protection.outlook.com (10.167.243.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 13:42:17 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 29 Oct
 2026 08:42:02 -0500
Received: from [127.0.1.1] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 29 Oct 2026 08:41:59 -0500
From: Colin Huang <u8813345@gmail.com>
Date: Thu, 29 Oct 2026 21:38:43 +0800
Subject: [PATCH v10 14/16] ARM: dts: aspeed: anacapa: Update EDSFF power
 status signals
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261029-anacapa-devlop-phase-devicetree-v10-14-26ee3cf9d9d0@gmail.com>
References: <20261029-anacapa-devlop-phase-devicetree-v10-0-26ee3cf9d9d0@gmail.com>
In-Reply-To: <20261029-anacapa-devlop-phase-devicetree-v10-0-26ee3cf9d9d0@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>, Rex Fu
	<rex.fu.amd@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281119; l=3287;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=tm5NcLUVr8BKlmTbfHzCsNbBGb237X8AOX24jRAPa0E=;
 b=pW0bgZAiPSlnLEZTwOqzL7IpZqM7K/LQjn1rR+guOWw+s1IUTQUU/4bi0sGW62IgRu0WfBmaW
 +hjm2rMxh3cBLdmJFO1PeX9E8cdnIOCe6cPRlXzIu6Oq2HU8E1Mb6uK
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PEPF00059619:EE_|CHBPR12MB869915:EE_
X-MS-Office365-Filtering-Correlation-Id: b8f67087-e01f-40f5-75c2-08df35c2728f
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|48200799018|376014|7416014|61400799027|35950700016|82310400026|7093399015|11063799006|56012099006|261009223027099003|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261021123027099003|10067099003|22082099003|16102099003|18002099003|4128699003;
X-Microsoft-Antispam-Message-Info: Jn3ldig4yexMirT/9pslAaBv+j8oR55Uxg+6+z5WuQ7fSPU7N6qT4Bo8A/5AJG8zO062Z1LcSErtsrviFZeSBorVDHOb9u74YorDvY8EWlQa+SndavuDX8RiIHz81k/nraQUDXlpuBCwlZfNT62SYbdcp59CZpdfx0TB5SbuRTQuV3RIuBw4B5ZJ8aMVUlVwYMxCzyedYDKQra3Qa1EBJIWBW1tQhTuI3xiiyk7+/majvtRCb4UiupwHjHI1IniWymR1JMqZopjgaQCDD+7nZ3k8WItg/qazV5WJY1x6h2MAatJ1dTtVVMP9lrZ0om9tKkvk0kP9MHp2XYSSQ2TjMl9FYe6TpCgid+Svv2qnlPLlxqEZVutSrsVUqq7t5xxQ9iTxLZoFC0MF3gw+iRjRvsPVFHmUQN1jKryuYrhPTk8PiVdxYNbeKAVCDQq20kfbGhDjv9JhoDJasPfzT7AmjOU3vYbLXg8mNJX//XfgZfmeq5Ge+cq2Fwi4t4TD5CUxua9PwqimsY5AWYyTeMUVlqDRZ6P+PGhwMhjbi1q2o52dCp3SpyscPQMpzVsMBWQExGoeynTP+FfcbuXkYvSSC55YXF7z/c1kBDlFlSccObCLTP5g0M3C+H50ApqwEdg7Mj0kw4oisZVHYVyWXu8R3+D7VhW30JlvGUQAnRsBaTaGeZeRsrfK4SzUGgL6c67BfhNfYEnN2+Bbaiq3WOmtCQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(48200799018)(376014)(7416014)(61400799027)(35950700016)(82310400026)(7093399015)(11063799006)(56012099006)(261009223027099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261021123027099003)(10067099003)(22082099003)(16102099003)(18002099003)(4128699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RcV5LGgqMBQ+AzlQr0PzTPRONsFmTP1qth51f+YUA6JYy+x7YCnHSwPrFRAwnEolA6mXqTGlvFzqwM5iF9Fr1ckmH/xkCeghBaSZ994Ze3fbw3Z0grvN5hbWG1slbZRroe/avClj5/ldc1xRvAOvEWKhqkufG3V+vk/GbHHOcBUKO40akCF3YA4PcX2XshUgJkjGCQo6vMOX6ZO73+3QF5FGbGSGY8PlKBpyHG5LEmcrGTAjA8Nbr1z8kBCtKfE3Xl+6nT8l9FQ/i4hdkuhgF1trjk3El7+iDToWbrlyuQK9QXoDdU5jtAMaGTVAH4YujYZCNErcqba0X03vl3pvj1rrQIKZJtA0hE/hstlIzD7kA7um8HhWVgirUq+xVnC5s5dU5vgGSVNhelFT2vx2ZXF7mxcJbwDYUKziB7TARMRGL884u9bSsoOkGqJi/k2/
X-OriginatorOrg: amdcloud.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:42:17.1171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f67087-e01f-40f5-75c2-08df35c2728f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: PH3PEPF00059619.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHBPR12MB869915
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_064226_323714_07C03EA7 
X-CRM114-Status: GOOD (  10.02  )
X-Spam-Score: 1.0 (+)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rex Fu <rex.fu.amd@gmail.com>

The CPLD definition for the EDSFF power status signals has changed
from PG to FLT. Update the corresponding SGPIO line names to match
the CPLD definition.

Signed-off-by: Rex Fu <rex.fu.amd@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dtsi  | 10 +++++-----
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi |  6 +++---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi | 10 +++++-----
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dtsi
index 3b3967b47980..698308049c38 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dtsi
@@ -162,7 +162,7 @@ &sgpiom0 {
 	"L_PRSNT_EDSFF1_N", "",
 	"R_PRSNT_EDSFF2_N", "",
 	"R_PRSNT_EDSFF3_N", "",
-	"HPM_EDSFF_PG", "",
+	"EDSFF_BOOT_FLT", "",
 	"", "",
 	"P12V_PWR_CABLE_PRSNT_L_R", "FM_BMC_READY_PLD",
 	"PRSNT_NFC_BOARD_R", "",
@@ -208,10 +208,10 @@ &sgpiom0 {
 	"PDB_ALERT_R_N", "",
 
 	/* L0-L7 line 176-191 */
-	"L_EDSFF0_PG", "",
-	"L_EDSFF1_PG", "",
-	"R_EDSFF2_PG", "",
-	"R_EDSFF3_PG", "",
+	"L_EDSFF0_FLT", "",
+	"L_EDSFF1_FLT", "",
+	"R_EDSFF2_FLT", "",
+	"R_EDSFF3_FLT", "",
 	"HPM_CPLD_HEART_BIT", "",
 	"RBB_CPLD_HEART_BIT", "",
 	"LBB_CPLD_HEART_BIT", "",
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi
index e429f7be46db..f61cf5b3718c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt1.dtsi
@@ -968,7 +968,7 @@ &sgpiom0 {
 	"L_PRSNT_EDSFF1_N", "",
 	"R_PRSNT_EDSFF2_N", "",
 	"R_PRSNT_EDSFF3_N", "",
-	"HPM_EDSFF_PG", "",
+	"EDSFF_BOOT_FLT", "",
 	"PWRGD_CHEH_CPU0_FPGA", "",
 	"PWRGD_CHAD_CPU0_FPGA", "FM_BMC_READY_PLD",
 	"", "",
@@ -1013,8 +1013,8 @@ &sgpiom0 {
 	"PDB_ALERT_R_N", "",
 
 	/* L0-L7 line 176-191 */
-	"L_EDSFF0_PG", "", "L_EDSFF1_PG", "",
-	"R_EDSFF2_PG", "", "R_EDSFF3_PG", "",
+	"L_EDSFF0_FLT", "", "L_EDSFF1_FLT", "",
+	"R_EDSFF2_FLT", "", "R_EDSFF3_FLT", "",
 	"CPU0_CORETYPE0", "", "CPU0_CORETYPE1", "",
 	"CPU0_CORETYPE2", "", "FM_BIOS_POST_CMPLT_R_N", "",
 
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
index 5c0d874fa24a..766aa26b6cea 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
@@ -370,7 +370,7 @@ &sgpiom0 {
 	"L_PRSNT_EDSFF1_N", "",
 	"R_PRSNT_EDSFF2_N", "",
 	"R_PRSNT_EDSFF3_N", "",
-	"HPM_EDSFF_PG", "",
+	"EDSFF_BOOT_FLT", "",
 	"", "",
 	"", "FM_BMC_READY_PLD",
 	"PRSNT_NFC_BOARD_R", "",
@@ -416,10 +416,10 @@ &sgpiom0 {
 	"PDB_ALERT_R_N", "",
 
 	/* L0-L7 line 176-191 */
-	"L_EDSFF0_PG", "",
-	"L_EDSFF1_PG", "",
-	"R_EDSFF2_PG", "",
-	"R_EDSFF3_PG", "",
+	"L_EDSFF0_FLT", "",
+	"L_EDSFF1_FLT", "",
+	"R_EDSFF2_FLT", "",
+	"R_EDSFF3_FLT", "",
 	"HPM_CPLD_HEART_BIT", "",
 	"RBB_CPLD_HEART_BIT", "",
 	"LBB_CPLD_HEART_BIT", "",

-- 
2.34.1



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E66606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 07:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bx59VFVF;
	dkim=pass (2048-bit key, unprotected) header.d=cn.bosch.com header.i=@cn.bosch.com header.a=rsa-sha256 header.s=selector2 header.b=UnGrFTIb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=L4MxeTMXRr2Qst4qnlvyqrsUGq5kxRe930C4tbxgdOw=; b=Bx59VFVFO+3440
	ep892pHe2z/WWFnaZaS9QNXE8g/B4oBKYXRLmOxQXtFlKXUH6TecaCrHaCOsyG2yA80Wdlt1FmK4Y
	eY1rbcwLL65ARuTroDgxER40nmfZxdUy7qn/8/6K/U7KTNEDB0ypYahWCm2TJ9Pl5J6BYMR/Yh2qA
	0+MOn+8Pt7fPYyvYI3LetMd99ePSKHmmKsg89DgnmaqGm1UwRR5dRanEhxbw4tFcexzdklQL7qxHn
	tO02Ocr1sLJ8HGbSNclrV50/nCtcFWlbaBGQABmdsvMjYXcVQ/z+Hxsu9WMF74lStFg/UpYcngKNR
	zq75LXo26Ua0UkKV+Ozw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVZ9-00000004Y4q-2QEt;
	Wed, 04 Nov 2026 07:37:51 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVZ6-00000004Y2X-0Lo7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 07:37:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xHE+bwVFNLyB2CpFYsEdIzH1I4NPyJXUy85q9LC7fsrCZBDr3VUdOSnGsF/fg1ELtI5RbFC+DvL9UOUx98s7yGMCg4tysxMr0ObMZznrEFJw5iI4SdO48J4+q3sdDyWLQKKKrOxzTZbckW14eI2UNPpWTVfEhuXZjFtBNhjFiorjOfnownrovtIwS4TTPxAYUcKxqXXD03i+lqoFRLakVvuf3ZumE6G/1tNS1x5sunIE8nzLNOPy2z3jd+8aUHAUTCsJcdIFqyg5jEsvnbyQMW22QqQVT3pJrriuJ/P0o82AjbJmPKRoPXAt41pcncODFlxKqRM0grYbsGHCXMAFAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4MxeTMXRr2Qst4qnlvyqrsUGq5kxRe930C4tbxgdOw=;
 b=KCL4NhCFVACgwwpEDHz1lzXgKsmlguccSvSwWv2f7ky8LynUtDmCaZA48nUIr8sqw0VBtR07UTTZ3TuGowxRI0dS76sl7SkEIwkT6dAPEQcmXd5gD16jil6xOkIevh8B1RLfUW4vl9tt5PuA+VOplcFPipxWRGnTmtP0F3Rf0+W/Su1IZ4Ivb6pdfMIefrzLq1tM49wJQ1+vAuBaYM1MTFoPgDgeu8UNw5eCLLyxy1nl8CYfpmvjfrM9w4Cb2ZQyHRg0U5zlaEwC1A2jqEjtULDHUL9zLx0BWHly9tm7EVxOFIqGWCD562Dzn0Se6qTrTx6KqsThd29oxY/X5RQmHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=cn.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=cn.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cn.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4MxeTMXRr2Qst4qnlvyqrsUGq5kxRe930C4tbxgdOw=;
 b=UnGrFTIbc8/VEd7WdQhifCJuY6/27Yf8CsYu2udv08G/pBWDoqPa4VAj/llW+TuQ6CPT6ag6VLlnrY8TlRameAIob/Oj3g9ivrIbsH3SifTCVZwCuLov3HQeVyHILFHcXAxBBoVefglJIgCK+yWq0fGUrTltroX2LHgpiOD3IMe4ajhMDWE7SL/7AFK8g897u4HDJSDW+NKjrb2eUd855mmYEpus56tWDMt5HXe5eJD1Nk6IWf4F+3nsDb+vnzpFF2K71opVgTAfFnv5HyfY/94N9unE5otmje4FOWPqJc5M8C8BezJmDSHP++4mRR1Yg1ly5tHrTcjXvIkLPC1rQQ==
Received: from DB8PR06CA0062.eurprd06.prod.outlook.com (2603:10a6:10:120::36)
 by MA9PR10MB025155.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:250:100::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 07:37:41 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:120:cafe::17) by DB8PR06CA0062.outlook.office365.com
 (2603:10a6:10:120::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Wed, 4
 Nov 2026 07:37:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 139.15.153.205) smtp.mailfrom=cn.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=cn.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of cn.bosch.com designates
 139.15.153.205 as permitted sender) receiver=protection.outlook.com;
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 07:37:41 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 4 Nov
 2026 08:37:29 +0100
Received: from WX8-V-0008J.wx.apac.bosch.com (10.190.167.205) by
 smtp.app.bosch.com (10.124.11.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 08:37:25 +0100
From: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
Date: Wed, 4 Nov 2026 15:35:43 +0800
Subject: [PATCH 03/10] ARM: dts: imx6ulz: Enable RNGB on BSH SMM-M2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261104-add-bsh-smm-m2-v1-3-369f0a77e021@cn.bosch.com>
References: <20261104-add-bsh-smm-m2-v1-0-369f0a77e021@cn.bosch.com>
In-Reply-To: <20261104-add-bsh-smm-m2-v1-0-369f0a77e021@cn.bosch.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, Haoning Cheng
	<Haoning.CHENG@cn.bosch.com>, Leonhard Hesse <leonhard.hesse@bshg.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=703;
 i=Haoning.CHENG@cn.bosch.com; h=from:subject:message-id;
 bh=fEVpGj/zoDf2jxe/7TrcBRLHgINHemm4O8TFHwCW29o=;
 b=owGbwMvMwCV2Lz9jvnXEsVWMp9WSGLJePVj+VmAJV7aCiTGj/nPJTcHHNqbOO3ndes6aA5fLj
 8t0Z5eadJSyMIhxMciKKbKoJniflbwaYDptZjXcHFYmkCEMXJwCMJFd0gz/g6ucdd33pxw9MUH/
 8AQjSckC08dSS/aaCEhEJAdcUwxgYvjD82uue86iG4Wm/9d3Nhzg4C1Z5P1jwvqVszekCTB+Ona
 bEQA=
X-Developer-Key: i=Haoning.CHENG@cn.bosch.com; a=openpgp;
 fpr=25604BCD19D5503596997B16DE6F689F3B58C6AA
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F5:EE_|MA9PR10MB025155:EE_
X-MS-Office365-Filtering-Correlation-Id: ea4ac354-2ce2-4ee5-8e73-08df3a4681e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|23010399003|1800799024|10067099003|22082099003|18002099003|56012099006|11063799006|261102123227099003|261026121527099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: ZpPAwoz347NRWZwmifsbjrR9X5ezCD6NzPKjHQcXoI2ExBVgoyP6DmIf6Q60V1CqZWNgoCH1X0RKUSfq3EpJnd3lt3eTjeDq5o0U+wVa0w6iCM6kH4qu0nDLmoigSGOCedjtom03Mb7+9FKkY82DeRabWFFlRuEF2yZtSagKfz3uXI4BkE5o9FjP+qXCG7xFGR1FqWxR8SWlW1EmYxG0dfHvrJrDALTlfr+UC2yBFx2QPsIBublSw4WVsnDuTkB4dOq8rAtAuxWZ82ezwZCa2dPAqeTSN+cq3ngSaE6odZTG8LChwaVBuv/voGDlr8ZkuJ5HhKDksCkKULO70GIban/xeWunYmydyhRewvcuHcUBAKvN/vQeBUbibcREx/PNlhhpNy6RMrrvuYFr5Uh10DEiyu1Hh0q1FAts7dG5+mZTz2VIM6dBtyMq9NEh0F4dDHwYd0H3v3SA+XWRTvaeHeAz5ipqIG4eUsEX0BY/OknCwxkECdcxl4r/Qkmob8bPTr20TNH2DI/47t6WhDh/qevwnOmkiRIMiN6GdvcagC2S122LmDB6XCFAKO61ThUvLUu9UQkv4kmEJYnte7LXmw2haGYYuqm77YEks/kmFJmfLlh5CrzN/4cyfUbAlWio18gONF8JFPRFX+6lxzpiGF8WCrMghRo/+aj35hc4Ch5gQ6Zaie6b3fTN3J5uob5cV5/H00aAUfOnXN9T5zuSdA==
X-Forefront-Antispam-Report: CIP:139.15.153.205;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:eop.bosch-org.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(23010399003)(1800799024)(10067099003)(22082099003)(18002099003)(56012099006)(11063799006)(261102123227099003)(261026121527099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: C/Niar9Z/SpCAxwzbeiKIwAbBqxrO8ez1mW1mgDhEiP3Ov5WCeSN0/bL5lbGqtZ6VD/dgvnBBeX86Q144LsideapCtB7z58ybALUm7Tq80Bqab3h30onYSbwgO4aentusifIDMHCPn6ntEJ4Z25gm+Iay0lYx1GS1qE1mVPSBY4syoEiBh1WDCTHhzpFaPjVX3RTSF4fdmAQCjX7ib1jMOCQrfWok2WwR0Nkpe4wgP8c32aHQLVD0uoULNWTbJmxGY/a+q517FC5ShMv5sxVqeAvXG4AIZBTqfgHCe4fRqLNsH34Js35BIGXH55eLoW8vI/NgB0DFD+3FUfpJlARTRvqDizVhfkY4YPJZKjLX9DkKcHJ2WW6UxqtgqxUVxNE+hbT1CP70eFTN9RRrVSiYX5K4lyvfLWjTucAdpwEFKyO6N7uClj9kGFj/y1f3QpF
X-OriginatorOrg: cn.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 07:37:41.0229
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea4ac354-2ce2-4ee5-8e73-08df3a4681e4
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4;Ip=[139.15.153.205];Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA9PR10MB025155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_233748_129775_AA160031 
X-CRM114-Status: GOOD (  10.68  )
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

From: Leonhard Hesse <leonhard.hesse@bshg.com>

Hardware random number generator is now used for cryptography.

Signed-off-by: Leonhard Hesse <leonhard.hesse@bshg.com>
Signed-off-by: Haoning Cheng <Haoning.CHENG@cn.bosch.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
index aac211a9f9eb..39b7ee585860 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
@@ -30,6 +30,10 @@ &gpmi {
 	status = "okay";
 };
 
+&rngb {
+	status = "okay";
+};
+
 &snvs_poweroff {
 	status = "okay";
 };

-- 
2.43.0



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A6A606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 18:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=avcXZAYL;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=E1AKh/2r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=DjyimHyDKHdLalCOUCU3BISe0KO0hLT+Rc1+fcipm10=; b=avcXZAYLAB7bQfMEoV05L6F/Pe
	ycu/35okwdr0G7TqBbaRBkWT8ac61og4eLI5tjnz8B/437WKA6DuuU/o6Q2dU8dBzq6aY9QxT5K3k
	gg+6/T/HtxL5IzgHjgxsTjBjzO032wGQWpZP6IW+ahvcpoF32MgNO2XlFPk2beoC94AzfSSQC+nj+
	VV4EOe77V+Wu2UFBCG0M1LJ/uTgAYJAcD4Hv32+nG2n7zjI2vw1VBWa4r5eo2EBMkLFXZ9IpXfjoX
	ZwyXLkGk5i/A+3jF+EF4ry2rlvlVau+KdQEqirxLi3l6kWiVv/FW1NwTcBnMJnWu9UewVsMknMW9i
	UvfG5B3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMUgC-0000000A6UU-2Vml;
	Thu, 29 Oct 2026 18:16:48 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMUg8-0000000A6Sz-1qxd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 18:16:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DRDNobu3lor6jRuzWIl40av2sy/L7U+81kE0AhcXuekwCbvkGj17J7kaTsv60C5R0F6FSZkcqs2kwhuMXncEnyQLY28UOuJqhrpOU52NdMHFH/teE8kZralRo8nx4ZHpawhtrI0GNzIKxAQon8LPiqaob661LwlhvEJPTP6DiQOefvN/89cIbi/7PMZKDA+AKopk662QjRfBZkq2/9DEYv6NQIwLDjEm0r8z/9Z8Qv5DS5RpNW3uj+h36uJmFJLvpY8HU1utnpbKofA9eog5ZadOVor87rEIT0JqHGXN5/DBjIEuM7Rx0rdPBTTjy9ZagMHOdm8W2Ti/xMPmHfam7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DjyimHyDKHdLalCOUCU3BISe0KO0hLT+Rc1+fcipm10=;
 b=YHTJwnCob5zuWgr/YsvdDN5UVyMzlSU+Z9g0ohkrAjjE+HChpxdbddADLKpZO31beupEPJ5htsprZ7elvQvrNSFznVg7rrAGYoWBzrQSISqm3Vl49W4y/54Bw7hocBvSQBLOmLljtbfd8irL3m8QB29Y1WLM7H8uifkEAcdP5G512xumBFKW+AJzSMNnRs5bMddT+McckIxY2zEJIHC/D8Tl/tx2SD9Qb7p640OcKLFG0fjgV+kTwgoie6lLHstMf4e40te9+1zeyHKSVPjPJ4sWrEhzQsYYjS9HzusyPWei9kwi/IA9GGHDmn3Z6feEurix4QP9DWGhzg67iK/Jvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=arm.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DjyimHyDKHdLalCOUCU3BISe0KO0hLT+Rc1+fcipm10=;
 b=E1AKh/2rDcAzzQzRcnLW8Zu+wCg0kO3MvqB5TNw+Dhyq3ZcTedNOTAkKRylu2PlXbq6P1ll7jlq9V/+uavO3SDDmDBXOILXL77C869S3iMOGB1XGj0DEJCsmupFmol+VvPHfMOOH+JmjsKIgPTYllI+Xy2eNIoVzaUPSA0gQ+cGRohQJacYj1Ob1yPge7DFBu8nSRrE/eVY+7otGKhXmxDtV1eqrwiMARKeUKsj6w1I2qXTrDB4p4YCqMwl4p1uQx0knthLJqFwNmVZ4XduTDcx5j4PUMEIvPxpP79lx0Tiq+OOeM7+pqeKrb906IPB9HPQlGPA2VFVfHw3ZnPWRbA==
Received: from DU7P195CA0021.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::31)
 by MIWPR10MB761893.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:290:d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 18:16:34 +0000
Received: from DB1PEPF000509EF.eurprd03.prod.outlook.com
 (2603:10a6:10:54d:cafe::58) by DU7P195CA0021.outlook.office365.com
 (2603:10a6:10:54d::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Thu,
 29 Oct 2026 18:16:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509EF.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 18:16:33 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 29 Oct
 2026 19:16:59 +0100
Received: from localhost (10.48.87.100) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 29 Oct
 2026 19:16:33 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: Mark Rutland <mark.rutland@arm.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson
	<ulfh@kernel.org>
CC: <dario.binacchi@amarulasolutions.com>, Linux STM32
	<linux-stm32@st-md-mailman.stormreply.com>, Patrick Delaunay
	<patrick.delaunay@foss.st.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] firmware: psci: handle unsupported SET_SUSPEND_MODE in PC mode
Date: Thu, 29 Oct 2026 19:16:25 +0100
Message-ID: <20261029191624.1.I5f8f3d75a566b72250d629ac6f43cf0d387c0218@changeid>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EF:EE_|MIWPR10MB761893:EE_
X-MS-Office365-Filtering-Correlation-Id: b54e4083-f915-4861-f2d7-08df35e8c396
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|56012099006|11063799006|5023799004|261009223027099003|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261021123027099003|10067099003|18092099006|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: DDeV0AW+jr6FQKPJDhjaJpMPksuivtsE5u/zUwZSqFwWyHB4P3Y/ZJV6Nq9W2FzXUhT1lIYlO68+1mhHyCBrPx3jjTXw7VNJM0yBjPktDH0j0ZB6/MLrAPqPSC0gl6fF9u0TtonO29N5Zx1yCZmddm2c4h0EpqafJUAzpFWdoL6yRG/OnLG69qEqMx1nJHTJHLChEyI5DXxK17ySlPK7egPwm2/hGwBQilNe98JyEv5Cr4CeX1DehbsJK4OuNlwqSXgiK9wzgxhHD7f/iYMzgVJgcpMMMVhdCRIQR+DkVW+Tw4xZ5rGaPmAHpUPsDXm79wDaOikEmlMmUP31gi/OVuEEgnpfhPJ2ZaLJzbVlmGbktd7lq0wUD8GEd5Ya41GLZiymyOCbjPwQd9TdH6wnjpI6Aer7TVZ3OiGZPPAW4xlDWOyl0EyECjlxskFw8+hnZ8ZR+sjQzr5bmAVOfzgPuEL4KzHIdOYBb/8vTKyxkAK64Hn3+RwEbNokVfoVH6oLhxEHCyAIHHl+TJLHOUtxlRxnH6EuAcUDObsFpT91LD7WEJInr3aaGn69RtUtPBR03hi87GOHKSMNnsPdEegLCXlxPRRdF9tFbMezDFu2hS/OnwAiTtlupf6MmSsyxRiIrUsajMtud+pGP9KibuY1QySChbqfWZzK4IYxtUjhO52vZNxFjSuGUekjeUqCYvIcSULzGEeOSajUiB7xv8ebeg==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(56012099006)(11063799006)(5023799004)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261021123027099003)(10067099003)(18092099006)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Rryby/VrTG2H9kLgMcHKGjbKXSWxmHXzC1pBzeVox9Ox1yrqXUE56Zrm94rThTcf5gHIF68za25yjcsBBWvSt+psG4MwkvSdVV2U9MjdwHWew1p1dJnyDOEaPGA+4C/6CaMn0A71ueGzDrUbLHv6IZikTqXG510uei9lpv6bGUkav8vz7+2j4qVbDwSv4590DZPciUESYbt1neEaFbPhy+HPpd840hOUvNs6y/BksrsHsepdhJL4Oss99y4nlG9o2C/ZijPciZAs/SWNLwIdiRZEiHpc/uvOyzbZmmTHjKlETrSqMkcWlnjYGaXTmnq4SCPhi+Zqrnb99cQXVjWRpPfZBvdokmMlRb4hV8KXzhUZWZshv26BrNtVLdgy8GmGJmHCZpbEY7dDG5zabwkFqe/9Daou+it6Ikt6e/PI5irkYyCdKvq9WRxl7PZZrHcm
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 18:16:33.8936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b54e4083-f915-4861-f2d7-08df35e8c396
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIWPR10MB761893
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_111644_842297_E0062F1E 
X-CRM114-Status: GOOD (  12.87  )
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

The PSCI specification makes PSCI_SET_SUSPEND_MODE optional. If it
returns NOT_SUPPORTED when Linux requests platform-coordinated (PC)
mode, Linux can assume that PC mode is in effect. Treat this response
as success so PSCI power-domain providers can initialize when firmware
does not support OS-initiated (OSI) mode.

Continue to report an error when OSI mode is requested but
SET_SUSPEND_MODE is not supported.

Fixes: 49fdcd7577ef ("firmware: psci: Export functions to manage the OSI mode")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
This patch allows to Start Linux kernel with
- device tree using PSCI power domains
- with TF-A BL31 compiled without PSCI OSI support (PSCI_OS_INIT_MODE=0)

For example, since commit
9c8d852dabbd ("arm64: dts: st: add power domain on stm32mp25")

we have errors on STM32MP25 boards with latest TF-A (v2.15.0):

[    0.041800] psci: [Firmware Bug]: failed to set PC mode: -1
[    0.041814] PM: power-domain-retention: unable to remove subdomain power-domain-cluster
[    0.042130] PM: genpd_remove: unable to remove power-domain-cluster
[    0.042313] PM: genpd_remove: unable to remove power-domain-retention
[    0.042455] CPUidle PSCI: failed to create CPU PM domains ret=-95
[    0.042465] psci-cpuidle-domain psci: probe with driver psci-cpuidle-domain failed with error -95

and the associated devices are deferred, for example:

[   10.974374] platform 40130000.i2c: deferred probe pending: platform: wait for supplier /psci/power-domain-cluster

 drivers/firmware/psci/psci.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index e73bae6cb23a..610756e81363 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -167,6 +167,11 @@ int psci_set_osi_mode(bool enable)
 			PSCI_1_0_SUSPEND_MODE_PC;
 
 	err = invoke_psci_fn(PSCI_1_0_FN_SET_SUSPEND_MODE, suspend_mode, 0, 0);
+
+	/* when optional PSCI_SET_SUSPEND_MODE is not supported, assume PC mode */
+	if (err ==  PSCI_RET_NOT_SUPPORTED && !enable)
+		err = 0;
+
 	if (err < 0)
 		pr_info(FW_BUG "failed to set %s mode: %d\n",
 				enable ? "OSI" : "PC", err);
---
base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
branch: master

-- 
2.43.0



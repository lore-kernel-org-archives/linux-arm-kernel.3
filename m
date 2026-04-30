Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96778FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 11:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IOMgvY2wgrw3uJCXiSsSqmQjTwBIMXwpWB3eJN3dd74=; b=fjVm2Xi+M27HG5BfGVQnNJNrJe
	GrC0uoIjA+kqGkPHOTb3XXmLA6eP46hG0q2tUhxc3TxBlMfYyzlnXXVRgfhjtRdmWEyhd/LLhaXuw
	xONSV0rHbOXtEKMmUUt/aMqcK+FSb8Px/Gh7e9QQgjR012NsNt+aBOwgHeZj6FCHYR5cKR6LVkgmh
	oY8jq1OR99f++iASLuwF1c353GVcg5zjwHObOyWDrUiNu6HfnHZE3FStcJ/RaXwwVtV9H65zYTtbD
	s9k7qOexHrFWa54iotiZWq5tjyAN6EaALqVVsPDoEArnwCtlgyKB8XEvj0R+/pAcIGw37wMOWbduv
	MCO91MvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPiq-00000005OST-0UtO;
	Thu, 30 Apr 2026 11:38:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPio-00000005OSN-0An3
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 30 Apr 2026 11:38:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=IOMgvY2wgrw3uJCXiSsSqmQjTwBIMXwpWB3eJN3dd74=; b=JLbCpA2we9gzwwaDMiPsbXJfx6
	lCypm1jhsEnP4GKj+DRPHEcIHyeiJBHutGGmo1WLYOw/1zswKEepv6ftl+Hf7zCB1omf6rvNEpr7U
	XKGt1xUgDp/75Oa7n85GytGUCUSQmoKhF5FKP2Qohfve5DzzBU5mVgU1sOfqtV9suIU2r5Ti9sptR
	4Y+J2qjTurnxW9Vp/JJ6jcsP1DmqgvbNkATPtoQ0MFeO5uA/3WeAglx2Kzcj9XCYp/rZQInB1HGMD
	EBiLh/tRC+K1+Ati5LaLSvrzSQBJ2lo/GoMSN9GYcTRGv7v7jgqEUPkcely/4Xw0Swt8NoLNLvKfQ
	ExyIrO2Q==;
Received: from mail-japaneastazon11022102.outbound.protection.outlook.com ([52.101.126.102] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIPij-00000007HLo-2njf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 11:38:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b+2S+6MHACu9J5iLJ0JuB67lROiiXjLTxsstQXUeyqS74U+bfo3wmbWuWfg/zquq2DaeIQSZcd+e1hK453S2ZdVb4M6ln1PAlzkxxtQ3DAb74WSlJAVbcM+CWppBVBOALxgA1Q/hWDMntduAnsLs1+i1URIulsKr/f2F3/I4LrhjeCVF4zjSPfsO+qsCU0kvngq+JsG0hBhuwegOO7Tp0DAR65Q5GHjQMDbSMyUQ8GKeEurECfPW1DmGTfimU0G030rRR/qCeUntZZT9XjVI4lUbYfih52wF6f5e61yH6X0ha7cOL7imHKxna5EJYfzkI0mjlraKs/z+082XDFIJpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IOMgvY2wgrw3uJCXiSsSqmQjTwBIMXwpWB3eJN3dd74=;
 b=bT8z6PjPzaSJe4aLIURfAwmhZ55I+VH/7oTBLImFFVRdw+j71/GLLI3p7Vf/DyfzS9VinVE7+eu6U+Wig3ZO12+eWAq53Y0pKDAB8B7cJQZXREl1qtZtwQJ8N5Qt/B/VqEe2DbEVXxsvS/W9ELnrZuc8IFdJMisDaY1eqv82jjDmWIpTs4gL2q+bu26U+FdFYYKc1NJT8Xcnw10KClXWIJNxTep2+DCrwLaUZ24GpX2pU0qi4YKCDbcQsqxSCbskU/h2S2UjrZiSdY76vc3IhqqriaSXBVkK08vrGnh4Pfc2yUL5LzwGqeAUKnWcxclmvsHB3Ys/xbeBl1VoSZV0qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:300:58::18) by KUZPR06MB8292.apcprd06.prod.outlook.com
 (2603:1096:d10:62::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Thu, 30 Apr
 2026 11:37:52 +0000
Received: from TY2PEPF0000AB83.apcprd03.prod.outlook.com
 (2603:1096:300:58:cafe::f) by PS2PR01CA0030.outlook.office365.com
 (2603:1096:300:58::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 11:37:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB83.mail.protection.outlook.com (10.167.253.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 30 Apr 2026 11:37:52 +0000
Received: from local (unknown [172.16.64.130])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 61AC540A5A30;
	Thu, 30 Apr 2026 19:37:51 +0800 (CST)
From: Devin Li <Devin.Li@cixtech.com>
To: peter.chen@cixtech.com,
	fugang.duan@cixtech.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	cix-kernel-upstream@cixtech.com
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	guoyin.chen@cixtech.com,
	robin.wang@cixtech.com,
	hong.guo@cixtech.com,
	Devin.Li@cixtech.com
Subject: [PATCH v1] arm64: dts: cix: Add SCMI performance domains for CPUFreq on Sky1
Date: Thu, 30 Apr 2026 19:35:59 +0800
Message-ID: <20260430113559.3102436-1-Devin.Li@cixtech.com>
X-Mailer: git-send-email @GIT_VERSION@
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB83:EE_|KUZPR06MB8292:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 54e6ea6c-ba8d-435c-04a6-08dea6ace9fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 1GKtQhutHDDZA+03fKcE8cNeawQC75Lg6dbwr6BTLHzm2BhPhKPW+wUNYvNjU77dOi03JwAh7aoxP0MFp83ofItuoa2JTvCbvb/NZXsD8jqQsLVMi7eHh5tRj8VLzDn6kXhThJYT1Pr7MhktrNgcRqq6WpWYhD01gVSPVLDxCFDVP8nuCR8WBGsa+xEfq7cJ8R6ID7p+LlHcIsMDCt3bjawp6/6kuB8/9abVQ/Rnz4/xbPyqYBzQQEwlkVaAF3YKk7WpTPF87Gi3gaUe+yuGvptuMYe/8D5nC4jwRlqtE6kj4qw9Bi2g+7fzX3rKMHGC/Z38CbS5Yt5kxex3L3Fooq1HPQXvlAy/VnYNeUsvsNedsjPrspQsIw+jUH/MsIbZp8hZlwpmgEvyBLtbAxYkiYluEyVDnUdlQQar2MxDkqLqZz77OEPPNJbVQ/gEQhexv6l664IghJTaYjFv6Ur9ZXAm0d/0DnX4UKu9TZ2SgvPAD1KtBwDXNfBsIKEL5d+NrRwKcbkLMhyWosfSULqfwZECXiVjmCScT0GM5DxAyRqTKIHjyYle8r4duzlT445oUlQq0CjqnMu4GTqdXCxJ4o59sGGowt0KhqkNhl0gQtOxzDfyLSCcYk1B8IkCDMC9A/A8s6uvZpYoE7YlaheA356FcWZ7CUJTcixNsyBWcSrBl47wIXxgUDg3/bcySb4wNzJtv4saFf4Ziwt8bAStv8IUnaHXI4NXaKqIKhpu1j8Zd456LIJzob2tP7vDyH0U1fILHDqKo/S5HV/jQbTPeA==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LQKeB8wR6rGkgsWsX5oyeTStqO7QxyE2eHE+TgKBfcZ/eqdDf/5h0p47S6HXNrIw+puvwN8JqXMNVg7gY5DvmK6HoNsa6p4CWbbNDI8P395KnwgPdl+r4LwIsy+n2kXRZm9VaUyMTYP7jP0Il8nBeKkhAaILDKTJEmr3RnJkvPb2hKxYb/hmIkTE+/rSvhc6ac7FRccRPpeB88HGwmffE6WQBzvROLjSnbX1yCmsC7D+MZjJqoEeUheypkLNDf44qmOenhZLIj43bO/s+oEU2Firywmhe3AIZwiX4mj9xzOEard6Ng+VQNc8rTqN8LNx97UqYCcJ1sSWWjl3s5Z4N0+XA4Kh0HmK5ZvaVPd3yQ52lkzPh3MT3rMe4fd3j94tLv/nV9lEyik61tKLqVI8nY/KjFrNPh5I6PQdu3mmHSiizHFauOoXfCTAJ6z6rcTo
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 11:37:52.1398
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54e6ea6c-ba8d-435c-04a6-08dea6ace9fd
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB83.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR06MB8292
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_123817_852026_D11132F6 
X-CRM114-Status: UNSURE (   8.90  )
X-CRM114-Notice: Please train this message.
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

From: "devin.li" <Devin.Li@cixtech.com>

Add SCMI Protocol 13 (Performance) node under ap_to_pm_scmi with
domains.

Define SKY1_PERF_* macros in sky1-power.h for all performance domain
IDs (CPU L/B0/B1/M0/M1, GPU, DSU, NPU, VPU, CI700, NI700), and
wire each CPU node to its corresponding performance domain using
power-domains and power-domain-names properties.

Signed-off-by: Devin Li <Devin.Li@cixtech.com>
---
 arch/arm64/boot/dts/cix/sky1-power.h | 13 +++++++++++++
 arch/arm64/boot/dts/cix/sky1.dtsi    | 29 ++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/cix/sky1-power.h b/arch/arm64/boot/dts/cix/sky1-power.h
index 53f4a3af36b3..144567579b71 100644
--- a/arch/arm64/boot/dts/cix/sky1-power.h
+++ b/arch/arm64/boot/dts/cix/sky1-power.h
@@ -30,4 +30,17 @@
 #define SKY1_PD_ISP0		20
 #define SKY1_PD_GPU		21
 
+#define SKY1_PERF_GPU_CORE	0
+#define SKY1_PERF_GPU_TOP	1
+#define SKY1_PERF_CPU_L     2
+#define SKY1_PERF_CPU_B0	3
+#define SKY1_PERF_CPU_B1	4
+#define SKY1_PERF_CPU_M0	5
+#define SKY1_PERF_CPU_M1	6
+#define SKY1_PERF_DSU	    7
+#define SKY1_PERF_NPU	    8
+#define SKY1_PERF_VPU	    9
+#define SKY1_PERF_CI700	    10
+#define SKY1_PERF_NI700	    11
+
 #endif
diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 0611098b5f05..a77c52296ebd 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -22,6 +22,8 @@ cpu0: cpu@0 {
 			enable-method = "psci";
 			reg = <0x0 0x0>;
 			device_type = "cpu";
+			power-domains = <&scmi_dvfs SKY1_PERF_CPU_L>;
+			power-domain-names = "perf";
 			capacity-dmips-mhz = <403>;
 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 		};
@@ -31,6 +33,8 @@ cpu1: cpu@100 {
 			enable-method = "psci";
 			reg = <0x0 0x100>;
 			device_type = "cpu";
+			power-domains = <&scmi_dvfs SKY1_PERF_CPU_L>;
+			power-domain-names = "perf";
 			capacity-dmips-mhz = <403>;
 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 		};
@@ -40,6 +44,8 @@ cpu2: cpu@200 {
 			enable-method = "psci";
 			reg = <0x0 0x200>;
 			device_type = "cpu";
+			power-domains = <&scmi_dvfs SKY1_PERF_CPU_L>;
+			power-domain-names = "perf";
 			capacity-dmips-mhz = <403>;
 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 		};
@@ -49,6 +55,8 @@ cpu3: cpu@300 {
 			enable-method = "psci";
 			reg = <0x0 0x300>;
 			device_type = "cpu";
+			power-domains = <&scmi_dvfs SKY1_PERF_CPU_L>;
+			power-domain-names = "perf";
 			capacity-dmips-mhz = <403>;
 			cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
 		};
@@ -58,6 +66,8 @@ cpu4: cpu@400 {
 			enable-method = "psci";
 			reg = <0x0 0x400>;
 			device_type = "cpu";
+			power-domains = <&scmi_dvfs SKY1_PERF_CPU_M0>;
+			power-domain-names = "perf";
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
 		};
@@ -67,6 +77,8 @@ cpu5: cpu@500 {
 			enable-method = "psci";
 			reg = <0x0 0x500>;
 			device_type = "cpu";
+			power-domains = <&scmi_dvfs SKY1_PERF_CPU_M0>;
+			power-domain-names = "perf";
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
 		};
@@ -76,6 +88,8 @@ cpu6: cpu@600 {
 			enable-method = "psci";
 			reg = <0x0 0x600>;
 			device_type = "cpu";
+			power-domains = <&scmi_dvfs SKY1_PERF_CPU_M1>;
+			power-domain-names = "perf";
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
 		};
@@ -85,6 +99,8 @@ cpu7: cpu@700 {
 			enable-method = "psci";
 			reg = <0x0 0x700>;
 			device_type = "cpu";
+			power-domains = <&scmi_dvfs SKY1_PERF_CPU_M1>;
+			power-domain-names = "perf";
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
 		};
@@ -94,6 +110,8 @@ cpu8: cpu@800 {
 			enable-method = "psci";
 			reg = <0x0 0x800>;
 			device_type = "cpu";
+			power-domains = <&scmi_dvfs SKY1_PERF_CPU_B0>;
+			power-domain-names = "perf";
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
 		};
@@ -103,6 +121,8 @@ cpu9: cpu@900 {
 			enable-method = "psci";
 			reg = <0x0 0x900>;
 			device_type = "cpu";
+			power-domains = <&scmi_dvfs SKY1_PERF_CPU_B0>;
+			power-domain-names = "perf";
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
 		};
@@ -112,6 +132,8 @@ cpu10: cpu@a00 {
 			enable-method = "psci";
 			reg = <0x0 0xa00>;
 			device_type = "cpu";
+			power-domains = <&scmi_dvfs SKY1_PERF_CPU_B1>;
+			power-domain-names = "perf";
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
 		};
@@ -121,6 +143,8 @@ cpu11: cpu@b00 {
 			enable-method = "psci";
 			reg = <0x0 0xb00>;
 			device_type = "cpu";
+			power-domains = <&scmi_dvfs SKY1_PERF_CPU_B1>;
+			power-domain-names = "perf";
 			capacity-dmips-mhz = <1024>;
 			cpu-idle-states = <&CPU_SLEEP_1 &CLUSTER_SLEEP_0>;
 		};
@@ -205,6 +229,11 @@ ap_to_pm_scmi: scmi {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
+			scmi_dvfs: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+
 			scmi_clk: protocol@14 {
 				reg = <0x14>;
 				#clock-cells = <1>;
-- 
2.49.0



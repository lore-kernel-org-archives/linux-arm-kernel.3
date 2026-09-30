Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C607ACA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 07:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tp6aNA+99gIovrTYIbvbggc0NMQ1k2zHjaAq2GcyNHQ=; b=YUgdS2ifHrbMbCY+v9A6X980Dg
	yee+JSkrh1KXvyzguS7m6LeowEZQQFgntLZFGVM5i4Dz2aas+rEZ+HAkaAwJq7C36s2qBVBVrZDvT
	GgU52wdCgkF7dzLKKdbMmx9bA7LSLpUy7eDya25UoWC+Nat1ELpOH3ecmCSPLpOD6gWI1T+GZ6cJD
	skPXrs7hf/CDCh9TLXhQXwLvnxh6PwCubNOYJt0TTxUVk+aeaeQrVIguGBmZeQk0VPqc9ahIzVtS6
	wzhPn/S8BPYKGyF51gXJ8HPa6/wywPP0+AaPQ2rSz7dm++1+bndo0P73fJ8vcjw+tEsupHQ6V6F+m
	u0bgx8Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBp5U-00000005Kzd-0BAh;
	Wed, 30 Sep 2026 07:50:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBp57-00000005KtZ-2Dx4
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 07:50:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Tp6aNA+99gIovrTYIbvbggc0NMQ1k2zHjaAq2GcyNHQ=; b=dXthedoYrWu4YkXfHLfaM+KTVu
	tPibeTS4s0J/G1qRelRQOzPligcuFli3bqX68KQotDcq7EmOE/YKzLCTMR3ETiEbYh33ernhbseVE
	TY7Yv/T7xmtOmLX9Gf6hcFiuwAcTKSwapc1wZhOS3yFWqFPPCv9Yi/m1pZwO735JnLihn9cwh6gWM
	kaGZN0rVwLBPu4a6zEz0FATlnGJjmH5NsfIhxbMNVWhwm9VPRLce4SMBO1ERDxbWZR0qrj+/x48w4
	4hOs55Ke1ulLsi341oaLCWnnUyO9C+//dPzNCzi4KpyrbHROEHDaP6tCfHNc1lM2RT291Brkbozo2
	dgcDqvUw==;
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBp54-00000003Uen-2QKT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 07:50:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvhojN2jNvXNI5KErf0yMjD6i+ZPI0OKn/KK14iVnij9i3fozZmwA8GarEb6tveotKf4JnZ6yPAC81gku8QNf4Lp0Z21yIPaIjAe7bZMXXxPy13zUNXoxsRFdUUHMI6f8xrgWKWml8sALQvQtcaPx01Z6/j5ttBO2EPF9VYYhCWtfJXpXqJUAGTGGZNFj7rGZJDvUKmDqOnboFW2eH9DWJM1T0kPw2qBY2QYopn255a4Xgnkrj65hv2HM8m8jzZYU+mX9GbA2FAWJGzEK966nxG1MlK6mA6FNzvbnBnlrYLPNaQR9gi2CqqnrrAXl63zrK6Z7ptoota+SBFNP4qJLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tp6aNA+99gIovrTYIbvbggc0NMQ1k2zHjaAq2GcyNHQ=;
 b=NJUJgLVoKzYwibujCMmSRwaHGgC/30+s6cPlR0JDYg7InfxbM2YlxICYM0n+7b5Cq1X7yI/7PRANhOwG3ihK9Sen73Mzpxk2Ki+hcNt7dtmx2yim+rH11LcdGwDL8YnHNVu1VtXclhCH+TcOfvJiJf38mkjIkZDFfu7P+Sz1bzA5s56dtCQwNSsY5d6dz5UbGVFxXBUyQ5zCGgS649K6tF+uMlRynJNh9CFtCzQq58PZZp4SteL4ASu3kQMgNS5yxgw7boYSmdXnHx+cCirsw03yqHOHu3P3wP5RXl7Z1KCEOQgUP3bx5Lm9JQogF8I21AeXV7GfN9iyJV/qlf7XQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tp6aNA+99gIovrTYIbvbggc0NMQ1k2zHjaAq2GcyNHQ=;
 b=QCi8EXkWBOhV0gyLvj47dV9GG7mZfyYk1+fnu/K58hhK1e1swgapg8GGABjgP8ULRwJZItSkc3mbEsVa8vTFS1Wus1fx5vjrvyXQLBIRVIkCbifeWwWMhU4GnUZH8ThiHzywS6259OQJW+duZ8+oUaYYsFaLpeBHLUYPbVc7Dj6gaYIbTaF3rXanIoKFjMhTUWbUmyW+iH95LxZFR83qYJBDl0okxbJJVzzzPEW8+bt9oxuzftu1raB5ANbI97aTx7GC9sD9s7cg5OwIoHi5DQKRhKiaU3iO+TLKbBFoywc950yv68pxw3WFoR9d/LTRuvpgBwZhaBlafr2tTBDF0g==
Received: from AS8P250CA0022.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::27)
 by GVUPR10MB9725.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:35a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 07:50:16 +0000
Received: from AM1PEPF000C1ADB.eurprd02.prod.outlook.com
 (2603:10a6:20b:330:cafe::91) by AS8P250CA0022.outlook.office365.com
 (2603:10a6:20b:330::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Wed,
 30 Sep 2026 07:50:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM1PEPF000C1ADB.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 07:50:16 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 09:56:48 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 30 Sep
 2026 09:50:15 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 30 Sep 2026 09:49:50 +0200
Subject: [PATCH v2 3/5] arm64: dts: st: add TAMP backup register in
 stm32mp211.dtsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260930-upstream_tamp_nvram_dts_part-v2-3-bd73158ce46b@foss.st.com>
References: <20260930-upstream_tamp_nvram_dts_part-v2-0-bd73158ce46b@foss.st.com>
In-Reply-To: <20260930-upstream_tamp_nvram_dts_part-v2-0-bd73158ce46b@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	=?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.16.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000C1ADB:EE_|GVUPR10MB9725:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fc05c1a-55ba-497d-bcd0-08df1ec77791
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|82310400026|376014|36860700016|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: PkZ4F4DdemLl48fiLJf4cJgsiDHyJv83yy2kY624Ffp5BaU/RfcGgdK3Sbx88t1eY0cIEWBV8NELDGyI/M8wZP2qBximOtYic3dHNYfxznGN3DFxRem3qhSeWD2Yb+Hdacjvqa/sbLRDGdCQBXOuLSyGWQbIhvOLOdLMPPOO+fVO22ADEgAuBz4wFVk7Q5c26DdnKVSmBrDJcns3yBZQbqfdNHaPiKSFOvMLZdMs+Lf1Alu2ycbkz+4lrx28cYcYCDJi1FtSWOwd3WcxYgtvJgtr81eYqiVMdk8JKdda4kJ4Qg/zTuPGk8CY2IIhKriAEKPl8QtoV2XFcUvt1+vtxuVjgWSBudKWTk/0pESTyqDBvs0lL0UZIvslcDJD3RDbV6b5lCoDwp6WWr85DFtEBFGsZS0zAPJFTxp9dN8+qgMBQyj3hiHZBiylsF9XlmR6EyYAG+oFoOCfkWQb65R7Y4Y10AOEVt9cuBwLiRdj2Rl1RtUwIdWxOzu3+/DfRM3aSagSn66R5taRzbV9ZwwP100WnLbE2kqwIx+J07CklY/wzLCXuOxqEtZKXFkDu8pt9z6Rnw2gS4mRxQmqy4+3iqn3IqiPM3a+kVgOYhQHEe0kTDCRRoNRLeBo8Ew00MA5q7S/TcfD20h6/STG5Xv0tcKpaaJ2YS3od3q78ztS4whe7JdhR5fcOszk97IWHSw5p93C1rvjXOp3eVJ/5Xyb+A==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(376014)(36860700016)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: iz808eJxeo1GtPss8+RUewoH0TIpbwMWD4ZMrFPiSjGiAqUnk7/bZLi2DkgWsqDyaBg+xjbRyHtGVDhNRB8IhPkCfLSHjrEHSsCe+HBqkw2W97k1HlVonye2qSmKyRohoNJURzoiQEoWeXNGiD5K71Iy1AGvUCvDE2pHPR5Ve7MmcKP5792RRm0svWL3akg3+bdLc+RAmfqj7zBgUHZyMy5xUZydcWAqGSR+MIYS65QrwlZiIYsCGD6nwy9oYoMjXNlZVy70kChwD21UnK5dtJCpqDWZL5KwcTkw3JZ6h4N87h7+lPHB0xk4VtZEDxqOWOnBeXoqlJ68ITkdwXZsRWtKAuDC9JeTuZ5QXHfe+VSsbcmZ/cdHKFgOLrkUaONVzBNlh/Jc++s7Zc/7A7Vy77nLvX/lwf3NYlUCZtBn2Z8y1xqxFH2usThpVTXLirBx
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 07:50:16.2317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fc05c1a-55ba-497d-bcd0-08df1ec77791
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000C1ADB.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR10MB9725
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_085022_781013_456C9A49 
X-CRM114-Status: UNSURE (   9.36  )
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

TAMP backup registers allow information sharing between different
software components/execution levels.
They are described individually as nvmem cells.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp211.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp211.dtsi b/arch/arm64/boot/dts/st/stm32mp211.dtsi
index 4bfd58b26b51..f9fe99dc90a3 100644
--- a/arch/arm64/boot/dts/st/stm32mp211.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp211.dtsi
@@ -133,6 +133,37 @@ syscfg: syscon@44230000 {
 			reg = <0x44230000 0x0 0x10000>;
 		};
 
+		tamp: tamp@46010000 {
+			compatible = "st,stm32-tamp", "syscon", "simple-mfd";
+			#address-cells = <1>;
+			#size-cells = <2>;
+			reg = <0x46010000 0x0 0x400>;
+			ranges;
+
+			nvram: nvram@46010100 {
+				compatible = "st,stm32mp25-tamp-nvram";
+				reg = <0x46010100 0x0 0x200>;
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
 		intc: interrupt-controller@4ac10000 {
 			compatible = "arm,gic-400";
 			reg = <0x4ac10000 0x0 0x1000>,

-- 
2.43.0



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53EDF606D82B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3Ik+skh6;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=I8U9m7B8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FR0QvdtaC9dmgh3wIUU5cAMRTBkJfDCReJjI8Jmg8KE=; b=3Ik+skh6uhHxOw
	kvMIHtr2qBg/x5x0xERptWISVJbyysQtb7l6vA6nhl+cLxEYBFemzf8Vgbykr07O4b5VfAiUIq54F
	RZfT3Kd/WQlWnLPOihKlhP7l1beAw6vz35gptFm4g7lX7RgQi3YvfVb1/OGO4yXu2ql23jSPXa1Sj
	1Z1G4EtSJw4MVitJ0RBJ3ZTEQdQ6kzAq5KxFnE4y+sao5LAPQUInMs17UXp6Z3iUU05CpUlai9cqD
	ZDbA6FmGkrBsw7e1M0RCNVrE0WwQxlUUNee6S0SrGOVJUIs9k8rqNOnpJs7hgeO/uuMBGXyABsdj9
	qKOhZQuhVv7QBIvlGXOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwBf-00000008oSJ-21Dn;
	Thu, 05 Nov 2026 12:03:23 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwBT-00000008oNU-3mRW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:03:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aVwJ6yBxDGuHrOJnrUcxZjKe/6H77BG6UHXeFXEF6y6Sg+5V3FOCxWllolnIUwr9Zi8IkhUYfU7cs6OCL1Kp8MyWpb1wTvmzNUKPTrm3W4u0N7bojoLx7Z8Wc5DgUfadkBeKwbsaZ+JcN5bsG0TetGtEGJZSPx2t7N/CC89HF9vDRoUZ27yBWw690I2JZBAAxUdcGpVV0WZQxlmPUNjUJmr1Lh7sdARKNpCUxdNclACn6dVCStbjx/FMl4X9qLHF8aAZ4mOOaYaGerce2hRP7r+UPF3iOm+5VoHN2I3ztZU50UJdhqAzMfyTZdldF6ZeYd9slpwP7IDHwna+/kQt7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FR0QvdtaC9dmgh3wIUU5cAMRTBkJfDCReJjI8Jmg8KE=;
 b=E7FphDLFhe9vAtBJI6za/DlqfIlIyy1T0wdWurET4QTyurzzqmPvcRm5nQxnwQkm6n1NNx3inD8jXdvjLPh+HTTl5qjAfvjNIAla5RD5sa9HMXycvW8NuERbeTVNz5PTa5R3r+8nkeJXnbVHkMIYfXdhxPogdhTYUPsxLWW20DDcwSHJipG5XJF9I2jW9g1qi/BPCI8QOvvBd+LiTKInGYg9SNvnseJHhMrgCtA6SYj4SXK1tG15QeSCwTwzjbM8jNXQObDpzZmYMxkglJbHAwct8czsNgCUGG71No3nxPqalhrKz56y1X5DQBwfe8m5f2aoRvE25nvw5yHmShPuMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FR0QvdtaC9dmgh3wIUU5cAMRTBkJfDCReJjI8Jmg8KE=;
 b=I8U9m7B8ctTzB7p+vHkLw5n4Mj34krF1sBi8zDsjBUUHs6bRo9NTXK3j0/YjcGth9sqNhhysuxcaMI+m4ZWqCsLvshT4XgsMeYpf6Ov3E2y02kv08JO1ABiDE+eSIYb6phVwVkJgzHpUfFtLyMUGsbqHerDbVdWjLFs8Kk4qYoepgvYAhww4hWa7qq5LC/gDNjWVMj3AzzakdfpOaQkOo5h6x0jDMliuGi1IO9iLoGRObKVJQr9c5VDxpjA4Ve09fEUH4/BbwkkZ3hPi4fjor9Ub4ceqP9go/esxR17YjOw5I0xyrF9x1kGPtN7pslrAF7wAV3687219ffA+kwe68A==
Received: from BE1P281CA0020.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:15::16)
 by AS2PR10MB6428.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:547::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Thu, 5 Nov 2026
 12:03:06 +0000
Received: from WA1PEPF000099D1.eurprd04.prod.outlook.com
 (2603:10a6:b10:15:cafe::3d) by BE1P281CA0020.outlook.office365.com
 (2603:10a6:b10:15::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4 via Frontend Transport; Thu, 5
 Nov 2026 12:03:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 WA1PEPF000099D1.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 5 Nov 2026 12:03:06 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 13:03:51 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 5 Nov
 2026 13:03:05 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 5 Nov 2026 13:03:05 +0100
Subject: [PATCH v5 7/8] arm64: dts: st: add TAMP backup register in
 stm32mp231.dtsi
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261105-upstream_nvram_reworked-v5-7-ddf7dbf1b298@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: WA1PEPF000099D1:EE_|AS2PR10MB6428:EE_
X-MS-Office365-Filtering-Correlation-Id: b4a72efd-5653-498a-8827-08df3b34c05f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|18002099003|22082099003|10067099003|56012099006|11063799006|261021121427099003|261102123227099003|261022075727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: ZIp5XS/F9nmIprbUZniS4EZA/H+1D9Y2RIFGjvl40+E33TZBHH0DfqBkLUTP8WFAV1uSvGtulwRZC9DI0NH5PxvDOogrqW9MINo1GpjAmmFY3qpD3Gnw0a6Pj9XhYJvLq2ZNs4/fRvqIdAU7h/r2S8MFNz2/mNnAzWu7cJjuGSp516/RYkoGI0l628ZNHTQV1oKIJKuLRxaSHbPdM4//QHkMcA7+1xbgP1PHjG/zitJZB88m1mNCKe2i+byoUli7xbSPjo1R6Y3LlsStiMGpiQ5XoNsK7Nbd2DBNk+VgwPVFGM7N/KdoRatzoDD0grlEzT9a+zOdgV+OkyO/eynD7zEOh2x7NyIg9UrwZED+YSQ9tytWuSIZ8rb303QY8VdhUHEntdRHZGzYwIbsWxWEoyWYLPIEtazlX77zDwYziXVIeCraBmVdV8Ue4khcfcgGKGKUG5I/xC4sYu23IMwNscQB2X+u79w1VL1aH5W1f8ZUX6zhBdzfOi8AZoRDLI0gr6Iuyd8QvQF/Tul3aX1vcQhcSEdKZ9XCw6sIjj/RmrQvUQPEi6lZPChekyiurk+g+znIbC4oAGNqjcnRRkagQCNzZSa74AQvao/TB6OK+5kgzZo/NWrO5TibowXqCzzFLhRqtjYeVC9Vz2tAmgIz7lhNixqyrhF3Z3bqgMcDwrqvPsgp2LcBSRux5hTXsmhjGXKSdkXJRi809h+M45srdQ==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006)(261021121427099003)(261102123227099003)(261022075727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WgCz2HYA1CQeqqfz0Eltx9Y/ETH2k/3RCxe8VnQsZ5kWd28ncwfrei2TuEKrqHpEqNHsdk39iN6r8HsN1JMJmNAf2f9gpkdUHbpkYDBuVzjcV3Zvq+mYBi7PW50ccj99PH1G3Wp8xZ2dhWXrZ0P64mxxa/pky5Mq+k0QM3XyGTafjz8DB7fVnp13FkdRqh3ZHH6LnwkPD7zHoyjXy+dTPAy3zXyuBQcBEVRAnvogypIYyyDnkSMy1cSeqHgWCXTfVBdjQBoxjEyp3gX5BaRus4ypF7TsTHUfIlC4AVfrHbJNOXmFPUo6Y+Ap9jXb37YQvfqSDauuYiBx4BVkG2cgUDbU9Yx0QCwbFASZz32VSnXCbgzNbpa9JMTlyJz+eb8w7MTqBKtA8kYF5gYp4uINcNEM1irwZMPf+IQdj2ndhb5M1JjdcfXwsCMkTT5OzJry
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 12:03:06.0681
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a72efd-5653-498a-8827-08df3b34c05f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: WA1PEPF000099D1.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6428
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_040311_966916_246AA14B 
X-CRM114-Status: UNSURE (   6.67  )
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

TAMP backup registers allow information sharing between different
software components/execution levels.
They are described individually as nvmem cells.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index fefbf6f4f153..a1392aa9cab6 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -1265,6 +1265,37 @@ rtc: rtc@46000000 {
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
 			compatible = "st,stm32mp257-z-pinctrl";
 			ranges = <0 0x46200000 0x400>;

-- 
2.43.0



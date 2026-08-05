Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B94C55184
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 00:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LZuAF7NfFUYfqRCWAZ0Nx7FYBP3yBSlo7WsesX2fCyQ=; b=da7l+F++V5HU4mOaJj00heYZSp
	sXumte2JGoVUzjZ4OjiXqR5HSgVixXgyzMZmEv+Vby88arJlgKweYDjhzJMlkvEQi75rlUh23ftYc
	Z2AKhm3KUxTe3yWNX/SdEhBlmeq3SJMPc4tCCKFaGt2LaDk5rxyx78cGvBpvgmhnm9JgBajKpSDQb
	/mPsIJxEaZ/py+k64/M+UJ70XRB8XHwyfsyvclGGZs3Hw3ptSEsSCCfDb0HFiaQEOsxgOFsELX6Nz
	9XIvV7T9WOFh5C8Zrzz0jfFSrVa70t8fLhjNu3aWPaqLPcO45JNs+Wz2wu6dbqHGZqkUDrEr+Q/Tn
	gVbvCkQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrPo6-000000030se-2WKq;
	Wed, 05 Aug 2026 00:48:30 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrPo4-000000030rz-19Cm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 00:48:29 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 674NFWcW3908775;
	Tue, 4 Aug 2026 19:48:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=LZuAF7NfFUYfq
	RCWAZ0Nx7FYBP3yBSlo7WsesX2fCyQ=; b=V148ZAkPmYQoy7ZdzUg9iuL0HUNlT
	Ddd3miqhfc3P4w9HpbcBlK3Syt5YZPM7j+Q39rh/+sRsyW9tU14vA/MC2nob4/MQ
	wceDgua9HKIBiTMCS2YSAEQfA7Wvj7Wi7wzRVAAv+kHWzCaCoddjKtpi4x8KYLrN
	NEbS1CnPsX2/jiOkhsB/b5Qp0fG1EckShYsyBTqTo6OBWK5N/bKP3nHVB26vgEqD
	VIaMuD0FKEg1+j1IaATWShZ+4ixIT/t2NRlb55AYc38VLMVeTq8eDvf/iS9UyKCp
	nCdKttsz/ZSoBFbM42ozFDmetiGNzILVynkIPte5xX5j7zkuFZWyaseHw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011070.outbound.protection.outlook.com [40.107.208.70])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fud49epnk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 19:48:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8wR+QBVRa+uR5xuf4GNsVmASzG9TLslvi97XRvLBV69q1BC9j5WhwZMQIcxyN4Ba3mvJGvndxKQzOskJ4iHwzLweyiTeOvhnjIBuqX4ksV8Ejn/hEVGtSGI6mYQz+xslTcqRp5W+cTU/BhMo2CX8ll1iagBt+ZJBwh9415FQ2YY9vFONYR3Qxy6LIza5h/IFQHSU3ffOrcIjkUI+7NR6NQsFzhArJZHr06xrwkaa0fJiUrkoGPS24daL+77ds6l/Ip/LNYRaEqX1nHHNP+jRuBRp6u2GLpWU643OaeWV969vCUtdw5JAoGqMBXz93EIyjAUU/ZMVjqn3kHNM+q58Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZuAF7NfFUYfqRCWAZ0Nx7FYBP3yBSlo7WsesX2fCyQ=;
 b=ple7+OHuaMhICkd8mob+iwMzzVEKti2vsRTcih8ghKO41wm5Z1AmSGaa7okDUGCs54hz1d7SVUY8ZTuD9OAiO+LGtRqFSbOqhIEoMxOlr02gVzkLWy6bmGsq0wfkZPY5BwCHOd81lNwZXszIckth86/TUGhaP/9S2CQWPlXJsHKnJ68RzPykGBfQuoT2YAhf98Lwq4HltszZlWqA2urfz0YGXdVRDHXwY4e4sHWZQ6Q2tSRJ1cnGeZ/p75L1dsX8GAX5QpF5CM5qDBPms5n0LW60AEQi5rcz4OjmIAddHMHkISSDIV06weRd2WWcDCQUj+gYqJTIjx3Ldu2ctU2IwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LZuAF7NfFUYfqRCWAZ0Nx7FYBP3yBSlo7WsesX2fCyQ=;
 b=ZAbVQDoTEYjzseJw+hvU+EcODWrF6Y0i8da6IiPXhSuLFjPwDux22HQtefiEoaXmsnDPYle6xR0gKBc/Tf+w70yavOadFauANeDACEZ2J0vtKbOiNC1NOenJkjQWOB4J5qDxIKcatVVzASn+E6fFPwlZZrjxtGpeEwQ3zYoYfDQ=
Received: from BY5PR03CA0026.namprd03.prod.outlook.com (2603:10b6:a03:1e0::36)
 by IA6PR10MB997656.namprd10.prod.outlook.com (2603:10b6:208:5df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Wed, 5 Aug
 2026 00:48:23 +0000
Received: from BY1PEPF0001AE1C.namprd04.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::c) by BY5PR03CA0026.outlook.office365.com
 (2603:10b6:a03:1e0::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Wed, 5
 Aug 2026 00:48:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF0001AE1C.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 5 Aug 2026 00:48:22 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 19:48:22 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 19:48:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 4 Aug 2026 19:48:22 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6750mLQ41184200;
	Tue, 4 Aug 2026 19:48:21 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah <m-shah@ti.com>
Subject: [PATCH v2 0/4] MMC pinmux configuration fixes
Date: Tue, 4 Aug 2026 19:48:17 -0500
Message-ID: <20260805004821.416613-1-jm@ti.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1C:EE_|IA6PR10MB997656:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cae9ac5-cbe4-4802-75e7-08def28b4086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|3023799007|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: wHMWZI388U4vh86z6JNJm/DNI2x4TTm1ZsOz1aoK7ybLMjTehWPBx7ZFS8QtQC9FcErCT2ZBzSmjSvWII8r8RHveMrZbnWU1uPRG4ekFYze8mg3jUV6F7G6JPE6mrW7WnRbKwrDubsPi1jJJfm7rm/sXbghiFUfwWNnk3wlqBTmw+/Svx/4qERhLuNaxxGlwbFEoMAUXTIW1QeG/rfZUZSNmqyo9sz2cU3tPhg2hdmdJeSEcp0byTfkHvdVc6I2zodk58Rm3XL+JsV3L+3bbr0VxlJlylbC99l+TbclPvJyiCtPKytpIzA9cVuCUAw29UtAJ5fVxWZJRYHEGi0Eo18RyjVboYu0KQc8NeGf2BEwUSb8rbRZl68B7A8A0a56ket68rsyF4LMxqYYEnf+LPhDlzMslRKD3bWEeoS4piE3UKJHIMUl7YBfKM0nK42H/HG760PLfS0hX3dLdDzoh/35ZHbjxfDg1Uzh4tfhRXe8W6c5G3ah9laSADiErBZbezjuGAyQkLR/gtGxjxFgqF/jKMettUtVo0XiNr1mi4eZPtNsHTXEvhRReWS7Zu6GOHfretQAmfgNUHV7Ewh4dQL5oaLLBPyNHMLgxpQ3KK6R/Q7qKiohiaUyE0DLiNwuHaL4fhrDf+HWxeRyKpk+icrCS9sMIPlLfgiZ0YY+EAKsyizb6k1XDmbrceTsdlTVgdio42SQRz060xxwmfF5WCw==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(3023799007)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MV1kUmFqtBDoZOjZy/JhQLVesC9aMYn5jT9Hew3lAmm0v48LG1aODMrHJU2rC7ZIxcr3NVHmMiK3xfjWOwWQYuec9Q7y06US+57mDbZjEVMgm0ZmlbzkL4kvSl45qTqtTROdlU37N24ecg8seMSxn4QHF4l/uohUDL5cPqDZFjFVn2tS+JcggnbezhD7zsVxij+5CTnBKn21tiGNTz6iZCHDlA/HFrC0ajp4hCKlgVnmkEj7na2zgngN2Ep6/J30/sGJEQEaWrB3Tel+HU5EpMLUazKWqLP++8I7cbSy44EIZQO/hZzhUrRz3QoZbYsL4tAwGXuFpiDxt8ZnR/J3bjfM3mxI2mB5A9hLGsxGsq2LK8ppZMqwVv5g+4J6STaklp6+brOGSOPOtysEUjcQVM/79da5m7u1NPoRCG8hC9ix7Me2h7jQvgdsVPRBn0s0
X-Exchange-RoutingPolicyChecked: LLxYiKnlEkNNBTXaEKbb3YjpFGRi0TVGkUCT3mYiBT9hYJ/Ab/GgE1rrfLvT4kvZzKS1gbF8YorLShzaPWNcIUGv//cZXM0FGwQRHo4Z8zpn9iPijFMbyZKQyRFonCRWxRclYPEiEBghqcE8yQKDzOnoYXhswPBYYEI8ZzEYwsof7tR1LoCsCvdrMzws/LKOfqcwxYi5mrlbIDxjXENif8KisTKYM4DngnaCin2dwEQ44FJTcdjqoHiC5IyD+LVElpX7wEeemF54MtW6zJiW4RC4NtujRMFbGmMcXbv0iHRwDRdCLkDxJwnGWPf3DkLT9dqyDrbzxyiSZBcUgSljhA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 00:48:22.8775
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cae9ac5-cbe4-4802-75e7-08def28b4086
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA6PR10MB997656
X-Proofpoint-GUID: VfDbWF5sne7e4iYuISInW2sAa3ULpoEn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDAwMyBTYWx0ZWRfXyyS16WKFtsBv
 yYG+LHV7MgujrOo16iLRGRrlureBvyr7YHF/8tFVwmb01gKNVp1JGK8VtWiO+tgBYYm9Drk31tj
 c18TZ8GlneHObwrzy03zYxwgLT9QHE4Rd8450o7pE9z0Us0xSqZUFXdvyYBjie3PHhJ0unY3RYk
 2hUFKAxufxeAWp+CqZnXi7MACWyloLWVvjWKMnBm3N+ShLT464d9aONolUDt8dK57PQDIb9/rc8
 5aL1o1gNTYaT5d/mPi4l/KTsv3oDxVmEU8uUagK5JrMVRqUtE/4f5+m9K5KUiFK+RaloHuNatlh
 uLb1affOnJIuGDEe42orH9ldjONcC+lZANRd0nIM9VWCEezDk46UBQIqy22htW5ahUEpmn7Xj9o
 ABfeUBAP5xZPL8AxV3za3s/2cr74aKECmsaNV0Lh658QtRbNBKsEqCimerN76l1JDwhST3oMIHq
 1FInSR2bes4OU9hDgAQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDAwMyBTYWx0ZWRfX+BQzmK0wnXMW
 1Z1AlTmlwQf5aiIGYYg52Tx1BVA2oBpi6xR1Kc4MmlKv/djtwIkSMngvjoyjx38t4+mvC27UDbN
 9KpV9x+ZISnLjH9q6+Be/XZax+ETUj8=
X-Authority-Analysis: v=2.4 cv=XKMAjwhE c=1 sm=1 tr=0 ts=6a72885a cx=c_pps
 a=0qEcZjvAL+vPLqsQtgLcWw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=9vJC3nd4T1n2FKywEMMA:9
X-Proofpoint-ORIG-GUID: VfDbWF5sne7e4iYuISInW2sAa3ULpoEn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_06,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_174828_322393_B1337208 
X-CRM114-Status: UNSURE (   9.25  )
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

This series fixes MMC pin input/output and pullup/pulldown settings
across AM62x, AM62AX, and AM62LX boards.

All patches have been tested in a downstream vendor kernel.

Changes since v1:
- drop patches 4-8 since they will be send out in a separate series

Judith Mendez (4):
  arm64: dts: ti: k3-am64: Enable IO expander interrupt
  arm64: dts: ti: k3-am62a: Fix MMC0_CLK register address
  arm64: dts: ti: k3-am62a: Set MMC clock pins as OUTPUT
  arm64: dts: ti: k3-am62: Set MMC clock pins as OUTPUT

 arch/arm64/boot/dts/ti/k3-am62-lp-sk.dts         |  2 +-
 arch/arm64/boot/dts/ti/k3-am62-pocketbeagle2.dts |  2 +-
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts   |  6 +++---
 arch/arm64/boot/dts/ti/k3-am625-sk-common.dtsi   |  2 +-
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts          |  5 ++---
 arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi   |  2 +-
 arch/arm64/boot/dts/ti/k3-am642-evm.dts          | 15 ++++++++++++++-
 arch/arm64/boot/dts/ti/k3-am642-sk.dts           | 15 ++++++++++++++-
 8 files changed, 37 insertions(+), 12 deletions(-)

-- 
2.54.0



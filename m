Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB01AC88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 21:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HrA0ONbvfDNCNMG5ufnAySCMOSWA6pE5AR9/ps5Y1gQ=; b=wiIirEdijmlWEdHVRoI6Fgwt/n
	IjuT5MDC5cg7Vef/2N9IuE5bMtrdjs2I1DYMg7JZr0M8qVxyoK0eJr7SZMyfbGQ5NwX0IyaEQvl30
	Dc0kxqfvpWra2HlHY99aAbWpZlFv0TPUJSi+9Q4ew58pDSF8+3Hv4W6PbbkRMIVr3Ix/9XeFucv/I
	s2ZXCYirecLgb/G3Ord9MgW7nOg8topAHjJuLxcRegwozZselJ+nb3puNeP1maZJeNF0F3O+fEaeb
	9p5CYkeagV9Jgrw7D76D/SyMBLQg1nvlBqfdK5agD6pQjXNh1Ahs/gINHXwYOUHqyGUVHBXkgW1u2
	Cthnddxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5VP0-00000001EJs-1EDL;
	Sat, 12 Sep 2026 21:36:50 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5VOv-00000001EIy-2Oi9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 21:36:49 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68CI1RMA2894831;
	Sat, 12 Sep 2026 16:36:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=HrA0ONbvfDNCN
	MG5ufnAySCMOSWA6pE5AR9/ps5Y1gQ=; b=WzZuZZA+TV1MOA1mEaWZm8GhrGLt2
	w3GrTgdiDDo6NTKKEzjscyvfAt2Q2mZ+j5Rr7ybhfqeiD4LkqsSkHhTxCKTrENgo
	nAIUZihasJJiL31GXeDm1DLiC/4nGW1qbZkHusxcgg047Y0WWNea/kpyL7e+4p3X
	Vnnxnhli09EsJuAevvtCwely10wL84YkZCd3qlh3wS3ueINmUcWMZfVtWuhgeyVo
	5bB3snlReErIxAmwr2ubIjh+hrpfpEq/eEawGQG69PprGx35XQ+vOO2fMWQJN05H
	H/hW1TrqYrzNWZiqGXarWC9QZ08nOdJWq1ZkMluIzQ2fgYmiKx4gKfcyA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010003.outbound.protection.outlook.com [52.101.46.3])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gmy5d36sp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 12 Sep 2026 16:36:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jv0Ftiptdy7zvJIvGcV0TAMsuBOhCrVGy48n8vqA+d2adOBd7xGdXwldHZkM0LkjJIaYHrS7xcc7ZO0L5wkcFj/VFKAFUQHBy93C4X/GmwYMzaS6TwvLchUUJJ6XOqDsqz4O/Jt7FDYlKAGGp2wwqKTuulTxuUTF4NVEAZNvI8hTdACoaa1kzKI2gKjO7jFHT/nXfT+LChccNrdtJ4pL24J/vN3ALxvQAesHz6nYru4IfXm0e9h1dyFgIXLFXScKKPUyBCdVqk5a7fR8BlFyejxyWnZLGVA+ai+3bXL4x3UDhT7liPKT0GBZi35DOHbOqlxGnaZ1Qp2Qezs286tM2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HrA0ONbvfDNCNMG5ufnAySCMOSWA6pE5AR9/ps5Y1gQ=;
 b=j4rDQO5dgKsF9m9o05JG7gNa3N/AWfX0nZSDd4m82bfc0865MvIHT67UVyffuHOIA9bHkoxfON4q3a8TathCqolqzsa2wDJtIb6zIH81+jzgetMOB6YEnvJaqvm2532guI2M8uYqCIRKbRMBVi5vojPwFA1n2gAXuCi/2IC96nkUF6Bg2ewftLKtPtxoArXgTcE6tVbKEQ6rbzH5rtg+iHNarmV39HyR7iig2ZQI+ovDs1r3NxEnOY8QNn1ho9MfZAVbUoeXJst4PCwgFNXjLYwBc6XumMXJrAGtreu4qbDSwOdt4GKX9C8iKilnbedmNjSJW/V97OOktrrF49vjgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrA0ONbvfDNCNMG5ufnAySCMOSWA6pE5AR9/ps5Y1gQ=;
 b=th1388Y8pHL2CFaP3SL1X4Pnv3/J8e5RqCyEUMeFYqS9HH1BHnUVnudAAqwVGebL9OaQkZv8fGAwB3Q5NqTVhiH3v9v8WguXyFQLngu9b3cpX/C9O9L1cc/WJ/E+VEOaQuflXy3lKd7HJGyDa87IK6bWCJRpMOFFx3LiafaWg8c=
Received: from SJ0PR03CA0163.namprd03.prod.outlook.com (2603:10b6:a03:338::18)
 by IA0PR10MB7624.namprd10.prod.outlook.com (2603:10b6:208:491::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Sat, 12 Sep
 2026 21:36:40 +0000
Received: from CO1PEPF000075F2.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::21) by SJ0PR03CA0163.outlook.office365.com
 (2603:10b6:a03:338::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.11 via Frontend Transport; Sat,
 12 Sep 2026 21:36:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000075F2.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Sat, 12 Sep 2026 21:36:40 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 12 Sep
 2026 16:36:39 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 12 Sep
 2026 16:36:39 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sat, 12 Sep 2026 16:36:39 -0500
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.196])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68CLadrh3514956;
	Sat, 12 Sep 2026 16:36:39 -0500
From: Kendall Willis <k-willis@ti.com>
Date: Sat, 12 Sep 2026 16:36:39 -0500
Subject: [PATCH] arm64: dts: ti: k3-am62l3-evm: add wakeup-source for GPIO
 button
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260912-upstream-gpio-wakeup-dts-v1-1-2057d76c63aa@ti.com>
X-B4-Tracking: v=1; b=H4sIAObFpWoC/x3MTQqAIBBA4avErBswg8iuEi0kRxuiEqc/iO6et
 PwW7z0glJgEuuKBRCcLb2tGVRYwTnYNhOyyQSvdKFNpPKLsieyCIfKGl53piOh2QeNU61VbG20
 N5Dwm8nz/63543w8yYUPtagAAAA==
X-Change-ID: 20260912-upstream-gpio-wakeup-dts-9d08f08392a9
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Kendall Willis <k-willis@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789248999; l=1858;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=9y9ycNHHDorRnR+MhdZk31/HM1FUqCIggQb0IvAdjdk=;
 b=bA7YoLIhZ1P1L5D58N8cu0h86qmeXxyPktzc8yiVUc1bAUHLQ+H7MMMxvYhmKTincFixOsYvQ
 ketYAIlfVWLBT/ra2UUEYJ6qYj0chuVsZq+uWF64f7xirE3wiHfwV2M
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F2:EE_|IA0PR10MB7624:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fb03d44-3a4f-4467-f36d-08df1115ee67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|56012099006|10067099003|3023799007|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: RBbZcU/mC4SrLGsdaCSj+CIGICOtI/4PRylS5EoyJlHSD5SX3QZmmijt9xeCb9Bh+XG/7krxZN+JhlPnuqLw0F+tzhqWmheI2WI+KD1Q/ZQon8M6j6nAFZhmjZaJ6TF68zKHqpjnLYGO9ihqHz0D4xdJG2EK5rm/9hpQsKI5ZF3hWzoc3g6ZA/+yyhGruaMCIjJ0p/R/X9wq0fjDoFADiQZDz8lRsvtcXQJ9RTVbh8oR6w1fegNSMXxnxub6PpmrMfaAcy+DO3yG3zSDCzmEl1CikHinsuF+prmBWqvurbdm8TJ0ZxmGOAPfcqdZjeXffHc5Gj8C0c7kDrVGhxRyaHA5kOTcSPIDoT7nLkRhYP4IibNqQuwIWnXZEbgFlJAy+K6ON7oJq4E6ZjmnjM+E2uT+5hNXRXcVe2YUrzkn9EEfnAvC1LpKwVChN8Glx3l3L4OGrNxOcc2ExPB+XTN91v2PM9r+UO1XuV6wlh2DuXxiZuPctsd8eLbcg8+JLxQvmDNTMCmhBJeETsu30Ix3T/zKpAJzfDB5OcpzD5xck0Q2fklNciEtm05TBSuYFhisVqL5sapDQ13JwQNzi2deixUEprTYWsGEBCd21t0sGBpeUORkMKQFYuZwb7/eOZoXctgpozcuKubQTABrp/eskfaKLgssSWYV32r4RelSie/rD/vODu/ALS9S7U1SxHPnDyms73EMeElILLyAapTiWA==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(56012099006)(10067099003)(3023799007)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Cs83pQXLG01BCzg58dR1gJYM7ncQ/xVPfeQYFqFdvyTMqomM++QThKnMtCoWlx8FpofUWliyraETVz1y0HlhPLgTCjRAYtCREr7PWemQYqn9MUP3FY/xP+rZt+wIUgS/Qm3jgwkKoleniPBWUvteIpSD7LQqaRTA+P6b4J+HgkvpAclzVbbSmoP9pCHHtEPvbgdjIRF4vBnT64R3JHrAGK1vyg7Bu4GqTbboEMBj+b+i7PWg7aKCDgeHl3mKr9ogceiCxgfN1c4Y1GlDcDyTgzkmp2CSKQDQsGqTngY4Jk02J3lmjY614wduguIytj8SrRvKKViJkflbWKBJclCRg2MBwBN5G/dkQOKmMeud6eut9K+izuNZDfo9vxyynJsbH1nm3gsvISVLqSJ2OuuOppS4W4fLtIXtRlg/ISSlhsu/Adnnfby//bzyj26peYN+
X-Exchange-RoutingPolicyChecked: IdxIIRfnPwilp30kaBWVRwIUEBe3D6HRUdUqM5aaU5scMXD4ebXxS4ZFVMgAILkrrXNspwsEP6QRKo75EeFYPatxIe2OnlL3aRQHFONkhv+C0zkfx8AzfPnl2DNSMjxKx8PmcJMt7PrOblcJEysKROgokVIW2Abfeq9+6sfrtOzYsJBvIMrroFAJZwwUxXwOjOpy1BUkR8PG6AyrTph5PlZbhz9Q8oa5y06N0L05GTxbG6HQnC9+hoikYWKWRbfcnnPpeyZkV2A+B1Dym8udMuySeiu1I6UL82P9ROx16dHtJyAkXnT6aTB3CcqdrSbaldbe0pSz+UjjHGFt10jkjw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 21:36:40.0399
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb03d44-3a4f-4467-f36d-08df1115ee67
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7624
X-Proofpoint-GUID: rfePX9zIGJntRDXORpfcP94fwRaSx2aq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMxNiBTYWx0ZWRfX4gOoGK17pnSX
 tDEbhZQDqPN7lSkXYuEpBOZdUrSBv3u+P5SNW1CZJYx9bH0XMUxTvhaweDQCrlwDxiLlLVPQ2R9
 4lPI/ADaFMNbZk/21utxwuW+I53G/8jt0jo77P6bL+sIWUuBdhbgNW4i61o8AalYQO58c/5BaKX
 T/bFCZ2HqkdWE+ZB3eBQQZ/2Ac7TJpNGpgf/w8bdxUpMKZyAVaWoN13xDR2hawKXQAPVLkjUL78
 83wFb89XlSF0hOxibcF1xiOIvMlKyzKIsfeLOPd0U9pQ67UIG0IXFsLVSPVJn/jlJptaZTpmdfV
 iFmRo0DTAY2jT/iHKZYNPXL5ApQHeCxAcmuoRkfxG4DuR6jBfFJEkyC1xzYfKTttD9P5gzZkAt+
 X1WAP95xa1dyjMdP65km1lLG0hZix7JQ+L6Vz0sPc3B0Whl0PHW7ExAiH1hsTiMbswKmiwcIHW3
 0L1wfB91ah/P5yfNTZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMxNiBTYWx0ZWRfX1RNb2fI+BdBM
 ZsYAK7e5JWqG7hNM6OkXV+nyOQIc4ogi2TJnSw3J5m4FFe7hNuoqOkKvcVUv8Il+UvblUknVOIM
 B3Tl8ax0apLUDri8VWyENRwN8hnARYU=
X-Authority-Analysis: v=2.4 cv=F6vC5ahN c=1 sm=1 tr=0 ts=6aa5c5ec cx=c_pps
 a=AKd2An130fSphkJyqL6rzg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=lmMwK82i1iHtw44xJ9MA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: rfePX9zIGJntRDXORpfcP94fwRaSx2aq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120316
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_143645_619034_B15762A3 
X-CRM114-Status: GOOD (  12.71  )
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

Add wakeup pinctrl state with PIN_WKUP_EN and mark the user button
as a wakeup-source to allow the GPIO key to wake the system from suspend.

Signed-off-by: Kendall Willis <k-willis@ti.com>
---
Depends on series "Input: gpio-keys - support wakeup pinctrl state" [1].
This patch cannot be merged until series [1] has been.

[1] https://lore.kernel.org/all/20260912-upstream-gpio-wakeup-v1-0-f0e12484b836@ti.com/
---
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
index 84a0cfaaf196ad1af2f1d0074c90fdb1b1ca0bcf..6635b5e5cc85790cbaea092eb669d50fb0d4e5d9 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
@@ -34,13 +34,15 @@ memory@80000000 {
 	gpio_keys: gpio-keys {
 		compatible = "gpio-keys";
 		autorepeat;
-		pinctrl-names = "default";
+		pinctrl-names = "default", "wakeup";
 		pinctrl-0 = <&usr_button_pins_default>;
+		pinctrl-1 = <&usr_button_pins_wakeup>;
 
 		usr: button-usr {
 			label = "User Key";
 			linux,code = <BTN_0>;
 			gpios = <&gpio0 90 GPIO_ACTIVE_LOW>;
+			wakeup-source;
 		};
 	};
 
@@ -307,6 +309,12 @@ AM62LX_IOPAD(0x01ac, PIN_INPUT, 7) /* (E12) SPI0_D0.GPIO0_90 */
 		>;
 	};
 
+	usr_button_pins_wakeup: usr-button-wakeup-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x01ac, PIN_INPUT | PIN_WKUP_EN, 7) /* (E12) SPI0_D0.GPIO0_90 */
+		>;
+	};
+
 	usr_led_pins_default: usr-led-default-pins {
 		pinctrl-single,pins = <
 			AM62LX_IOPAD(0x0238, PIN_OUTPUT, 7) /* (D24) MMC1_SDWP.GPIO0_123 */

---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260912-upstream-gpio-wakeup-dts-9d08f08392a9

Best regards,
-- 
Kendall Willis <k-willis@ti.com>



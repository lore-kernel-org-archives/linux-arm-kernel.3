Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF560C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YzgO1j/8MivQSwvQVC7dVf4CVT9xJLefrM0rMdcZ+SI=; b=MeRERRLN4jxAD4XTIFPe39QZb9
	HJ0NGy0PHM7h9ChYrIZreqMv88OOkUMOfnWITUnNo79ztN767VXx/uGoE0cZmgo9QHcuv1Abm04Z+
	Ldr5yiGlzGVGsA63WCwPNTm0JxnknswfVIUEZvkKzZTeUWXxGbdwxd/lvPhh6feitO0BIYQZfZ6iy
	GCcVP7kkJxcGBfBIomrGKBnftCyCPtbGodAMQhLbtDKEMVWIMU0ZRvySKNQgnootofOip4z8974EB
	qHkiPAB9t705+PxH5lOklwKuYVf31kFaZ3WnLuN0wALJxJEKHPzLqd6Qg3YDzvjMiGZep1MVELeTF
	XlLHV/dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQoI-000000008W0-3llK;
	Thu, 13 Aug 2026 08:29:10 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQoF-000000008Ve-2lFQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 08:29:10 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D5hp8Z2318664;
	Thu, 13 Aug 2026 03:29:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=YzgO1j/8MivQS
	wvQVC7dVf4CVT9xJLefrM0rMdcZ+SI=; b=XFSxUsLFVX2ycG3HGDDbLqCm91Pyg
	enhpIn3CenDOLy1Emb9CzjY4l9xd0BIbjYGwwesU4HO8z5aidaUKj+Z9nUwmLpDl
	wCWuT42cUZQWxJEdBDHu3CSu9pJUbthlej+Qfs5U5kD+SEGCgj65Sc0hnK1Lo4P+
	M3nimX8CcXWGeFW3NK9HfUGfviEjA0kxSOwSOok/CXm+WXdhVA6F1KHfj2KjUsgz
	I8ayxShQ3MVGSwkP9h6/SXTG6DYih6+RIIxeXCoq8RQQK9V48rmozkqpxVnWR/WY
	YlR3lwdM/QlPrqezdXXY436g2WCJljxw8N4LPZ4S003NIhZ1Nsu73jAcg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010053.outbound.protection.outlook.com [52.101.56.53])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g0mun7s4m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 13 Aug 2026 03:29:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FWXHICNAc3tyT3Wd8nYp6KkLEMzm2k7zU8eZtH0dST0VQM2ni62tXZzYRk+wtTPODCA3mHz36mEtJ2lQO8WP6ie+F4NwWuSO56GTt2hOwbq9bOsXp9a8ZYR/tgPngM/4hMg9pDMzxzEFX/GDVgLiFIII5PBbSucOMuPEwY2I0wmMy5fu0TKszaneeFWI9RYH5Mtvxd8v0JvYmKnxys8yf8BWH8QGUmARu0bkod4l5NR6pBQmxs+ZgobOPizqxdZSFLsDJyMgj1uPy+zPHqtiWGx8fY/wMwyDzaxcPngb5AVr9PofjN30r1RyLEiSuT8/MLxvsQE8beiD2nFT5RX5iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YzgO1j/8MivQSwvQVC7dVf4CVT9xJLefrM0rMdcZ+SI=;
 b=nz6eSiu+0JOlFZCIFTZ1JaKtHk98F0umpCVoFHUUIg9tJDcNv51HFDs6Es2LwP+NO74c8UI6OE6c5kM/ih0KE23kJPif8/DHwCdqOqxbEdu1SRtNbFXb1bkdKwEUYhXFgEwlTj3yyz8aqDhKjnhIWQLRdZJrusiVmTtTClM4mmxsOTS/jV617W/NObG3PLjjzsjz1DOLnZJiZ6IkkJ92EVjapD0xE3xQVVmr12QZRaD0zdvR78bggzam8n5ZAw/5VMe19yRS8b4NPESBvmi8JEJ94/tSagN6vLrHHKCGkB8vJV+H7rZ4Hj/5DyR/KZkpBg1PT2dWzW2fFk0WtncOXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzgO1j/8MivQSwvQVC7dVf4CVT9xJLefrM0rMdcZ+SI=;
 b=QDmYXJ3Zv73e+O9ukGZtikt+oqRpk4OZsLTiGnfyI/hYFI/6uCT+UUoW6kFrN5sbe+8rOUXkKIoWtRZcF1E+WQQ/5+kYXAqXcb7DO/SkHaohRDt2kimGU5eNMJL1ub2gO5pBSuSZcWG8cmjOSZ+TLC6IK8XATZvKkPT4DTGH1gk=
Received: from DS7PR06CA0004.namprd06.prod.outlook.com (2603:10b6:8:2a::19) by
 SN7PR10MB6285.namprd10.prod.outlook.com (2603:10b6:806:26f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Thu, 13 Aug
 2026 08:29:01 +0000
Received: from DM2PEPF00003FC5.namprd04.prod.outlook.com
 (2603:10b6:8:2a:cafe::95) by DS7PR06CA0004.outlook.office365.com
 (2603:10b6:8:2a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.14 via Frontend Transport; Thu,
 13 Aug 2026 08:29:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DM2PEPF00003FC5.mail.protection.outlook.com (10.167.23.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 13 Aug 2026 08:28:59 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 03:28:59 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 13 Aug
 2026 03:28:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 13 Aug 2026 03:28:59 -0500
Received: from localhost (ada0543016.dhcp.ti.com [10.24.50.146])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67D8Sw6Q511648;
	Thu, 13 Aug 2026 03:28:58 -0500
From: Anshul Dalal <anshuld@ti.com>
Date: Thu, 13 Aug 2026 13:58:53 +0530
Subject: [PATCH] arm64: dts: ti: k3-am625-beagleplay: Add boot phase tags
 for pmic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260813-beagleplay_pmic_boot_phase_fix-v1-1-4518e7cba940@ti.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNUQ6CMBCE4auQfbZJAUHjVQxp2jLAGqRNF42Gc
 HerPn7z8M9GgsQQuhQbJTxZOCwZ5aEgP9llhOI+mypdtfpc1srBjjPibN8m3tkbF8Jq4mQFZuC
 X8vroTkPT9GhrypGYkOffwbX7Wx7uBr9+q7TvH+nBibmCAAAA
X-Change-ID: 20260813-beagleplay_pmic_boot_phase_fix-c04b7f55de63
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Anshul Dalal <anshuld@ti.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786609737; l=2232;
 i=anshuld@ti.com; s=20251022; h=from:subject:message-id;
 bh=8sRCI84KKDP57I7dC42N+qUPP1rN35pGOkItcI8owDI=;
 b=NXV+xa1cNEGTzSLreqpLKICiIq5mx43EXwQY3YS5xwBOHytorB0r/Ob+9picqxbEb+1bUo0ek
 oFBD+hUZy6LDRYXgjF0QN9iWkUcuZIhRF++fCnuy7dhfjrjUs4M25zl
X-Developer-Key: i=anshuld@ti.com; a=ed25519;
 pk=Kv8FlQElcrR6efyEHmjtE83y8e0HKvqPyvVY+PJ4UFw=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC5:EE_|SN7PR10MB6285:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c1ebe6c-73f4-44ce-3c7f-08def914ecc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|23010399003|1800799024|36860700016|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: cNix+S/B65RGSpBQX0iUslon4vROJ1I+Tx0PCA4lWGGKuUhoXdb3Ib8fudCFw/KT/fLs5aYKB0l4+BJnK4FV/zypPG9gEvXWvzjEVD1aHIr85jarJZrDHUlVjAiuDd/m5ssANhHPdsK87yFYruIXkGVsRcgiMjRVHrp0TXMXNXYUdZ2UWRbVOmXXdglQCp6nJI+oTHNO08JHmqMrB2hBb6BO/SAa5gu5FrM49MHdK0xD+PZ8c1cSNHtE2MTOD+enZgXNPMcaHLPHyjCC1PtT4EM8STnF/KW3WE8FAx2tm7KrVShDenUg0wpzLzllAXflH4YEmOaMJU8rHyCF/NDNQrvR0wUsvCQdkMcl46TfnzG1bkV7kD22U6wNMpndSFZWM8g6hlgXS/cfP9Aj/Kc723hcHx9QbyR5vjDLbq5KUj+TeYiZkFSJiva1jME0JO8ivnwlEoi8cC5+FNPwFzocWbPT1KBNId0OeonO0BraOKDFuOgWARaXNXtI0hJEnLL6+Ltxq+Hna0z7w+gCLYbfG88r3XifEI5AOj6ioVjGlgjggqjfHgLTXiUWEnmYe8QASKme3KCmvIrZVW9bNHNY74Ns9rlITfvqCffF9wAoO/le9/lOI7dJbIPu6XcBEXCRhdO6KRhMXH/nAvj8J5D0A2dNEhLGBJykS5Vwscf4fRAccsSyn4I+tDNiMgyuAGI1wMzQLhOUmfDf08WvSwsWRA==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5mHCuqxHGFoFSOCmX3nreKe00ZfKjBpLmiF4qddJzMx3PlHkHGqNBoWmBEJJLV7PyOkDImD9Nv3TGQS8OA7uH4oPJk6c8zxyxJ1Sqt/2JQ6bp+k+Rdr1lvqeTRLH3gHa0QXrRHxw/shBok4Cp5gttxCJLpseNcT87PJgXsG3lAcZwypToKykaMqHp3Sl/UB2/ZL4C347DKrYruIRH6+bfmOlyRym2vcLDC7WwvYplgA+YnQTWTE9wFMFpyNPiiXcnVUHIGJHBOE3BA81bQBr5MoIeF//DllrUUHEEJG3wVA5Ci7nDanRt4a4/KdTM5HiUuB7zIXQ6jy5wZU9N5cjZaxiRShQCMkmu2Hmn+r5pwHMX1qOv5kWKGEv0t/39MB354FG6m33DWzf62w4wnPJrMsMPnN3STJWmwjjdzyHYU3vF/HT5XXodUcRQ2/IFeEr
X-Exchange-RoutingPolicyChecked: YQzKuui97AQlRcuxQv57WYFkUFsz6sY1n5uO7XzQ0UWoDp4H9k2jRrzZ3Vy8cvwrXy/nrcsgIgsrUZD2TDQcBfd/eePt0hh2/1kc3fI5Sa0LXHeUOGNq7S4+5+hIflnhMLSA5N5moSvtXBLKURIloSL/MnCk6VomMyufW2YHZhVE+XkmyaMTS5/1If+GBRDKt0DvkP6/3Le6qDFzcG/ASQeRF6P96+FjPD8XYXVh/2WOm6/iSBB+8FfLG95tQkIvFhwJhxN38Xs/jADIJguMsjFSwkjg39lgWoK2yUduW1H9ujeYQzmvWOg7oHmAG9qNx7vEUlRHVVxkK/QzbpfN1g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 08:28:59.9068
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c1ebe6c-73f4-44ce-3c7f-08def914ecc2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DM2PEPF00003FC5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6285
X-Authority-Analysis: v=2.4 cv=JPQLdcKb c=1 sm=1 tr=0 ts=6a7d804f cx=c_pps
 a=PQms4psfS+nBHIg3Mxsk7g==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=VkHODOqLX_bdU0skrrkA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA1OCBTYWx0ZWRfXxkANlndGcTq7
 I0qNv7zQcWikGTWYaywPv9MTnRBvIAhE5gqz6mrt91XAfqc2l2Gsmta8gleigDQ8/UA9HdaN1TS
 1mjvJ58iFHvos83z0h9ef+hd9biQAOE=
X-Proofpoint-GUID: Y_LIPW3DWkOy6OZa4meNkeOX3PpeJoIu
X-Proofpoint-ORIG-GUID: Y_LIPW3DWkOy6OZa4meNkeOX3PpeJoIu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA1OCBTYWx0ZWRfX6k4UExIibY8O
 4FGkKwbhBvAv5vA9qPqFl1nvjpEQkM9OzjY+8tNoNNE7Yo2l+RZqhc9Ri5Hv1FIJv28wpHDo+Lx
 qJdXRe9yR4KQrAZALXn07DE0UhUCX52RiYwX8wrQCZXI31geXGS5ysgVDra6dlZP6RFCDf8S6+4
 Ye7iwb8wDiue020tqBYqJ0F/8Z2ctEgEsnj8JdLMq6QXL9IynI8kLjR9i5InQtcTlP1Upi827V4
 LKPGbxoJzc6ml6HdOsiwHasN/OP7OdncsikKv27cumay5NZqM0jNGqjoby1ViEHZ4O+CVQbpa3W
 IV3ylux8zVJfo+9U3IP6F3MMryqo5YhgDesB7uOUNRsw02upjOMF7YtnAaXZ88j6r+X2/W4/iY/
 05F8skc7qyC1PAbI/9vSTmvFmF/tsI+ZfgqFYDg9oDBiYGFqR8hMJH+4e8vC+cd3qL7zL77y6jA
 mw+xfT6vP2UHLNR9QVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1011 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_012907_995035_41EABF0C 
X-CRM114-Status: GOOD (  11.08  )
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

The PMIC regulators for beagleplay are required for booting, therefore
this patch moves the corresponding 'bootph-all' tag from the parent
tps65219 node to all the regulator sub-nodes.

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
index c468b9c5fc09a..5f7265c426bbe 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
@@ -681,7 +681,6 @@ rtc: rtc@68 {
 	};
 
 	tps65219: pmic@30 {
-		bootph-all;
 		compatible = "ti,tps65219";
 		reg = <0x30>;
 		buck1-supply = <&vsys_5v0>;
@@ -709,6 +708,7 @@ buck1_reg: buck1 {
 				regulator-max-microvolt = <850000>;
 				regulator-boot-on;
 				regulator-always-on;
+				bootph-all;
 			};
 
 			buck2_reg: buck2 {
@@ -717,6 +717,7 @@ buck2_reg: buck2 {
 				regulator-max-microvolt = <1800000>;
 				regulator-boot-on;
 				regulator-always-on;
+				bootph-all;
 			};
 
 			buck3_reg: buck3 {
@@ -725,6 +726,7 @@ buck3_reg: buck3 {
 				regulator-max-microvolt = <1200000>;
 				regulator-boot-on;
 				regulator-always-on;
+				bootph-all;
 			};
 
 			ldo1_reg: ldo1 {
@@ -739,6 +741,7 @@ ldo1_reg: ldo1 {
 				regulator-allow-bypass;
 				regulator-boot-on;
 				regulator-always-on;
+				bootph-all;
 			};
 
 			ldo2_reg: ldo2 {
@@ -747,6 +750,7 @@ ldo2_reg: ldo2 {
 				regulator-max-microvolt = <850000>;
 				regulator-boot-on;
 				regulator-always-on;
+				bootph-all;
 			};
 
 			ldo3_reg: ldo3 {
@@ -755,6 +759,7 @@ ldo3_reg: ldo3 {
 				regulator-max-microvolt = <1800000>;
 				regulator-boot-on;
 				regulator-always-on;
+				bootph-all;
 			};
 
 			ldo4_reg: ldo4 {
@@ -763,6 +768,7 @@ ldo4_reg: ldo4 {
 				regulator-max-microvolt = <2500000>;
 				regulator-boot-on;
 				regulator-always-on;
+				bootph-all;
 			};
 		};
 	};

---
base-commit: 848acc8ffe1b7cd5f1bf427b93069becfebc2c9d
change-id: 20260813-beagleplay_pmic_boot_phase_fix-c04b7f55de63

Best regards,
--  
Anshul Dalal <anshuld@ti.com>



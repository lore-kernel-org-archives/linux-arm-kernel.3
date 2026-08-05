Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C78C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 22:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTCAmkPvluUAKEwhfGpKbyxuRV6cyzQoV39IjtDI8tg=; b=LEK5Z6cusDQ1Ibt9jasEp817jG
	ZByVF9fzVWxdV0IT2BkV++W/SrfjVuH+sKa4fOcWDQfK8jR51H6SsgJaBVtqlpHD9H5kf9BOMk0V/
	bgg9L4EtGsx1XvP+RK5/rsi+r4KaEMxtdWRJbem3LOIMRKWkYrNhN07ktnB9eGZI7uRUuZl1OTZrC
	J/8XmndyG2Cr13ByBUFu81poTErgT2psMZf6VA5/BjUTrlTAxySU/HYJm4Hz3sl7kc7sgi9m/LLwl
	Azg9g1w9kPCdRnKp0TNnIS36FLqVmFiaEjwCq3qJyp/anw363aBa00zJ8vZtro8/kYstrBFO9TaMU
	AIr7fohQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrkVi-00000004cqG-3jGp;
	Wed, 05 Aug 2026 22:54:54 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrkVd-00000004cp9-3ydO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 22:54:53 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675HVWLq1786957;
	Wed, 5 Aug 2026 17:54:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=jTCAmkPvluUAKEwhfGpKbyxuRV6cyzQoV39IjtDI8
	tg=; b=mEC32qXiNV1W58B3VOS35ajKW8SRqazalCOITCkqPPBknm/X0CdaDZNnO
	ySt++3UF+ki7pgiR/HKs6iMOzcfs7CkPw3JuymTjJgD/cUaQl0ziPOzjFUnWu+0V
	0ZEEysQEtqHJb7Yymgj6uXoep+vraU1bgizkPRAaJmF7fPS4ZQIpNqxF7iEQNJ0L
	qQWNOwoHZ40+CLWS9eCyeNVRHG+kMETr/ykaXad2hJ5p5l2uTVMwvsd7M9UUdoDE
	zWmA2NC+WZmIPzfb2lHcibGtUVKFJYXJ4i0QYbWjae4MDucrkT11VCFMd6T0F8QT
	8HbDQlLfdm/F778M9DitPg05+oHNg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011028.outbound.protection.outlook.com [52.101.57.28])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fuuyqytfn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 17:54:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eii3B2Z0OoP2O0OKkU/LZNrBCPmiKe2ghysgCBWjnjsDtuMTNh+n/TSNP6hkZVFYer132Xm0z4pLIk5cFTr92lCgh5ernocmRG79E5qRqXBgGfdkhm3L78y7svTKKWvLc+KITFSF4xMxIGyaMV7+rI5lVzKPCp8s2Ci+TSCgRHNAhIVRPfk4SQZDu7tCJGz9QHpzit9VdjWWXQTPjnmAF20V6gOlskGboXRZTUTNge5pTmC9h0mEsCpjuUcnkHSsQ1HFoJ3ofHvMZJif1YbjfJzYxc9YW4jUorkkZUD48u0ebvX2kz9hnYC3TH3isQ6nVOxY1XefZBMUMMoLdalsZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jTCAmkPvluUAKEwhfGpKbyxuRV6cyzQoV39IjtDI8tg=;
 b=o31WIN+i1lLCD4Wg7u7AlNNrYIrwroJPvA/5bYA9DH4sUW81JjnAkjxISUKh5yg+5GKDm4Il+dyiD/7k6TtT5qfUaguUNrlKdxBg+YocU6VFkd6pOfXQESSoYNi6vjSDidrLx44mNotDK2LHzduUjiVMfVnTaLDZsGSl586MK2cYDdY61NJegBPpxcHg/C3M/lEWQtq1+eOMCf3I98OiNow3FPHcJ6E0g59eKFPwjyv+R0cTcWY8I6GCy8Nxtv1UDnAILK21CjGqSLllwPqZ+69g330WKWRFx+QgjiZRGTZaL0exu6/cw7C+6J0gDSisVjx9ZZOGG/3MjloAhXAsaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jTCAmkPvluUAKEwhfGpKbyxuRV6cyzQoV39IjtDI8tg=;
 b=Je6Oqln4uxnguZ2mMgijAC6dmoMgr8L6ngrR2Oh4Ilmk3k5AeKBj9bL/ZjpObMa0DdhKcrzezU9bN/3dl4QV6uCgs/h+LhCjuR49nmDJceppd7tkAr88dfRARD+Nvp/OtgwfIg0zu1xEwk4+vALcRUJa1uXZhpYmhK2bFAkVXB8=
Received: from BL1PR13CA0410.namprd13.prod.outlook.com (2603:10b6:208:2c2::25)
 by SJ0PR10MB4591.namprd10.prod.outlook.com (2603:10b6:a03:2af::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 22:54:41 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:208:2c2:cafe::68) by BL1PR13CA0410.outlook.office365.com
 (2603:10b6:208:2c2::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Wed, 5
 Aug 2026 22:54:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Wed, 5 Aug 2026 22:54:40 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 5 Aug
 2026 17:54:39 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 5 Aug
 2026 17:54:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 5 Aug 2026 17:54:38 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 675Msctg2968446;
	Wed, 5 Aug 2026 17:54:38 -0500
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
Subject: [PATCH v3 1/4] arm64: dts: ti: k3-am62a: Fix MMC0_CLK register address
Date: Wed, 5 Aug 2026 17:54:35 -0500
Message-ID: <20260805225438.464184-2-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260805225438.464184-1-jm@ti.com>
References: <20260805225438.464184-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|SJ0PR10MB4591:EE_
X-MS-Office365-Filtering-Correlation-Id: 20fb78e3-1a70-4d6a-5e47-08def34488ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|23010399003|1800799024|82310400026|13003099007|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: JLrghaW00ARdVX3X57l3xiDvn7nIUoFgEIumX3vpEwc2Wsz67gVYV6BPJPpt26THkSJcdMtBGEl1l0C5TUvcMyhiV2h5XAaVdy/bTj2sfnGkLD/hWTl+wIdN8LGlv9MZLgj+ykdOfevnPUz06fzJT+mr3micms+YpHHzixcdtLj7++3NzwLc7nIglITeCh1GFJ9PYbURDGEq06dhSbKKAqnvO38fa+ta+CyNw3s8DzKb3Fk4rOhRLe9OswBHfgTjroSKf4pxui6XtTRODFUUVS+gxQwyFJwTdoNwNEAKU389boJ/USQ+a4a9iDEHgnGndFLksDIQi6PQ2QDQcn7bivlp8J44safr7ZozLbJ9zSPhxTASeC0gsdQ4hZH6qqEtUqPdS3yns4TkIjF+PksvKPF8dAAbE9YUlGFQg4Xko/05na97lrHVM0UdrXrwGdkA9nhifeGuqjs8rQcLPId1NmX2ial8h//HY8sfq8M5JcXk+MrM1F0h3lE+dp71OR34h9DV2xcvx9UhGN1+BOyamRZaT8P0D4kaS/qaW3/HzsetZaifX7hC9nP7nlVDyHSs4BASW7AhDnbIIzumsSFyfShIxdZyzu0H2aU9i//O+7DigSR5BxF9PXbTQN1KLHcJqgfHwcSOPDYne4lCDATSHyr7VWFTNhZhNxDYSSKEFwC8lVahjmxVRJnMA9mWbxpQssA9XekNzKisxE7NgVbrOA==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(13003099007)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 82IDpy+c+KGtLkIKHA72co8dNHX5Sy4864d8y1BbkFkLc7neqU7JR2QsSPn/VEolE5VEaizAXGqhkH6Y2yLwdN3BQLTwSYMiechxqOWaEnYTXWtT3+EnJacmJoRBGB8JztUqie1xPXcbfyhmOpVP+gTfnpIYiSwIYptOG64CNyFShlyCh2StY0qFW265dvtJqZwXgiMtQYDyABIeI7qFzV1hDbm9uiCNyrspSkWgQDqG4pJzJc5iBM+WdP/R7FvSFfRhaTI/hcuiHDRNCoZ0DxkFOzopdyRnS4rlklH+cqcmi+B7/sAesSqrK8pmbQ0wspkRzxWUTQRBCld4gk/brUGr9Q4PV1mG4aYEEX9R5tPAig5wAR0LH0OOeyn+FhnCVzDV5oKPxtNofdNs4dM//BeyregMz6RLSZoFe8MYo+emAV3LYhjFK/+eN54g0SGp
X-Exchange-RoutingPolicyChecked: dgn2A6gIrZSZopQkTnrdChwri7EombrK/fcAspFoLGySKu96971Q8YQdkM5C6rI8ZOZdPUoNhI0wNkJ8oacOECpCwwWuYYvs+mKdox7fpjeD0sLix/cWcWff/ahRNNVIcBX66fzSVbsFYIX+mFj3PsnlLaGq+4zwvua6by15kcdHoyere9j/IUD8WifYD2sVhKLZYSRBRf/H7IZ1sbX8WzHGCsL/bsqsB9ji9yi6yJU+dID8F+Qap2YvWVqXwdECv40bzKE6mzM4ViwTcIKp52ZxvT5Ad+H+ltI7EbLFyoHpH/3GUNz6nVLFQigdDpv0V4/CUIuwScXHnM5G6bY/LQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 22:54:40.8349
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20fb78e3-1a70-4d6a-5e47-08def34488ad
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4591
X-Authority-Analysis: v=2.4 cv=B/yJFutM c=1 sm=1 tr=0 ts=6a73bf36 cx=c_pps
 a=XNfUKZRMy1FbR/3CVfPpdw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8
 a=N8RrIdEaZFVbIXh2HqYA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDE4NyBTYWx0ZWRfX/j63+G3iS2pk
 SBElddi5Z3QVhIOE0VVPQ/tpV2Gnpivnv/a8xWQeC1+BbG7I0VaapoZsylp9p4rTnzORClDziSt
 Bof/j8UrGjPifFpYNR1yNSVHE8bdqKM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDE4NyBTYWx0ZWRfX3EW1IBrSHxvs
 VFbZS27VN0dE/Bl0/vMubWkmiOo1VByEjAhoX1tKvr8D/bnXn5nur8AjSnSGJ/QXsteuuvkPYNy
 CW91VkoDp4PH1gYbMUzsgnZGk/NQdQpiqOm4GzQd5OrYKDtCOhcFLdc/0Jvdk0ERi8l3kc+NGUM
 21uXlL5it/a433S35vi2JJQ3dHKjcGz7QxUpIfYzTMIS2Q3M0TVNfLHxWFznpfsHmcUJPYgM3Xn
 Fw08/+SpWsh2LK9P0kaeh8rwVa9EhWV0Xj2PfWOhqBLf0oKibE6PH/fqJkP9FS2WJ/ppAjk4nXo
 3rIgPyX0Sh2EdAXq9WFYB/6jDR33lmc2Uq8Xry4FXfIJzWQMQiEQX0oBqf7A7vY+QegZzhITpeQ
 ohQH/QZtkp1vroCmeBlZUtI7hDwv17lnhW5dOMaqACWU4OWu8vmbXxaQWjxRmVnsGbrj7gRzjVk
 qrBrQMrusEDv2JISoPA==
X-Proofpoint-GUID: auUZyjStTruNiF3t7q-fbCIDns85LxJy
X-Proofpoint-ORIG-GUID: auUZyjStTruNiF3t7q-fbCIDns85LxJy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_155450_116150_106C2B34 
X-CRM114-Status: GOOD (  11.44  )
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

MMC0_CLKLB and MMC0_CLK have incorrectly swapped register addresses
as per datasheet [0]. Set the correct MMC0_CLK address and drop the
unneeded MMC0_CLKLB pin configuration.

[0] https://www.ti.com/lit/gpn/am62a7 Rev. E: Table 5-1. Pin Attributes

Fixes: e041ec6e86e7 ("arm64: dts: ti: k3-am62a7-sk: Enable eMMC support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Judith Mendez <jm@ti.com>
Reviewed-by: Moteen Shah <m-shah@ti.com>
---
Changes since v2:
- Add Moteen's review tag
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index d3b3675e7a8fc..b04636cab71c7 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -328,8 +328,7 @@ AM62AX_IOPAD(0x0b4, PIN_INPUT_PULLUP, 1) /* (K24) GPMC0_CSn3.I2C2_SDA */
 	main_mmc0_pins_default: main-mmc0-default-pins {
 		pinctrl-single,pins = <
 			AM62AX_IOPAD(0x220, PIN_INPUT, 0) /* (Y3) MMC0_CMD */
-			AM62AX_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLKLB */
-			AM62AX_IOPAD(0x21c, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
+			AM62AX_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
 			AM62AX_IOPAD(0x214, PIN_INPUT, 0) /* (AA2) MMC0_DAT0 */
 			AM62AX_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (AA1) MMC0_DAT1 */
 			AM62AX_IOPAD(0x20c, PIN_INPUT_PULLUP, 0) /* (AA3) MMC0_DAT2 */
-- 
2.54.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78865CA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 10:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48uwUZaBjkoWtvlnogwHTgZ2Bd/YUpgrG2evNSiVzpM=; b=xmobEYCo1FWuHtuR3DorqF14zC
	nlc533DMqPY2E0q6bY5qLwIMch7EW+7zGrifbUggTSB8QMXu8fYdmpRhRRhPE7eYbJekMStE+Ym5G
	UaLdQ2dawqV/MfRpYaLtUPtA3RokGlwrY36FaQ7NuB6qFKF8381joi9JiymTCfyyZ3hvulD81s+1+
	DCyDaedLXJsblgVYDNHz5RWBWnxj0NMvBMhREqS08mhoH+yBr8wAzhS7OFOHpkMs1541+DQ+uZmzP
	ooNQotaCcmpuJ8miVGanWppvpi04F2auCmDxPirMPXsDO+pOFP3y7mivDoZkUhTNbLj84lvf68onJ
	nM2lZ/RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOv3-000000029r6-42Io;
	Wed, 07 Oct 2026 10:30:41 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEOv1-000000029qV-2R06
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 10:30:41 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6977jh8Q494485;
	Wed, 7 Oct 2026 05:30:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=48uwUZaBjkoWtvlnogwHTgZ2Bd/YUpgrG2evNSiVz
	pM=; b=hjnXXa+mPtzO2LGPD/6qeV7iZrPP0W9wJLuMtRdAnzgEV2eymb0TCU73X
	CVMtIcaaTLxRZFjaK8cOJT8yBUqAgeL3fO0bkV53u25rsn/mUA/QKcWdZSEPDGQv
	TjiuQk7pSLleiDNKoW6tA43ecBi4crG+rz2VV4mmDwGxwhiR8QCwcyya6+4p3Mfo
	+fba/7Dcff3U3E7DCJcc9/RJuki4EKyDVdLJ7C1vsDxz2uVIvWpSV+lFiTHBr7kB
	i3KXBS0dDGMsPZkN07AItDBJDW0p8WIsoJ+hU4dCMGrQX/9Yb7YaMhnTIXShCVMl
	03ojw5u2tzlgURBfNqTIBwoQfGgbg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012024.outbound.protection.outlook.com [52.101.48.24])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h5dk4swy4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 05:30:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eSSJnRgjsmIsvyzBZ3Ay+lD/tDLO4o0dX7uhAEGl3gXRdQkMgyC0K66ZtUsg21gB1/l3+7nmZ7pDpkMuDfHU3cCuFmcmO6WyjakRVRTTd2GatnzrCjCSpLpZSe3lCnd42S7ol3lCp2vnEDpkxu2UtGo3Ge78bGVgzOEL+eA+bkVhBDf8kCVCOVane0dQwTgh8q4/Gl9n4sG+KJXZQuPr4Am59kTrmQiUMm+S0v04XWt2XE6ot/OJzKxnhtWjHlPwTno1KOmP/rNJI3eIDGOJCJb3hgJksZAurFaCWRG7hxDqXwtbaSlI/LowkXCOqMcVnvs43ErKDW+TaZ5imNV4YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48uwUZaBjkoWtvlnogwHTgZ2Bd/YUpgrG2evNSiVzpM=;
 b=HH81TEf97vntOsVkRcKkQfFBPtSsjPkw0UYaYmxCAhdbQjP13XoeEbU8DdjNp1E6vy10pUa3oM2kcdsoLvTQpU6z2dZPRBRPk5sH4vyfTeeJYmYgtpYRGQmTGQY5YHBqFlH3ISTsGJXvz0PO3/t/rdygmMe7NaeB/j9KPl4/VJb8h0qkG08uZQX/LcVZh3Vt1XW7a3Sp8dP+ZAs5T5ztUCs9mCdd8SNv/vMdDINk37qIv3eVlCqg0w8Kt+4kx8Omxx7u7m+sJw2f5WPU4f3S+EQJ27fRpBIG3FozYwOQhqGxnfKuWlPaBGvFPaN2ZB4zTRPvSOtn6hKseqBZLs9qFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48uwUZaBjkoWtvlnogwHTgZ2Bd/YUpgrG2evNSiVzpM=;
 b=kaeIATJTW3pWvA++w8vk9O4nE+lbsDUNKfbc6MfNTKhRBTR5k19XjDqfduFZhTqyvcxep1BT648J4reyegImdnrL9Qq2HNiZQ0Yf/JgMthsWkF39Y/7sNiuNRvOos3hyXgKB1KFa3I67fqfon7Cn74Bxt+A78bR2lpyITXMf17U=
Received: from CYZPR05CA0016.namprd05.prod.outlook.com (2603:10b6:930:89::28)
 by DM3PPF905D77450.namprd10.prod.outlook.com (2603:10b6:f:fc00::c37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.6; Wed, 7 Oct 2026
 10:30:20 +0000
Received: from CY7PEPF000000EB.namprd04.prod.outlook.com
 (2603:10b6:930:89:cafe::3) by CYZPR05CA0016.outlook.office365.com
 (2603:10b6:930:89::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 7
 Oct 2026 10:30:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY7PEPF000000EB.mail.protection.outlook.com (10.167.247.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 10:30:18 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:29:54 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:29:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 7 Oct 2026 05:29:54 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 697ATiSj013473;
	Wed, 7 Oct 2026 05:29:50 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v12 01/20] dmaengine: ti: k3-udma: Fix sporadic crash on AM62x
Date: Wed, 7 Oct 2026 15:58:42 +0530
Message-ID: <20261007102936.2402427-2-s-adivi@ti.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007102936.2402427-1-s-adivi@ti.com>
References: <20261007102936.2402427-1-s-adivi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY7PEPF000000EB:EE_|DM3PPF905D77450:EE_
X-MS-Office365-Filtering-Correlation-Id: 06bd51d2-eeec-4453-a222-08df245dfc1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|376014|7416014|1800799024|82310400026|921020|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 7Az5vRF1nf7PsXWC82vY3MFpuc3JNfNEATrsUnTlBWlZt/qaCIG/CUVU2gXA8FwZim9TsAIFY3etZVytRdp98xetjjzImsgdPKdMZLjKVbH+eZyXYa8ZkZVG9pDmBWYmJ3qdm5DVS6+duyIRjFEhGCByuwPdno49ru9IKynWAillf8bQF3Wf0eoCkds4/7d3xTwMV0Jj8bPpHkA5wXKkj7EuUgGVCbdG3w9PMkHxJ38eq/F3Z9CY+CYGoW2Bw+k3xGSb09jE7nUBsW4/QcYHzPZEqRPIXw6tMXY9fHLb4Rpdb1ST23C/uV/YP4Gq6KcmO+ydTTP7QPcuYXtCSCgUqvchMjFE05BHhqjTdtTOFAZLvuA1lub2l9LF6bzu2/PsNdPmfBvOSe4U0D1ka0H8URVcEhhJ0iR5zj8w/AJaRafk/3smmnOrZKERpt6rFk0+NtuSgb65IJ0kN5UwtL/F7tdkoyxsF+hCyfMIduVOYGfsQJJhMx9MN7LyFBh0+KKgzBxfHbSpaWTGLeyYB57PtZPi4hUTrl2QbKhYkBErFqe96wFYGAGh7mDtXUfuglcjN9PYPBRlnENJPUJS0z42GrMjaCrAJBj+VT9C+evTbKr1FjRJkg6xhqo/ZjRs4w7oXooLs4iF47NXp8VVUJVyjPOoljnE4vacHiZD1pb6zL7KK0YCe9py/yomAamT8SqEa0EEJvnDdgGrapJrXwMw4lZuHAizOTlqlNjsh+DfzykWVrVkmm4uMJzuFZRmdBEA
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(7416014)(1800799024)(82310400026)(921020)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6ltC5f0e5/JS1aFhFSyiwamibaBENS2qcTZ2q6KdVZO1OMksBD5QsnMMuHTMfhM9OPR2K9Gjf/LN5Ml1UU05cPoHsuHyT4WhVevyRY0Rbtvn6KULBbHg9mYqmAYJTrxPsrTw9IOsXXmv4171IxKK1P1pOidSpV56PsjimKWNmw6owHztWY0tPGeVHW4Y5wsgFvm+mpNaV+pv+zlxTYz3rGuUMXcC/hZNPlCq4c6/leXmkfzdjmRC/9W2hx/Y2BbRzAPdKUZDfAx68DHq/Co8fW6bWX9YgIV5UrQQg+elE9NQYVw43SMxBJK2SctLIzgHHLFJt/8cM8xpPUvNiANqedym/b5b1Y3dr1wixfIWB3DOFoquflnflyXCY75CbygKA119xVY7elXl/1ZuXxit6AVNrCeNnUUZr6UaHhG86+eWGUSfW7+ZPeqB5fsQBbbb
X-Exchange-RoutingPolicyChecked: A3w4ChJfNIGp1BFY+D5TPn7+gl0ui3jpqdzs5LM7kTjS0W8e/XX1B5ZN6TMo+rtTTULYpicp5dxGU9M6GQlVq0Qv/XclQtoav6PsKJyUBMfi0+pc61U0pDXpywUn+bSD/oXm2mLQBa+aqpJO1qy08whe5cO520j34cp3NyAJPd/s0lVh643uq2Eo+fmxqjY1xRSqHYvaOOI+196xjN8Rqrwrcpu1GsRAwNkD8zWAabeKGsG5fHEvmBonfkjMH7K9zHPcAT8WfMlKxIfQi1AWwwHG933eDpEFr4nu2GCF/SyobFOkX0Ix2Zi/Hcde2gzK08h5Mq2W8ErXjBX6rtiFXg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:30:18.9196
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06bd51d2-eeec-4453-a222-08df245dfc1a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY7PEPF000000EB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF905D77450
X-Authority-Analysis: v=2.4 cv=TaYDJhQh c=1 sm=1 tr=0 ts=6ac61f41 cx=c_pps
 a=0dUMnQhOFwHl/g2jU5Tm3A==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=hdkQjco0g4ksGIpORJwA:9
X-Proofpoint-GUID: vpXFS6HXDMWDN0-0rNHWLtuSMtaayfg6
X-Proofpoint-ORIG-GUID: vpXFS6HXDMWDN0-0rNHWLtuSMtaayfg6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfXyhiqBZQgbZgH
 D/j2nghOPEoAE5ACGV6hy/Quevxv/0Im4sOVEWOp1ql97ynXzR9COoNe6ZFjP18ppRIUB9mHfgR
 DwlXpocifqFoUfj/R2mPvD2iPqJVhBY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX1xsf1GmAFvJX
 WKwbvzyxteuelkX+ZEikBeoiDcjzB7kDwxlAtLMRciBNfPz5E4otidkrzQ9cA81L3qCq8gwboQd
 Zeh65PIqUweC+CdYjm+w8rHNMumFEQs0Z54bHySE0fcc2PvFzzgVGyPuG+UkkmQdNhLgBY7oSGb
 vGp4XpXopz+y3w7qplZYE3nksdDKzrKbelCptgIdQ8ZwRs7lE+eftBQ27PpumMYL2av/BD/rOLC
 HmEKV4NSZbqXqR1gHWjV5sjZxrtASaKnNb4m5Y9hKkzRj0eUEdDRQu2xJSomUJHv0UBaz67kj+V
 kEcaCP+1mAIZ+FO/e2Ygmdv44agB9SK5RXVfukuTz7eq4obnCAlC+voF+MkxgEVafidbBFV3XwJ
 ph1xIk2346KctClv9gbx9wfna4k/OlQrJycVBLoDWscWdtc3sZPQh+HlaiBr3rl8KShKy4bWiKU
 C90XzL3J+1FPp7JY2IA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_033039_633967_AE77EA34 
X-CRM114-Status: GOOD (  17.54  )
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

From: Vignesh Raghavendra <vigneshr@ti.com>

ring_init_data is declared on stack and left uninitialized, so any
field not explicitly assigned afterwards carries garbage. Every field
that exists on struct k3_ringacc_init_data today (tisci, tisci_dev_id,
num_rings) is set immediately below, so this is currently a no-op, but
a later patch in this series adds a base_rt field to the same struct
that is not set by this call site. Without this fix, that field would
carry stack garbage here, and k3_ringacc_dmarings_init() could use a
junk address for the ringrt base, causing a crash during ring pop:

[    1.998239] cadence-qspi fc40000.spi: couldn't determine phase-detect-selector
[    2.532106] Unable to handle kernel paging request at virtual address ffff800081a84b98
[    2.540051] Mem abort info:
[...]
[    2.629987] Workqueue: events_unbound deferred_probe_work_func
[    2.635832] pstate: 800000c5 (Nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    2.642787] pc : k3_ringacc_ring_pop+0x48/0x94
[    2.647234] lr : udma_pop_from_ring+0x7c/0xb4
[...]
[    2.726250] Call trace:
[    2.728691]  k3_ringacc_ring_pop+0x48/0x94
[    2.732786]  udma_ring_irq_handler+0x34/0x218
[    2.737141]  __handle_irq_event_percpu+0x60/0x14c
[    2.741846]  handle_irq_event+0x4c/0xa8

Fix this proactively by explicitly initializing the variable to 0,
before the base_rt field is introduced.

Fixes: 017794739702 ("dmaengine: ti: k3-udma: Initial support for K3 BCDMA")
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 78a67cb9d6e00..8457644cb9132 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -5484,7 +5484,7 @@ static int udma_probe(struct platform_device *pdev)
 	if (ud->match_data->type == DMA_TYPE_UDMA) {
 		ud->ringacc = of_k3_ringacc_get_by_phandle(dev->of_node, "ti,ringacc");
 	} else {
-		struct k3_ringacc_init_data ring_init_data;
+		struct k3_ringacc_init_data ring_init_data = { 0 };
 
 		ring_init_data.tisci = ud->tisci_rm.tisci;
 		ring_init_data.tisci_dev_id = ud->tisci_rm.tisci_dev_id;
-- 
2.55.0



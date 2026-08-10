Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1A6C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 15:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uPMyrI1kGg32mzpEJpABjRZNA56YwScsWpTg+w/+inM=; b=HSN0pSHnsHearVJ+/ybWF5PH5/
	7MbXWejveEw6SYBcHiU16qHGZiv4H3AfTME5WsHlY39GQqnbUbeVUgCqbD4baAy4Xc3yK+tAfb4nL
	G1+ajEB3ZXtSC8/vjN1G47oD0JOA7PN9OC57oOOy+kkBqBz/LLOfu1jKDYQaQClQhp137MtfsxQoS
	U1igzcaM9Hu3SlX1YFPKvD+gt0CbwsTD1HQGKeAGkofAyCgGej4F5WJ6vH0IrD9Qw1t+uASaXYmIO
	plryuzMuxf9g4h/Qmqi1tiCnZ24FxINFrmeV6LzZLKhKUaQpVtzAwiU+nJ2bxupwYabzr64F05C/d
	Ib7OMHzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRiV-0000000CAfm-04xZ;
	Mon, 10 Aug 2026 15:15:07 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRiQ-0000000CAcE-2Hzu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 15:15:04 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67AEUgxZ3620583;
	Mon, 10 Aug 2026 10:15:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=uPMyrI1kGg32mzpEJpABjRZNA56YwScsWpTg+w/+i
	nM=; b=P0XrhV0dQzxwJ6anNxtttB7nrqJmay3Ry+Py4olgSjiwzR6rRNY7GNX3l
	aM4Zx07/zy0q6f7pfksE6JbuzitP4wrpotWyqzJSFqoqHJiOV5cuK7mfFuUlX8xZ
	rJjJ4Jv91QYEU/is94UfIMO18yzmwU//De5AlOoaIKYl+46sL65oMzGycn6FUmBW
	7raM/LBevKoow8coTCQvmG0OLPR1r3ZSLtGy4q1squTkD5CDbgusiwqgyQoOpC3c
	wT8NjXfGq/3pnJ4O5xGYfi+GEuBJSsHZPxSkRpZGF4ZvuWAGCCAzULUMMp8fmJV9
	b9d6ulcFX1pvaLsWqqzi/2Vb3hkqw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013063.outbound.protection.outlook.com [40.93.196.63])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fydt79gu6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 10:14:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNS+wlCJGKDV+zs0wowPZkkZP7JAyJVL9xxD9PndmPG/kMOj1TsLAs/YAJX4585sLp5WVMEpEW2xxUEniREajQmpEsxE1E3n2NeCipL+TnmtiLNj8jt4BDDVTxsG0tkAD4R5yFxokcmhZugCAKFWehpcKucZKhfNZsEmPzzScJPc5HTi9ZL7ms9snazf7vgHHI8oH02lC4w/bpn39hiogmVPTgZlY/pWZLQOPXz3VVPPBX51/oWFo/LZQSuStLRjxCDt/FMQBZXejLl87PI1ytYYU+nVfb+UxkSUnHTkDL5xRcCYER7j5+DNyAoTZ5mIvs9GYatXH8S18aqvrxtPpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPMyrI1kGg32mzpEJpABjRZNA56YwScsWpTg+w/+inM=;
 b=rSwT87rvmomEpvg8fV9GmhuZ4FIYj1NJ4gRauI1toP13awzezTfNUJTfhiXamLe3FEisHzajvYc4ixoyzZGR4JoTxElOX734iVMM0Jr3FNcYrS64Rvn51fkh+MqJx8I1sWVbBYVKQzvApe46sGOMXjNI+WhiOP4gA0O1USCGTmDYz5MADX+bIbKSHciSNH7MOK36RIKlXUiw/Fe3WLQDb90KMlX45H2dD80g2Qu1EArMFPOwIO8K5gR+C+Dl9IlGFMZ0+yjVWuMXUhUcDqedADqZcvESiBhY9u+3Qs39pK9vN38sNbOeJEc477qk6QCxKourdn4FJPCFwHB/t8DseA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPMyrI1kGg32mzpEJpABjRZNA56YwScsWpTg+w/+inM=;
 b=fFlJPiggbCv++59V62ForXFJtaWwZ4YWPI4Hvv7R2KNBcY42VOL4/+/Ff/icLpWxWPSSevau5lpan7wZQP+WdI8vFxW7fU0Rji2vc1vh2mwrgRRUrlegKiNdqzi75Y13f5Pbq30fJAYg+zq38ryImouvA0WknGHE/ZlBv9ydNvw=
Received: from SJ0PR03CA0201.namprd03.prod.outlook.com (2603:10b6:a03:2ef::26)
 by SJ2PR10MB7859.namprd10.prod.outlook.com (2603:10b6:a03:56e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 15:14:52 +0000
Received: from CO1PEPF00012E80.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::45) by SJ0PR03CA0201.outlook.office365.com
 (2603:10b6:a03:2ef::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 15:14:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E80.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 15:14:50 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:14:49 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:14:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 10 Aug 2026 10:14:49 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67AFERVx2648613;
	Mon, 10 Aug 2026 10:14:45 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <Frank.Li@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <ssantosh@kernel.org>,
        <s-adivi@ti.com>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <r-sharma3@ti.com>,
        <gehariprasath@ti.com>
Subject: [PATCH v8 04/19] dmaengine: ti: k3-udma: move static inline helper functions to header file
Date: Mon, 10 Aug 2026 20:43:58 +0530
Message-ID: <20260810151423.1948224-5-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810151423.1948224-1-s-adivi@ti.com>
References: <20260810151423.1948224-1-s-adivi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E80:EE_|SJ2PR10MB7859:EE_
X-MS-Office365-Filtering-Correlation-Id: 399e80ef-3ced-4aff-9885-08def6f21f9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|82310400026|36860700016|1800799024|921020|6133799003|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: yZMH98MVV/jkipe02Ofv9vjl98wErCY4JwoUNuqI/wU5G9nM0W2/wZq9aQJsdI/4r9inPkeFYZa9oT6B+1Ir+roOIjnohOnqMJBRqm/x5ahgrrq9nnvS26QmejxTjq70d+QkdM+5OMZwtNh6Xo8U4Szpxla7N7+nqpbyTPfgY+cGbXwCct5tNBqQz9gCjJCEYVrVFvomzl7a2jCEaudHAbL0TmPz+9Ok0xP05Y2uFYfg8NugQtDr89nV8wWe4kLx3O3rXkHYFn0U5Jiq1KsZ63Fs4aida+MPu7cImSXISkx6jC2p4pF44BnHkfiIfvjLRajubF6cjMDa5luGYNNJ4GEL7m63WgKbHs/djx9BcKq4ZfDuVST/DUA+UM68lz5GeDudXGOCMWt+MvlyUaXrPWiACUa1B5wLW5ADZgCCvcvfl67xMLFkuC0woLe/n3jzjlRjKqSPqAnEySpFi/JoyY9r+qtinej10v8APi06Ghx01aTsJ1aVkpiW+GzBI/Mq72ZU9XOsEDT59KjtJWruyirLPaqIJRvKHk3lM+282xkRgTo1UTg+VHzl0bozJaTcByPKi138agUEmHT+yzFizICJjxpmmekpzpai+4tm4G2BwV5Fbapkp2gvSjMVD6p9mJENUwE2WoN9l6FvrPJE+v2fT9LSGF8NUqbV4sEWMInnvPpHqtfbpVvCl/ymtRy7yFL3eQQVyYjJaoTKctUDesdy8VEFH2QySVitrnsk6TQT3wRMEDnUbNyElNB1kEPf
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(82310400026)(36860700016)(1800799024)(921020)(6133799003)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: pjUZiLlUKGbbG2DtcWB1hK5SuAVnzapjJVssrAhQBYNnzjSIK7xp8TjXNxakM3Vns8EmOML4dkeJNHFUUOsLCzc0j2o/UBV7da6+hAggwauG6HZsbpx8WZ6nIoJxEer1LN8oWPnsPUBp9ooWdEaSiDBXgvqFEMelIU5ZgviJmZPY0t1z4xla42entdQaBj3/a0tZldziX1bFrhOSgWjqPGv3LKaNk6/j5T86w9UEoigDrQf/chLxbvL8SZHMTxxuZG+69pwWXY/8C8VNfwKLfr37MIfFU8Dg9FTd+KFeIBZkGSfD9tLtu0HvWkXN7wcCkVs5ZWyiCtzHvnHo8zbmymrRcTXXBatOLJcCK9r/WZboPxca8WO5G+oJhF/DaVAtVdDCnmpOrX1aOiL1d9kNEtvtoPhSgBNLJJgA5KhrnDeO1dX1wDE0AyUzbFI71O8y
X-Exchange-RoutingPolicyChecked: rRo6sInAyM2UsNfJEclYqMbC+dsQvBN3LmtjdmkWHDhLa1dFQQj350SaGoodaXrWaog0TurOpbLUXOFVw2TkLICCor1zKgNbRX13hsX05DCyxByvzo8wGRr3a5geEi0kO2Wbx5KpBTU/BVRgN6sa+naxjW2VIxIV3SsJWIr6x/EFoiHApGdexgn+MN8+dujtFll+YeEAWCCbJAp5bPrdG6nOCtsa7eGn6X5k8anSlEN0/nXqYt7uMiSOlJjve3naSYczuQmgQKQZ8cacX2A/y91uAMuWruqt7IMXWNV7Wao8qENsjTltLlBgJNnQyJ9FGj1cCUsk8R9xy5KALDLvXw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 15:14:50.4710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 399e80ef-3ced-4aff-9885-08def6f21f9b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E80.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7859
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfX/3s6qUyQYB0B
 8HCXvNeVAKI38VsA2ppWhLSC66JLjBtAELo6sWbsvSmOSlB8SJxRRhzmkQ05TljojRl0jBQqYVX
 f/Jx4igtA37fTolTCL5IwClt3jnjaMh1/htLevBTxvhL5u6DITiYazRZId3AMjSA2QSexOCK9hA
 bk6O6UT1nTWAOEZveiZWWqshui/eOFSuYQTkkOpNClmk3qs4sqHBmW/2QXRvQlOrBNKAJlUVlCP
 BKjOhJ7CYiiUK57oHEZAVDM6Vohw5QnelT33bTHF/fzY0ivpaoNdUU4ellKBR01t77XK6f5wJuA
 7fey9Mtnp0fSVDQ0kSEPkHQetLD69xjSlKxjg32UX8ZBIWhYimZwHFj8eEzq5bPjItNxVybnAes
 kL8N2rKWuu2qdSgkLqBWMHRTBP0Wf/lStdeXVvn4yDbAJbC+HlJCp+qXbfqevSU7uKOE5RyuzaC
 mx22SPeHvNclddk/qAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfX/RvPdO8qgGSZ
 pMKpGSFXE9Uinur9OvMMfY2U75mKQov39FpRs8li2C4mejtVHwxDbnU8UFqKgBvQWaU3Qh3ntxX
 zbxYh1rIyJIuQS+NFQRr3d22aNy5VgU=
X-Proofpoint-GUID: VJVNZfdoPqemUtUC8paETwTVaUODZme9
X-Proofpoint-ORIG-GUID: VJVNZfdoPqemUtUC8paETwTVaUODZme9
X-Authority-Analysis: v=2.4 cv=F85nsKhN c=1 sm=1 tr=0 ts=6a79eaf3 cx=c_pps
 a=VUNJaWZlx74G+l0QYBOIDQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=8AirrxEcAAAA:8 a=sozttTNsAAAA:8 a=grpEhN_aSmkWsCgVS3MA:9
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_081502_593698_8CF7CEF8 
X-CRM114-Status: GOOD (  12.86  )
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

Move static inline helper functions in k3-udma.c to k3-udma.h header
file for better separation and reuse.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma.c | 108 --------------------------------------
 drivers/dma/ti/k3-udma.h | 109 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 109 insertions(+), 108 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index ce706033143ad..0eaa06b7ae988 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -40,91 +40,6 @@ static const char * const mmr_names[] = {
 	[MMR_TCHANRT] = "tchanrt",
 };
 
-static inline struct udma_dev *to_udma_dev(struct dma_device *d)
-{
-	return container_of(d, struct udma_dev, ddev);
-}
-
-static inline struct udma_chan *to_udma_chan(struct dma_chan *c)
-{
-	return container_of(c, struct udma_chan, vc.chan);
-}
-
-static inline struct udma_desc *to_udma_desc(struct dma_async_tx_descriptor *t)
-{
-	return container_of(t, struct udma_desc, vd.tx);
-}
-
-/* Generic register access functions */
-static inline u32 udma_read(void __iomem *base, int reg)
-{
-	return readl(base + reg);
-}
-
-static inline void udma_write(void __iomem *base, int reg, u32 val)
-{
-	writel(val, base + reg);
-}
-
-static inline void udma_update_bits(void __iomem *base, int reg,
-				    u32 mask, u32 val)
-{
-	u32 tmp, orig;
-
-	orig = readl(base + reg);
-	tmp = orig & ~mask;
-	tmp |= (val & mask);
-
-	if (tmp != orig)
-		writel(tmp, base + reg);
-}
-
-/* TCHANRT */
-static inline u32 udma_tchanrt_read(struct udma_chan *uc, int reg)
-{
-	if (!uc->tchan)
-		return 0;
-	return udma_read(uc->tchan->reg_rt, reg);
-}
-
-static inline void udma_tchanrt_write(struct udma_chan *uc, int reg, u32 val)
-{
-	if (!uc->tchan)
-		return;
-	udma_write(uc->tchan->reg_rt, reg, val);
-}
-
-static inline void udma_tchanrt_update_bits(struct udma_chan *uc, int reg,
-					    u32 mask, u32 val)
-{
-	if (!uc->tchan)
-		return;
-	udma_update_bits(uc->tchan->reg_rt, reg, mask, val);
-}
-
-/* RCHANRT */
-static inline u32 udma_rchanrt_read(struct udma_chan *uc, int reg)
-{
-	if (!uc->rchan)
-		return 0;
-	return udma_read(uc->rchan->reg_rt, reg);
-}
-
-static inline void udma_rchanrt_write(struct udma_chan *uc, int reg, u32 val)
-{
-	if (!uc->rchan)
-		return;
-	udma_write(uc->rchan->reg_rt, reg, val);
-}
-
-static inline void udma_rchanrt_update_bits(struct udma_chan *uc, int reg,
-					    u32 mask, u32 val)
-{
-	if (!uc->rchan)
-		return;
-	udma_update_bits(uc->rchan->reg_rt, reg, mask, val);
-}
-
 static int navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread)
 {
 	struct udma_tisci_rm *tisci_rm = &ud->tisci_rm;
@@ -216,17 +131,6 @@ static void udma_dump_chan_stdata(struct udma_chan *uc)
 	}
 }
 
-static inline dma_addr_t udma_curr_cppi5_desc_paddr(struct udma_desc *d,
-						    int idx)
-{
-	return d->hwdesc[idx].cppi5_desc_paddr;
-}
-
-static inline void *udma_curr_cppi5_desc_vaddr(struct udma_desc *d, int idx)
-{
-	return d->hwdesc[idx].cppi5_desc_vaddr;
-}
-
 static struct udma_desc *udma_udma_desc_from_paddr(struct udma_chan *uc,
 						   dma_addr_t paddr)
 {
@@ -369,11 +273,6 @@ static bool udma_is_chan_paused(struct udma_chan *uc)
 	return false;
 }
 
-static inline dma_addr_t udma_get_rx_flush_hwdesc_paddr(struct udma_chan *uc)
-{
-	return uc->ud->rx_flush.hwdescs[uc->config.pkt_mode].cppi5_desc_paddr;
-}
-
 static int udma_push_to_ring(struct udma_chan *uc, int idx)
 {
 	struct udma_desc *d = uc->desc;
@@ -775,13 +674,6 @@ static void udma_cyclic_packet_elapsed(struct udma_chan *uc)
 	d->desc_idx = (d->desc_idx + 1) % d->sglen;
 }
 
-static inline void udma_fetch_epib(struct udma_chan *uc, struct udma_desc *d)
-{
-	struct cppi5_host_desc_t *h_desc = d->hwdesc[0].cppi5_desc_vaddr;
-
-	memcpy(d->metadata, h_desc->epib, d->metadata_size);
-}
-
 static bool udma_is_desc_really_done(struct udma_chan *uc, struct udma_desc *d)
 {
 	u32 peer_bcnt, bcnt;
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 11d08adb0d69f..54e1757c3de38 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -451,6 +451,115 @@ struct udma_chan {
 	u32 id;
 };
 
+/* K3 UDMA helper functions */
+static inline struct udma_dev *to_udma_dev(struct dma_device *d)
+{
+	return container_of(d, struct udma_dev, ddev);
+}
+
+static inline struct udma_chan *to_udma_chan(struct dma_chan *c)
+{
+	return container_of(c, struct udma_chan, vc.chan);
+}
+
+static inline struct udma_desc *to_udma_desc(struct dma_async_tx_descriptor *t)
+{
+	return container_of(t, struct udma_desc, vd.tx);
+}
+
+/* Generic register access functions */
+static inline u32 udma_read(void __iomem *base, int reg)
+{
+	return readl(base + reg);
+}
+
+static inline void udma_write(void __iomem *base, int reg, u32 val)
+{
+	writel(val, base + reg);
+}
+
+static inline void udma_update_bits(void __iomem *base, int reg,
+				    u32 mask, u32 val)
+{
+	u32 tmp, orig;
+
+	orig = readl(base + reg);
+	tmp = orig & ~mask;
+	tmp |= (val & mask);
+
+	if (tmp != orig)
+		writel(tmp, base + reg);
+}
+
+/* TCHANRT */
+static inline u32 udma_tchanrt_read(struct udma_chan *uc, int reg)
+{
+	if (!uc->tchan)
+		return 0;
+	return udma_read(uc->tchan->reg_rt, reg);
+}
+
+static inline void udma_tchanrt_write(struct udma_chan *uc, int reg, u32 val)
+{
+	if (!uc->tchan)
+		return;
+	udma_write(uc->tchan->reg_rt, reg, val);
+}
+
+static inline void udma_tchanrt_update_bits(struct udma_chan *uc, int reg,
+					    u32 mask, u32 val)
+{
+	if (!uc->tchan)
+		return;
+	udma_update_bits(uc->tchan->reg_rt, reg, mask, val);
+}
+
+/* RCHANRT */
+static inline u32 udma_rchanrt_read(struct udma_chan *uc, int reg)
+{
+	if (!uc->rchan)
+		return 0;
+	return udma_read(uc->rchan->reg_rt, reg);
+}
+
+static inline void udma_rchanrt_write(struct udma_chan *uc, int reg, u32 val)
+{
+	if (!uc->rchan)
+		return;
+	udma_write(uc->rchan->reg_rt, reg, val);
+}
+
+static inline void udma_rchanrt_update_bits(struct udma_chan *uc, int reg,
+					    u32 mask, u32 val)
+{
+	if (!uc->rchan)
+		return;
+	udma_update_bits(uc->rchan->reg_rt, reg, mask, val);
+}
+
+static inline dma_addr_t udma_curr_cppi5_desc_paddr(struct udma_desc *d,
+						    int idx)
+{
+	return d->hwdesc[idx].cppi5_desc_paddr;
+}
+
+static inline void *udma_curr_cppi5_desc_vaddr(struct udma_desc *d, int idx)
+{
+	return d->hwdesc[idx].cppi5_desc_vaddr;
+}
+
+static inline dma_addr_t udma_get_rx_flush_hwdesc_paddr(struct udma_chan *uc)
+{
+	return uc->ud->rx_flush.hwdescs[uc->config.pkt_mode].cppi5_desc_paddr;
+}
+
+static inline void udma_fetch_epib(struct udma_chan *uc, struct udma_desc *d)
+{
+	struct cppi5_host_desc_t *h_desc = d->hwdesc[0].cppi5_desc_vaddr;
+
+	memcpy(d->metadata, h_desc->epib, d->metadata_size);
+}
+
 /* Direct access to UDMA low lever resources for the glue layer */
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-- 
2.54.0



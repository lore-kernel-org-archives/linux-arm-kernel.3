Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BD9CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 19:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V/cz6BCje1meHDEU6Tke6O8BtcJt9cMRIp+yBsplEqQ=; b=B9qRhvoP0y0U8E29AY9wh/4j9c
	D6m16fDt2osxhI/Xr/mewvlxpa1D4tBW2YwCUFgIFAyuXOXE2w+j1bBL3oWhvhFEC8QaNV+bytGv0
	CfyvR0KrRyhMyUd4yWIPByDnsPx7RW6KHgUoIjUd4Mr8eordWFo5sXKG4sYEqaWT3zmZuhIIWfI6p
	7i3yWmbhgx1YuSsHSneblfTbBjUSb+PsOfgptOfUf2JR1NwVz2VXJGTTS0DRx7Q8Us2HJDGhjprzO
	o71zXQ4BK96aqm+CqzecPjjDslSaTXkYMECjeKd83XlsyFmTKJSLItrc5YBxj/yk6ExsB6HzAB3vU
	NAZzoIZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzcE-0000000737Q-0RKH;
	Wed, 30 Sep 2026 19:05:18 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBzcA-0000000736m-2PVS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 19:05:16 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UI640M3525057;
	Wed, 30 Sep 2026 14:05:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=V/cz6BCje1meH
	DEU6Tke6O8BtcJt9cMRIp+yBsplEqQ=; b=Kwdg5iqNGbeMQ7TMqedRpcCIkMK/i
	5q4+dDAizlQzjopgUWLubOWbrLcXRdnrTCf63Pkxn0dlz/G6HD7m+BIzN8ti33Dn
	g+56U7mMaAib5NaX6UKRrPlyx5vWoZbN1JoC53hi672jd5R07Y4nk4dNGNz6/aRO
	twBoy7RG/rxqw/mgAVtWZ5bQWFLy3hs48P5IeVClt/38p3gRKv+BZcOtGSWFLOHN
	fI/dV2ne8x7XJGnqjFVCC5/dqVoeQHj3HiDk62AlGYLXhhCkAIvRDmS2zP2ZUrAR
	oHGhQ/UTq4STSkkvHZhoHsXLzuJpPzepyG1Cydftp/HA6xlXZJfwTmZNg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012003.outbound.protection.outlook.com [40.93.195.3])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h17djr95c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 14:05:10 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oTrCxkeCje45H7bWJq+0g2lKBAVUgZ0pN/BhwB43/cpA2X5unM3X0YDVZjqNwWk77AafuzNya5Vh/aTFLyEBDV7Bs8p/Z94EUXIeLtYU+4cy4yUV3J3xccG+n1PSrUbHOhabqhcw+0NDSFqQYF2tMmugVtDYtJl9Pq+PEz71slKqcw2aLK43J9VIKWmm5pUAe93T9PYfZRb6T9VOO3ABmDopsYm6TMylaxjKtlUSVgUDaLeYu4OTqTQUTq8ldipmtAe3zIOLXLGt6QD4sgO3VVr6Sp+bK6WEWHntEdyr2eNcRiJsY6PRn+r71o4UkuFNXmHmaZXCwN2aH9ZEVcQKrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/cz6BCje1meHDEU6Tke6O8BtcJt9cMRIp+yBsplEqQ=;
 b=mcyzkbM+a/eGodzqj+aHdc4DlaaoBvGIhbWaZDW1imJMPevCzd3QgfG4vaNiCk+pMsReNzP3nZFIovS+JltriETjDTaOIx5HJ0lbmyN8EwQivifmI6ugSp3L/jCkAoyzkyNaoDZOu0UaLCeou6ZDLwN8iik0XEB5/c+E6hERMKoB+Voyr/nA5sxTMGrmzTOxCCLydLvI9ksRJQVkh3XwXnx6wTwN1szYmCrz7KKGrHMTiT2fd+OuFr5zFpftNIYWCVgXs5EowShSbkkNAOlgDYujI7SBpebCGUpB33yQ6plG66X5Nbr3yu2Lr5JusxZxq1JqXWwUucooTajYwrko4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/cz6BCje1meHDEU6Tke6O8BtcJt9cMRIp+yBsplEqQ=;
 b=P48wu9IKCcJYBpuse8rJbeX2zu4OJcFQxxvAZRnSPuPh9YROq1NEBvV6RbXHcKlVjp2dfD5xZnJIoEzei2EJWPwLcN4aVECV4LVZl33UtxEgMgm+o8gOAzhmLxY7R6JHAGR2v0keN0TqJVArxNHWdHq3pjduLRrP7ii1zZTgNOA=
Received: from PH8P221CA0021.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:2d8::22)
 by DS0PR10MB6703.namprd10.prod.outlook.com (2603:10b6:8:139::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Wed, 30 Sep
 2026 19:04:57 +0000
Received: from SJ1PEPF000037AB.namprd03.prod.outlook.com
 (2603:10b6:510:2d8:cafe::2c) by PH8P221CA0021.outlook.office365.com
 (2603:10b6:510:2d8::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 19:04:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000037AB.mail.protection.outlook.com (10.167.244.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 19:04:56 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 14:04:09 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 14:04:09 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 14:04:09 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UJ45um437712;
	Wed, 30 Sep 2026 14:04:05 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>,
        <sboyd@kernel.org>, <bmasney+clk@redhat.com>,
        <jbrunet+clk@baylibre.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <afd@ti.com>, <u-kumar1@ti.com>,
        <vigneshr@ti.com>, <b-padhi@ti.com>
Subject: [PATCH] clk: keystone: sci-clk: Handle missing get_num_parents operation
Date: Thu, 1 Oct 2026 00:33:48 +0530
Message-ID: <20260930190348.11720-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037AB:EE_|DS0PR10MB6703:EE_
X-MS-Office365-Filtering-Correlation-Id: f309aeff-2b4c-4c53-096c-08df1f25b7b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|13003099007|56012099006|6133799003|10067099003|5023799004|18002099003;
X-Microsoft-Antispam-Message-Info: TKSLfTCahcD8oBK2g4yKUdxhJtoWOuVwy+dMwVcOfTgn7s4Pg1iYDfwhiQUk2Ijs+5FLs/yjrtC4G8H+6EEUydirsZ+1j/HND5xTwvGgNJw4ugwzrlFGfcPPAyo06j8NIEFG04/P83qHjceqomYrRT0EmXn27aM+BsddD4vkXyo8sUuycdACn25gB71he0zeTDMr0oQbEMK0pf4p44Q5W9ULRRAGhbv74FD+YpWt/2T/lZIP+CtTho6ygbHML1J4sHq44W5QTa55wp2nUEt0ziJMWpS/dT8r5N8GauFbH8irUdyCr6XDTuUFbMqix+OivW8R5d5tM/A3PDV1PPRjOBnA13KfpQ3265qgtDpgxsHl/Yxtr8XCdSEc+07CC1/oK3WvhcSiY5++X5dufNbwu+J/vO7u5Fj21DYTiMNOJhJwADFTtXB9X1kS0l2T/cw4XKcitnM4C1APzIzSRnZ152mOu9j1PcayCDsk5r2v4Eo3D+4mIAoYeo7b4dUNb6h9PDkTJgSplqi9+9FCRDWaQgVRD9sjoAky6A28Dd1mCbVAxie1HIRiiPq1tuY1Zr1fKS3EhWHNCjM5YvAGeE4w9Wg9eoRiUfbn2P0meHjXVTnRv/EzOm2m7Zv3RSMbDWq4HpbPUSrT4VrdTJT72ywUbh8A1/zihEMgFRBBoDrbX7/CsB8sfNnZ088SzysYsFIk20G64+9fzeSuPS6egtWeCw==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(13003099007)(56012099006)(6133799003)(10067099003)(5023799004)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EGw0hsyOG6aNm/NvwERxfA1LWDhE4iNXu8ox0L2/1O5kdXiMfLMhCzYoQzpNUjng6NT5uD5Yee2Ex8lk0tgng0ERW7l3mf9cWAXDSKK1mQ40TY8aqUXu/Eshaoa/p/PCyUNHQLHObMcR9dAtyo4FBFz2xUjr2rTBTpvOFoAWJZV90bOxbAO+UpyOQAf10+RjrbLs/V7JA3Waod0arv2pNlAlbEqC0FFHelsgil+30MZjQ6C9jGWENj+FkxOhlu76pkJuEQP4KfVFqVHODajrH2UBxBLjx/NgzJwp41wE0gQTo2Q6TflnIlftmYB1mN7WSnEntWItv6w0h2NYawdEN8ahgNeQvuxgAuEe8Bk4xbD95fv3d9Qo1X6UMCWRM6VcrpjnI6wVNXbZfMi9a+hNc2E4Y3TQDfM5D7hZcECIhJ23tAAyeleveL229l9qbjE6
X-Exchange-RoutingPolicyChecked: WHVEh8B1/jmCG29sZ0YJcfqH0rbwierT36YruLx7yr+PDkGrOsBGxQ22NfsHJt6XQ2oa0f/KLDJ7h9NtiVEAOKIPSsfULEtzYdLcyYjAJ7iFCnOhgwVgw05iQzXuh/8zsXcVuxcxSs4RosM3cg10eTUoTxnQXMHKiKsHifVbPmSAfgZkL8/oGmSmqQ069/a0cD+3FnT730RTmOJ+y2hXOf1BGZi8dY/LEmh65KWuPirO0wLUaunXKuhUyOHzreF8bwPDG5v/4G9QgmP0BoP2z5QqTjOknak3gvA02Q3q1TSm9YwN5SjrSnI7cNb5XrHhbt123yE1c7zCvvvd3JLfdQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 19:04:56.5151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f309aeff-2b4c-4c53-096c-08df1f25b7b9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000037AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6703
X-Proofpoint-GUID: pCYcr_yO4p767nQa2ASwGJJfNfe2Jz8Y
X-Authority-Analysis: v=2.4 cv=aswnmiZV c=1 sm=1 tr=0 ts=6abd5d66 cx=c_pps
 a=4HEXQ/P5pkaUFkQJdDnQHg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=NEAV23lmAAAA:8 a=sozttTNsAAAA:8 a=uzs227ONIdg_jjjOc1UA:9
X-Proofpoint-ORIG-GUID: pCYcr_yO4p767nQa2ASwGJJfNfe2Jz8Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3OCBTYWx0ZWRfXw0dnBtuehi/u
 aASbWoIjcALMkiNZRvRs0F7dE/ugilIvU3+bnBU4PqoTn5KoEHCtwdfMYY6aNNdWyuyHmTLofi7
 6PWGoGFd11JBSk4XwR6XGAN2R0yGMyE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3OCBTYWx0ZWRfXyW4fu+P2YX6b
 tB5FRIK2/e/tujwfhfQchbeE0I502yLreUA2SeH0zLpj0mttDemXRKAbC8yTLzTdw/9aE8Jg0UN
 Nn7RnI0FjUBdbogUVVVa497WrYIUStR3kj2uGw2m6MSGmzbZaXbv/vVV6GpEfqrVDJ0BQ+eAIr9
 jh0JTcPxrz9aDd81iCatZjAycj3htckweeGEIVK2JnNOSRoCd4gYZOLo6qU73alRMvCijEuuUxH
 MDjcH/ius9ECeF4JptNu/DQWOmbNp4pB4CVDIcEK5gmSJg4llR2LsbJvrVZ8OAUOk+A7SNcM1h3
 n1YSjC1/vpuh333hyRXgiddy52QDOsCAeTg2Kjyq0gui/tEk2EKEQHzOAQIWr7FuD/rc5fxQ1Ga
 qkSO1V1WERj1qZ/sHWDs/5WFUr5y1zwO0r2HQmZWVj1822yjMix6I3IzNdLFihzfcWo9+QxaR6Y
 ToDJ+YINZjyvgXJaDgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_120514_764667_D49289A4 
X-CRM114-Status: GOOD (  17.72  )
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

The sci-clk driver unconditionally calls the get_num_parents TI-SCI
operation while scanning clocks, both from DT and from firmware. This
works for all cases today, but with future support for some System
Controllers (e.g. PDM on TDA54), this may not be always right.

The PDM system controller on TI TDA54 SoC manages clock parents
internally and does not support the clock parent related ops. Therefore,
when scanning clocks from DT, treat the clock as having a single parent
if get_num_parents is not provided. Such a clock is registered without
parents, so the get_parent and set_parent operations are never invoked
for it.

Scanning clocks from firmware relies on get_num_parents to discover the
valid clock IDs, so return -EOPNOTSUPP in that case instead.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
Testing Done:
 - Boot test on all keystone and K3 platforms.
 - Verified that the patch does not result in any warnings or errors

Logs:
https://gist.github.com/3V3RYONE/d821cea46f5dc1e70a759c97878fa487

Note:
This patch is independent and can be applied directly.

 drivers/clk/keystone/sci-clk.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index 9d2094bd48e3b..5bf615893a8c0 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -468,6 +468,13 @@ static int ti_sci_scan_clocks_from_fw(struct sci_clk_provider *provider)
 	int gap_size = 0;
 	struct device *dev = provider->dev;
 
+	/*
+	 * Clocks are discovered by probing the firmware with get_num_parents,
+	 * which is not available with every system firmware (e.g. ABI5.0 PDM).
+	 */
+	if (!provider->ops->get_num_parents)
+		return -EOPNOTSUPP;
+
 	while (1) {
 		ret = provider->ops->get_num_parents(provider->sci, dev_id,
 						     clk_id,
@@ -589,10 +596,18 @@ static int ti_sci_scan_clocks_from_dt(struct sci_clk_provider *provider)
 				sci_clk->dev_id = args.args[0];
 				sci_clk->clk_id = args.args[1];
 				sci_clk->provider = provider;
-				provider->ops->get_num_parents(provider->sci,
-							       sci_clk->dev_id,
-							       sci_clk->clk_id,
-							       (void *)&sci_clk->num_parents);
+				/*
+				 * Firmware without get_num_parents (e.g. ABI5.0
+				 * PDM) manages clock parents internally, so
+				 * treat the clock as having a single parent.
+				 */
+				if (provider->ops->get_num_parents)
+					provider->ops->get_num_parents(provider->sci,
+								       sci_clk->dev_id,
+								       sci_clk->clk_id,
+								       &sci_clk->num_parents);
+				else
+					sci_clk->num_parents = 1;
 				list_add_tail(&sci_clk->node, &clks);
 
 				num_clks++;
-- 
2.34.1



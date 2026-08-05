Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7457BC55184
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 00:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cZXHDIQWgfy/yeyB2jB/rmLonlS6tXJUQyQtBX9JlJI=; b=PieWtSqlAza04RMlGJPitMb8qw
	mCUyK8GU3prkge26nrpa2aViHvCrLqRIrVOhxA5vNF5Vs6grskz4kchjIyKxAZorKqv3s7z5osA92
	O8GlQozd7a4/sJfpcE1RlpHMCu3OHUBPY2b1/jzD1TuBlkhSOosxPts3NwXn1MuXmtW+UidDbNQVs
	qaBZTt7S7AHF51z6+8ge3g0fWzopjYjuTua2/fnG9AOLtOesDBY9CEfHvoYu+0Q3HEf4R1RuD5mK0
	ApRgfupTqG7p2xPA6iPyXmhWNq9KWIznt0zxcoC8hggzBnZxEWWKr2Id1cZjxSt41MwI3z1DbpNUl
	38HjOuDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrPfD-00000002z6m-3ctZ;
	Wed, 05 Aug 2026 00:39:19 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrPfA-00000002z5A-0XDG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 00:39:18 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674NFv3U4116691;
	Tue, 4 Aug 2026 19:39:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=cZXHDIQWgfy/y
	eyB2jB/rmLonlS6tXJUQyQtBX9JlJI=; b=pC18k917J2bMfEqhvzU5Fnf5c5DM/
	4+lg6VURw3MHbK3CJ54qWMT8w12h14iduGSzEvf4x9HX8oRfbyMEdWc99wbnKAow
	ByO1Ns15+EI+7A3IEv1oqIG5xscsoscmf7Rkbsytt/62o7Ontl9ZvQqpTijz3r+A
	HN+cdR8gL7VTrTlDn02GILOj2AkdEk+BA7Q6Y7vqIA/sqwcfet1i2N5o3sUF8pg6
	v6q82BBy4O8/1C5wdM1gaGQZvbODNOvslIZpuvPswk5tl3sxxjkRiFUCaRoNsmqC
	BIDFS/k9wvln+YSvsQ5MpwAAgWFR8ijff/R9flvCP0pWJ74ysaDnOIYwA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010020.outbound.protection.outlook.com [52.101.56.20])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fufckdh8q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 19:39:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uOh/zD1XoJhXedtnmFtSdC/9TnGd+1ZyfHdDsifdjAK3RmyufUqe+4WFpFieFnyFUuwh4iXQ9XZioAukarduVTP2GV+HhHVrirN4t0HNzJ36AqBSZz9CjKT5/lzhwMKylrnnpmRY2ZoP/hLT7fzTJ9V3FrRV9+UitvuN/g34lxoQifp5TdopBoHIiZSUhedDioXjAwhKFpESSbQbhFMgip5drEvjuO6VEEFB026XCI8vnTmh+t/KeoFzMFiKi2Cz23V8enMGDJRGfCzbwx3bBD+3r5oVHBQXnB49K2Vppr1qLHmpsnyfqEJL7a2zOaLmvqTXvBp11UzSdBDZhTq+Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZXHDIQWgfy/yeyB2jB/rmLonlS6tXJUQyQtBX9JlJI=;
 b=XfNIhprFhvWqq2zk5b2TV+I1d/G70Ok1aZK7i1XK064DD4m8En04sxy8q2xuKemytwmEkI6UVIn2R7zz2FZeunvx6+O/HwtHTFjWCHbEfqJygGZA24/kupmcGEFjUR/frHCGxoc8akFbUmHU7ZRJMk2du/GMafyuRvryuTxaNj9wplW0rqhB7XDyE2xX+6Qn8CNc+7v6t0y6hv+/fO5UBW+5ZAvyrb95en/v7rX91LLv07qtzKv+QKLFfv1C59yq8UcIwKNtfpBrQRx+IPq71ZJJ/zqDXXD0LYHukZ1dIdC/ENwlmkwGjrzX0b5SL+SIFNLFdKV0G4z1lmv77bMr0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZXHDIQWgfy/yeyB2jB/rmLonlS6tXJUQyQtBX9JlJI=;
 b=Q/aqYeu8sLezvHehdui3BQsCoO/+RmeEQZ6uIDDFXuV5m+1P+kqmYfw2JTBQZ7Ak97yHaoYVNkiBiQh/z+x4Z1PVHpD4K38PTiRwulguOOhelpv6i+JrxGVs2jgtYHXFtr92N8FPYtY9xK1kGBc5Bp78F0rHTOYdpGjIFz4L1zY=
Received: from BN9PR03CA0493.namprd03.prod.outlook.com (2603:10b6:408:130::18)
 by IA4PR10MB8303.namprd10.prod.outlook.com (2603:10b6:208:567::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Wed, 5 Aug
 2026 00:39:01 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:130:cafe::93) by BN9PR03CA0493.outlook.office365.com
 (2603:10b6:408:130::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Wed, 5
 Aug 2026 00:39:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 5 Aug 2026 00:39:00 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 19:39:00 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 19:39:00 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 4 Aug 2026 19:38:59 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6750d0ab1170794;
	Tue, 4 Aug 2026 19:39:00 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] arm64: dts: ti: k3-am64: Enable IO expander interrupt
Date: Tue, 4 Aug 2026 19:38:59 -0500
Message-ID: <20260805003859.412474-1-jm@ti.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|IA4PR10MB8303:EE_
X-MS-Office365-Filtering-Correlation-Id: cd4f68f1-1235-4960-613c-08def289f1a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|18002099003|56012099006|13003099007|10067099003;
X-Microsoft-Antispam-Message-Info: wm8ylnW46uPHf1N3Vz1HHn8FUPrq1QpDordKeC6A1+Ofebz2YvSlLd6uNjCIg44TKL6CQ7+s43SG0RD5IGtABvGH+gkx4GK47lvqQZZ/yvicbe+IYeQ0ywySCuwBVRtVy7qiWRljPjQFO52bxKjopdhekSlP1EIrbL/BaOh05YKC3zIRUq8xXPml6mfJxk27gbe0+oiJGGiQoE6jV226ZNwdlBqs2tjg93bQfhBLfkPLDChZpTBzc5wdMa05NhhWDnPaWX7+Bo4303NTDVaKIm0NmxgtxBBNZ8yXcBRtUuk3MzNahWnEHNj5jOTVJ9cocsFnpXMZ3ya+LILnA/9iGeV9ChuUMebH/5Qh/unYvbd220GCZoUGhQEOr9O2jopAG1lFVA1G/sy5KhzidEjvxwJz1T6vfVG4bAwB61wGfJIOrglKnVeZgm0cfIjThbIfo0pOtlXegLCGVm4YRg2Js94B4GJ0CFDMcZ2A7Dah/i64e/9gLf9FvwecawOHKvgDHItr6c0kccFAYVmiZCRC/VCNC91r0H00XS0uPEDMP6RfQuOp8u7MihjLcu6PXpFi5BDVxsiPvZVytUms11iOs7PRyTE6DAMnMXqWabTp6Jcn+ZE3Cc9L8+/sjoKa7lRSXVMU8lW83I84Wk7XFlria2cM1DGiSS11aIi9jUYfr8H1iWuTidQqP2xRYvKcjKuwUtMxcwhi5lP2sXGsXmyFGA==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(18002099003)(56012099006)(13003099007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gRI6eyjEdPA8vBJZBJ9RJO1dDMCvMIxfBtlUYguPOyhZehSkNDa3ahfUsCD/9PSfnOIEWPgCdJkNMUvWggxNj/mndcRUQ8sbWfjkdwpFZ9dpvwPQK2aTLRVZmus7jNllJ2cqfy3xGoASfhIGh+ZSHKtC2mteYlqGUqSVLOE9QhOcokeEfPZzcQsb5GswPMD4ItoMK+ylxNP7Q0JMjVNvoP/sTcwA6MeAtc+BiDD9qXna7KuMseUlYSncvcF3l8k6b6VfOH931gAVzw+DMgRwrtF8esloC7F2DdDOg//eh3K6jb/wxNjDN3iA/BeAIZxk+rtjnhMF7TkjuqotN9Z+pJNWH9+yheLxOkc/oHsH7QAKgtdmBToeF4UlG0v1gGJrmHVlGcNDu3qBYmYFXLCGNp+danqmvWXvHa4DVvgz74y1jmC2fv/HjqZOF1F/KmWQ
X-Exchange-RoutingPolicyChecked: bo+XCFqbob7LvHAZzHm0kUwPokEvrLhAFfpepkkvsx/nsNqGEsXlz5wBRPBd8+lnRJdrJqp/C2hgo545ULvS6Sjru6Zt8/NnEjySGX/93cslZ2pSxAvyKIOIZQ9GbWuSNRhKOSwXwVbJUJygVpN4OBa3LexV6hMqeLtHKsIsRHynZsHJXTmLZmsaCYL0/Jepl4xwPbiBAED+clWPy64tCOn9L7H2CzzWmsRP59dTkrzr3a7f731CPIkH/1AQ2UUEeCq5djNdGJsh1adgt7SReyjqZbA7BJk7K7kp/b+x1CjfbvkvjL1NS1hGO8pxhmv6+gTj6NhkO8vDgXsSvR6Hug==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 00:39:00.9824
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd4f68f1-1235-4960-613c-08def289f1a1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8303
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDAwMiBTYWx0ZWRfX8V4Zbli6M4uy
 j/9frG+GTiVHxdpWjKLazqmtj2H+7TAEa4E+OsP2a3nyulAxBwkKmnVrKP5vH/U/ujjgZ3jRLwr
 p6TuEtPm+1vUSbeDSdwoEuyv2NHZFkR+S3RLgTppa2XpaFK3om10OYwOPHkdm2tHM/CWu0+PqRo
 cfbkSgL0rA0qFc1aMlfui1f8eC2JeHU7r+0/9ZSu1O5nNXrimdoyiyv01Nu4Bpij9QN6oyh+P19
 eFNZRSbP3XkHfTvF0juNk+kzTa0U5EcM764hvEIk2P97cjvbtpqD0rRyGrBVXfbzwoaNaVFmp9c
 db1OmYHHyooCBUa73mJOhNerU+/kaD7nIF1u+eR/Gxh9FjKPYEv3rBLrsu835+f8i3ZCyD5+lYH
 NeFbBXTxJV7N7LtiBKND0phE7fgFekC+wsOo2cS5sa0y6b4Ld+ILvjGv+60rrxUhNKvBvgwTRjc
 k509cRl3fJ/JO5iQqlg==
X-Proofpoint-GUID: Pdv_vGjAbJBzGJzRM0HRuVlO1BvL3Xey
X-Proofpoint-ORIG-GUID: Pdv_vGjAbJBzGJzRM0HRuVlO1BvL3Xey
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDAwMiBTYWx0ZWRfXxzdfSySirb7e
 6JwhmRpfarw0o6eQ61+wNFeTwHZHASHD5/2GSGhismCU7PpDhe+9tKVdRVe8feGU3CnGcQcQT3U
 H28syeODFP/P5tkgeHHGPMJbfr34Nww=
X-Authority-Analysis: v=2.4 cv=GNA41ONK c=1 sm=1 tr=0 ts=6a728629 cx=c_pps
 a=VugNgcmXu5HSfOtR6yJkXA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=69n5StGKHvAR_yp2vncA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_06,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_173916_458257_92843423 
X-CRM114-Status: GOOD (  14.71  )
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

On AM64 EVM and SK boards, MMC1_SDWP is used for IO expander interrupt,
remove from MMC1 pinmux node and setup as exp1 IO expander interrupt.

Signed-off-by: Judith Mendez <jm@ti.com>
---
Change from v1:
- Add header files
- Change IRQ_TYPE_LEVEL_HIGH to IRQ_TYPE_EDGE_FALLING

V1 is from the original patch series here:
Link: https://lore.kernel.org/linux-devicetree/20260729195958.671147-1-jm@ti.com/
---
 arch/arm64/boot/dts/ti/k3-am642-evm.dts | 15 ++++++++++++++-
 arch/arm64/boot/dts/ti/k3-am642-sk.dts  | 15 ++++++++++++++-
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-evm.dts b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
index bc4347cf71140..28fbaf134af4f 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-evm.dts
@@ -8,6 +8,7 @@
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/net/ti-dp83867.h>
 #include "k3-am642.dtsi"
 
@@ -259,11 +260,17 @@ AM64X_IOPAD(0x0284, PIN_INPUT_PULLUP, 0) /* (L21) MMC1_DAT1 */
 			AM64X_IOPAD(0x0280, PIN_INPUT_PULLUP, 0) /* (K19) MMC1_DAT2 */
 			AM64X_IOPAD(0x027c, PIN_INPUT_PULLUP, 0) /* (K18) MMC1_DAT3 */
 			AM64X_IOPAD(0x0298, PIN_INPUT_PULLUP, 0) /* (D19) MMC1_SDCD */
-			AM64X_IOPAD(0x029c, PIN_INPUT, 0) /* (C20) MMC1_SDWP */
 			AM64X_IOPAD(0x0290, PIN_INPUT, 0) /* MMC1_CLKLB */
 		>;
 	};
 
+	main_gpio1_ioexp_intr_pins_default: main-gpio1-ioexp-intr-default-pins {
+		pinctrl-single,pins = <
+			AM64X_IOPAD(0x029c, PIN_INPUT, 7) /* (C20) MMC1_SDWP.GPIO1_78 */
+		>;
+		bootph-all;
+	};
+
 	main_uart1_pins_default: main-uart1-default-pins {
 		pinctrl-single,pins = <
 			AM64X_IOPAD(0x0248, PIN_INPUT, 0)		/* (D16) UART1_CTSn */
@@ -481,6 +488,12 @@ exp1: gpio@22 {
 		bootph-all;
 		compatible = "ti,tca6424";
 		reg = <0x22>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&main_gpio1_ioexp_intr_pins_default>;
+		interrupt-parent = <&main_gpio1>;
+		interrupts = <78 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
 		gpio-controller;
 		#gpio-cells = <2>;
 		gpio-line-names = "GPIO_eMMC_RSTn", "CAN_MUX_SEL",
diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
index d28a38c87f32a..aa87845d77598 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/net/ti-dp83867.h>
 #include <dt-bindings/leds/common.h>
 #include "k3-am642.dtsi"
@@ -198,7 +199,6 @@ &main_pmx0 {
 	main_mmc1_pins_default: main-mmc1-default-pins {
 		bootph-all;
 		pinctrl-single,pins = <
-			AM64X_IOPAD(0x029c, PIN_INPUT_PULLUP, 0) /* (C20) MMC1_SDWP */
 			AM64X_IOPAD(0x0298, PIN_INPUT_PULLUP, 0) /* (D19) MMC1_SDCD */
 			AM64X_IOPAD(0x0294, PIN_INPUT_PULLUP, 0) /* (J19) MMC1_CMD */
 			AM64X_IOPAD(0x0290, PIN_INPUT, 0) /* (#N/A) MMC1_CLKLB */
@@ -210,6 +210,13 @@ AM64X_IOPAD(0x027c, PIN_INPUT_PULLUP, 0) /* (K18) MMC1_DAT3 */
 		>;
 	};
 
+	main_gpio1_ioexp_intr_pins_default: main-gpio1-ioexp-intr-default-pins {
+		pinctrl-single,pins = <
+			AM64X_IOPAD(0x029c, PIN_INPUT, 7) /* (C20) MMC1_SDWP.GPIO1_78 */
+		>;
+		bootph-all;
+	};
+
 	main_uart0_pins_default: main-uart0-default-pins {
 		bootph-all;
 		pinctrl-single,pins = <
@@ -383,6 +390,12 @@ exp1: gpio@70 {
 		bootph-all;
 		compatible = "nxp,pca9538";
 		reg = <0x70>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&main_gpio1_ioexp_intr_pins_default>;
+		interrupt-parent = <&main_gpio1>;
+		interrupts = <78 IRQ_TYPE_EDGE_FALLING>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
 		gpio-controller;
 		#gpio-cells = <2>;
 		gpio-line-names = "GPIO_CPSW2_RST", "GPIO_CPSW1_RST",
-- 
2.54.0



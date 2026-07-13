Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F02C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 08:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:References:
	In-Reply-To:CC:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LO+0pVdXjAyt1W7RKquCs3pzeDyTBo+E/VXojX2p1nU=; b=RUwPoWKmnXHBLXOvBxtnqEkVZa
	66EyrDnsnOrVlgRAns+He8/nOSYGtLszBZTR1r7KJwz10gYluEj35VH7373DqU0SIGMQ7R6BBihCb
	uJ3RdN3KcU7kGs0cvz+V2ZE3ceZSxXrzKA42FpKNGJspJKCTbiTlOCZrtwPrMmZLx3aqVbnSiixsx
	zqn9BBj0e9Ua+TFcPY+xewG3Bi8QMpr7jZQ6t+DKLgLTYZffk9L1/fjismzIQnkNBzS8bK6T8CTb0
	GobfNAD0SFyTQ2+gBuYwf8BH5Ys0KKhMg0nXcMSKfNOr5xyX8RMdUHbkrJAPBA6dgtuKj7B4YjG7C
	36npnv+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBiE-00000008Wsx-3Pxj;
	Mon, 13 Jul 2026 08:08:26 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBi5-00000008Wow-2eqV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 08:08:20 +0000
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6PdpY2798169;
	Mon, 13 Jul 2026 03:08:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=LO+0pVdXjAyt1W7RKquCs3pzeDyTBo+E/VXojX2p1
	nU=; b=F31k8Sa2rM18+1qc3iUdY8fB+mizjccWktGf+s8pBe6ymeFo8GObF1D5b
	8muHtEe46HSVEqgAnUx1HkEfuPUdm5UraSnPraRpxkDrDb20pE8WMDYkq6oVsQ94
	jh0JWmTAO6vqS2TiucrpyLrmdbydWLuui1yQK+KAw5k0aQ+Mn4gcCoRIoMgMzclL
	JXWQaySPJvWZA5jandLIL2h7lLFwrNlMrVuQq7YsjYMn59lTyN6zYz2r3bb2SPQI
	WdukUJqhd46KuVxajKlZfhHIeSqcfCAwsIqDSWyCvBnyGiXg68AmuGw+hLmvFiB0
	qwZs5DfTfgjsuv/48N1tEyhqJYqFA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012038.outbound.protection.outlook.com [52.101.43.38])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fc574mrby-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 13 Jul 2026 03:08:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tqR+7GZ/PKYzViXIKjsCUn3cfTXY3bZ2UPbEdJp8v7duz6QKAhAYhjGL2xFkhmGXrcVrIUm4fzK1DaMvQVLea9V7ENKLXXVcEqajWQ76H1M72TkdxKXF0ApqCycqQwjbq03o3ERGlYXS6FMi62cwhGJ1yI0vxi1DMomjIJwjyxPSjUZyJNVrkKCn3i3yC+gFNaKKwulIDmn/6uyzcY3aDzu/Exaz4u3y/o6SMsxUnSAlbuza96wktzgYfHM9q/AXXH8OtiYHJRXw65nX4Ho5VixrZQY0u+Dqkg3+nBu8qeI4Or+urF6HAzJQ2K5Jtn64C2hG+zunDbMapwZcMv7B4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LO+0pVdXjAyt1W7RKquCs3pzeDyTBo+E/VXojX2p1nU=;
 b=Cc3guXm3OhywC6MRubE9p62D+03TN0u/FxumogeFKQ3OOA26oc/NLbdLUQh1e/KULWOTwnA4fgSf1+/CbtEnSrNLWZC1iJNn35M6z+r4RnBdL/h9U84Yj8hNbByLx3R28fF6I05vW6d84nzmWZY7a5dN/VyXp7Vq9K2O444o5mdu5WOyLSDeDrwadHXgrVlo4HKKEVXHgrLYZCk75BNBjPyCfRU/kVvY13Zl/bCLylu5OJyo/mekKIGoVel1gqpiI0u6jH5liw0l2GaR0sY5gERDqNNssWsOPWZEXDstNmSsaiXGMXevr7RG433GdBttEADfAj02x8TogT3rTh/ytA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LO+0pVdXjAyt1W7RKquCs3pzeDyTBo+E/VXojX2p1nU=;
 b=AfN+VKNryTSumfiRMf15ZNc9T+dIT1mhkEWFB8zFv89EvDpzaeAGkiqhausqvAzk1qRkTgNvZrfyWTJ/WgzkOQ6Kh9rvR7/Iq5ZWhJi5kAQNeUCEf2XJgytu4j/O1J5ipDa3riA7lZ4BIDB1Sq8WXqmHCls/Blb6PJzg7n+JdYg=
Received: from CH0PR03CA0056.namprd03.prod.outlook.com (2603:10b6:610:b3::31)
 by CYXPR10MB7897.namprd10.prod.outlook.com (2603:10b6:930:da::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 08:07:59 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:b3:cafe::9) by CH0PR03CA0056.outlook.office365.com
 (2603:10b6:610:b3::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Mon,
 13 Jul 2026 08:07:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Mon, 13 Jul 2026 08:07:58 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 03:07:58 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 13 Jul
 2026 03:07:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 13 Jul 2026 03:07:58 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66D87ckR1075972;
	Mon, 13 Jul 2026 03:07:54 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] arm64: dts: ti: k3-am62l: Enable HDMI & DSI display
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Swamil Jain <s-jain1@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <tomi.valkeinen@ideasonboard.com>, <r-sharma3@ti.com>,
        <devarsht@ti.com>, <praneeth@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
In-Reply-To: <20260513210942.692269-1-s-jain1@ti.com>
References: <20260513210942.692269-1-s-jain1@ti.com>
Date: Mon, 13 Jul 2026 13:37:31 +0530
Message-ID: <178393005159.2885601.13711892620228139345.b4-review@b4>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2352; i=vigneshr@ti.com;
 h=from:subject:message-id; bh=ffM7xAtBkrOJgih21GuAvG5+fYWmeNfOTARjlcR/Cdo=;
 b=owGbwMvMwCHG7GTPG/5e9jrjabUkhqyQOafXMP1qmS756s+CiYeUdzd+rnz/dZZ33uMj3wpDG
 nksmv7M6yhlYRDjYJAVU2QJYNs1yyrF4nFEReJWmDmsTCBDGLg4BWAiIZcY/rvvEN2ycs7V/kuF
 BnOL9PMO+1Rq/5XRzZrwwbwxY0/8f2eGv2Jh0X1ennM2mN8/vmLfnMO+RYlfta08fcVNGFJkD06
 24gcA
X-Developer-Key: i=vigneshr@ti.com; a=openpgp;
 fpr=4A5A711E8E7E44F9F12F2CFAF903332F551A78E9
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|CYXPR10MB7897:EE_
X-MS-Office365-Filtering-Correlation-Id: f00587c5-1f37-43c5-1e87-08dee0b5da40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|82310400026|1800799024|36860700016|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: JbZtK8EmrpU/Vt+KtmF42fEx16VjLNIqcoWZIHLRxKZ25r/SnFLAlQQxigozu8pLzj/znPOmpxFNek8KH6BBgYk/zpq+4ydD5YH4ex/IYiGotPCDDWDET2SeudupxTneLBR678HNBfFnf8vF8zid9Pbv1cNmGoTR1dgO8W1jwwNo56bSj2+QqcZ0q3ZFoLjwtsAsIP20w0GVjwJtcb6VDTCbU9Od6x5zn4TAqdDFdAkbRAcVpoSxr6+3MFZCX5MFbw1RblXavflLQLNNtV5HIkEdcxzhjTrnhpv/y+uLR6YBRaJpPONU8k51wCVJnP38v3VNx/69brPsyeIkpIl0mCcFl+8cd7CdgyT6GAh0k6Qh5F3msHETCWGZKCJsvTVmvcbT96GP8JZDp6vlrf7h+I4UI6+3UHP4oHY/zIIh74jAc4DxFN8lN9zZWbo/6rluYGxT5W0dNorgKuBslRXhUgPe+PZ2d/K3oK8YWQ3RGlypjhmnpmWI+qMFSvBQuxkgwJ5lW4EOI4SWeaSBAWZK3/NH169IZHm8uXb/8KXTVV7YB6EZ+XiicW5e+4IPG8Lby1wbVA23BsRnB7AU6sf9jRJze1pJ3OeH1f7kCCjF2iQ1sYT19vYuDYDsxdITZVebQ7eCcmxMfpodbsw5i1Wyr9hLZJfDvAgIXr5tAsqRKYWRaomgRNx6JmK/U9QGsk1yRgTZRsBQboWWajpV6Q6pzg==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qdbQcc+r6Whj3o/+pyN/KxmVCIdDLZ4zX0+RnX02bnLdDotrd7eyuC9RJ03VjK5Icz21tOo17PgNQC5n3WXwULz7l0nHGy5gEHMsU+knvt6PEI1Fd0UBdHpQKfJfXOHstIJ7f+YAAIfric3J7trb674UHXZKRKg1GVVGugf/65KEXjrZjo/k/8scu407xNULNe0k2by4ADH1BFEsge9opDBt6ixVTyCYVyy+vDFtin0uHRpwuf10W53hNXXhYCBiDqL2pv3R0wJAqaQUI6PwtNSSMLhTbYlgt0RQjRE0tTtcVjMpTMPmiZyvsoFJAD6l883iQ2swCQ6/dLThja8Wo20E0i2xdVCW5uJz1y1EmqQ04KI4BOCPPqwRNDMR2cl14WV0Y3GEZtlewaVg/VskhLvErhIbdWp8EKw417Q68D0opnPnDTjdeZVf9+jUGL3O
X-Exchange-RoutingPolicyChecked: Ufc5oSQZaDuNx1Juc2hL1jUV1zMILxZEFsfBKwTr7RAMW0optJFZZq/rDFJByswSqnYds7KalYBQbIUTv8Kq6Gr7gqUQJX6u/GuMc6G3aqO8gp4UAP2JgjqBcvGFo3TcRniAyjp/lW0qn+biCnK2KgYlQ0ogVTfb70nHRexlVIafE6tPqw3FtAddqUv2877EwPwjYq0Od077u8PxEnHV/2uWGZmYxvZnsdCBMej+6IYqaIYQEKavMrVqlNvPw2s8SAnVm56L8HRIOATUg8aonEI/hHpmSi9cs4zqx/yeKDvyD4hVcD0CMS4dJun3hjYE+x/wuE/rKP+/GbUvvQqAZw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 08:07:58.7531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f00587c5-1f37-43c5-1e87-08dee0b5da40
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR10MB7897
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4MiBTYWx0ZWRfX8jD9x665PUAq
 urXQwJ5QhWQ6PY/cB9PYYt1PfcnvSyhO2VmpEKv+BTVSQFBCdnwWAGigFS1z0tIOz4v2uzSldcE
 3l1aSipp32wqs856eQsMAQFOCgpLmy4=
X-Authority-Analysis: v=2.4 cv=DpJmPm/+ c=1 sm=1 tr=0 ts=6a549ced cx=c_pps
 a=MTA8SzjkfSP6DqtUeP+PaQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8
 a=JurDm2ZxNpx0bJ1OwawA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: lXAA0sl6ELf6MNFfxg68t8-APISzHAQ4
X-Proofpoint-ORIG-GUID: lXAA0sl6ELf6MNFfxg68t8-APISzHAQ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4MiBTYWx0ZWRfX1CdItbS+vhYJ
 +V8Mm3wEe/c5FDkViFtjjO9k7iU4dGpgUCZfGDqmDbaPzzf62hz7DYguN6dcKrd/Z2LeeQrPWfR
 MeJQFMQ5E/rV2LS0I17NdLq2gF4A/RBzO5+RiZQawMVzSwIv8W/a3754a2TdGPfhMVLYPwxVuxn
 TwMBw4XHC/n9p7J3FXFAGDnaj9p5EIdwTlrE6fsE/2vUYOK0iXeGHocHPLt/dA+0YaDsD7jmSTU
 GOutdywNQVOmuAKqv/PP/5TKBWGWrcbJMZnSL5PGrpZLPHm42tBmgJXlPLfdfa2vOxQ3kmsMwg6
 3wutsdXg5WOmVcw1tEZFIRoWTq6jHfiKYC35nwgK16nwPXPZGWgGnZa+oAMRU5tXIDW0jzzYOSl
 laSiBz7wUH9FXrTIlc94Vj3eJCJOXl2crTlE9vqJrOrZql5oS9GJYmTK9LPEmjD5QgN23727Eq3
 0lrtb0Ow0APxh5DFp7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_010817_805973_2F95D685 
X-CRM114-Status: GOOD (  14.42  )
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

On Thu, 14 May 2026 02:39:42 +0530, Swamil Jain <s-jain1@ti.com> wrote:
> Enable DSS, DSI and HDMI related nodes and pinmuxes.
> 

Don't see any Pinmux node added? did you miss them?
Also, DSI still remains disabled?

>
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> index 80615ca1e01a..1d255c9138db 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62l-main.dtsi
> @@ -584,4 +584,51 @@ scmi_shmem: sram@0 {
>  			bootph-all;
>  		};
>  	};
> +
> +	dss: dss@30200000 {

New nodes need to added in sorted order as per their addresses in this 
dtsi file.

> [ ... skip 17 lines ... ]
> +		};
> +	};
> +
> +	dphy_tx0: phy@301c0000 {
> +		compatible = "ti,j721e-dphy";
> +		reg = <0x0 0x301c0000 0x0 0x1000>;

reg = <0x00 0x301c0000 0x00 0x1000>;

> +		clocks = <&scmi_clk 348>, <&scmi_clk 343>;
> +		clock-names = "psm", "pll_ref";
> +		#phy-cells = <0>;
> +		power-domains = <&scmi_pds 86>;
> +		assigned-clocks = <&scmi_clk 343>;
> +		assigned-clock-parents = <&scmi_clk 341>;
> +		assigned-clock-rates = <25000000>;
> +		status = "disabled";
> +	};
> +
> +	dsi0: dsi@30500000 {
> +		compatible = "ti,j721e-dsi";
> +		reg = <0x0 0x30500000 0x0 0x100000>, <0x0 0x30270000 0x0 0x100>;

reg = <0x00 0x30500000 0x00 0x100000>,
		      <0x00 0x30270000 0x00 0x100>;

> +		clocks = <&scmi_clk 155>, <&scmi_clk 158>;
> +		clock-names = "dsi_p_clk", "dsi_sys_clk";
> +		power-domains = <&scmi_pds 38>;
> +		interrupt-parent = <&gic500>;

GIC is implied, drop.

> +		interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> +		phys = <&dphy_tx0>;
> +		phy-names = "dphy";
> +		status = "disabled";

Don't you need dsi*_ports ?

>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> index a1af4571a815..7462921e2180 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
> @@ -192,6 +204,36 @@ exp2: gpio@23 {
>  		bootph-all;
>  	};
>  
> +	sii9022: bridge-hdmi@3b {
> +		compatible = "sil,sii9022";
> +		reg = <0x3b>;
> +		interrupt-parent = <&exp1>;

Is there a reset line to the chip, I see GPIO_HDMI_RSTn in exp2 GPIO
expander, does that need to be hooked up somewhere?

-- 
Vignesh



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782F1C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 06:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:References:
	In-Reply-To:CC:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2KTGU31cJ9OrmCZmqTyunWZQMLGYl4j80jzTgTOniSs=; b=SC0mHwU72NyBojkXeyaSU8Pg2K
	nfSsORvH9v24nou+PA73wFCdYAECHJuMENGEABLTk8ytDIHdgNN4Gva+5o5gF+rQI81/kVD3NkxlZ
	d+mNfG1RnRo6dnVcdBHVnl3cPIUF3k8xzBO3HckuIy7085/SWFJPVBFZ3AwATq4z8fgumhkbDYQFt
	DGgovnbL+1u5Y0XNlMkJ+gJz71zpc4kMFWl0+DIKziyWjxJ7KAWiBUKkNGWntoeHKIUpbfbdd6k0b
	P+5zNHgP/icOSHEwiJSDMmwHRzwrtkhWMo46MWpthqj9QxEzCnPjHVxPclLc2mIuJJ79CR31ZtdWn
	/BtmoyYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6N25-00000005OBk-0D1D;
	Tue, 15 Sep 2026 06:52:45 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6N1x-00000005O8W-1ADp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 06:52:38 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZcP53516926;
	Tue, 15 Sep 2026 01:52:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=2KTGU31cJ9OrmCZmqTyunWZQMLGYl4j80jzTgTOni
	Ss=; b=FL3kl1ZQkDEgyUSxL06lclRIMIKpbxKp0rs/vxiqljcate6eryTICA97B
	6wDWOIqpzCAoob92Tzj3/H+fH+5JuJ5X9YpwM4OHes6a8P8kmmTCARGww4gi4fyp
	MxjsOeBFp7+os+JTQzLD3TLwHXFJAV6l+uWeHVtGCx8Ab/qwn86k/65tSqg7bz4B
	GQz9UwJbMAD7ykaVkRwHYEd1KJyaNQsfQELyoF7ldy7pVbbE4bom5AKikEFeF3aK
	Rmo6MJ8dT7cBdmmIG0h/+CmlYAX+qqFRgGDwEblZcAHscE/yNzlgd9sf1NQaqoST
	zjQhC0gkJNn8dIhuj7jfUG7qZPiVQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011014.outbound.protection.outlook.com [40.107.208.14])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gppxsk9d5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 01:52:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UpYRx6orL2wodJiGZytXbDiWu1YDN0b4RWyQ/UIT5UQVXxuculcyekESPNMnvLdeeScNKerGbNCngI0qDhfi8PLhtAPrsuJhwfQn4xU/Enkwd3R47e8kQlyf4I4QOqLKzxJe58sMiwC4tPnycIs+0SuIdgFEAuTAwQSm9Z67jeKluqpsnCT4dBMxJGzW5AbVPObDZ46N4t0FljfjcEvUANhzuZ9oK9sXYzPBCbgVI0HuKDpISnAikqtSNLfRNhZOTvnVIvWQeqq+gJsy30sY7Rc8XxliP2ip6G7HKODfRvB3SV06L0hjC+fe+B355MoZwraBaEI2R2s3/1eGSTnYRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2KTGU31cJ9OrmCZmqTyunWZQMLGYl4j80jzTgTOniSs=;
 b=eYfV1qlTLKYR4w8maSyyPsoEEKX9JqIvPw6ppAuZCv551ecUQsAaA/IyRo5JtR8QKcQbsZUyhxLPxc6LBlVkBPbwk87CERr3wOX14nJRDrOWYcoxJCAiufwZvIwNRWvsWR+v8pzXxmkfpAXDAETjW5n6cZOgpSQ55qblXrbU6wgjimebb2wApyZHUY+I1v/VXJovH49anHdl/P/29yYMygyEIMUW1X7ERbTvHGi33Q+2R0hi8/0EcUYn/l2y//vScPTI7LRI1fOD0CKmPEnT6x7ws7BCi5kUgn8gBbBmxd6zBvtnwfcqV9llbKY/VJzeZl5Bh9gFUDm4QBDiire4WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KTGU31cJ9OrmCZmqTyunWZQMLGYl4j80jzTgTOniSs=;
 b=wekkgn7zPEKJnwL0vSOABwxkRMq5chWh/O6pU116HtT/9d5SEHb3WbkRZb/h2h6xeOJjUiXDxT+dyuIe+U3OZxdczDx+s3p7wS2QIdfMAUzNZZ0pQBCXy0p4osfvvASBuOHr5uUN3f6A70JrBeb9zDyR/+21TBR49iKZJVvTFA8=
Received: from BN9PR03CA0519.namprd03.prod.outlook.com (2603:10b6:408:131::14)
 by DM3PPF2E1953992.namprd10.prod.outlook.com (2603:10b6:f:fc00::c15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 06:52:30 +0000
Received: from BN2PEPF0000A7FE.namprd02.prod.outlook.com
 (2603:10b6:408:131:cafe::42) by BN9PR03CA0519.outlook.office365.com
 (2603:10b6:408:131::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 06:52:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF0000A7FE.mail.protection.outlook.com (10.167.245.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 06:52:30 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 01:52:27 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 01:52:26 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 15 Sep 2026 01:52:26 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [10.24.50.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68F6q8jp3693318;
	Tue, 15 Sep 2026 01:52:22 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 17/19] dmaengine: ti: k3-udma-v2: Add support for
 PKTDMA V2
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
CC: <peter.ujfalusi@gmail.com>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <Frank.Li@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <ssantosh@kernel.org>,
        <dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <r-sharma3@ti.com>, <gehariprasath@ti.com>
In-Reply-To: <20260810151423.1948224-18-s-adivi@ti.com>
References: <20260810151423.1948224-1-s-adivi@ti.com>
 <20260810151423.1948224-18-s-adivi@ti.com>
Date: Tue, 15 Sep 2026 12:22:00 +0530
Message-ID: <178945512023.2241705.14026756639544516026.b4-review@b4>
X-Mailer: b4 0.16-dev
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A7FE:EE_|DM3PPF2E1953992:EE_
X-MS-Office365-Filtering-Correlation-Id: 042c2307-4817-4829-0f8c-08df12f5e966
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|7416014|22082099003|18002099003|4143699003|56012099006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: ntqPQWTa59x09BP4wxWV3lebfB7gTezpA3Hl4QvOzCX9SuQmo1FbXEX8xIuK1AjYxwJgsHrVUwzo9FJvzFumCnlWwwX6AXYsAleh2Eqff4VXLwV57cgtqgyOcLrnnu5Q9aa0l388tntbKdGtljI2+gCgckJD6W7HhazClGQPXkcM+GhjEmuxknc56KcKA2lcS0WfYk73gDIoIiFwyhqIyYsZG/f/xo8O5NmwMR1f8GaDSTynikLmmZm14SUc6YL8QYmuYsCC1/W3vniTn+gsJK3RIrsdLmgUO8zkZf4G2cQsG4X+PXMm+zjoHuD5gtkUopQWoHu8ydLDHD9aOMYYFH83ZDx6DE9xGVsqaN6OAmwHvZU2LoPDOd5ljFVnN0aQFBmQJHJiRJJj8MQof4xE7O05fyAk7zLhwn+owcfTph+F4OqBL4ZUWrJNxQxzkfs/vQJci8jhpCXLfsWsRpgZqGOw3u8OSw8ja60VVTyZL3BkqdtBpH6DRsVueSqhiiKGXbeq1b8BMG259nNeQlwvgwyQDpbszhnrtCsGtle60J2BX4Nh7HJ1WCr+GlmLI9gSZum92GBQXwiZNRFZlcadlNpXzJkTKxfrQE8ispzMO7+q0olQ0OuyungYyDMt3IluGCmqd7bzuJxSIA0DVUoCg578O9ZXSxBRAVVHr/ej1zCYewimxStt2Z3q02TDNH/Ul17zig6Dqs59eUiwQBJlag==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(7416014)(22082099003)(18002099003)(4143699003)(56012099006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LeMACvkC12oGd9CPB2EtMb2/McXd7+07fmEVFC9u+W9ancdkwTE6TRkKmqPNysJbvSGnePuX+dAHblPKA3Dnl/a5LXJVBy2GO95bO8cwmBqbPbumX4wO2b1p9IkbMAY0/QeCJxkcxjr7i2QKO0nKMncdygV1B0+GSR2+ioxLwfPo8DkyMOpnE96Oo1X5cBKexhTYBCMu8YTw0GiVPznfODaaJtLC9l2au+PjGARyG8PaEeZZnH7IkHeYEsiUQc7L/ZApWTW5WCnulC0vVPQVWi+W1ewacfpIaPKKWaQN4BiTsIbjLgR7JWha9XHY1HA1VXQqsPewik9O4mikU/vHA7I/mcE2oVdLDEm26XQvp0VU83foqSOClRmCYu9DwyfhmYwGhZwdTU1otu3kCUoxUKPBCxEnWXzh+iAAljenv17HQV76r56EtLO+eYkJtgtX
X-Exchange-RoutingPolicyChecked: BYLuFYaaTh5kC0acWMtAElUpIWEY7jH+EV3kxpZipioREcF0I0udqPFC784etA7s3hQOrVgAvmTwg3XqsrNyMSMI7SoAh8OHHURQtLIiQfihknt+wwzIsv1KgpGXoYKCI6CGm3GqCE8FA2ktTNXPa6SBfJ/iuaxQYwTdRw9cVN3C1xmR64+eiJyCDg0ERD1SWyGGDHwmsnIgJYIPTU8heThQqEYH9VI4uznAwg9lon/ANuI3O3PFsJFXfq47KNRaKPGJbrHwppoAPdPZoaakwdu3j/Gbd5bxYIr6zPfVJOqgg7qjRSY/b35Vvw8on4kSMn3TDXUFKDJ5wSdmFFtQUQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 06:52:30.0514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 042c2307-4817-4829-0f8c-08df12f5e966
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000A7FE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF2E1953992
X-Proofpoint-GUID: DRaJGSxzHD-9cf14AM3jq_nDU4kNcdip
X-Proofpoint-ORIG-GUID: DRaJGSxzHD-9cf14AM3jq_nDU4kNcdip
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA5NiBTYWx0ZWRfX9ABhjsWFLNBw
 B2zKQDXB3oXFKFD4JBOJEl+Kh4oIBOGn1354W3/KXoxI5/53q+lftGtW9WyUB2KiJVrIODXhC8u
 ky1D0NsNpsCFI7yF1bApLjFyZuxVK1aGGNbrrDNI56evazcWcW8y9uhHK5YOsgaCXa/xViDE6no
 c6pfdDHK6LuxQlcOdTMuuj+fPZLK2B6gptEzBvkrlFA4VC4wuNx/DnBu/5cCTzwYbFERmYlejXz
 AOh3OmGQ4G2JO16aDtqcSdYXSU4VEH702WwGjdkiVZaPdMLNeTpzGXRToERzkwknwqIzHNM9AgB
 RtEAOaXKuLxldjad1CwaJClzqQDJ3g180ClufiLWXjgNVQv0VMOcn75iqjk5EHih7mZZOgpCs3G
 5CxOzD+DgYUivzSTZukKOQ4uofIqlnNHE8IkB/qNG6PDjizTQUiTfpUMQzQlkJSMerTRjOpZTw8
 km7K4mknlGJnzLihNrA==
X-Authority-Analysis: v=2.4 cv=bYP+w+PB c=1 sm=1 tr=0 ts=6aa8eb31 cx=c_pps
 a=RGFq7D/WLd/IouGP2/vkQQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8
 a=re0Qqsd6zypS6EQrztAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA5NiBTYWx0ZWRfX5556zNi7bU2G
 Z9JnS6uTg/5Xpn99xpK2YAUbPP8ZYcVZsBmlCBomHzuxLUT/0YMuEFKD3C+wzHbH1YV2UVyUZbs
 +1sSl4+qRdew09xHWavdY7+cJ9HQk9Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_235237_338424_19E0B347 
X-CRM114-Status: GOOD (  23.13  )
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

> The PKTDMA V2 is different than the existing PKTDMA supported by the
> k3-udma driver.
> 
> The changes in PKTDMA V2 are:
> - Autopair: There is no longer a need for PSIL pair and AUTOPAIR bit
>   needs to set in the RT_CTL register.
> - Static channel mapping: Each channel is mapped to a single
>   peripheral.
> - Direct IRQs: There is no INT-A and interrupt lines from DMA are
>   directly connected to GIC.
> - Remote side configuration handled by DMA. So no need to write to
>   PEER registers to START / STOP / PAUSE / TEARDOWN.
> - Unified Channel Space: Tx and Rx channels share a single register
>   space. Each channel index is specifically fixed in hardware as either
>   Tx or Rx in an interleaved manner.
> 
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
>
> diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
> index f9dd6edf3eac..d5d7158a37f8 100644
> --- a/drivers/dma/ti/k3-udma-common.c
> +++ b/drivers/dma/ti/k3-udma-common.c
> @@ -2461,9 +2461,16 @@ static int pktdma_setup_resources(struct udma_dev *ud)
>  	ud->tchan_map = devm_bitmap_zalloc(dev, ud->tchan_cnt, GFP_KERNEL);
>  	ud->tchans = devm_kcalloc(dev, ud->tchan_cnt, sizeof(*ud->tchans),
>  				  GFP_KERNEL);
> -	ud->rchan_map = devm_bitmap_zalloc(dev, ud->rchan_cnt, GFP_KERNEL);
> -	ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
> -				  GFP_KERNEL);
> +	if (ud->match_data->version == K3_UDMA_V1) {
> +		ud->rchan_map = devm_bitmap_zalloc(dev, ud->rchan_cnt, GFP_KERNEL);
> +		ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
> +					  GFP_KERNEL);
> +	} else {
> +		ud->rchan_map = ud->tchan_map;
> +		ud->rchans = ud->tchans;
> +		ud->chan_map = ud->tchan_map;
> +		ud->chans = ud->tchans;
> +	}
>  	ud->rflow_in_use = devm_kcalloc(dev, BITS_TO_LONGS(ud->rflow_cnt),
>  					sizeof(unsigned long),
>  					GFP_KERNEL);
> @@ -2562,13 +2569,21 @@ int k3_udma_setup_resources(struct udma_dev *ud)
>  		}
>  		break;
>  	case DMA_TYPE_PKTDMA:
> -		dev_info(dev,
> -			 "Channels: %d (tchan: %u, rchan: %u)\n",
> -			 ch_count,
> -			 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
> -						       ud->tchan_cnt),
> -			 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
> -						       ud->rchan_cnt));
> +		if (ud->match_data->version == K3_UDMA_V1) {
> +			dev_info(dev,
> +				 "Channels: %d (tchan: %u, rchan: %u)\n",
> +				 ch_count,
> +				 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
> +							       ud->tchan_cnt),
> +				 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
> +							       ud->rchan_cnt));
> +		} else {
> +			dev_info(dev,
> +				 "Channels: %d (tchan + rchan: %u)\n",
> +				 ch_count,
> +				 ud->chan_cnt - bitmap_weight(ud->chan_map,
> +							      ud->chan_cnt));
> +		}
>  		break;
>  	default:
>  		break;
> diff --git a/drivers/dma/ti/k3-udma-glue.c b/drivers/dma/ti/k3-udma-glue.c
> index 686dc140293e..bec4deb480e6 100644
> --- a/drivers/dma/ti/k3-udma-glue.c
> +++ b/drivers/dma/ti/k3-udma-glue.c
> @@ -166,6 +166,29 @@ static int of_k3_udma_glue_parse_chn(struct device_node *chn_np,
>  		goto out_put_spec;
>  
>  	thread_id = dma_spec.args[0];
> +
> +	/*
> +	 * V2 PKTDMA DT specifiers encode the hardware flow/channel ID in
> +	 * args[0] rather than the PSI-L thread ID used by V1. Resolve the
> +	 * PSI-L thread ID before the common path checks the direction bit.
> +	 */
> +	if (common->udmax->match_data->version == K3_UDMA_V2 &&
> +	    xudma_is_pktdma(common->udmax)) {
> +		struct psil_endpoint_config *ep_cfg;
> +		u32 psil_thread_id;
> +		bool dev_to_mem;
> +
> +		ep_cfg = psil_get_ep_config_by_id(thread_id, DMA_TYPE_PKTDMA,
> +						  &psil_thread_id, &dev_to_mem);
> +		if (IS_ERR(ep_cfg)) {
> +			dev_err(common->dev,
> +				"No PSI-L config for flow %u\n", thread_id);
> +			ret = PTR_ERR(ep_cfg);
> +			goto out_put_spec;
> +		}
> +		thread_id = psil_thread_id;
> +	}
> +
>  	if (dma_spec.args_count == 2) {
>  		if (dma_spec.args[1] > 2 && !xudma_is_pktdma(common->udmax)) {
>  			dev_err(common->dev, "Invalid channel atype: %u\n",
> diff --git a/drivers/dma/ti/k3-udma-private.c b/drivers/dma/ti/k3-udma-private.c
> index 44c097fff5ee..92d44ef9593d 100644
> --- a/drivers/dma/ti/k3-udma-private.c
> +++ b/drivers/dma/ti/k3-udma-private.c
> @@ -174,16 +174,20 @@ EXPORT_SYMBOL(xudma_is_pktdma);
>  
>  int xudma_pktdma_tflow_get_irq(struct udma_dev *ud, int udma_tflow_id)
>  {
> -	const struct udma_oes_offsets *oes = &ud->soc_data->oes;
> +	struct platform_device *pdev = to_platform_device(ud->dev);
> +	char irq_name[10];
>  
> -	return msi_get_virq(ud->dev, udma_tflow_id + oes->pktdma_tchan_flow);

this is need for K3_UDMA_V1 gen to continue to function. In fact, you
bring it back in 18/19. Instead only add whats needed for K3_UDMA_V2 to
be functional and move this chunk to 18/19 where rest of the glue layer
updates are made?

> +	snprintf(irq_name, sizeof(irq_name), "tx-%u", udma_tflow_id);
> +	return platform_get_irq_byname(pdev, irq_name);
>  }
>  EXPORT_SYMBOL(xudma_pktdma_tflow_get_irq);
>  
>  int xudma_pktdma_rflow_get_irq(struct udma_dev *ud, int udma_rflow_id)
>  {
> -	const struct udma_oes_offsets *oes = &ud->soc_data->oes;
> +	struct platform_device *pdev = to_platform_device(ud->dev);
> +	char irq_name[10];
>  
> -	return msi_get_virq(ud->dev, udma_rflow_id + oes->pktdma_rchan_flow);

Same here

-- 
Vignesh



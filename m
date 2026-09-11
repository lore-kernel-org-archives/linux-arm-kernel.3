Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8DEC88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 07:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rJIVvU/QnJawGMlEpACBeC1wr34wgBuiOTG3BVUuUc=; b=KyCW+PXxJ4kuID3oErHm92iWRA
	Oj+LhK3KqzhMUPV2DY0lwURn0KHs4+fEtyXoa3mLX6O2Hulx/TQUvk+pYyQIGKdnEg2Q01c97imgW
	CF7dy0yhq4ISfMMIGJVvSySEjsBsh93dGWEj6IfzZMOiaM9Y5qMaONvcIJGqfuarnoiDzmfCP4+g8
	whlTMWQBaX+w6aZgZlAtll9tut4C1xL2xRnDvA0PxPrDcqqEFZlzmPlB0HoyLi2FvBkqIfnjUr5b5
	dVlFYh8YLwalnXK6vaj7vdKTmfZ8kGW39pfVh9DhVySLH9ZuErztg4gRKSLyELFdds9DY6IfC/K+M
	fM/ofLPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4w9u-0000000G55e-0lMw;
	Fri, 11 Sep 2026 07:58:54 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4w9q-0000000G550-3Xv4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 07:58:52 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68B7noqF3305002;
	Fri, 11 Sep 2026 02:58:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=6rJIVvU/QnJawGMlEpACBeC1wr34wgBuiOTG3BVUu
	Uc=; b=msPbqX3c9xleNZ3rjZcCHegAo0rT3nz58VfzPlhZfd2H9F93np+y/6WIJ
	CQX2pEbXLR6WYHrj+fyoJeQOKfNbHt3IzGpEq16LpK+t/fspep46AztAv5PzpTUZ
	Pm+KeOYD6juTjMA/J0qYYSiEZ2RcCNUxEg+jXaH+T403P62nHm+GW6ZHxnij1yRM
	OIQhu3gLi/SjGKmijw7y6JyO5Yz+BS2Fl+R50ny66vQig6qtTItlFeS6nTqlZTOC
	Kw1FJNzeY/pLpbtejo9e911idey+0V3WubopSZTqGMIKrd3DGEJMQ6VopaSBwXZV
	JutVtc71a9wkuiamiAwmq7p8m1c/g==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010039.outbound.protection.outlook.com [52.101.46.39])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gm3yyu335-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 02:58:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a3erFWwcWNP4vtXPxHm8ggfIoqPm1Ax0trdPHxfrWjnYMSD3kdU4AEmJ168aiBRdIP4KYVpJ/9Rl1HGhMx52gSAZTWcK1N12MQK78nmKz0G6i4SVvbgNGgBSprpanHbJneoaFYMHX1ga+YtfVpGz68f4uhbaKGx23KOrHbul7oiFJNFYfPiJGNEoxd9fhmytEJm9P8nhBnNVz//+2B4i8rrJZFqJGG1inOYpeYunsu9cd+5mgwQFkgghbWslRzSg5aOc8PJqcGTtzXXPiwAGUcmoUiEpTqOXA/hl6HIORyRf3yw7MX8ABx8HNZZRuRXQu15uJcw09XbcuoztND8U5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rJIVvU/QnJawGMlEpACBeC1wr34wgBuiOTG3BVUuUc=;
 b=eLUPujGYhBzQGsGIqvLM25BfXFAEdjiGURIAlWfXGh9Cq0sJ+CAezGiAOEfRJDUk8MvXbDFR2Txi67VZqRgDbi1LixYp+wzpsVAhjmnlPZLkeX84s+s6sEuBXOfCIKIyFvhiQ88Cl8XzDIME4tSbXswrdbwbEkLMyIQN2C8P9qfxjoCwGTfL+1HQgXHwR0G/5kByRGx2HEV6tG4d3lvNtym48UoFY1QEn1iA0BQC+AuB3MCQPW0ATr3JoxmHsPxAkFwNA4YGW+auHcDOeWOvK9yB/sQxSgcpUWVAYHHAHniq+sUTldEHo1/1QUXuYDXzOgfwmeN7+EdCAa61N5LHcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rJIVvU/QnJawGMlEpACBeC1wr34wgBuiOTG3BVUuUc=;
 b=KpDhBLJ6/1YmxlFtodjl8PNVFXyJpkjPVQ9j/OoAM3x78gtsBKmRrWRTyR8Qz4MHZ/CNYudxCjrZb4eVJXhy2skrS+XcNut31c6GmZyJitLjZ3RyQP3P1LOyqvzLyOaYG6dgV4ISzv1/sG+oXFqUyi72O3nOM0Fm15tsJGR+0hY=
Received: from BN9PR03CA0951.namprd03.prod.outlook.com (2603:10b6:408:108::26)
 by SJ0PR10MB4782.namprd10.prod.outlook.com (2603:10b6:a03:2dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Fri, 11 Sep
 2026 07:58:29 +0000
Received: from LV8PEPF00000068.namprd03.prod.outlook.com
 (2603:10b6:408:108:cafe::5c) by BN9PR03CA0951.outlook.office365.com
 (2603:10b6:408:108::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Fri, 11
 Sep 2026 07:58:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 LV8PEPF00000068.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 07:58:27 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 02:58:04 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 11 Sep
 2026 02:58:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 11 Sep 2026 02:58:04 -0500
Received: from [172.24.18.81] (lt5cg60819vj.dhcp.ti.com [172.24.18.81])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68B7vxds704000;
	Fri, 11 Sep 2026 02:58:00 -0500
Message-ID: <9a1146e9-0c00-4348-b1a5-31be7c597eea@ti.com>
Date: Fri, 11 Sep 2026 13:27:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/15] arm64: dts: ti: k3-am62a: Fix MMC0_CLK register
 address
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Garrett
 Giordano" <ggiordano@phytec.com>,
        Wadim Egorov <w.egorov@phytec.de>,
        "Robert
 Nelson" <robertcnelson@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        "Nora
 Schiffer" <nora.schiffer@ew.tq-group.com>,
        Stefano Radaelli
	<stefano.r@variscite.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah
	<m-shah@ti.com>,
        <u-kumar1@ti.com>
References: <20260909214743.899477-1-jm@ti.com>
 <20260909214743.899477-2-jm@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20260909214743.899477-2-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF00000068:EE_|SJ0PR10MB4782:EE_
X-MS-Office365-Filtering-Correlation-Id: 40ee0296-c5b8-4511-0a50-08df0fda7663
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|36860700016|82310400026|13003099007|6133799003|10067099003|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 6oopk7EoItgW8kduEMQ/EVfYh52J7OZtmG+qErBwMXTlZ4MD6GOwaC73c6xM+6msRp7z6z43zRszVdkbdWjOZmQJcAYe3m5tE4QdEKhRCYN+AHOPCSvo+T6mVMNrIs8+3GLKw3k89jA1HqX9pDC65meJRZrBlhIsmgu1zduD2ITmG9D2yFl1DouWwCnlN+HGM7jp+PyC9UbghrIPeEXv52cGYrEv/+ipGL+UaHBsXgKJzcpx79ovrW2B6pToITEAprOHFFmB7oX8zn6Lt69bw0YUp6WYUT9KSUM2Rp9f40Dri4uC7L4xodgJwT2MrBWzh//V03VjXYoUulC760A+E0nLOusxR7pTuWqjsLdVU7h8stoGcduBzlRKOUs54PVUSRT5jkn1JRQeKjLP/8P4/KZVfZlKU7xpINYzRzn0/4+6/xL7iZ+DR/L4v8TCsNZwbVISApHinnCOf6G7rtXC6eiktwsh3zRlDH6K2XW+DkcXRDq4m8hJz7OohFghLAyBqEYjcA2e25qqGfDe+OaiNq6xuGqqMGHBEs6nDoE7pWfkgPam1uQv8ttB4iVrQXTzydnQWpKnJa7oqCVP49MIqjaAd+MbiOsnv4/gGBp/ita8AaZQ0ctexzYmcXc3CA4dAK1FjLcu83n5NYqVGyPrKrn+E21H8f4PZI/Smro4Dlv/aGWtOw2/NCyzSb4VUxGCQp4W4OX/fOav1+n/H665bg==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(36860700016)(82310400026)(13003099007)(6133799003)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: KO4o7ZszSGVV7fXWDaJ+wEYDzK6Ei2qiek8BQwnfefMv/GkxaakxjbMquQv5lzJ/hGJvbT+ITCzk9j8g21esmfzj1U8sBUhofByH1+CEqM302QTgt9oLk4YgER1Ayyw3cyE5lWY5gpxVNHWzlkFvc954cnxtd230zxB0H1ZFxCyo/zxbOCUzNsaWE4I5K8pbxqfE4iv+ehkiyCXfKOUHXA7ub6p8wLSqpvND8y9iOCfbEsmfgV6DKdd8U5xd/ZCFF7ObpYd1FIfAybAUDOp/ZwIYQb+PYb2sOqh+lIeMgVMXFlkns26rnMh8BWTZI+Vbgm7V6vEr8CihKFsu1i5LQZCqgTpy85BRKEyq2nKxgb3uU1N7hJeluo6W0uH/9lHXlWGoA+k6OyJqioUhsZZW6GmKyZT714uFkbS01ujb5WhBjWF5/tl0zb491jEH7M2q
X-Exchange-RoutingPolicyChecked: e3+SpebnCAtz/RoJPLDUgsVAYaGUL/yhahmQWiC14jDBGcRAb4naLVWDcK1HC3fwbccdZM2ULtXgt+q2H8Zk75KoLEXoNRIA0a6arING6oTGy4rNtjkVBn8aglm6Jz4LgeVmKLRACb7PLtASbFo0Jw/6IRPl4HPxD8knVjrf1W35Qjs/a9lUw3sMpA8+N9HKMlnCvzimqBQVRKS54+FZO7rqAsrjcZqK6ghN5xrFrE5NUMQEh3hdrwK9mRy4t4vveQXhzzD1fnkMw4U/JYyCMGlfIdG7DA2fQTDXmkirkg0OfwPPLzK4DsYnQkW+rLGTmDBDKCqE3R4t29uXHMGAhg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 07:58:27.2118
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ee0296-c5b8-4511-0a50-08df0fda7663
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: LV8PEPF00000068.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4782
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDEwOCBTYWx0ZWRfX2zsdD0oIgFIn
 bfQX8Zj30dYOjZkrdzOQZIpHMYUSKr3TIlXL0+a1qQOFRnJHQiuJ3k2h6nD3UkxXi0OAV6DHzc3
 LcAUUPioaiUpluYgX24zgs2JVlMbVb8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDEwOCBTYWx0ZWRfX4+rowjM1x3cs
 0cY1DjPIhjTtC2/ADi6b+TTIjMbHJzDJfiwblCavhOT9XejCmU3hBgavSWfRivINf9SZ+n5jaag
 oYtkMZ+UeYXhn08aS4t9iHoRzRIJ8741dRTw3nXoVFmYQ5ORfMPCpi0EAj/2kd2gWDOKBCA/Vtj
 uB0BscjwzUtClmACRs7tYzb8n+m2UKd04NnUsvrq8YztfAxxQVCylVPMuDutJPaCbQGPLXpNUg1
 v/mENL0L4B60+eyq5X8cdiaURHxUUu45AW5SrY4meKkJu02+/saWlARSQ2WbzJdwyCybK7qV6wd
 +34OdOMZMQxpxzB9ktbgHb+ZN6TKPWCNzjc6i+3mrp9kTcpPlxyTmWkIqQ428pAqI5cYLsa5OQa
 BKNL5vxijAyru2HySw9SjD1ae5Eqw/nP0m0TWSxu+AE7iUxEB/TMeXRtCxr1rN2B18WR+ebARIA
 hVLjXRTJNKpihdEKj5w==
X-Authority-Analysis: v=2.4 cv=Y8FtIReN c=1 sm=1 tr=0 ts=6aa3b4a7 cx=c_pps
 a=yHj7y5KTVbbUXXBv8k4PkQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=VwQbUJbxAAAA:8 a=RJAoOCWOlL6yMAF2ZMEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 9lzpO5IHvH0-84E66tcPiCghlpFLeoCn
X-Proofpoint-ORIG-GUID: 9lzpO5IHvH0-84E66tcPiCghlpFLeoCn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_005850_923516_6FE3B67F 
X-CRM114-Status: GOOD (  14.00  )
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



On 9/10/2026 3:17 AM, Judith Mendez wrote:
> MMC0_CLKLB and MMC0_CLK have incorrectly swapped register addresses
> as per datasheet [0]. Set the correct MMC0_CLK address and drop the
> unneeded MMC0_CLKLB pin configuration.
> 
> [0] https://www.ti.com/lit/gpn/am62a7 Rev. E: Table 5-1. Pin Attributes
> 
> Fixes: e041ec6e86e7 ("arm64: dts: ti: k3-am62a7-sk: Enable eMMC support")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Judith Mendez <jm@ti.com>
> Reviewed-by: Moteen Shah <m-shah@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> index d3b3675e7a8fc..b04636cab71c7 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> @@ -328,8 +328,7 @@ AM62AX_IOPAD(0x0b4, PIN_INPUT_PULLUP, 1) /* (K24) GPMC0_CSn3.I2C2_SDA */
>  	main_mmc0_pins_default: main-mmc0-default-pins {
>  		pinctrl-single,pins = <
>  			AM62AX_IOPAD(0x220, PIN_INPUT, 0) /* (Y3) MMC0_CMD */
> -			AM62AX_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLKLB */
> -			AM62AX_IOPAD(0x21c, PIN_INPUT, 0) /* (AB1) MMC0_CLK */
> +			AM62AX_IOPAD(0x218, PIN_INPUT, 0) /* (AB1) MMC0_CLK */

Shouldn't be MMC0_CLK be o/p, instead of  PIN_INPUT
Similar to patch [0]
[0] https://lore.kernel.org/all/20260909214743.899477-4-jm@ti.com/



>  			AM62AX_IOPAD(0x214, PIN_INPUT, 0) /* (AA2) MMC0_DAT0 */
>  			AM62AX_IOPAD(0x210, PIN_INPUT_PULLUP, 0) /* (AA1) MMC0_DAT1 */
>  			AM62AX_IOPAD(0x20c, PIN_INPUT_PULLUP, 0) /* (AA3) MMC0_DAT2 */



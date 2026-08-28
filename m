Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E388EC61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 19:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VdD5B87MHaJydEa3ojVUiWDXjNc1ZfIrdVgUK9mGrqM=; b=AFwE+bUF1U/KN/636eTsOObyoK
	un8c6m1TwiEydk+tY/C5vDSByGHzyV99tGd3WxYEn7+9S7ZNh1x5FA1fd8Ac7sKqpEht5pyWHDcVF
	tB7AOaxCc4xTc4CS4/cy8O+drrsI2SkxaKEeH5zzYaNi62ob3ynoNTM9fYWiOrRqLAphQ4YSQKBzB
	zWOKWPZoeLVt49npT2ym8sraabhz4vw49w4vl+5JQR2/uOQPUVsnxG2dMOPz9WR81OSMPae2wtzKB
	X+UZLoudHU1spxUNkvecZdR8V2g4KQlId2mlrZoGBur5lIqSKIyfj/Mj9YP2Y4VsF21K1z8LqyH81
	OJlTorDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x02cX-00000006NYu-0Nhq;
	Fri, 28 Aug 2026 19:52:13 +0000
Received: from mx0b-0002e601.pphosted.com ([148.163.154.28])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x02cT-00000006NYa-2Xqv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 19:52:12 +0000
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SJ4tjH2057190;
	Fri, 28 Aug 2026 14:52:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=VdD5B87MHaJyd
	Ea3ojVUiWDXjNc1ZfIrdVgUK9mGrqM=; b=qS+QCKlET9aEBZRZ9OI7Wb63aceKb
	Bg4aEjRF8q80sOrdAttPLuG4EEIYFbVUqDIG9EMAFo5Jyw+1FQ0YZ/heT1uhW2Hg
	gkr+MI6r/FqctDDdD9D72+EGtpMo2ob4HHpFuxX/ts4rU+43A1qhoQt66gIHh0jN
	FJy5knrAXQulTAk69aFpRAZD4Eb/n4wQrXMsM9gYiOOnSxzRRYMTlYNzvcFyl4d0
	zh/7QlCILFJQKLHTwcnZeMDTIFDsC4iB2CB/rLzezyLXHDRq/GSEuQTCGMCflfIr
	TzRc1bGIuRHqss/1TYUyRQQV6uI8Xj3FYjBbBVb39ktogKneVlr8Q800Q==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012060.outbound.protection.outlook.com [52.101.48.60])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gb24r5ft5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 14:52:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k7sObqK1r1lswSD0aWFK1be9/0D3fIO0C2DolmBc5dP9L/Ux+62OT0A6vAVqhAq7BUhyM8Dc4q20xRaUi3Jz20QdRIx2754APmDBbgO8lW8Q2MpX5YVJtuHPWyfUUOI0akhO08ak1Y7E4sK8olgjMjaogjRFXQPe6wxG9SLF/qayLVo6J+o9mpIItk7+1sbCDyO9Jr7VUrE5Mb/lvzYE3VomxBCbkiEUI++5D0fqqUmOK2WvDRIoC/7p4iScY2a3gyEg5LfzXNUo2ED8YHySmGQWTmmr7NPhnqon2fqhPtVsrGmlJ53H85FDTZ1qziF4L7Nnd8zgV8MIKyg99g6jfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdD5B87MHaJydEa3ojVUiWDXjNc1ZfIrdVgUK9mGrqM=;
 b=B/NFD3nf/1+bPJQOrCMgDSH0f4XN6pOHFDn5DRSiQx29nzIl45g1ZQ1PkJsIoJK+DFKgn0gEc9RxfFIt274oSZiFhbDPFbbGUEE+K0312D71U7uITsC/qvdOeH7ucRaRt6OIevUq+cCHldNPgPCIQHtcRQtxaaR8oh5jq4LEAHo0WrPQQIf7syK1FL0Ry07KJlkK1qbbwpDbkOegbXM21nZtXehXxjjhLy6OsUigjkEiSphonQ4yba2pvL4e2GfrxFQ6lneVBMKygOgbFSKVyJKzK6G0+eUycvgAfkAWzmmNCwhMO9HbFEme4Qet5tql9/LqF5sIaY6vk/vAqTHpXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdD5B87MHaJydEa3ojVUiWDXjNc1ZfIrdVgUK9mGrqM=;
 b=O1bFUX93muSTKhOSBoegeOub8Hp3dwzszbJiYhgSqOs/tyZi/2aeY8j91zomhlaKEOKWbkwutgKKmihZbqpMkViPrbRP9eMwUTX8Ze2Z46eF28ydYEYW9u3QDf2fDyCVKwWZVSS680Ho9GiD14B7l1UW4/skSSCrYx5NRZzb+SY=
Received: from SA9PR13CA0126.namprd13.prod.outlook.com (2603:10b6:806:27::11)
 by DS4PR10MB997645.namprd10.prod.outlook.com (2603:10b6:8:31d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.9; Fri, 28 Aug
 2026 19:51:58 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:806:27:cafe::39) by SA9PR13CA0126.outlook.office365.com
 (2603:10b6:806:27::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.8 via Frontend Transport; Fri, 28
 Aug 2026 19:51:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 19:51:57 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 14:51:45 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 14:51:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 14:51:44 -0500
Received: from localhost (uda0499903.dhcp.ti.com [128.247.81.65])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67SJpiUp224117;
	Fri, 28 Aug 2026 14:51:44 -0500
From: Jared McArthur <j-mcarthur@ti.com>
To: Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Tero Kristo
	<kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, Nishanth Menon
	<nm@ti.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Jared McArthur <j-mcarthur@ti.com>
Subject: [PATCH 1/1] arm64: dts: ti: k3-j784s4-j742s2-evm-common: Set ACSPCIe refclk to MAIN_PLL2_HSDIV4 for pcie1
Date: Fri, 28 Aug 2026 14:51:40 -0500
Message-ID: <20260828195140.3476062-1-j-mcarthur@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|DS4PR10MB997645:EE_
X-MS-Office365-Filtering-Correlation-Id: 85d7d40f-65e3-425d-b1f5-08df053dd168
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|10067099003|56012099006|18002099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info: S0j2JUoMrO9IuSR43/G1yNhVZEFvU5TcWIBI0WVlVwPpemInIi0Vuufso9x8mz04c/6ksN3447ukDuhLqOzKf7rUXTfBq8v617G5aUCArDYhtCnGTZydkPPcl1xqBkjNzPdNxDT1AN1J+KQwJ7ZXPnz9eLcJpy3J/YUB7x2/T2QHCHv0MZthYAalAIy1vdJ9j/YW5KN2lgnPzeA9ogBcZqL5byMsCDfZ/tSpQJqq1NCjwS54NIjuMH8x4hwhwMMmrTHh7lwfrhHEG45s3mbKe5cBdfT+p7pEZIOBUKI8fJFTXzksbkaltXiJPSSYVeOG1R6tbQHHpuK6iycicAb9g6fx8ascF7i4eHuv7qqkt+O6MOhklAjcMkVdXB1zYwBy7Y3vF9J6BvahbFHBuqcxmIRSdH0GnAXF1tcbAekJqpQuuwv8c8c5/EQ9lLzc2rhBBEEWCXqBI2b6+LBiFAb2ZVXg4Z41blijaJovM5cVbgOA7tXH7hsBJJmhzh6QOTJOdu9V3mqFzSHw6yAnYbQg9e6EyIsxI1TfwD9SZ0RBwWCGhlMsbomcdnh2kADPclBVwnJygjB6GQT29rbVZjocCG95020E4Z/rA1t7cczvzJrlIrzvdScMsHlSt6Ay/fmG1XQUWcThahHhupRa2JUDHw==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(10067099003)(56012099006)(18002099003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: BY9e8qK3AN1Wk/V/ebIrhd7lrUMT+aKk9vjGOXggwX0UqWHh6fgCX46nZMbD68jiqylu/xoXGbyJwrl0MyzySJBDAxOUyekGPGwBOozh2VsYgdMJRNPOApwORwNmNRWJVJvXMoxIFE8CepYJdHE7JsmwyJJjPfncJj0hV1bYhQhxDmALeeHAveUSK4w3tOPEyUBKrwAPmDcGzfoorhe+8PP/Ikf1STIVYadK6WYpm43sKSPMEX7b3mekpi4qW/dOIpmyLUCoA+LUNjsbIt/mZ+71FCpUbx+llv5KzbDHgTo0ii8kX57kMKRHhrNiW5xeDw1hXOoLhB8kmp4CB/3Roa0qDp3GogtdksCoo2xjCe+D4Igp3D1enk2Kq7PWMf+tKn2TUiHjFwblyhm9gPHyzcmS/ybz4kf/63N/B6r2C4ZU0+lbw3Yl5nZKrk2S/F1k
X-Exchange-RoutingPolicyChecked: j3twGhA1rPUsGb2zAN6G75Ci9YgemK7tuuNo3Z+iAi1UuPmBK3U+tRM7AHErPt5UU8bCkcZGZFvtHQe1RVSB3/elfIYmLjeTGKYLmyIKuBeRb0SCiRRRaSWXKyXB636TOuq4Vl1ccq/lrHvyLHd8+KGxoeKfaPre9nhTdkJ6Nox8jk0fvOFvcrykNDLsZIS4o+kmFpuE+gseB/IoqwH/MJKOpchKj76EEsF2lJj5lWA7yOLlT19CR2Uc9YYyE8QJgmHiAZ228XUEvNeWqzd5sXyjPlou4DPHBRxJIiw+4E4YJ+BnpRiIdvTFWpQxJb+x0mKl3/rhrtOHX+eEUqDDvQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 19:51:57.3563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85d7d40f-65e3-425d-b1f5-08df053dd168
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR10MB997645
X-Proofpoint-GUID: u0pE4__ZSdCGxNL4ElMTvNEEy7tJK_si
X-Proofpoint-ORIG-GUID: u0pE4__ZSdCGxNL4ElMTvNEEy7tJK_si
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE3MyBTYWx0ZWRfX9llp1tJDQ1tY
 ZVHI6H+GabJp9r5E/sZLOdpYgY9htt9RaaBZoDLQMW27hk2GYQhifcxkc1+wNe+ZO5rrKF42oe6
 c+AQpwMs+E5ZHCTdPL08q965YtYUsUb9RKWIT3K+g3UR01qy29/8UoNMqIIQ7MaculfKdnZ04qH
 tsHhkpGtP0eRCX1/RyHdo7RVyNYRyxD2yVMUkQxHXQmdlWONZpvUYUUnNb6doXT7gLj/QnFehBN
 6CXXuddzL5jfoR4cDmKe0w9GDrAl3YFG/IQIiMAPQ2MMDcfWVDob9sicTStSffP3GWQ+Zx0RqDc
 P5LoWeDmlqBBCZt7fpqoYZEWThxJa4M+PnGIznpV3K3n6GyYQX6U8xwduCJEqIHffOaEhEvdJEh
 mtG7z78CWfMtkzo+W7hA/7xalxybjmbpeRxt2bmWNqODCHs/C+n9sXHjVfn5hv4oQaQ6XtQh9tz
 lDvY2eSXAVaniZGhZgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE3MyBTYWx0ZWRfX8t2XOWbFa6Zq
 Ld1InT7/Ryl5xgzT2AYZmHbalWgWQ1/4aA4iwsXx3Zf5JrUPszT9enWdZWOUaJAt/3pNReA2l6l
 ZYyGTwH8RjU56cESx7Gbun02Y9vJdO0=
X-Authority-Analysis: v=2.4 cv=L6gtheT8 c=1 sm=1 tr=0 ts=6a91e6e4 cx=c_pps
 a=MzitxtHdenuwXKuz6QWlPg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=PkNuEQ9giEZp3O13ll4A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_125209_861848_79EBDE7E 
X-CRM114-Status: GOOD (  13.27  )
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

The ACSPCIe buffers provide the PCIe refclk for external
devices. The ACSPCIe reference clock is muxable between multiple
sources: SERDESx_REF_DER_OUT_CLK, MAIN_PLL2_HSDIV4_CLKOUT, and
SERDESx_REF_OUT_CLK [0]. On reset, the refclk is set to the
SERDESx_REF_DER_OUT_CLK. In the J742S2 and J784S4, "the SerDes PCIe
Reference Clock Output will be temporarily disabled when changing Data
Rates to or from 8.0 GT/s in Derived Refclk mode". Some external PCIe
devices cannot tolerate the reference clock being disabled and will
therefore fail to link.

This advisory is described in more detail as: i2242 of the J784S4
Silicon Revision 1.0 (Rev. B) document [1].

The refclk for devices connected to PCIe1 is provided by the ACSPCIe
buffers in the J742S2XH01EVM [2] and J784S4XEVM [3]. Work around
the advisory by setting the ACSPCIe reference clock source to
MAIN_PLL2_HSDIV4_CLKOUT. Use the TI SCI clock controller to assign the
clock's source [4].

[0] https://www.ti.com/lit/zip/spruj52
[1] https://www.ti.com/lit/er/sprz536b/sprz536b.pdf
[2] https://www.ti.com/lit/zip/SPAC001
[3] https://www.ti.com/lit/zip/SPRR458
[4] https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/j784s4/clocks.html

Signed-off-by: Jared McArthur <j-mcarthur@ti.com>
---
 arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
index ff3a85cbc524a..7c085663c8880 100644
--- a/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j784s4-j742s2-evm-common.dtsi
@@ -1206,6 +1206,8 @@ &pcie1_rc {
 	status = "okay";
 	clocks = <&k3_clks 333 0>, <&serdes0 CDNS_TORRENT_REFCLK_DRIVER>;
 	clock-names = "fck", "pcie_refclk";
+	assigned-clocks = <&k3_clks 415 0>;
+	assigned-clock-parents = <&k3_clks 415 2>;
 	num-lanes = <2>;
 	reset-gpios = <&exp1 2 GPIO_ACTIVE_HIGH>;
 	phys = <&serdes0_pcie1_link>;
-- 
2.34.1



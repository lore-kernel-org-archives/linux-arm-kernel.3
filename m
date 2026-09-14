Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8513C88E73
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 21:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wzXDNHzkZB8sexU6jG4nGAgCqdzfeRwYHiu0SFlDJ3M=; b=o0EZcC4DSy6/QYYtXwRfxQg7xw
	g6wxwldwym+sRzGHw/ryoAOjrxMzpxAFTemtJZTwO5lOpgHQ1PyKAfiPuPu/0fBtMUip1wpsVYv93
	BIiM2ti9riMBTppcE/oYeimIwFd9OIz1VGHPXyYKxmI4GUW3aCHOCQtrbgVP58soEzafQtgY3/TOo
	Ux/5uHS99wrpI1OREYyQ2Yj6nBDipEIt3xrV7oBw+/ZPyZY33pgTHhajIUFzg3GGOaNke65fvljFt
	WWT+Lax9G44TkFvYbbaJgEn6nEVywZarQFj5B1j5A+U1J0ldfvfEMg5pkAuwOv1nlcsBd3AHTHKi7
	udTN3Wzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6EhW-00000004kqo-3wGu;
	Mon, 14 Sep 2026 21:58:58 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6EhU-00000004kqP-02Rt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 21:58:57 +0000
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68EJaJm04080957;
	Mon, 14 Sep 2026 16:58:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=wzXDNHzkZB8sexU6jG4nGAgCqdzfeRwYHiu0SFlDJ
	3M=; b=nRzvBs37yQCdnnNckuFmDUbXEgHilX5zsXMIaJJ6Rjbmuy9LQ9K5mFhVL
	2KnT+cdUYmtnH3JZz27nrSLGTac7d3AQWQPZqpTF/q6fTxknmJF5YHz93JylNNG5
	ItihOIqO8EX/sAYegy2CBwp1gDn+E3vsm4FcjLb5ZpM0A9jzdrwc72sf794A4uCF
	ve4FOOs+s71tRQM3toc3+rm9RkuUNxARQLIL7g308tWOkj98IuByTaZ/Zf8IJKft
	FvhGwptxMgjLFYuxJknDgM2aQwI4JZkg+tzad+kfhhLONnMPCiNCcBALz1A+eHtZ
	dLckFOJvFR1ciVxrZcwePdXhWgN1w==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010065.outbound.protection.outlook.com [52.101.61.65])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gppv78sc5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 16:58:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/Ac8nmriFr29vYM7qYVNHsyDHG/8Al54uS5cC0nEXSNk0G3MmX9c1XBPVJ8uuehPV8IkL7tVS7uaXK7dDkvlb4KfzY+RJ3NP9MiNi/CyHWVdxls4FuxiEtLx7nKQVi2cvZUIzh7/cS3nPudwUe+818JGWLMsAh+rHLQdwdz0coH3JcljKl5DGyvLpExnkjB2ao2kPpJ5awux0LxAn4LHz9CyVnN+5OpBaQB7G2Xj4lPPL7mIBcme05Mnz9eNCiEs6mX/GBGEhTkLJluKE94DBPTDVlnUMHUwa5PqR+VT4MU5yH++hMndfsZCVRWz4Gdf7JvUbB8ih7aYOX9zWgwyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzXDNHzkZB8sexU6jG4nGAgCqdzfeRwYHiu0SFlDJ3M=;
 b=v5IMpfs/T2fxeQw5U07r6uZ2IawCrhLw3UfsJwSL2ezMgdK9gHwzWMpOGmkdi6nx5VJGx1yUNcVjxWoasW6x69Y28lOBrPNDk0aTQkFQgY54i5zfNd5g+s1DyXCQNMGMeyDFvxC8GECMRhwbEBLPJRvyzZHAxcFACczQ7T8B7Hd6Y+rMdKtWzlNM5LXeyvAJPIcdVKLZzd/WX4U8WN6cZWTkuxw/6RoW0angNqc+hKTUk6eeS7uLKFtyPOIYhijgMfXO+3SeK1NicDSoHvkKPBIxKTOcff12e5Sb/0/JDSw52BuzbtlCQAUxrU3ACcFo2eq+pEtG6xZbE4cZTL+Uug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzXDNHzkZB8sexU6jG4nGAgCqdzfeRwYHiu0SFlDJ3M=;
 b=BvQdg8VifLRciH52PrEPSAdgxNCUmZBEzIvxK96UikaPC9S5pC/PHlJXIv/gYodnawCI1GcEfGauSG+ZskcnZk3i+tnhTU7PcbXcH2rv7fBstNuiOuGYqCZoQXpWVluULwjWfdjX/zIzJNZ3uT3k4P6S9lKWJzTvDVYOhp/ck1Y=
Received: from BN9PR03CA0684.namprd03.prod.outlook.com (2603:10b6:408:10e::29)
 by IA3PR10MB8735.namprd10.prod.outlook.com (2603:10b6:208:576::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.7; Mon, 14 Sep
 2026 21:58:48 +0000
Received: from BN7PEPF000000A6.namprd05.prod.outlook.com
 (2603:10b6:408:10e:cafe::a7) by BN9PR03CA0684.outlook.office365.com
 (2603:10b6:408:10e::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 21:58:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN7PEPF000000A6.mail.protection.outlook.com (10.167.245.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 21:58:48 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 14 Sep
 2026 16:58:21 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 14 Sep
 2026 16:58:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 14 Sep 2026 16:58:21 -0500
Received: from [128.247.81.105] (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68ELwLCW2938160;
	Mon, 14 Sep 2026 16:58:21 -0500
Message-ID: <ec716464-4293-4db6-ad69-c9677e42c041@ti.com>
Date: Mon, 14 Sep 2026 16:58:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] nvmem: uniphier-efuse: Add ti,am62p-efuse
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu
	<mhiramat@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260910155509.1425682-1-jm@ti.com>
 <20260910155509.1425682-4-jm@ti.com>
 <20260913-cocky-angelic-cougar-1961db@quoll>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20260913-cocky-angelic-cougar-1961db@quoll>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A6:EE_|IA3PR10MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: eafc3821-1920-42bb-16d4-08df12ab5b04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|36860700016|1800799024|82310400026|23010399003|4143699003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: y1vC24NUN8Df1Xc8+0JJAqiYXJ755XTvcJkNZJVTQe9PqK/ZZ80uYftg9ehy+Qr5JPBS4kQnkpfX4B7XXcFL61QudUClmk8yPedivuBG/2wxaydUwbxK94hlw2g3xOndj0UAn5tu13u9L1TGVRrgjMTserbz0HrFbOllAvQiw4SpnQFZE4jEw3wYtTeVLb02Rwskchh+Ykid1HH34508whj5A/XUwgf5NVE9hOLUDLySjigFp07f0dlX2b4F5BvF3OWdFQHaWmyJdWO7xPLJEg9xf2/A6vW18yvLB8eE4Lh31It8BdQ7Wp7XmlmLK+WbnwtiaisdbdlqlBv2SudLamM0lzi4nsV2CwYnEHv4xbM9ObA2oM2lLd9CjDFAoyCqzIAxB11LtfXdLMRY+89Y0DbNZdYHkFIdrPPii+P+tsyxNGaL57xy6Cc0LB34N54eL3FfjC1v1EBUyW1wAKCu6BZ25C9f8KAv2cUfYlq5iX7rq+p05I9TC97S9nggxdNQbZOtnUQKksZvhoiTvlxAsUO/1BoUSPWHmFa2bS2X0plcSm9cM53HJ3EcZyutlX14AqdNsXmRsA3W67eB4GvsVE1gHoalUCR7At0NzFsQnypNFXj7pJHZL1Bfp6w3ljpkpwjIgANmH9BoDoqFlgSyYjnNXdy9c1oQpBw3e+d/X5w0uBvAqqQziZkHj3xY616aAmof5mdrgmQd92RZW+vDIg==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(4143699003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 2gYdYQetuGj65cN4ZRXpPzAsu31hqiLJZqhjrXGrxStUeqoN3CmHlY/B6En/v0DHP+aFzPcHq1C/NA3nr+ttCjjx7NxmqxLSGrgrSl+BVh+e+N0LTNxm+vPTcG1bU9szEX0TBqUvyICDAIpT1DO+KSzreuWKv3w/dOd4xxXYTEzobNdCupNorskqpb8EIA9FeTBZ/3z0AWGMgCLRhMfWmbIPFxzkxDWWAKgPaBQGUoNj04Do+RBN/busm2ftSA63DsOqBiBnYDbKl/s+l1cVdtPn2smzVGG66mv8G6zpj9t/fISJxg9h8GiEOL4g6o9JqGu8vEwUuZLQaFR6sZkQjKHq9+WXJ8hc98UWoFDmRKik9J9JUFESozFM7Ucx0ifJJSiyZEnrdRwvKxvdd0keSJd08oPMrvbuWe+aX+qFbgUs0BA4wSVEiCTAWFZfi5ew
X-Exchange-RoutingPolicyChecked: 4/ONrHV+HRuSEg+shfiaaVLxmdfo2tXWtOS/Q7cOTkfMLY3UrM9BwBc9wDCYIlnS2EkPJGsoWLOX5QsHAR06GSotTPIYLjUrC5S4WrjwAnyxeo07sXq1RwmYbL0ZQIHpddbVNZ01Os4m6ZM3Ed+0wDiOgNyu3uGJl/X+8oiWwtcBJnOq3V+mDzyC9Qw6cTuadKEdkQKYrR0yBsrlVMh5pbEks9Ij8Pxh/NDcWR5dazuHjxLk+vZuyMIh8JfXSmYzU6Ff/wjUDbA6wnVfD5DMYqgJqbfUE39WHZq3duEBpc8iZ+oK4UDlzdwfQ8RlgPIxN4i3u41YYJZTBrLav4CNTA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 21:58:48.4356
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eafc3821-1920-42bb-16d4-08df12ab5b04
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN7PEPF000000A6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8735
X-Authority-Analysis: v=2.4 cv=XLWl2ghE c=1 sm=1 tr=0 ts=6aa86e1d cx=c_pps
 a=mfnpAPd2LV9TTO/yo6PAYA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=c-n4J4-pAAAA:8 a=esUg9U0kx3sDVsDrY7UA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDMxNCBTYWx0ZWRfX49N/Y+4YdJHp
 +gBOZz0l3KhJY+uDSMw5UJ1Qup1zqZMvE8grwO/3+2FR7Kn5DfpnSkVnNYrYR2Fb5CXcKIiH2ep
 G7r8Clwn8NmpAYuuYN94ik/mKDlQZBg=
X-Proofpoint-ORIG-GUID: clGoG2_wAC_OKEXXBs4FdFt8_xagcip8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDMxNCBTYWx0ZWRfXwISgWqJ7REn0
 i0oEdJ04LqUXZmAbyjv/IxEZvdqPb5nXiHwxQqJJ6nEKnbavkIek99IuDhKMO7UYcLnBL4bN0rV
 gEEfPWbAHmFpQna6gQOyS3J6ogz/5yVujdj1tfd1CZj2Tb+oqRJV887EE9di77HhA6hMFeolOyz
 DMtrv4RmJW+SI/wLeji2YdCMiw5nrJ9NhoYVmS7XBb9qzypZs6izkuhhegmUCVPDew3MgJutxfV
 gtJPbPDhFXB2R1hVBSYqsTOGwTsGrpb8GUclo77mNM9HsjvfsvOTcq+C2Lcpn3mjJiksLLUgMZD
 QGtxi4ykfHJZM5O2kxNkvpPcLgqpAxA6QadrBOJgjVF+ReFFSRfU66WoAG+Ofv8SL6ve1nZvrX8
 Ue1IyZnHWPJkCNcPgl3FTo5lF/eGZzw4DmKawvvYpNi8LYGcbqE4i34vF1qVZ9srK9ao3ldiBVc
 fvmXb/mjwUThpSdJOgw==
X-Proofpoint-GUID: clGoG2_wAC_OKEXXBs4FdFt8_xagcip8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 clxscore=1011 phishscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140314
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_145856_135756_EC20B4FA 
X-CRM114-Status: GOOD (  17.32  )
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

Hi,

On 9/13/26 3:57 AM, Krzysztof Kozlowski wrote:
> On Thu, Sep 10, 2026 at 10:55:09AM -0500, Judith Mendez wrote:
>> Add ti,am62p-efuse compatible to uniphier-efuse. Leverage the
>> nvmem provider to supply silicon revision information from GP_SW
>> efuse registers on AM62p device.
>>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
>> ---
>> Changes since v2:
>> - Add Kunihiko's review tag
>> ---
>>   drivers/nvmem/uniphier-efuse.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/nvmem/uniphier-efuse.c b/drivers/nvmem/uniphier-efuse.c
>> index 85f9372fb97ca..d0953b99d7e18 100644
>> --- a/drivers/nvmem/uniphier-efuse.c
>> +++ b/drivers/nvmem/uniphier-efuse.c
>> @@ -59,6 +59,7 @@ static int uniphier_efuse_probe(struct platform_device *pdev)
>>   
>>   static const struct of_device_id uniphier_efuse_of_match[] = {
>>   	{ .compatible = "socionext,uniphier-efuse",},
>> +	{ .compatible = "ti,am62p-efuse",},
> 
> Why do you need this change?

I think series has been merged already, but I guess ti,am62p-efuse
is not really required anymore due to fallback compatible logic we
added, but it helps provide a bit of clarity and ease of use. Which
helps in this case since the driver name might confuse the reader
since it is not generic driver name.

If you truly have a problem with current setup, LMK, thanks for
your review though.

~ Judith


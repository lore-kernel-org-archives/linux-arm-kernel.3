Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37908C44512
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 15:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DGlrHQA2rzi9wLvoT4wP2elYeZTDSUX2tIEZlyHcQgU=; b=bZN998I+3yOEaiIN4ZXmj+w9fL
	1uUPX0ftMEqENOVQCmRMhHNGC6IdCR6F/Sa5LIExi0vfe+8Qk34iw7bJojnVrmWK8PhVdo+xHEGnF
	XQ5JB/9KSzE5LUNQw9U2k18gLGs1u88j1MRVFjYDgnDZvDearlxP2/9IcEjCf8e8KoUPijBXrHtI8
	8de/fNwOPnGvNLhaSxEhQsruWyNt0t8mJOvA8zTG1xfDWJmJVLiih6r0XGuL5hVN5hL74kfLz3Lux
	mEldGaAEuVfdx60BLYHU/A9EqOufLg02b3gyF9RNGuwxFjjGv1fErhZNToHIjZ0jdk+BG+WgV5YPY
	jnTWPDFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkO0J-000000002uS-07Tv;
	Thu, 16 Jul 2026 15:28:03 +0000
Received: from mx0a-0002e601.pphosted.com ([148.163.150.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkO0G-000000002tP-2XJO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 15:28:02 +0000
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66GDLa3g3949517;
	Thu, 16 Jul 2026 10:27:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=DGlrHQA2rzi9wLvoT4wP2elYeZTDSUX2tIEZlyHcQ
	gU=; b=gqlDv/5jLDlUiGBXwKo9qfM1nhDsS7tUzTmrpfRs0wLwvvlVFgJp6/pGF
	85bPsf9I9maW+/DMWQl5fDDbheJ6FChgq/KJKVUF0EE/C262fFQpuN+uO7luX7ic
	N40WuwkcLSHVa7CkvAHBvV4I3laVYBBebHnXd/GVNYUvNbKLv4IX2bJroreADWx3
	/naJuaj62VkN5GMFD6wakq2gaZSHIJnLuxA1iAf6fHqfQTObiQrNj7Cu7X+XLNTY
	0fMhbCtI3NLwIWiZxvAugnai4MttW4V1QmlglRN6aBWfCuZ+ycZg3r1/09Cw+fjO
	vRD6DK3x7ti9bVoK/LHx/6AzaMJMw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010052.outbound.protection.outlook.com [52.101.46.52])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fex789e5k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 16 Jul 2026 10:27:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwXyePL2ZObmLCwiHHOwJrn7esk4yu31ss6XzgPng8c+r4zvvqtB5iPnHZilp1g1pOCVCB0FPmd4YWLF21NudUp+flUzZxhNfbIX3/pxowUbCxV166y9GqASubdZ4pMK6YQijJpbmWy9JdlH0qRR3/xqvPsmqn4eLByWHgtG+5WIzMTdrL1mv9VgcuqxffTJGonvY2KwATdIpkGd+Um/6VtmoayK+CE14p5/pK+EK21IM2/omrcUZrmngn5/Nt/ygBoQutYeEwObsi+P9oNYUmNp6jZoqYDT+CApTjJzytvQ1LrKA+b9gsTpTNdCdWniQgxLdM7fuwLvy9d8HRNLPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGlrHQA2rzi9wLvoT4wP2elYeZTDSUX2tIEZlyHcQgU=;
 b=syGoAXgCeKhPAuPn7jU4K2u1NfFfkNACTcI58+x9EAkrahkXKZ62X1SczBQL7C72YGrMSbN9VQ+FXPMJsl0/9zlTxyaNEuNiCTP/l15LPbwkLu/JegFPKMHFqbPN98LrhIMP1771Yo25pJnY+YtJHA9+JDYRluZJ6rth9YxhnQPpyJyGzU7C5TfHTmCZC0r5pNikBzBV8JgKweHllnEz+jKHq07VLbWoOmRpxPkHIlRU0Ty7vTF5qlXf9l0AWE9rNfVjnsbmqgzbH1uiE5S9+qiFBl+x61MNG0x3XwlJPEhvbcZkrnS41bicZLQwxYRnmnFIFGPQpuYaFfJ1bPqTYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DGlrHQA2rzi9wLvoT4wP2elYeZTDSUX2tIEZlyHcQgU=;
 b=G4QooaMEdxqkXfnIAmRlG46JNun5PmAhSSK5emdL7AT30jh/mGdaJWYcfRv2QE5vk+n5FR4jFY7j8o5nV4a2J2qlYkqDrlxvV446DQFxzdS72F0vJ9xInpsAEIaT58y/Ev1RYKgBGq53UKBJ5ZXXH33zZCA6sJT4E3TfTEwdAJQ=
Received: from MW4PR03CA0065.namprd03.prod.outlook.com (2603:10b6:303:b6::10)
 by BLAPR10MB5106.namprd10.prod.outlook.com (2603:10b6:208:30c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Thu, 16 Jul
 2026 15:27:41 +0000
Received: from MWH0EPF000C6187.namprd02.prod.outlook.com
 (2603:10b6:303:b6:cafe::a5) by MW4PR03CA0065.outlook.office365.com
 (2603:10b6:303:b6::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Thu,
 16 Jul 2026 15:27:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000C6187.mail.protection.outlook.com (10.167.249.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Thu, 16 Jul 2026 15:27:40 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 16 Jul
 2026 10:27:17 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 16 Jul
 2026 10:27:16 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 16 Jul 2026 10:27:16 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66GFRG031640194;
	Thu, 16 Jul 2026 10:27:16 -0500
Message-ID: <cab0adef-f5fe-4e37-8b43-72683152c0fc@ti.com>
Date: Thu, 16 Jul 2026 10:27:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: ti: k3-am62a7-sk: Add bootph-all property
 for ethernet boot
To: Chintan Vankar <c-vankar@ti.com>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, "Tero Kristo" <kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>, "Nishanth Menon" <nm@ti.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20260716064449.2505650-1-c-vankar@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260716064449.2505650-1-c-vankar@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6187:EE_|BLAPR10MB5106:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b90197c-4b43-4a19-ad58-08dee34ec612
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|56012099006|22082099003|18002099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: nQriecxNz4waO/H6KLxKHdob0nNY0mV8CgXylz5SvfjQL8dlY62XbOl4A+JgfozT/TK1NuiAxQIoLLhagQlKFiHmxov6MBpBNyjloU8eJd0IkPPlEJjwxWxHq5whx/044k2PFFpHIWXkhWsGfjZ61lM/Wd1g027tHU25s3ITxn7MNVdFYhrXhClk8V6nhk5lbM/1f8FtvhXMti/Kv45oYtIzWoERXlxG7SMN0f9fOVS0Vk3lpFuAYnU/1CIpLZtqa3W3Lh6beeKlbFEIMHCScW0OndiA+cCzUv9Im0PqOTzs7QRq6/staRgnXN8z07WHlaU/9W5epnq842lLIBniiAZPgPfRPwcEWR6169ZCK07lvqMWP3ncaAXMagdos0+H24utVUQI66OtfHnW8IqkVKvpg4YyzpiYNZ3v/MXRjVWDMTNRc1qKv8WaR0s4puXBDmMcrddiJsue9/p/lp3QSgsRAdAKCGYOKxVtOGtdhjN3OST5Z7H0ReBMiKaTDKnHgiGophhBHUormchw9nsJDJtCTU8sOHT9OPdZkNZXXGZkWfGMqFTBNT/p0Jh8TKdrjWT9LjhmnQWlUAdVcTfBLenBVZgqyW7qnAmOUCQhfCi/JLlXEB+QMU81OQZ76Rg9VOvKDB8WpDP47F48/RrK1Ml1UpaR4vAKuu8wl+WAAGISMYMjAlKZTOJVoHN59X1Zd0edNRl4SUXjChWy35dLZg==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(56012099006)(22082099003)(18002099003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: djr9297af9jknJ64JIptAiBm2AUSXQ2UYq4QqsUqKaMPz6VEr8LWTVBk6nLY9h1aUAcnVmWVQu5nulvFwqpMQMihhgXfl/bRd9ZMX+5bcNLEy1zhkzab9IqKHDrSiVKG03CIsEPt7qIDobFt19Xsu6rZg1JAaC+QFY+niJcRYwGsRTXfN98MWe1i6oFTAWkXij+zuv3hznGwXRipnj19/eWa0db7YJHDbS/VKF1xs47mcKAX7tcV1V8i7WLfO4XZXEfPzkMpu4wwZbglhPvBuaGntHPPKePF3RGb3G19XmdcOAi4d+h+ghIvTK9HMshPg3OD8ZlBAFO/Uiua89XE/Nu6dLahpf3nU/Fp5tUItxL22mEgBgCA6aTTwJXZm1P7nLmk83XRFFY9cBrL0aRYNk1XuHgxTbTcb64P8fiAkku3k/GapaTnELrt/F6G0imY
X-Exchange-RoutingPolicyChecked: SD9USSGXRcXDHyuydDrzVN3tLDHvWtO9LenFASjP5STb5FGT6iCDmAJFrCnQsOapYtbJy0dFMv0+x5pmyYoOCrqXNzGqPxylDcYAAGVvHUlohqGug2DvNzXCP4Izd0qHROo4Kr4mty6X3HNBCZ/2VIgANymWpjzfnf7IsNdpyAJciJ58it1O40z4JKF1h2PPh/Yfh7wtu766NfRspXq/+1PjZ5M7Rt8L36Jo+9ut2s+tIdEZb5C2qYwcMg12itoyg14y8VXZwZd1t5/MtK/6varW+gJ0N2fcmrOSTUskBqwm9iiDRpG+U2dBtCrl7acJy4ZYgaEszLjTtHmSOv482A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 15:27:40.2010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b90197c-4b43-4a19-ad58-08dee34ec612
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6187.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5106
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE1OCBTYWx0ZWRfX6j5OpHvz1nYo
 aMIKxHH0I1uRYUKMFwDktRh191OenDIsonPjDyAoEu4SQCIC/q+DLqq3VfluYk3WTv5pdX4hrz0
 CIMTZPD7LqYAvO0X5vrAkdmJ55ofhpK7tnPOLmZJ6ZGM32gsbB65c+KnHuV3uQeewg/oBzaB/oe
 BwVNKfJ1mWZA0A/UEbvu+qB/J8p1nLkp4dGbzj3pWsi0ZLyj/IPMBqcBd04LIq2XFO4+tX9FFRS
 W9/yMV5Ui3kJEegFf4ucqBMIOp4T264J59ZzndNSbO3rU3QMH6z+zihX4NSE1gWAXDYFHXXq65c
 RfXClEdYcipcIicXRkZWseLbufNkccONq8SVRph9QAynv/XZ3v3RcZ4DDTy6H3hxpvxtZMsBOoC
 4Jp+42+PvtdDptudSiCoQF9Mee98Q0C9OcbdkjAsB4h5IVlclnVeiJObwGRWLXockjAo8rDc/zr
 20GA1BC7WZC1N2Ut4NA==
X-Proofpoint-GUID: uQNJE2Lmrq0NLQ99FQoUXU6zgYun_hPk
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a58f876 cx=c_pps
 a=5/iD8UG2uIJM/AKiuvK9Ew==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=ShSPYlrI8-U9DoHRvHQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: uQNJE2Lmrq0NLQ99FQoUXU6zgYun_hPk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE1OCBTYWx0ZWRfXyaX2anBqwazs
 UODPE+440I+l3IyWpiYbLee8o5A9kvuNxfRmTOviEz31LQMSG4IbFCbqXVh9JSgF/dqJvDhpAJs
 p3YXzGULXfxr7pqmLCiXiNnfpRUjcxY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_082800_786800_E7984C09 
X-CRM114-Status: GOOD (  21.33  )
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

On 7/16/26 1:44 AM, Chintan Vankar wrote:
> Ethernet boot requires CPSW and PKTDMA nodes to be present starting
> from R5 SPL stage. Add "bootph-all" property in CPSW MAC's eFuse node
> "cpsw_mac_syscon" and "main_pktdma" to enable these nodes during SPL
> stage along with later boot stages so that CPSW port will get static
> MAC address and DMA transfers are functional during ethernet boot.
> 
> Signed-off-by: Chintan Vankar <c-vankar@ti.com>
> ---
> 
> Hello All, This patch is based on commit 'cc2b5f627e8c' of next-20260714
> branch of Linux repo.
> 
> Link to v1:
> https://lore.kernel.org/all/20260625113223.1711052-1-c-vankar@ti.com/
> 
> Changes from v1 to v2:
> -> Added "bootph-all" property to "main_pktdma" node and updated commit
>     message accordingly.
> -> Collected "Ack-by" tag from Andrew, since I have modified a patch by
>     adding "main_pktdma" node too, I am not keeping the "Ack-by" tag.
> 

Would these tags be needed by other AM62A based boards? If the network
is enabled, I'd assume any board can network boot. Anyway, adding
main_pktdma as it is also used when doing network boot seems reasonable
here, so you can keep my ACK,

Acked-by: Andrew Davis <afd@ti.com>

>   arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> index 821a9705bb7d..59cf49a14f61 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
> @@ -230,6 +230,10 @@ AM62AX_MCU_IOPAD(0x0030, PIN_OUTPUT, 0) /* (C8) WKUP_UART0_RTSn */
>   	};
>   };
>   
> +&cpsw_mac_syscon {
> +	bootph-all;
> +};
> +
>   /* WKUP UART0 is used for DM firmware logs */
>   &wkup_uart0 {
>   	pinctrl-names = "default";
> @@ -241,6 +245,10 @@ &wkup_uart0 {
>   	status = "reserved";
>   };
>   
> +&main_pktdma {
> +	bootph-all;
> +};
> +
>   &main_pmx0 {
>   	main_dss0_pins_default: main-dss0-default-pins {
>   		pinctrl-single,pins = <



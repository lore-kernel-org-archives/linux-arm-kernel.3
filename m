Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B10CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 09:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OO+mqwNBXoJKzeXK6uZk39tZBrEH/X4HkxiATpy8Pg4=; b=Ytv6uSZlruXVr24PPUxo1c1J+e
	F0pwfkh6PBh5aH5DRs4HzvUbVlnpJzKIhfQEsK0XGGLHa8kUHadxst5vflM+FYVLcexypM0fk2jR+
	Bp5RE0l0IlKz2/eQfPyYwsFS99Dgq+k1wVsWBwNDsAOSRHEPWeGWovciSL0kxPtF7QnGE3anIgg6y
	xhfNUOQb85Fyj6upmK706auzeaMvTku1adtO3ooDV+kZBK3Olvhu4xQ0xlxBIUKpBGBWua9t+FIZP
	5Wv20yqgq6hTEFwQgTeEMJyBSY9zN3uP+rdT1sKuRgW+AgW3E8wWinh6/7bkgkdb/+zYZrz0WlEdv
	kscNX1dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXFYn-00000007J62-1FMf;
	Wed, 10 Jun 2026 09:49:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXFYm-00000007J5a-2AoN
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 10 Jun 2026 09:49:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=OO+mqwNBXoJKzeXK6uZk39tZBrEH/X4HkxiATpy8Pg4=; b=Orf0MbdbA84jkcGhjBK6K1UoKK
	G7z4z7pnWsBdAwqvPy9y635niPwAw9Q/Yrr/Vgw1tWhpSsVy+A8endMIWLJkHhvHuLcxbAHqixEBl
	rkckzsso4NqUxZvYIsuGx/HhDPpUCxD5CZ2mII7548PhP3GKt9nz1jtHk8QXtR6vjE1SttTsNnbWg
	/oL2oATIVcdefygrYZc4u+IFrrY3RTKs2IaGnV2dynX7vmjGgZVrUI75zZ4poyqu3l4QiwyX4l/AK
	QxatRwAEpSZ//RaRnc4fqO+KX3c6n7YvKr8bkflZmbIMxvrMlSHlk5+MpbZjU1+DvzkHMtNTb2Fu7
	FOA/cEfw==;
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wXFBE-00000003gS2-2IV0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 09:25:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g10tSxNHCMJLuh2E938VwrRA1PASEj5Ys38Wp4iOtlfgwzDtxmPre+U/DavxJ7/cW04+qxIOfpYviH1bAKVnCO2YhSxEvZwAvGMQDCXVHjHYT3veDXDfqmWZEHTcHAzpZXMhTxvyiJUaDCcrxyCUUgqtnV5cgjqazoVLjye/UOOufiPoYaZ0oN6wo2SiseqDLFXysBjAMWyxWRF/xgbldEKZe+5L1HptueYUUgTCjQ/s9XYBLu/wJ8ohEArpN0IIAajxml76bPXgOcUCbdJjotsGkuxPDqf2YCmP2/zzV2/wRFIYn2a9U5SttQ+xG+gdJx6mEs/JKsca7+hSyLDdgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OO+mqwNBXoJKzeXK6uZk39tZBrEH/X4HkxiATpy8Pg4=;
 b=VIDl8J7VFkz7+H1AhtOOCyDDiVi3qxZPfP29mTS3QbLFhvt6wtvDeuxUAMQX5tZGWZVp00Xis8ezfgia9PLEXHbR3+G6eSyHR+u1KZGDyHUcmJ78401RjlzGnDfJERMZWgZdUI5IkwqM9bG2NSiW910DwkTl7sgJ71MRH6hwn0vjWz0qr4OfkFjMi/HZj8kgg/xTcsU8ndPl42qpRu0oV8KYOotw6zzcBXpTKuNXXTnOpEoQGKcJPHl2GTInTvkGJAzXEirNJGMjWixzM3lM4hsQdsY8yqUXT6Q3LJ/E8hnw2NG0JUEkVKPGdVIMamo/7k5IzbL+VPrgoUMskDXpNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OO+mqwNBXoJKzeXK6uZk39tZBrEH/X4HkxiATpy8Pg4=;
 b=Exu9K9ElWFTsk2ygDPQqFenXIPh7eiMj3urEcjE/ze9IMyUOoyWx4BqDHxIPGJd144yz766L4Q5A6Ct9Q3W//P1Ksfq6MiW5MJv8v5+/d2hPsRydfsHm45gNn/yXWifcgOD+vpcMgP07oENrnF+IyCxvys0LiRsnypGgfQ6OM6FUndAQJIYciQGJ7nYG73smBgMwWGGKIwkYnpa0mgsl45e7AB1Q03bKZ7L5X1vRtGeb7LMR0ooFNjvyIJsjl5xo2ywucXr5uYOHcEaq7rqAEBFSm/AjqN11akRznLDX+9mrPPlTIEIMj5YC60NQoD8TWLsJ83DVMTy7Z55VANKDPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 by AM9PR04MB8860.eurprd04.prod.outlook.com (2603:10a6:20b:40b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 09:24:56 +0000
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c]) by AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c%3]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 09:24:55 +0000
From: Liu Ying <victor.liu@nxp.com>
Subject: [PATCH v3 0/3] arm64: dts: imx93-11x11-evk: Add DY1212W-4856 LVDS
 panel
Date: Wed, 10 Jun 2026 17:26:20 +0800
Message-Id: <20260610-imx93-ldb-v3-0-c9b65d742753@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALwtKWoC/22NwQ6CMBAFf4X0bE23BRRP/ofxQLeL1CiQFhsM4
 d9t8YAHj5O8mTczT86SZ6dsZo6C9bbvIqhdxrCtuxtxayIzKWQpClDcPqdK8YfRHIs6hyqnHJB
 Y3A+OGjutrcv1y/6l74RjCqRFa/3Yu/d6FiDt/nUDcMENABaoEKE6nLtp2GP/ZKka5OaV4vjry
 eiBhoZKCbox9eYty/IBeiSGQ+oAAAA=
X-Change-ID: 20260513-imx93-ldb-c5a4194e41ce
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marco Felsch <m.felsch@pengutronix.de>, Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To AS1PR04MB9287.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9287:EE_|AM9PR04MB8860:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fd870a5-fe62-49b7-560d-08dec6d22252
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|19092799006|376014|366016|1800799024|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: Yy5dQqHS9Jo+gbU8KOflcTqksBC26CMDcGN//PJZaBfaEEHCcCLqswJd1vyeNvl9wXbEhn68r0vdBxoOmqdYaBmmIH/v0wx3mnzknAGO0KbBxuEhGBgQc3dlCZWM84bFGxWzQnSRbovcd+VjmqJ0WDaZ5IPEk21XqwxXu0NojE1efYDbb60k5+dcvS0PfRHprH4HXzqkdUNjmqsUoex4gzHpXzkMxQHzLasqK8gxSfMdRGX+L1ZGLbrN7HDB4/woj83AodQiAiuKS7OJ0+zgDvQBSXzHn1uPm81g887p1tFfy48QbHOizwQwzQcmj/pezxxBmBjvBcM12M8eaMCODV/uMqMPd0nUT4HDWLjvUhKXxcObnlt1Bvq91dIGWxwAcWuWhyoJyO9fMN08bFcTuQR2J3wLJmapjufWCRgMykTYO5HEB+c+WSjOnmUUKJJkMWI1xlV1Y1c7UkoQw2ptg89Py5lGVMkPHUvs2+odXe8C3PSwNzqh0PsiG0sn6l5Vm0rKKWNjfSz9/ROUXgYMGk3QZaFrH4EnS/FBDXBgzJcwA5P2vWoQQbQsq47qs9d2vJyrN0ddbassndwJQWQauR5koTp/9bKVH3CDKAxIQ7MC9M+dGwYRv6XMnU9OGapYkbv0pKaxWHtcACeiDhSiJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(19092799006)(376014)(366016)(1800799024)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bW5IL0xGOEdjbmN3QkxXOHpWZm9JWEJUd2xvWXM2a0RkK0txOHhDaHJyUkVj?=
 =?utf-8?B?TW5QVitpV3A3NnFEeEJuNEdMZ1RaYy9oSnlpdk9DR29xdXhVdUp2Y3lTVzNM?=
 =?utf-8?B?T2c4T2RBM2RPZmNNSEhjZ2RMcXVHWXA4ODhhN2NzYm11NlhkdEVObHNFQk1E?=
 =?utf-8?B?NkdmL0pDQWN6ZEdpZ2w0bURSQlU4M2MrTXZQc0ptU2VxVC9uRFdLVC9RRC9W?=
 =?utf-8?B?K3FURWZ4ZW4raE9XNE8wT05TelFNTHVpVUVaTjVQWmtEM3kyZzZUQXF1YTc2?=
 =?utf-8?B?OUlWWWNLeTBjWmVoZmJuaUorYzZJUk1Ya1BYMVduTktLWWU3TWpXS2RwTGE4?=
 =?utf-8?B?YTNvV3JaSUlWMXArNTRiRW8vYWlLaktEcVN5YTA4VktrcE9QQjl1c0RMNWs1?=
 =?utf-8?B?Snpoc2pWM2lTZTY5b1VZR2ZNc0NBR20zQ1haRVdtWU5DRnJDbjJ1TnN2ZHdi?=
 =?utf-8?B?VnJJdXVuZXBkRm5ZbFdVOU9ZNU0yZ2tWK3JWK0RUSkNuL2ZINmF0bCtWbm50?=
 =?utf-8?B?amVHc1YySEYzamJuMFEyb0Y3cHhUOW5udVlaQzdJNDZ1QnFZM0hYdFdSN2VE?=
 =?utf-8?B?SDVqZ2NZejBlaWovb0NwYThkWDM3bGRWUi92ZHpqd0dCYVZOd3B1ZkZIT0Fm?=
 =?utf-8?B?TURHYkpGalowczJvcGtpb1NtUW40WXJmQ3dBdGExVnRldkF6M2pRaTJFUWZD?=
 =?utf-8?B?eGN4WURSajA2MWZCNUhyaVlpNloyU0MzWHkyYzJ1WUhhRFEvNXRzV1VMYzh1?=
 =?utf-8?B?UFlTR2JvQ3ZVWktQZjU5Ry9EUFRKZzl6bFRBUGxnVXUwZCt4NVduUnFVR0xW?=
 =?utf-8?B?OGZBU2hqUUFnZGJ4OUR6OEhyNE9FdVN5STNYeVpMYmZvb3ZuOVFGYmFDeXZ6?=
 =?utf-8?B?NzRxYWRZWTdMbWoyRXl1UzlIdXk1VG5jRVNMRHBuYkVQT2lZSk1CL0NSQk1r?=
 =?utf-8?B?S2dSdExjMEFrcS9iZCtTT1VKandwcllBMkF6NDh1ODFkWEV1Vm04ckwrYi82?=
 =?utf-8?B?enNrbUUzNW1YemRCR3czY25Dd3FHQkhXVDRiQjZFWmMzYlBIZFY2SlVNVEo1?=
 =?utf-8?B?U2FuMm0relZETnVqUkY1WUZXWnJUa3BuMzJNMjJUd0l6VnlpZW9zRnYyNDlw?=
 =?utf-8?B?WjRaZ2hJdXQ0NnZwaUdhT3VWNWdYQzdwQlVVSHpoTlVtdERZS2szbEZkNVMy?=
 =?utf-8?B?SkVrNlNJN3ZQVytzWTk4UXNuT0xVU0hybzVRNnN3dC9ZWVJ0Z05zMllnRDV6?=
 =?utf-8?B?K25WM1ZYOXJPWWMvMUpKdGFlUGJKSFA1YmxtaFF0NVNISzU4c0tiVXhXZU1m?=
 =?utf-8?B?VjQwck5TNTBjcWRreGY0WkEwSWU0em1Ba05wVVBTejQ3em1tZlRKU3VZdVlT?=
 =?utf-8?B?aTVFV3FoY3dybEI3aXAyTVova2JaVzVkenlkMFRLRHZqWXY1TGl5Q2J4My8x?=
 =?utf-8?B?WTRuN3ArcE55UjREd2c4NzVGZDhqV2RaS3dBSkM0eDlUZXlxM0ttdFEzVDhZ?=
 =?utf-8?B?RDFWd24wb0JjT2xmOVBEcWhIVkxJNm9kdkk5ZHlvZ21KMlVTNytPR25zWWxK?=
 =?utf-8?B?ajFsQkh6VHJwZGhSSHBaczBUQU1RQ0dtUVVTZ0p3MHl6MkMydkg2MHNjRDN3?=
 =?utf-8?B?N0FtOVE1dStVUVlKcUFLQkpkTzJlV2VSdFUraEFmRFhuNDJxZ0sybldhMkJn?=
 =?utf-8?B?ZkYvcDdqVGhYc2txMGovYnBYRXcxalppUVZyY3RQYWQ5MUlmaWp4VDlpZ2x1?=
 =?utf-8?B?VDFjMnltMkJ6NmpTMWpVSEZJQ3VzT3QybTBkKzJMRXhXWVphRE9nMWhjV0la?=
 =?utf-8?B?RGRjZFBZUzNjd3BWUHdyVGliZlNuOUIyWnZZQ21hT0t1aWU3cm1YZC90a25p?=
 =?utf-8?B?VmZqWGZqcHRSWDNSVUdjVmVGUEpZc2lJVEdjeTROMTYxZTRGSG4reUFCRFNq?=
 =?utf-8?B?WkgxU0kvMkR0NDFlY2dPTTZsU2xVZEVKd29kc2krdDdJZlIwdXhJbWhnV0Nl?=
 =?utf-8?B?em1lNzNxRWNwblVCbDYvYys0T1ZvNTJhTzdnQWdSQ3ZPYWE1Ri9UVTd4K1di?=
 =?utf-8?B?cS9ZSWtncm1NYUc0a09SYklPbXh0NW15blAvdzZmdzdxZnQyZlVlTm5pU05Q?=
 =?utf-8?B?TDF5QnkybXBlS2NSSDQxMHRtU3VTT2tLY2RYNGhZbVg4N0ZiVy91OEtxVzVl?=
 =?utf-8?B?R3FPL2xCdStTQkxsZHNLcmZNcmxtN09mOUE5V2NUTWV4bktNbm9FaUIvcFo2?=
 =?utf-8?B?c1djRVhtU05OeE12T1U3eDFiRXBqQlNTQXl5SjM1YnNrTlRpWWh1QnYzbVpB?=
 =?utf-8?B?QnNYbk55MUpyRjZ2dkt4Z2hsM2xSbUtCeHJuZlE1c09RUTRJeHU1Zz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd870a5-fe62-49b7-560d-08dec6d22252
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 09:24:55.8554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CnZncIXqvqVqSWlWY/oIU0S6sr4brzfDK/3fKPAstlbZJybL0ZWeVE6Bfn5z+bjyscbivDEOhTif4pMdyaa1ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8860
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_102500_975184_ED8B2B89 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
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

This patch series aims to add DY1212W-4856 [1] LVDS panel to i.MX93 11x11
EVK board.

Patch 1 allows LVDS Display Bridge (LDB) child node in i.MX93 mediamix
blk-ctrl DT binding.
Patch 2 adds LDB child node to mediamix blk-ctrl node in imx93.dtsi.
Patch 3 adds a DT overlay to support the DY1212W-4856 LVDS panel on
i.MX93 11x11 EVK board.

[1] https://www.nxp.com/design/design-center/development-boards-and-designs/dy1212w-4856-tft-lcd-panel-with-lvds-interface:DY1212W-4856

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Changes in v3:
- Explain in patch 1's commit message that mixing addressable and
  non-addressable DT child nodes is allowed.  (Krzysztof)
- Link to v2: https://patch.msgid.link/20260608-imx93-ldb-v2-0-1b1fe621bfda@nxp.com

Changes in v2:
- Rebase on next-20260605.
- Disallow bridge@20 for i.MX91 in patch 1.  (Sashiko bot)
- Cc Marco.
- Link to v1: https://patch.msgid.link/20260513-imx93-ldb-v1-0-d11c5c3cc197@nxp.com

---
Liu Ying (3):
      dt-bindings: soc: imx: fsl,imx93-media-blk-ctrl: Allow LVDS Display Bridge child node
      arm64: dts: imx93: Add LVDS Display Bridge support
      arm64: dts: imx93-11x11-evk: Add DY1212W-4856 LVDS panel

 .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 39 +++++++++++
 arch/arm64/boot/dts/freescale/Makefile             |  4 ++
 .../freescale/imx93-11x11-evk-dy1212w-4856.dtso    | 81 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx93.dtsi           | 37 ++++++++++
 4 files changed, 161 insertions(+)
---
base-commit: 6e845bcb78c95af935094040bd4edc3c2b6dd784
change-id: 20260513-imx93-ldb-c5a4194e41ce

Best regards,
--  
Regards,
Liu Ying



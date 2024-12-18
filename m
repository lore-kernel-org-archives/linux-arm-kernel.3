Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E128E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 10:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3TmvtIp6TKFB6qCchT2qS2F6A//YtbgrbPs/Ok7+J2I=; b=aeR1vA1QbJc9qynmF2nvj1BNPl
	/OOrASGxhWopffdEOVXKSjMC5vGbhXPKMdVk+XUjWI6W+bS0KN2PCqy1MAmg9tOXXtF9GPvb/aM1s
	kYMkfbnLA1MtEJtSREWNq+QNOQtI24kODuQKPqrCsu6KtO473zNOO5emiOR7xpPs25tL+SAuG1yPP
	nyJ0IHVZOTUqG52soWLIrNRugTSivZ4CFtFkkI7bvG4wUQs+N7PwBItnZxg4mMHI/WZXH/MYUio9z
	LlkU+RmKCnTR5ReX4cc5SkSJTURFk79qD0tCEtRAnKFBnmG+Clog6KUmgUW60N0Y5q671Lj8ShvlX
	2Qm35/uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrhw-0000000GLa6-3ws1;
	Wed, 18 Dec 2024 10:55:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqV5-0000000G8cx-2qpi;
	Wed, 18 Dec 2024 09:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3TmvtIp6TKFB6qCchT2qS2F6A//YtbgrbPs/Ok7+J2I=; b=it2XkMcI6pyPE7j7I0VycbFYjh
	huJpq29c2eJOMV69lPbfXQvsZhkZfub8A1e0v3nC98H1azQNV4WVBpCYwxZDq09Gx2MdJZav5A6k0
	gASwaNJowD9NyYK3e3JwgNOi8sO4NVxYr2msIuWujLtMdT828r7LlJJK/6tOV3lbWkNPGyhmyw5C8
	hSOM9NSPXXAqpkbpa4nS5b2hOONPK+no1QfuhVAATok3SE4X2fxyW0sZY3lgI7ZRPcPyhtcQFnsyn
	15hVAH2IgBIbJcZiLtOzig0mzXqQOigYDZqPzL2f3FNupNZiMM7gOm8StIhotMiOIvqdBoytXtUyS
	MRVk2szA==;
Received: from mail-psaapc01on2072c.outbound.protection.outlook.com ([2a01:111:f403:200e::72c] helo=APC01-PSA-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqV2-00000005DSG-1a38;
	Wed, 18 Dec 2024 09:37:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgo40ZE1WTtT+9nU32i8XkNbEzvSGFu5F7Qt/ot4ZLGXbGXsvMuEklNszewHbz0gyDYaTGsZtbfyNQyiVyq2Md92qLGTNUFx5UIxx073OwIvldm+7LXnbehjU86JS5evHI6AtDI46r+yB0pqG+iahf4hAG7iwR0fUksbNcj7fSt55UcQ4AiPZkU+NmcvnhoPAm6qLs2SZVDVbmXVE240/80n8twm/4QwJU+lIXOswemMazyxpMeHLkfWDac/naGQZmBL3dRJJvV8oe3kY/Ip8D6pyVLP+pVhYnV7KMQZ7lV1yInpciaEH6/qpL7goy5GnTwZMNKPyp+nUW4lbh1H8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3TmvtIp6TKFB6qCchT2qS2F6A//YtbgrbPs/Ok7+J2I=;
 b=ADcQT+qS3+GuJE7Yr06nZXoBX/xBDC63MIi0t2fRnJiy2FohV3yuLG2meh7nLP2IUnB3x9gqp39pOXexHidxE5KsazQagmgeQBZV2uiHKih+nm899Pt2d+piD7TvVeb13wMApYGxP85Fz5aeazwGyLadFOKCnXI1kIJbAPm3k9XXEjPn392GPKndSLY0OaQFC3IuT4duris4wH4GHvs0XfAxQxzDdxTKAifsF/5ahOJN8/gIaLfcUY7m0RkkT1wYH/dmM+m2P7nvqZCsDBaB8kRuTYeqzmHzEROx3xn5tWsjzx+f9vqdMjWui7Ggne52+hqpW/7VBqvt0Wp6n+J8GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3TmvtIp6TKFB6qCchT2qS2F6A//YtbgrbPs/Ok7+J2I=;
 b=AFTRI0LQr1F/H3JhArawVXxkVFlYRffjG3y6Dp1uy15VutFpy+uvR5nDtTOOTlSS4MWMMBYWszJLleV4A6eG9oWh0v11kzQdkPRe8+HJTGcRAmDhKL75IqZhzxckxxRLrA8N+OHPKJAJnT9jaZzQwqm4njNCMVkXHLN+tw6aIhnP8Of5u3uC0GdoMiJOs7wPPwgjBKCw30lC25HX+VuZnGyUytQcu+phjboVFNV64xnMBJYWJlUNZznGGP5HwxzvnPRUVE4QQ5q0j8C3QavCoiRW+zedYmmMPv3xUiYdi1YVCe+4PJiudQavYhcZyQNwk9M+A1s2CFWDh7ZJqCXLhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
 by TYSPR03MB7978.apcprd03.prod.outlook.com (2603:1096:400:47c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 09:37:17 +0000
Received: from TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123]) by TYZPR03MB6896.apcprd03.prod.outlook.com
 ([fe80::ac4e:718:3b03:3123%7]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 09:37:16 +0000
Message-ID: <23899c54-14ad-4724-9336-2df6fb485fd6@amlogic.com>
Date: Wed, 18 Dec 2024 17:37:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/3] pinctrl: Add driver support for Amlogic SoCs
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20241211-amlogic-pinctrl-v1-0-410727335119@amlogic.com>
 <20241211-amlogic-pinctrl-v1-2-410727335119@amlogic.com>
 <CACRpkdbuj-_sPpdfcyg3_QNtzt9r7n-0HBGBKgy-rKUMhvGo4w@mail.gmail.com>
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
In-Reply-To: <CACRpkdbuj-_sPpdfcyg3_QNtzt9r7n-0HBGBKgy-rKUMhvGo4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0020.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::7)
 To TYZPR03MB6896.apcprd03.prod.outlook.com (2603:1096:400:289::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB6896:EE_|TYSPR03MB7978:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cb79692-1429-4fad-a180-08dd1f478f6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0VQYzZ4UVhIY1ZudXY2ZXBKejVFQVhIMVJ4ZU9TZjVRVjQvNzVCdStkSDdm?=
 =?utf-8?B?NFlVN2ZjdjBSYkc1eDBBRHVETmNxQXludlVhMXgxb0J6QkRwSjlET1BZamFV?=
 =?utf-8?B?Y3FsNDNKSyswT1ArQlV1T2lxaXUyTDNOMmZBUERhYjEwTmFxMEpJZUVvTm5M?=
 =?utf-8?B?dUZzVmhIRUdUbzQ0cm50Z0t5elpIcmJTTUNwcFFwQnhCcmVLZU1CTmV2T0RC?=
 =?utf-8?B?S2ZuQisxa2FRTllDWEtaRkV0SlZIQjN3MjNYRDBRUHAxbCt2eE5McXlzWkJn?=
 =?utf-8?B?SEtzZU4xQndyajYyZmlTd1FVanhvR0RxNUg3Y3BiTXZjSUdDa0RwallDdHor?=
 =?utf-8?B?Q1cxRHZVMzVvQkMyZjVpMGM3K2dzQTRVMEd4K2x0dFRLUVRFU1dsamE3RlY3?=
 =?utf-8?B?ZGExbno1YnlPYSthTlNhc09IZjFTYlNKdjVQek1EdUc1RWxqS1FyTDZQd1cx?=
 =?utf-8?B?eFdKaHhKeWtxYjErNVZZZ2tiMzJ5NVRKNzZBOTNhR3JGWUZJenlQNVdOaWxh?=
 =?utf-8?B?T2pRZFJKenZDMTlROWxMdUFkNzRibStmVmpYLzd5dlJTY0RUTkZpcEh0d0Z4?=
 =?utf-8?B?MlF0SGpUUnl1akhGQndoV1dyZG1QeCtDNXpQSG44VUh4UWdEWnBYOS9CaWM2?=
 =?utf-8?B?TlMzVHZYajBOYzdUa3cxNUNPTUQ5Q2VWWDBlYUNudVhxZXNORGlFek8xQ1VK?=
 =?utf-8?B?VE1GYmRkSVJFUUx6R053K0l6TEVsZEtnbFJvUHpTM1Z4cHFVQzNFNlNURG1Y?=
 =?utf-8?B?d0l4YkI4UVBLV3h1UmRqbnNRU21qeVUyMFJsVm9UMjkxcytWaWp6bzV5UE1U?=
 =?utf-8?B?SUlzQld5QUIxWnNPRWJsRFcra1J5ems4dXpMZXQ5cDU1cC9TTnRpQU9aT24r?=
 =?utf-8?B?NlM1VjFyM1FCeHZFVTFaT2hNcnRDWFpVVDdSaUdyTDhaTVJldStTZC9XVVdJ?=
 =?utf-8?B?ekFtQ3lEQkM5Nk13akEyaDZvNUlKWXIwZkd4aUZrT0tVZm1vV0FadWNkdTY1?=
 =?utf-8?B?ajgvY2gxMHVsTVVQSDNlWUFiK1NaSHdVTG1MK2M0T2dHQXhteGdEUzA5Q2U4?=
 =?utf-8?B?NmpxYVRVTWNIRVRxNVI1NzFQWjJJenBEVXE2L2N0dW0wQ3l1TkJDUzVUSzEr?=
 =?utf-8?B?TEJPRk1TVmR0V1B1bkJKdkVlZUp6dDlCZitKNlRGWmlSTnBrSjVUUjRkblU4?=
 =?utf-8?B?NHo1aUpQSlE1VGw4TEJsWVdmblYwY3F4U1lIZlkwdjNsbnJxVTBYcnl2NHFN?=
 =?utf-8?B?ZzF6blFHbCt5dk5oZm1WUFBLRVZoMmw2TjBFdi96amJoRElCMFVYUU12VnBW?=
 =?utf-8?B?WERzRzE3ZnNEM25WZWZjM0dVc3Y4Rk1talplQm1NWmVtUi9LNUZUOUFDbW54?=
 =?utf-8?B?anAwbXpjcjdESVRIK3g3emc1c3lxdmNKZS8xR1JnSEp0ZzdESkI4aTZ5UC9L?=
 =?utf-8?B?ZnQwMU4wL2ZMQ216NzRjUFVvZ2tSQzNST2h0Q0E2K2xETStGVm5yYWJ6bFE0?=
 =?utf-8?B?K1VESnVONzVTMENkcVpKY0RVMk1tN0JTaXd6YnRkZGlwMzByNUMzVUNOR2NX?=
 =?utf-8?B?MTRGd000dmV1cEthamlOdk5semZ5WVFNZGNiaUEwMlNIUXVwSTRQSGxTTUgx?=
 =?utf-8?B?eHFxYjRjSHpoVXVkQWt6SUpwY2NrVldSc2Zvem9SUjYvWElON3VWM1V3WGx2?=
 =?utf-8?B?eUpBd1hCQ0ViVUx2dklWRnU5ZDgyaDJKQ0k3Y3Nub0Z4RzF1TnhDN1JJQmUv?=
 =?utf-8?B?cGt3YkF1UlN0akkrUU9aa1hLMjJpeWFXMU9ZanJ2T0JyYzBFcm5WUkJVVCtr?=
 =?utf-8?B?ZXVnclFzUFp5OHJzUi9XYlBhdFQ0KzRDd1JScGRFMmZvUUY4VW5mazhlQ0Q5?=
 =?utf-8?Q?SKeH5ED+oBge/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6896.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QitNakFYY28xZnV2RFVDUnQwQVNpSUU4OVIrTDdTcmgvUEZlRk1aM2FXUktp?=
 =?utf-8?B?aldNd3hnMVhQV2d2OTJXMnNoS01OV1lSZ0dSb0JEMWtmQi9TNEU4L0lZTnFv?=
 =?utf-8?B?OVE4ZjdKcWZJeXljNkxJK3FvZ0ZwOTNmem9rKzladG5CcVlxaWh3aW9UVUQ4?=
 =?utf-8?B?bjIwR0N6ckUrcTMvdTJZYmlWVHNMSXduazFNdzJOTFQyN0dILzVqWWk1SXQw?=
 =?utf-8?B?YjBDbVBJb3dYb09OMWpuS2g4MUJQWTZzeE0yL0VwMkVoMmNZbzMxMW9nTVRk?=
 =?utf-8?B?KzdZM2VyaHFOZHFRZVNUK0NvR1pNd1h3WURNelZUeVVGSGhtRSsxSWY4ekFq?=
 =?utf-8?B?T25yaTVjd1ZvSUlseSs2SVlvTHRoTEk1ZEgvMElISFpobXBDVHJZK091cmlr?=
 =?utf-8?B?cXMrTXlqd0pTY0Q4dkpEaFowd0pjVGZhblJYZWg3cTNkWVFqdkprSUd5Zkt6?=
 =?utf-8?B?ejM0TGh6cmJTTmVLaTRNMEFpZUw4WUVUbmZqeFFHT2F0MGRrZW5IUVlGbXA2?=
 =?utf-8?B?RTNYblpHZkYrUk9FeDc3emJ2d0JlRHlpSTc5Yzl2QnoybGRDRGZ6eWkzZWNt?=
 =?utf-8?B?QmUvMDRmTWFuOFhFdUZzSmlqMGdTL2xEY3N3bjZIT3JaczhiQjVEZDRDc2NC?=
 =?utf-8?B?VmRtSzRCK1lwWkRrSUxSYURkejg3T3lMcC9YaVhXZjJsNVlkcVVwRnlqU1Zq?=
 =?utf-8?B?eVI3czdFSFN3ZVBhZmFhVjdVUGFPbkg3VmtUT0oycHorQjNYdWl5dHVNQ2JG?=
 =?utf-8?B?ekZJeWlZdzJ1WmNPelp1MFZGLzFOaWZNc21aa3FXa2E4bDJoWVZuN2pOb284?=
 =?utf-8?B?VXQyTDhwWldPRVNDbkhTZUUyYkhGTVkrZ1h6WVBERTEyaGdPK1RLeGNUVzla?=
 =?utf-8?B?bzEzelhKRnBBUjVnVUt3UWtWdjY4UytXWnA4RDFEeW5KbEE5VDVMS1dXOG92?=
 =?utf-8?B?M244b0tiZEViUHM5eUNsdFVZQlcxOXdtclVUWG1RNExYZXBWSENSclNPdHdj?=
 =?utf-8?B?aTRsR1kvZEV3K3lYMkJzNDh0ZmUwWWxmcUtEd2xodDBtR3JkU3dWNFBGRE5T?=
 =?utf-8?B?dUNaWnkrZU9qNWRYQktXeVkxUy9ydk5CbnlMSGRHYndLYnpKdEZiMUJ4bDc3?=
 =?utf-8?B?OFZuelkzU0JDc2FXZDJJNitWSXV4REJydUpDQ3YrTzQyeXNaSFVGTFBja1Z6?=
 =?utf-8?B?ZzRqcmRhTFkvZ0xKejVhNjNSWUE1Rk5WMXpoaHdTSzVsYUdoVjhPUUZIUjA1?=
 =?utf-8?B?bDI2aGJUSERUanY4V1JXOVN2SnFEZ1NSN09xMmpUM3JPK0M0YU4vZ0gxbTN6?=
 =?utf-8?B?UFFKYjlPSU84dXJEbUpsZjZtTjRaR0VTY0I4MWVrUytnTVBWaFBkUmcvcDdy?=
 =?utf-8?B?cXB3alQydGFkYmJwSk1wd09QNTgvcGNQYzYxRkNraUNiVHF0YWtvUE5iaDZw?=
 =?utf-8?B?UlJQTWtRazZRbFBEc1BTSUt1ZzB2RElFWkVTYlBNbm1hc1ZhU2dPbmxTRmth?=
 =?utf-8?B?bDFZajRnL3c4M2p5TjgvMkJIU1BybmtzNHF1Rlo3cm1ENnJJWDdMMHFYNTBP?=
 =?utf-8?B?L0hKYnRCV09iN2JLYWZqYWZBVVY4S0JMZWZDc1h0UUVjdmRFSlV4WEpIRmpp?=
 =?utf-8?B?QzdpVnoybTN1cCtRSWpmTVRFZUVKNERWMjdVcUY2TWwzNW1OQmdGbzNSRkZk?=
 =?utf-8?B?WlhtdEhRQ2lYU3p3RElScGJMOGJrMFFnN09kVkI2bDlvQ3ROOWtCVEJ5TE42?=
 =?utf-8?B?OHpHWTgzb3FYdXFYTjhmbUlTcW9selcxWmhwSy9xY3JRYUU5dGlUejdkUjV2?=
 =?utf-8?B?c0JyT0pIMFNBbFhhV0ZOczZxd1lVOXpocUdZb3lJWUhvRDJYUU1WTDMzRk1S?=
 =?utf-8?B?MU5HTTZIUVhpdU5JT2NvTk50Vi9TUXdRVFhCb3lkY3pmM1ZvWmlGOG9NVVQw?=
 =?utf-8?B?cXlaaGlYcDQ0THArUnJLR09EenlzOWdPb3l5NWFsS2xablE5bE9zTFFCdjdK?=
 =?utf-8?B?VnEweml4eEZnK24wT1FWWE01UnBHMDQ5dmQ0Qy9CYmJZaTYzdjZrMW5wYkZN?=
 =?utf-8?B?UWZZSnV1cXhtV1ZGNWpDSmo5N0wxS1c5OXBKcG9GcVRQZjVmZ043UFNOdVN2?=
 =?utf-8?B?bUZGeG1Ea3BRcnRwdkVtb1Mzd0VNeEFBR3huRjdicTlNcm9TYXNWVGhIc21n?=
 =?utf-8?B?a0E9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb79692-1429-4fad-a180-08dd1f478f6c
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6896.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 09:37:16.7926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dqk1Ds68aHZvMNPQ5qU/KlLQLV+eNZezDb5wyiPDzxk21FiFxbaDDc8NyKzR/OTpE6muIGbf7oEYTziT4WpfpcY6dKD9xQ4+41lXoOS4eTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7978
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_093748_862528_4A4ECAD5 
X-CRM114-Status: GOOD (  24.45  )
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

Hi Linus,
    Thanks for your reply.

On 2024/12/17 22:49, Linus Walleij wrote:
> [ EXTERNAL EMAIL ]
> 
> Hi Xianwei,
> 
> thanks for your patch!
> 
> On Wed, Dec 11, 2024 at 7:48 AM Xianwei Zhao via B4 Relay
> <devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
> 
>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>
>> Add a new pinctrl driver for Amlogic SoCs. All future Amlogic
>> SoCs pinctrl drives use this, such A4, A5, S6, S7 etc. To support
>> new Amlogic SoCs, only need to add the corresponding dts file.
>>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> First: are we sure these new SoCs have nothing in common
> with sunxi? Because then the sunxi code should be reused.
> 
> In any way I recommend:
> 
> - Renaming drivers/pinctrl/sunxi to drivers/pinctrl/amlogic
>    so we keep this sorted by actual vendor, sunxi is apparently
>    yours (AMlogic:s) isn't it?
> 

It isn't. Sunxi is Allwinner SoCs.

> - Also fix MAINTAINERS accordingly.
> 

Sending the official version will be synchronized.

> - Add new driver under drivers/pinctrl/amlogic
> 
> - Do not change the Kconfig symbols for sunxi and
>    we should be fine.
> >> +static int aml_dt_node_to_map(struct pinctrl_dev *pctldev,
>> +                             struct device_node *np,
>> +                             struct pinctrl_map **map,
>> +                             unsigned int *num_maps)
>> +{
>> +       struct aml_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
>> +       const struct aml_pctl_group *grp;
>> +       struct device *dev = info->dev;
>> +       struct pinctrl_map *new_map;
>> +       struct device_node *parent;
>> +       int map_num, i;
>> +
>> +       grp = aml_pctl_find_group_by_name(info, np->name);
>> +       if (!grp) {
>> +               dev_err(dev, "unable to find group for node %pOFn\n", np);
>> +               return -EINVAL;
>> +       }
>> +
>> +       if (grp->num_configs)
>> +               map_num = grp->npins + 1;
>> +       else
>> +               map_num = 1;
>> +       new_map = devm_kcalloc(dev, map_num, sizeof(*new_map), GFP_KERNEL);
>> +       if (!new_map)
>> +               return -ENOMEM;
>> +
>> +       parent = of_get_parent(np);
>> +       if (!parent) {
>> +               devm_kfree(dev, new_map);
>> +               return -EINVAL;
>> +       }
>> +
>> +       *map = new_map;
>> +       *num_maps = map_num;
>> +       new_map[0].type = PIN_MAP_TYPE_MUX_GROUP;
>> +       new_map[0].data.mux.function = parent->name;
>> +       new_map[0].data.mux.group = np->name;
>> +       of_node_put(parent);
>> +
>> +       if (grp->num_configs) {
>> +               new_map++;
>> +               for (i = 0; i < grp->npins; i++) {
>> +                       new_map[i].type = PIN_MAP_TYPE_CONFIGS_PIN;
>> +                       new_map[i].data.configs.group_or_pin =
>> +                               pin_get_name(pctldev, grp->pins[i]);
>> +                       new_map[i].data.configs.configs = grp->configs;
>> +                       new_map[i].data.configs.num_configs = grp->num_configs;
>> +               }
>> +       }
>> +
>> +       dev_info(dev, "maps: function %s group %s num %d\n",
>> +                (*map)->data.mux.function, grp->name, map_num);
>> +
>> +       return 0;
>> +}
>> +
>> +static void aml_dt_free_map(struct pinctrl_dev *pctldev,
>> +                           struct pinctrl_map *map, unsigned int num_maps)
>> +{
>> +}
>> +
>> +static void aml_pin_dbg_show(struct pinctrl_dev *pcdev, struct seq_file *s,
>> +                            unsigned int offset)
>> +{
>> +       seq_printf(s, " %s", dev_name(pcdev->dev));
>> +}
>> +
>> +static const struct pinctrl_ops aml_pctrl_ops = {
>> +       .get_groups_count       = aml_get_groups_count,
>> +       .get_group_name         = aml_get_group_name,
>> +       .get_group_pins         = aml_get_group_pins,
>> +       .dt_node_to_map         = aml_dt_node_to_map,
>> +       .dt_free_map            = aml_dt_free_map,
>> +       .pin_dbg_show           = aml_pin_dbg_show,
>> +};
>> +
>> +static int aml_pctl_dt_calculate_pin(struct aml_pinctrl *info,
>> +                                    unsigned int bank_idx, unsigned int offset)
>> +{
>> +       struct aml_gpio_bank *bank;
>> +       int retval = -EINVAL;
>> +       int i;
>> +
>> +       for (i = 0; i < info->nbanks; i++) {
>> +               bank = &info->banks[i];
>> +               if (bank->bank_idx == bank_idx) {
>> +                       if (offset < bank->gpio_chip.ngpio)
>> +                               retval = bank->pin_base + offset;
>> +                       break;
>> +               }
>> +       }
>> +       if (retval == -EINVAL)
>> +               dev_err(info->dev, "pin [bank:%d, offset:%d] is not present\n", bank_idx, offset);
>> +
>> +       return retval;
>> +}
>> +
>> +static int aml_pctl_dt_parse_groups(struct device_node *np,
>> +                                   struct aml_pctl_group *grp,
>> +                                   struct aml_pinctrl *info, int idx)
>> +{
>> +       struct device *dev = info->dev;
>> +       struct aml_pinconf *conf;
>> +       struct property *of_pins;
>> +       unsigned int bank_idx;
>> +       unsigned int offset, npins;
>> +       int i = 0;
>> +       int ret;
>> +
>> +       of_pins = of_find_property(np, "pinmux", NULL);
>> +       if (!of_pins) {
>> +               dev_info(dev, "Missing pinmux property\n");
>> +               return -ENOENT;
>> +       }
>> +
>> +       npins = of_pins->length / sizeof(u32);
>> +       grp->npins = npins;
>> +       grp->name = np->name;
>> +       grp->pins = devm_kcalloc(dev, npins, sizeof(*grp->pins), GFP_KERNEL);
>> +       grp->pin_conf = devm_kcalloc(dev, npins, sizeof(*grp->pin_conf), GFP_KERNEL);
>> +
>> +       if (!grp->pins || !grp->pin_conf)
>> +               return -ENOMEM;
>> +
>> +       ret = pinconf_generic_parse_dt_config(np, info->pctl, &grp->configs,
>> +                                             &grp->num_configs);
> 
> But can't you just move this code around? grp->num_configs give the
> number of configs, so why do you have to go and look up pinmux
> above, can't you just use grp->num_configs instead of of_pins
> and npins above?
> 
They are different.
The of_pins(grp->npins) specifies the mux values for pin-mux register 
and pin index in pinctrl. It can include multiple pins in groups.

The grp->configs and grp->num_configs specify the configuration 
information for all pins of this groups(such as bias-pull-up, 
drive-strength-microamp)

uart-d-pins2{
	pinmux= <AML_PINMUX(AMLOGIC_GPIO_T, 7, AF2)>,
         	<AML_PINMUX(AMLOGIC_GPIO_T, 8, AF2)>,
         	<AML_PINMUX(AMLOGIC_GPIO_T, 9, AF2)>,
         	<AML_PINMUX(AMLOGIC_GPIO_T, 10, AF2)>;
	bias-pull-up;
	drive-strength-microamp = <4000>;
};

>> +static int aml_pctl_parse_functions(struct device_node *np,
>> +                                   struct aml_pinctrl *info, u32 index,
>> +                                   int *grp_index)
>> +{
>> +       struct device *dev = info->dev;
>> +       struct aml_pmx_func *func;
>> +       struct aml_pctl_group *grp;
>> +       int ret, i;
>> +
>> +       func = &info->functions[index];
>> +       func->name = np->name;
>> +       func->ngroups = of_get_child_count(np);
>> +       if (func->ngroups == 0)
>> +               return dev_err_probe(dev, -EINVAL, "No groups defined\n");
>> +
>> +       func->groups = devm_kcalloc(dev, func->ngroups, sizeof(*func->groups), GFP_KERNEL);
>> +       if (!func->groups)
>> +               return -ENOMEM;
>> +
>> +       i = 0;
>> +       for_each_child_of_node_scoped(np, child) {
>> +               func->groups[i] = child->name;
>> +               grp = &info->groups[*grp_index];
>> +               *grp_index += 1;
>> +               ret = aml_pctl_dt_parse_groups(child, grp, info, i++);
>> +               if (ret)
>> +                       return ret;
>> +       }
>> +       dev_info(dev, "Function[%d\t name:%s,\tgroups:%d]\n", index, func->name, func->ngroups);
>> +
>> +       return 0;
>> +}
>> +
>> +static u32 aml_bank_pins(struct device_node *np)
>> +{
>> +       u32 value;
>> +
>> +       if (of_property_read_u32(np, "npins", &value) < 0)
>> +               return 0;
>> +       else
>> +               return value;
>> +}
>> +
>> +static u32 aml_bank_reg_gpio_offset(struct device_node *np)
>> +{
>> +       u32 value;
>> +
>> +       if (of_property_read_u32(np, "reg-gpio-offset", &value) < 0)
>> +               return 0;
>> +       else
>> +               return value;
>> +}
>> +
>> +static u32 aml_bank_reg_mux_offset(struct device_node *np)
>> +{
>> +       u32 value;
>> +
>> +       if (of_property_read_u32(np, "reg-mux-offset", &value) < 0)
>> +               return 0;
>> +       else
>> +               return value;
>> +}
>> +
>> +static u32 aml_bank_bit_mux_offset(struct device_node *np)
>> +{
>> +       u32 value;
>> +
>> +       if (of_property_read_u32(np, "bit-mux-offset", &value) < 0)
>> +               return 0;
>> +       else
>> +               return value;
>> +}
>> +
>> +static u32 aml_bank_index(struct device_node *np)
>> +{
>> +       u32 value;
>> +
>> +       if (of_property_read_u32(np, "bank-index", &value) < 0)
>> +               return 0;
>> +       else
>> +               return value;
>> +}
> 
> Do we really need helpers for all of this? Can't you just
> open code it, at least if it's just used in one place?
>
  I will delete this function, I will move the logic to where it was called.

>> +static unsigned int aml_count_pins(struct device_node *np)
>> +{
>> +       struct device_node *child;
>> +       unsigned int pins = 0;
>> +
>> +       for_each_child_of_node(np, child) {
>> +               if (of_property_read_bool(child, "gpio-controller"))
>> +                       pins += aml_bank_pins(child);
>> +       }
>> +
>> +       return pins;
>> +}
>> +
>> +static void aml_pctl_dt_child_count(struct aml_pinctrl *info,
>> +                                   struct device_node *np)
>> +{
>> +       struct device_node *child;
>> +
>> +       for_each_child_of_node(np, child) {
>> +               if (of_property_read_bool(child, "gpio-controller")) {
>> +                       info->nbanks++;
>> +               } else {
>> +                       info->nfunctions++;
>> +                       info->ngroups += of_get_child_count(child);
>> +               }
>> +       }
>> +}
> 
> This looks like a weird dependency between gpio chips and
> pins that I don't quite understand. Some comments and
> references to the bindings will be needed so it is clear
> what is going on.
> 

A pinctrl device contains two types of nodes. The one named GPIO bank 
which includes "gpio-controller" property. The other one named function 
which includes one or more pin groups.
The pin group include pinmux property(pin index in pinctrl dev,and mux 
vlaue in mux reg) and pin configuration properties.

I will add comment in next verison.
>> +static struct regmap *aml_map_resource(struct aml_pinctrl *info,
>> +                                      struct device_node *node, char *name)
>> +{
>> +       struct resource res;
>> +       void __iomem *base;
>> +       int i;
>> +
>> +       i = of_property_match_string(node, "reg-names", name);
>> +       if (of_address_to_resource(node, i, &res))
>> +               return NULL;
>> +
>> +       base = devm_ioremap_resource(info->dev, &res);
>> +       if (IS_ERR(base))
>> +               return ERR_CAST(base);
> 
> This looks like reimplementation of
> devm_platform_ioremap_resource_byname(), can't you just
> pass your platform device here?
>

I will fix it.

>> +static int aml_pctl_probe_dt(struct platform_device *pdev,
>> +                            struct pinctrl_desc *pctl_desc,
>> +                            struct aml_pinctrl *info)
> 
> Because there is clearly a platform device involved.
> 
> I guess I will have more comments as the series progress, but this
> is a good starting point!
> 
> Yours,
> Linus Walleij


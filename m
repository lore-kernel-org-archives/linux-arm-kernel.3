Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0732CC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 08:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V92eLzl7WFjYkcaLkyF23clvxyH5DB4TnHnA0RrJovs=; b=FwNuEY2yQDhKh3MfQn5nGMjk56
	CHketChSfPuv9EmuAl4003jvYyUr2jY189Qh6KkC9bzZcKBWOmPRnXza1ff86tMMgqTHCKjHzf8OA
	EBQQfiGBMQ/qAvr4oUmva+ekKK0XASC1p5txm8CHLF+euBwaky3xCFBq1pcct9zSOkvePJxh1AaCw
	GVQYL2lHowanT8Bb8I/9Jma4dFaf34Li8C+EMEsim1T0B7MsZlfLoX/gfVw+QIPaiaxjxAg0FxA+x
	RVCwreGdS2QMe8Lg6T4wV4T02PoUJ/TPBF9vewF4qvO4JGwDmECPL0drA4hNFiiS0cch/dQQHrpOl
	4pk04BHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TuE-0000000Do1x-0ijB;
	Fri, 18 Sep 2026 08:25:14 +0000
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7TuB-0000000Do1M-0gBR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 08:25:12 +0000
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I5wZji3969914;
	Fri, 18 Sep 2026 04:25:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=V92eL
	zl7WFjYkcaLkyF23clvxyH5DB4TnHnA0RrJovs=; b=Vi8tkJeAd0moSFaNOELnY
	0CftJRrlqH+0cFsFMHvowj2xT+EWCDVkPptP69jet5/QaBnfupZdxqG3STSZFCDm
	n5QqsfAnvOOpItDkjInS9osOa0v88h3mxfl7jD53ZYchUrkbKxzwJf5y96IM5sU3
	a37x8FuNd/+pw9u1sTL3FV9S1jS65M+dXCouSR+QwKldvE6y9rXiyWEL0RpV6QlN
	YpEJ/Dw/8UpbBoS4iKR+76uI6FjpOVikuQzlaeqf2lYUn2zsAlQzapgzd93jRNjs
	sk2Sue0o7Ze4x4M9wE2MwN8umWKwVjvwnXyHYrWCoIKOwaIYnpWFsm49NbDpnV97
	g==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010006.outbound.protection.outlook.com [52.101.56.6])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4grk0xm0bj-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 04:25:02 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MOwJfh7SARjyGOXLqJFudjKVhSIYGYq30ZluZD7pkwyUL397va7T67J6eOLLdTVxxP1zZQWWmLaE6fSkQMfDlDFyfF7rgEv/S8BHu5tNxFBKE6bdywzMQZ7IF/rI6HqFqSMTK81t4vlLrf3O1vQZQt3HgHIf/b/RZ18a/yYmdR2bf3KOBDIa3nhtJe6hlV3+XfEIxFCNdcL0FtOwegqIClXC7NK9YeiMigDDRLw9fHARguGepVuiFqPYBmN4XVwoEu3jdjtZ34vOKNIG30uvAezK7pebYnBgftX6q/nx3hYtkw37YcCrElGlAhbKKMCG0I8BUGGa7u7l/IAWc2euhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V92eLzl7WFjYkcaLkyF23clvxyH5DB4TnHnA0RrJovs=;
 b=ThmpSYYnxdLu2nN1xiav7jgpRQJaxvY311qHUTKQlGVHP8MnZBg8/vAOrFeoWk4J2Uqx5kRzVvb072VXu0dalFzKaRGKUPs+y8JooY3Un2W/8HCZ4ycqhCulvlUBAnNk5CIJRwY75eAb8AFOYpRxOHYHkSfqCd60z7/xe4vbhT3dcXPtguQDya1h9td9c1Yoc72z8kiOw+d24HUOghxW3J6LeEb/M/j/6V4BYUs9sGaK7wJWYZddXlA0zFjls+RSfsJnDWBqZZNZv/9t5BVgZxfEYUgcO3U6kavwjkMLchDe0aUC50hTf/RS7d7DyJ3cVlmVxXbgCQiXTOuYWlGq5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by DS7PR03MB5414.namprd03.prod.outlook.com (2603:10b6:5:2c2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Fri, 18 Sep
 2026 08:24:41 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 08:24:40 +0000
Date: Fri, 18 Sep 2026 09:25:46 +0100
From: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-spi@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        =?utf-8?Q?Am=C3=A9lie?= Delaunay <amelie.delaunay@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        Andy Shevchenko <andy@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 01/10] dmaengine: Move enum dma_slave_buswidth to a
 new header
Message-ID: <aqz0h9_imnsh7EQR@nsa>
References: <20260911-dmaengine-support-wider-dma-masks-v4-0-72b8fd4cc78e@analog.com>
 <20260911-dmaengine-support-wider-dma-masks-v4-1-72b8fd4cc78e@analog.com>
 <aqgCQvRw9fns__0d@SMW015318>
 <aqjzvxI4ecoFvRLT@ashevche-desk.local>
 <aqlYOHIFU_dB72I3@SMW015318>
 <aqvFFg5Uh1cXln0y@nsa>
 <aqv7V0E5GObzw9l0@SMW015318>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqv7V0E5GObzw9l0@SMW015318>
X-ClientProxiedBy: MA3P292CA0019.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:47::9) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|DS7PR03MB5414:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d13e0a3-52fe-40f4-b4e6-08df155e48d2
X-LD-Processed: eaa689b4-8f87-40e0-9c6f-7228de4d754a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|10067099003|4143699003|22082099003|18002099003|56012099006|11063799006|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info: wTiFy2du27eDbSSX3Hiq/Q8oCEo9s9L82JErq7aw2rXa7dAWGWnf31WFt8FbXCeeRXr/GV6hzcx6v4NtMGkhmoXz6mgK7x1Gvu2WfRGumm4ev6vY3k8Ko3wnhGChI4mBxuu2+ZTzrLslj+0vckAkkSkPy52p7IFoBwFO3lJAofU44eoUhgLM8bBjAqooZMbaCe803fYiTj/ySHyZ6PjRxnRTSPHA4NtbUgxTRKUPc3ZAoVXzQDeaYHhJxxNuWHifYR16hC55Tj24lLIx+xvQSNGIpyGIYjvH/bK/oliObVU76R0EdPxCJwHT4vci1/o2KzN0gAdsYRl0Rqap0tDjeiwG7aqssfcBujj5l6LUYy4WCM7WNVm9mpETOJOUW+7h2Dblrln3K0oLY55PqEVckQmDc1wPSSHpoZI0F1dOMGsA433kXhWMBxveIkdbVwDLxXpWVmejbSewDRYMnl5vg7nM7atuGQZYcFqSZVolxYNvL/Sg9GbAqJV7oafbqQ5+sFLgQjOyg4prmsiuWswCakrC7K79G/4jsFx6jYxI50T46ZaeQqn5Jvs9oZXYaVz1qe2irRUjDuW6XE5PCnuJTBXFKno+rqTS+CCM/1PbZtOq9Wsp539MPfyImipJoE/oPwHhmWsunKXeTEsY7IGRg1lALso+gCLUNwtjKTFEJ8U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(10067099003)(4143699003)(22082099003)(18002099003)(56012099006)(11063799006)(5023799004)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTJpOE1naUFJSWxRZFdrZUlUdXFkMDdrNW85SU0vQnI1b0JIZWdPNmFBM0du?=
 =?utf-8?B?VTB3d0RjRXdqdXM3Z3d3bm1hNWpLSjhqbi9ReitWS01OdkpqMW1ITUhlbWlJ?=
 =?utf-8?B?OXQ2QVVhU0ZlSlFjb05Ya0JnWGErU1YzbFp1ZCs1cU4xKytPVVZOczNCaVMv?=
 =?utf-8?B?TGtYK2JKWnlyVUwxQ2RwM2Q4L0hlWnpjWnMyWFc1OGI3VkhibmUyUmRXZlhZ?=
 =?utf-8?B?ekhkVjRJRHZ6QW1hbVRBRjBqM3NmQUo0aHVlYmRwYmVNUWU5dmNOK0pUbXdw?=
 =?utf-8?B?b1JSUSsrL1Z3V1dabmxpb3VsWFpkNEc5MGxmVGllejgyNnlWM1lrMW5DMmVa?=
 =?utf-8?B?dWc1N2tYZjBFQWhUV1FENzhOSFYrQXVReURXYWZYKzRHRjVtcFVwUUJpNFVT?=
 =?utf-8?B?SUY2a0ZocnllWmhqRk1rZnYwanVCMGpVN1ViSnlJdXRBakdnRjJVbTQ0MjhX?=
 =?utf-8?B?blBGbGhNdG5ydThhRDJoTzF5WHVkMFd6RkEvN2RPZFVKWUtoa3lLcUZUZjNQ?=
 =?utf-8?B?emdBNHE4dllhbXYrT08xVDRDY0FlRVNlZkZzZEJwM0hSTzBxNUc2K1BjMnI2?=
 =?utf-8?B?UWZOZnYyVXRIdnJmdWlBbjFWazV6QUFHeTJzVnJya212VXZiUkRGRUU5dy9I?=
 =?utf-8?B?T1loR2REekRZRDM0QmRnblkyZWpJeEZaVEc1VGw1VVNPdFozb2lFRHFLOTZP?=
 =?utf-8?B?QzJNY1FwT2xDOHNlV0lWU2t0cDZRY2xOUlh3STJ6cUJac1ZyZEhkWkEzL3p0?=
 =?utf-8?B?R2sxRUtYREhEbHlVUnFMMWZxZEJIenkrV3VZbGhoRFJodE9uYUZXMzVjUVpa?=
 =?utf-8?B?dHFlb3hnQlpWZnJhRWtyZDlXa1hoSkRyV2dEL2YralVBanFUVUVqZkJpWEk3?=
 =?utf-8?B?MC9GVEtEQmxUY3FtZXhUV1RPOXlZM0duNDhaSDhhT2pRNW5MUUozVTFZTnRZ?=
 =?utf-8?B?SXp5Smh5YjJndCtQbTBNRnZ1Yk10Y1gxZWNQUExBMU5WSVQvUGdaVDFKZ09s?=
 =?utf-8?B?MXZSZEdKQVhjV2dyMk5TdXBBZ3czdERNZmtQTjhodjRqTWxpV1FhT3BtRmhT?=
 =?utf-8?B?ZzIxWUFjOTJiSUhPaDNzMTFpUUhHckVWVVlnK3FIUCtDaGt0Q0xDWEhLU0xq?=
 =?utf-8?B?QkVSS1lSMVhKSFYvbG1iTVJIVk1ZMUtkSUxBbXl5TnF3MS9hM3B2N0dBbE8w?=
 =?utf-8?B?Z1VLNWZFcmZFNHBXWFZoWEJaMW1PZ3hBVSs3U0g0VlJ0bXlzMGFBSDNpQVBY?=
 =?utf-8?B?czZ4aVNoUS9yenZDdk9KcTM5Um84YjZjYm9sV1NXL2pka3dVb1hIWkd0QXRP?=
 =?utf-8?B?QTZVUDlTYnRwbm9PcFhMTkxjZzc4Zlc0WVdJUWhCU1JGTDBuanI1b0xFRlFQ?=
 =?utf-8?B?dzFBSHg3V2dzVVlwQU5LSm50RHNQMzJJWVNFRFovWFN3U0lST1pjNEhQUncw?=
 =?utf-8?B?NGdkSktiSGhpNEZFNlBUZHp6S1oydG5MTW5NSGljSHhXMzRkdVM4d1g3WG5Z?=
 =?utf-8?B?U1lSWGxPQTZqcWVPdHBJdldZSEZnMkFiZkFMYkUyTW04V3NjeS93Wk9LSTYx?=
 =?utf-8?B?bGxiNTQrcy9sNXJGOFFzUG90UUFyS0lNK1BsQ3Z1V2hoSDBhQmwwVW9ETXNB?=
 =?utf-8?B?ZjNjZWVWQjlLUGNQdXR2Y3dYa2ZVQitkZGl0dHI3cU1CK0dmSHFTeEJod1Y2?=
 =?utf-8?B?VWZSUkxXajl1REQrTFpIV01nbFcvdXR0NDhWT1RUWHU0dkpDbDZBUzk1dkNj?=
 =?utf-8?B?ZERLOG1uMHpwWW1Bb2x4NHNKUXhrcTZnWTJZNE9tRGdaaWMybXI2Q0c1Rk0z?=
 =?utf-8?B?MS90ZzBqc0Fmc0lOdEJHRGEvSDhrTXBUVTRwTlY4QUxGdFAzYVI0NWN4ZlpW?=
 =?utf-8?B?K3pPZjhCcTZYSzA0OXFJa2hPWHRvdVlickliR2lLc3BUaldSVG83c0xTUnp5?=
 =?utf-8?B?VW90TnM2cThjdEQrdmZDN1FRcDFVakM3M0xwUm5JQmZ2eG9LRk1LaWNqTndX?=
 =?utf-8?B?S0ZEMXp4TlJvTWFRaUxWSlVsdmZWZzBaRHFLZUR4QVFMRE1HM3U0bk5EdkxC?=
 =?utf-8?B?eENMeW14ejdCVWxRNndkTlFEZTJTZzVGOEhIVFRBVzJUT3Z2TlZBOWJkZGRN?=
 =?utf-8?B?TzBJUE96ZkNBOHpkY1ROVTNXN29rc0J4WU45KytyY2pZajhxdVhjRFpvRDNS?=
 =?utf-8?B?aDhNbURvWjZ6QzhWaWRPazNleVFYMCtFZHVkTU9WbVJVK1JqblZ5MlhHWGFn?=
 =?utf-8?B?NmdDZ0JRSitIcnM5MVZyL3BwOGtYYVdBTDF2T2VqZHREbEkvWENRdTd1VFYx?=
 =?utf-8?B?aDNkdktpVVpSWmZrWXZ5ajgwczZFc3FtYlBrNjd5UEU4WGhDdkY3Zz09?=
X-Exchange-RoutingPolicyChecked: ztHTuRAdnxF/3PkMb4UC9SOlKs8NeTPre8qdVTXr0MGb5okmfdr5yRmUUhwR06efnEbhRsZDrB9UE0mjeHmQlDytuDkK6Hs9VdoEedcgccYxNIpILkv7wKcwW1V5vIIRcrRxd8BYZF8pRgrjWjQrN/666E4teC7LuTYF11hs/ZyJ11EDtOr2UwHDzJUTim083rkk5z4r+SNbGLKQbVs4N+29IYYUZA2MVwhjUNC/ZgsUpx9U0295lWXHVPapfiOEqDhhvI42aZHsHU+o4StTY9L1pshHNfa2DR4+wHnkl5v0XkSXDoC9zrchPAYrZrJE56HLvVwv7q+WCtoIZJHQFw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d13e0a3-52fe-40f4-b4e6-08df155e48d2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 08:24:40.4278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n7SdpI/zmo60paq+VH9QiHg+3lKBgN39K2AW2ovfVYP0f/D5yWXZC6E7h5iwBBJ3/sIc5/w6hSnFrFxg2UyFog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5414
X-Proofpoint-GUID: 3BC0zRHVcRBhLz6HWl8qe1oPoFzr1gMG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDExNCBTYWx0ZWRfX1H9rn0SHHVjd
 uHii53QNiZqKjnia9uksW3JKf7s4yNZPWtjxxAOuwEaQshVx97L2HaEm7799xivSXHzsYwr7WzX
 s9Wg3p73blufz8J5hgFrW1qH7TEYR1ncQG5Kw3iFh6EMRK5d9e10TIMNwijDFtCDJy8pMPUYGQ3
 kRgOan9PulPBP8zB+MLJoUGi32Zr0CKNiI7PlVofVU9YOjUFzwZ5mFPztTAx2GbRaanRFR2NUE9
 4cnXuv8+cP1QUPjj2MOi4CeuEKRy1guhYPNMsBCWT1huhUN5YmLxKMuI2SBwJNmfnfYuprYEsqR
 NHGDhP2YEUGvNQpbu7xpYfkiJhxNCb0wtAulTy/fkfBhw0I3mVcN4ISu33WJYbelenU3upoL6EW
 3N2B0HJ/EnYI+dLtyZQ4xI6BFB5kSwc8+t+rG/B0uY8+Agz12uZjVnFSeQ+GEsX4oPtiQuC8gGE
 vwRl51d3mi3F2VGGG1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDExNCBTYWx0ZWRfX6xPD71PV+f70
 firCzvnG8qXGlz2X6r+tAvU8anPfGjFs8wRCzAZ3nVYEqeetht7dPtR6g7m7eDlMjyfVSpv6eeg
 4FO4xgV+BiteLbEzt2W0NewTdZ6E8kqEpZJGrEdURGWIppP8LpWh
X-Proofpoint-ORIG-GUID: 3BC0zRHVcRBhLz6HWl8qe1oPoFzr1gMG
X-Authority-Analysis: v=2.4 cv=OtXaWC/t c=1 sm=1 tr=0 ts=6aacf55e cx=c_pps
 a=AaT4FrH4hTNSk8p5YcQWtA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=Z0pTeXoby7EwIRygza74:22
 a=nLkWnR5gZcZ_ozkXj8oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_012511_213359_4B01F02D 
X-CRM114-Status: GOOD (  37.81  )
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

On Thu, Sep 17, 2026 at 09:38:15AM -0500, Frank Li wrote:
> On Thu, Sep 17, 2026 at 11:49:46AM +0100, Nuno Sá wrote:
> > On Tue, Sep 15, 2026 at 09:37:44AM -0500, Frank Li wrote:
> > > On Tue, Sep 15, 2026 at 10:29:03AM +0300, Andy Shevchenko wrote:
> > > > On Mon, Sep 14, 2026 at 09:18:42AM -0500, Frank Li wrote:
> > > > > On Fri, Sep 11, 2026 at 06:25:36PM +0100, Nuno Sá wrote:
> > > > > > In preparation for the bitmap based bus width capabilities, move
> > > > > > enum dma_slave_buswidth out of linux/dmaengine.h into a new
> > > > > > include/linux/dma/engine/types.h.
> > > > > >
> > > > > > linux/dmaengine.h is included nearly everywhere, so growing it with the
> > > > > > new interface would make every one of its users pay for it. Keeping the
> > > > > > basic types in a separate header lets the new interface live next to it
> > > > > > without that cost. linux/dmaengine.h includes the new header, so its
> > > > > > users are unaffected.
> > > > > >
> > > > > > While at it, add the missing kernel-doc for the enum members. The block
> > > > > > already opened with /**, so kernel-doc expected every member to be
> > > > > > described and warned about each one of them. Describe the UNDEFINED case
> > > > > > in particular, as its meaning depends on where the value is used.
> > > >
> > > > ...
> > > >
> > > > > >  include/linux/dmaengine.h        | 20 +++-----------------
> > > > >
> > > > > I think it is good to split dmengine consumer and provider header files to
> > > > > hidden dmaengine's detail.
> > > >
> > > > It's indeed desirable change. but isn't it a bit out of scope of the series?
> > > > I suggest to do one step at a time. Would it work for you?
> > >
> > > Yes, but I hope the file name is finial expected file name. it is okay
> > > just move enum dma_slave_buswidth to there now.
> >
> > Hi Frank, if I understood you, you mean to have an engine.h as kind of a
> > consumer and have enum dma_slave_buswidth on it?
> 
> yes,
> 
> >
> > If so, note that enum is used both by consumers and providers so having
> > them in types kind of header makes sense to me. Kind of the same as with
> > the new widthmask header. It's used by both.
> 
> Yes, generally, provider include consumer's header files.
> 
> suppose detail dmaengine implement should be hidden in provider header
> files.
> 
> consumer is just subset by use provide APIs. It takes time to implement it
> but can start work from enum dma_slave_buswidth.

Also, don't fully agree with the above. Take gpio and clk as an example,
providers don't automatically include the consumer which makes sense to
tbh. Maybe in some rare cases providers also need access to the consumer
API but that should be the exception and not the rule.

But we do have both flavors in the kernel (regulator provider does
include the consumer API).

IMHO, a full provider separation between provider and consumer both
living in include/linux or include/linux/dma would be what makes more
sense to me. Then a private header for the private stuff could indeed
live in drivers/dma/. But this would be a much bigger refactor.

Anyways, I'll reply to Vinod on how to move forward.

- Nuno Sá
> 
> Just choose good filenames now, avoid rename letter.
> 
> ideally, As vnod said include/linux/dmaengine.h is consumer header file.
> drivers/dma/dmaegine.h as providers.
> 
> but some dmaengine driver outside drivers/dma/ directory.
> 
> Maybe we use
> 
> include/linux/dmaengine_consumer.h as start.  wait for vnod to comments.
> 
> Frank
> 
> >
> > - Nuno Sá
> >
> > >
> > > Frank
> > >
> > > >
> > > > > suggest name
> > > > > 	dma/engine.h
> > > > >
> > > > > so we can start move more API to this files.
> > > > >
> > > > > after all user include this consumer header file,  old
> > > > > include/linux/dmaengine.h rename to include/linux/dmaengine-provider.h,
> > > > > which only include by dmaengine drivers.
> > > >
> > > > Traditional naming would be
> > > > dma/engine/provider.h
> > > > dma/engine/consumer.h
> > > >
> > > > --
> > > > With Best Regards,
> > > > Andy Shevchenko
> > > >
> > > >


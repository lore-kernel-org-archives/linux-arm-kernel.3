Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FA6CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 09:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ocDHsfDzdG2uwJ0eDpPajnSijdw8Ml7Mn5WdJhBpz88=; b=dGutWVG5TZvVI6MmvuHwoI1M9w
	I+itQnI0CNJ6aDi0qJWQiQ93sBvPHPNGd0RU+WI5g82RR3iPgpm6tBym0PSW6KXGKGfoJjTR0zMd9
	WQaAVoBoFjFuE3v0zFaNq6DnXRzyrMtlzaARE+/hiyx8OnoiGKqBuu+1oCjAS59V0SZ/kY4G8SACc
	3majKd96yuhkLigk17TA2LoS5T73SjF6KVzVO8IcuY6GqsiaNs6ki9H8HHv1ZQeb6RRIWZSAXpjFb
	NFpfh6K/VwmXa/RUauAIWnKNpoqwSEbxvkkzkYtBjSi2wr0wXW/VXUfE/I6BgeUr2j9sdKtyjcFFt
	hjmq9J3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5l5-00000001tUg-3GaU;
	Wed, 13 May 2026 09:20:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5l3-00000001tTo-30zc;
	Wed, 13 May 2026 09:20:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ocDHsfDzdG2uwJ0eDpPajnSijdw8Ml7Mn5WdJhBpz88=; b=ieN6eVogNVuOMIuusDBw77kLMF
	7z0V5pv2rDPTz69OK8t2oJaCCAzd14/EjuyYfcsE78sfAaR+MgwY4Bxg+Guw5h1K3mYEarThkcTj9
	xFRw5RYVkmu6CdvCjXU1ES0xVlWzY/et6qunQtc23Oe80nyPwy8mzfqAvkUpdLU6OigYApfMM7zMx
	JlLrq7TY4GjeTRwm+HxAdw3hv01ZEF8gycs6hclSE0zPM4O5Zo+gpqBN9jor0nnDcu4gk5jtH6G6U
	rTzBxlT+OcCaZe8bvrxlPGp+6TgH/zSK1AR0H8oIp0PhWBieTDFezReURL9w7Gy2yKMV1rtLIZZXf
	8JOT8Xxg==;
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN5kt-0000000GyE8-2kah;
	Wed, 13 May 2026 09:19:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9rmdpzyXgSOmtSahpEAmaL69OoIet8TB3kQc/W3SbAxGZ8/hewfBs+xQiPSAfPCgXhI74mJEYAtlZbWM/J9BzsmI7KFk9bqsz+Dt9QaFOXO1LTRZ3HoHg4ypCw3dO7DM/uPGXQC7v3LztCO6C5616s0RlpMNeHy2Vp0o5bLL6thjELzt1DPfLYb+mVrrgOKbNjDA6WOouA8SOwzV4udIYQWyppAaD88ZP31CwrpMaPMKN4pP9Lg4D70Urh5sY402xOad1X4TX/ZXXc6LR1dkM+r2iO48p0Jffyont1s80w8AnkHzyDliFbvF3tpl9cY3ll7pWofXDpaIperwXZVtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocDHsfDzdG2uwJ0eDpPajnSijdw8Ml7Mn5WdJhBpz88=;
 b=n6T1BmuABqj2YFQiWfhpNyRsVvcMJxjkRSWJ+iykjHjtjRcpYTuz2RWrLxlysnk6xtE+DmKhCU2SFwsTNxPLTtNBLy4HHqeryYvITsZaU2Pq/mA+9556qZ3bg0wQJI3YKV1tn8nG3kgAIISRtV86pfEfvdqTIU1T5TlsQWMgUqvg3PQ3EvuTXoMVefu7YeUOREZCKmmcsy81Msco6WycGcPz6vXkdfA/mpC+solsBkAzA83CuhfkZPICaxv/ITOxGy8jG8VkjPYvRGgcz1N617//pAwwMW87rWuxKCouSspRKU+EB5DHrykWMObooR9oh0+5MR7CigK93QmXwNkfMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocDHsfDzdG2uwJ0eDpPajnSijdw8Ml7Mn5WdJhBpz88=;
 b=Qf0fCtIoDoZGG7KKlMYm26COeHMlI75hrgOthV/U7dP3UZNJuBlUBIPUsmAtk/uEC3kraFBXfpfF0+DmsPyFyEACA2eixq48VNTRaPDT68ngUE1BKUeAc4kjBNsLS/GXXJ0vVPLoU4Ks8H8O7vbVsh5FK+caiJZghll6r3wKtbcZjyNmdbRx6qOH7pZ9+Bb9n2mVm3yJVZraAPft6290te6tCQ6Le5uQiajVTkMjaV6pEUx3Ac7tn4uLAKRdGRESpA84pseyfVG7qRhR5OdFhvGBj8VMonzUEoZRv1ksUaBmk1KU69yh+/S67vP3tyzr8nt/EUbcbtc35LyYo7BZQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by KL1PR03MB7039.apcprd03.prod.outlook.com (2603:1096:820:dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.17; Wed, 13 May
 2026 09:19:27 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%5]) with mapi id 15.21.0025.012; Wed, 13 May 2026
 09:19:27 +0000
Message-ID: <b110ff02-9469-4b67-aecb-0ea07c3fb3e0@amlogic.com>
Date: Wed, 13 May 2026 17:19:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] clk: amlogic: Add A9 AO clock controller driver
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Xianwei Zhao
 <xianwei.zhao@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-10-41cb4071b7c9@amlogic.com>
 <agH5q01HHszGc6ud@redhat.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <agH5q01HHszGc6ud@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0039.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::17) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|KL1PR03MB7039:EE_
X-MS-Office365-Filtering-Correlation-Id: 0499ae9d-2e5f-4e3a-8660-08deb0d0babf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|11063799003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: yV8oGk6r1HF1fwElRllanQYaIJfxzbNcoyzM6qQCHdSWsjQiyap4hbbFokPt1M1vVOBu7dVLPN88KepQbfqu6NpgoNUVjSR/vRVMmVgxVxaS4QmtFFbIxOS0g3BXrN4edr6sT4Kt8Onlh3STddpky3sn1jgdWY32IKi6j+MYxJe1G+3icyE5XAWxb6aMn5ftFUPbh+u74iuaJWk4/RrckYnZCAQHduGjEVUJpHi6bTND7iomCnwz5hzVxkW/S/yPNsTGqrLdugX1bDbHSHGi9vLP50uvia3Bvldr0OgVycsCndLgXwtl7kDvWBJwgBzYMpuNVqysPIJJ1zcZWaoALeY1kXYDPgW25brfHkb/fKPlbyOg+jCWT2snP892np/wBAUOG0dAf6BGcaAFWpoLtukxCVFLOxWwkYZEpfEwhAO+SVI+hT2+rYGwUvwlvZMEs7rYlvC2BXme+OJVAPwZ9XPn87qJBBHsBnmyW+Xm3VDJQpBcPev9tNUK+MI0PA+XWDUFKoOEPqSHfXkkAqr5s7d35ad3HuWuIQy7+ohT7Op2g2C51sjazqwJfIJruz8bn8zfKvf5hTXh/yqAzENlPdeazCDeI+oduK6m7pbZgQuieN6OCdE9faWFMht273OngJx8jSuxWIBQThjeb6IltM8d8ISm0HMmBsht0cNi2iy1Zj898gtKrfwRGhqnoayH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(11063799003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDg3ME5lVEpWdzBFK0Vtbm1aOThqZU52L25pdTNuTnl5bm5MSjN1Z1hmdVo3?=
 =?utf-8?B?emxTUllXV255RVlwcEZTSXhmUnpzZHNPNllLTXRTZmlEUVB2MlZTeWtIakth?=
 =?utf-8?B?ZnNSS3RtcmdPRG1rWFZlOXE3RkYra0pRZnFHWk5pNnkreXR6OXdwOXlkcml3?=
 =?utf-8?B?aGgwclMrTlBxT0gvYnA5bWxyZGNPQTBvekgvSVhpdFllYXIxMHlkVGZHeG9G?=
 =?utf-8?B?Sm0rQVZwUTZGY2hBZFhkbFoyUnlFMGlSNmx6TlBJRXVYbVN4OEROSkQvN0wz?=
 =?utf-8?B?K3BhVk40RjVhZHV0cytRTjR3NnZUZW5UVjBjR2tYRFRLbk1seEZZdm5yZ3FS?=
 =?utf-8?B?WFNFWi9uZ3dBaVk1bktjYnB1aHY4OUdqWVhiZ3ZMa3NRbithQm1NNHRzbWd0?=
 =?utf-8?B?dCtTQ3ZrdDBXd1RpSWJkdTNCR2hQdkVrS25zLzZ4YlluSWZQRDZrcWJhclRh?=
 =?utf-8?B?MEEyQU1aLzQ5TGYyV0Q5ZklURkFnbmNvaWRqN0RHUm1LMG1idGFaeG4vR3BT?=
 =?utf-8?B?VVY5NnFDWnhoRWZWVGRuQVBsRHNpZzVzZHVWZitZTmVHQzlOQTlUV2dYYlJT?=
 =?utf-8?B?OC9xZ2dnZm1WK29XaExOTklMMitMYkROakFMdDRTSkNSRlMwWGVQcGN0Z3hF?=
 =?utf-8?B?T1JGWFlWU29SYmJZZzNadytuRXVLM2tpVzRES0F1Q1U0dnRhZ2dGZk1kYmVk?=
 =?utf-8?B?VGlnUlN4WjcvSnBpeE5jaTlrUXJVc1o2VGcxUWdPS0Izb2trSG9iVjA5Um1o?=
 =?utf-8?B?aFEwa2ZleWFSR0Qva3BkemNNTkNkOFJlYXRZVXdBYlI0SWgxM05zZnZhV2U0?=
 =?utf-8?B?M290aDVFVklEMDM2NXRrVTdENFpKYTdEeWVyTU82dzRpSFgxaWtNaEVjaVZC?=
 =?utf-8?B?bGc1UVF6MVkxWEZqWldEcFU4SzNVRm1EZUMzWExIZFpKT21BMmF3OHNKTUN5?=
 =?utf-8?B?cmFwb0hEaXdtOFNGN2pFNmRqRGdxMmpCQTkrTEovRGIwRi9LVFNCQ1ZUVUpv?=
 =?utf-8?B?WHhQRXp5WEZDSTNvYWE5T0ZCT3MydCt6TWJCdUZFNWx5UHhMaWk1b3BlSVJR?=
 =?utf-8?B?TTdKU3ltVzhscm9ndDdLSlluaGRXUERvc2FsUHZ4Tk01eTg1SnowYmlaY0Vk?=
 =?utf-8?B?Uk50VTZ0Y2Z0b25FcUZZUmdVQUF6bHg5eS9id0xVQTJjSzNWWEpZWUYzcmhP?=
 =?utf-8?B?YkdrNGxRUVg0VWs0ck9CMENpQUw4OEcyMzhhZ2pFQlhaRE9Nc0ZIb2tpQlli?=
 =?utf-8?B?cllVb1VFeSszbThZUCtONEtIaTJVMGJiemYzQXpoZ0FjNnJLZUVZdG91aW0z?=
 =?utf-8?B?RVdmU0hZTjFQd0pOaVk3OVlpSHN1SS9aR2xHb1JxS212OFRzdm5YR0dvczUy?=
 =?utf-8?B?T2lYd0c5RmRJeThkZGxjeFhaaXArRElzTEQwS2REMnBGOXZqeDRWYVFENEMz?=
 =?utf-8?B?alF4ZHJzSktCd3FTZysybmlGNkR5MFlDbytkWnBHaTV1c0orOEtMOG5RMkRq?=
 =?utf-8?B?WmFCS2poZHN2Y2dFUGVtRmtpb1hieTQxRFRRRzVvSms1SGIwRkZtMUdIL1J1?=
 =?utf-8?B?bWw4OWEwd1VKbENDbERkdHNiQUNmb2NjYmYzL1V1U2dXVllHdkJpZDFiN0h5?=
 =?utf-8?B?K3ZRWTdZM0VEMTNkYmxBVEZTeHAwd2tZWCtodU5mZ3ovaFRSRlZydlM1YnUr?=
 =?utf-8?B?TTRuRXJPaVhPMzVUdVpGYUVwdkxSNWJUVmtTOHZ6SjVJSCtLZnF2aC82UWdx?=
 =?utf-8?B?a2JZOEJTZXBVczVxaUZ1WXhOK0hGWW1OR0ZqRk9MVjJNRktUSVEwUEY4NEhY?=
 =?utf-8?B?RDlQWHZmZWxZdGlTWnFjR2NxOU5yQ0lrN0xCUGN3cnBwNWVwaUk4YjFLVTNa?=
 =?utf-8?B?bWxnWW1vWjhzdGFka3Y4VlNRT1lnZEdtcEUrcnpqZ2tMUERBdVptQUJja1FW?=
 =?utf-8?B?cFhlR3piaC9acnkzZXlFYStUb2IrOXlCaUp3bGF5dHpPSWxLSVlkdi90Rmlx?=
 =?utf-8?B?aERmSjFXaGh1Yldna1pUaVYyZHZhYTJKUGYzUzFwSUl4RTMzazgzazBWbDND?=
 =?utf-8?B?UjNPUjZlRHpJUnNWYXU3SjdGNkZvbUU4UC8wSkZPeHdNem9LV0dxZXJvVCsy?=
 =?utf-8?B?bUVRWEdWQlFIL0o4R013Uko2ZC9BQmNIQkkwYzZmdkxIZHpTRml1NkJrK1Jo?=
 =?utf-8?B?RlExK01zS0oxSUxEcCs5TzV6c1lIbUdqRDZZK0ZPMk1FMVhsYXh6VS9JYk84?=
 =?utf-8?B?WTB6ZGgxaTVDSlJ0RHJsNU80akp3QmpENTZNaUU3OHBiOURMTkV3SVZMZitF?=
 =?utf-8?B?UUNRSnRoQ3ZLQ1hDd3Yvc09td09BaXVlaG91cWR6b0dua0lTR0tWZz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0499ae9d-2e5f-4e3a-8660-08deb0d0babf
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 09:19:26.8072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: keCH8dZzsOjURyj3yDiMG2SpVhQS+SoIUzpaIAQ0Klew+AjIeRZI09VWvsrVTtOUYXarLwNBUPGWk/k15rHhbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_101952_544325_3A44372F 
X-CRM114-Status: GOOD (  12.33  )
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

On 5/11/2026 11:45 PM, Brian Masney wrote:
> [ EXTERNAL EMAIL ]
>
> Hi Jian,
>
> On Mon, May 11, 2026 at 08:47:32PM +0800, Jian Hu via B4 Relay wrote:
>> From: Jian Hu <jian.hu@amlogic.com>
>>
>> Add the Always-on clock controller driver for the Amlogic A9 SoC family.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> I'll only flag new things that I spot here that weren't mentioned in
> the other patches I reviewed in this series.


Got you, I will sort the header, also use 
CLK_HW_INIT_FW_NAME/CLK_HW_INIT_HWS for this driver.

[......]
>> +static A9_COMP_SEL(ao_pwm_a, AO_PWM_CLK_A_CTRL, 9, 0x7, a9_ao_pwm_parents);
>> +static A9_COMP_DIV(ao_pwm_a, AO_PWM_CLK_A_CTRL, 0, 8);
>> +static A9_COMP_GATE(ao_pwm_a, AO_PWM_CLK_A_CTRL, 8);
>> +
>> +static A9_COMP_SEL(ao_pwm_b, AO_PWM_CLK_B_CTRL, 9, 0x7, a9_ao_pwm_parents);
>> +static A9_COMP_DIV(ao_pwm_b, AO_PWM_CLK_B_CTRL, 0, 8);
>> +static A9_COMP_GATE(ao_pwm_b, AO_PWM_CLK_A_CTRL, 8);
> Should this be AO_PWM_CLK_B_CTRL ?


Yes, it should be AO_PWM_CLK_B_CTRL.

Thank you for pointing it out.

>> +
>> +static A9_COMP_SEL(ao_pwm_c, AO_PWM_CLK_C_CTRL, 9, 0x7, a9_ao_pwm_parents);
>> +static A9_COMP_DIV(ao_pwm_c, AO_PWM_CLK_C_CTRL, 0, 8);
>> +static A9_COMP_GATE(ao_pwm_c, AO_PWM_CLK_C_CTRL, 8);
>> +
>> +static A9_COMP_SEL(ao_pwm_d, AO_PWM_CLK_D_CTRL, 9, 0x7, a9_ao_pwm_parents);
>> +static A9_COMP_DIV(ao_pwm_d, AO_PWM_CLK_D_CTRL, 0, 8);
>> +static A9_COMP_GATE(ao_pwm_d, AO_PWM_CLK_D_CTRL, 8);
>> +
>> +static A9_COMP_SEL(ao_pwm_e, AO_PWM_CLK_E_CTRL, 9, 0x7, a9_ao_pwm_parents);
>> +static A9_COMP_DIV(ao_pwm_e, AO_PWM_CLK_E_CTRL, 0, 8);
>> +static A9_COMP_GATE(ao_pwm_e, AO_PWM_CLK_E_CTRL, 8);
>> +
>> +static A9_COMP_SEL(ao_pwm_f, AO_PWM_CLK_F_CTRL, 9, 0x7, a9_ao_pwm_parents);
>> +static A9_COMP_DIV(ao_pwm_f, AO_PWM_CLK_F_CTRL, 0, 8);
>> +static A9_COMP_GATE(ao_pwm_f, AO_PWM_CLK_F_CTRL, 8);
>> +
>> +static A9_COMP_SEL(ao_pwm_g, AO_PWM_CLK_G_CTRL, 9, 0x7, a9_ao_pwm_parents);
>> +static A9_COMP_DIV(ao_pwm_g, AO_PWM_CLK_G_CTRL, 0, 8);
>> +static A9_COMP_GATE(ao_pwm_g, AO_PWM_CLK_G_CTRL, 8);
>> +
>> +static struct clk_regmap a9_ao_rtc_dualdiv_in = {
>> +     .data = &(struct clk_regmap_gate_data){
>> +             .offset = AO_RTC_BY_OSCIN_CTRL0,
>> +             .bit_idx = 31,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "ao_rtc_duandiv_in",
> s/duandiv/dualdiv/ ?
>
> Brian


Ok, I will fix the duandiv name.

Thank you for pointing it out.




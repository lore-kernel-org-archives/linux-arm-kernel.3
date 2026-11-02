Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BF9606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 02:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dKVf4Qjs;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=eMZS+Rpt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=C4g2wP8lXATqQy1JaxG0Rdx7dfS5DOeSPCw221jeens=; b=dKVf4Qjsy6siFtte2m+Mz1sZIW
	GJ+R9F9pZ3eWkgYatxrcn78NOpVCLYZ0o221gjwkaD45dYDRg80RwgOGz+Akyy3cS81nCfaRk/ffP
	42urRNj2qNuDJ8PKtvti2V3kcX5iDcTQWsmUh4K30sb+t7VJ+yPLN8fkaSvZQK3BcAUp44p8N9Zyd
	OE3emyLK1E71jj4LPpbEbPR7DnF7bI119hDbkeE6VFI/HXMGoun5M0nc0al9ICCccp6VTBUV7kf5D
	3jEsC7ko5ALyxg5TwtZ+9flGZsGcDN1jSQQOjurrpLeHfHhxzOFoUfk42vm6LgIYLKEdy5FyJSWLO
	nf2h9upw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNi6h-0000000FPnJ-2LuV;
	Mon, 02 Nov 2026 02:49:11 +0000
Received: from mail-japanwestazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c406::3] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNi6f-0000000FPmr-2PGB;
	Mon, 02 Nov 2026 02:49:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UBdQ7vAcdpkJtY0thA4SL1XQ2hPSRxAGMn/c0eQ2AXWZWVyvA6+rkojdVDB/7lDUf878e/6pltFjpYv5JElokuhjo+vL9ATkehSLRlGTVUbGR0a1RnLqub+WRxM8G565Hnap8oQ1iyVGHILctBBdf+icoGq4AzIye3z7zzdCQBSvsyl7ekn1/pU7VyxcOCxWj6DalkdIS1UrroWGPLyyDRiBL9A2NGckKxm+6kiyT0db7QMQFmN2YVXAmeoXB6js1J0oSL7B+rlSVXp27czVGXV8QUp+XOD6W50mw/Q3Ho0PwRNQ7OstbH0O4yOpNjKUEo0H2lHNHxHtsdfMfFhnVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4g2wP8lXATqQy1JaxG0Rdx7dfS5DOeSPCw221jeens=;
 b=iHGimsrCpoOp7uofBSGzoxXmEESaEVfIGGduIVU8Ye93E5ME0MGQ9Oo41XBDvkdHWWZYIjZZ8TpBVh4+airwws+Z/JyalG3xtBpQYKtjex6vD/z18I8L60+l6bNPUpp2Apy1OT50MRhPIZIcaZxXUKaUNQfgheykckAh+esxkPq/lNXjiYnzn71b0KVyg+v2lG91Dx8N88yLxdXmZxZRSM1vgVpVxUn3xEiq88xzvDpQGsBnUUU+nyNbGFRbScTJstBHrx5dSBQR/0pBUEza64zHjmpN/sfpXXmc9QzaliaM2y7/R7xbKoGO+YNbeiPc6iMhULoOcqVVXe9F0OUvSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4g2wP8lXATqQy1JaxG0Rdx7dfS5DOeSPCw221jeens=;
 b=eMZS+RptPBBmJk6iV0Iu8onM4pvKzxbQwBFIJY1R23uL5CwnWd0VYlhV6sL74Wq69tYRpCz6RnfVqNKMx38OF/p0+tYBc/enjqe/vovvGuEoplsmZOVxasYDSkisHvDRZx8+ond+HVK1IqzEMi7LK0A/Ve1t+NQNMcXYA4eNjt56XOwuniUGKLJE7AD5c+s9qVdpCdM7mhVM7c5N1xqvtdGVja6M5DxeepOcVgsyaSHE7xNpM3+mXEWZz4G5cJuqa5b3/oXHAhCxNzzmpdwNqcR87nzTLVf40QNWPiXnGxsefVD1Bbj8DYJKgFWycXQ/yqv8NcGHlPDX2YSKTqClTw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by TY2PPF94EB25A41.apcprd03.prod.outlook.com (2603:1096:408::9dc) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 02:48:59 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::2f06:12a:fff0:6506%3]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 02:48:58 +0000
Message-ID: <f5ccee19-ceef-4427-8d66-8feed49b5475@amlogic.com>
Date: Mon, 2 Nov 2026 10:48:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: meson: Fix PLL enable timing
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261028-fix_enable_timing-v1-1-70f060ec3f2a@amlogic.com>
 <179335104535.2573818.8004160070280286355.b4-review@b4>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <179335104535.2573818.8004160070280286355.b4-review@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::12) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|TY2PPF94EB25A41:EE_
X-MS-Office365-Filtering-Correlation-Id: 37051901-0d8a-4115-c249-08df388bd807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|7416014|261021121427099003|261021123027099003|261022105027099003|261022075727099003|261009223027099003|261026140227099003|261028144727099003|4143699003|11063799006|10067099003|56012099006|260925021911599003|260925022911599003|260925021311599003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: mtawj1e32p2bbG3UELCVPjQhrWS5slT3Ddr7iCG+XDOEMUmpZHD+s6CmOvwhAPsT99RCBxzkDbkXbQMlr9Jn73khYPvdQoOCQGITzhEe8KqU6jbMS15NYfjSQA1FDDnwAXBaXUWvERUcvSQaE/PqZSOF3zCVufuv3xREBOrq6qE0tSvBtPxj7V/7cHoeRh1qOH5du9/VG+G1NollNBa/poUfYVxFiYsAOTC3PwjPyG6S6LGIF/AubJdxQo1JxkgoV/ouFjDQcjye3Yx+C8hEcaGUMse6wmyYxIiiXCR7nLbvRP671Sm4rnWrj7Tv/NWM1V9YOm9yG3Z7209ugNIsYROrodz3bAXi2124oXv4J0rOyW/BjN6iWlUIhVk6sKb9TmBXx3lyLNv0XYlD0cAL/TQNAmHWyRD2havHPfVVyTyBpGKVqMl3yNdNJuTJEjh4r/zw/kwGFFfZIlbuf6GZ8pXs5+J0efABQ4++oNnRkxA4bD5mpMN6rxaB8as/uixjL8LyHFuvgAVBgGF/3z2dJE+r8vG9pQ0vzx9hLzgHLNaQuJGHL0l+qu5zSEeHuyZHvcDKgFbWTe/SkhLzZ5cPJRy/gu4wX7jhhWlEHp/XMQjv5CrwBa+kUkFyMvSjaKJ0
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(7416014)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(261009223027099003)(261026140227099003)(261028144727099003)(4143699003)(11063799006)(10067099003)(56012099006)(260925021911599003)(260925022911599003)(260925021311599003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1lUYnhsQWs5OWg5MlE1QityMWFEN3ZzU1dwQ2d0V0IvemZRNnY4L05LaTdy?=
 =?utf-8?B?T2xUZDY2SERScTZ2UE9vS1p5WG5lTUcwMStOVVJ4REgxcVRFcm9GYnFzVHRN?=
 =?utf-8?B?RVhXUnQrL3JKYW5WWTdOODJxaitkZDRRRUJkUDNtUVJtbU9RZzQxODF1U2lp?=
 =?utf-8?B?bGJDL0F4TkZXSGVpUkNyVVFvM0hMczNudFF1Znh6ekVBVXo4MVlxa1hXZ2ph?=
 =?utf-8?B?NENFeUxXQWM2ZkdqZ1lPVVBNdnA4dFhBV292Z05BVk5nSkFkYnNWMzlRZHY5?=
 =?utf-8?B?M1d1M3JtVjhGaGs1ck5GUkVKbTUvZmZ2MHFuTmxGNUk1eTFzNW83SFZ6TjVI?=
 =?utf-8?B?Z3RwTkhlaHpuTmdnQWxzN3dwTkdUM2hJcWNlM01mckU3aStVR3RxUWJvZllE?=
 =?utf-8?B?aEtFOHFmZFRGdHp1WkdaYzlhN1JyR3lKZUtHOGNLa2xzWndsSXBMVmpBVEJD?=
 =?utf-8?B?SG5zWCt0N29rdnBEUEh4TXQ2bGlEUFdMN0lyMUI0dk56YkJxdkNPSWNNelMx?=
 =?utf-8?B?aVczV3JpWllSN2tzMlIweWhYc3VpRVlrVFpYdjJzWFhIdDQrenBhL29Xa2ZT?=
 =?utf-8?B?YTU1WDczUmZrYWRZR21nZXdtZE1wN2JZa2dWU05xSytwaGR0QzZwQmJHRHJV?=
 =?utf-8?B?dStwVXFSNE5Sbk1ZZURDODFESVdIbGJidXRIOG9aTk9QdEozaXVOcEZIRjJN?=
 =?utf-8?B?YjRwNzcvVkhBNFJydVRDQWU3T0s1SWZZZ3FzK3Fwa2VRbHpJMStrYmx5bjZz?=
 =?utf-8?B?Uk9hRUtMWGRwS0owNTRHSXBWczdMSlhQZWluVlFMU0MxdElaTWJlM3R0WXpO?=
 =?utf-8?B?TGNEK1VvNU8zSTNLSHkyZlRwaXNlaklwZ0k4U0Z0Ti9ZRFZIRzgwWFdFSWVN?=
 =?utf-8?B?U1Y2UVVQMkk2WWcxcWJ2TjJpUEk0d210L2R0NmM3TmhzSnZCeGwyNVY4MmZq?=
 =?utf-8?B?TWxRbUZMMWF2ejRhZzJneVlsYjVpMWg0VUg1WTY4OFRyMVA5U0ErcUNkZjJw?=
 =?utf-8?B?akhGeHMySmZqT25VbzZFcE9zL1FiWGI4UnREZC9QMHNyUmtYc0FjRnRncC9Q?=
 =?utf-8?B?UC8yRDFsVXdLT1NvT2NLSk1oZER5YVBIdmtWb09LWlNocDE5ZFA5ME5JSDJB?=
 =?utf-8?B?RjhVZzZjVnd5cHkyNjU3ZHFDN3FuUjl2d2JKZFJCSDd0L25pZmp6eFlIL1gv?=
 =?utf-8?B?K0pNOTJLakVpcHp6SXFqYzZ3Vm80SFNoOVVpR0V6TFBxZWtwZGNXcEZNdGpB?=
 =?utf-8?B?cENrR09vYzZMYjFINUkyY011d1RRNHlKK3ZoR2ZqaUlsWVRqTnlna2EzVEhu?=
 =?utf-8?B?TURWVFM0TTBYMW50eFQvajg4b2s4VkF6YmM4OG1xVitlMHhsOVdSdWFjSk1T?=
 =?utf-8?B?NXE3VU9vbnpJTmxLRVRneWVZY2FmellrdHFIUmhCQ3J6ajYrejRXZFB4cTNJ?=
 =?utf-8?B?cEloQndBYlNoRTB1TCtjQzN2SFBSWTBxVloyUGtOclQvSDVtamt5ajU3MDRy?=
 =?utf-8?B?Y092Q3J6bmpndVlkemtxc3JPU2hCRWtyMVk3TzBtYWU4dmtENEtJVWcrVldx?=
 =?utf-8?B?aHRlUlBIbE5iMkp2MGc2ZGVpNmlKWWIyR0piLzJVYmxwTnZ5RktZSE1EOFkv?=
 =?utf-8?B?aDQ3RFBTbEZ6QUNVRVlSMURCOEdFeTVoUTZtcWRBYmlsLzh2U2svVkE2WHBC?=
 =?utf-8?B?RUNZeVUwVWQyK20wWnY1SjU2aGFkT3I2aWkwV0pKeGF0dit3WTE3T3V2ZDdi?=
 =?utf-8?B?dHAyM0hxWHJ1a0EzVEdVMnltVDF1M0RIb3gyaXBUcmw2Q2wzcFdpTmRLOVQ3?=
 =?utf-8?B?QStHcTlzUndmcjQzSTl1c2hneHU5NTJTYUthR2hYSEk0OXlYSytUQUVvRkhz?=
 =?utf-8?B?NTdaSGRRRDlXOXFTVFluN0JIa1FSZG5xMWdHTUwrRGhkVEwydUVHb2Rod2J5?=
 =?utf-8?B?RzJiUTk1Y1dSL3NXT1pjSE90N0h5eWdyRXo5ZWlkNkEvWnR2dWpXTzhodUtM?=
 =?utf-8?B?M1I4VmlnQVJLalVLK3Y4YVdDdWZjNUpvU1pTdzlUdExzem5PQ3BBUXF6N1dV?=
 =?utf-8?B?SkJpUytETG8xYzkwMENvUGw3ZHZSMUowUWRlN2VEZkhuSytXR2RYYnJsTWlF?=
 =?utf-8?B?WkFITGhzRkM5UHdiTCtXUzJhMkVacGtsVjE5UENOSXlzYi9Ka0ZLVS94aDEr?=
 =?utf-8?B?Wmd1dkZoL0d6TGlIQ2svNGpkZXV6MjVoQW53Zkpib3RLWjZGMnozMHJ5N2lJ?=
 =?utf-8?B?VHBveWU4R1hIZ2hVVDR2T0ZwRHRuT0MzbWdzUlpGU2tBK3dnS3lVUFFuK0dj?=
 =?utf-8?B?bUlXaFhJL0VnUzV2Rkx6dzZBUzRFUVVlMS85NjB6NjZnYW1idVd6UT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37051901-0d8a-4115-c249-08df388bd807
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 02:48:58.7224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z1atYSiBjX0+1mqWOVHlcG8nxLbY58Hp83aS8SDBQFVHkPBPLwiNGkT7r0oLjcHc45djs7YSY/g+l5L4kVmaVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF94EB25A41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_184909_638196_745D14F9 
X-CRM114-Status: GOOD (  16.71  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jerome,


Thanks for your review.

On 10/30/2026 5:04 PM, Jerome Brunet wrote:
>
>> The hardware requires a 50us delay after setting the PLL enable
>> bit to meet its timing requirements.
>>
>> Without this delay, GP0 and HIFI PLLs on Amlogic T7, SM1 and C3
>> may fail to lock under stress testing.
>>
>> For example, enabling the GP0 PLL at 1512MHz may lose lock and
>> result in an output I/O error:
>>
>> echo 1512000000 > /sys/kernel/debug/clk/gp0_pll/clk_rate
>> echo 1 > /sys/kernel/debug/clk/gp0_pll/clk_prepare_enable
>> sh: write error: I/O error
> This is something for the cover letter or bellow the --- for a single change series.


Ok, I will move the example bellow the ---.

>> Add the required 50us delay after enabling the PLL.
>>
>> Testing on GXL shows that the PLL works correctly without the
>> additional delay and continues to lock successfully after the
>> 50us delay is added.
>>
>> On A1, remove the redundant 10us delay before enabling the
>> self-adaption current module, as the new PLL enable delay already
>> covers this timing requirement.
>>
>> Tested on: T7, C3, S4, AXG, GXL, SM1 and A1.
>>
>> Fixes: e40c7e3cda07 ("clk: meson: clk-pll: add enable bit")
> This is the commit which introduced the enable bit and it is not really
> what you are fixing here
>
> A more likely candidate is b6ec400aa153 which introduced the delay
> sequence you are modifying here.


Ok, I will change the fix tag to b6ec400aa153.

> I've got this other patch addressing PLL delays in my queue:
>
> https://lore.kernel.org/all/20251031-optimize_pll_driver-v3-2-92f3b2f36a83@amlogic.com/
>
> Which one is it ? both ?


Yes, the are both addressing the PLL delays.

>
> Please consolidate and resubmit.


I will combine these two commits into one in v2.

>
> --
> Jerome

--

Jian



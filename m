Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB78606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 11:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UeK0Gnp3;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=pKP4IGB8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=q8rIqYblFeV99dG9PhVoW2Snw3SxhMyVdgIeh/eqj20=; b=UeK0Gnp3e8AGAf3Q1Rch3getXy
	B7kmWhRYe3pLhpv4wPli/4Jk6ntozspde1zkx94Vwq+tejrHAAiVJoLorNr4ikn6uoy81lo/RXgVa
	ylIPssom5+tEiISTQeKXftLZb8bSp5M7OvD+0rdf4aIUC5TyU2iQK7iYTpdAXWKZ9DW2HxreaBCxv
	ATluaOp4W3jpC9egKeHRvKzojCv7yOUneaOENTIq8eT71nRxUVQviXL/5P/bl4k89gpvMH3JDvdJL
	cLpLmKG2BbnCm4bJ020k2sipUDEYaDjY08ceIQrRnMeXCyo4ykFX5WJaYTf5XiJMTvxjfyl/IYARc
	+5B3433Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMl9V-0000000BbRv-36IC;
	Fri, 30 Oct 2026 11:52:09 +0000
Received: from mail-japaneastazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c405::5] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMl9T-0000000BbRF-2ruj;
	Fri, 30 Oct 2026 11:52:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tqOLAhsfjnK+dKl5XJqkHEjd92xcfbtlI4lF9GnangWN40O6bEySPdIFrqRkCM5RwKVwMMXBSp/ozFrKry6Y9NzWkJzg3Y0HM5Q9mzi8JWTCLA6QEG3t9E3dqF6da8lETY39CioDo60iK5G+LGsdlneryfacZiHo8pElxaOCiVObvi+ekloMwP/S7y2f/Hj1MlGZB0uzhXf8KuYm9h/OARzjLb1B7pdJ7uNbhAHiNFwNbpXmNB2oskk6jpuCEjAH5oIDpSwIX1xkdSH2LzXLXO8Ng+ZHhv/5uEpoHOJhInwtznqPi0PIFXuojl1+6Os6qAiNB0yQ74pEOv/De9cdhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8rIqYblFeV99dG9PhVoW2Snw3SxhMyVdgIeh/eqj20=;
 b=IDTy+WJHeLy72Xm5i0mBJOvKciZsZYxLQe7m9ZhToakuH0A1nxnCckyeoCFrqdCQA+NtlIuhsfo8lZ0RTY/CffgMJOfpKrzgxfF7mAM4IzaT6t9iothC+cdNB6H6EVjIVe5uHpovt2qcCEvPTWptDsV9AqzA+pusm0gwZD2pR0SLw7Fg1R1Z1OniahrFktNPqJY+BZ447oS7rT5owyCvFiPmJxJcZ4T/Hw450mL44zK/wmy2uYgh3Ek547dqAncXGa8VgGPsZNF8Yf9P5KIcYsVMMsU17QAcXywXU6UQE2GLBftrqr42HCk5v5iHOrJ0Zo+wUL8eny1qCstaAmWVPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q8rIqYblFeV99dG9PhVoW2Snw3SxhMyVdgIeh/eqj20=;
 b=pKP4IGB8VcbNu0TaQqg2NQ53RXdMiyYxkrTRmwRvPYJ+9e7bOc/LFUhd2fTpj2eLOvALUmwh+c8nTvdN91VfLjYGUonczAQKEtuCt3T+isjEJB7vyE18Rgqqd13Ql0NmGGjjNIe+u6mu5UHrqHJy/1m5pjBQNHLLJJKOqenRVdQbbqdNEaCUj8KcpFxVnd0hw6FlNTJkJtS7zx1/ehDjcSO+tPG95kkHtMmcKsWHRg7pms1o/tzozAjUuL+KSRrw1ecLQSZH+BJFx6KrIzPafi3uAY1Iy9+VhJsAf7Ohs58XbiLyy3zM+UrvBLOTnQTcNdk7BGLkjA6Ksh5BgmYJjQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com (2603:1096:820:51::12)
 by SI3PR03MB10031.apcprd03.prod.outlook.com (2603:1096:4:2a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 11:51:58 +0000
Received: from KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e]) by KL1PR03MB5521.apcprd03.prod.outlook.com
 ([fe80::f12b:85e:f95c:191e%3]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 11:51:58 +0000
Message-ID: <d9086d80-229d-45bc-8681-24b9d98b4aa4@amlogic.com>
Date: Fri, 30 Oct 2026 19:51:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 4/6] decoder: Add V4L2 stateless H.264 decoder driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com>
 <20261022-b4-s4-vdec-upstream-v12-4-616240978792@amlogic.com>
 <e7b3c2b2-8d0e-46cc-b245-a22f6aa7e69f@kernel.org>
From: Zhentao Guo <zhentao.guo@amlogic.com>
In-Reply-To: <e7b3c2b2-8d0e-46cc-b245-a22f6aa7e69f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI3PR01CA0012.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::11) To KL1PR03MB5521.apcprd03.prod.outlook.com
 (2603:1096:820:51::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5521:EE_|SI3PR03MB10031:EE_
X-MS-Office365-Filtering-Correlation-Id: b23517d5-9619-415d-48da-08df367c3382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|921020|11063799006|4143699003|56012099006|261009223027099003|261026121527099003|261028144727099003|261026140227099003|261021121427099003|261022105027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: fDia0P+k2YUOiMQDqr2ao4pzQVuqf7669OAATfZqwvRN5U7rKoipsJm8s8QUB+0GFnRcoNmHgAGldXrwIayeIFRVsnQQk1SjC0ywIDDjLqNBZ9MTa0odLjoHdGpdiJ1e/v9gttJSms59qfokMp7XNYmRv/RlEmV8bHgQSTIg7GyyI9jJ/h7b2gB8wibiRp9zdKu4d5WF0fNNGd9pJfGT+ST7NJlY7Q31/4kOOPIRE4XH+hcQmsiD6uI3ePf/S1cmc+znDXW0ZgdlslSjBziWT2g/mVvmx1wDQ1DSAwwvAfIZyq2Rh41R4Jy4G2XYQ7piYstGYyKYUFOIUuBMCo0tfnpapWs+DqNq7ys41sZt7I2O01Nv6bKUDQIWBi8nv+Xzr8f9W61OCuRetBHKr51ONZt4HycB3wGcHV3mtdMoQaBMn0NkqZnMl1yz5LGXhh085ZLlUZ0Ki3NgbCpu4dDMD3LMG4L3i87yPzb97edRxX3KM3n8DItX8H2ePUV29clHoDgsOE1YdAoXXvuI2iZR4tX/+EcZ2scSmW0OkpD97v5i9I+ZMFvxQyQCXYERZX1QfzXmJX68j+aKQMTd7XRJAT4PdXo538R8+wLJu2P03KWtunpJmFIVxwy/3G0Vcl05QVewUxRSKRKwRf85KUcl0RlwGh+dIBpb6rQcaqMffbw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5521.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(921020)(11063799006)(4143699003)(56012099006)(261009223027099003)(261026121527099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MENoRXBNNkphZTFlZlA3VmRNbkVBOHhSamIyb1U1eWZqYUZ3ZGoxYzdKSE5p?=
 =?utf-8?B?a3JxWExhTzFhL0xvTmV5cHpvZkErSXFKWnhyL3RWOTg0bmgwTHJ6aEJ1MFpN?=
 =?utf-8?B?bjltM2I1Z3p3emhxdGNLT3BWZXMrY20vVHNaYzE1RzdWM2F2TmFQeXhIcnRJ?=
 =?utf-8?B?d0VsanRuZzRVTXZLOUp4L1VNM3lwd09PY0poTVR6UlRDY2MzR3N2b0FJVWw4?=
 =?utf-8?B?N25IQ2lhUm9JMU9qSHNwdHdhSFVnZ016YXg1M3d0QXVNaGtXL3hGRFhMT2FF?=
 =?utf-8?B?eThta2JhLy9RQ2dzVUJZZGdoNjFPNG5LeUZ3bS9Bcng4N2R6V0ZBZ3B0T01K?=
 =?utf-8?B?V2RnUTF4WXBXL1RmT0lrVnpUNEplU3F1MGIrVnBWVE1NN1ZnYlovUjVQMExB?=
 =?utf-8?B?UGp2R28zR3RsMnI1NUFEWGNRVVhpNTY5ZWlmOCttTU5jTUpVSFVKMHNDSjdi?=
 =?utf-8?B?eGEvQlNxVWEySS9KazhZYnV4L2lSU044aDlDbEIyUmFiN2xzUzJJVzhkU0Fh?=
 =?utf-8?B?Y3FGWC9yQk4zS21JVEgyNWJ1bEwrbWJuYUFHcHRTQ1FmcWZLQUZpRGxQRTNS?=
 =?utf-8?B?RmloeGJ0TjZValI5b2hZTUFoc3ZPM0FkeWwweXBUbTM4T2hDamkvaDFyREEy?=
 =?utf-8?B?YnA1Z3BmWXJicGRrMVpwRlpCVVNnaThEMW92cUN1aXkxK3daQVFMUHZWN0I4?=
 =?utf-8?B?UW9WT1JMK2F6dWxhcXVmandUMHlqVzNncG92UUtmZ1I4ai8raVE4QW5HK2or?=
 =?utf-8?B?cFNRQlZWNFBPOG1HMFNJbWdjSWJuNHRQMVUzc2Q1QWVHeENYdjZMR0xrakh4?=
 =?utf-8?B?SU9yMFM0U211ZEM1R1MxUE5IdjIyalppcU9tNVFpVTJXb005OXFRU21YTGNO?=
 =?utf-8?B?cGdBeVQ1TGxtQ0I1SHlPNi85NWhmVnVFaXpLM1FIRHZiZm5JRHg4V2k0OTJr?=
 =?utf-8?B?MzRUQytJbW03RkZIUU5aQmFKYS9JMyswdFY5dGt1Y1V2RzgwWTlMZWUxTFd6?=
 =?utf-8?B?VmRGUGZ1SzYxUjIwY21wVVNsVTRwUUNObHBVRXRiZHhKd3FBakdMUUcxcGtU?=
 =?utf-8?B?Qng0cWplczkyVENaOEZIZDRsZ1gyLy8ydGVqZEpqWHhyd3ZoZzVFYUhETWJm?=
 =?utf-8?B?d0tFS1B2bU5OUkZpdkNNTklUd2dpYzlBTDRnaGtFU1gwNFBPWjVETllWaEw4?=
 =?utf-8?B?bmdkaWlsdGhMSXJSQnExY1NEdW55MlB6ejd4dlp5VnkwR25UWUdhQ0IvajMw?=
 =?utf-8?B?aEdXQlY5L1l4YjFVdWJBc3Z3Sk11SW1EVWxLV1d0V3I0WERCUkFlc0JkaTJI?=
 =?utf-8?B?QXNUWlcwYkJaMlQwMURwRldpSmx3VEIzUmNFK2lOUVlqcHhXWTlRWVhKQlFx?=
 =?utf-8?B?R3hHOTh2K2xPaFJzMDBud1d4N2hveThRYVlLS0F3TmRvSHZMNnRKZ1Ivb0h0?=
 =?utf-8?B?eTZYbHAyektpcm9oNGRkNTljMlIyRUErQ2lmK1pXNEZNSk42NlY3cmkwNUlY?=
 =?utf-8?B?UzY1ZXJIUkJOdGJNUG9mRlNKb201cmVxTWh4UjRkU2FCZ1hhd1d2OTBMcU1D?=
 =?utf-8?B?YnlvNW5xZ1Y1ZUhRQS91TW16b2kvQXlBRjFxWkR1S3FTeVc3cjNLUnozVkpT?=
 =?utf-8?B?M2pFVnN2N1RqQWRaSWh3bjZyRlhGc3pkZmNDTVVkNVBpdFFIalg3MjQ3dFE5?=
 =?utf-8?B?Y0lzajI3ejB4a0Y1YzFwNzcvWTY2RzAvNjRDRWl5bXgzRElyeHJJR2dHS3Zn?=
 =?utf-8?B?SmhCS04yY2I2MXlJWkNtTURKWUp2UWVId3p1Q2M4OG5qWDYyNkFBZ3FvVysy?=
 =?utf-8?B?QjlpcWg3cUpCMmFycUw3QkUwZXF0NlB6enlLQ1ovMXA0V2liVlVuMUcyNDRX?=
 =?utf-8?B?SEw3dCtrSEVoRTFjNzMzdDVXR1hiblFaNjBmalRoU01ZS0wwQXZrUWVDUmI3?=
 =?utf-8?B?b3h4VmVuZkIxc0hXaXZkd1lTUjVqeGZtelUrSzhhT0N3TFRxaVBXSWpXdTRZ?=
 =?utf-8?B?UHdoQU55SFQvOXJ0UkJxbjdQbStteFpyQmtjelAwQm1BVCtWS2FMVUtuYkV5?=
 =?utf-8?B?MFJmK1BBd21JZFhHMSsxdEJMMDJWVlpYYUFvZTVjY21Xc0FnYXprdnRDcWtR?=
 =?utf-8?B?cE9acnFFMGIzNTkrdWhrS2FyWCs3UFMwR0RadTJ0NTE2VVN0cklWaHdscEYv?=
 =?utf-8?B?b0pSdkVGRDA1VmRjTDdpSjlvdEE3UitURm5Qd2hlb2Z6Mk5YK3JyTkZwcFIw?=
 =?utf-8?B?Z0tYQjFVZ3VYMmwxNVRBbE5tZE5CQ0Q2bFBYT2VEZmR0a01KWG45R0dGbG9r?=
 =?utf-8?B?QlJVZFZnaXJLa2EwdzdYK1ZCdHhWY3ZCcXJ1b2hoL1lVVm5lcFFydz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b23517d5-9619-415d-48da-08df367c3382
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5521.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 11:51:57.9313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3t0cNg67Qyztk1sPMOLNGK/pdhrMs/UbWj0jKbqHrnYa6z4+RJkH+xXB0IKKFC00XaHka9UGKEicqegCGDuPRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI3PR03MB10031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_045207_738862_9F419977 
X-CRM114-Status: UNSURE (   9.00  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Krzysztof,

> On 22/10/2026 07:27, Zhentao Guo via B4 Relay wrote:
>> From: Zhentao Guo <zhentao.guo@amlogic.com>
>>
>> Add initial support for V4L2 stateless video decoder
>> driver on Amlogic S4(S805X2) platform. In phase 1,
>> it supports 8bit H.264 bitstreams decoding. Currently
>> only progressive streams are supported.
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
>
> You already received this comment, no?
Thanks for pointing out again, I'll check carefully here as well as in 
other places.
>> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
> Anyway, several issues were reported here in separate threading.
>
> Best regards,
> Krzysztof

Best regards,

Zhentao



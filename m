Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451AD606A328
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 08:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x/eYFhlF;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.a=rsa-sha256 header.s=selector1 header.b=Lqochv+G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:Subject:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=s/UApTTNgIiqDUYC5MwK+TjqsDBLxf8hposB7deMIfo=; b=x/eYFhlFWDEM0nZWeu6eSwJo3Q
	mcD4vi9UtTSCLAmU9BzNok4pEWnHOnTlCWvRrLOAy239jo76WP+T+uHRQfiSOXX1fUVTpaclCcect
	flrvLzfha6MW0AmLNBsittL/LWeECae6zzeFLq0CMofeCFA1e2i7LNle1n83wG6E6uIgCItQ+jiPI
	z+iLXXKPg75WpVLIOeO+CiPaZRzbZ/fZqwnI40NIZ5KKv6b1ummnj/4jHt96JMxEHCdJAIJPaa/bx
	O2ekKRRPyQSUpUQ8NdU5zWBZOcUqoUzv4/JP6PX5INwq48Peyp8oRpyYoMxUa+SBintVUMWAvlYZL
	v7UJq1VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFkp-0000000BdrO-0cTS;
	Fri, 06 Nov 2026 08:56:59 +0000
Received: from mail-northeuropeazolkn190110001.outbound.protection.outlook.com ([2a01:111:f403:d200::1] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFkm-0000000BdqN-1xmy;
	Fri, 06 Nov 2026 08:56:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IObO1zrNsDawdBx32BEunSWRw/5J4EZEwCBX/bRhkJbMAsFdxC/oXjwySpd/fJ0dYm4elbX+FoYcbwF1Ey3MkyTW4yrU/xTN9TkWG1BP9gFrL03QZ+s9/mKRF+cn1skmDoccD8JfxvGohRwVqLO4E8VmpZhKhMzDP/2O/i3I6cjMnp2UevGT88n4/StoKS02FMvwazWz1y8Q80pIwqMXFdFe+0es1VkHOiOZHkv/zZE/6r10kHRWBK2UzyGtCCpKyZsH16r/dMkIeNpx1Vs4y0pOtSNNOwEuBU7I4/UWxPZUKOk8xvSwwxVlRdYRP59Xpbl7I2lQALGZoLoV38sFFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/UApTTNgIiqDUYC5MwK+TjqsDBLxf8hposB7deMIfo=;
 b=v4/uhPcrUNx4UyqMx89xrqWuagBV7CGPZObJRYMY1ztLRzDL/SPmtj4obWriGV6hDHqhL+2VlAro3tSiKkuHSCRiOnzYxgaLC/5ewMzlH6ftOorMs24mWS5gkPlUMHnzdbsVxg1wl5CiX8BfZVg3JBkXYfMMK5Brmj3bpKqvWrr1uJcLzo5WM/Qt5QJNVaMz89GSeoQLeNLIRDBrbZsR35nRE1+MUlkDTKfOzaktk32juL7hDKBbPdsTzFjcdSQ55Hd/EDWlgGWnHgJPxOl5AFuFcKnhD6Ocgrt9dwA5X17rgZYEe/efeO0nxc6o4Bk9qmd+U0tPbQaskDKa3T8yEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.DE;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/UApTTNgIiqDUYC5MwK+TjqsDBLxf8hposB7deMIfo=;
 b=Lqochv+G5Ps9PNNgXczMxAwmmkuxfCfHddKQBNKb7mCHYZQDUoYOxvhc/iIZF77Z0zs42RAJfFTIL98kQRKlUpRLngxKcJykxRMG9AYGkXUsJPzrmJv/+t/fljbVmESckdSSPHhw/K4h7a4fdrKC8eT+wAh+rmKr3nl901uDjvfdr65I93lvB3H+r6lRoj3t03NFnmpBMpXU6zEcpGW1FFE1RqpB9bnHJtGhd300YNVFLt4DICpSh3gY8twAO1HDqkBc4v1OUkSPcFh0oDZTU3PkmfpcQoysTf/4vn/XmtCxI5wrPM4ARLMXbNzs6b4LA7TeJgsbKSPlSn3lNnow8Q==
Received: from MMZPR08MB549315.eurprd08.prod.outlook.com
 (2603:10a6:190:28::19) by PA4PR08MB7571.eurprd08.prod.outlook.com
 (2603:10a6:102:270::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Fri, 6 Nov
 2026 08:56:50 +0000
Received: from MMZPR08MB549315.eurprd08.prod.outlook.com
 ([fe80::21ab:3314:172:c7e5]) by MMZPR08MB549315.eurprd08.prod.outlook.com
 ([fe80::21ab:3314:172:c7e5%5]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 08:56:50 +0000
Message-ID: <MMZPR08MB549315BEDE7233BD6C86F70EC8DF762@MMZPR08MB549315.eurprd08.prod.outlook.com>
Date: Fri, 6 Nov 2026 09:56:47 +0100
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Christain_Stefan_K=C3=B6ver-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Christian Hewitt <christianshewitt@gmail.com>, chuan.liu@amlogic.com,
 Viresh Kumar <viresh.kumar@linaro.org>, Jerome Brunet
 <jbrunet@baylibre.com>, neil.armstrong@linaro.org, sboyd@kernel.org,
 bmasney+clk@redhat.com, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, rafael@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
 <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
 <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
 <9556e959-daf3-4c85-8794-9613e7e7a9ae@gmail.com>
 <A45EC676-5B14-4932-A4CF-87ED3B71108D@gmail.com>
 <4a51e879-708c-49dc-a08a-3f64eeec8bbf@amlogic.com>
Content-Language: en-US
In-Reply-To: <4a51e879-708c-49dc-a08a-3f64eeec8bbf@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR04CA0109.eurprd04.prod.outlook.com
 (2603:10a6:803:64::44) To MMZPR08MB549315.eurprd08.prod.outlook.com
 (2603:10a6:190:28::19)
X-Microsoft-Original-Message-ID: <e4f9527b-951a-4f6e-80d2-5c7be783b79b@outlook.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MMZPR08MB549315:EE_|PA4PR08MB7571:EE_
X-MS-Office365-Filtering-Correlation-Id: 811c420b-c54a-413d-a5c7-08df3be3e526
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799015|19101099003|25010399006|4140399003|19110799012|6090799003|15080799012|5072599009|23021999003|51005399006|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVBKRXNNUXpwTlA2V1cxeExqS0l3aEo4UjJBOHJBSkZzbHNsdmdzUkpLS0R2?=
 =?utf-8?B?d3JpeW9idDhreVZ3cStZYUtxSVErVXFUOXRPKzRSL1U1dzFnd2c1RWFHUmE3?=
 =?utf-8?B?RTMrOTQ0bGJuMlZxK2hvVXdFY1JSaWowL3JxZTNLb1dSNXJoZVdsZ0g2eUtG?=
 =?utf-8?B?Wi9KNDBadHVyL1RYWC93UGZhWms4V3lpWlBsdFdYTisxRHVmWmpTeWl2VlZN?=
 =?utf-8?B?dVhvOTNQZ093K0FNbHNybFZ1dCtTSEFTNWxNNUN2MzJaQWk0YVRzZW9pNHJz?=
 =?utf-8?B?TVFHRHBORFd2amVPZjNTUWxDSWFNaHkxOHlvMnVkdlFzMVVQZGMrQWFGbVV4?=
 =?utf-8?B?UEFUbk0rYWpEaE5BWFB2ZFlsU29MNzZxRDdPRnRWeXhxSkF6MzdvcFNzSkxG?=
 =?utf-8?B?aW9iMUxXMzNVM2JPcjhnVVpXcVpnbWYyU0RyS2FHVmp2c2R6aVVZV1R3MG5H?=
 =?utf-8?B?ZHJhREpvN0lhMGdhK3hsV0JrNDFzWWhEYlVkMm5ERlN3U1ZBTTNvSG9vSlRV?=
 =?utf-8?B?RjVaQ3R4K2llaXV1RmlwNnlrd3lVWjhyRG45TnlKNmlrdUJZcDgxdFdSZHJF?=
 =?utf-8?B?RHRUdTJjYXBON1JXd21jOXZRckg3TDZLdTB3b3BkOHhWYU5QalZTeUdPUThI?=
 =?utf-8?B?ZUxvTkhuRVJaVmhCQ0h4TzNiNUJtcjlmM3g2UW9kQ2FrSzRYQkY1MnVvck1L?=
 =?utf-8?B?YlVFdDhtRmpRRk9lV0VZUHFoRis3bngxNTZoZDkxYXNzM0JoclZjUS9tWlFN?=
 =?utf-8?B?cWRCcVp1VENnclFjRHZBOXg5V3VhRXp2N2JNWDMvSHArNFcwbnF3S1Bsb1hI?=
 =?utf-8?B?MGdNYVlyeDhIZUNGVi9NQnplVjBPVGlTdDU3Ykhqa0Q5NWY2Nkx0K2dYSkp2?=
 =?utf-8?B?MHUwK0o4bjNpMk1RT203djhiaFlCOUV6djcrdWJBV1JST0JjMEp6eHd4ekU4?=
 =?utf-8?B?QjhyQWJoYzV6VmFQeEFzQ2dVdVRQdWhUNVd1ZlJ3MHFmNnc4WDk0cm1FenR5?=
 =?utf-8?B?R0REM3E0cGVoOGNOM1l5VDRXbGg1dUswTzBZYXlCTW1OejA5aFZYeG9SYWIx?=
 =?utf-8?B?KzNsRlhwTW0xTU5qOXcvUUZiV25XRWJrMVpCUHY4Zm1hZ25mdWw3a3JhcTVq?=
 =?utf-8?B?WGtESGZCYlpQMkl2aU5kMC9RS1lMcUNkdjJLVlRFU2czM1YwdlhrL1oxdng2?=
 =?utf-8?B?eGNNUVIza0hvU25iNXFZcTJQKytreElnVHV1c1hPekdGMjEya0JMUm1lQWJP?=
 =?utf-8?B?VWdqcHJ5aGpkWlJ1ZmVJYWtOTGk4ZmpnQlVjYitpWDQrZ05yZz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TU1XR2Y3T21rUzVHOHJnOWhsVEZLTTRFQThvNkVXaktnbUtzL2V0RHpsRmhE?=
 =?utf-8?B?Y3JwMXFGdlF3SGFBcXExRVpnVzk0bTQ4Z0V3L25jYUFRY1RWNzd6L2tzN1VU?=
 =?utf-8?B?anhuZVpteUZXRjBTYWJWdzJIL2tWQlplMkFpWWZpRzdJK1hFTnRNSXRjSDIz?=
 =?utf-8?B?Y1lWeVRlNjBtMEw3QlBIWnk2VGJzUVNvckx5emljcUdvRjNvKzllOTFvSmJF?=
 =?utf-8?B?Y1NxcytoekxlK1NJaTdkekU3aXBTVTY4NnVGQmpFUkFBcktZbnUxNW9NM25P?=
 =?utf-8?B?d2Vuby9RUy95ck56c0NJbWpFc3JDQURhcW9JNFNhOC8wVHF4andEVHIzZEZU?=
 =?utf-8?B?QThEUUJFTDVOVDAxSENwUmd0c3dNYVBrSUFlWFNheHFqQURlcXhBd2lNcWNE?=
 =?utf-8?B?WVdpWUMzemh5bjFrTS83Tk9CZWFJdDRmNHFEelIzNzQwQk55TzIyZzNjWENl?=
 =?utf-8?B?d2llaHptVEtIU2xIdE01TWc1YjBwNk1JL0NBaVR4MWIwbjlQZDFUZytqVzJP?=
 =?utf-8?B?RkNldmdlb3N4VFcyRytVRjlLOTlWeTBUbUtDa2NyYlJMV1h1bEJBdU5LeDVX?=
 =?utf-8?B?Qi9Sa05pVWYwa0UvNmhuVzV3RVd3MllGZXAxNkZyS1ZRcmtUSGxJZVBUL25F?=
 =?utf-8?B?d2pOZDVnMnhMdzAvTWhaL2R1VEtrUGxjRDJSeEhTbDFrYzZHT0VnM0FOdW5K?=
 =?utf-8?B?ZEVYZzl5Y2lzWXNGM25PZnZlUEVpUTRJS2FacUJFMmhtajRxUEF1OHF5STlp?=
 =?utf-8?B?WmU3eS9pd0JCVzVKc3Y3MUtSeGZVQ0VzaDErTUtzdFg4SUJGZ0s4L1lHSGlY?=
 =?utf-8?B?U1hzZGdTSGtSNk80Q0JHMXQ0TnV5TGIzUk4yc013WFVwYTRNM1F4NS9wMGs5?=
 =?utf-8?B?S0NRczV0VDE4Qi9qWDVkTkN0Nm9hc21wd05IaW5DVGd1OStCMXB6M21jUmRm?=
 =?utf-8?B?K01TdDRvOFBWekdQRGtuV1J3dUp3clhHUHI2dGd1ZFp3c0UySTM1ODdnVzZM?=
 =?utf-8?B?cmMrWVZCTmZtc0srdzhPelVGZ3RHYk5kMWhMUE02MlRaempQdzJEN3Z6SDNC?=
 =?utf-8?B?Zi9wcUttUmx5aDJXRERxQzJjRDMxalpnUmZMVDFFRytON0hVb1lPcDJPWEJT?=
 =?utf-8?B?MVlmbzhkRjZOcWNiZFY3aHpxOWQrK3BVNU5FVkpNOUJ0dll5dkQzY1MxdDE1?=
 =?utf-8?B?V3lkZzVnbFZhdDFoNkR5dWJTU3V0RXhEWVBYZ0k1RmVleVFBcUZRMklCYXV0?=
 =?utf-8?B?SUNFYldUVVV4UTVId1dxeS95NElUT0kyRHpEelN6YXlhL0RaRWZ6UEdwa21q?=
 =?utf-8?B?RnljTHJLNklGUzBsUXpKeUtia2tmdmpLMDUrbGh3M0lwUTBhK053SnFxMXI5?=
 =?utf-8?B?L3cxei9hUTNSSUhTbXhYS25PY2VYV3d6UmFLbWNFOS9rQ1c3a0pXRzRUKzll?=
 =?utf-8?B?SFF5WEtkMmcrM2JzNXE0NVhBeERkY2ZIOEJnSlcvclRicVdaMU01aVlqOG9N?=
 =?utf-8?B?dWwwOHF5ZU9xNkZORlp0dnVNamtFMUR0d1U1U1N6Rm5QbVJDRGZkSkJBYmQ3?=
 =?utf-8?B?Sk8yN20raDMxNldEbzZzQkYwbitBYmFjNWdIYVVBdUp4ZEl1SUlJdkVEOXBQ?=
 =?utf-8?B?b3JKUXQ1WnE0RFI4bWVEdDFnZVFsVnhGaGJ1S09DalA4WTBNMkd0elVRakx0?=
 =?utf-8?B?RTh6QVNST0txUWRNVGhDWWlSNWphU1BqYnRwRjFlSUExNnQ5NDZWU01mYk5r?=
 =?utf-8?B?MWMwSkUrU0phK0Q1RTZFeVZrdEhGZ2s0enY4UjM2S0wyYVpSeDhnYmpMakN4?=
 =?utf-8?B?bytJUDREeUZqd0lyUmxCN0VFRnh6ZHFzN0gwKzh2Wko1aGZFWTIxbm1zdncy?=
 =?utf-8?Q?RlsBGXKMVQVEJ?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-fbb9b.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 811c420b-c54a-413d-a5c7-08df3be3e526
X-MS-Exchange-CrossTenant-AuthSource: MMZPR08MB549315.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 08:56:50.0821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7571
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_005656_521993_EEC344CE 
X-CRM114-Status: UNSURE (   9.13  )
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/29/26 13:29, Chuan Liu wrote:
> We have done a lot of optimization on these issues from both the
> hardware and software sides, and we would like the cpufreq driver we
> submit upstream to cover these optimizations as much as possible.

Hi Chuan,

thank you for the explanations. I will not resend the S4 cpufreq series 
and wait for your patches instead. I can test it on my S905W2 board when 
you post it.

On the regulator settling time: on this board I have not seen hangs with
the vendor OPP table since the PWM clocks stopped running from vid_pll,
but I have no ramp delay set, so Christian's regulator-ramp-delay is 
very likely what made his transitions stable, and I would rely on that too.

Best regards,
Christian K.-D.


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB88606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 11:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jKRcqtf5;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=MdC4/I2L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FgrjzIQDI8ObVqFbjyKYlkCPxaNNYn/oD/O/09uPrMk=; b=jKRcqtf5d+BCVo9aUNER9xi7Rc
	wax1OE6rclmCG6UdqS+WhlfsSCEeer1y66f1VWRAvfEQrZXQwEGEJzmdQfmHHb/1IjUtoJEZGv/TF
	WTUmGfdZCfWZ2eyA4gyjdVPnydyu+xVKq7UvHN3XkqszKGKIHu0Lf3uEUJlzfJeIVIjufGhbLw8bK
	fw8h1XrfwXa4Des/A7h90BslX31l2G7ispV076Ptsst9d3gbbfb88Fk3UlzTOsykKIzckvC3DYUub
	cF+BHedOsPXvcxMZNU+VXyoW2ZG8YkieIritugQ1dM3zYURFwLiYz000+3t+EsENOksCLy3PeBrDt
	Fzho3MQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHqM-0000000C66G-07rV;
	Fri, 06 Nov 2026 11:10:50 +0000
Received: from mail-southcentralusazon11013009.outbound.protection.outlook.com ([40.93.196.9] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHqI-0000000C64e-02g3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 11:10:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+403Y18I2BuWwq1HshEq/X0CFLOVA5ekt0W4SsAxarLEdx2b/JzW94u1rKgOk9TAfQc14RA+/O94CPmZYanlBUUbuXbg/g1pZigDWt60OjczGkTad8CG7+SrKeMKfYUpOcPu5UtJNbUTb6qpER5OUXpCu8pim4ZFL46uC1uFLCamQhb8ad9kqWqEW65vjB8wslgmDRuepjvNGR5A4juKuVpeGCAObXrm3VhNlTEYjXKs6bFCd0b6xD/Yj+I+BEbiQDFyAfZajb4t+wqyOC06UuEDAr5c7mEVbckUcoY98xozHL4XSVjeL5r/+WsDsRPcUNqpCDj2viankELa+3i0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgrjzIQDI8ObVqFbjyKYlkCPxaNNYn/oD/O/09uPrMk=;
 b=tRkwC8TPMlWQPTcAGHfmQ7UvCjZl0Swt2IryNN+eqcHwr0jwb63vhGXcpLUc2ylFqA6ZSsElqnCzzlM6Gzna+yInvpsyqqh/PBxE60Oy4z4Q4RUE2FR2y3axzMI+0qZTPPyJB7YpJ6qu1SIa4RgN1p4xtXqTgheEe4yN/igosiAX59UF9b4k280bP8YR1xg1NP5ktbAv9xHlJ/qmNdjrvnU9F8QdCadbLX5zjSt/faN4Pxxd9VYp1LVqxfjfmln3EbhXsRVDJ+mgl7Dp5yVV8yGDxNPRuyivU8r/siYXiie19TZvPRD2n8pe+n4GWKU1e1yc4dyNWWw2WmEZej1d1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FgrjzIQDI8ObVqFbjyKYlkCPxaNNYn/oD/O/09uPrMk=;
 b=MdC4/I2LABpl2iMN3J/JZCFCczIp2yZz6LLfDpEOFPzD+qf2r8vPHi186gIp2RxgUiDZIDx5ystveLYEloGfeF9uczVj0f1jjwvb2acgxlz/x8vTPVMv+UnirZm/dtG6XJX8VTYFSmGqjz/0rW0TPenyl2IQnD/Gl5IDMxhSwqY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0SPRMB0124.namprd12.prod.outlook.com (2603:10b6:8:1fa::20) by
 CH4PR12MB590718.namprd12.prod.outlook.com (2603:10b6:610:50f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 11:10:39 +0000
Received: from DS0SPRMB0124.namprd12.prod.outlook.com
 ([fe80::24e7:97e0:923e:68d6]) by DS0SPRMB0124.namprd12.prod.outlook.com
 ([fe80::24e7:97e0:923e:68d6%6]) with mapi id 15.21.0592.007; Fri, 6 Nov 2026
 11:10:39 +0000
Message-ID: <9b3280d4-1fd9-4129-9ddf-2f58d404fd33@amd.com>
Date: Fri, 6 Nov 2026 16:40:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] dmaengine: zynqmp_dma: Add new compatible string
 for Versal Net
To: Golla Nagendra <nagendra.golla@amd.com>, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Harini Katakam <harini.katakam@amd.com>,
 Shyam Pandey <radhey.shyam.pandey@amd.com>, Abin Joseph <abin.joseph@amd.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, git@amd.com
References: <20261106-adma_per_channel_reset_v5-v5-0-f9990669362f@amd.com>
 <20261106-adma_per_channel_reset_v5-v5-3-f9990669362f@amd.com>
Content-Language: en-US
From: "Pandey, Radhey Shyam" <radheys@amd.com>
In-Reply-To: <20261106-adma_per_channel_reset_v5-v5-3-f9990669362f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PNYPR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23f::27) To DS0SPRMB0124.namprd12.prod.outlook.com
 (2603:10b6:8:1fa::20)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0SPRMB0124:EE_|CH4PR12MB590718:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fae90be-0bd8-4dfd-c2bd-08df3bf6973d
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|921020|4143699003|11063799006|56012099006|261021121427099003|261009223027099003|261022075727099003|261102123227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: KhrqFF5TL5mbtBU/6aYl0rHsrBAd0jtMhnm6qnnL7P0H5RNNpjH/vkX4x2zZ2dTwf+LIm4n8R6w37QnowkME1fvhqksOiQvEREFX+ZYzQFuagTxdW3xMEG9N629KR1F/n2XXkTni3GTOcZbdL4/8pu1DKX6RNsiBz17C0GTK8Y1Pd88tF1DR7N3+Ctu0nr7U1B7Gg+5qTBBXWLgaV6Slegf/WSLR9Sf5gmWiXOgFds2ThvHbLaoJk4K7CGG/KaA6olwHHXyDLRyEPYNxQSKIwcuJYjDsYYuMSMlSNXhqcK/Z9yMRyqH5igxRRbx60c9LtM63F0yd01J2Zkjs61BynHqeKbHihdaeVcc9iiyac8EtalTctai0ZdNnMqR+sppv7WifepjL3AKGE4Pw/I1SqWOK3FYW0qU1GJaIptfLARwbP+kvqQsVpNPB0Q6htWElJ0rDKZMErqvlYl7xM/wfcMYe3zu5YqdNY9uWWL1kHKlIP5tBV7z13sfXJmtlCSKbgqQwIqmTG01Cj+z4tDqsqqV7xlxhsdrNB2xvzEH9YD3FY2/dCkef/Q1TvtN6BMP30lITIDyQ9ibZOczCHvfAHjhsGK/iGR+/t7+mDGPg3y6VTEnZl+4ratvkoJGgWrVtIjClTkv1ItuMr1FN7HeraGmr/oYX3ybhsXym18+WcRLKwaRggJojo+99mDOHXXPpvlj2IuJ3M3dmR2oGjLYE6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0SPRMB0124.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(921020)(4143699003)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261022075727099003)(261102123227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WC8rWDZLTzIyTUZoWXM2SDN0OExXanJBWEduRWNiN3hJUVQyYU82K0Eramdj?=
 =?utf-8?B?MlRnZnA1RG5pcW1jeVBwQ2dQQ0p3aFRQdXM5dUdUektKc0x6a1Yvck96SUdo?=
 =?utf-8?B?UUhJYldxTWV3QlYwQW1OTDhjMTl1YWVucmpHMzNIWXV6T0pZL0xGUkVEZ2dl?=
 =?utf-8?B?enZSVzF4dnYvSnJUOXhPd1hOR0N1c1BkWEl1b01Jd2tITVhNRWhzNU04N2pU?=
 =?utf-8?B?dmozMHZPbUZTR3RsOUVmakNnQTJlcTFmbXM4SnBhaHROSHRYYUh5OFB5cndS?=
 =?utf-8?B?bndxb0NTU1ArejF5N284TnlUd2xIVVBma2ZtMXB4WHFuSW1Fak95UUk2azlr?=
 =?utf-8?B?d0ZSTFREc2VFMkRrTkZUZmlKdkJObVFMalVzeHBxckZYcFRGcnUxbll6L3Aw?=
 =?utf-8?B?cGpNd1V5aWoxVzUxMTBNalFkR29RcXhwTVhuMzM3UW1YVlk3d01QaEUwZ0ZR?=
 =?utf-8?B?cXM0a0F1OVh3K1dURTZIZnV0azVwaXJYM1F2Ui95MVkwdEhSTlByWjQxbzBI?=
 =?utf-8?B?RnVVaUNvTjZlVVhRWTUvWU9lZ3hCeUpzSi8zNTladUxXTnFvZjJqNGNZcS84?=
 =?utf-8?B?ZHZZRjl6dzB3Wk5kRkJYTDBMZTM3SGZNUGlDZkRMSjNaamdrRFNTalhxZkxn?=
 =?utf-8?B?WGpPSUladHN5Y2ZVNjNtTlg5QkhJQVhlVmpuTitSVUcxK1ZHRVBLTE9tMUxt?=
 =?utf-8?B?Z1lveDB6WVI1dkFCSFR4K2hoeGhoT2puR3Uxdktwb0JaOUFjMm1JcWdFUklU?=
 =?utf-8?B?R0hKajR6NVZsMlVycVNlbVBHc1BZUGNYSGNML0N4Q21mRnh0NzhlazRrcjI0?=
 =?utf-8?B?MUtpVXdPMWJBcFVROG0wMHJJTXlQUFdKMTdGQXhuQXBRR3hTSVZMZ1FJNUdB?=
 =?utf-8?B?cTFxKytyZWl4WVBQMjdGZUlMVEJrWSt3RjJzTC9oNlBQaSs0SUtpbitlWDM3?=
 =?utf-8?B?ayswRUg2a1owTGdRbEdyM2YyMEhoSVNJdjdnU2s0WnpxSHZLZ0FBVmF4dmdo?=
 =?utf-8?B?MEZNNy92UEcxK1BCQll6Rlo3eVVGRnZjUWRVZ1d2N0VKUlNWWlR1dTFvRlY5?=
 =?utf-8?B?dWhVQjNiOHpzL3ZUb0x5bndVZmVuenllcmFTbDI0R0lnRUxocFpSMjl6N1FP?=
 =?utf-8?B?aEhnbzlCbUt0YzdMODJXeGd2Q2FpLzdvdEFJMStvSlY2Sm0rV0hmQ3JNMEtL?=
 =?utf-8?B?RjBnU2ljcmF5Y0ZHZUl1UFgvcWhPZW5ZYWE0S2hmekVCMUJIZFc0RFVJRHQ3?=
 =?utf-8?B?QnROcVJqQjdkcmVHWVFTRXRFNDRzK3ZFS3JybFBwMEJ2WkNESy9iM0pLQk81?=
 =?utf-8?B?Z3VhSW56YW1VWldVQUtpcm4rblFnR2FKODBOZHBOZSt5VVM3N2dkZGhBRHZY?=
 =?utf-8?B?OFlGT1NmNzQrSmplT3JxU05YTkVhOEZsSnNJalI1SXBCRlpSVSt1RC9vUk1q?=
 =?utf-8?B?MktjbURXWXVoMGdBaldxV2FhQ1dBVFNaUjNQWjY3R216a2tDdk9hZGtuejh4?=
 =?utf-8?B?UGd1dU1qZk1ZNjlOalZrWnJqZmZ0SjVLS2VWUnJVQXc1NXp6WHRLZ2xISlh6?=
 =?utf-8?B?QWp5aVRzVkJ5S0ZlYmtyL1dsNDNhOTJnUy91K3hCakJKTHQweHZIV2tWbVBs?=
 =?utf-8?B?VU1BUHgrdk0xb2dkQ2JqR2NtWk8vekdUYTZOVmplS2V4YndYbG4zVmp3T01s?=
 =?utf-8?B?ZS9LRWhMM291TEZqQ0Y1ZWUzbjlsbThQVjdsTVRjSHFnZktqRzhxQ2ltbVox?=
 =?utf-8?B?YTRnRSt1R0E5N0lxblB2a0t4b2ZTVUZROFMzNnRmYmw1aWdwQkx2aFpsNEJz?=
 =?utf-8?B?VDJHQWNGcGJJUExtTkh1Vm80UXpmelUxRi92Yjk2S2ZJU01sMFR4bVh1aXFN?=
 =?utf-8?B?QXU1anhDVGtXdjNPcHZxcHdVZ1FCaUllNDM1eHhpVFZhenJuTm5YV1F4Z1BC?=
 =?utf-8?B?MElrbDJMTWxUM1FBZXczaXN5LzVXamVXelBIbnRneE9yZ3FkZHExaG0veGJh?=
 =?utf-8?B?THpCY1VWQ0lKNFVXcW5iUWR4VjZqbzExRDlEMFpWRzhvZ1dhc3lNZ3ByTzlv?=
 =?utf-8?B?Wldnd05tUTlydENYMytnR1hWQ1BHR3p6MFFTOEd3OXdqYkxRdUM3bjlmaHpE?=
 =?utf-8?B?VVEvMm16a0QvVGdXQ3pDUGVISENOVjJDYWNUMVBZV2V4UG1NMHdXLzVPYm12?=
 =?utf-8?B?UVhGV2lKMWRadUhhNUh6SXlSWW5Fb0xabWk4dEtNQUJla0hpS3JIVG4vSmtQ?=
 =?utf-8?B?TGJkSjZoaXZjS0VGT2YzWldrOTFqb3Y5dGVjL2RGdGt3Mk5xbnpldWlJdHFC?=
 =?utf-8?Q?NQQunbFr+p2zWO4LYC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fae90be-0bd8-4dfd-c2bd-08df3bf6973d
X-MS-Exchange-CrossTenant-AuthSource: DS0SPRMB0124.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 11:10:39.6258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9sfk3rpwREBQh0nxsJdxh9wJ7BD8fWq7ROm0mSIu+l7Wh6ZkaCXlOp1RzJ2vlKN7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR12MB590718
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_031046_115258_9E840C10 
X-CRM114-Status: GOOD (  17.77  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/6/2026 3:40 PM, Golla Nagendra wrote:
> Versal Net previously used the legacy xlnx,zynqmp-dma-1.0 compatible
> string. Add amd,versal-net-dma-1.0 to the of_device_id match table
> with SoC-specific match data via versal_net_dma_config.
> 
> Introduce a has_reset field in zynqmp_dma_config to indicate whether
> the compatible requires a per-channel reset during probe.
> 
> Signed-off-by: Golla Nagendra <nagendra.golla@amd.com>

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Thanks!

> ---
>   drivers/dma/xilinx/zynqmp_dma.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
> index 3b7dfa53f972..cb0eb13f9b05 100644
> --- a/drivers/dma/xilinx/zynqmp_dma.c
> +++ b/drivers/dma/xilinx/zynqmp_dma.c
> @@ -257,13 +257,20 @@ struct zynqmp_dma_device {
>   };
>   
>   struct zynqmp_dma_config {
> +	bool has_reset;
>   	u32 offset;
>   };
>   
>   static const struct zynqmp_dma_config versal2_dma_config = {
> +	.has_reset = true,
>   	.offset = IRQ_REG_OFFSET,
>   };
>   
> +/* offset = 0: Versal Net uses base IRQ register address */
> +static const struct zynqmp_dma_config versal_net_dma_config = {
> +	.has_reset = true,
> +};
> +
>   static inline void zynqmp_dma_writeq(struct zynqmp_dma_chan *chan, u32 reg,
>   				     u64 value)
>   {
> @@ -1193,6 +1200,7 @@ static void zynqmp_dma_remove(struct platform_device *pdev)
>   
>   static const struct of_device_id zynqmp_dma_of_match[] = {
>   	{ .compatible = "amd,versal2-dma-1.0", .data = &versal2_dma_config },
> +	{ .compatible = "amd,versal-net-dma-1.0", .data = &versal_net_dma_config },
>   	{ .compatible = "xlnx,zynqmp-dma-1.0", },
>   	{}
>   };
> 



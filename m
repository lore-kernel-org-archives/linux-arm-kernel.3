Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCEE606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 15:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IJWajBdj;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=UKhDneiU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=py1JvQwfUzRbCD/nJuOQhN7tg0SgH0eH0Nb3TkOU/68=; b=IJWajBdjrfL9LWe81RUV+9bCrz
	fwFVJAZLyBxkiS4SCFG8ldPQgvluT7v4T2HA9xqwD7dg2J9uwbd9u4mS3JNBgH4r5uOopWc7l+K8o
	gNeiwY1SrFq3Fgx+iti4xK3n7wIHhhckNCKw7C3BxFOWvzrak3jXY8qxaOk9XI9BrIDR3DpxL/VTD
	BhvRpr1xW1osL2VKLlio0n6ybtuKYcARt97ZtRzar5XldQ7ae+mqiNjwKXIGeYy8JJUBF6USIHnrA
	05k649lYB9tydwTQtMMVn38jGERRscP8B/0s7kRjipBbo253kFNM/wNxRKzZT2QbY2vIsMv4MLRnO
	5X8q1iCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoSH-0000000C0DY-0QjN;
	Fri, 30 Oct 2026 15:23:45 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoSE-0000000C0Cg-3DSW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 15:23:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXJt5E2XXkXajVO+Iu/HYi1FSQSqyBhk+SoMbSN3iYUjlJDWpnX2QvEMZyULh3xqLzM8Un+75arZWc5MqNrjVIXae21nZdgm5PrqxkRNm9i3MyeOL3STcynCmXF1fAgdNhUkN+jOjXTnmQ9zFNtK+0fJ0AeInO/RfrR5z0q/CX08bVzcHotvbHPb/WhcZ7otiFWLxxVSiMBho/A49M1u6GOK7j+RSv4NZcV+dr7JRgZ2ZfK2vERrlBkLh21VCghzdHVIK3SB9AajeZzitFTGWflftAzlgfKJE2xexVv9e5rpD1wMrpWSBN2GOQVhLqp/qrRpGmW7iY1jQ3Mbd59uXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=py1JvQwfUzRbCD/nJuOQhN7tg0SgH0eH0Nb3TkOU/68=;
 b=F8cuczC9dzhlydjKPgKczYAvOaFz8R+9GD5a3cuVtC7/39dIWMvDtnHjHDi4TIks+ivwZ5zWc+hnQM3mkTFlZkDYCV99u+yZayB0/Zj2Taux/obNjEwrnINbQAWAHtMHKiIzWLaAKneo/N5nxTiXU4fp8RP2MmkJe4ixubMJVeGD1anfjGUSe2iwa6QOY4hqMEQrf76uPOinWS+HE8e6Vt7W7op8GrQ7d3BMn8rRAnnmEaaq3x+iQjyC667eh5lpsgWxTPBXRVttNO4osXCm1u5XIY1+whysWwvDYj98jgYEyECenuOKyv4OdqwmCJZbajcDu44nhUiy26uk2WzcAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=py1JvQwfUzRbCD/nJuOQhN7tg0SgH0eH0Nb3TkOU/68=;
 b=UKhDneiUIDFPUw8OeLRiYErWwt1DR87yrk+O1aDfQFOqAu0U6iOTcDoBdVaEuKAnaluAKvWGW1/VlkJmngy3KuzqVg5zSwT7wpZuejRuq0dtyrFQSu3yEesVXpFnuOKXgwwuBWi9BeYthNuM6Df94d5UFpIXdpTV3+VB8zpHYH4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA1PR12MB6798.namprd12.prod.outlook.com (2603:10b6:806:25a::22)
 by SJ2PR12MB8830.namprd12.prod.outlook.com (2603:10b6:a03:4d0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Fri, 30 Oct
 2026 15:23:37 +0000
Received: from SA1PR12MB6798.namprd12.prod.outlook.com
 ([fe80::e317:e4a3:6ae9:8c54]) by SA1PR12MB6798.namprd12.prod.outlook.com
 ([fe80::e317:e4a3:6ae9:8c54%5]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 15:23:36 +0000
Message-ID: <2afaebcc-ebbd-4beb-bbee-9646d56caab5@amd.com>
Date: Fri, 30 Oct 2026 20:53:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dmaengine: xilinx_dma: Fix cyclic period count
 truncation
To: kernel@nullptr.com, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org
Cc: Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Alex Bereza <alex@bereza.email>,
 Folker Schwesinger <dev@folker-schwesinger.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261022-xilinx-dma-work-v1-0-20faea2e7a80@nullptr.com>
 <20261022-xilinx-dma-work-v1-2-20faea2e7a80@nullptr.com>
Content-Language: en-US
From: "Gupta, Suraj" <suraj.gupta2@amd.com>
In-Reply-To: <20261022-xilinx-dma-work-v1-2-20faea2e7a80@nullptr.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0047.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:49::11) To SA1PR12MB6798.namprd12.prod.outlook.com
 (2603:10b6:806:25a::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR12MB6798:EE_|SJ2PR12MB8830:EE_
X-MS-Office365-Filtering-Correlation-Id: e01bf4d2-4b3c-4164-a2f2-08df3699c44e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|4143699003|11063799006|56012099006|261009223027099003|261021121427099003|261021123027099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 8ZO9VcVUgUQ0PMw4sxJNihmUuqZgc/SDaUnqhUcgKDXgOvT3lrPcwMeZ+P2AW5NCbSOUseCfdvSUXn3j5LAjGRRvjd7V2l0vPwhhZPxBHvutqSQPYOUtPMWkyY0b3V++nAopWnoytssvp3Oj4rw2zyIpFVSEVX6/hVbWBErUKNbqb0BgR1XfbEE9dBxOldge++xCcIAqej1mTzQwlYFjJo/h4WeCAdAnbtMDTY/kzlYJVLhBS2DEuWogLLX6jkjy3Sc5UMvnspqpgbBW7GYrDlyUNdmkjzjVgd4692C+0WSDio4dW+Ys5m+0f9GYhn5OsiSqa+/SiSU3B4iObbxryhKG+CuHQJCeose1z01q3wyUI98lNJQosibNpIeD19Ht0lp3FVVImLO33V5vgE+lEDnK9RyLf1bgsxEAitL7ftIEc2QoRXArVFFMK/T9i/Rguu/ph1kEt3q8bttINiQaTaDZ+sdkoelgLNM7AQimPkjqSXMJCTpu2st9oGcB5e7T0QsbWw6d91MFp5z7pYub2xOjnNijbltFVYg9TS9YNPmsM46OiJ0dTLfKtorVbVCx1iVQAU1i3GtMw71qdUZ5s281xrMu54/B8Zq6ny0s3q7Zkp9O5sVH8ziW72dGfqTErABYtERKpOOFv8CQ6+C9OWv+wxsZ7mXq2PhT4QbhM+0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB6798.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261021123027099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnFwM255OFhLZ1lEendJNzk0MUNsNEhOQnFudUttYVhHVGhOVWVDK2JINTRt?=
 =?utf-8?B?dG5RR3BtQ1QrRHI5NER4WmZldU95ZGlHUy9KRXhTc0dZMlQ4NWxmbHBwMy9U?=
 =?utf-8?B?SmpoWlFoa3JZdUgwbmdMQmc2V245Q2d4S3A1M0hveEJxQzZLa2trTm9rR1hq?=
 =?utf-8?B?ZFdrRWlZK3N6dU5STmYveG9kM2V0WkVGQzY5TWp0ZkM2eGMzT3JMZWZXZFE4?=
 =?utf-8?B?SS9jRXFzclVzQXVDbm4zNENQMTIxTHlIWnZ3UWoxTFRZOVd5ck84cFdiRFRz?=
 =?utf-8?B?dkFnKzU0clBwWmhMMGxoMmNmNWszd1JybWIzQlhmaGNoY2lZRGxCTmYvODlE?=
 =?utf-8?B?aXB3UXVFdlVMY3I3TWt0cDhXRzhkWllXVEdEOEUweWw5UzA4RVlhUWpMN3B0?=
 =?utf-8?B?UjRsa2dTelUxMlgxZlRzWWppWUVwMm5VT1pESXV5eitTT3c4Sm5zdWdMZWRR?=
 =?utf-8?B?NFNJWDRnRlpweWNjQU1FeG5oS2s4SlVuWlNCT3hVeUlRWkZ0Vm4yNzNFZ0c5?=
 =?utf-8?B?TDBnSjhaUWR3VDAvc3NWS2ZGYnM1WHlYZDY1eUhER3dMRktkQmZIQ0FKelRu?=
 =?utf-8?B?UW53dWZacDNCVDkva2VHRnVLemxXUURNWXFlanp3U3JJY3hhelUzQlU3aUdD?=
 =?utf-8?B?d3ZtUGdhOWp1aVF5SHdCdVViUVNjekNQZC94U3Q0UUNFWGowdCtmbVJWMFNQ?=
 =?utf-8?B?elpYZnJnbVpLN1BvRG9DckxvSzQ1UUpWaHNqMStPOVY3eVIzYUFDUEl5T1JP?=
 =?utf-8?B?UDBQTlVEZVc3TmY3NC8vUW9uY2dRbUd3YUIxOVRuNDJZN3FEQllPTVVhWW5x?=
 =?utf-8?B?bTZuMVJ1aGs1NkJyTWEwKzFGV1RMTFpianVQYTF6NVZSS0kxeHNDZ3JMcTgw?=
 =?utf-8?B?V2IwQlQrenY2WjhDWmtyaVFFaTJkMWZVdTZIbmNiQU9nSEFqdjh1M1NpdDJq?=
 =?utf-8?B?NW9ZRTVyZkpCMzFkOHhYVUhiZVBMYzdlT05XNEV5eHV5S1l6Qk11UVhuUEFk?=
 =?utf-8?B?aWR2MEQ2K2dmcnFOUVBOUzl1RDFNdDZKQjBldUx1OFJlVmY0NEZSUU8vYTVM?=
 =?utf-8?B?N0NOaCtqeEQ0ZWhERUJyZUZ0aGRuRk55TC9NcFlDSXNlS1o2SnlmV0JtSDdh?=
 =?utf-8?B?WkRyYUcvdi93Q1VPRXFwM0VmN25rRE1QaklUMW05VStweVNuM2JwVmN0VWVH?=
 =?utf-8?B?ZHcra3Q3QkRiajdvZFZoZzMxNXhHQUVSNTB2ZjlCejNSdHFkNk44OEIvb21N?=
 =?utf-8?B?UEw5alJ5dXloU1FOTGtKYSsyMXpxMXRURTZYMWxEcWZhU05FbllmclZVRjlH?=
 =?utf-8?B?enNzVW0vcm9MeXFVbFFleGhFZlJhUENzdStoRTZxUkxkUkF6TkZuQVM3eC9F?=
 =?utf-8?B?ZUJScC85OGpvS2tPanNVcUlKV3Q1Q0o5T3hWNCtFWWRLYk4vRndzMm5qUE04?=
 =?utf-8?B?ZEtSakdrb2JITlc3Skp4RkE0SUxpTzFLQUtQRFpiWVZEM3JYdXI3cEhHaGdB?=
 =?utf-8?B?aFJHQmRkZGJEdGs4Yys5eXNvaklTZU9DQlJCNTJobHVWTXVuc0xjeG5BbUVO?=
 =?utf-8?B?NzlUZEw3NktEV2paRVZJVi9qZndsQjJsZXhIQkFDY1hNZXkwYUhQZXRnL2ty?=
 =?utf-8?B?emdMN2I4aUJDTHp4anBqV0RUR2hxeWdJWm5ZeG9WaXRvMEtvRUp4RjN0NUxP?=
 =?utf-8?B?MVVKd1ExOHk3VjFJNXcwZHB1QUNtemV0UFAyRExiZUVtT291eDBta3RXTTFS?=
 =?utf-8?B?OUJaRHhwbjg0QzVIWmpwSVUyblVWZ21tR0hpeEZpQlZXM0tjV3pUQU1tS2RW?=
 =?utf-8?B?d0phK3JrSEV1akFOWjFNZ29KK2EwUGV6TjAwRHpVb2l1bkxBNnRibE5qOWZZ?=
 =?utf-8?B?WVgvNlhiaG92VkVhU3JsZWZKMDVneFVWZmNhb2hZa2JIbGl6SmgyR3ByZmNJ?=
 =?utf-8?B?dUhpNEtrTHlBQjFUQWlWWklEbDlsclY3UVZ5eUt4N3ZETWwwRkpJVGtRK2JS?=
 =?utf-8?B?YUhmdW52WHAybnAwMUhpSkdOOFE3YWpMb3pFZFo1WTY4b0FIWVNlTE5WbklW?=
 =?utf-8?B?d0NhUHpTZjRkWmt6cnQ5aFMvNXJhM1VyRzV1Rmtpak9LaUlzaDNPVWd2V1l1?=
 =?utf-8?B?SEZSOHJ2MlJhbUhTN3hqeERiL3lPQTA1dGt3aVlNOFJhR29oM0tmMnozaXdn?=
 =?utf-8?B?L2FrREtCcjhuYW1kOUxDNDgvYnhQMHI4OTlKdHJIME1uUVBpMXBkN1BqamxQ?=
 =?utf-8?B?blIzU0tOd1Q1Ynp6aUdvTDVkY3N5RDU5MmZvSWhTSjZKSG4zdlJTUTh6S0hj?=
 =?utf-8?B?aVNGbGdKa3JadlFZMmF0Yks5SXhJYm9zdEIyVTdpYm5WSlJTaDFQUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e01bf4d2-4b3c-4164-a2f2-08df3699c44e
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6798.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 15:23:36.2816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2H3ZpfBU/LMoN8eVzQkJv9WJM7YF+dq4UbQC9iDiKIbpstSfEvrJe+cU8ltlS83ieCwj14buvgwRXaGd4dnyZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8830
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_082342_817414_6385163E 
X-CRM114-Status: GOOD (  16.57  )
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



On 10/23/2026 3:41 AM, Jeff C. Jensen via B4 Relay wrote:
> From: "Jeff C. Jensen" <kernel@nullptr.com>
> 
> xilinx_dma_prep_dma_cyclic() stores buf_len / period_len, a size_t
> quotient, in an unsigned int. On 64-bit builds the count can be
> truncated: a buffer of 2^32 + 1 bytes split into 1-byte periods becomes
> a single period, and the transfer covers one byte of the buffer the
> client asked for.
> 
> Compute the quotient as a size_t and reject it if it exceeds
> XILINX_DMA_NUM_DESCS before narrowing it. Each period needs at least one
> hardware descriptor, so a larger count could never be prepared from the
> pool anyway.
> 
> Fixes: 92d794dfb699 ("dmaengine: vdma: Add support for cyclic dma mode")
> Assisted-by: Claude:claude-fable-5-1
> Signed-off-by: Jeff C. Jensen <kernel@nullptr.com>
> ---

Reviewed-by: Suraj Gupta <suraj.gupta2@amd.com>

Thanks!
Suraj

>   drivers/dma/xilinx/xilinx_dma.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
> index 5ccc9f9d58a3..aa714effd10d 100644
> --- a/drivers/dma/xilinx/xilinx_dma.c
> +++ b/drivers/dma/xilinx/xilinx_dma.c
> @@ -2454,7 +2454,7 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_dma_cyclic(
>   	struct xilinx_dma_chan *chan = to_xilinx_chan(dchan);
>   	struct xilinx_dma_tx_descriptor *desc;
>   	struct xilinx_axidma_tx_segment *segment, *head_segment, *prev = NULL;
> -	size_t copy, sg_used;
> +	size_t copy, sg_used, periods;
>   	unsigned int num_periods;
>   	int i;
>   	u32 reg;
> @@ -2462,10 +2462,11 @@ static struct dma_async_tx_descriptor *xilinx_dma_prep_dma_cyclic(
>   	if (!period_len)
>   		return NULL;
>   
> -	num_periods = buf_len / period_len;
> -
> -	if (!num_periods)
> +	/* a period takes at least one descriptor */
> +	periods = buf_len / period_len;
> +	if (!periods || periods > XILINX_DMA_NUM_DESCS)
>   		return NULL;
> +	num_periods = periods;
>   
>   	if (!is_slave_direction(direction))
>   		return NULL;
> 



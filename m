Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4470606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 15:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=svPsuHCF;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=SyG5qodL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AetRUGweI3jfU/kyX2p2nePllC95O5d8+WQrKqemWWM=; b=svPsuHCFpBSjpk
	KSs8H+dJ1x+O1QG8nFKAfHTGpvT5eoBcCjj3OyU9HowGrD3t0KNu0l8s12EW4FMv5sqcpSc7tE/Ab
	dKIlZ6I+jCNocSA0HGFDJ/cjh2eKIrNui+aycz+SFIfBbYE4Z8YHUFYPchj99x906hfDtPgTDSFu3
	C8tDYC561s9cN/NzQUGxQrqKj+ma8mHC6iGhMm8pdlpig7uxq3wUIUOEuOC8XYujnnjzGDVRhSTpF
	Ld2ruHynU8pNQ3Ar6/mmXl+M9F8/Bxm1lS2d8JskeQHBsYAUeChj/LhCF7/gsfm76ys7xaxNncGlA
	xIhgoeeP4Vv2HltbT00g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5Od-00000007K2w-06QY;
	Wed, 28 Oct 2026 15:16:59 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5Oa-00000007K2K-2lq5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 15:16:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=maen6L33S04tYhyUYlsSH2FYAz/tGb5bgFRirQf+rPlco7Mc1K5daNoc5hWqbuCNVTdYuuExiSjKW9Ym4uSXWprGue+7ngTI0pFqolzWzPJRwuEWQQQBXkooeSRbUNoKAfQWcqa42juGqpy3uY4ToRTOYC1BaepqDRAFdCcb8rx3Lo/CmBh3/HGpEJg+/UqDgJbILW4QnxQRfZz7BIQ7UKOA/WWF3OSC6cjjuCFZeQmP/f5z01TtnKqx0P8xy3kDg0QEJoyPMfAYbpuZhdMhGE6/rioh3SlmaMOcTQMSfXUr6XF+uwXN8wgcjYvYPsPO5RwM428CgyfbCdicE0N6xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AetRUGweI3jfU/kyX2p2nePllC95O5d8+WQrKqemWWM=;
 b=jwJwLxC/NJFrcB8LToRVdGN369dTdVuY/n+RkfUk/fTuhBN4EDkcLcVygq0S5Le0Q+AjCgBkyxXJhudavdyoe6svbhTA8N5Fp+hRRSPdnnQLWyVZISUESMcUendX/lliSdOkGYfVb+iDsV33XcxpydohvB0Ur5JXpJ2g3caPDZme94ZMltf+rzgwZS7LslXWZm+7y2sPqgT96ljtIFSoRu6B4v3avw7AIEMzT0QyBr98D1qC1PFKgYqsPQKrUlhNm3g2oQrEoV3l4Ke/JYSugMwLRR0zljJyXBXd4cvcB2I4dXDP6WkjPTd3T25S4gldBvt5vqZbao6xtvpQMOHWJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AetRUGweI3jfU/kyX2p2nePllC95O5d8+WQrKqemWWM=;
 b=SyG5qodLziRYQOdw1+l5nCR4jN+AjinzgsCErM+eyfhX27dmAxKdP54Cb+DPgST7595sBulh8FLrRgkvMCpEB7LVERINAMsCsTiYAOQBPt9MB4j0ar3KwDkb5VhQtyB7xNTfKiR6PU/sTQoUsIXzLuTzUIOFNWbpfapAADJnyQb60osl+OvoOv3oMKp8kGgrX5Ue0IsSjpSD0PTnPUTmBFnBfuRUSJRaZN9D1CIJtRLKx7jy3esR0Vw5VBiFUZGHwe/H17Oosb/2LXv1bw5AZ0Kh3wGO6P54lQatZn+rN0U0YAAPb8bW8G5Th2nXIIcVLptVZYdcPiEGZ/TCavP+Gg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AMBPR04MB879831.eurprd04.prod.outlook.com (2603:10a6:20b:7b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 15:16:49 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 15:16:49 +0000
Date: Wed, 28 Oct 2026 10:16:40 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Jeff C. Jensen" <kernel@nullptr.com>
Cc: Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Suraj Gupta <suraj.gupta2@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Alex Bereza <alex@bereza.email>,
	Folker Schwesinger <dev@folker-schwesinger.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] dmaengine: xilinx_dma: Withhold an AXI DMA engine
 whose reset did not complete
Message-ID: <auIR2GFWZHUP5vzs@SMW015318>
References: <20261022-xilinx-dma-work-v1-0-20faea2e7a80@nullptr.com>
 <20261022-xilinx-dma-work-v1-4-20faea2e7a80@nullptr.com>
 <auD5_fHykXpkQ8ns@lizhi-Precision-Tower-5810>
 <CAHnw2UkB_KTh3c816SUUgaH=SenFKOpYwvaMvowzi-O5oFmCyg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHnw2UkB_KTh3c816SUUgaH=SenFKOpYwvaMvowzi-O5oFmCyg@mail.gmail.com>
X-ClientProxiedBy: DM6PR02CA0145.namprd02.prod.outlook.com
 (2603:10b6:5:332::12) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AMBPR04MB879831:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eced527-e790-43a9-2030-08df35067d29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|19092799006|11063799006|4143699003|56012099006|261009223027099003|261022105027099003|261026121527099003|261026140227099003|261021121427099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: UA48AS5ty+Q1L/nfGG2r/VK+whGB+yx4S7mfC1avPZVEJAc2K0QH3Jgz2ZmMKIj6JECQw1rpsaYPFlW2XoLHPElfgQoaMPnDPZIk+U0ovsPy+xa6RqFHHsD1QyU96bH1FSn+gUBRzffIJo3e2fndGMW1w1AlA80xCeSLmObwHWbhhWceknH/Rfpb83vN37pxlKTl6n94aAGvCN2GFqYZOh0otwOBgRc7L2q85Y5OWAgcySlIxCm8Sr/NU7E+Q0AH0LaeXy8wXq8aWd8JwGvYSWjjXEEEndU2Vvm/W7JmwZKyNC4cGebyLQLYpCvVK+mLx27oJ3MBIvS+O/RhWEnS6SLAlgmdiivLMY/sCtyM4Liwqu03mtjXNGRvPcsT9L6hs51PXeeLNcz/tsruu/RMRVMzZjI/at8jcvUOChAQOLQn7Vqu7d6xZcXx2GfhnsZ1j4t9lFgQzIiQJQNz1E/SIXqHtcSGeLVfn2xQja6eWCuRJC8gXd3soIBCbCA8u5Qjc1fjq78UhZA7djwi04a6fMGCWDSR2w/egzhZidSDKalfvXOWN/1oAziRq+U+HIPfHdAAbEAlntaFr0OlGM13NCJ8e+po0iJyNn7I1+/pbSfIZ+L5pCrkUpyPdvhI+RU3vIhnaOk2ZB0RTjEo2Sx7PA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(19092799006)(11063799006)(4143699003)(56012099006)(261009223027099003)(261022105027099003)(261026121527099003)(261026140227099003)(261021121427099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3lveWR5N2ZDYlk5WU5uSFZ6UWdWbVo2eDQvb1FGc3cyRnV5ckNMdTZaRXBj?=
 =?utf-8?B?VUpybWdFRmhnbmZrdjJDa2VPMUVTdkR3bU91S3BaeUtyYTJnZy9mMHU4M05E?=
 =?utf-8?B?MlZIV2VOZlczRXM0bUYrbGsyZlRhbUtlRUl1K29RRVlvQ053WnMzYkNYRHZZ?=
 =?utf-8?B?NkpFc2FUNXUvN25LRk5Td3lMTjYvN1UxaWk5MmVVYXpvdkRaUE1rYVNVRzYz?=
 =?utf-8?B?dHUrRnovSWgyVDN5bnl4VjNWTWRGRHY2UHhmaXVrd3VUWlRzM1J1SEtBYjFi?=
 =?utf-8?B?RkFKY1lWSitkeGR6WlBuN2FOUDYwdEw3RE1kZ3A5MmRDMldmM1JCWWRBRU5r?=
 =?utf-8?B?bUFiMnhDZElKdTQ4azA3Y3ZlOVRGbG9ZQkN4UEV6dkQ1b2NKbFNKWGpPS2tj?=
 =?utf-8?B?TDFROXBRc0RXZ0o1NFNJdG1TdzZSZDRRc1RwY1ZISGpIcmFWRVk1MGZZVkFp?=
 =?utf-8?B?RUZ6MzdrRFBuS0xzQ0FaSUx4bnBNc0xUdmMrNlNXSkFoZGIzYzJ4WXNqdFN3?=
 =?utf-8?B?YTE4Y2pHOWxpcUFoQ0tGdyt4OGtxS2JxckllTXdLSUI4Uk1CZitSelJEUkFB?=
 =?utf-8?B?dDNSdXNEdFdzdFJXV01EdmMwTWtURWVhY1VGbEx2ZlFaU0oyK3JBSE1Mdkpn?=
 =?utf-8?B?eS9SZmNCamk3T1paMXcyZ0VQTzRySHlrU2Z0Witxcm04Zm4vbmljaS9mQjVj?=
 =?utf-8?B?bS9mUWdVbStQNlY4OGVDc09zbnRuSjhweVM2ZCswT2hKZUNydkZHRGFoYnNa?=
 =?utf-8?B?NW40NnQ1WWFJRmlpeVhST1V4MDROSThGWlUwcGY1MDR4Vis0aStJZEpoeGdM?=
 =?utf-8?B?WThydm1oOEFkWlZKaSs5R1hMV3FoV3hKTkNySTd4aURNYk1hRE1aV0N1Ujdo?=
 =?utf-8?B?cmhjS0s2alpwMWRUOFVpMFhnelNKS0JVaytjdXFpc1dJR2dzSDFFenhjcWFi?=
 =?utf-8?B?ODNHdDRWS0w1bzlGOXdwalZ6a1l0VWtWMGppRUwzNUlLZUs0MGxYSVVENlgx?=
 =?utf-8?B?ZWVaRlhPWmg3V1NtdGp4QytSWVZWbHNsQXg2b25uNWlSdVU1aG1hWCttME9N?=
 =?utf-8?B?ejRuREVadGg2TjVGSlZtWi84ZnFWdENLRHl3cUI2dEhXU3ZOSndXSVUzSkRr?=
 =?utf-8?B?REx3bkIxamh5eG5DcWtDZERRN3Brd0ZRYitSSm9wbGRSYmRBRU5EYzROS3Ux?=
 =?utf-8?B?ZFhBZlRBNzZzOSt5ZE9tRVdxTE9qdVBIQlI0WjNUMERDQnBVb3ZLZG5vTDR0?=
 =?utf-8?B?Mnhwc2Y1Q25qSVVrZFh1dk55TkhKNHRIUkxUUVdHckdIN3FPN2xaeGJLdnRK?=
 =?utf-8?B?OWEzbzNBUXRKaWRiZHJPM0Iwalo0bjZ4WjI5WWEwVVQ4aEE1aFVqZldQZ2N1?=
 =?utf-8?B?eHpCUVZldHJXQzBtNkNTaEpUQXUwS2ZyRTAvS2ZqemVGR0dKNDNIMGtRc2Qv?=
 =?utf-8?B?cHhnN2o0VTB2UjZOdVFPNHBURlhGeDBvVnZnUmt3d2RQMzdsb1UwWEJMcndK?=
 =?utf-8?B?K1VyN3V0Kzl4cE40YnkzaVFSci9SMGdQL3lkdTdwSUpoVUhNWUU2RlVjands?=
 =?utf-8?B?NkpwQzltM0hVam11TTQrWHBjRHpRVVhCSUx3UTZ1VEpHU1l2WmVnT0NsV2Rp?=
 =?utf-8?B?dkVlZllQNGI1bjh5Tk1SamF3SUJpcmtpWGU3b21kdDBLdlJGNjRiZlAzS0wy?=
 =?utf-8?B?Zk1Rc3BPb20zYVY0bkNwdUNWb1ZBTFVPbUEzSTdPUGpnanhkalJEd25QYmhl?=
 =?utf-8?B?MGdMditXei9DVHhFMmRRNU5vZGUrVTFVNUhEYngydU9aVGQ5VE9NS2NFZ280?=
 =?utf-8?B?dC9QNU8zQzNQeFhObkhJZzBxRlU5MEVtdkNlZWJEdnB0NmhqQmdUdXBjM01k?=
 =?utf-8?B?Zm5jZUIyU3Z0ZUxFWHpTeTEzUDRIMEsvSWxNSEJRdjFJOW1URWVmOVpadjRD?=
 =?utf-8?B?bjEwT2lTRm9TN2ZYdTVuUS9jRTY0aHZCYTNBR1dpUFFEa292TW80NFhrejBh?=
 =?utf-8?B?WFVVdEtwMk5HNDFQci9GcU9ab1ExaTFZYkh1Nm81Nm9SVU9TZWZoZXdhZldu?=
 =?utf-8?B?SDJQakhzN3FvMG5jbk1ocE84bFBvMjd4MGluTVBzMGxDdXZPWUlyb0dMRnVM?=
 =?utf-8?B?aTVsUmtDeXRUS01tUWVZMUs0ekwwcjhzTzcrOHpRbjkwN0pMMGFwZ3p5R0NQ?=
 =?utf-8?B?UUNwUjF4RXMremx1RGtYY2RDUTBSaDNIc0R6a2dxY2VvdVZLOVUvb1RxL1pz?=
 =?utf-8?B?TE9zUTJ0UHRSaVIxMDhWVTdHdkN1V3E5NUx3THhQQ01tWnUrbUFBMW5IOWFn?=
 =?utf-8?B?RHp6dGtMNDBsTTZBTEVxMTdITjJrNHl1S2lzSHJOZmJPeVNtZitXYzZJY0pU?=
 =?utf-8?Q?tA/aeMvLnTs0tZxRp61ep24M3MVoAqAWlbzbY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eced527-e790-43a9-2030-08df35067d29
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 15:16:49.7691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qDZ79jV6RaWNywTTwyhZmtz5iMUgLmbo7MVGxk/+4ps/XuL+wT9gPjH9e40rfvFXOLLQYVwyOv8htDTSsjZfKP+zBTqEDgW5MZa/C/tAjcyredDr4YbKqq+50ekQwzSl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB879831
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_081656_705757_57BF72FF 
X-CRM114-Status: GOOD (  18.37  )
X-Spam-Score: 0.0 (/)
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 01:36:27PM -0700, Jeff C. Jensen wrote:
> In theory. I haven't seen a reset time out on our hardware. Every failed
> reset in my testing was injected with fail_function, as the cover letter
> notes.
>
> PG021 describes the soft reset as graceful: "Pending commands/transfers
> are flushed or completed", and the Reset bit reads 1 while the reset is
> in progress. My reading is that a transfer that must complete needs the
> memory side to respond, so a stalled interconnect or memory port would
> keep the reset in progress. The driver already allows for that, since
> xilinx_dma_reset() polls the Reset bit with a timeout and returns an
> error. It just doesn't act on the error: xilinx_dma_terminate_all()
> frees the descriptors and returns 0 regardless, so if the engine is
> still fetching, the next transaction reuses segments the engine owns.
>
> Patch 4 may be more than this series should carry as a fix. One option
> is to drop it from the series and post it with patch 5 as a two-patch
> RFC, scoping failed resets out of this series.

Yes, reset timeout is most likely Triple fault. If timeout happen, most
likely hardware fault and can't recover at all.

We generally choose timeout value is much bigger than enough.

Frank

>
> -Jeff
>
> On Tue, Oct 27, 2026 at 12:22 PM Frank Li <Frank.li@oss.nxp.com> wrote:
> >
> > On Thu, Oct 22, 2026 at 03:11:33PM -0700, Jeff C. Jensen wrote:
> > > When xilinx_dma_chan_reset() times out, all the driver knows is that it
> >
> > Does this real happen? or just in theory
> >
> > Frank
> >


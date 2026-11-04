Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD095606B2C6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 22:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eWcvMhHC;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=vQa7yKil
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WdmVtAn3sD9wmirNj1oEejmplS6zeXFIh2S0j05RIW8=; b=eWcvMhHCBlJ25ysi+1aFlB/CBj
	lOxsngdMWwjrKt1LLnj5tnpDrt3MIAf2QVLQ0euTERIfdis0wllfDzGhK3VLyiH/mQZAp8vBkRsNF
	EL8itPxMrGPHApy5ilgXUMaXCXs/lF7uVBCNd83S5WtXPrFyxpR2T5rpzOo7QmCw0dCJw+WIsd+/s
	Hwtbd/iGWTVCxAH0olYjePWOT9wyTh3Y8diiuPzWdiBocPtzii/NbRL2CUT/jfs/vhxUsZfk4E7rV
	9rbFTFOqF+c7fYJkJP0RXBXUHq7BpRnaF9rczDblJkDAs2writSj3TowHtoodylxWU6zPKUe3tThc
	K42jj4JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOjYH-00000007A0l-1K8C;
	Wed, 04 Nov 2026 22:33:53 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOjYE-00000007A0Q-1uka
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 22:33:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKcQUeJVmALGLDuZtsWkDTVHHKmDaH2RmrFe9mgOrOmnCCMMCSAuehIE/x6p8X2CZFYTTWrCK3A4YopR2Pu6WvwvKvWEGkS6GEMQFeBnygWxu2YHXAkysOMeFMmBeLuKP2idN0qO8MA9Toqw3i7lZvTM8mqNBBi3dwHpgDCYmYLhLC8vwues5hU/Vga+anyyMqtNHVhgvdF3h9u3fqL1uA5ITmq6kX3YvPMiULNuY56PwIs0iWhc3/t7dYxUewirRGmbf9AAxayMCumC8F6YK3bkLyEnVDx3G1ozLZ3Irx8m+v59zD569RHDZRai5pJoMmvsSWQ7mD5xZR7F8Wflag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdmVtAn3sD9wmirNj1oEejmplS6zeXFIh2S0j05RIW8=;
 b=qBXQTL/9tZb1EWxZuaivKJvV245dqb51uBTl4GO4r/Lb+K3YfbDqZcdXcW8C0vSSAKzdn9hvKketozFE/M+qBVKwk5AtTHOUrkkEggrJ9rJR3mF/WnJlNRmSU1rI3eYRjmz4fmHllMU/JvXdBeHeYEdBrVNUq1HB+nStGfiAlo4tq3LddW/5bW0a5ONKAbt4jkMWswCeUQ3YtOeTTXcGKIlvP6hc/e6AdrVcH+63qEuCJAxgg61FzfNyiPpQg2LZ+bJxtUsG524zAWR2fn7UZK99FBHmtUfdxpsJ48aJD2JaAsrlMZpImtKOWcwhrHUtt4ICgYKsZUJgq67Dal4XsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdmVtAn3sD9wmirNj1oEejmplS6zeXFIh2S0j05RIW8=;
 b=vQa7yKilOrJtGFbOlWb8YmUzkS8lTaVMFNaqiDU8mkLWr13zja7prqWqtljzl57P0B6jnTPEdrhAsUJhrYqHr+kF7x50GN/RQoY9yPynKoMsmvyC37Lif+a1WRvq83UhFf3+LJ272EQ7q8oPb04iBqbUkuPFOo7a/gLjcCI1K/Mh/0QSCzkTBoeXz7UWLX9tPN6XKGZ5+dll5efbHDuu692CYCN71gf61X5nUn8AMC9lWQ+dhmesV6NulVpn25ce9jat1ZXAiPoCJEHb9ujlA7YQfNNs8UwtBeJ4uLVNoyfUP1xJJ4hkCpTeHMIIOSA36MEC2NVaBcd9ZsaoMIWYCw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PAWPR04MB9987.eurprd04.prod.outlook.com (2603:10a6:102:387::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 22:33:44 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 22:33:44 +0000
From: Frank.Li@oss.nxp.com
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	Raiden Horner <raidenhornerdev@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: imx: Fixed depricated implementations of 80 char limit & open parentheses line ending
Date: Wed,  4 Nov 2026 17:33:35 -0500
Message-ID: <179383147968.3946888.18019919618116352722.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <asRanEEXSR2hDM_e@arlo>
References: <asRanEEXSR2hDM_e@arlo>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR02CA0025.namprd02.prod.outlook.com
 (2603:10b6:510:33d::14) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PAWPR04MB9987:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d845a07-38f3-4a30-4f44-08df3ac3af20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|19092799006|11063799006|56012099006|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261022105027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: rd6QmJJrgN+uNslkAo85TWFP8oxD30NLMvNZp+doXxtFeIo9jfBsBHKkOFmIFXSagfHY7dEerePfxDX5D9xatLBUVmlv106xoVxA4SBzfaXziXeOJGJ12222MzOqpUiDd+RuQgoAG3wEGfCsSq3Z/i0PDyYCrDkSKjamCmhbKFdT5SmXbo9bK1TC483INPTXn/KhjhpRGHSOEUAnXh6qL49RzQsZ1BntShPMgl+aATEszQqd8CSpQSNdItZFz3G2t8wPLiYZtTWxkkIsoQZBRMdKyfozSN3fb8xKqSrEBWE6xZRQJqUJjNsIsozxkAPJY5mAmNJNFCXB4NyRQ3XziUOrdFVlHCtp5AiHxmUqCJJ6u5GBVbDmcB8kL3stmmhd/w949kM3SnoH3bn3AwVg7lNULVQqapZ1HlP3h/96SXkzTtLlsNyTiRSLbTe3vdzzZOgt+27Z1Vq0Cq+ACtCWn0kQrJ+HmkC2D0Hx3aZ6gMcR4xel/ljQOKhhLBMH4jDJsPnJO1ZPlBd2jdl8hDxCcAF79xVTgwrOGxcoMiT7lxyc+GxDL6Z5JVQ6suZ7/6Yj831pQXhC3oq3ffCLCb+5HbV/OeOb39OpSEWDVFIZkl4H8Cbca0T2rAbKDhWjDQ025ST8y1LMQ809+Vxxlgoo8wR4lzaZHz/WxcZMoXCjhoo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(19092799006)(11063799006)(56012099006)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261022105027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2orMGV4QXZoSmsvMUVuNTlvUmVzVVYwc3hVb01nMWZYNzNiRHUzdFF6WkVI?=
 =?utf-8?B?MkdNZ0ZSZHQ2ckdCdEhVT1F4cENjQktZNnR0QWFZVGIvZHZtWUVra3MxV0xR?=
 =?utf-8?B?YWlPZzRJZGlRTFBnSXRyVjlWYW1aUU9zeXJieE9vbDZDTS8vVm9iTWFKeGJN?=
 =?utf-8?B?MkJKQkMwL29jOHVWWmFSUzM0emJTQk1tMUcrR0szNFArVUN1WFlXYk12TmdH?=
 =?utf-8?B?cXRLMVJnOVhIMjdrT3dlWktSYmNUUXVycFpBRFFTTzJwaEd3bW5uUGFqaDRh?=
 =?utf-8?B?dktQU212L1V5NjB4THR1STZqYXlQWGlDZUhFT1BycnVibDYzeHZteFlxNXJG?=
 =?utf-8?B?RmZDMVNLVUxwRWlaR1I4UVR5SUM3YjBjVTlKMjBEaGM2ZUZxNVdWbTh4RGZh?=
 =?utf-8?B?LzZKai9FVldqUVJ3Nnk2QVNGYWlWS0s4bk1Ec2EzTk80RW5XZTNoY3hWYllw?=
 =?utf-8?B?YUhRSHV5UHdHN2pmankyRm40Nm5zc05xVzBqYm5sV0luUHBIYk0xRUNuY3Qv?=
 =?utf-8?B?ZEVMQjZzUm56MkpWMXJrZWxSZDRpWlhDVjJRQ21aSHp2WGtoZ1NmSmRvZEVi?=
 =?utf-8?B?L3Yxb1pndTQ0aFlXYk5wOC9PL0ZRMVg1eU56Z2UzeWgyVHdjVnZIcnc1Q1Fm?=
 =?utf-8?B?bHdSQ1h6V3RhcVNZbkZtS3NQOUNxSWs5UUtKRFo4UU15bXZGRXAxUTBYQVk4?=
 =?utf-8?B?Wm5vZVpnaVRYMHJHV2wya1hObk50Z05WVTJacU1YeFRPaDg2Nit0eE1LRnZG?=
 =?utf-8?B?MGR5UVBVNkdMMlovYXloM2EwZjZleEwzeWJ4S09sNzdEd3hGeTZvUzFmUnpw?=
 =?utf-8?B?MVg1VlYwTzdHWEM2Wm9TZVBrRE1WemdZNHZHS25pVkVjM2Z2amZWREpMZVJ6?=
 =?utf-8?B?N3gyLy9KeUhGVmpGTlduZHBocjAwVW13eUo2S2FqUnBiMzRvVTRPYXZ3ZU01?=
 =?utf-8?B?L2V4dGNFS0pvSVVBUHdkRVRGRUpZUUxjVWFhbDFxdms3MGlqM0h1RzdpUU13?=
 =?utf-8?B?ODBteUtaQzRUdjlXUkpsSXNqTjUrcGV3aDdxb3I5cHV4NGFDUlY3S1BaKzNa?=
 =?utf-8?B?ZVJkeUg0SmI5a3BzRlEwK3VRN09xY3pMdlpQYXhqVkI1NzJsVVcxZEpVVUNJ?=
 =?utf-8?B?c3RVMEUzUjJXZmFWRnlJWVRlL1pJRXZXQjR4ZDZUeTAyaXNibmo1SWRqSjNS?=
 =?utf-8?B?M2VlOHV3bUR5NjcrUkd4c054WTFzamdkMGcwZnpYd0VUVjBndHV4bGpCYXVN?=
 =?utf-8?B?RHFhZEIvVHNVMDlnQ1dvY3NOQmlOTnZJK0VsN2lhaWxCMXJZam03SS9iQlJI?=
 =?utf-8?B?MEtYeXRGV3diWlVQNGFlL1BkRWp5UTdBZStPWEI1bmtoTTZzUTVxM1o0b3Fw?=
 =?utf-8?B?aWYySk55bXlDZXQ5d0taeUJxWVd1V0ZxdzBMZ0RrMmxtM09DNld1Wk56S0Y2?=
 =?utf-8?B?UVF0c2FEdVpQS01FYWJOUmRZeEZRUTl4N2tmNGNleHhKenIwWThiMXl3WHNZ?=
 =?utf-8?B?TWFocSswQkNGVDBHWnE3VmJyUlMrV1p5TUpNWE9YdnI4WUkyUHA0UlVKSUVY?=
 =?utf-8?B?NHJxU0h1ckJheElyRU4yOFY1MmlucnRWR25qMjhYMnlGbmVBd1h4TzNTbEhG?=
 =?utf-8?B?am9KRkxOUWpLam4xK1JUZXZRTHVPQ3ZtQ2pMdmtMcEZvVWpJVUIxMnk3NWRy?=
 =?utf-8?B?YUxmV1lGTEhwNVBreTh2MXpPN0xUUGdVRFJsSGkxd0Mra29aaDh0M2xyT25v?=
 =?utf-8?B?cVhBbUpYcE1qY2hrTDlaQnloalFCWFpIY00xOExJRkY1UlJkMnpIV1g3emk0?=
 =?utf-8?B?cTBVT09nYWpNT3V3emN5SHBlU2h0RGVkQkFOWEQyLzFEbGxnd2VWc1p6aTVW?=
 =?utf-8?B?aGRaZFR1MUdrWVFwVGlqNWdrczlmb2wweWJpOVZRMlRsRHkwTlJUNEtualVu?=
 =?utf-8?B?eEx2OTFuSWRxT005bzI5MDZEdmhaWmQ1Tk96QUZCQXQvK2RxVFZjUGVLODd4?=
 =?utf-8?B?VFRjZmplbGt5TVNXc3lIcW1OSEIvN2srRVN3WGorV3l5dDlPdiszaWpvaXZa?=
 =?utf-8?B?WVduU0ZMRE5FbzBOeCtKK2JhVWFINE1uOUQ2clVLbEpFK0hnZG42Q1UrRllt?=
 =?utf-8?B?Y01Yb3QyaFRmSm9kOVhsaDMrRmlpMUtRVXlSdWN3SXhYRGE4LzFGb0dibFA3?=
 =?utf-8?B?aFA3ZWNRbHFqcngxTTR5YmZhYzN2VGRFSGRYNDVvZHRxem1HTkUvQ252eko3?=
 =?utf-8?B?bnlrMjc3V3VRUTVDNFA5L0pQV3ZPcitIYlpSbndDRS82c3czdFhDS09Bamkx?=
 =?utf-8?B?UHorS1pHcGxzRVU5b0UrbjZGNEZTdnQxU3c5N2YyOFF2RGxPaVZEci9ZK3J0?=
 =?utf-8?Q?Fj+RuhzpEccbmiFerp+ThRv+4gok4dDRHyVFE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d845a07-38f3-4a30-4f44-08df3ac3af20
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 22:33:44.2029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g7bUPk2cPIJGKG6wYM15Xt7LtCPB68v5QaYM6scffCI44bhQlFsEKOitq0DypKTIk4/sra3l1zz1HBhisOwyVguU0Do8lWczcRQa67Q5Wm4IeFI+gYF8tasAKdlnqTjA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9987
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_143350_497587_82B1FD27 
X-CRM114-Status: GOOD (  10.74  )
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Frank Li <Frank.Li@nxp.com>


On Mon, 05 Oct 2026 16:19:08 -1000, Raiden Horner wrote:
> Fixed open parentheses line ending issues & readability.
>
> I presume this syntax was there to meet the old 80 char limit, and
> double checked the changelogs to make sure this was not already
> submitted.
>
> If not I apologize, I am still getting used to using the indexing
> system.

Update commit message as


    staging: media: imx: clean up line wrapping

    Remove obsolete line breaks and adjust parenthesis placement to follow
    current kernel coding style and improve readability.

    No functional change.


>
> [...]

Applied, thanks!

[1/1] staging: media: imx: Fixed depricated implementations of 80 char limit & open parentheses line ending
      commit: 2fb3c87215703f8513c285f15d3158ae2e93c987

Best regards,
--
Frank Li <Frank.Li@nxp.com>


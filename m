Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A337EC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 07:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2oJ4yNhSpBeZuELzbBJ0Td1y8pC8lwDln4OtsLAUXW4=; b=TQ+yzgAC6V75MH2t85OfrCpRRt
	EwAj5DqTd/dwxGVNT0yV3vl3iL/QgB4qZuzaT+3tXvk/epNiOrBRAUJTDa25gtl4rKs+jHfvBQJOH
	JjFwwfILvUYpQ2cBt7G56Ejiy2vS8Xi2nDpL4EytELdkA3dE0srnGTzG3euV+5IEA8B6nucLWLHkg
	bEl0DdDZCki7xjxe97bGdiHcZyDcUbTs7h69q0lcAE3nGdjYBGzPFYNhZvdCK8OkMv9nMe12BTfjF
	/YlqZyY7xwPwgNDp7DX8lDhOkX7oBpBtNvmwlMMDJhlrmbsSqVny/fF/LeIc19J0hQfvQYXThBWHi
	rVX8pchA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8v0N-00000004WNJ-1vew;
	Tue, 22 Sep 2026 07:33:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8v0G-00000004WKw-1nvG
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 07:33:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2oJ4yNhSpBeZuELzbBJ0Td1y8pC8lwDln4OtsLAUXW4=; b=JhRStutSiTb02rgqNIFUrBIybh
	WjpwO+XSf/h8l/InTctqvChyOEdXjSDAa7fJV6tTQhwhAOuamSKwSE/EOrQ7aca+q+gQUdsDHFUiQ
	dDsyLJh3Lv2LUz+zQekbNk4FRSdyzS+tzXBPUAad5geFtlAAstB/NlkBXURpLDsYSQN8hsFU/smnh
	xBs1xbIfGlL650PsgWJTty+7YZenE7rzk3YC+Fvk1hcjHGCk6PdRzdUeopnqDaB1l0LQWr4zAt+UJ
	UE3Ya85L5NOlXw6zWhQNZWL97vRtpdN0Oy5Lp5T/mH4jYkFye/DT8iSR7dikr1UGj7aCaWLq/b63a
	t2D3IAaA==;
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8v0D-0000000DDKn-24IK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 07:33:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NPcE2JGmuN45OVBGuCEDkxub7wihu4kQzDXFm+M5q/J7rh8CH03Yisap7MHojLA0A1soXxj+nJn2MYre8XfCYDdFLmgOMKW0DcszuDtEun4sADAl3oY9B13lLArxw8uhzNJpV16xg0Qy4k3LguguhC0TkdcdtP4LtfmJcPBl/po+V03vQZi/U+cgSedLxSVzVwcjYy3TLio8YYAAzYjk51R4sZC0/GEu85G+HODk+9Hteqkr102mvngIrPtK/FBhSaDCQicW60uEyGpHy8wn2OUsaCmouORXM1g2I8jM1opU38HwvMdnxx1lz9+c0Z5E15aUcp+bEEN1RZn4v7tVYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2oJ4yNhSpBeZuELzbBJ0Td1y8pC8lwDln4OtsLAUXW4=;
 b=IPYAmhn+2GaoLDfILtCVNzD/aBEddzgcsIxbchL0YCO1dT0OPP5JF7b9lX/uaBtgPMo6ObQzbN6F0ezcyBJpnjIpwxfKFz+j8ATI6ghRpxEqUa5Lb95NkrFtScZhp/mRYQB/XnB2wDV9mdJH0kFyPqbMw93X+RjSbJeFsTDdGfidK98Q6lpohI6x4ewLkFk2KamfpJ0lupBwhA513iy+ghRDIVOr5tZEQfIAkBYzAWwqCh4HFM6aaz76V3shQIVqmsd54Aem/YgHM6F+0MVTVaCjDRcd2Eamhi2EnrWhuTFLuF/A4AQ9j+Q72NCco2XUYLCuHdBcKXB0ZRSoyfH/nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2oJ4yNhSpBeZuELzbBJ0Td1y8pC8lwDln4OtsLAUXW4=;
 b=fgmCgpJrcW8gHy4dEhFsGHkG/D9Z8/wvygcXo76luE32z4F0twZrPBtvCFv68dvtiUKHitkt/HDoVOCUz98Qc0A6m/qCS4KswkQPfgqfg6+Dudny+ClQrMCkhGKnunJk7bf866nXyer6zOeYdNA/rpZDThCExyMujTmAksOT0Kwzf4qsy4+zLmtFLSYLYREvQsmzAfA2l9JvMOVvZ4kUxqrOtu6J/JusCnnSpbvyejR0KW0bIymmuXMnMrKHo6iknIrkZs9HKygwBwqZ1hQzzvb3Xc+H6hre63I4hzguaNuVbTDbtLt3Q82lF9BljwpbqMMZ90l3Hz/Wg3kac3H2ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10) by MMZPR04MB213195.eurprd04.prod.outlook.com
 (2603:10a6:190:4f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 07:33:15 +0000
Received: from GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49]) by GV2PR04MB12558.eurprd04.prod.outlook.com
 ([fe80::cd9f:102:ea58:4c49%6]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 07:33:15 +0000
From: Larisa Grigore <larisa.grigore@oss.nxp.com>
To: Larisa Grigore <larisa.grigore@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Ajay Neeli <ajay.neeli@amd.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Pedro Sousa <pedrom.sousa@synopsys.com>,
	Hannes Reinicke <hare@suse.de>,
	Joao Pinto <Joao.Pinto@synopsys.com>
Cc: linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	clizzi@redhat.com,
	aruizrui@redhat.com,
	eballetb@redhat.com,
	echanude@redhat.com
Subject: [PATCH v5 01/12] scsi: ufs: dwc: Return a negative error if the link is down
Date: Tue, 22 Sep 2026 09:29:58 +0200
Message-ID: <20260922073009.1449688-2-larisa.grigore@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922073009.1449688-1-larisa.grigore@oss.nxp.com>
References: <20260922073009.1449688-1-larisa.grigore@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR10CA0017.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::27) To GV2PR04MB12558.eurprd04.prod.outlook.com
 (2603:10a6:150:368::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12558:EE_|MMZPR04MB213195:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e722540-f7d6-42d2-ba47-08df187bc3a8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|23010399003|366016|921020|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Z1D6fKMQdyOaHsHxyQsfL4VdO8sp2VA3dh8Y+j+qsDyO9cuZP8v2G/kD5qOaaCMlS3/5W1Our1gsUXR6zopIMO4cnCosMfRj65IXnEDb1xGp/CtQt3sm6hAIDTSInuP9YyyFxAY7XQJuGP3iIcAgS4eHo3FjNNSbL4Zj6eFK/P3ECLxnyhN8fewOGxmcnMUJt9R5r6SVqcguygmA9Fjz5984HtOAjUOhSAZg8ssHwt0cF+bFasP9Pei7eu0ocdRB/is4aGFMWGEUbILMEObcb/WbuIEr7E8zcdGti5jD4S5Pc14zN4Be7eGSXFKiesAD3FR0k+3lscH5O2/sOjVUFXZmXPZV0Els9PrQm3ibzlamHkl7tNlaraiPU89JvMU7cQ7XmPQ7FTzQ6Uj7a03M735jASnv4PNdlclnjtfH83sKLUwAtxQOXdY0lbv9MXRes1HLNCi1VwEW1VLFqv9fUXOXE/Lf4B5sr8zJEXtVvNuWM1OFiWDiNLZHPAEK22q9u7sZo0a5UWGiswpSK8ppQmU+LZU/U3T3Yh2qh5S0QPxRKj1HQUswbH49wu/+m/7YtIXaU1lhBAqJbQo29kb7jdL1as6841vw8E65MlpBq5GezfCv96BluwbRJXjROhuCXBlc/qLY8gbxAETXG++753SV8DT1zKy89mUeyPTIrwllFbdL5Mfn3jpnhzXTZnIuTWy8sDt6HbvL+VFtDaMCPg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12558.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(23010399003)(366016)(921020)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTVRdWN3U2FMVTI2azBJSGNvS21qSjE0WjJjUDFENWR1K0p5cVNHVWxPV0U2?=
 =?utf-8?B?bDVzc2NpdG85aVFFeE5aSEVpT1R1blhaczlOcVlzaTZHL1RlZGJzai9vSnhx?=
 =?utf-8?B?V2xFdjczWlh4QVlCMklGMFFtcjAyU1RpWnJTK2FpeE9QcUtGRm14TnlEYnh5?=
 =?utf-8?B?bXBoVjdlL1ZXdkl4KzhjMnlEVVpSbHBSSkdINW5MdHQySWh6MEhIN0JWaUFj?=
 =?utf-8?B?bHdKclBBNm1hT01jMFJNcGNEb1hsWUhFNkNJaUJpQVJUb01WeEh0dHA2dG9T?=
 =?utf-8?B?aFk2OWNrR0tlQzRPOG5RMjZkTEVXeTNmUk1RbWhpUXNGWnVEbTByUXpqV2VS?=
 =?utf-8?B?UzBWNDQrRnpmMEI4dDRpalBURjdmWnljRHBGd080WHRyalpNdnptK29EQ3VJ?=
 =?utf-8?B?c0xCLzhYc3cyalF2bWxqeFZjTlllSUF2MC9OZUQvTGtVOVRoSXljQ0pDWklp?=
 =?utf-8?B?R1p5Y1V1NnlmQlJIZ1lZMUdGdTYrbWM2WWUzbWRnenFEM1hkVXZBU0JLdGtP?=
 =?utf-8?B?dmh3aW9tN05ZUkhJb3R4cnZjcW9nM0YySVVFUHE4RzBGUlJBS3pLU3RUZ3RV?=
 =?utf-8?B?V2ZqTEZ5aVMzd2UxS2JHSC9xVVBqbExpcTgwK2NzVmkwS2lyUElzNXdiYWtn?=
 =?utf-8?B?YUU0UnlnanZSOXFGdEgwVVhuaTBRd1B3d2tJU3lhZ3dleGYyZXQxbk1YNCs0?=
 =?utf-8?B?QUxOQm9NS3VPaUxjNng2TURsejNqYzBQM2paSlk4bUpEVWNoejZRb3VtMHRP?=
 =?utf-8?B?V1RGYVJQK09vK0xmU1UzbVZmZHlFNjNGNWcwRDlKODRhWDdjMkt4K3RnYXor?=
 =?utf-8?B?Vld1bFBqY3AvUExIU1VSM0hJQmdWWmVabkVLNmtBenRWaUR5S3ZKQmxrTWM3?=
 =?utf-8?B?akhrT2JtamNKMVZNak00aWJMQjhSRUlHRzN6RzRRUVJOVE42T1kwV1MyMk1D?=
 =?utf-8?B?NUhieTNvanp5T2xPeTdKbnhPdEg0ZkE2V1B6V0FrS2cxMmJZK0o1UFN0Q3B0?=
 =?utf-8?B?RTQrYkFZeldkOHJNWG5VR0RXU2o1Y2dEc2liaW5zcUJNR2NTWDdFZ2Y2SzBu?=
 =?utf-8?B?aWZBajl1MnA4dk9KVmdXS0hYcWRBL2FoRG9jaWlxSE0yYmt0VDVRUnhCWC8w?=
 =?utf-8?B?dkduS09zWjJaYjI0NVd4TmlRa1RzYituNVIvMjVUV1p1amltVXNDQk5vaXgz?=
 =?utf-8?B?Ym12a1dlMTVIb3NNVlZkL3FpbklrYkZDM0NEbnpCMHg3a1J4T2RtNFR5OWUr?=
 =?utf-8?B?WmxXMXdHc05oVHdNNjRsSzJCaTVxejVEbWF5dnV1TThqTElPa1BWb0JRcy9y?=
 =?utf-8?B?YWtKamd3STlQTTloUCswQUhuWjZTTzQySzZNc0NKWTZYRHBkM1ZhajgvVm1P?=
 =?utf-8?B?VWhGcmUwc3BXaUR3VEpLbm9xZXhuNVFFV0MwVWFta3F5MEx3clYyeC9POExH?=
 =?utf-8?B?L0M4MGt6c2Y4WjNVQnpKdnFSQjJZdkpRUlFkWmNnWnRicVIzVlRvNG1LZk1J?=
 =?utf-8?B?cE1EamNaNFUxdnBUWUlZaGpqMFRkaU14RmkwMGNoeFljMGJUYUUzY2JPZ2Ro?=
 =?utf-8?B?THIvVlJaWUN4ZTYyWDBuNVQ5MzRHT0tsbUkrR3BFRmloTzdEcGs3MDVVYkcw?=
 =?utf-8?B?cG03Qlh0cWN0OTZ4V01sa1FSZnRNL0d0alVlcTB2WTRBRnFTb2hQNlVUbnlC?=
 =?utf-8?B?cjBsRmFkdHZzeDYrZDFxL216ZnFLUU93K3Z4REJCSUkyVWNYdmJ0c2RNOHps?=
 =?utf-8?B?WnZVLzM3VnJZdStlU1JFa08ybXh4MmpUcDltbHAvYXF6Tkc1N244RWtxMjNv?=
 =?utf-8?B?UlMrOTdXTTV0VFo2MUJ2dTlERWozSFd2dkJ6UnNxTTlVUGc1MEdjMUo2OGhT?=
 =?utf-8?B?OU9jVFlNT0VTT0YzaGs1MmxPRFVpZk1OWHZ2Q0o3K25vOGZLbDZjMmZrUml3?=
 =?utf-8?B?ZjlKczh5eWxUYzljTW5GZFVocXpNQisvaXRGQTdTcjVUSG82V3RIeE03UnhG?=
 =?utf-8?B?NWRRZEJ0bndkbE5hTjNtd0p1RUZIbWQrM1RRZTBCZkhFUjc4Z1dySHB4T1Rv?=
 =?utf-8?B?eGo2dFhEUGJRb1Jhd1VmS3AySkx5N0JwazUrYWhua3h2VnNnYWhxc3lhRTkr?=
 =?utf-8?B?eGdCSUUydnVpRUtTcm9xTjZrV2gzbEtRQVVVWVAxRCtVTGc4NWloVXhlSHJY?=
 =?utf-8?B?NTJISjJIQVo5SCtUSTFab2FONHhzMnlzdUNDdkxEMFdkVzFzZ0dyVlgxeEQ3?=
 =?utf-8?B?SDdOU0lKdlVyekdKdjFmTmdlOVNjNGc1bWFKOGxJRXB6WHVoUVJ1WmZFT1A3?=
 =?utf-8?B?SFR0SDd5VXVGM0ozbDkvU2Q4dUswZDBHbWNFdHRvSU5UUi9iSnpPUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e722540-f7d6-42d2-ba47-08df187bc3a8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12558.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 07:33:15.3548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k6Azgu7fb/9mhCXZXzX0txLqVLHNBmS3Fu1/DrG/w9D5pQRuBUI+74pXjHJwM4T3I6vknc1gsP+d34eIx1dJQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB213195
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_083321_763642_98B48E6C 
X-CRM114-Status: GOOD (  14.94  )
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

ufshcd_dwc_link_is_up() returns 1 when the UniPro link is not up. The
value may propagate through callers that expect failures to be reported as
negative errno values.

Return -ENOLINK when the link is down and propagate errors returned by
ufshcd_dme_get().

Fixes: 4b9ffb5a353b ("ufs: add support for DesignWare Controller")
Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/ufs/host/ufshcd-dwc.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/host/ufshcd-dwc.c b/drivers/ufs/host/ufshcd-dwc.c
index 21b1cf912dcc..ccf785fce6cc 100644
--- a/drivers/ufs/host/ufshcd-dwc.c
+++ b/drivers/ufs/host/ufshcd-dwc.c
@@ -48,20 +48,23 @@ static void ufshcd_dwc_program_clk_div(struct ufs_hba *hba, u32 divider_val)
  * ufshcd_dwc_link_is_up() - check if link is up.
  * @hba: private structure pointer
  *
- * Return: 0 on success, non-zero value on failure.
+ * Return: 0 on success, a negative errno value on failure.
  */
 static int ufshcd_dwc_link_is_up(struct ufs_hba *hba)
 {
 	int dme_result = 0;
+	int ret;
 
-	ufshcd_dme_get(hba, UIC_ARG_MIB(VS_POWERSTATE), &dme_result);
+	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(VS_POWERSTATE), &dme_result);
+	if (ret)
+		return ret;
 
 	if (dme_result == UFSHCD_LINK_IS_UP) {
 		ufshcd_set_link_active(hba);
 		return 0;
 	}
 
-	return 1;
+	return -ENOLINK;
 }
 
 /**
-- 
2.43.0



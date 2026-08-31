Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9F7C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 15:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOyTxG4m7vc3Q8Se6/Wh3tGakVMSL/FRahEccUIWMI4=; b=Xzh5eOBFNGUtsh/Gr7jPvCjM7U
	gWG7EfMr0y9jxAtX0HkTQFaevLR70Ofk395C3Pk7rQYwaTJ8hTR3gNy20HxsR3WOORPNwzPStm5Bu
	B71DZbDpksmyTuoB6B6Okch9MPNS0m4SKAtAe46WzjG68yDb6ql1AwGjYQwodCRoBBcur1euTCojg
	PQKWM9oUX299NIEaU4UQIfzem1f4m5Kmum8ersBNpbVvTik7kv9Ksw8eeRSmKp6vryLlmn8/1oTS+
	pZDZezbwweJYDJ09NYW4+tljNAmOTVtMNWU6lDQUX6drMCHhT9YLR328fAtcIORN2Utu3HWmF1k/q
	UYYkZ57A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13WW-00000009msr-1EPM;
	Mon, 31 Aug 2026 15:02:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13WU-00000009mrh-3XOJ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 31 Aug 2026 15:02:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-ID:Content-Description;
	bh=LOyTxG4m7vc3Q8Se6/Wh3tGakVMSL/FRahEccUIWMI4=; b=VNvDyYhOHfp/7eGB4LK2+7Ng8+
	0TDfKlZFNnnwGzEYRWWS8CqJrUOZJ4ryJad9qSMcRiHPegMhUCTkev2Cn+ZPfLLkcbvpl8kReVKUh
	xiZcsKd+5FziAOerYvlmNX7S9QNmT6B2j8wUDmIq2gTp9hQDseI4z8IVVrYGuW6d/ZvE+7q3xCI2E
	smby4GDtrXwQrTwRark8e//sFGmRwRjOH9RfLFZH6JDAHiJVLnNeyLQDiSWqxhNZDNaZikWp7PkHp
	9bun8FaQovDMQVUnNxnE1Y8D9Mxjtjg2yefwYFz0VGecXD5unrZo83864r96Trq5FfPcLDY4BKR8Z
	MxmBuC7Q==;
Received: from mail-westeuropeazon11013018.outbound.protection.outlook.com ([52.101.72.18] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x13WQ-00000009y5m-2g5P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 15:02:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+qcZN4JTgWreKEmcVSmp5Rt4o3gEShcX+LKAU4gsoDNNw1T3Hd+ie/kEdt3rKbM5UVtCpZf+xmmfkb5igrSf3ar6ZwlmNdcdsSMyHeJnX1Zkk08CmdKceYP8JTCrL1tlxMbzOQ2c/YYl06wC/dKzkRihgjZzhkrzVOAeo/jKrVm552yOvzHsBc0qBocgIoHOoFTlo8zPZFGVHvIPVtzKNq8Z38mF8W+RBskKrJok2dMUTXOzX7QaqtnGPpyhY7lydweVD56v++Ppr80bO0fLQRbj85w/96zIoQO1cBlICcTD1up/TrmglwJ0+VaDitNs0w1JeOCr5jFjmlzQh/5cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LOyTxG4m7vc3Q8Se6/Wh3tGakVMSL/FRahEccUIWMI4=;
 b=URb9iCVXjOl91aogysbl+EbB/hMqfaMlStVxIoz3gIaTz8V2hVzV52NjRl1AJkhIkv9joSjqjnGSuHMv091fygmA1ewiemKD9OgAFGZSKqDwmXfsMYIqc63ogSpJLnaFlKOSl7UjVyUznLao9GPM5nPnS1x4WGmDmE0tkETuPj4I7bCI9mZIfpFVzi4IZx9J7JDQw2sCDt5ihFq6yf5LKLlZNIQmGDJLO75G5M2LgwCv+cuNxsP3GF4MxCHw0KgD9HfpYL3FyMUx11vtF2PZDWMhRAbbZuIBzEu5jeSHAnTQNFRFYmUdm5J4zuy1YCEAotGJHngQ7mlJi8UsDJumAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOyTxG4m7vc3Q8Se6/Wh3tGakVMSL/FRahEccUIWMI4=;
 b=ppUgZPY6j1KIDmd3+st2z8zUr8vQtkISDEIqXXR0TZGkcqPMTGgPcshuoOnqxUQbVdIEYaWCpnA1uPBId+2eIeQCuxOr1YKfL6Adfm7ykgTPEbf/1FCQhYmWTjh8UDRJLOBsratrPJlSZjK9QIi3xt1Ijs9IqZuReRcAljfG88xbN1uiQDdD633UKBUxEqYjy0dmGzlqjRJtpCaCFo98I7Ayh5rvPe76jlba7l8qi3qg/GDImoyaROSPXZRf+GomyCUVDVUFx7LxzzCsLyvdvE6oQ3h6fpsRncWOIWQLKyK9ygy3sB2UhF4xYqHuCultlvE+Ivj3VTylT+bGIiODGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMBPR04MB754926.eurprd04.prod.outlook.com (2603:10a6:20b:787::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 15:02:02 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 15:02:02 +0000
Date: Mon, 31 Aug 2026 10:01:52 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Linmao Li <lilinmao@kylinos.cn>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Leonard Crestez <cdleonard@gmail.com>,
	Radu Solea <radu.solea@nxp.com>,
	Franck LENORMAND <franck.lenormand@nxp.com>,
	linux-crypto@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: mxs-dcp: handle zero-length skcipher requests
Message-ID: <apWXYPYyPktawUru@SMW015318>
References: <20260828093209.3179074-1-lilinmao@kylinos.cn>
 <apHgn8-IcTshYnfv@SMW015318>
 <6416cbee-35c7-4fc8-9a80-a25403eb1e6f@kylinos.cn>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6416cbee-35c7-4fc8-9a80-a25403eb1e6f@kylinos.cn>
X-ClientProxiedBy: PH0P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMBPR04MB754926:EE_
X-MS-Office365-Filtering-Correlation-Id: d6aec9a4-e569-40c0-8fc2-08df0770d023
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|7416014|376014|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: 1itxAnAY7539Rct7UgVArCKshgdAbygnLIPe7/NFKcyx5CwO8l63+mvOjcgQHA/xgEBf+uX5awQ8j1h8BhuE3LLQ+HlYQX8S1HdX5pv1L8lD5cTVtkNKcOcVGjyHl6gZxY/l5z+T6U3x+Br9P38ESg5F1kLO60JBfKZq3gbjj3T8U7TmDKrM1NzTbTh4N9usjRH8na19reqeyVr5njZinq+XY3dj0uH4CtP0uM+eo+7uqmAuRBEW5Xv9Vdc/m0zsis80sEOu/K/S4uRgsv6LavbENhtx+uffBKwRygQlack4CwXOcIN62LuK4VLuePxxv6+2aXszHW0uVVL92FrNinaZUkNBUMmH/canBm7vEnL3u7gBvkyry35TMbXPcHrIS9+yeIVzzfJkwz3O92Jbu5iF5y0CtkTilzocBjWwLaolMeDL6GcKe3rIODo+AxGy93zAPIrkGO0JORxGMDZXmA8eKWpeJaHkti/C+D8xlRDb9kpfOMJEyV9PKVu1uLGSRCx8Axluj+NGXulDIwsjqNsB/IWXmLF4k2FeULhZV86yYrcd5FwoTZuh6UMmNPUtdqQJrUtYUPdYNGGl42vpM5ZP/JyiYhlBciTL4OfK9YdWwhPgxOFE/ZFHKDv1XpappSItcgEAvsLq6C0Z62dhdLoK17BEl3TLbjflEvXbDYM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(7416014)(376014)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWwxWkFQaHI5UVdjRWxEYUlidU9pYXdqU3Q5b0Nhck0zNlZ0SkpqQmpXaHh0?=
 =?utf-8?B?cG1GV2w4ZHBsZHN2bWppY091cWRUKzNWeUtyN1hoZG9TMmpkNk5KRXpJWnd6?=
 =?utf-8?B?RitXLzl4eWZydHlFWFc3N3R5TkdMaENHYzErcW5GMXpFUnd1cEo4cjd3eExG?=
 =?utf-8?B?MnY2WXNvQ093VEtBUldFRnpVSnlnMHZwZDAxdy9zWUNuK0hzZ2FtR0xacm9V?=
 =?utf-8?B?eTM3UjhTMHlIT3hoU0JwNXBmYlUzYm51YjZta0tkdHQ3dXV3cTlhcW1qNldv?=
 =?utf-8?B?czVlYjV3SWRUaEc2T2NVdGhrMTdEOWI5dEh6OUUvWXhBNHZoeDVuemRjMzhW?=
 =?utf-8?B?OW9kSm05aHBPR3lTMi92UlNpK1YvVHVNNlppWU42cTZFOHNrRDkyckNibFN4?=
 =?utf-8?B?UWlTb0pzM0R0VTc0S2EzWk56MUNDTUVWK2N3V21VU2k0S2F3ZFZraG1TWFUy?=
 =?utf-8?B?UWtyVHVmYTAwMXBlL1A2cGY1QU9TZEpUTVE0T29mZWswYklIRmdmak9yMlZY?=
 =?utf-8?B?Q3NDVDZTY3lMMnByRlpXWFB6djV3NGIrb1lraU1ESUNYL0ZDOURTcnk1dW10?=
 =?utf-8?B?YURVUy9GZDdmUzNDNjE2QUlTQkVBM201RHRxMitUU0RldTdsUCt2ZTRBWmRv?=
 =?utf-8?B?YUN3VmFaQVcrTUdTeTMyaTRzaVB4Wm9tVHRPSkZ2WnQ1bVFJcGNNTTZFWTVt?=
 =?utf-8?B?WEhMWlNFalVnZEZSeWRDM1ZWNVlxc1ZuOW00SEdSVjRpODFiTXJzUlgvVUhl?=
 =?utf-8?B?NFdaZk14VnFjU0J6YVgzaFFqMFlEdHJyRytkNGdOR09xWlkxY3JBTndYWE5i?=
 =?utf-8?B?NDZQeWpZK2Z0VmQ3V0tiYmZmZXE3ODh2WDlYU1pZbC9aSHRkUWcvYzIxdldu?=
 =?utf-8?B?V2JhWkxFb0kzRG51UktMWGNQNWtML3hXZkcva0hTRE9RMFhHWjZZYlVuR3V1?=
 =?utf-8?B?NHNNa1RYd09xKzg3djI5dUlrUzdtNXhTL21pYk5LeVdPK1lyZzlLVnRkL3JI?=
 =?utf-8?B?SnF3WTZhSGd4cUMyamEyVGI0ZXMrdVkxbVhCb3FYZTVGODVtcWNrVkllWTg2?=
 =?utf-8?B?VjR0TVpvaEVuME15Mk5Bc3ErdE1XQW1vdkhtcjdaN1daMTJmRDVRMlUzYXVQ?=
 =?utf-8?B?dEUyNHMrMTJsK204RUxwM09FUlluVGlJRTdKSmxmaW4xR1A2eXBVS2NUcG5l?=
 =?utf-8?B?T2p0RXQyUzh4bW5BNmYxVHFacnR5NG1ZRHhabGVPN3p3NEdSWmdhcVhyNktN?=
 =?utf-8?B?STBUZ1hmZ3NKSExxNHRWWXpGL2NrTWRiWm83Zzgwc1dXZXRRUldqVVIveXRY?=
 =?utf-8?B?TmJuRXd0alBKeTZjNkVRK2FhZzBEaWVWYzdONEdWcmJKbGxjTmd5MG0wQ2Y2?=
 =?utf-8?B?bDRYeU50cUp5NVpuTE1YOUpCNm5lRCtzc0NXKzlSMFEzaHIxRkkxK3RJTGgz?=
 =?utf-8?B?NHN4c1VPM0VlMld0RzBTOTRwOEk1cVdDWnMrY3VpNnFuQWUzNnZxVVNvUW1n?=
 =?utf-8?B?cjhhSkRDY3A0Ums3VFJaNVhNN0l1YzdFZnhhUTZsNERabkd2KytEbnY0WmdX?=
 =?utf-8?B?N1psdkRMTitnbll1MlFQVDEwY2tQWmdlRzczZU1mby9QSlVzNFFoTmNwelhZ?=
 =?utf-8?B?bDVGY2ZCYXJvSHRZRVpaWWJlMUpnTitwNWt3MWtRM2pDZHVIaHpOSXBNYXdI?=
 =?utf-8?B?cVRVcHZvcEpld01XbXpWUWI4SUdobXBGOE1WK0ZNRUJVeW9jcUVhQURQYzVa?=
 =?utf-8?B?WlhHU0lBNml1OEg5Ym1PanVVcndkSm9qQUVFSklyY1RzbVpsZjRlN1FFaHIv?=
 =?utf-8?B?c1V6RGQyaGtLZXZ2RjRyTDNaQzRyaXhRWE5rbmFYa3c1NkdNbGpDSWp0R2VR?=
 =?utf-8?B?RWt2eVBkOVhUNjBGajdSTG41NmhBREdMRUNlUDdRU0ZEdzNDTjJDUC9HZ0M5?=
 =?utf-8?B?T2RLTkVWcVEwOGY5MG95dWE0Mm1pSEJpL2laanRZR0JzQzdobnI5Q2lKWFlk?=
 =?utf-8?B?UmMrR3FmcXNTRDVScFZOb1IwRmYrWW51MGxCTGZZbGM2a0xVTHYrWE85dmVt?=
 =?utf-8?B?cnBlSFcyYjBKTVB6Z1VEOHRoTUl5SlhtUzQyUDFBQ1kzMHk5amNBTDUrMUU4?=
 =?utf-8?B?TFhzeEthMWc0YlB3b3lWVjR2TjBLQnZLTW83VTNsRXFWdlNzenZDdmZTdW1N?=
 =?utf-8?B?Y0J3bCtEK1dCTUh3NGVkOC9oWXpXWjBZVUdwd2xmNThMQjdBVUJMNGhqbWZK?=
 =?utf-8?B?WjFmREtjZ2UvalZXdktYTk1tNndndFpDanF6OUFsdHE2QjhZSC9rZkFydDFE?=
 =?utf-8?B?MkNCb252MW5nZmsxbm53Z1FyMTNrTGJ2L1RLVEJqN1Z1VzZPZjJ2NmUrT2pX?=
 =?utf-8?Q?Cqy71HthsnIyA2fXjFg3em/rC6hvWa9MW5Y0S?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6aec9a4-e569-40c0-8fc2-08df0770d023
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 15:02:02.3271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 40AnQfEPbAtlDXt59I0q3wlPNHJWSjrNoTIVdpV7FA1Y7z5wC1J4vfdJQjjt/Yb2qJ4611w78m4jAnMoTriUAUdbJlkaN5R5PJUJh7iGpvifnVSmIDjbxYJrlD+NKsyi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB754926
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_160206_891434_FEDD62D4 
X-CRM114-Status: GOOD (  28.63  )
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

On Mon, Aug 31, 2026 at 08:42:20PM +0800, Linmao Li wrote:
> [You don't often get email from lilinmao@kylinos.cn. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> 在 2026/8/29 3:25, Frank Li 写道:
> > On Fri, Aug 28, 2026 at 05:32:09PM +0800, Linmao Li wrote:
> > > [You don't often get email from lilinmao@kylinos.cn. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > >
> > > Zero-length skcipher requests are valid no-ops, but MXS-DCP queues them.
> > Any document show it? if return 0 when cryptelen, it is async, no
> > call crypto_request_complete.
>   Yes. CRYPTO_ALG_ASYNC means that the implementation may complete a
>   request asynchronously, not that every request must do so.
>
>   A return value of 0 indicates synchronous completion.  Only
>   -EINPROGRESS and -EBUSY cause crypto_wait_req() to wait for the
>   completion callback.  The existing fallback path relies on the same
>   semantics.
>
>   There is also a direct precedent in commit 8a4e047c6cc0
>   ("crypto: marvell/cesa - Handle zero-length skcipher requests").
>   Marvell CESA registers asynchronous skcipher algorithms but handles a
>   zero-length request with:
>
>           if (!req->cryptlen)
>                   return 0;

Thanks, but still not answer my question,

Any document show "Zero-length skcipher requests are valid no-ops", why
not API direct return 0, instead of pass to every driver to check it.

I suppose it should be checked before call driver's callback.

Frank

>
>
> Thanks,
> Linmao
>
> >
> > Frank
> >
> > > When such a request reaches the worker, last_out_len remains zero. The
> > > CBC completion path then subtracts AES_BLOCK_SIZE from this unsigned
> > > value when updating the IV, causing the offset to underflow. On
> > > decryption, the resulting source address precedes aes_in_buf.
> > >
> > > Return success before enqueueing zero-length requests. This avoids the
> > > invalid source access and leaves the IV unchanged for a no-op.
> > >
> > > Fixes: fadd7a6e616b ("crypto: mxs-dcp - Fix AES issues")
> > > Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
> > > ---
> > >   drivers/crypto/mxs-dcp.c | 3 +++
> > >   1 file changed, 3 insertions(+)
> > >
> > > diff --git a/drivers/crypto/mxs-dcp.c b/drivers/crypto/mxs-dcp.c
> > > index 133ebc998236..60794b4d49fa 100644
> > > --- a/drivers/crypto/mxs-dcp.c
> > > +++ b/drivers/crypto/mxs-dcp.c
> > > @@ -473,6 +473,9 @@ static int mxs_dcp_aes_enqueue(struct skcipher_request *req, int enc, int ecb)
> > >          struct dcp_aes_req_ctx *rctx = skcipher_request_ctx(req);
> > >          int ret;
> > >
> > > +       if (!req->cryptlen)
> > > +               return 0;
> > > +
> > >          if (unlikely(actx->key_len != AES_KEYSIZE_128 && !actx->key_referenced))
> > >                  return mxs_dcp_block_fallback(req, enc);
> > >
> > >
> > > base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
> > > --
> > > 2.25.1
> > >
> > >


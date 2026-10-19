Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5C7606A331
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 18:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YNQu4noq;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ExVgae8G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKJZm6l1Dl+4FczBOaToXFKmX1nLaB6tX+FDeAhZ9E4=; b=YNQu4noqfUaWX1bo3QU5k8YSyL
	8UrkKtxjW/ZFnKQQ4J5hcyAf4KZJfJt4InrzMl3M3pngZGLCUBbNYzJR5Bo6ribXvGMskZCEMz/5H
	jTR5EiayM8TzFl4K00vmNnYoTKuuzBYarVJM2Uzex2Z9REsJrdMZorvutsWEOTrAHCnSOm7Kbxd+v
	raoc4Ky4HTlrUeS8Al1QMVqorKdM4AehiHcRrOYsBZVr6WISVGiWE0oHc7UW+MEghEP+7BSM3Ku7/
	xPSpFLHvDfBHqs1Qc7kaCSDsm7TSkypz6dOjfObDd6gLUP5s2F4alhIG5yG97nlYlD5ArMq4QfbsC
	TrwH5KXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIs4X-000000089Ji-05Pp;
	Mon, 19 Oct 2026 18:26:57 +0000
Received: from mail-northeuropeazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c200::5] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIs4N-000000089Cw-1z3s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 18:26:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sg4wLqK66pI6WJpmVzbGGUaM0WHx86qmqwzIJvU0rpcb4cRS7CQvAvFFko2w3V5TD8OvYQXp4oMZADyng058Q4S0jw1rXfhPkpSclV3M4tRl86eK3YLqQe4fbaiVNYSvdGW2T3wH6xNCeBSLfAhOjYKYqA1DTX7DWbQc0vcw3x+kV6B6xtc4H6LVcM6xfwefEJUh/wPuJ8c/NoqaWV3aggygLwnikcSCH/DVI2uargNRPuND8nEslx46L2/oOI90kLwcFUH6GcbIvS4Bj3XKjErLGEMCPgw9/K46IXFyiRUeTpXUyXvIhIXslrnafKUMVftt1DRDnXm7G4WAROFFWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKJZm6l1Dl+4FczBOaToXFKmX1nLaB6tX+FDeAhZ9E4=;
 b=V13Qs1tvJZI5+85PZVycBEvDgljxDFkk6WvAq7BCPi3UAM3e27N5G9Dzb85jr9BoJgW81cxM0EwsAurZJTGtM0ouP/DjkBUdeA6GS183dsd7UZLF66SvGxM9Xs3Z4ybW7gLWI4RqvBu4qICPjgw0uYSbhuXgqSD2WAQxneKFnBwNybcdIwoenNNDJtPSdgktwQUJXQp6iJhYx5TkFYO6krLNDGjobuFgN6uneia85RPUYgZyxj5mT410wh3msGBETLYltK8s6e9K7Ihr5vyMLE2I0wmvuDBv2Rb+8xbmi0aQIMRYGav6+a5mLYZycpoA9DfXDRxluKiTgFfxH1bImQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JKJZm6l1Dl+4FczBOaToXFKmX1nLaB6tX+FDeAhZ9E4=;
 b=ExVgae8GjtQ3MAuTVFztmm9pGnp5YZdiPC975sqr8p73xSvJ1jMFsxIzAvTewZRNd+RXjjSC0BuurrfyhmgpmjLRxYee3gN2B5+Q3TYe0k7dzFz5+RqlBIx3Fuk6GArX0qzviie1BeyPFF9vaPDPfSFOTXScwtKzC8OxLSMydz7F76xYskioOl7wsOCsLdJ/g0GvWadOIkfIjLyrbh7NIT23lWaL1H0ecq+j+l4e08KaLCB2Q4OGJlv6g4GqJoclZjNB6vol+P6sveiHNEn4Ma2d5SvnTrzBpotnWGpvY5TZiIPtaegaRxREP8f88lGROd4FlqdeiMxlHgy8jdN9Ug==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB11557.eurprd04.prod.outlook.com (2603:10a6:10:607::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.18; Mon, 19 Oct
 2026 18:26:45 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 18:26:45 +0000
From: Frank.Li@oss.nxp.com
Date: Mon, 19 Oct 2026 14:26:20 -0400
Subject: [PATCH v2 05/13] ARM: dts: imx6dl-prtmvt: remove redundant panel
 compatible fallback
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-arm_dts_cleanup2-v2-5-dcdcbe6389c1@nxp.com>
References: <20261019-arm_dts_cleanup2-v2-0-dcdcbe6389c1@nxp.com>
In-Reply-To: <20261019-arm_dts_cleanup2-v2-0-dcdcbe6389c1@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792434379; l=1011;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=z+blePyaflTzhKBkmlGQpnlni1nm7PW4kfJohFG0pBM=;
 b=d/GD3kL2Nu2p/Nhgpc6fcGX8Eg4+6HRtkc3t1aYfuNmU/fr9pUT/z7stBlaotbNd7mxugf3uD
 BGW6Fh17gFUAScK1LRjQzskpudXMTfgC40DCg/zK6ALqhr0ldXUgq7J
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS7P220CA0105.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:25d::17) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB11557:EE_
X-MS-Office365-Filtering-Correlation-Id: 9af7a50e-3a03-410e-a5f6-08df2e0e87b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|7416014|23010399003|18002099003|22082099003|3023799007|11063799006|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: Rb5s4dpd15XFOyGzcCf3B6BVTxuUTZcHC6Ch3VW/dMoa9BJHCI5TgXneW7YimJoN85QKfkLm39IHyqnXp4aWEuKd69yyDY/gaja/ZmBI3NZhhjVH5ktPBSPaF0qjqwM+Xft9Fow0CM69SspoU/AB9mnO74MO7WyFGIofSIQCFn0wGg0UBVjSNvoN7X2CyIeUZrKSiYY/+4eHx4KbAZuafqLM8HFfZg1xzZVDud2nbhggBumm3NdG9ISxOFGC+4Q27NGQ1wE0SzrO9nEshLBq4RFq8jiKdRTvKQyeAqiQB75L6b8Jq91CrkwGIYtOMIqMuBNmP4u7Gykw10AlyAOcnMhitV+p4t0o46hjedzNIYB1xO2O+Bne2EdHbHKJnlXp5D352zJIeJjemMJd8+UuqrvhWApaAylQx7pz6yYsBad3WnvTC6Tvb5I/GszSCUMiQXrg8THmWWsG8NQTSSjdCaqeg6j1McJJdr8nw5TFHqqGY0olRjlzZCLPFNaaqUzjdi/ZBWw7lCjcFXYGVKHgrkdzC4078a1EQ1kgwv1BK08rs5kCw6fx3prmF/MvL2sDZfeU0bYvHcxn7/1dDKDGqfABgzdtLm/PNIHcoTvWGKjPtZEJswo/XcPYKslQezDa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(7416014)(23010399003)(18002099003)(22082099003)(3023799007)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cE1sNStueDdEdWFWNEpaZXdNRUIrY0Z6VXJJWEVTclVaTDJ0K0tiWWY1OGxl?=
 =?utf-8?B?SzFNZVd2S1YzQlRLb3laRTNGRXVTQXFTeVZqazl4SzUwYVRVRE9OeEc4WHlT?=
 =?utf-8?B?UWZJcTJCMWFFdlBYOXg5MHI3c3YyRmlMMlJQM3FlWTBUQys5TUJYRzFLRXJX?=
 =?utf-8?B?UGdOa09ZREwwUzBsSlE4bEQrZ2U2UVN3SjVlbVNtZ0p0THh1K0VQQy82cUN3?=
 =?utf-8?B?ZTl0SDEzNS9Ic0R4YWFxNFRKenBXVHZMMXBZTkdGK1YvZFFTekVxdUU2anpO?=
 =?utf-8?B?bUdkcm1jSmFycDZHVlNKcmFpWEhJOUQzd2JsMllLenZiWUo0ZVFrNTBSYkZp?=
 =?utf-8?B?cllhMWRnSDJob25zcWVvRTJnWWJROTlnMm10d3liVDJlQ3VMdEFVd2JEbFlM?=
 =?utf-8?B?K25ETGZXNFlRdHMweTdtMy9KMzFZcmZlRlFDbXRxajlFUFZyVDIxWExQaFdK?=
 =?utf-8?B?WTllU3QvTXhGVzlQZXhhRkpReVhYVzNjSkUrZ0Z4aVRFVDdFbVZIbk1WOFNV?=
 =?utf-8?B?RE1tUnJjVTMrYWh4U25uZ1lHcUVGT2NZa1dLWVhHZWJvQjZPZEgrYTRNR1Qz?=
 =?utf-8?B?TndUcU1raXAyUDBqOEYrbVlBVjdPSUs1cm5PN25jeUlPYXk4M0dyZUdIendP?=
 =?utf-8?B?V3BOdC8wNnRWZDlYN2d3VHBxelRmbXlkVy96RUNZWm9yRVE2Vk9GTy92RW9T?=
 =?utf-8?B?Zk05a0xwZVBDRDJaTjNiU3pUWERkc2wzL1VPV0dRTnVzeHdDYTdPN0QxdXRY?=
 =?utf-8?B?TlREVEtRTWtBUGF3b1orcHdtN1hZanpicGNheko5bmZlVnl6Z2Q5Mk15R0tL?=
 =?utf-8?B?ZTYwbElvQy9mWTRJeGFFdEhmMHhQZUJjSEV6WlgwMkJycElpbkt0b1FwZlB5?=
 =?utf-8?B?Q1ZXMVRyaHlsemZ6NFp6aDkxUTg2R082SzAzWWZUOUZ1OFd4bWVkdlFPVW9D?=
 =?utf-8?B?WmR3dkg4OVJJL1AwV2d4c0Iydm95WnVLSU5TU1AvOTc3WFd0eUM4NzFtZjcr?=
 =?utf-8?B?NHN4ME95NnQ0SFZrSCt4WFpYYVBrT09KMGdGQ1VjMHl0QWJYc0VpMmFMWXlm?=
 =?utf-8?B?eG5KRDl1Q242ZEpocVpUQkFocUh1akZmN0hSYnQ4QkFsUHZLUTNJS3dBMXFq?=
 =?utf-8?B?NHcweFhhUXgwcHUwSUV0UmViNTlOVWwvM2tYcDQxNkQzNTkxYnV1S2k2c2Ft?=
 =?utf-8?B?YmRJRnRLR2xqYnhlTWlGRFZnMGRUQUI5S0R6elVRUlhRc3ExV2hlWURibWpN?=
 =?utf-8?B?SkFZMGNFUCt4bG9aRG9IeDJ0RXRHTlNxKzYwcnpoU09tUiswWjFqSG5hYTV4?=
 =?utf-8?B?Uy9VZG9vamxiS3hsMFVrMG9kYXJhRXBpQkg0bW5zL2xWYnA0SzlkaVRxWWFw?=
 =?utf-8?B?Znl6Zm80Mk5DTXR2L2RRSG1mcC9KZjZoRkJiN3ZPZnJoajdQRFNMSkZCdmlZ?=
 =?utf-8?B?QjViWmd3ZHFmRCtTajRLcmNtNlZVN1BiUFVXUVNiUG5mTURBOGd1NjdJaTVE?=
 =?utf-8?B?VjNJc21ycm5LRTErN3d5U2thc0NnYXh0QW56VkdWbFpwZ2MvMGVZQ2QrZDdk?=
 =?utf-8?B?aEtvbVJabzZDdFdUcWR6VjVOK2R3L1pYSWFCVGNSbXJsVmlhak1xT3NVcGUy?=
 =?utf-8?B?SjdmMXo5TnRJQmFpNVdidkVQTW1QV3haVUhjQk5Gb1FoT0lmSXhENlpCa01M?=
 =?utf-8?B?UlpMTlFqU2d2d2xxbklxZnMrK0Zna3BxNGNzUkVPb0dKVVVXeDdwczE5L3Z3?=
 =?utf-8?B?YUhpa29UcnlSc2dodjM5WldtdHQ5UldRZUhsS1lOY3NDVmh3bUN4TFNhMWlj?=
 =?utf-8?B?YkFWUkdITUhLcy9ZL1UwS0pmVzFkcXlNdGxwRDd0R1pWTHRkY3htZ3FwVHNG?=
 =?utf-8?B?S01YRlVTaXBGaFJQRnh0L1BySXNHNUZyUGllR3RCU2E2NkV1bHZNYWVpWXJD?=
 =?utf-8?B?M3dET0ZJOUZ6ZTI2UlAycXhrZ3RpbU5qSE04OUlrK3pkaVExelEyYW00djZJ?=
 =?utf-8?B?YURycnBaWnJQeXFzUWNET2FqWE1tME92dEFzczZUQm0yd2p3SVBZTC9qT1p3?=
 =?utf-8?B?a0w1akFsRllsZVBtWldaS2tZcDYybFJTNHFwcHkvZGk5a0MyUzBKWGozOFBr?=
 =?utf-8?B?TDFJMXBzR0g4MUwvYVdNbmtNaGJON0RoVm9TOWQydUJMVE5ibXowZXZvOHJB?=
 =?utf-8?B?dUZxeFFVK2dnczIrbnFObGpTWTR0Skd1VzVWci9nUTBVeVJWa0JCZ1FDcGhy?=
 =?utf-8?B?WktZRXVUZHhPemNPZUVMbUhURDBKWjYzYTE3aGlPTTN3UEV4SnZIeW5EQlpX?=
 =?utf-8?B?WmE3RGZrWXoycDF6OG1lTEtmak4zSU9kakJJcmV6b2FaNXc1WHZnZDFJS0JC?=
 =?utf-8?Q?9M2EMFgUP+eQzgF3EiddQXXyRrdo83SFF0wR/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9af7a50e-3a03-410e-a5f6-08df2e0e87b4
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 18:26:45.1707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dl8DDJiVQtSPs7v71tCvlrk/1IXYP0+NJoj71VTKSEwKyHGkiKLWvGZRQKUGizilCfWqyluhfqkInw/Kd6NL4wYJvGIYjh0DLmzZerNlbTpl/qh7UuTcDbl9Uxmdfjz3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11557
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_112647_864618_92739865 
X-CRM114-Status: GOOD (  10.54  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Frank Li <Frank.Li@nxp.com>

The panel-simple schema allows only a single compatible string. Drop the
spurious 'lg,lb070wv8' fallback from the kyo,tcg070wvlq panel node.

Fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dtb: panel (kyo,tcg070wvlq): compatible: ['kyo,tcg070wvlq', 'lg,lb070wv8'] is too long
        from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts
index dcd5a4099c602..4896cd3deaa98 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-prtmvt.dts
@@ -178,7 +178,7 @@ led-2 {
 	};
 
 	panel {
-		compatible = "kyo,tcg070wvlq", "lg,lb070wv8";
+		compatible = "kyo,tcg070wvlq";
 		backlight = <&backlight>;
 		power-supply = <&reg_3v3>;
 

-- 
2.43.0



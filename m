Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6B9C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 21:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2C1sKja9LYQGpBT6Y5p14gBIpMLPg9Psfzfh9no6+So=; b=GdKjfbYkCLqjJW5ikWlaoUS9Qs
	8dEfcH1DT1uAchgeEnMnVOYCFn7SgsUjKHx3ylqkYbsZWlGCDvc/zcRhNw/MNG5KpbXa97mlBbE88
	by/R4MGpKXHIgO10ruJBjI1vaQcbOD13JykH2vUxnC592MhvO6zlZDuaOtSKTw38SmbOTIch+SFN2
	MFqU1cdafVvU38qqxXRNHC0qzujohTpABACuAOZvEx6hXon4Hnmo9NJothFlE03CoOuirlHy/i6T8
	iyi1hnTNk72xs2rhMJj1bo5SNUChI89p9SD32MvJQjhntOGfWXoAdFz9SPq2zsU1+hzGkQ88rYrwe
	WD5+Ksxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thb2j-00000001RvC-0E8W;
	Mon, 10 Feb 2025 21:10:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thatF-00000001QdE-0v1s
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Feb 2025 21:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=2C1sKja9LYQGpBT6Y5p14gBIpMLPg9Psfzfh9no6+So=; b=VHntVrjK2gY8j4xVilUNAJXnbU
	VpOjLhmF7QRJp/sLjNknuNGDXiGBtcQPOW7xTqqgdQLyUm2gPM0nNddYzQD5wLzBViQY4O8mdN851
	JDGr8eII1Hy0bSQ/UkPzyDbDuK6g73n1ms6Xwo8KTCBLS19D08iKubhPzLo8kE4JvEykvyOkOU0cC
	ovznQqSARM7C+4mM7rBwNSi9P0W6bAFdF/wgysyA+Vn+y3PDTl+k4bKOJFsJNFfOwuGKSJtInBfuY
	nrwHr4Ji6r/bRedmpIQAMwCBSfvdGF+SDmbFoK7VIzJqHJauwWhse7h9sUK9I2n17Nco+eZS++sMs
	fkbm0Lbg==;
Received: from mail-am6eur05on2061f.outbound.protection.outlook.com ([2a01:111:f403:2612::61f] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thatB-00000000GPf-2qCj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 21:00:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vCWGYXOE1t4lhspNkP4OHvqgXz4vNHZ3/TLRqnM7WrtNpfhtK5ptruRwx2lhxOf0Is8Qvfldba0/vd7ALaiM5hGP8It5iO2xKUbOzE9MMv2ptzRMXm+3Y29SWZMlraWD1zU/BcgffReH4PWk4kC4pgNJbk0CqaKMHOICkA8YOzYjqBjKfezMv/wMzwXU63MBq6FNS/F58AxRGa65cBMkflh3/6ovWgbkvBM9k2yKLZYabzVC2YiG0TIQ36n9ReV8+THjj937Yptao2jp4hmr0NyYosZ1vKvnUldYGrZG0gcRdGT8X76LZzwrtL/Y9ka7vJ/nKDPLY4ROC/sqSwWDaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2C1sKja9LYQGpBT6Y5p14gBIpMLPg9Psfzfh9no6+So=;
 b=x3bD8ZHFS0qGiGsRUinh5KCmRkw6l+VJRjnz5L8UEW3lsSJ/1R1E/ONoC3ZfoXXGOHdo8d1HDRIx2cssLEY1ZXOm/eLMJHaGoeMP2x8FqcX2CXezwdd0Xr2OSl9reJ2Xr1MZeDPryuh/kF55g4ofPPgodZ4el/tgRCBgdH9I55Q65rlcDdIAkYC5OI1oX7ut4mCjNlnFQMiSPX+pNyOOTKeUPS5DzTFXAOwNYNkcQrnezAUjzwIzcSf2N2GRyM+vYy3uoKz14LFQQ2zgrl3qomlpM2+DjIXJfZmvLKwL153XRna+nmXlaEg+7TzELX5w06zjQjDL/lbQszmvTxtkKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2C1sKja9LYQGpBT6Y5p14gBIpMLPg9Psfzfh9no6+So=;
 b=CFVc7xUr4SnaPvohHVMAR81vLIRacwIbOFoBJku1O+zzUesN5RXK4jf2OWsgEjGSlNdEOooQXZphnmdgGpxGbUuS3QP2xUGy2J/dtqkApNv9dVmtrAiWzOTyOkR04KCWM1JaoVq543RdjH+R0PfsXE90S3AHoXKPf7fQFDcgL4zP8SJq6yjguJBmSyHAW8yZSCocrGVcn2J+++Grt5p/1N6fne6LtHH4sxDWnoTFGxwNuNoLm7pL0dpwbebJRVvgaAKCGx5+BzWmOHcWOz/sLSjPkB/wtKkMC5PjV0NNeCiiIaF5ApxcBHN810sqFetqL5PJVSMctUGJdOmNvmt0kQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBAPR04MB7462.eurprd04.prod.outlook.com (2603:10a6:10:1a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 21:00:18 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 21:00:18 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 10 Feb 2025 15:59:25 -0500
Subject: [PATCH v3 06/12] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8QM(QXP) compatible strings
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-8qxp_camera-v3-6-324f5105accc@nxp.com>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
In-Reply-To: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739221181; l=2621;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=7wXZhwTRfjUe7ha7KJiQ5NyLlzlXsRv2ixjhl52x4f0=;
 b=SFnCN1SX1BaQNZ6+VChvVSkVF9aP1dMxsR2iviGajUf6g4Oc0oU8oPGaCe34WQxTM186vG8Mz
 jwJKZorKZ+SCZLNaUH8P84ACzTJ4FtwdP8qAfwkceo6ah7deTydvzA1
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBAPR04MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ac3d1da-6199-458d-f113-08dd4a15ecda
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3UyUTNyWTBTUDFQeHRsc0JkMkVUeVJTem82bGlua1ZScXU1RTJ5UGNYMFJv?=
 =?utf-8?B?NnR2RTdDS25wYzRZL1FkNFBZM2FsN1crRGw5T3psNE81eDhWVVZRRkhxWkxO?=
 =?utf-8?B?T29NRFdHRU9CU09BQ255ZE83YlpVaHF1U1FHYXh2aGpqMkJxaEJOczBBWFhE?=
 =?utf-8?B?d09ILzZwT0pkTkJ2ektZVTNOMWtCeWFhYW8zMXpVelQ0UlhIb2ZzbXYrcHZw?=
 =?utf-8?B?cm5YSmhNc3pCT293cWIwUjBVcFRWYktuMXFEMlZHWnZ5bHJoOUdsTUdSNjJi?=
 =?utf-8?B?dG1pYmlTSk9WQ1AwelYvdDVWMjB1RFhWcTZ4UWRoakdOdmNmLytlTHdwR3V5?=
 =?utf-8?B?L0YxVkVwRjMyQzErV0pPWkc1TjBkQnJMekVyYWRabzdhT0h5TEpzLzZtaFU3?=
 =?utf-8?B?TkhFQXBCN1RuK0JKS2FmLzVROVQ3TGFUNUY4SFRzQW9vL3QwWEZHZFI0Yk8x?=
 =?utf-8?B?SDFsa1FobWJhZFN0QUgxVUNyOXovRmRBdEUydjd6eFE2Z0t2NnVuVyt2dkFq?=
 =?utf-8?B?clc2RWtvR3pidnBIVTNpWnZDL0pTNSt4UkNJdEhZS0toTk5kcE93S2NhQ3pE?=
 =?utf-8?B?WVVmUGVQc0UzelNtKzRSUEhueS9NTUMybjBMSk83T0hJQnhkU3M4aE5EQkN0?=
 =?utf-8?B?eEVNRWxtNWx6YytsYld3cjE5UzFJS3VpalhGYkdNQytzU00zRnFCemxmOGtH?=
 =?utf-8?B?Ty9kUDFadjV0dDdsUVcrU1hhZVZzSjN1dFN3RnJxbUhnMHR4WkJMY1JHMXZH?=
 =?utf-8?B?K3R5RzAxVmZlWHljbVJjbEN4NDhqSDdCNVNmSHdBM1dRQ1QyUHphMDZPMGpL?=
 =?utf-8?B?Sk43UW5kNmpzbDRkU2RTVm9nNjhCV0Rsd3grbjlEbHNGNkduSENYL0QzVEpT?=
 =?utf-8?B?T0k1RVBxaUVxNUx0WGc4eDR4UFBJWGp0OG90bW9jS09mYmc5RTFBNlJybGFK?=
 =?utf-8?B?dllMVitDeC9FZ0RWNitTKzNPMGQ2Rng3cEFZL3hIQitqNFpZTzVUekdiSEtr?=
 =?utf-8?B?WDFBbU9LTzNJSU9wYlk2cVZvVjhCaXRPcXFDcVhRRTg0TmZjREx5c1I5YVVp?=
 =?utf-8?B?emJmNTJGMG1zR2IxWVZFSDhUakhPTFhzTGxSRlEyT2NaQWxHYWRGZXo4TWVk?=
 =?utf-8?B?U0xZeWdVaGl3WGxUd3BDV1BMZzRzd0dZMFkyMXA2WEphQnN3M3BrVVYzTG1v?=
 =?utf-8?B?ek1zN01FeUxFMnpHUVN2eUlIU28wcW45V2JkbC9zNGgxaHNCL2l0cjJKZDJL?=
 =?utf-8?B?T05BVmxvbU15cG9aMjFTTi9hRTA2WTQrSGJJMytJN0JoMlc4Qk02VnE0Slh5?=
 =?utf-8?B?T0h3c09jbldiUXZmRXNOUzBQUXV5bHR3WEtRNUs5SVlTODIxZlRIc1dwOGFp?=
 =?utf-8?B?aW8zYzdOUDVXR1Z6M3lVMDdlSm5CMnZQaCt3c1RBNkZLVlBNbi8yZWlGcTlV?=
 =?utf-8?B?VGh2R3lNbTlHek1lZnRlVmFjNTNPaW5MTmhCZHQweE90UDNuZmh0bXdUQ1I0?=
 =?utf-8?B?cXVBMUpmOUJmTEUzcVNnSml3RjQySlpDT0hFdjRLNTNjNGYxRkVVeHdkbWRJ?=
 =?utf-8?B?dTRselc0WGJzazBhWjFMelh4Tlp0bGV4MjMxK3VGdWNIREtOZVl1eHlBRzYx?=
 =?utf-8?B?aTNPaWlHRi9lam1HQUZROERGM3p5RnlKUlhQUVVhd1RBQjliZzNhdWd1d0VX?=
 =?utf-8?B?d015eElWeHlxM04wWlVPeTQ2ZDRsYUVHWTh5QmVpQnlaSnFXQ29KWkkzbnZG?=
 =?utf-8?B?UVM4SjB3NmM5cHVkdTl0UU4vRW13aVF2Q296ZzdNenowY1E5WmpGQnRCMUhC?=
 =?utf-8?B?R2FPWDhSRGk3dGhWSXhWQkVyLzloSUlUVVJETFg2dTExRSthVEN3OTZ3VzVn?=
 =?utf-8?B?WnhFL1B6US9vdjNIMCtiMHBwN0toL25WQ2o0eFNKSDRoTStxUittTXpVSUcy?=
 =?utf-8?B?dkpBUnFLcElhZHFCNWRQMW8wVDdhWlIzWTN5ZkVxNWtpdnpwcUZzOFhhdits?=
 =?utf-8?B?NUZkRmpmNVBnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXNWVzhLK1dJcFlaNkpiamREZ3hGOTZzNWpVd0xWOGRQdVRGcUxpNTBnRG9i?=
 =?utf-8?B?bXNqZ2l0QUZqVzN4WXRxTjNwQ2srZ1drOW5IYUdJYkptYUhGZWM4OUU2RXFq?=
 =?utf-8?B?NjA2QmlhQ0FBaU1CcEk2bUdqTUE3ODFRZjFkRVp4QzRENkVIQmtzdzdOWTly?=
 =?utf-8?B?Z3pHTVJzSldBR0dkMFdsTENpQWlaUEdTUVp5T0o0NkI4dG9JUlZCaWRja29L?=
 =?utf-8?B?NXpaMmlGTzRtMFp6ZmFVVjdQdTFsWkFkem9uRElqS1ZXOURxbzZNcFBLbDdZ?=
 =?utf-8?B?dWlNUXNsalhId0xaMzF4RllRWTlsQXliY2NMUUp3QkRvNHpwSjUrbHhpUXlk?=
 =?utf-8?B?T3B3WjNQZ1FDQk0wSFJMcG9KVEZzTkNlaVNYRGNpVHRzWjM3T1hlMFZDVWJ4?=
 =?utf-8?B?S1Jydk9mZ3V0TndjQU5xNzhyREdmVFhSdnpSY0J4THNPRUdXSHJtR0grYUF6?=
 =?utf-8?B?SlpBbHArMnd0TGlrVklzN3JWMDlwRUhJUzhLS0tvMTNMdFdMMUQrUE9zbytt?=
 =?utf-8?B?Z0N6OFB0UDB4UEJRUFFiSExXRUdpb2w5T0VSaVR3V2NaRVFkTVVyOCs5UFJ0?=
 =?utf-8?B?N2d1SlNZWHIxZVlWYk84WS9xRktDQUJuY1NxRFFDMDU1TXE3VWNuclExY3pO?=
 =?utf-8?B?TU1nckRDWkh2TGdKelA1dGZMYWdMTXR5aEcvbWkrMTIxUnk1RTNFTTBGRzJq?=
 =?utf-8?B?Umg3VFEyZ1JqV3BDZHdadDJHaFFsd0ZlS2pLMEp6MkdBVjBTWG9IcjNCcFVD?=
 =?utf-8?B?Skpsclh1Zk8xNkdPWWpuQUdLcEU1MmlkLzVwdVVSeStLMzZTRmk1KzYybXBu?=
 =?utf-8?B?NU5PbmdsNllQdUN4ZFM4NzVFa2lwWjNyenlmQ04wdmpqVWhTTndwREhLdVdx?=
 =?utf-8?B?ZGoxWjdNRUc0NkZVSmc5dTNtcjh6cnZOUEhJUldTQStzSEdXWk0rcVF0RXlj?=
 =?utf-8?B?eWRLMWJCMzdYWHpGaFpPM1Y0cjlxVENzcnpmdnh4bDVuRE1jeTNrUUVUdldE?=
 =?utf-8?B?NUFIY0ZNOXgyenBLczhjVjRuL3ZPTkhkOWNFaURYWlA4RGFsUFduUHhkbHp4?=
 =?utf-8?B?dmJwREdFaDdQMUVxakYzc1c0QXpuVkFub2dRZ3QvSFRJbXZWQnF4SEJHZ1Vq?=
 =?utf-8?B?UUtBK2RWRHgvRG91eGpXNU9vK3djMG4vSWZNQ3BOeUZPVEI3VUtlNzVMb1RN?=
 =?utf-8?B?cmR0MkNSVUFNOEhRUnRGd25yM3dtUUdWNnJLeU9tdS9uNVU1THJtZENUTEd4?=
 =?utf-8?B?MXZRVldpNHR2RlZMN0RNOTdrTGpLV1piZ0U4STlIR1FPK0Y5YWdhQ0NPaTJS?=
 =?utf-8?B?aDVhU1lvaDdXbThKSmtuRy9EQU56TjdOcUsrQnh0L1h5U3U0ZTRuSmUzZzJR?=
 =?utf-8?B?a0paY01YZzlsejBraUJPVGZNWUlBVEhlK1NDYWtHNmIyMUFEUjE5OFdtdWpj?=
 =?utf-8?B?V2N3RWhRSUpTTEQ1SkFaNThWYXUzczFZZWhOMkRDbnEzS2xsWHlVcDRTQ0RH?=
 =?utf-8?B?dXZOUXM5QVNjd1paazB3TVFBYmN4enZwbU54VUNSZklHY05Jb3VmbmxmMTZR?=
 =?utf-8?B?c0NsamEwa3ZXODI2R282Y1M5b1JLTFRpcGczZVNGblBlMERWM1lGSU8xQXRP?=
 =?utf-8?B?RjNMTWdEa1EveUFIcis3Uk1acFY1U3FMd2JCVXpVdGFSaVBTY1NYNTdVajFN?=
 =?utf-8?B?ckZtRk1XY0p4SnROYmk5K2VnYXhFRlk5bWlxTDNFKzB3Y1NoT0xRNzJEbVpv?=
 =?utf-8?B?VmVaWEZFMkpSWExsV2J4anJiaUtVUkdrSVF4K0hUZ2Q3Ty93YmVnUDhiZ0d2?=
 =?utf-8?B?eXgrV2JpcFVLVDRMeDBiSEFHYi9PSThUVC9ZRDdSTjB0dWNhTUtubE5JajZI?=
 =?utf-8?B?d0pmWkJyeExnWHlZMllncGplUFJJL1cvQ1I0OXErejRsV2djelNZcmp5SUlj?=
 =?utf-8?B?R2dxOU5vSzRpdGRqWGYwSEhvVittMERKRGhJRWJHcFpHR0pqSHYzenk0dFEr?=
 =?utf-8?B?TzBUdmJSWEpZVys5YTBWakZCWGZIRGNpNnlRUWx1M003MklCc1lzUVJlclVZ?=
 =?utf-8?B?Q2hNV2FWUTYrbjV0QnBFWGpzRlVVSFJhWWhSTWRXWEhwdHp6aWhHbXpJMGsw?=
 =?utf-8?Q?IGnQ=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac3d1da-6199-458d-f113-08dd4a15ecda
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 21:00:18.6040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CRCJ8tAPuVqlZhbZflvHxIry3AudavXflS6mJDoEwD0W8hhCk8RvKgocsYNjZsAZf6ilfGeetqGMRwDpKKXNfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7462
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_210022_057234_D29A688F 
X-CRM114-Status: GOOD (  10.40  )
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

From: Robert Chiras <robert.chiras@nxp.com>

Add compatible strings for i.MX8QM/i.MX8QXP platform. Remove
fsl,mipi-phy-gpr from required properties and add new reg space, since
i.MX8QM and i.MX8QXP use dedicate control and status register(csr) space.

Keep the same restriction for other compatible strings.

Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v2 to v3
- use dedicate csr register space
change from v1 to v2
- remove internal review tags
- remove reg maxitems:1
- remove 8ulp part
- add 8qxp compatible string and make 8qm failback to 8qxp
- limit reset and power domain number to 1 for 8qxp and 8qm
- remove power-domains change because 8qm/8qxp only need 1 power domain
---
 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 38 +++++++++++++++++++---
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
index 2a14e3b0e0040..522449e50079e 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
@@ -16,11 +16,19 @@ description: |-
 
 properties:
   compatible:
-    enum:
-      - fsl,imx8mq-mipi-csi2
+    oneOf:
+      - enum:
+          - fsl,imx8mq-mipi-csi2
+          - fsl,imx8qxp-mipi-csi2
+      - items:
+          - const: fsl,imx8qm-mipi-csi2
+          - const: fsl,imx8qxp-mipi-csi2
 
   reg:
-    maxItems: 1
+    items:
+      - description: mipi csi2 rx host controller register.
+      - description: mipi csi2 control and status register (csr).
+    minItems: 1
 
   clocks:
     items:
@@ -46,6 +54,7 @@ properties:
       - description: CORE_RESET reset register bit definition
       - description: PHY_REF_RESET reset register bit definition
       - description: ESC_RESET reset register bit definition
+    minItems: 1
 
   fsl,mipi-phy-gpr:
     description: |
@@ -113,9 +122,30 @@ required:
   - clock-names
   - power-domains
   - resets
-  - fsl,mipi-phy-gpr
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8qxp-mipi-csi2
+    then:
+      properties:
+        reg:
+          minItems: 2
+        resets:
+          maxItems: 1
+    else:
+      properties:
+        reg:
+          maxItems: 1
+        resets:
+          minItems: 3
+      required:
+        - fsl,mipi-phy-gpr
+
 additionalProperties: false
 
 examples:

-- 
2.34.1



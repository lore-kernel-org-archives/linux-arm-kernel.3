Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24E9606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 01:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZOfyBji3;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=bhIKi/Li
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Um7YxCGUX/znCYiTXaHI8iRtNDMOT3p17B5RPSOgwOw=; b=ZOfyBji3RwMarx9Jb6APvTQDmU
	PfR+oA3W2JwyaJmY/ssf0lvdgqGAxVQBUZTBt2DRkGuFnbKpsJn0H9ei+G9RVyiUpcMnM6aN6HTMs
	yy+LB6XdFpPPtlluzXZRinsDmAozEIWc85DoZW+jWja8wAEBpx9KR3I5RV6fUDqImqT2+7wqCevtN
	6ISjV9UQu4FXHzINMSaW+TsVTePcuDUz9fbiuHeNebtpOfVenha7yQumAuTslt8UCUxeWDnW6QM+i
	WU0roSCqJzzq8zD1TJut5+H3n1kNnnvkUpnMx+CrOolzMo9IS4GdZERUJeJuNI+68MRusa0zaO26z
	IahZRuIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJhs3-0000000D9dZ-2yR0;
	Thu, 22 Oct 2026 01:45:31 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJhs0-0000000D9cj-3qcE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 01:45:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPgyZc8ihHV8DGbV4PThvibQx1qmWA+nfUzAi/+fVmvWs6AbXFGjh/DqLW+J/+KrCR80m51JB9J1pyqu3ZI9AQp/PNurmNQ7/ycI5ujFyw7Y18YZPQMW+sgqc0/o3sgVeDvA18H4du0EC7YNbeGAaHVnlAOpyuNw2IIiNGZK4M3qCQXxrhxjM/lGIGGhsRL3FSM9KtoLPrQjaKylpByFsjzwGm6lhE/Ti2CSxjOmeaCkYZh3oqYpurU1YWOwfP1kXnrfydIin+oToZqEyscJuEMdG6hFSJOlw/k6D1pYow6xXy4zVSLHg3iFzJhsFPwAmKI6NHS5IBaOvou6IMQdaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Um7YxCGUX/znCYiTXaHI8iRtNDMOT3p17B5RPSOgwOw=;
 b=lz9U1H2eb2d7aG4C8Upi5z7vlaZP5I68/1WV1/8LL5Jz9/WEaO/9xpwmmqGe8OoEZglZj0b3eacwu8EjTfhm0BpaEtsjtoSF4lf+5Qug5gfqtGgJHzc2Gb/kM8AdF4NxnmOV8yKDbuRv9gbSDVL2yZA+6fMBvg6HlHWtA/OXSLR6ZTQcmj/3r/HIMeXICwfMrhK8un5/0jA/CQBLmstIT/+iFHneGPUWqTClpxEq0h/8Y5780C2Nheg4gf3axYEWwSmg+X1BBx5GoRm7XamDplsmqf5D5v8ney25rF2DzWfOQlNrq2GBF3QkzAwnZzM7M3QfVBccbFmyG7qqeOiFXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Um7YxCGUX/znCYiTXaHI8iRtNDMOT3p17B5RPSOgwOw=;
 b=bhIKi/LiJMa9FB42dybBqHy4lCDl5fzkmUc1fC+tIbljkuuP+hXzOJHR/E4hH5sOaOM/nOsTngPAJ68UuivQK4GKfnIqVJ4qqXO6LoE7jUbLz9/Cz6Tf6brUrSyHoVHt3YhPLjfh0Fw38Jfv5suAHJiMRpthvbyZolZ9HyWLpz8DMCsEIRXQ/yQ3ID0FkiTvTMzHt5rxahUTrfqU6G5D0wbQqiplZMroqggka/ct2ddkq//EDJfAsj+G4NW6/GSwUWFRp09FRLk2AcSDNPLkImZqtBWiQ9sNnhIQovcquYaU5Q+a2qyXYE5iJnAa91MDVF2zKy0LauO5ASyCEd5VWA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by MI7PR04MB114164.eurprd04.prod.outlook.com (2603:10a6:290:10f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 01:45:22 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 01:45:22 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/2] arm64: dts: freescale: Re-enable A72 cluster on
 i.MX8QM boards
Date: Thu, 22 Oct 2026 09:50:00 +0800
Message-Id: <20261022-8qm-v1-0-2a597cb3debd@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMlr2WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyMjXYvCXF0Lc9MUgySTJONU8xQloMqCotS0zAqwKdGxEH5xaVJWanI
 JSKtSbS0ATFjAAWcAAAA=
X-Change-ID: 20261022-8qm-875d0b4b3e7d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux@ew.tq-group.com, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: MA5P287CA0133.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::7) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|MI7PR04MB114164:EE_
X-MS-Office365-Filtering-Correlation-Id: 52b5de21-c199-44b7-0a2a-08df2fde22d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|23010399003|7416014|10067099003|18002099003|261021123027099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: a5WTakVlEiU6bZrWTt9Sk5FMBiPRing10lqi0d0r28eB/O7MQd+pg22EScph+IXPBPPCQdb+pc4j5qgMXu+8FFT3a3wxIKoqaLrhVJHlY2NHOpZ7R+WcQofs/EMmY9dR9TnoPQr8XDzRGtO4TvFr8Tlvzjb5TkdYgeg1TaEvHk9A+Ij1jwHdXBPJb9Qqrt/Uj8e8WVpx/dflc7bFlMve7sQCxAPLE8xpRnIbm0W+1oyFJx7drP0xPQDPGDnfW2nsuOLfeUOLH6/d/gM2WFq04/bA2wSGB09NteyfcQdoEfTgHOuT8Kg9ewIhmZpStPS+OJLq3Pk8sWPca2Qd+zqGyfWEQGcbka4bwgkfu8RsyBw5eWCHsV2lqUCDMK0cJEwNqkxsXeOpVREds768NVj2U3gmbpNV0oROPMCVgMn+3X0ElIlFF0JRXuQAIWoNFu+0WePzc9xG37sFmpN5QJYEXM/BX99hTRXBBf+DJ6PGsDShpVJTguuQqrTITbD54T5e4KqA4gLzQI5bceKY6zjpJ3RknFVAXIj0/WTUslBlpMC8rPn63CDbyqhM8mphnIV9kZh8HzJHVG4/zKKCq2G8/WUbGhs3NUjt/Cc8QJFwgrTmoCojLdoef3/Hr3Qrmwxrgtjbhc3JWaTTtKqXZNxFouOtbpkueDnDEN+MbI5DTNg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(23010399003)(7416014)(10067099003)(18002099003)(261021123027099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDdZT1hjRkV1MHVweHBUWERFMkp3a3pWTmx2ek5oaEt2NTM3dmZoRExSOXh6?=
 =?utf-8?B?WkQ1dWRiMW5oMGEyN0tZOHluODlYYkFYQ1BiNGwwSThRblZzYW5hOTJmTEVJ?=
 =?utf-8?B?U0syY0lwc0NUdzVobDk3OWs3cXVYcTNWMzZCa2tNamxPemZiaUhqYjJFb0N2?=
 =?utf-8?B?RlFCRnF6WEtIU0JNaHNYNUYzRmhvdEhLSytpTCt5dEtrS1g2azR6QW92N3k0?=
 =?utf-8?B?OHdOTGhURm9BMHJ6cGY4L0tUQ0llMDZKNG5zK1BQalZleUlzQ3FMNWhuYTJU?=
 =?utf-8?B?bXNsaW80c2l3RlN1VU9BMmRtUXNtWnhQKzdOWDc4U1A0VG85Nm9oNkVSN2RQ?=
 =?utf-8?B?bEZxQWdKQ3NUYkpQSnhnclFCb1VacXhDSDR4R0IzQkhTRkd4bEdjcUZDU0k2?=
 =?utf-8?B?SlhNYUU5dzB3c0pWY1RxbzBML1NJR3lMWDExc29RNDlYSEFzaTVSUlIraHJW?=
 =?utf-8?B?R3pBeGp6eVhkYlFUNUNEZUpZVFhyTU9USDg4MCsvS3dHazg0NGF0VHl1M2Y4?=
 =?utf-8?B?YjJCcThWNmlJS1k4MlpNM0FETzEwaWdQVmVxNXBaZ3RPQnIyaTNiaWZiNGVT?=
 =?utf-8?B?VTllQjh3UUc3bHpZYzNUd0YyUTd2SmJucHQ1T0F0UytvNC9QTWJ0cFhVY3NZ?=
 =?utf-8?B?aEhNR0RkdGtnRnN1VHNPbnhMNXZYMng5WlZHcitRMGVlVmtaUzhGcjhwODJR?=
 =?utf-8?B?VzFoRXVjK0dPSFNaTFJBWitXd2U4L2R6K0lPU3U3QWpyb2cvS2ExWkdVbm5z?=
 =?utf-8?B?Z3d6ZGFwU05rWDNwQnphc09VZjI0OVFKL1dIZ0dKR2JsR0N3TEdVY1hsOFBS?=
 =?utf-8?B?djNveHpQWTBoN3JvYU0yUDhKbWN4a3k1NmF4RHZmWXhDZGJzVHJYYjIvYklB?=
 =?utf-8?B?ZlRIcExlS1V4b0pmSmFZVmZaNFQ4M05JK3FlS293SmM5c0RtQ3dlRXVEZTVJ?=
 =?utf-8?B?bmlvU2lKZGozam82aW13YStwRHlEYWFiMFg4UGNoWXYxc29qbWN1aWNxOHZm?=
 =?utf-8?B?b0R4cUM4NjRRQmJ2OGFBVTV3TWQ1OHhuSW1rQnBQQmMyQkhwU20xVFozVjdR?=
 =?utf-8?B?cjJKbFIzTDRhTVI3TnFLUnFaZGtFazFaVThjNkIzTVlLTC9vcmczc1pWNHRY?=
 =?utf-8?B?TDExVE00MXhaeHllN0syOUduY2lXcEc3VDg5WDVTYUkyY0I2cCtVaWh0VGlS?=
 =?utf-8?B?L01Xd1c1R1p3TC85c1VyektHVVlMaTdqQjhOVFcvRlRGQkxtU2wrSkFsRUY4?=
 =?utf-8?B?WHNEZ0V6R0o0Q0VOUmNKOEp0SHZRc05HVmg1UnZGYTlkYm5lb2p5Rk1DY3k5?=
 =?utf-8?B?akxNbEZLVUE1Qm5qc3pOZEhrQ09lV2VjWmJCQzZUMUtqVWdhSERTWVMwR0gx?=
 =?utf-8?B?MmtBcVVSS3pWUG5ENXN1dHJSMk5oWHZydXNRQTJaOG5jNWt3aUdIQXY1OVlN?=
 =?utf-8?B?dlF3b0VtOUZGVDRxUU5TSmEzM2ZMRmx3QXM1ZnhYK3FqMEI5b0pzMlZVcWpO?=
 =?utf-8?B?anJOTHVsdlpxamUvV1Fra2g2d2tuYWZnT2ZIWHdXenQrNTM3OHFFR1FyL2xQ?=
 =?utf-8?B?QjRQQ3VDMURwL3R3WGd4cUxPRmFzeHZoL0t4Y0k1MTNvMVY5TEsyRllIc0Ir?=
 =?utf-8?B?eWZvdkxuTXpLQWhnY0o0eE8yYU1sdW9jcGxLaytjdjVSeXg1MFR2WDJjN2tF?=
 =?utf-8?B?ZFBzVEltRS9uRXdQbGVvc2owNkpKMWtQVEhPeUxOa3ZGV2xocUxvL0pTUFZK?=
 =?utf-8?B?TGhDeitaVFpsdmQvdlJiZzNhVUtqTnR4OHBCZWJOSjVwU3hTTWlLVS9POXRu?=
 =?utf-8?B?VEpkd2ZEUlZJbktQWmRyOFVERit3QktDQkxTWXhVTXpHdUxvN09oMkk5dXE3?=
 =?utf-8?B?MTNJRDJWc3cvYlh5eFhnQVB2L21qWExjOFhBTVNDVFU3eXAvMzdlR3VYVHpr?=
 =?utf-8?B?eW1hZkJ0ZmxwSzN5b1cwbUh1RU85VWFVRDhYbVQ4YnhkSGRqbDJJU3h5UXZP?=
 =?utf-8?B?cDdlZDdUUi9kZHM3VWdTNW5lV09hbEh1bktjdnBnWWFlV1dtMFM1MC9vQ0tv?=
 =?utf-8?B?RlhLREpnaDlBZFJST1VLUFZWRHVyT2hUMnVNK3BUSUhUeE9UZ1FwazNCRmdl?=
 =?utf-8?B?L3Z2a0VCK1BqbGhxUWRFQk5JOUloZmVXZTN4aHBGeXIzYVpxLzZKRkIyYjBR?=
 =?utf-8?B?dGpxamVpUmlCU3NFdzA3KzBidVNFZnZNWHoxSS9YdXBjZU5XUUFaOXFCd3Vr?=
 =?utf-8?B?NzEwU0RDR0ladnA1R3laUFZ1NitiUlRIb2NiL24wN1hObHZWUXVyY2JwUkdp?=
 =?utf-8?B?bG1vWVRQWU5YRXdOUWl1Nmsydkk4V3pqSTEzbDNBRnNrMGM4RkpKYW1jNkRZ?=
 =?utf-8?Q?uzYmxxbO9jZJahhOXpeWc1Qzjs+hnW9Nt5H2g?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52b5de21-c199-44b7-0a2a-08df2fde22d2
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 01:45:22.4533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IvWfpiGE9MtJdn7u4/2IAcyKLEGBsRejXy97+Dcnn8xJJjciKqXRcJD5D2a3+lsfKXTTK+BNklpGgo38SB/oPiI/dDkujODqI50dClJxxurKsxgKjQ/s9+HhlrV2sL/f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI7PR04MB114164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_184528_965658_2FC27FFC 
X-CRM114-Status: UNSURE (   8.15  )
X-CRM114-Notice: Please train this message.
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

The ERR050104 cache coherency workaround for the NXP i.MX8QuadMax and
i.MX8QuadPlus SoCs has been merged upstream as commit d44e08dab27d
("arm64: errata: Add NXP i.MX8QM/8QP workaround for A53 cache coherency
issue").

The workaround addresses a hardware defect where the upper address bits
of the ARADDR and ACADDR buses within the Cortex-A53 subsystem were
incorrectly connected, causing TLBI and IC maintenance operations
exchanged between the A53 and A72 clusters to be corrupted.

Before the software workaround was available, affected board DTS files
worked around this issue at the DT level by removing the Cortex-A72 CPU
nodes (cpu@100, cpu@101), the cpu-map topology, and associated thermal
zones, effectively running the SoC as a single A53-only cluster.

With the kernel-side fix in place, these DT-level workarounds could be
dropped.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (2):
      arm64: dts: imx8qm-mek: Re-enable A72 cluster after ERR050104 workaround
      arm64: dts: imx8qm-tqma8qm: Re-enable A72 cluster after ERR050104 workaround

 arch/arm64/boot/dts/freescale/imx8qm-mek.dts      | 10 ----------
 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi |  7 -------
 2 files changed, 17 deletions(-)
---
base-commit: 4403278e4ea2f654f8130a5c03eb8b4516a0f201
change-id: 20261022-8qm-875d0b4b3e7d

Best regards,
--  
Peng Fan <peng.fan@nxp.com>



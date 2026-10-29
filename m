Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90C0606A330
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2YoUC82U;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=eXC7PON/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0yrRFZupSeP8ijvhb7G+BjpcQjLfQgnyREbQ4PtLPlw=; b=2YoUC82U2ipdeSL+Vc6N/3QpQo
	8qPy/f5Xo0MAC5tJsGC3gJv88XnGtNNTHvyI4f11ECYN4PS6ScROE+zmBdWli32Gif9hXOsSdhB61
	SqW61sddKSPg1ikzKsEbjYyt2rDAzgSlfn+OTsD74Bwq9xyvkC5FjY4ifXobbddAgQbm6LzPNbzTV
	AFdskgzxSD9KT5H7WTC43trkCCzEOwQ97CGoYklkBHC4iSVzUwD6UwUbwc2hF3ocFE7iJ2ifEpyWs
	FtuaFmOnITsnX8raBoLPahsU7T4pLJZMJz5da+IdMNDtVkOnko/8EOA7lKs7Gys1Qn5evWSi/lhnn
	UIe2elKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQS8-00000009P8h-2np8;
	Thu, 29 Oct 2026 13:46:00 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQS4-00000009P3W-1xdD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:45:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bL3nOoEOXhbGowilKHeWVXHhU5t2cC2iqOA99JUy0g+YoO+bqq/+PgwljmzxxnFk/Eo9X+7WvUH7SaRaKuNSOigF6Hs4l8pjpVuCdMqNA2Wyaw5K4g73Iihsb8PEbYyN86y3aFQUgkxnbaYEQ3HzWm692W3zrMPxZuGrOdixIiBKYq4ydAAvfAPt223U2AjLq1KznTLmdahm3Y2E7j+NoxvNbALuN8jZM2AtannjZyfhHBlfELlFqGJCIa4d0AMPZfyLw3o8lwidKZrhAP9B1kS43Rbd2eWLPkLdKM0M9O6nkoiGAVslIM30IpSNL+7W6tILtOuNkX8bFnFdVVIBuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yrRFZupSeP8ijvhb7G+BjpcQjLfQgnyREbQ4PtLPlw=;
 b=Vfk9VedarIH8WkOol+55bfZr83FsuD6RMnJZJTwkXzUwbEI8er0N3cpVTPOKZThrI2uGmBQaiH4OF2b2KypQ6YtwAF7cvSQeMW/CoD9qfaaS5zyqLPB45hRVptaIzmj0iIxGg6CnGD5NMIWdUVoq9HFTxMN9YQHDdGul2cfMiK52p1JPd56U3Czhde5VeCXXsv8/5KrBBDdBP276ZJYCbCXs/TmuuKBBRBMHjsj5aBdsfJ5PKesyTiqx1T9ld6/WCoXkW3RNjJB3dQFfEA8hzGxkOhhGtwixJvrFu/ksRMZ+ON4+yz2lCvIZECaOyyoeG4TI6g/DIq1ef0JS21DVWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yrRFZupSeP8ijvhb7G+BjpcQjLfQgnyREbQ4PtLPlw=;
 b=eXC7PON/pjtpXg/h08feuty8y8x9Qe+kSbkdpT5LPXlCUxTwjYt+BeuTs2dNkf9R8EI91Z5/A3RKpbgWrf6oR8Zeqr8HUVYWRS7iX0cvGOPTdV4lNQ1U5TCdHtRE272gdkftwxtuB1JWRP1h1IBiSr6ZKHnXT4OSfbW7BJLqcK7p+HCEnu62Lr/Z7F6HQlrk2jSqWYRI3Kbj+iSJu68jvdFfr6JfuK2hYKl+49F6/lDHfSZFZaYoGX4axntV5rNibKwzj2jF2pH/H+FFrPADjvl85YNLLDCzkqyldRt0NcqgVR1JmH9M7ZzMzrcIIisiRuBb3nPcjCSu6pdMK6BBqQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by MRWPR04MB12355.eurprd04.prod.outlook.com (2603:10a6:501:82::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 13:45:50 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 13:45:50 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 29 Oct 2026 21:42:26 +0800
Subject: [PATCH 02/11] gpio: vf610: propagate return value to callers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-gpio-vf610-fixes-v1-2-45b484b4c434@nxp.com>
References: <20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com>
In-Reply-To: <20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SG2P153CA0042.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::11)
 To AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|MRWPR04MB12355:EE_
X-MS-Office365-Filtering-Correlation-Id: 97c9932a-4d1c-4021-0528-08df35c2f193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|19092799006|921020|11063799006|56012099006|10067099003|261009223027099003|261021121427099003|261021123027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: jodNvi81OiBfblCR3Vx//HU7kl0nLeACqOwNr6yuhRcYXRrInu/C6D1Dc7KyHf2sBx24X84r+8SX6jS4jHqBBaq+BHKWpbrFss2ZuOY4WcJZkZ+OzV7ANGkNT7NwX/vqGR0v3f719yimh6Jv8KaRQ2qu1DQ4XT2RkYqODpw3EEs/gr/+WiXRMZdUOi8m6zhN99syc9Wg4g4NBzMgWqrkKvVd8CmOh62fxdoHnepCAepxePjnFhdQLQoK/LUmbBxWuPTVz9Ghd+4Q78IFADjyPNL0gMv2dAt/Lthi+uadEJdmy1s+kQiouya1MQx86S4G72BS9F/LCQis3FKJXMSKl3TfSb7PMvkefj6bmrgGtfzjNBDT2CqAZLZfd1d9gQxhQ+ZPl/plNnoAxaCWttMKyqA6o/8HNe25Sn/+gepA9Rz1p8jZaF74OJOaEQSWrwoheG+5Z/lCrhF5sr3JVWYwwCRynGneku4EIG7VGJo40A8BSibrVuHuKil3YIS9L8iSsOt27F1UO3Fv5Nq1rG3DvJN4ZYkc5sQadRfpRMDpz35Ghr9sAZkzJjWMzScQZLErmNsIlgisKaWxQZI7gtp1yM5KgpwaCvKSz68TBGokMaPrKv1gCydR06aQMG61BvzhXGt3fAmooXcde1UTw4AYzshlewih5TFAw+QUP7wZmnX1NxQXUOBVpjbe+NuxeS0GsXwNLgtdCdirhZDmonW4hg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(19092799006)(921020)(11063799006)(56012099006)(10067099003)(261009223027099003)(261021121427099003)(261021123027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmJGemhKdjJjWXJDMHBtSC9UMUN5a1BOY3E5dkpVQWJ4c2pjZGxqWGtVMGNk?=
 =?utf-8?B?MUl0SnlPb3NqR1RxSGZEc0c5NjgrejRxL2FoVG4vSDR5UmZoTU9RbnZaNU12?=
 =?utf-8?B?WGk2aHgwVEYwM25mSzlyMXFWRmRseTlZV1c1cG5ucmprdUs4RlpVTUlFcXp5?=
 =?utf-8?B?K3RlZG9wVkNwMlVYU1JyQzBTTFNjbkRkYVhRNkY3c25QUlJOUGNtSTVwV1Yw?=
 =?utf-8?B?dmVwdXZ0UVpOQ041bXFBYVZ4a3JHN0dEL3NtNmpqdEduL3JOUjRUenNkTEM0?=
 =?utf-8?B?YUxpOFBqTXFvUXdvWi8xNmJQR2pVN21iSWlsekF0clJqcDArTlJoZndRaGZC?=
 =?utf-8?B?YWc1TnFLTnlLVW5JSEdrZlZJQnZ3aEZzQUczcGFCYU5GWFh5NjhiSnV2dDVY?=
 =?utf-8?B?cTkwM1d2dUs4Qi9BSlJ1Q3hUbHJVaEJUQ1dEdWdZVFlwR1VobTlRVmxNQ1hS?=
 =?utf-8?B?akZDV2ZkN2NFNitFRVY4N1Z3MHU2SGU4QTFabnlEa0ZTZ0JLcVhOUk4vM2xu?=
 =?utf-8?B?emtadkxmb0xUMEZtbE8wVzNwUm1sSUVndmdSamRVSVZ0SDFqbVhRTGRCbVdL?=
 =?utf-8?B?djZSYUVHcnJQd25BbkhnS0V6bkYyMUVhU1JvZy8zM3ZTZ2x6Y0xFSE9vS2xl?=
 =?utf-8?B?c2tzZGpxd2JOeklNMndzQjVqd0FvY2tZYWxZTUZBUWZmSk5VR1VZZ3l4WkVx?=
 =?utf-8?B?a0hjcVprbERicXNvblRsUEJXTTU5RE9ZV2prUUxvcW9URUI2dTMrM0o0TDFI?=
 =?utf-8?B?YU83dzVhbC9SYTRYaEdzby81TVQxQkFzeCtjMytJOVpYYTRjTnJVdGI2Rlho?=
 =?utf-8?B?RnI1aXJ5VlRHd05zWGpTSjJDc3VoTlNrcHp2OTlua2dJM1g2RVRXM09ibzN2?=
 =?utf-8?B?ZXNibi96QkRlVkx3TG1nMmtEdGNnZEZ2MlkzcWY4Znl3clMra0t4M2g2c3cw?=
 =?utf-8?B?TWs3YTV6WjNSV01tbTNoN3hqT2h1MmxkK0VtYStCckQ2VERxaDRRSXdRVEVX?=
 =?utf-8?B?Nm5xdmFnbkNtMGJOeDJZYUtWeGR3NTB1NzUwYmJ2MzNHR3VvellQOHVxbVFS?=
 =?utf-8?B?bWNFWXliMVFob2dtazRWWTkyb0FERFhMQm9EZ0ZwSkRGMDZlc3hwNEwxdGdw?=
 =?utf-8?B?UnN4dHpxL3o4cEF2V3lINnNiVjE0TGhjUkg0WVhBN0o0NFVkb2xLbk5jSFds?=
 =?utf-8?B?blUwMWEzOWN4VExxZERaTW0rOUEvQVBHY0swelZJK0xTV3dCN0lGeEw0KzUz?=
 =?utf-8?B?MVMrcEJkREVydCs4ZGgvYjNoSzVDc2RlQmZCZmVmN01tekhYSHV2RXI4WVk0?=
 =?utf-8?B?c3B3eTZ5WTZ3c3pNTXJkNXArRE1ESENYQ0hyWHM0eEZoNThoWmlvejJ2anlj?=
 =?utf-8?B?U3FYNGFNMXVQWTNPdytMeTQ2VjhkbXlkU0dna1pQT011dFNMNHRRWTFvMmNh?=
 =?utf-8?B?LytrOStWMVFqdUJyMmRud1VnV3NNZ291MzhzaTREYjFtRVBQR0Q5RTg1T0NT?=
 =?utf-8?B?UlRDWlNwVXVPYkVoNGY2TldOaHZmUjdXcjVhdUk5SEJ1SzZ3WDZQRnZzVVpP?=
 =?utf-8?B?K0syQmRiNysyVlFHdkREYTcvcVY5K3ptQTBVQ1U4UzZKK3N3ZTRJcGhXVEdz?=
 =?utf-8?B?MnRoQ2dISHdhQW5lNzBadmY5MGtXaW1uWUtZdDdtenpjK3ZZOUtUYkw2dTNW?=
 =?utf-8?B?dGhMUDF1cThrK3JIZ2tWTWxzNXJiRDRiOTJoRnZ6Nm5PQ083NnVsNk1CTUhh?=
 =?utf-8?B?Kyt1VitzazVXNytpMU1SUEVGVktCVDEwelhVbUdpOXlISWtBK2hvNXVHR3Zi?=
 =?utf-8?B?ZGlVaVRmMHYyVTZVWFNqNXd0RlBrSTA3KzhVK2huaEp5TEdvZE5uejlzOGtJ?=
 =?utf-8?B?dytxdUpLYUd3VmhKZmVEb0dMWGRuODBlUmc4OHpiUUVsK084MHdKNGhvK2xl?=
 =?utf-8?B?ZHhnOExHSjZ5UlMybHg1YytyOXBaS2RhZld0SzdXNm9NT3YwYTJtTGN3YmRW?=
 =?utf-8?B?TnZqU1hadHkxOG10VjlaVTVROHU2YzdreDgwN1M2TWJKeEtiOWhQT1JNQ2ph?=
 =?utf-8?B?SXBIZE1zeCtkMG5rd1ZJYWVJcFVaYzJKMlU3aXFwUkFGQXpMczVEV2VWVUdp?=
 =?utf-8?B?c1QySVRSVFBxV0l4Uk4ycGdac2VwRCs2U3QrZmdWWjhBcFZadllKMXNiUHdy?=
 =?utf-8?B?TnVIb28rN05nVGhUa2FCYkhKaXluZ25nMXFLWkcxTUNvWGc5Z2FuWVNCLzIx?=
 =?utf-8?B?Um1odlhVZXFyQ1RRSWZQNjlaVTBwRDV2aGt0RE5kVXNkN3NTZFkxc00wVVJx?=
 =?utf-8?B?aG52RERpckcrZ0VvdEVtTm85R1cvUGZuQkt1cUtzOW5jQm42MG9QWGFRQVBj?=
 =?utf-8?Q?KI4joiFliX0uwZy0c+Q9CejCqwILYKltdr3PG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c9932a-4d1c-4021-0528-08df35c2f193
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:45:50.3874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DKSBwehl1o4GFTWhsefRYZg+HNmxd39lU6NjONg63ZjCOPWdK4VpWF1YBOFykmXLu9d/J35d5XXzzn6ndPGypD+iNHmEteHwXUfmkDoWut1P7I5lbdA0K3dNxu7bKANy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12355
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_064556_540866_8CD38512 
X-CRM114-Status: GOOD (  11.90  )
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

From: Peng Fan <peng.fan@nxp.com>

Fix the return value handling in vf610_gpio_irq_set_wake() to properly
propagate the return value from enable_irq_wake()/disable_irq_wake()
instead of always returning 0.

Fixes: 7f2691a19627 ("gpio: vf610: add gpiolib/IRQ chip driver for Vybrid")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-vf610.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index adfa2c2d5873..44b846ff1b93 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -188,13 +188,14 @@ static int vf610_gpio_irq_set_wake(struct irq_data *d, u32 enable)
 {
 	struct vf610_gpio_port *port =
 		gpiochip_get_data(irq_data_get_irq_chip_data(d));
+	int ret;
 
 	if (enable)
-		enable_irq_wake(port->irq);
+		ret = enable_irq_wake(port->irq);
 	else
-		disable_irq_wake(port->irq);
+		ret = disable_irq_wake(port->irq);
 
-	return 0;
+	return ret;
 }
 
 static const struct irq_chip vf610_irqchip = {

-- 
2.51.0



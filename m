Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F56C60A2633
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xGlC3wvv;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=G0DODvER
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9iRvSuwf6mJVTWpR529GutK7+dWh/wKMGBnvBidJn0k=; b=xGlC3wvvGDebXS5DJ0BgCFKSZo
	kUDK43QascDR7DeATQxtOHt3/kAkvOh2jbw4L6a3nsNQtLQ/Kbu/WAOpkVVCO5hHTXJzcPTqQoVVN
	7HASTU2E2gVcQD4WLk5kj04ArNjJvQU5bEVaPceZm1MzDDQhvVJfGYXdq0pbYXJbqZy0RrLZL4Wbf
	qdmsJTDAHOQxPEq7TTAg/qwY87CXbZnEt+3eVZQA0mYNhzxGnVrhpKsemObjESf3S+DPbM7h+Eds/
	A7oI3soiyRf2D9nwnaxJb/Oy28vsWEXHQ3WENNnBM1lokS6zqOEeFfPPVb+Vl7iM7pRr7D3nC8R5k
	joa3HbUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQSn-00000009Pbh-2miC;
	Thu, 29 Oct 2026 13:46:41 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQSf-00000009PUi-2ZKd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:46:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b2A6LxlsOOX2jnffwExNThrJQwQXQv1FBWFiiIyluz0ywRf8mc17JB7AduQauX26hkeYMxQX3evTH7I/qOnrCupxALWfKquNzNCcweFjANpaiZP4uor8NXV06xQAoN9Q1t4swKSmULibNkUq+DZ7yHA+hoa6rCt0GlbrBcw0Q9SVtvfEb2xmX2zR003UjG4yVwWMNJK3kYCK2+1JzZb+Ix53pqgOoiI+QqCBg/SQgnSeaVx+k0Z+i2RFEFiH0C9D3v6nNTryoqMaF3kaYgPQxSOQWiSBBTchH8kKJoCpjoOjYCPv0OoJFWpjAZOXqIHp9+vhR0cD8N9GKCaK3WGjRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9iRvSuwf6mJVTWpR529GutK7+dWh/wKMGBnvBidJn0k=;
 b=rsUgzDdpKH22S110FiunvTOht35EIeiqPKLYqEvByrDPvGqmpp6rJ5F9w81DtY2HVa8jf3tCML6qjyCtZjruaWfVM0fkJDY8rt2bWvl1M1FjkUTfZLSWUcZd1vAYhJEPwWhYilSbcvU3sjK3aFJ2iLGaRGB94881fW0Z4Vzuwe3K8NRI//YZ9bZ1oRIx37CclF7ZeQTMJ0349YzPPd9cI9RqMGbDw26KEABaOAncraev/ktAof4H5zTCjgACHrEufe1LXomRbeNXrDO9+isRxP6WaS29xIDtlVR/9khPl6+BQL+MzXntaQlF/eqIFtKPs7hcPzZ3h22mWYxp7bEybA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9iRvSuwf6mJVTWpR529GutK7+dWh/wKMGBnvBidJn0k=;
 b=G0DODvER6JyZ1tQgfqfcK/qTNoyUPNW68rLgdo2doXlI9JKugTeaBXcZuU9C74c/3zRBWUhRK0PVXQARAVsFXNuEqRdWaQ2dAk5SvV5T7/IJ/P5g8KZfl4mzkHXgUaPn+8G2f8gDgABA8kMyc4hAUw9h49uBtxkoKvWGCGepVow/MH8dsj39Bg8zZfB+rI3HJ9I6tIcqNkLKmzGruJ/lc9aNdqvK8FGhB0b0drOwArBzAhsVgcI5TyREgAlVeMeRaPI4SNY2ZuLSMwxMCwC8+wg4rp8CM1t3sQUC8r+udzMlMsx9WoOwXsc3owqBLQuuyXY3GOQ1N2+pxHTf7cKtOw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DB8PR04MB6892.eurprd04.prod.outlook.com (2603:10a6:10:113::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 13:46:27 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 13:46:27 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 29 Oct 2026 21:42:32 +0800
Subject: [PATCH 08/11] arm64: dts: imx93: fix gpio clocks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-gpio-vf610-fixes-v1-8-45b484b4c434@nxp.com>
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
X-ClientProxiedBy: SI2PR01CA0040.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::14) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DB8PR04MB6892:EE_
X-MS-Office365-Filtering-Correlation-Id: 98b7e314-fbbd-4ef0-668d-08df35c307c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|19092799006|921020|11063799006|56012099006|261009223027099003|261021123027099003|261026121527099003|261021121427099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: iQQ/4NVzJ5cKJ163ElNkm1XzG03qAy135R/pIHU5nvNPgfQI4jXIfV84KUz/FR3VJcMxre2qQyDjC4zTiglpmLCZqPN6mi+J32ZKGmgJUqnM2gS1jFcthx3YGkho4OlxYcmqA8Smk9aQOD7h+w/FISwfWR2kVun5h9O1KNxtMQeZp4fP2cOpT2yk2NHT3oo6wpl0jZLT417/XZ24ecQ78byRDy6Nq0elcRwASxborw4Cjij2ZAEe26w4az4IDEZFZGy68H1A3vjyY9cmP3UE6DsYJMZvWF+RYJh0ay19Ndb8Xa1yY7kNhAbGeKa5CEEB3N9HWTDzAZV3mz1lOVHGPewptBdnPGJmBPQw/CgpMFRai3DwIIngphAJTJjiT9nnOLyN7tdGSNkifFgg7KCd+xCgb2R0qUmZvuXh2uHua5+r5Svh0mdOHxWKwBHGq4a74skuG6T+TrKbwbNPNDYLhfaI1eyn14yP3Ntv6WdGdoohGNYbwyUf3EymyDrqeN/NGBZolryKqH2jN1XM1UwkPRFKcY6Lf8WPqtAbEUOuy6gIY66TRehQDeu5ZT04HlmnJCEeXBAyt0/Trg7N7QQM2KiSP4azE+uRbolHAOuseaSH6ueSmh9lmnEmBI0jt73ixNWQ5FA1VF+T7iwtoy2M8CUy7lTOQQPbcPaajKFtmniPFIjZdoRw81j5yu+ppPoqdLMgu/GuHKwyaSIZvfhNGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(19092799006)(921020)(11063799006)(56012099006)(261009223027099003)(261021123027099003)(261026121527099003)(261021121427099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmFIOS9OVS9IQUhFTVgxTmpGc2owcGxZZDlOdmRSS1QrNVVDUFFpNkdxNncv?=
 =?utf-8?B?RjdMSkp4NG9TcE10a3pwYUZkL091MG1OR3gxY21WczdwQngyN1Z3YWE4R1Bl?=
 =?utf-8?B?UWNTUUFmbi80a3dpRmdXL0N6c1lGZkNQMWRNVC9KRTRkOVZDbEo1TGxUeE9j?=
 =?utf-8?B?Z3llZmx5SjduYk8wNXVja1ErU01zR1NpaXJCcmdtcnl6VENHU0pHS3JWNmJK?=
 =?utf-8?B?QmsrK2pDbUd3aUgyOGowZUlQRlMyNVNNZG5relg4Y2JmZHBKcC9nb29SSTZj?=
 =?utf-8?B?UjZDbFh0WXNGQTdhUm1JeHJPZi95MmZUcjVHeHFHR0RZZEIwSlJyRWIzMkRu?=
 =?utf-8?B?bXhmbVZib295TVBQc3gybE1NamNtTUE0OEdRTlNDcjFRL0x3bHVEWEZmcXp4?=
 =?utf-8?B?ZjBSZTFmUjdHYzlRWWw5a0VGeGRCYkJaWkVnTld1LzVSS3Zya3JWZzhiUjYv?=
 =?utf-8?B?VlpvZ3hJcll3NTl6T0xmWUVYMHVZSmd6SEV2N3RqNEpxbUwwOEVrYStjZlJT?=
 =?utf-8?B?MFFwYlh2amxKYTNjM2thMXl5aW5ZQmh0aEYxYjJ3ZGU5TmEyeGQxYjF4eEtI?=
 =?utf-8?B?ZW1TdWNXT2xacit6cUJmUklobHVvbFgvVlNRVW9ZU2Z4RlE3SlZEOFNaQVkv?=
 =?utf-8?B?ZTN2MW0yYnoxQ3p3S2lnWnFSQUdhTjAwc3ZMMFFPbERUSldkK1RIbGE0c2g0?=
 =?utf-8?B?dy91REp1KzRqb1p3WlVWaGJKS3VURjlCUWxGcUlVYkZ4YnJWaExVaDJUREJt?=
 =?utf-8?B?N2RDQzJVMjZ0S2FLYi85bklJbnZ4NC9VZW5RZWp1aWhyT2NIUEFYM05LOG11?=
 =?utf-8?B?Z0M1bzhyWTV5UjZmYXhHMGNtVEJhR1NhWElsbW0ybmdqVUs0M21BUHJJRW4w?=
 =?utf-8?B?QnVudW8xL2ZwZkJrVm5FWXVVSVhya0pIWU42MHM4a0IwRURUOVhoQkZLZ1pV?=
 =?utf-8?B?OEN0SVNmbk1ldm9wZmFycnlocUNXbUU5VzhyQkt0SXZJL2RIcElITUt5bktB?=
 =?utf-8?B?T3UvOURZS2FkbVdXWUpyZzgwVUFUcklWU2NtK2V2SXVVY29PWFNwWERYWXcw?=
 =?utf-8?B?VXhMWW9FREZqU1VUL1hBKzRkMzNaZmh6Q1ZvdFNkNGZ0YXAybHBGUzNqck5P?=
 =?utf-8?B?ZHRpODJZeWtoVk1yK2t2L0NldzJpRk15NDU3Q2FxRER0cUUrcGcyaVlyVWcr?=
 =?utf-8?B?S1ZQaWlUNDhqWVltY1ZjWkhoMXh3Z2Y2bzNDcjFzaE9CVVphK2pScjN0Q3FB?=
 =?utf-8?B?ZVJzNlFoeTNORjB1RFNsc3E3eFB0T1p4RnN5aDVqTmdEWTBFQXN4V1VrRktN?=
 =?utf-8?B?djhiTlZuZkZ1aGl4bUc4TEtEVDkzMytqemc1czFvR0ZyM0x1RytEZGQ1OWw5?=
 =?utf-8?B?YlBjdFF5NjFQVVNpK2dlRTE4YjRPMGFPRTFKbUVBNS9WZysrRjJNY29udzFE?=
 =?utf-8?B?SlBESEF5ZXlnWFVXMjVHU1BXbytabXlFelpPVUNtcW1uZW9KSnVnQzRiTGdy?=
 =?utf-8?B?dzNOWVRiTnVJb3JIbHhkbzZ5bmNudzNIaldKZElrRmVZUkFxZXlpaWVzK1cw?=
 =?utf-8?B?WU8vVXNqdmZGSmUxaFRxRDIyajJrc2NmU2x2ckh3dVBvN3BodzBreEhaa0wx?=
 =?utf-8?B?NFhFcnRXYUJtS3pjanRaVHo2NkZZL2V2V1FjeTFPQ3NrOG5FcC96SlZaK0NE?=
 =?utf-8?B?MVdaRFRwR042eHFXdVdmUjlVK05BUVhlVVF1YUM2c3Z1WG15RDk2bFo2R1dX?=
 =?utf-8?B?bFBqamhWUWlMMGdkTEErS3plTThqWjNKS2pBVitsdnNhUTVlN3dZdC9LY2JW?=
 =?utf-8?B?cDJyclFsTHJUNGJyYkowUkhKYjRUcURLbXgwYWNkZk5UY09pR2tmOXdoNVd0?=
 =?utf-8?B?UTlidURXdCtzUWtBK2dQVUMvQW9UQ2M1cXl3SmlDdUg1RFhXdjhxV3FEbzcy?=
 =?utf-8?B?TEZaTGZvM2JFRm9JcGFEb1dQUm0vbGx0MDc4VHlhRWY1VlBCdUV0U3k1OFlU?=
 =?utf-8?B?elEwc1ZraHg5bDZJd25hWDFOeGRBWkpOczVuQmtmSUhYZTEyUWM5K05sUXVP?=
 =?utf-8?B?Q0VEMlNqR0RCaE5KblNBbzNXWDU1OERROHdRem1uUExYNHN6QllXM1lHQ0Na?=
 =?utf-8?B?ZkYxMFE0SHl5WnRLWGExbVFEdEVzRUlLYkY2QlFmdXF1Rk0xZHBmcnUrdVJi?=
 =?utf-8?B?aFlRb0RjRjlTNk51RXBLSkVOZ2ZyLzZ6dytZcC9wMkQrcTRpS0paMnNaZHVl?=
 =?utf-8?B?ZjQySGI1a0JlNlFMWDdZQ0d6aTBUSHZZVjZyWXJ4QVhQVDhxWmhCUDVLSGhM?=
 =?utf-8?B?TlAvY1BqeU5GSlgvTWs5UnRSMGY4L3pQVUg5RjB5WWsvcDR4a0FFbFJmTldq?=
 =?utf-8?Q?NOqLtxv/sPSKhm1G+/TWO+z1eWueVBttMObXg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98b7e314-fbbd-4ef0-668d-08df35c307c0
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:46:27.8523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZJ4W/weNxf+cdLlEBTqGTlYHZN8wM4VKXaC/XhyzbDbE8nl2qe9EHi2Uro0+YOOXmnRLBEd/3fWVlNHgd9+QnWEImhuYcFHFjzqIc5xfa8f1t/16pSXYOUn1ZKWViEck
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6892
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_064633_676190_01418B9F 
X-CRM114-Status: GOOD (  10.04  )
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

Per reference mannual [1], 28.3.5 Clocking:
GPIO receives a single clock, which is used for register access and
synchronization with external pin inputs. So drop the 'port' clock.

[1] https://www.nxp.com/docs/en/reference-manual/IMX93RM.pdf

Fixes: e41ba6957139 ("arm64: dts: imx93: add gpio clk")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx91_93_common.dtsi | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
index a68ffd04ee08..cf73dab17637 100644
--- a/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91_93_common.dtsi
@@ -1034,9 +1034,8 @@ gpio2: gpio@43810000 {
 				     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&clk IMX93_CLK_GPIO2_GATE>,
-				 <&clk IMX93_CLK_GPIO2_GATE>;
-			clock-names = "gpio", "port";
+			clocks = <&clk IMX93_CLK_GPIO2_GATE>;
+			clock-names = "gpio";
 			gpio-ranges = <&iomuxc 0 4 30>;
 			ngpios = <30>;
 		};
@@ -1050,9 +1049,8 @@ gpio3: gpio@43820000 {
 				     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&clk IMX93_CLK_GPIO3_GATE>,
-				 <&clk IMX93_CLK_GPIO3_GATE>;
-			clock-names = "gpio", "port";
+			clocks = <&clk IMX93_CLK_GPIO3_GATE>;
+			clock-names = "gpio";
 			gpio-ranges = <&iomuxc 0 84 8>, <&iomuxc 8 66 18>,
 				      <&iomuxc 26 34 2>, <&iomuxc 28 0 4>;
 			ngpios = <32>;
@@ -1067,9 +1065,8 @@ gpio4: gpio@43830000 {
 				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&clk IMX93_CLK_GPIO4_GATE>,
-				 <&clk IMX93_CLK_GPIO4_GATE>;
-			clock-names = "gpio", "port";
+			clocks = <&clk IMX93_CLK_GPIO4_GATE>;
+			clock-names = "gpio";
 			gpio-ranges = <&iomuxc 0 38 28>, <&iomuxc 28 36 2>;
 			ngpios = <30>;
 		};
@@ -1083,9 +1080,8 @@ gpio1: gpio@47400000 {
 				     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			clocks = <&clk IMX93_CLK_GPIO1_GATE>,
-				 <&clk IMX93_CLK_GPIO1_GATE>;
-			clock-names = "gpio", "port";
+			clocks = <&clk IMX93_CLK_GPIO1_GATE>;
+			clock-names = "gpio";
 			gpio-ranges = <&iomuxc 0 92 16>;
 			ngpios = <16>;
 		};

-- 
2.51.0



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96ECA606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 09:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ADTA9h7Y;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=FOZ1QBNb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0/Q3V8H+HalEu5A2X6Zfztrxh8LFhqMqSl3QcBFW1g=; b=ADTA9h7YvGk1ECJHTbOr8iY7Xy
	QIF3hhAlWBOtyJ4tiX3HQlhZjNFw8COAB8aWXDwm76sepzbv/arzP1XQ59PT2gmSaf+SzaLAIj8SX
	oB0b99dMlZhDIfuDlkXNBZOFYfv4lbxYdhRM8AAP3QMY/6uo2gPdmjRY/ko2yNDWT47BX6karf3Uf
	qmI1ssVX08KQPX4ZGrVe0n0JSZ3qchFCCQrWAPqxsPmxWyb6ndhKm0qirJNQaQURCjzYCCYEWY/Dy
	cjEhXGWCRdnmJcOt1E+q3GeZNWfhf5Vgw9Kp9Kj/LLzkJg2Rr33Qb3hilfaj6X5wXm4Ss5qTb+CKA
	XrQxpCpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSDx-0000000BQbw-2z48;
	Wed, 21 Oct 2026 09:03:05 +0000
Received: from mail-westeuropeazon11010006.outbound.protection.outlook.com ([52.101.69.6] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSDu-0000000BQaD-2zoT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 09:03:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KHrUBUzNzTpODvIjIUpLnc/1biWwQ+2u40cNGDpKWImm0elMBT59bWhAKC55+sYgFdf5zHGUy3XCFUIZp0/QCjfRw3GhAqWGav6IX73iNkfoWq5gbOUUvrkwULojBiD0Fwp8PguCi20YgHEQ/GS+BikL8zKYgkofddC7qSVCqY1OQ92V5XpM1LKEOkRuVfjOAjiKDCiNIXbYZj8Q26EwB4Ci5AnTpmQ80m5AZ/QdHDmAyfsqkB75fAwWTlgrsOokXXcjaD0U7YUaJPXkVG4G+SO5vrkVW27VU3niNMk1gki/ayg+u2mtiXb25E/n7z6vCBVo6xdJItdHpy7VyFJVvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0/Q3V8H+HalEu5A2X6Zfztrxh8LFhqMqSl3QcBFW1g=;
 b=uVu1L6UAftkCtod1x2DeqtyYzvmX7pRRoczZbygNn/WO7x3Cu2mKACK1B1iBmZYOvaIkQOIu8i2WwKD9ezY/WRTIGCdGDWHdqSW6e0rKR/huRafhhyP44gs3u7+7LDuy1BOKqVb4gq47anu/qRNyKqYLgz9Zg0SmLe105l5idNC4OU3jCtpYTVHb+hfkFa7c9JTRl0kOeRuW40u9HIngcy//iNYhvwakCeZgv6pZpUfd6TrAO5DtFpwQe4bC7dk8x/W+6PBuGxkp79mmU71c3sGQATXtYEEtIhoIfdM0YGWEIJG3WjpvT9zxzbGWiUmWqN0Tng5haMTJHHahUL0RVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0/Q3V8H+HalEu5A2X6Zfztrxh8LFhqMqSl3QcBFW1g=;
 b=FOZ1QBNb8xSc9HszXa7FCjndqP66G03SLsUVMqTW2Zq4L/d2kABpc+M3zZZRLDSvUmudNTedBDD52RD0RdaiXV3n4HjWVxv9/Qai+0fGHgXp6sGyUpaPAQCCKhY0OHy3V2Y8SpPm+KuTgFPMsTsqjTKX3qvQGXpsy+YrAe6Iehyq6q4kDcgMgLtD4TCZqQk6H9QMC+j99KfG1XhX7AvmqhJeQYZXpnYZOdQz7kMUjwFUKH7UQiJ9zwp6W74zMBcd/6y2eQ2TPWq31ogv6f1Oh0xh5mhqXkTjoEGUlsvdDUG6SZN0RG9FH3h4/gyFU/MGQ3YJ5pJBtp6uhR1ur5krfQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com (2603:10a6:800:296::7)
 by AS8PR04MB7960.eurprd04.prod.outlook.com (2603:10a6:20b:2a8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 09:02:58 +0000
Received: from VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be]) by VI2PR04MB11276.eurprd04.prod.outlook.com
 ([fe80::60d7:a8e5:eb88:9be%6]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 09:02:58 +0000
From: "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Date: Wed, 21 Oct 2026 17:04:23 +0800
Subject: [PATCH 2/3] arm64: dts: imx8mm-venice: Move board Root Port
 children under &pcie0_port0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-imx-pcie-rp-stale-nodes-v1-2-db6590e972b6@nxp.com>
References: <20261021-imx-pcie-rp-stale-nodes-v1-0-db6590e972b6@nxp.com>
In-Reply-To: <20261021-imx-pcie-rp-stale-nodes-v1-0-db6590e972b6@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sherry.sun@nxp.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792573508; l=5032;
 i=sherry.sun@nxp.com; s=20260723; h=from:subject:message-id;
 bh=hhgW1XgX8Zpx7To8Gt4ZtnUa8rKnMoTro8XXemtPPg0=;
 b=pILm9R64X4QWyHp2+DXkkbf3xmfG/wATSG4BRHxDnYo2+XkpHE9Lv/kWm2FvdFOax2T3y45zx
 kMDKW79mp6rCgxPrjyHBDKDs/JAaiYxuft8kvPbNANM0QFlfyiFGLTa
X-Developer-Key: i=sherry.sun@nxp.com; a=ed25519;
 pk=YnYnIFJ2l+5v951x9shBVfHhminNi+3LTfFa3PxSdnI=
X-ClientProxiedBy: MA0PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::10) To VI2PR04MB11276.eurprd04.prod.outlook.com
 (2603:10a6:800:296::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11276:EE_|AS8PR04MB7960:EE_
X-MS-Office365-Filtering-Correlation-Id: 32811dc1-7875-4bdc-6232-08df2f521a60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|19092799006|366016|261009223027099003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: geX3GREHQegiLR0WP+JHin4wzVHaPy6wT7cpDV9fBp0tHH4Eq5Cc4e/5XsLeR2IjaHE/V9gDVN9D1BCwO31XeVMDrC0zyGf/yiQsY/7Tk56G1BKwXBuLw7AKkTagnm+Cu7dtwsS5NJIpTn5Tvw9zN2JbCUFfEiBHgykMmSK4vE9+dQPQOiXIVFhQ5VMWomSXo2H8AhwpmrVmVNnLNssAmOQ4bRYItdvyaJTBztd+q97itiBiI/ifbxmIhNFuJcMXJ5Q0p09TKDhqz+sbhccPdySk+/Ev7WrkaH5C9uu3LhHZH6kdHS54M4NybjcuTJ7jRtZjvy4zyhaPIKW6p7IjT+otj/3wFlOMScB5+JLpxJnuTwbNDC9ujQrCluDfCx27pDenNuYjm5YWsqHy14rOEebNftA1+p2B0FQO9zw5LXV1el2CYO0CE7VhX+sKN1of16Oz4ro1+LEKoZDoJrLE0gJBp1nqTRIwjBMeGe5noApBE+ww+n6JMCtjWvdofAkJRo7PZLsCoLEwprRiKYWAm89c1o+HmbfInvd5R9NRlYz0Um24f2rmpB27h9Gv+/Hn4jgAfOdu3j9NOIifVDp22N2OP8YKqMt/G/8y2BQ0U5gMdpSaAJA5kmziIQswwpxX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11276.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(19092799006)(366016)(261009223027099003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnVEdUY5T1ZDWlFNVFltWDFLUE5aQmlhRmc3RkpXRzMxdTNpS0ZQWFAyUTIv?=
 =?utf-8?B?TFBmbHg5VlhzTTJCdEVhaDhmc1BqVUVLZ2pMYlRQb2pibjhKSzRnS1M5dnpV?=
 =?utf-8?B?L3B4RjZKNFQ4TFZDTXlSeVBVMEhWRkxxSzB5VU5MOUNOcnpEV1RzeHl6Vis2?=
 =?utf-8?B?ZjZiYWFlSkltbDR2VEJYY0l5cVNJc3E2VjZicURCUVVZMmtCaGVBU05sQm85?=
 =?utf-8?B?MkIwZFlXYkpXeXhJTVpRUCt6Rmd2M3JESkNjVUxXdEkxeGduc1poTGdXWkJG?=
 =?utf-8?B?SjBDTXhhZTYrQzVMV05lTGg5WFVtOTBKbGR2WDA0VGFjUENCVFVPUTZJbXlq?=
 =?utf-8?B?OUtvV3JFTkt1UTVUaGF6VFRxdmFvdWJpZkZBbHduWUc5VXZIM3RZWGtvNktv?=
 =?utf-8?B?MEVNVmFvN2FydGNCNGRDMXFMRFFJdW12UFl6TzYxeGxrOTg4WUJsQktWb051?=
 =?utf-8?B?YVhNVzZ2djJzOGdOTVRnWWpxNVNwMEMxaEJta213d2lobTZNcC9nRHdRcnJU?=
 =?utf-8?B?R3pBSjFUekxsYjloT0N0cXlOZmgzZll4L3Q4TVd5ei9HVVF4RTlmNnFIWDdK?=
 =?utf-8?B?dnFQYkVrN3RIdWxiYW1nWng1VTRlcG5ISVFKbWZCdmwzK0QwYWVUekFOaG9B?=
 =?utf-8?B?YUlTSUJEb3hwSnZOUGtYNGVZVC80UW5LSm9qT2M4c1pjNTM4MEk5aVMvTkpi?=
 =?utf-8?B?RzJQQzlmNFB2Q05uUTZxSVVZUm5WdTh6VURBM1luZWVTZGhobmhOTDZ3WDdz?=
 =?utf-8?B?YlVHa080KzM0SGNpbzZhT3V3Skp4aWI3OHRjSXFESThkV1BrN1dKRGIwVUNG?=
 =?utf-8?B?U09BVnFyUE9MaGx0Ull4WGt3d0JFdnJNUCtOQm9lK29XWjVwNDRWcjcveGwx?=
 =?utf-8?B?a3R6VEJIVStlUWtjSW5Ia1dwa1B6QXdYL05mNUoxR3lkOXZYTkFFZnVBQ1Rw?=
 =?utf-8?B?dHFNekFSQUh1RURFZVNMemtEV0Y3Nkw0SE9kSzNlQkwwdC90QS9MZHRpQXlw?=
 =?utf-8?B?NWE5SDVmTHhKNHJYTEkxNGwxSG1VMHpDaHM2K1VvYnFya0JSS2xXMU8vNTU1?=
 =?utf-8?B?OW5TaE1oMSt5WlN4bzl0dHUvQ1QrbmZiU1dMRlNHV1JNZU1yWU5jZjg1L1FX?=
 =?utf-8?B?cTJ3RmltclRkN25ma2w2K1d2ZlJaTTJaWGtjZlN0NjkvWlFJSW1ENlhKM1p5?=
 =?utf-8?B?Q080eXZrT3pRbTdxU1pMQU9kRmowZUtvdjcvVlJtY0taeU1ieHBtVTZZU2Zk?=
 =?utf-8?B?TGtXbzUrWFNBL2hMU2tDSGZHdnJvRDk1NElBUFdoYWlHN0hJQyt4QzZ1M25u?=
 =?utf-8?B?VWJXYkV4T013VVlzTSsxb3BPbHdBQnlQWk5yTFN2RVBDUEkyK2dDdWFMMXBJ?=
 =?utf-8?B?KzA0YVJrL2Z4Y2YraklHd2JQU2pGTVpKVmptVi9RRWZSUG5HTVJqczNwODhM?=
 =?utf-8?B?YUUxMGdOUDV2SGxucTFsUVJFanRjV2NRSndPT0ZKQlR3bXZkTWwxVVlTaUZk?=
 =?utf-8?B?SVdrZnhKamFPNUs5d1JueHlSR3lwaHExOW1EYXVRRkJIUVN1MGFTOVk3bHp6?=
 =?utf-8?B?SzNnaVRwa2VpUVozcXdHZ29wT3VFNncyaTJuZ1VGVlJqZWVrYVlaVHdWR2JK?=
 =?utf-8?B?cFA1UkxPOGNiamRnOUI1L0Y5ellVRi9QZnhCVmY5NWVQcm1jU0xlUXlqeWUx?=
 =?utf-8?B?NGhwbkdnRDkrT29ZQ0tWMjdORlBPV1pZNXpCUUFVd0tYalBKK3JPWW1wTWl4?=
 =?utf-8?B?S0dnMjFJVm5VRGZLT0FOYU9CL1hCUkg0clZvS3VzL1dlVVBvc2JETDFCL1B2?=
 =?utf-8?B?L0huVi9JT1QyTVZDZ0U3Z3hBWGlaTXlRWm9RYnZKWEQ1UXFVSGhZWksvMkhn?=
 =?utf-8?B?b2lIbGhwYWVnRlZMOWE3MjlKUjNBdjhpTjN2QTM2QmZudmg4RWUzK2JGOXBp?=
 =?utf-8?B?RnhaOWJDbnlLQkxvdlh1Vk1QbWIxelNTVmtESEZGSjhqR0hGN0VCSlFuR21L?=
 =?utf-8?B?b2N5NEp3S3hZalNtbFZZcjRQSUl5MlZMM1ovRUpFWTlBVVRSbEVZRGV2aWth?=
 =?utf-8?B?azdCMGhpa1dDVTNJLzR3QTYxbFo0ZXk4bWVIci9ZMXcyN2w2NmRnUS9QL0cz?=
 =?utf-8?B?Rk5NUEluQUtKYkdjd3NsUm14bWthQzNIRW1aSUhkVkpCSG1ZNEs5RXB0TFRX?=
 =?utf-8?B?SUtwdVR3bjl3Nk9QQ1dTS015clBYTmJ4RlFIekJxd1pYOXVmdm4rWU1YK3Ra?=
 =?utf-8?B?bjFod05odUcxQkNzSmMrZlRmSVVQdmJUdllYMERQbXh3S0hJd0ROTEV4ZFQx?=
 =?utf-8?B?MkhUL2IvNnVXcTFJMldnSTBWdVhXQ3FEZGU5ZjV2cjl3bWhld1FOSVNEUDhl?=
 =?utf-8?Q?zMk/jyOcwKduvas5EJmIyte/tTfMOK9mXaWHo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32811dc1-7875-4bdc-6232-08df2f521a60
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11276.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 09:02:58.7444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2lMc0WUFzmpMs6UA/Yal6TtBQ//yQQ8YhtRR8s3HsLnortWSUSQysFc2EpT6TtePrc/5PF6GHI3Rn7dfpwDIGbCYAL28H1q4nOrPfVBNuDQ0U1L8mgIyABt2txrYB3kA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_020303_232017_23113211 
X-CRM114-Status: GOOD (  12.46  )
X-Spam-Score: -1.9 (-)
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

From: Sherry Sun <sherry.sun@nxp.com>

Commit 37f53f50b36f ("arm64: dts: imx8mm: Add Root Port node and PERST
property") added a Root Port node pcie@0 to the SoC level host bridge.
However, the Gateworks imx8mm-venice boards already described the Root
Port as pcie@0,0 in the board DT.

Both nodes now share devfn 0 under the same host bridge.
of_pci_find_child_device() returns the first match, which is the SoC
pcie@0 node, so the board level Root Port node and all of its children
become stale. Also, since both nodes have device_type = "pci",
pci_host_common_parse_ports() registers two Root Ports for the same
port.

Fix this by moving the children of the board level Root Port node under
&pcie0_port0 and dropping the duplicated board level Root Port node.

The moved nodes are now located on the secondary bus of the Root Port
(bus 1), so update their reg bus number and unit addresses accordingly
to keep dtc pci_device_reg/pci_device_bus_num checks happy. Only the
devfn is used to match the PCI device to its DT node, so this does not
change the matching.

Fixes: 37f53f50b36f ("arm64: dts: imx8mm: Add Root Port node and PERST property")
Reported-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Closes: https://lore.kernel.org/all/171421fb-d0a6-4e3f-b2dc-226e9c548972@pengutronix.de/
Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 .../boot/dts/freescale/imx8mm-venice-gw72xx.dtsi   | 22 ++++++++--------------
 .../boot/dts/freescale/imx8mm-venice-gw73xx.dtsi   | 22 ++++++++--------------
 .../boot/dts/freescale/imx8mm-venice-gw7902.dts    | 16 +++++-----------
 3 files changed, 21 insertions(+), 39 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx.dtsi
index 266038fbbef9..404600f121b6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw72xx.dtsi
@@ -156,36 +156,30 @@ &pcie0 {
 	assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_50M>,
 				 <&clk IMX8MM_SYS_PLL2_250M>;
 	status = "okay";
+};
 
+&pcie0_port0 {
 	pcie@0,0 {
-		reg = <0x0000 0 0 0 0>;
+		reg = <0x10000 0 0 0 0>;
 		device_type = "pci";
 		#address-cells = <3>;
 		#size-cells = <2>;
 		ranges;
 
-		pcie@0,0 {
-			reg = <0x0000 0 0 0 0>;
+		pcie@3,0 {
+			reg = <0x1800 0 0 0 0>;
 			device_type = "pci";
 			#address-cells = <3>;
 			#size-cells = <2>;
 			ranges;
 
-			pcie@3,0 {
-				reg = <0x1800 0 0 0 0>;
-				device_type = "pci";
+			eth1: ethernet@0,0 {
+				reg = <0x0000 0 0 0 0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
 
-				eth1: ethernet@0,0 {
-					reg = <0x0000 0 0 0 0>;
-					#address-cells = <3>;
-					#size-cells = <2>;
-					ranges;
-
-					local-mac-address = [00 00 00 00 00 00];
-				};
+				local-mac-address = [00 00 00 00 00 00];
 			};
 		};
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi
index 2aa6c1090fc7..1bf1a34551d9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw73xx.dtsi
@@ -176,36 +176,30 @@ &pcie0 {
 	assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_50M>,
 				 <&clk IMX8MM_SYS_PLL2_250M>;
 	status = "okay";
+};
 
+&pcie0_port0 {
 	pcie@0,0 {
-		reg = <0x0000 0 0 0 0>;
+		reg = <0x10000 0 0 0 0>;
 		device_type = "pci";
 		#address-cells = <3>;
 		#size-cells = <2>;
 		ranges;
 
-		pcie@0,0 {
-			reg = <0x0000 0 0 0 0>;
+		pcie@4,0 {
+			reg = <0x2000 0 0 0 0>;
 			device_type = "pci";
 			#address-cells = <3>;
 			#size-cells = <2>;
 			ranges;
 
-			pcie@4,0 {
-				reg = <0x2000 0 0 0 0>;
-				device_type = "pci";
+			eth1: ethernet@0,0 {
+				reg = <0x0000 0 0 0 0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
 
-				eth1: ethernet@0,0 {
-					reg = <0x0000 0 0 0 0>;
-					#address-cells = <3>;
-					#size-cells = <2>;
-					ranges;
-
-					local-mac-address = [00 00 00 00 00 00];
-				};
+				local-mac-address = [00 00 00 00 00 00];
 			};
 		};
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
index 468c7e993c52..38c019790511 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-venice-gw7902.dts
@@ -635,22 +635,16 @@ &pcie0 {
 	assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_50M>,
 				 <&clk IMX8MM_SYS_PLL2_250M>;
 	status = "okay";
+};
 
-	pcie@0,0 {
-		reg = <0x0000 0 0 0 0>;
-		device_type = "pci";
+&pcie0_port0 {
+	eth1: ethernet@0,0 {
+		reg = <0x10000 0 0 0 0>;
 		#address-cells = <3>;
 		#size-cells = <2>;
 		ranges;
 
-		eth1: ethernet@0,0 {
-			reg = <0x0000 0 0 0 0>;
-			#address-cells = <3>;
-			#size-cells = <2>;
-			ranges;
-
-			local-mac-address = [00 00 00 00 00 00];
-		};
+		local-mac-address = [00 00 00 00 00 00];
 	};
 };
 

-- 
2.50.1



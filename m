Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D02606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Iv0gYvgJ;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=l73j14P4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XqTZDNuYpGmoP4Sx1iyzW14cv7OYxYfI8JHbETJUwUQ=; b=Iv0gYvgJX/yZci3Mmif5ZTiqZI
	/RSJHr191gfYxUYtE88s3HN1LjSa1Mb9YLpuLRFzKVL/aiACN8+HQVDI4/5GQly7YT4ofeyComgR8
	dG3HYuCPuj0TPP7iW0WkXU53z9/zs2h7jNXkr6PxINrB7EaX8eM6m+I2jkS/wiqzu9uux8IPmbDlu
	jbvECP+fRj/LE2xQMXLpl+XVDpUdWKZncJ3GB11l+sGB8cw0snIY0RoeeLX6P8W/AX15Dhu43JoBF
	XkPwASxrQjp8lM9/fUbWXEs7iEu0KUrBJMc8V7Ln4rHlGRKg1LgoMLo2EgviSyXM4TQF/IPQiqkJN
	RFLkBdFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQS2-00000009P3n-2E0k;
	Thu, 29 Oct 2026 13:45:54 +0000
Received: from mail-northeuropeazon11010057.outbound.protection.outlook.com ([52.101.84.57] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQRu-00000009Oy0-0m90
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:45:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F9PgLQe1kHimCj1tkZjEU13nlvWRLzyyaHvjfwWO0TTSbxCWB8I535QdxO6bLd7wWPBQFFeDE0JQfQo4vZWlKtS9Hj+UT+SBVld2U/DlJnUXlkRvchh6ZLgOyoa/3oYwWO1jssbRQBN602lNAaCN+wXDMU+2/D8eyQEN+btOKDcvff+F3zHHXtncBxKz52U8yF0wzYoTFc55uSKpui4B9S+0iy0dc9P54yCgFeTgcV5HM1oOqteMznnYH2lV4+/ioLSVO/S5Elyh43QHV751wNNTe9kwX5JiNKlHFdpdDzOnyCCxovPBK2ctUCyYZbO38qC964FhHdefYM8yXr6Whw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XqTZDNuYpGmoP4Sx1iyzW14cv7OYxYfI8JHbETJUwUQ=;
 b=NDm0XcvxRuJI2EM93tKTyap05vHB2C/HquLtTgsuLpQcQDa9ZI2fdKDrovAfrRI1cblRzdVxEiPustb7prpBhlVKz8UCGeQJce9tkqGLsacVl9s0ZhbhIuSRkweAqe30CTwOqJUTegPtnJ60PqzVvFD7vrKjJfyrc7mVgpoTfJ/XJG7iSWyJ/8qtuF0CAWLf1jHyak8SjtOOrSOvs/PX8GAu+lGkBT2otjFye1hDFoSlZgYH1DXDB3kPf8Hfz8xUyDU41j4psnJz+rzMDV2BF33FCL2kcgegbGQZtSIqXDmPncbxz8SSKaz30WmOZrE3uMvh3NXdxOdKGsuMXE51vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqTZDNuYpGmoP4Sx1iyzW14cv7OYxYfI8JHbETJUwUQ=;
 b=l73j14P4OS5uaBVRjkj478Tptn3loxKahTEF0NvuufHR3sORHahIJBaQatItgC2AkaFjshYKeMMOGv3FuQ1FDTIHxa9XxNWIgxCzS05UrwqaaVd4hS1Wms/fKAtpnyxMVflvfUhEEn43AF49yKnMAKytb1KPhE8btBBjCm1O6HaFjHttlFwdNkySwcuM/BRByn1T+ZWNrrELtfofsYlcaW5bAljUSmoMYU0N+w/NdoQzS22WWPBVxS3qUGPk5N/0sLqZPkBU1nXAUx9REPv2fE1wpOlrZmXFYyKDbFu1vGj143z9G396wvIF1H3kmw46dmG6KvDIutoMe3EDoCukuw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by MRWPR04MB12355.eurprd04.prod.outlook.com (2603:10a6:501:82::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 13:45:43 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 13:45:42 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 29 Oct 2026 21:42:25 +0800
Subject: [PATCH 01/11] dt-bindings: gpio: vf610: fix clock requirements per
 SoC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-gpio-vf610-fixes-v1-1-45b484b4c434@nxp.com>
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
X-ClientProxiedBy: SI2P153CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::14) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|MRWPR04MB12355:EE_
X-MS-Office365-Filtering-Correlation-Id: e675ca3a-259a-425c-d11c-08df35c2ed11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|19092799006|921020|11063799006|56012099006|261026121527099003|261028144727099003|10067099003|261009223027099003|261021121427099003|261026140227099003|261022105027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: IZ5FtACoM+ZnAJE5rVJ7+o02xkxnqTa3Kz8fSIeqnEnnp1yejaeMgO9Nb45Fv1vF9S3YfIjGG+rrgvLx/8KgldwI9UUxzUlwEeBreBVGL/E4EKOo/EiG9ncmdWKlPf9AK8khRzBQmO1IKmWgek3leJL2V3QFn0e12vEcr1r+XBAy0ygDDdbXvEBs9zSODuHuiQmin2sDO7JrIddntmFrKMPggTq1aQNS7v+JS4T3jQJdfwAzngb3RUicA00asgxV7NXgxleve5x7WsARb3eM8NTjtHYPH3O46t04NUtshl5yuHk6EUJowDOhcgnomoL/eawTStLNbhTiwSPakBZLBhm8gQpgmyo2IxUJrNtR++92VZL2UaxR1msXUExf2EJQAR/m6vx6Lx/L1dOeT72BG3KVPr96gLHf4KEjfqknn0czZ5Nb+1KKU1y80YDBVnv28bfv20C7o+vugXVnKxcVBkTD7ZuQ3xaUPpasFyU/EICqz240UYikDzXWe+0WMxgFlCHpjSapcU13gaagdtV6WdpHnPrsC2zFBPfTwaUb0PvtbRf1ErchjFh8PXcaQrvp8B+M1FSV6XDrP+Hsmr+EBHlHmXImv1W7wtNhZSV503ZFDC1pgVJnHC0vSyLVYNG1/aKKNPhY0VqdU/bdftFEH5kBDDe59uI5DNp+WsyLDkuyY9l61JcOIM9+KJkc49GPNmTwYmUbxLv82vFs3J3YQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(19092799006)(921020)(11063799006)(56012099006)(261026121527099003)(261028144727099003)(10067099003)(261009223027099003)(261021121427099003)(261026140227099003)(261022105027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlVlYStNMEZ4by91emN6WWlqbkRrVUVpSjZWbkRjWmYyWjMwR2tlOFI1aFN6?=
 =?utf-8?B?UnA2dU1qd295bStVSmplQlU0UWxHWDRiWWM2Y01ORzVkQTd3ZTlzZy9mWVIv?=
 =?utf-8?B?UmJDcGhkUDQ3bWZvNzYxQXlVZVhJZnJCUTcxOVdLb24rZDcxTUxFdDNWUkZ3?=
 =?utf-8?B?TzNUYmIySHNvYW9YQ2hlRjVxSG9JR3RNMW5PZUJOcVc0dStGWm5EQS9Md29O?=
 =?utf-8?B?SENobGlFVkk3b2ExY3Y4cGVuZGNtZzJLUWJNV2pIQnNyY3pac3o2SG1ZRzRm?=
 =?utf-8?B?Sk5zWFh4R05RUjZlbVBuN3A3YmVaUkhZMExZcDIxQk9wRVJ4dXJ5SHFocktR?=
 =?utf-8?B?STJvT1BwWlZNc1pydWVEZmNWaGp3ckd4cFUrdm9Db0tjUXJEMUpWZk9iSzJ3?=
 =?utf-8?B?UjByZVRURnFIcGdsaG8yRElhdDBjclZGK1VSc3ZFcE51bmpKM0VUSzVDbnVl?=
 =?utf-8?B?dTFyM29NWVhIdW1MUUNyTkV0R0I0UnlZYm9wa2lOKzZFVHFnUmJCQWtRRHlW?=
 =?utf-8?B?KzF4V0Y5ZFhzUUorOENFTEhwZCtBQjJrRDN6VWd6Ni9helZqUnlpNDRrTFo2?=
 =?utf-8?B?RDMydUZScEhQZXh5NmNTSXQrcXpUUVYvMkhhYmNwb3VrUkozblFkNDROVlhp?=
 =?utf-8?B?S2QyYTRweDlqZkN6VW9NTUNQV0tlbDM0dlVoWmNVdkRkWWI2YWtHam1zQzhU?=
 =?utf-8?B?ZGcvbElpUHpZSWE3Nll6Sjd6cDdWRHdFWlZLNTB3d3JNSmZEV0V0VGpUWkhC?=
 =?utf-8?B?SGFxa3lubWF3djdGUUg2RElJTDhMdjVpRzRzOHVaRU1Nc2FUSFFsRXk4NXZX?=
 =?utf-8?B?Q3lwSW1qb1BSZzk0cGRqNzRDTkxhUWpjbGw1TUc1OHBHVDZsMldSSld6dit4?=
 =?utf-8?B?Z0x0WHhaZTh0QkZLUS9ja3J0bjdQb0x5NmtsS05MM1hoc1FYbHhuSk9tN1hj?=
 =?utf-8?B?Y3MrdzF6TTVhbjJTczkrWUY5RWlSdFFGRHNSMGtnVUNFbHdETjUvaVhPTDFo?=
 =?utf-8?B?Q0piaFJQNE03ZVR0R0xrWjdjUTJEcXBudk5tWmFDK3o3VE9mT0dXN3FwUXhH?=
 =?utf-8?B?Wm5vUkliaStIRmV2K0RaTVgwTmdjTWs0Unk2N2ZKN0dFOC8vM1BiK092YklL?=
 =?utf-8?B?anVIRmd5NTdCUWlqakNBb00zelRrNEJhKzQzOVU0dFc2Um0rVkZYemN5Q1B3?=
 =?utf-8?B?RzVsNEx6NGNiN0VkbE1qZGl4M3BQMUZwYUxITzJRSWNDSXl5NE96Z29UYjZr?=
 =?utf-8?B?blNwalJuSG4zYnhzRVMxNFFNcEUrVWUrMktUN0JTSE9sdXVsSTllRUN6bGtZ?=
 =?utf-8?B?cnpNRWNRUmI2ZzNYeDdrQW91QTYzOGRVWkgwUlhkelFWcnM2UmZPTVZvZ05H?=
 =?utf-8?B?ZnMxNFhIUDFXTSs5ZnhpMlJXeW5Xb1N0WmhidzZETW51cHdjOG00eGFvYllH?=
 =?utf-8?B?NERpWkJma2w4VnplMjdqRnAyZ004ajErUE5FRkZtdGlLRUx1K3YzQXhaS21B?=
 =?utf-8?B?Vk1nd2pQZ29jKys5TFRXMmlVQ0g2RkZ3VFBLU1hMM0t3cXYrWU9vRWhRRGdH?=
 =?utf-8?B?S0drUU0vT1BWUjhhcHZWRkR3UVAxQjJjNzV0MElXS0FJVFdXOG5iQW0zK3g1?=
 =?utf-8?B?UTJHbTdOY015UmJmZTQ5TkczU3YwT3FGQUhhMzBEbjVjSWtDUk96NkJWZytx?=
 =?utf-8?B?dFJqc0pmczRxYmFpdHlLSlo3UHUvbXJlRUpTZ2Z5MHU0YVIwTkJFck9uZERG?=
 =?utf-8?B?dTI5aWZxQjY5dGpFd2ZHbVlvVElrVGlwalMva0lzY3RyWkdWK29KRy96N0ph?=
 =?utf-8?B?YUhmNDJVU2lxVG5meWQrYTl0aXA5NUt1eDU2QzQ2U05NejkwVlBXRXdOV2lh?=
 =?utf-8?B?dW9Pa09rbkM2K2l0a3JMdWYrOTM4MU9wQWIxWEYyQXhaM2c2STAzME5TVzBJ?=
 =?utf-8?B?Qjl3eW4wenhUZy80cDEvcElmK1YzN09nNlJJYXoyeERmTVdjTm9RMWdOcUtw?=
 =?utf-8?B?S0tFWDU1cWZ1ZmJlU2YyY3V2MWJGV1VObE1HZTRPV09WK09kcFh3blEwNmZm?=
 =?utf-8?B?eFpDTTBNRDVvUVdPWTBBQ0pETWtkWlVKc3FXd1VnemJMUXEvR2hrOE5RRHZs?=
 =?utf-8?B?WE9KRUMreEdKNW5Gc3QvcEZ1cUlZS3FFZ0ZxczJtUUV5OGpybnovWVFSeG1V?=
 =?utf-8?B?WGF6Y0hLbEdaRGwrbGFPRUZhK09JeGtDYlRTWWpLVmExdXJncmRMbWpMTTdx?=
 =?utf-8?B?d3RteFlqMWkyU3dybjJ6S3lVeTRVZnkyMmVZd3g5bDF1VzJ2R1dqZVpiemI1?=
 =?utf-8?B?ZzFFUTJDUkFXVzFKNWI3TFVGa2pMMXF3U2ZIeU9lb2hVS1VNMFJ3Z0lqMk5j?=
 =?utf-8?Q?YGh3Zum0LcxLVUBL6BmDwzkHIOp+IL2syMq0Z?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e675ca3a-259a-425c-d11c-08df35c2ed11
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:45:42.8805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T1V6paQmw3PBqbcXayaTKseQH52ek1U4kXE89Wx9Yh0U/DzlCW7ixlbQ96EjA7pt0/mOHzkp1bD7CLr/oDMrXEswnemq6P1LIY3FX7VNmG9LByF46N0IDJUMMFXnqpqc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12355
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_064546_233294_17F80DF3 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
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

From: Peng Fan <peng.fan@nxp.com>

The i.MX7ULP GPIO controller needs both the GPIO and PORT clocks,
while the i.MX8ULP and its derivatives (i.MX93/94/95/952) only have
a single "gpio" clock. The vf610 controller has no gateable clocks,
so keep clocks optional there.

Describe the clock items with minItems/maxItems, require exactly two
clocks for i.MX7ULP, and require exactly one "gpio" clock for the
i.MX8ULP family.

Fixes: c61d8b5791ab ("dt-bindings: gpio: gpio-vf610: Add imx8ulp compatible string")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/gpio/gpio-vf610.yaml       | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
index a31f64b6d40b..822fa11d18d9 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
@@ -57,11 +57,13 @@ properties:
     maxItems: 32
 
   clocks:
+    minItems: 1
     items:
       - description: SoC GPIO clock
       - description: SoC PORT clock
 
   clock-names:
+    minItems: 1
     items:
       - const: gpio
       - const: port
@@ -116,6 +118,36 @@ allOf:
         reg:
           items:
             - description: GPIO register base address
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx7ulp-gpio
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          minItems: 2
+          maxItems: 2
+      required:
+        - clocks
+        - clock-names
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8ulp-gpio
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+      required:
+        - clocks
+        - clock-names
 
 additionalProperties: false
 

-- 
2.51.0



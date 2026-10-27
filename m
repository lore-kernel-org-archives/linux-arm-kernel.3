Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BFE60A261E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 12:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k9D7FR5b;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=NeCyuGIA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=N7V71G+7I8dj5166IjJ8FRn/DtK4CgYBau1ct8RDFg0=; b=k9D7FR5byJJJpwrU4eVI+x6GZM
	TD8OS93vOb2IulnCpA2TCtZwIWsOKs8uUBfeodaAcWgEHyXF0Osg8K5Mrbvgv7gvGwpn9H58MXCkO
	zlH6d73nPNyntwSuDgZac0OyphvUfSW2bjfKrUL2Bwbip7g4pbGvM7qA/PO98kejhSq4hRuR9TyQz
	8rLoEbh2U//pjHRAunmkLNWlequDerSN9XcJpWE5XXUTTGNnsuePpISm+jcaa/+9N/9Xf78qispBT
	8YlzF5Q8b1/+Sb8W9fk5UwpYMJYLwuezgFUMeVzzo6Ex7brj9UDhhjBYV7Cq/SF0M9Ln0sG9h1rb8
	fRWXwc8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLg3J-00000004aGa-21zr;
	Tue, 27 Oct 2026 12:13:17 +0000
Received: from mail-westeuropeazon11011049.outbound.protection.outlook.com ([52.101.70.49] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLg3D-00000004aCp-2luW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 12:13:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uCKxKdGct45fA+j3pvQKiqrgeJ9y4Vp6WVJykIIu7nS8JYOr0sVhvlkaI9HcHHvivo86JCOWnWGPoXtbX1HK1q4dvuq8WfL+qXLiFUsuann7xi+EHVwBe3COdKBK4+QvjQSgZnrMwey+KVU8V4zfV/fXCZE/IdF5qC7NNNgZK0ngIDjADakhrryWL7hcCtRUfQToLf/lcwLrmvJ2byBDcwwwbqGi8whPhXDmdecs2ugpn8ZsIcitVHPrux1o6M8EqsK6oVBLZN5unU2BsJa0WVrjEZzjBWC3KuvVI1yvKY5EUoDmfFYjdT8sG6h97kZjo9KLE7Vts3Oga+6U+Apo+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7V71G+7I8dj5166IjJ8FRn/DtK4CgYBau1ct8RDFg0=;
 b=NHxmBrCL9M9IV4czkVzt8WX6801AYrHQ7YgUnKPc5o6rxWmXGowmEH3UhmVYYojoMy288vcDPXGkfAP+GL3U9bk+DlE4CdTANjGXuucGfwKNsKI2uRIzNoHrpjFEwFqBoaW/B87KP5Bojxusopr2Xv2h4gtNG+nwVVQ5MeC20xo8ZddDXjBd3yAR7VS3yrRvehhiE1Iw0T91Ip+vRg9wPn2hNZ9dmsG5y3fYMxPwPa0rUSbGjnThqXmONCQ6dpYG1YO0ewckxrv4dYq7Mb6peI+fTdPCZMB8dA27jcNvAqC979lGrHFn3nN7zdQ2K9kuPaEPGOVTRrObwGzn14lgaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7V71G+7I8dj5166IjJ8FRn/DtK4CgYBau1ct8RDFg0=;
 b=NeCyuGIAbj3yUhkRYWocJC/viuisnZ0FYZi6GUW/VmeFquE05XMW35UbTN1Y8pm1o8esCdMhZEasj6L7Av/LkD/dCgofjv6LMfafnkp93bpldcQFCtalryvDuWkD8Ntq66m64bz2vt5aDplVVYfAYcVRpTffjAqHQ8lsz1GOCKQpq/V/0iiBeI8dnkCnz2q4tYwhQ/Zq3lyYMwzL39KE5qkiZWaNXXMhOOotLg2BxmiX+0VuF1uu2RcsoIXbZnT1SraeJzS4MOAW+1lQrOVloDNG1TcMXzL79tcp+vjKMzVapVS7wiZ8+f5W0sgE5w2JEC2O4I0fyXZ1pNDpv11axQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU4PR04MB11961.eurprd04.prod.outlook.com (2603:10a6:10:617::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 12:13:07 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 12:13:07 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 27 Oct 2026 20:09:31 +0800
Subject: [PATCH v7 04/12] gpio: mxc: replace of_device_is_compatible() with
 hwdata flags
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-gpio-mxc-cleanup-v7-4-v7-4-7b602d70c149@nxp.com>
References: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
In-Reply-To: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:4:196::22) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU4PR04MB11961:EE_
X-MS-Office365-Filtering-Correlation-Id: ec04b362-8940-42c0-9a28-08df3423a8a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|11063799006|56012099006|261021121427099003|261009223027099003|261022075727099003|261021123027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: /e0pBEA9TpKIBMVqreroAIBp9LiqXHReFzWK0UHmFK4D7VY4Iy53nNSC3nQ+xPBO7h5oGglZfvN/tM/jUuL4W3avBJgr5Aq4mGp9m2b8OjotXkGrAY6Fdq3mfKfwwiiqtCLAUH9IytkHB0qcCaVXxye5lls9BfZabTU0SBFKqMzuS5kuEACjJqx4Y2yB78uvl1JwbxDD4WVzlFlJgyw1m/fWTuAnAV7wmyQBjzqCbdvLntePDbB3iLmIcPDq/sXID2Lmg37EcC7uYlg7bOIkhMztpChM2t9RqJu5a6hOo+Kk8vucqb2oVtkmB/EBkWXnFhmtUuu4CbSgp4i5asEZT7/BAO/zbRm/yescvyvivgBMlKOCiaN9AbzmUKHB3mpCwB9NNySWJ6z9IUlxQekDJkdT07di8Smkt+XqCO33kLV5sKuYHhYGus/8TVT7NhyvFpuf1RdQplLW7ZgCYTxDe+cRPPmQwg2ev5KgBDkP20Cw9FhB1r454og/fNzU0LKf24ZWQNVJFP+DtorIXXuc2+l13VVf/XNx53yBpfqK1BO74i/1294POh9D67OTXvET0twmu8KuwKhb0rCOqiu506U2ZXGnMcujR4fuy6okKJLlBDPAjBDw5ieC9cDArnMljhpBnEhOOfF083ONm1a04TWq2PE4nBlFFVkOGkJI6vQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(261022075727099003)(261021123027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkV2cWJFWGptR3lsaG5Qb1N0SEJTQkNHckprWEVKYmI2Ymw5UjNaeU5Wc25I?=
 =?utf-8?B?dUNoU24weUFHVWFVLzZFbk9vN2dyWlgyS1VpOUhlN2FPeFpqRE45WEJVeXo2?=
 =?utf-8?B?dC9wMnZtaGZoNXVZaDYrU0Z0Q1kzU0tDZHVsNGpPWHB3UHF4azB5WFcrTEd1?=
 =?utf-8?B?WlpSWWJJQjduR1h3MHJaRkdzMmlML0FqY1k3SGxaeC90aU9ZKzNxVVNUOE45?=
 =?utf-8?B?QWNiYjlqb1d6RjVnbFEveGZBSURjdml5UU1mc3ZSendOZm9nNFZRVGtNRWsx?=
 =?utf-8?B?S1owMCtXbW5JVWYwVVc1K21SZklHdTlydDFyTjgydEZCQUxleG83SzJrNHZ0?=
 =?utf-8?B?Sm5kRUZHb1BIWGJVa01mRmFEQk1tb2lqeW1jYVFmVWN0a3BaUW15VVJnTXQ2?=
 =?utf-8?B?MUcySkJlL0ZZaHFvemFoL3BqZ3p5ckxibTVJMHNraFIvTTJPWXBNRkhwbmd0?=
 =?utf-8?B?RGdSaWFjbWt3NWhHZm9oUkxhdmZObzNjdmlndGN2YVZWMkZLcW1KcUVWZjBS?=
 =?utf-8?B?cDNSU3FLVUJRQThEb2E0YXlTbXR1Y1F5T1BsOUl1Y2FUem5Nb1YvRjBKak9G?=
 =?utf-8?B?c1lELzhEN0hVTDFIbzJRNXd2eXNSRTM0Z1ZldmJ3a1hEZkFkbUdjSlRJclhS?=
 =?utf-8?B?UnJKU0M1QlRKUm1pUFJrWmVuQmdSWG9GRnVKangwN2NUdG1zUks4aFNQZXpE?=
 =?utf-8?B?NzVDSTdaVk5oRnFaZE56bE5WR0NidnI3TnZhSkRVcVBzS0tTamFtUzVsd2FH?=
 =?utf-8?B?WTlVZmNEdnJHNVBmUkt1NG40R3JiSG5TMU13TW83RTNadlVMTklWdWFLUm1m?=
 =?utf-8?B?ZlZSY083L3hsRWV4NmtQazFTRVUyMjBNT2Y5djRISzlZU2tqUEYvYkxkWjQx?=
 =?utf-8?B?WWpPbkd3ZjdtTHhPNDBlTkFrbWJoQ3VjbExKU2VMcGdDWFVlV2hpY0xUd3A2?=
 =?utf-8?B?REQyTHFjV1Z1ZGdkWkE3UDlCZEVrYll5ek4yZmRoa2RnTGdOMWdPbkZvRytx?=
 =?utf-8?B?VHNQUTFqU1lLTGxvZyszM0xqQTJPdHB4QllOdkszdjFYMHZVRmRNb1o5ZlBG?=
 =?utf-8?B?VFhaelEzb1pvT0tKYUNTWEdlRVZzVW1vcDBxMjR1TFo0OUIyZC9XV1V1VGZ1?=
 =?utf-8?B?OUFHLy9uaE80US92NmNJc0hxK2VrTG1tdmVTcnNsMWRRK0lIczZEVlAzbnVP?=
 =?utf-8?B?b09GL3p4eExpOWpld3BwSmpHRnBPc3ZSdE1KaEVXTFpKYnRjcTVuRDU5Z0dS?=
 =?utf-8?B?L2pnVnNCZjdXZGpzYVVPTHJWYjN1dW9XU2gwZXQwdjJLdDN1ZzhIbTlReWtC?=
 =?utf-8?B?K0JzWHREYlNhTUQxRkQvTzh4UmRCaWFoSThCSCtCRCtVRkxuYnVFTXQyUS85?=
 =?utf-8?B?K1JMakNMM3MzNy93U3hmTnZFQUdEOC9acGFPMG1paUZ5bE5rQVF4a0JkaWlU?=
 =?utf-8?B?QThORWlQUFAySk5XRXI5WENSYVV0dFlpK3kwdHJvK0VKNVhNd3NMeFFwWVNR?=
 =?utf-8?B?bTIydXFNanNqYStaWGdTd2NIOUVUTXZObk5sMHFPRU1HaEQrY0V6N0U3RFZy?=
 =?utf-8?B?MlFUbUpuaXV3MElhclVHL2ZvTGlBajY1ZC9EN09CRXhBbzFNRW1TVHVyM0lS?=
 =?utf-8?B?eGdpdGUwd0diTW4wMnRQckJOcUpJbmYvVWlQbDk1NGNHWFFFcXEvcWNmZ2kr?=
 =?utf-8?B?Y01ORXdaNys2VDB2djF0NFQxTEp3QkxRVU1BZThGUWcrM2JKYnJzeDFxMFBQ?=
 =?utf-8?B?Q0tCYnVrTnNQOXc5eW5zU0todkRHSGdaenBGTlBtdDNpKzdhOTc1RGRwZFg3?=
 =?utf-8?B?NVltUWJ0cnY3dlNoSHNpdldDa0UzWTY4Z203M0lUR25IV3RoRkgxdVprcDhi?=
 =?utf-8?B?UDRVT2RYdzlLRlpBUUltWlFZZzdCbk1FSmkrc3pZbFVGYmZnYmpYK28wNWRu?=
 =?utf-8?B?bUtwV1JrR3JXSE5yNDFrSWt5RjVnMXZuQXQwWkZXeFNmcFhoM3F1VlVzM3FS?=
 =?utf-8?B?RnVVNFJrcjNRRktDenI3WWxPV0hxaGtjYU1lcms5Yll2Njh6YTlzUW8yQ1Bm?=
 =?utf-8?B?Q0hPNVJaUmx0WGwvZ0tGR2U5WTBDTGY3TklDbUt3TFJYQVE5bDluQWxoS0Jy?=
 =?utf-8?B?cDVLcTJPdHpVSVIzMEhtL2lxSCtENFdGNUoxU3hTaGdUQmx2U3NVc0JXeUVz?=
 =?utf-8?B?K3dEYzNjejM1dmt4WUxwL05PMHcxb01raWNZcy9PaFBRUHkrU28zcGErdjJj?=
 =?utf-8?B?SVJIbFBSbXpMYXVWWGRzNkdrQThXMnhFNlorMzVkK2JzWEp1U2lIczdSVDdZ?=
 =?utf-8?B?WVVUYmdxQnlEVGk1aU5OUXZsT1lqYnRrMHF5Y3BLdFRPMDMzR0grLzJZTHFO?=
 =?utf-8?Q?WW4FJYwJA4TNTQwh/ZyA90OBdh5dunGOTNn64?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec04b362-8940-42c0-9a28-08df3423a8a9
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 12:13:06.9757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VbmaX2Std2yMrE4YXZQhoq1yXbOh8jpPEmmZYLSTL22CZutBJMPrvI+ACXdgEA888NyoNQ8KlOCR0EDzzB2E2Zd1rl9nbF/Fapr7053pYFcGt6eqbTF5nFo/gUp3+96i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11961
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_051311_717337_C2893721 
X-CRM114-Status: GOOD (  15.83  )
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

Replace the runtime of_device_is_compatible() check for "fsl,imx7d-gpio"
with a flags field in mxc_gpio_hwdata to move the power-off capability
from a per-instance bool populated at probe time to static per-compatible
data.

Introduce MXC_GPIO_HAS_POWER_OFF and a dedicated imx7d_gpio_hwdata
instance that carries it, along with a mxc_gpio_has_power_off() helper
that replaces every former port->power_off test.

While at it, factor the register offsets shared by imx35 and imx7d into
a MXC_GPIO_HW_DATA_COMMON macro to avoid duplicating twelve identical
initializers.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-mxc.c | 50 ++++++++++++++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 43868a214c17..abff07bd3840 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -34,6 +34,8 @@
 #define IMX_SCU_WAKEUP_RISE_EDGE	6
 #define IMX_SCU_WAKEUP_HIGH_LVL		7
 
+#define MXC_GPIO_HAS_POWER_OFF		BIT(0)
+
 /* device type dependent stuff */
 struct mxc_gpio_hwdata {
 	unsigned int dr_reg;
@@ -48,6 +50,7 @@ struct mxc_gpio_hwdata {
 	unsigned int high_level;
 	unsigned int rise_edge;
 	unsigned int fall_edge;
+	unsigned int flags;
 };
 
 struct mxc_gpio_reg_saved {
@@ -71,13 +74,26 @@ struct mxc_gpio_port {
 	struct device *dev;
 	unsigned long both_edges;
 	struct mxc_gpio_reg_saved gpio_saved_reg;
-	bool power_off;
 	bool is_pad_wakeup;
 	unsigned long wakeup_pads;
 	u32 pad_type[32];
 	const struct mxc_gpio_hwdata *hwdata;
 };
 
+#define MXC_GPIO_HW_DATA_COMMON	\
+	.dr_reg		= 0x00,	\
+	.gdir_reg	= 0x04,	\
+	.psr_reg	= 0x08,	\
+	.icr1_reg	= 0x0c,	\
+	.icr2_reg	= 0x10,	\
+	.imr_reg	= 0x14,	\
+	.isr_reg	= 0x18,	\
+	.edge_sel_reg	= 0x1c,	\
+	.low_level	= 0x00,	\
+	.high_level	= 0x01,	\
+	.rise_edge	= 0x02,	\
+	.fall_edge	= 0x03
+
 static struct mxc_gpio_hwdata imx1_imx21_gpio_hwdata = {
 	.dr_reg		= 0x1c,
 	.gdir_reg	= 0x00,
@@ -109,20 +125,19 @@ static struct mxc_gpio_hwdata imx31_gpio_hwdata = {
 };
 
 static struct mxc_gpio_hwdata imx35_gpio_hwdata = {
-	.dr_reg		= 0x00,
-	.gdir_reg	= 0x04,
-	.psr_reg	= 0x08,
-	.icr1_reg	= 0x0c,
-	.icr2_reg	= 0x10,
-	.imr_reg	= 0x14,
-	.isr_reg	= 0x18,
-	.edge_sel_reg	= 0x1c,
-	.low_level	= 0x00,
-	.high_level	= 0x01,
-	.rise_edge	= 0x02,
-	.fall_edge	= 0x03,
+	MXC_GPIO_HW_DATA_COMMON,
+};
+
+static struct mxc_gpio_hwdata imx7d_gpio_hwdata = {
+	MXC_GPIO_HW_DATA_COMMON,
+	.flags = MXC_GPIO_HAS_POWER_OFF,
 };
 
+static inline bool mxc_gpio_has_power_off(struct mxc_gpio_port *port)
+{
+	return port->hwdata->flags & MXC_GPIO_HAS_POWER_OFF;
+}
+
 #define GPIO_DR			(port->hwdata->dr_reg)
 #define GPIO_GDIR		(port->hwdata->gdir_reg)
 #define GPIO_PSR		(port->hwdata->psr_reg)
@@ -143,7 +158,7 @@ static const struct of_device_id mxc_gpio_dt_ids[] = {
 	{ .compatible = "fsl,imx21-gpio", .data = &imx1_imx21_gpio_hwdata },
 	{ .compatible = "fsl,imx31-gpio", .data = &imx31_gpio_hwdata },
 	{ .compatible = "fsl,imx35-gpio", .data = &imx35_gpio_hwdata },
-	{ .compatible = "fsl,imx7d-gpio", .data = &imx35_gpio_hwdata },
+	{ .compatible = "fsl,imx7d-gpio", .data = &imx7d_gpio_hwdata },
 	{ .compatible = "fsl,imx8dxl-gpio", .data = &imx35_gpio_hwdata },
 	{ .compatible = "fsl,imx8qm-gpio", .data = &imx35_gpio_hwdata },
 	{ .compatible = "fsl,imx8qxp-gpio", .data = &imx35_gpio_hwdata },
@@ -448,9 +463,6 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(port->clk))
 		return PTR_ERR(port->clk);
 
-	if (of_device_is_compatible(np, "fsl,imx7d-gpio"))
-		port->power_off = true;
-
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
@@ -542,7 +554,7 @@ static int mxc_gpio_probe(struct platform_device *pdev)
 
 static void mxc_gpio_save_regs(struct mxc_gpio_port *port)
 {
-	if (!port->power_off)
+	if (!mxc_gpio_has_power_off(port))
 		return;
 
 	port->gpio_saved_reg.icr1 = readl(port->base + GPIO_ICR1);
@@ -555,7 +567,7 @@ static void mxc_gpio_save_regs(struct mxc_gpio_port *port)
 
 static void mxc_gpio_restore_regs(struct mxc_gpio_port *port)
 {
-	if (!port->power_off)
+	if (!mxc_gpio_has_power_off(port))
 		return;
 
 	writel(port->gpio_saved_reg.icr1, port->base + GPIO_ICR1);

-- 
2.51.0



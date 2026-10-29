Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E623C606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FN+DHVdr;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=o7CYq7b2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Lib76mw/6jaWx0t2q6xr1r1B8omKWSaE4uMBX/3BQv8=; b=FN+DHVdrQb/bX9cPmdhq1X6BEI
	uR8deNDlYo5Qi763Nd0Q/Zui/ddHXRaVMLagE8TAcMlAEdOTEA8T+A/SYNE1jUiPPEPy9sHN4WvOv
	AnoSf8XSHJFE8m3QvFcVhJcjrHPY4jqDq+wAG4NXVWh9hfPTI7Bjlyx3OT/KH7it93dwmBiQaVgQL
	m0EOXCOq45dnOrHeKBuL+P7F1yOdKPo3IK+BgQx1/6gYRJ8prU4yFt2WPuy8WMmTNt2wOvrrZpb0c
	ra59n27zcpFVKz7bC6s1AAk4W9AfPhtrnXtiKevnvOSJBrYXG2FGvioTDITHGx1Z557kNshAw5DBd
	Ab4cYjNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQST-00000009PMh-0fOf;
	Thu, 29 Oct 2026 13:46:21 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMQSN-00000009PH7-1KGb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:46:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5vUDAQGSNLCnTO+codGQxRrRcu9QBX6M3ydL37fmEETs08CI69wxlIhkj/BndKKY4R8dKxhyBzf9C/JLqENrvJMPBnseotdROYPcaj74RgehR7i8bMaTxbl5YghrG71pudxMCV7DgM/fJUdi/3SP7QZnr0Y+ly31zpXE1Ua8KVcIwsOHuJUH3PK9oTYPnZg4VSUpP3WWHeBPwkuSzucTIXqauENwO8rUoiD4URjgQ0fHwtIIDYsTg1H16qQpb3wG6wlpEMMZof6Pdl8SLBmjrtJVHtkRTB1Wh97EAITJg7VKvrVlKQLJbIO50Kj/CNOp9EGaoEPyS2T/Yj9qcHgSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lib76mw/6jaWx0t2q6xr1r1B8omKWSaE4uMBX/3BQv8=;
 b=pS+GA42ioq4m1hOePTolYt1IGCdPTXpZaBNn5nLZYMrPpMihGuJKfDGym0im9cZ7VppkanJ9PmryoBIaAsZT86EasLftighfqXCYw3sgM0fl2tsw7bzcs8dNdBGVj0Hv0s/g9vqsI9IYQ7nEV/+OwIFdnl3hCzMubGofElubeord7gadTFW4dYC25GbRew93GFixUR1pOC3Jdq0sdWqJAZVt6+950k7s1HJnQ15acTc9aCWU+EyKwRrS0MuqXfZ8y4N7N3xjkbXtkKdL13cUjizXYY76C6B23+lJ82QLyMuoOcwmypFs3NxDnXRHs6x+pfCQGej1nMrDLgbGjn8NfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lib76mw/6jaWx0t2q6xr1r1B8omKWSaE4uMBX/3BQv8=;
 b=o7CYq7b2cytm3kjI7jCjP7baJbJyCcJ7DrCL7WOD5wWVpOIR4ooYJk2OhtAvJOjheqFJKehXyd+l57wzU1y/+65gvaGbHfdnAs7fyFI9Bj2Mgn10IFIqglnQIMHSncGL9MTE+FyfDHiv81WhCEHCDp8stYMoGPx74dyeARBtZJ8nteaFht4W+yC1BwxVc/y6lgMbwhUnnLGeM9zcUUGKKAL+qCw3A537kCthvdDT6xOmsBTGZDhBbl3Df3cU2kAcU8UFQHpR6BIkswWhaNW1fFN+i6M5M/zFAiqZnaBw+JfWwYOrW3R10u0hNThrQnSIupQPtCSFKxotQueIHkv4+A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by VI0PR04MB10711.eurprd04.prod.outlook.com (2603:10a6:800:267::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 13:46:09 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 13:46:09 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 29 Oct 2026 21:42:29 +0800
Subject: [PATCH 05/11] gpio: vf610: drop unneeded header
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-gpio-vf610-fixes-v1-5-45b484b4c434@nxp.com>
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
X-ClientProxiedBy: SI2PR01CA0027.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::7) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|VI0PR04MB10711:EE_
X-MS-Office365-Filtering-Correlation-Id: ab9c41f1-bf69-4c41-5e1c-08df35c2fca2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|366016|376014|1800799024|19092799006|261009223027099003|261021121427099003|261021123027099003|10067099003|56012099006|6133799003|22082099003|18002099003|921020|261026121527099003|11063799006;
X-Microsoft-Antispam-Message-Info: 09PqOQAfslpjr/VHbfPKX16oULToQpLsWZ0NP9Achxyt7PzLq0hDw6Sg3FaxrygSG0MINlXrbjJ7pUs8jGIfY/ifZQJXIEdGIxzi49D6webwvaqQQsM5RJKrqx2hGB19tJNPMh7TIU4zFnWTK0uKZA1cSDBwYjXZkBvpMzanBDMnERFuHBsV+BrcgGkre8AQ9KtBDYq76M47aiImukW9W6Q5iGDV5dgA9fGZzX6ofGH8dP/D+v3adMTRaAnE/835xHJuan1pmoZJMgMiDTpY06EpKtlYRBV35j/2vB9KlkmRNYDKUDzghXEK6MPcaoF6XcMxu5vfOM+j3+I7q67OG5PxuxAyN0HeBEz+YenOC3DC2Uy0KZ2oGc4lVPUrWyiyOVVuUSTuXet4kvbbE2dbNo1vQ14bQkFBMqCSXySqKLler84IeU81Qr7VK16QFX44IrfTji1EOubSMcL3RUDL73jQFcFdYNq9qvp1FYpcCT0cFlEY2seakzN5OBwKY4IjzuvxhS1BSouSgvNN5Wshr4uWd0vxFYOtJH7XLX38iw0LvZ32qIZ0azg2Bg4Du0FpMGHfuIDGbu0HUQIBMC4eEIxj9K6eGwCwJynBb9kR79xgNLo5LcT/KxHN6SRg7KGljCg9FAU68p1Ih/725fI/zQQ9BSXTrjzkVHjqgVaWDEfvJ8NYTFFxTHIxuCyJvnjeVosQGNeXi0JHVm+m4yaRLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(376014)(1800799024)(19092799006)(261009223027099003)(261021121427099003)(261021123027099003)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003)(921020)(261026121527099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVE5V2lGZTNMMlZIbTZZci9PZ2NzMG5vZ2dOdi93QUgycjFsT3BHVHQxK05J?=
 =?utf-8?B?K0RCckxhNTNEYi9wRUEvZWJpSlBRQmJUZ29adExKUWphMEVWejl0Q0xZU2dE?=
 =?utf-8?B?M0ZIWGJrNXlzcnBmajhLa0crQW1PamN3TVJTV2VLV0pMaCtiYkwxcVg3UmtV?=
 =?utf-8?B?MVBXaUpKQU5ZbFJKazNTbVJtbFQ1T2J3K2w5TE9ZcE9FSnhJcVlvdmZsWk0y?=
 =?utf-8?B?R3prOFIrQmpKa0drbEpNUlNNbE9OWW82dXdpUFA0VUFRR1I0TzBVOStVZmVP?=
 =?utf-8?B?eUJkcmdwQzFKSVVVNXM3L3QwbVphTGYxQmQ4U2tWNWJLN3ZGNnVEcVA3ZFI0?=
 =?utf-8?B?TVJpMUszMWY3cis5bXZ5WXd4Zk5CWkV2cTVmd1pacHdCV3JIMlNVa1dtdlFX?=
 =?utf-8?B?K0FYbVluTFJkSytaVVlva0pmQmhCVERJOG9XUERGYi84S3BUN0cwV2pXVjBv?=
 =?utf-8?B?akVMRXdPOUJoNXhUMDJ4QW9tRU1rcStrbkdlS3cyNkMwNStjaGNraWxXbExY?=
 =?utf-8?B?MjI4MlFxQW8zc3h1bzZSNEdOZ0c4YUlJclBwL2U2Q3REY3A4OU9VdGcvVTNM?=
 =?utf-8?B?amFZa2ZiRWh1NzRQa3daNjVhUngwRXBXTXJXWXNZR2FrT0tHM21mQlprYndh?=
 =?utf-8?B?WEoyVzJCcWN1MHR3Y0dQeHc1TmFMeGZaOVZjdVNkbzRtdnBtbEdhejBSQitM?=
 =?utf-8?B?MUtlMzQzNkVONGR3WU55UUUyTmhEL0RuTUVCcDVLQkJxZnk1bU5Zd1lGTERZ?=
 =?utf-8?B?eWRJVFdsOFJ4TmE2dkVNSitsMFI0U0xwdmVZZjJzMmJUdEV4R2VtOVY3VW9x?=
 =?utf-8?B?QTFYWjkxUjNPVCsvVHF6S1E1YzIzMmZtMThCaWxVRUptNUJlZUZXa1FWM1JI?=
 =?utf-8?B?WmV4aDRJKzlHdnBQalB0dlZQejMydDB6cGxySGZpaFlRTUVkRnJEejhUWFg1?=
 =?utf-8?B?Nmdtd0ZWQ0FvbTBtODFoUVFDKzZoRk93U0pWemVxSkc0TVN0QWRiUEw1QWlL?=
 =?utf-8?B?ZTFuVkFvRzlyQ1F2eHpacHdZdHluZnQ5Y1ZaNmVFMXVFZUtPbDFmZmFFdk93?=
 =?utf-8?B?bGFxSEVHWFlRMnp3dUdUT0ZLZHFvZEErK2ZFYU1PR05YOXdQa2dLdzA0Nmcy?=
 =?utf-8?B?QTZWNjhjaHFQekV5U3AvOUNBdURPZXBhdmdCVmxaVlM2YTAzaGdiTE1Td3hT?=
 =?utf-8?B?dkE3S1NrQXVzTHdlZHJ2OUdoVEtHWmVxQjczVjdkTjg3bWU4WHhpWUNSME1H?=
 =?utf-8?B?MnlBYU1vaDdRKzZWalBSd0Nta01CeTJrV0hFWW9abDhsQ1NCYkoyM2FPSEpG?=
 =?utf-8?B?RmtBNjJHak90UVF1c0xmd05ieUlkVUNUZHo3WWVPOVdUUExLSkVnR0xnZWVo?=
 =?utf-8?B?ajBmMmtkRmlGUzhJOE9VWTRRSUYyN3Fwc2tHeW1NYmZ5VEc2M3hocEt5SzhJ?=
 =?utf-8?B?U0Z2VUJsQ2kvcENPa05Lb1FKMU1SUmhHZy9GMXRHbVl0clcvVlhOUy9lcXZ6?=
 =?utf-8?B?QWlmWTNvdkNNTC9BWHVGTktUSXZ5YlZlR0l0b0EzVFJyKzUvNnAxMDl0OUpM?=
 =?utf-8?B?ZFV3RWVWV2pTZjhNaUFhNUphQ0xyZFVOMWRHUDl0MnJONGlvS2RQeU5PUExV?=
 =?utf-8?B?SzhRa2MrcmVHUThyMXhSVDV3S1RXZUdaYnExdmxwNE9xZVdsZ3czclRGMTBk?=
 =?utf-8?B?YnNKKy9IN1FFR1VTS2tXNk5Ka1c4MHhLb3FqYkMwbjdoTXZZVWZIOU5ocmo3?=
 =?utf-8?B?blRSOUJuNThsWGUyd09Yb3dsOElIZGN4emhPT0hrVlFnZVl2bGxkZnZkcU1L?=
 =?utf-8?B?R0RJeHNDbTlHNmwzZGJZU3UwQlhRZFZoanY2OXIyakhqbE9TRWRIREh0WjZp?=
 =?utf-8?B?eThtNGJQRVhpcWVNTFFXTlpuNEsrRjg4dDdBR1B3cmxDb1BwK09CWWp2cFhu?=
 =?utf-8?B?bWl3ZUszSmNJZUFRUm5qbVM1SGtXNzE0blFLSHczbXpLRmI2ZXJGeEFFYi9k?=
 =?utf-8?B?Mmg0UWJnQkVoRjBFamljaTBWTWRON016a3YzT1lub09ndXp1VUFQRG56UlJ3?=
 =?utf-8?B?aXJxb3ZQNURRd1BMRDRkNEhaSlprcGFWRHRWeWFSMGk4cXZMMW02UVR5dEIr?=
 =?utf-8?B?YS9oUU5pd2NFYXJUaVZpang1SENYajl0R3JjK1pMa1cyRmE0REJGSW9Ec3VI?=
 =?utf-8?B?ekltdXhSaXBUTGs4c1laSHZKUWZWNUwwVnJpbFBLd0ZRSEZ2RlhZYXVGN095?=
 =?utf-8?B?Q1gzMW1MQWdDK3ZsaklzWW1DblowTGpCMUh3Z3pkL1NzVkx2NEN6TStoazZ1?=
 =?utf-8?B?czRzWWJZTmUrdHpsbDAvZGxOSjVCWjJOZWYrUFMwdFRaL0ZpelJ6S2p5RFY0?=
 =?utf-8?Q?aYtz/NxmFVoM4mnUcLB9vQPOZg4//Q5/Qvbj0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9c41f1-bf69-4c41-5e1c-08df35c2fca2
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 13:46:08.9727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: klCGL2XcVYIO+DkD4UYXX2HozJ0obep783wv/Ug0xmr03o5Av0/f/VRJvqTb5oyrBDrICwAIYEvge98HDZRWVjxF44VSOFyOIJ1qWBxdOoOIoH9s4jqDAlH6xe31t4vq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10711
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_064615_405695_5537AC63 
X-CRM114-Status: UNSURE (   9.30  )
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

From: Peng Fan <peng.fan@nxp.com>

Remove the unused pinctrl consumer header since the driver doesn't use
any pinctrl consumer functions.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/gpio/gpio-vf610.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index fda3633ee2b3..4c46342bc66c 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -16,7 +16,6 @@
 #include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/irq.h>
-#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 

-- 
2.51.0



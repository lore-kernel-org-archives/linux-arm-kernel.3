Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0064F606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 20:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wanx5Jr2;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=FKXw25lP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/Rvu5F94rRviJHWhqy0ahQMWuTdM8gGw5tKHMCUp0Xs=; b=wanx5Jr2I03KEvlAUFNF1UIEVL
	SMWfMZkBkyPQiYn3mGuWfMW+tBhu5RUx6dNcD0Qub6tC3vz7tr9n6cDbEr6oX2DLp9T4qrG11me5+
	TzRrEqUfcA1PT/2+8UYLHOquu41Auye6jtyleu+C7ld/EoqrepZkR5x4CPlWe7O0K1hpvJNMzZY1p
	0y1kb8UFsnTGL8HrhGGPUsudC1DJDGv3SQ59dW0svQUMfe5OXnFkV+K9WLsU7YahkZPkTxl6E6jKF
	tSwd1FeZfqkvGOOF+xVC97/uGSYpRnQy2F3qr1k8AGZ1fFR2ilLuMbVdAqlU+ixLcOpJHacAJ8oI+
	cZ9bo5ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJzUR-0000000EwJt-3LUS;
	Thu, 22 Oct 2026 20:34:19 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJzUQ-0000000EwJX-0sWh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 20:34:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D8mdg1+HZxQCrd1xLG2agiJVrfhKUUtDFhx8GEh+U8DdbvtXh4u/IhglChJl4AfS7xv0qrEZclNScmf8vJOKndlUVN+TB7I/WxzP0e/hjns5zdyqhjDSvI32imLZmYsndsWolHXjT8mb2dmf2ucdf+nWSoEe1O3sm0mj8L8ffjG+Au+ZieVnTPZoZsbXmKVwRw2twu7AvRrzrF2O3Jjj2ON6d0JjUoPK13liZsriverl4SdvbDavONcLEAbINl3cEgUCWNIMHwhlSrHY6fK2JX4TJre8lktaiCi6xe1wnYfxym5zdKZqPJihiTFppWM6y657oQq2p+n2TAIO26gRqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Rvu5F94rRviJHWhqy0ahQMWuTdM8gGw5tKHMCUp0Xs=;
 b=bk2flw0sf940Z9bx8/JW+Jrf0av3RCFC0fidH8nx+4u3rMEsgiCIad+eMB0TKgrGdEQmD7/tGxU0zC2D8Z6bJ30SEVwuFcY+Ro2dMyRjocZ+xhX7dBVegHVx0+SiIiJWMljYqypZjddZOLjTIBWFHtH5YLnHoN8avc8O2Kvp4TCzVFSLhM1P4RECGlakQ9woBWC9o7D4YBf5st+V7nA57ISDv9+Wq9LyjyW+s4j970z9TvctLvn1nqAFbHcvwL/2cdPz4g/isl0WaM3OHq5akM5ysSiTGwyDlTUgtIeOKENY3vHaXCdPqoErkN2gTmavJXXZM0KdrJk6hRECdn7C0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Rvu5F94rRviJHWhqy0ahQMWuTdM8gGw5tKHMCUp0Xs=;
 b=FKXw25lPGJlIoT7IwK85Eii/lWAVG2/BrRj5cXs4QXfnRl5T2Ir5NFOV1e04QBcswpjdN+0aJw0PIJRmFXS7cWbGCHImSc9ni3JL2ZMCsD5yASW5WOsbv3vVSz8cXMwSZ9sBnROotQksevmB5imT3yiTtR2jU8wgLCPQTXUkGKiTxIZ+UEi5ifPQ6MqQKfxXmuFxoYSY4P9hvP1j0vlEErhIO2AK0QNXIU3j+CFoYPpAQufURbOj+Vdqwg+qpnR/mAP5GusTWdRuHjmJqq3JzcCBwyH1kS7MbzeJ/TKF3WndnItU//lTD99wvTs3qAgOP+jDv50LGosvk7f/4xBeWQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS5PR04MB9970.eurprd04.prod.outlook.com (2603:10a6:20b:67e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 20:34:13 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 20:34:13 +0000
From: Frank.Li@oss.nxp.com
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Luan Rafael Carneiro <luan.r@variscite.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx8mm-var-som: Use the official product names in model strings
Date: Thu, 22 Oct 2026 16:34:05 -0400
Message-ID: <179270122848.1316256.2871932896729483164.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261018142310.28242-1-stefano.r@variscite.com>
References: <20261018142310.28242-1-stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0075.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::11) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS5PR04MB9970:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aed095b-54ac-4bcb-0bff-08df307bd58b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|1800799024|7416014|376014|366016|6133799003|10067099003|22082099003|18002099003|261021121427099003|261021123027099003|11063799006|261009223027099003|56012099006|261022075727099003;
X-Microsoft-Antispam-Message-Info: FDugiYfdqHm7e9UMu6KYUIgSOcRbWHMvZMS/hxsye3w6vcSusunh0JLOt2meAHvszEbeePQi2/OS9OeV2dw02OBmu8gpVianjugTnpxcUpHxGqGtALUFdi0tQ3lNYKadYGlGpyDZYucCgf0bx7QCH3SF9RrofickpsktMs7D7PJjklvrwKwda/kqN1mb91sDEZM4wHVRMVkwd1NJCNISHU77wVZg5jfKHdjCgeCdvFo42SJtv+9Uh8xZJC15Lqv+E3L3V7//f8kRl8xizylSoVUL3V82tDKjnyE9vFUxqA0wN7p56PEFwITa2G3iU1gQDEoOzuyE6yUk+gc2mV+xwA6qnLeDNidYuNlVTCgaMSFp0QRrV+myDj2HW11qcDhmH1uwUoir9/9Tw8DnR4Vk5FZvNehNvjf4Jgoqeh2ynqzeVQ/TflL1dr4d4xaEWSW1CauAhSsO4y1N8U7bwy7uwrBktYba0ExMJ76FEK8fj4fdQVC/BOWV2/rBJmZdBLgNmt0wdGIwhaTE/qcvHU6LQC29m3CxZ0UMAj/MhssrP5IWGy2NT3+nu85Zxj6POo5MmFTJ0NNYnIOOiSVDPonm0e5glbnV9KEvLP3oir+Y95Ho7rSSvcQ84/01OilcMlJwKdJSs/hhuUk8JVaKHIWbPccrxG/n0WWIowUZ5y5ONuE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(7416014)(376014)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(261021121427099003)(261021123027099003)(11063799006)(261009223027099003)(56012099006)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2c5dGYxQkgzSHhnYzhQTk5rZDJHeTFWdC84eEhtVW1UbDNyUnlkdThBM25Z?=
 =?utf-8?B?dG5yN3lCbTMyZ21QT2ZmNWtzWHNKVHVoclhMeFFqZWN2UzIzQTRtOVgwcXZl?=
 =?utf-8?B?azVtSlErZUZTNnVyN1IvY0JDSERaYU9LZ3N2VWFFL2NLWGVadGpSRjlwTTh4?=
 =?utf-8?B?NXo1Wk5obklNdWtudUJuYVhXQm9VclNQamM2dEZMMk5hRW1Td1pPTjJpaVZy?=
 =?utf-8?B?VjBNdUN2Q3l6YWxORnkxOXFWL0pJUElyTGMrc3NOaDVVckcvam93azZIUXhw?=
 =?utf-8?B?K1h2a2VqZ0d6enZYcWdxeUh0V00yaEpKeVdKY3poOUo3cVNvdGhqWUJ3OXhB?=
 =?utf-8?B?QjZYbUxZSE9aUGE2bmk1UlNWOUUxM0lPQ0lHTmx1TzJZU29MZjhmL0FBakZp?=
 =?utf-8?B?TytMaHlBT3hrTU9yMENnRFBRazh5RmRUVmxzdVVhMW9nMVRhRjhSSitsVG9V?=
 =?utf-8?B?dElQMWYwajR1cVNGTUtqU2ZwdFJHS01sTWhMMm5ITW9KbUtMMTNnMGJneUZH?=
 =?utf-8?B?RlZlWjlabGVMeE9aUUl0ekg1emJrZ3dWVjFHbTB4cWVFSUdnMkxUdWg0d0t5?=
 =?utf-8?B?dVYra1M3TWV5QktReHJJTWN6K0xEZHZBNDRreHRxQVU5TENuTDJNN0hyWkEz?=
 =?utf-8?B?dTA4UFpWTUlHcDdxcjBPWGZ3Qy9hN0ZLM3dmR1dDd0pCcFNOcTBvNzFGOHNB?=
 =?utf-8?B?cXZxSU84TFpaSGxEV0trcDNsRGVZd0lXVUVvald1cmxrYlVleGk4cDhqT1FH?=
 =?utf-8?B?c3EyRThIU21lSThnYkltazM2K0ViK0RVTGRNMFpRZHNFemhzWTAveTZqeHIx?=
 =?utf-8?B?Z2FmWTJtUzEwZkFrb3QrK0xBc0t0YTJHaVVtUlRCYzVxNWY1aitPbjBsYmZ5?=
 =?utf-8?B?ZHF5VkZmd0tNRHJqZmRuVVZDWkpzMGdsTVVUc2xQVG5zRmVNcWRnckV5b09K?=
 =?utf-8?B?K2VETVdkMXIzOGkza1IwbFZQbFArKzlSVHdnWUFiSEJoMklpMUZPZmRzVnlT?=
 =?utf-8?B?RDNjbUwwWmptQ1ZYbG8xMm9Zbjd1NnFTT0UwRWtjeXUwaUE1UE9ZUmdhR3Zm?=
 =?utf-8?B?ZDkwTVl5V0pOYXhvMGdyaDd5a1M2MjE3a3BmZGl6Y3ZWdSttV2ljcFRZWjBM?=
 =?utf-8?B?YzJuZXJTSXd1eXk3YlRPQjh5RU95Ty9FdU5LNmQ5VEd0QW1uQzZmcFd1cFZq?=
 =?utf-8?B?TVlpZkhnNVhaOFBCQVlGb3BPbEpHTXR4UG9hZVBuSDBMb1VVQ1MwbHhyS285?=
 =?utf-8?B?dWtsdkpjSm10WDg5VGlCc1YrMnl0ZlBJdWNzQnhqMFVVT01POVo4bFNFZkNr?=
 =?utf-8?B?QndmbDcvdTRoZ2dFL1Z4QUJZNjcySFNCTlNCVFJucHFwclNxZW80N21CT1oy?=
 =?utf-8?B?WHpKTlVFaVZPMjVrYXhxWUFpTS8yVUIvZmdkWWVaTVNvdTFJdDdiWk55MWhz?=
 =?utf-8?B?bkhkZEMzWDR5L3RiUll0SDUzSHdlN3VTaTJuWGwybkNrOWpORnlIQUhqaFI0?=
 =?utf-8?B?c0VHTnVxTEhQY09WU2lMSVMyUHE3T1VkSXVlRXRES21haUpZM0ZaWjhGNEVC?=
 =?utf-8?B?THl1U0NPVTk5U1RNU1l1dG5pTDBlVmFVWnVpcWlMZnp5MjhtQVpmWTBpQkpY?=
 =?utf-8?B?WnBtTTJaQ3lPNVl3MVVNSG5uL1VZY3crd2FrNmcxdlNiejUydDFHeWdQUTFF?=
 =?utf-8?B?cVZ1dEdBS0k0aWNXYnBMMHZLS2xPeHl0b0VKRFcrdnNkVW90NDZRS2kzS1pn?=
 =?utf-8?B?ZkRTYTl6UlVWYlBCWThSV3ZHMkFKQ0JrZDNVQldVWE02U2Q3amM2UjJJVFRN?=
 =?utf-8?B?b0JFZjEwWWtXMFZtVDNjUEwzZERVWFNwaC9jaWF0Z0oyYjJRbVJQOUVHZ3ps?=
 =?utf-8?B?WW11N3BMUHd4MENydDJNWkNvV1hua3Y4ek1aS0JBVUF1V25UR3RWd2tWQlg2?=
 =?utf-8?B?OHVMSU5sM0NIMlVQUHlTQlZsUXhCTW1pYm9xdmEwQ3VpOStwejRwbm9Cd1VZ?=
 =?utf-8?B?RGdYcjZFa1FVSDI1TEZ2aTZ0SkNEYWl2Wk51VGxHS0wxd1FoRVlpcUZkQXY4?=
 =?utf-8?B?dEZEWHJ4LzZlbU9BUW1lMGtZWWpaTE0xaWJOeUR1VUxlUWx0dUlXdmsvMVhx?=
 =?utf-8?B?MWJHbjFmR2lxNGtOUXVNZ1l2Tkh3LytlcVZzQ04xR0hma1FHczBBYVV2ZUU3?=
 =?utf-8?B?b29ZTmtYVXFvYkxkbm9SWDlQRkVCNmVCZTZpS2MzeU1FanRCVS9pZklTUWdo?=
 =?utf-8?B?UWRwL3BWcEt0cVE0ZDVsbUJ6MTVhTUFtVUNtYlNGVmJNMWdKblplTHlPbGhJ?=
 =?utf-8?B?TlN5Yy9OeGQrQkEzSG5lbytLVTdwWTFPMWJDMUF1d3UxSG5DTWUzREtjcUdt?=
 =?utf-8?Q?77fRbgEh/BpKmNe2rToRl5NUiTv8C5UA/NVb1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aed095b-54ac-4bcb-0bff-08df307bd58b
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 20:34:13.2784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gRLcToCt0zVkeJOmymlQ25LFEmFqp8qIkI5P0yBg2t+FYT0pE1ccBVqVa4L0yOeOots8AFwpKtrMVh37ZyyjY3/hc0dc9G4K1/EzNF7qC4krvf6quXPv7bwCc5dG5o4x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9970
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_133418_274042_8163A788 
X-CRM114-Status: UNSURE (   9.23  )
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
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Frank Li <Frank.Li@nxp.com>


On Sun, 18 Oct 2026 16:23:10 +0200, Stefano Radaelli wrote:
> Replace VAR-SOM-MX8MM with the official VAR-SOM-MX8M-MINI product
> name and identify the carrier as Symphony-Board.
>
> This aligns the model strings exposed to userspace with the product
> names used in Variscite documentation.
>
>
> [...]

Applied to imx/dt64-intend (will appear to linux-next after v7.4-rc1),
thanks!

[1/1] arm64: dts: imx8mm-var-som: Use the official product names in model strings
      commit: 3fe668c42994675e061b72b6e393a0fc7f89cbd5

Best regards,
--
Frank Li <Frank.Li@nxp.com>


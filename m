Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1018BCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 20:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtdvuYPoePr+9koPxqm6pZk/Sfo2YFu6eHNI3S/4xhk=; b=GiwVBWqX3Am/P3vn7MJs+kBfhq
	//a1WcOeZHFMfWCGN+WPKAg7tz8i/8Ln/tWMy7b9s+aDj5b/BmkstxhucqzITQVr0m/UcvvXnZhhn
	sY+sp2mdCzIDo0NxxCs8RgOQIQ57vJgXkJM4VHrkT0ahKII9czgPFWznw6tor5nKWx7MwTiCRnWSB
	fyoGYWjZwlQ94E6sfu90GbCt6f0VvKlrKJ062tsVWutUGEwK8OkdZ3w2wBwIi3uxsn4KRzoJvAe7E
	a+lRqXvOfZwjrdFr00SesuLuSmuUWmIqijFoTWoucAjR5KbMlMMJTl79V54aOSCGNyvODdHKZC0/z
	K7IKfZ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU9ZQ-0000000BpNz-3doU;
	Mon, 01 Jun 2026 20:49:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU9ZP-0000000BpNr-1l5M
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Jun 2026 20:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dtdvuYPoePr+9koPxqm6pZk/Sfo2YFu6eHNI3S/4xhk=; b=MikAQWVzi6JvBodIa3q3lXpJVM
	F8ZdfxOesdlEkny4HYVDVykvR/7RHPUMJqEdPOi9WFikY0+Y83L3OYCzYXFteGWFVOrPfzOhW+iZf
	+xDNY7Issc271b6aD5i8FCNChyPJqYuARu44zh9Onm0O/aWfptg3qQTCtOQr6ng6giOSbz2ZRnlqs
	rpuLb2IC3Oak3dBR81VbfguaOWRsfoW4SoFquMEAIQP4TqXJLfDwL1uAV4pnL1QN9rCdRWEfvlgVW
	1GukyqLjuDXdMzBNLMh93+DJ9PtXsciPJ4AX2s/VCxybty6id4BTZhFWQv5XPfIZeL6z1PKGKRac9
	g7da2C4w==;
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU9ZI-00000007jOc-2dXu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 20:49:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AzuUdxnBQRq4I51Gw7wNL2mcIiV1Vf9dLfnSHzVMHjIPcGFs1VqY6fnEoJTQ+JnMdzLLgQMMpVkVa0fXpV6QyijGUnh8RdCziyJOXjh79/C/TbPnUJZtTtsvSyZZfFTtyG5IEd4U3VtD7kenBvwwQT0CWubOwBnPYiPnlMGYFLh4Z7NN53B8aB83kVXwEuxWLs+nTLqYtz+bzdfSgtZPoggyzRjZJ+wBsZRF1R1vL150Y+BPtFivyTnA3hSOaTTCfbxrQxDrKU/CFpkOamdTZGeWS/urKYnO4CVAr/xYPXrYJvFp3SnJEKPLp+yJZIDfqwdNsNI+rkhVmizq5sfNHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dtdvuYPoePr+9koPxqm6pZk/Sfo2YFu6eHNI3S/4xhk=;
 b=itE+xQTNVstjBPs2Bl+WpiBFirQLkwc7TJPF7af27WTQnPq533ojoG3Xzu85smbfudKlJKUR4gacknbpKcNFumJYoRWmVMxiIODhvXfJ1dh+BzRbCAl0hr+AmnnwUGQPQknnkh1g6WgLUld4u2gA55jdT98pjpjwL9ATszvRW+buTvbZ/5sN7OIYZF0Wkhh/v2Qa5B3fxMHMFNsklSCha2tljaNtz0EVeyG5S2CgfdQlmJRlr5i0xMj71wmG3eQhHurWCvlfta5szxKuMK/SwzOpKmpl1nxGPc8hOOjiycm1S1gZYsxpiOArolsd2rW7/NKKX/toxYb/ogwuBB6hPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dtdvuYPoePr+9koPxqm6pZk/Sfo2YFu6eHNI3S/4xhk=;
 b=BpZ+sSmotWrEj1EKaqdYJndDOl5vjdotfNOskLk1RFAYzhuWyzanZB82Wzgw7l2OZl7/2ThoROnwxBtiEEkAtURyxHIdM7ro+0NyEJvZml9DNI7SiwNkIN6ziKlSjelkoTpkH77QLAn5yrecp3olJY/rTRb0/G4+fZ+80603N4ZzSNGXVKLN5gtgqAi4ostIs5MZcu6Y+64yvvWo00PklB5EnsLiZWxtk/uf/LFVREYJDG6m0XsM2QvSfjAwJO1YSZ24rXSqcjrkhBMl/UfWfi3whhSnsSYVSN8GAsq/xv8xL5K2S+1uNam4ELP633PSPJilklOqwYy8EkjWvayYcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB10976.eurprd04.prod.outlook.com (2603:10a6:800:25b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 20:48:59 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 20:48:57 +0000
Date: Mon, 1 Jun 2026 16:48:50 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: imx93-var-som-symphony: add TPM
 support
Message-ID: <ah3wMi6QW6DUPrS4@lizhi-Precision-Tower-5810>
References: <cover.1780051874.git.stefano.r@variscite.com>
 <64adb6f0cf9efe107c761e1a69b9a63c7dd0141a.1780051874.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64adb6f0cf9efe107c761e1a69b9a63c7dd0141a.1780051874.git.stefano.r@variscite.com>
X-ClientProxiedBy: PH1PEPF00013306.namprd07.prod.outlook.com
 (2603:10b6:518:1::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB10976:EE_
X-MS-Office365-Filtering-Correlation-Id: 26b2f2c2-1689-4b86-a580-08dec01f3397
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|376014|7416014|38350700014|3023799007|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: i6ZUVZ53e1xMS6TXEiXvkRgvOp2Et1eGYpppEsrSZyewTQhdQmRAZooxcqE1BHUs6oEYlpiTo6rBmxxKQzi5HIBUxIie1FDB7T7HVQmjrzATxgddTU1MpCvKO9JAvuTgJElxERiS4MY6P0FtRKfqQO+sjlCsrWD1Tpa6vt0bPNbz3GQRrtIBYfTH7rM1mYZTwEz/xyVnXtX8gwIbBvtREu0Z1PgDYgwjJg5OO9CQ+LWKmdpe5yArC5qxZGrRmYTSYzMCJttj1t78EXCSmGq06CVRkP3Fj4yWzE1uSDMvj0rYQxA53QXvCDgZdJ2GCJ37HFFqpsakqgwoiHpqBEoWD2MPHvTzYRSjULMt+QurzedyFaFyUdbJmEAaIvLVaUcs7PiBqWxOQVo1FOTfYXfy0txAhv2jNhW/D3NuBMTRE0iCNXbT8NCcBRiT+DoSHjOMixAGSMRaL84rcvaHEUalkFHAlBvC+zkqLzP9e2N1y6evNpRAK/5E50k2NQrujrNqOBQjKryQAS6JGM/5PRfOs16OvQzay3xGcOGI5QbUMJtoQuQfTE3R8AbICKU62kovBPDeaxW/UZjk7hkSQK0zUEluwdHzf6sGapQj17n2AvbaBe8g/9Vl7yXjuLa+A0Tr8bKDQKBJuZvnZy9u67A0y0XJgeDQ89ZPtZ/UGoPT+DX3c+XZXLHVANAx/O5b4xyTXKGRFSSYy1Ijd6WXCghbUarsR6tNeBKLiFv/2MY+GRi9usIlTA2hsvGf2yIW5w3r
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(376014)(7416014)(38350700014)(3023799007)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jH+JDXjn4cmRQ8SlE+VZlapsoFDy9b2DeNXmF7ymoDhzH9N/V9nCz1VcMdFi?=
 =?us-ascii?Q?BPNiFHHl6ijcup9xZZfNyzStNa8IN0H+TAwgIe4n2+T5x4HMLwdEFa2cBpfR?=
 =?us-ascii?Q?HT6R1qQDT90HnrNgPjDvI1U0wwowERgfwWYHRGSJZOLdp5nXa31KJSXW0uGJ?=
 =?us-ascii?Q?4VLjAc2RSnDmS+n3fEYXpGJvlNNzXcp+n87RQGeePNmSlkyowVXNt2dji2VP?=
 =?us-ascii?Q?ixAQxQFk4piGtUbRQlRHhbV2ZNlEmtwb1yMuDML/ZEmqAYC8v8KCfnlrdXUT?=
 =?us-ascii?Q?Xcg1353n1zctHR1WOo9k+AylxVw8kT8DjKANl3YPkTwVfwD9L3lec1X5VS3K?=
 =?us-ascii?Q?w7m/Mm++034YCWkilKtZxuwFgkT6V7y1AYf/QYqQFkh0jfTE+V4eUdGZvcDC?=
 =?us-ascii?Q?7vKIaa563WxZH+cr8QlJaiEb3Y11d07mPii2VC1MrCfidjcNRZDBLICJeQPB?=
 =?us-ascii?Q?FHOmsgmE4QM7WEs3vhsSNgKasLjgMecyTqxU6wT8pRf+QyE3bhppmOAsEK3W?=
 =?us-ascii?Q?PpXCKIoGPIw2nk8U2pKcN9v3Hh+L0pFNMnX9P2b2h0AylSwILeo0BVReaDUt?=
 =?us-ascii?Q?+snOo+tt6rVvCG65/p7X88+slNXRjKtX0F0sCKB4gul7kkaKJHKTof3AUFXF?=
 =?us-ascii?Q?d1RW3s+Gnqz3X8Bm8fBgU6SeG21INzHJrfqxez6vrmCHV7QHkUOOAGN6CIhM?=
 =?us-ascii?Q?KYoq+PRnbYlrv9b4u9gl2vFu+8VwSfYQkBlTp5CZiiyW7cZnWBLgmfnkPCYR?=
 =?us-ascii?Q?jJ7J3MsBPTIfT3GgJ3l6rXPWkng/57WVL5iFU3qurO2/B2ROZXUjWMHbDOno?=
 =?us-ascii?Q?RB38kwBCkyIXkjpiRS0w2Jb3VQI7rZYFvxNBkfJRA8i17qKls42+JhAxXp/H?=
 =?us-ascii?Q?74oyAzOaMzu9Kibza6G+6dOw87+RVtINFPEm6RsN1WiqNDvxyU4MykkvP/pM?=
 =?us-ascii?Q?bwmmawOgThu53XdTOMEiouVUR+KJkxQS2uf5ha2vyoaab4nfRC8AYIhs0jOa?=
 =?us-ascii?Q?WTcluR0SLebhnZueKjr2rLM39perXTfGn3wxWS8nnQ/sRFoeMsmdVbmV6nIr?=
 =?us-ascii?Q?FNqS/U/NApuUZTamo2+Rs0yH1qfMJZl8WbxSonA/9suJ1UyE0guV+tsNu7TG?=
 =?us-ascii?Q?dsLG1q2LdEfS8MWDvaguUmZ+po1zLKqscJ+/tQc4eKWJ+7aPASI2EY6BOfyr?=
 =?us-ascii?Q?AzZXW7R5VTklJT2vIjAGheqSykOonwoiZOLgN852r9Yj52DqlN2qF2BUqV2Q?=
 =?us-ascii?Q?VrbiPc1jo+Bea+Hh8/G1ofmJQjA9EkI9qqG1EuwrmRWbvfWd05ip656I++v2?=
 =?us-ascii?Q?4qD1RgGUS8V1ZjYbPbYVLd9JAASrvmJdr0+5ZaFkwKs5SsKl4fXWbvY3rcOE?=
 =?us-ascii?Q?ySq7UlhgiVfpO7QBslBE3cPrFH94GJ4QZcvbF07rKHjE/kE7ymNuOH8UXH7H?=
 =?us-ascii?Q?TTyNkVf/F9wndJaYBwF3weuOQHfer+XWCA5z+3jSg3bwly9rdD8jo6FP245l?=
 =?us-ascii?Q?DSLRgiQOA/kZjXrixLPcnLMmgb+4qXEKvdyREIg68057uSH8Z2PBh5Y/jBbF?=
 =?us-ascii?Q?a2nsJKV6qWbVLki3C2DerMD0+EKuiZ3UiIV+PyI8au0FWBID4pOxbVZ8Xt+A?=
 =?us-ascii?Q?I3lAINMZ6aDU258iS4T4AbhZ50plDzbqVMYzLtZpEwMO05c7LIIUFfRVkKM+?=
 =?us-ascii?Q?oKgAwKSEMPoG6fH7dIdHlkTnYG7VWwkj46ynis6t3hjstIXw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b2f2c2-1689-4b86-a580-08dec01f3397
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 20:48:57.6430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lcWAMOl3hMRD4P/W35pu8CJUZO38kDIp9z4SfZWJ9D9rst8qa4/xzUvuyi83b/v0EqOJn3mXiO0eBRdF77IHmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10976
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_214905_676563_CC315A08 
X-CRM114-Status: GOOD (  21.13  )
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

On Fri, May 29, 2026 at 12:52:44PM +0200, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> Add the ST33KTPM2XI2C TPM device on the Symphony carrier board.
>
> The TPM enable line is a board-level signal driven through the PCAL6408
> GPIO expander. Keep it asserted with a GPIO hog so the TPM is enabled on
> this board.
>
> The TPM binding does not provide a dedicated enable GPIO or supply
> property, so this cannot currently be expressed as a direct TPM
> dependency.

there are reset/reset-gpio, can you use it?

Frank
>
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
> v1->v2:
>  - Rename pca6408 label to pcal6408 to match the compatible
>  - Clarify that the TPM enable line is a board-level GPIO hog
>
>  .../dts/freescale/imx93-var-som-symphony.dts  | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
> index c0842fb3cfa3..f541308ebf6b 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
> @@ -208,6 +208,26 @@ &lpi2c1 {
>  	sda-gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
>  	status = "okay";
>
> +	pcal6408: gpio@21 {
> +		compatible = "nxp,pcal6408";
> +		reg = <0x21>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		status = "okay";
> +
> +		tpm-enable-hog {
> +			gpio-hog;
> +			gpios = <4 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +			line-name = "tpm_en";
> +		};
> +	};
> +
> +	st33ktpm2xi2c: tpm@2e {
> +		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
> +		reg = <0x2e>;
> +	};
> +
>  	/* Capacitive touch controller */
>  	ft5x06_ts: touchscreen@38 {
>  		compatible = "edt,edt-ft5206";
> --
> 2.47.3
>


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC35606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 03:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bxrN75Bm;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=GvA7sn/+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HZpxqQ27CgLlc6gGXPJH+JRCjxgBupNXWZLzMDDqkp0=; b=bxrN75Bm6S27gaWEFu3xLOcZ2I
	A0qj1DzcbmyN8si3o255ebAryp+4XU+23d03glfBPPtMi029t4uUAwqkXIGnSoQMKgUFo88O5M6+t
	0XcDSc5C3/F813d6l49Mqy+8HkibE52aXAB9HX9thSd/hgPJ+HJU1+8c39FBtnGfKWHCgAVNJpM+5
	mnGjNuJTtBUfnXE9EnI2hyHLK3ZqJJtsshVr/9xrbFxJuPUeSocCfi7LVBT1XSi8Z+uJGWFQ9E/9E
	THeiSihPkze9/g514DyiktIogWKc7hK+HUYJkjbrlOqLdMQQQ4SPyYsZMtT0NurJdjfOcLVIsESW5
	ZLA2/2pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xORlC-00000004GKY-4A4L;
	Wed, 04 Nov 2026 03:34:02 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xORlB-00000004GJi-0U3r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 03:34:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IySKAncn68ZL8F7+UUn2iYlGuZ8jIL0PjAGfqouuf6hq33813ufrS0C4A3b4mbyiUVGfNmzraNQ+7bqKy7KNXSusmRkkRYO8Oa8gcWiqqFp+hu2UCCYveJC+cZrIszPPMF0EhBAQbz0MJuM+6pikuHqiqctICz7pwv4eOJS96R9wlFznO6lM4eplVsSVfkDlEEvxTEB2KaRuItGaAU02ezf2ij805Xk/1UdbyqEcxS0wz6AzClM0eIi/G7KTjtqlwRnjmLOSV2MeZMUwgCBBFuRT9o0DzuZ92n/gB+Ua+okD/s7QV0t6i774uReYmX8XO1wl0RP4YGyE6yh7PtbunQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZpxqQ27CgLlc6gGXPJH+JRCjxgBupNXWZLzMDDqkp0=;
 b=BRVSj7TuSbx60OSX8+wsCRzzSVE0sCNOFyL2aF/XQu8aNhJOECNZ0+0/EjQoOID+MLsK4oiu8LoQ+igpGUkINUmrccOBqSy9xxdwLc6NUTpVyeP33SfsWu5cU0hWrIHkNZ0tN3MlLRmvylSij/WpzztEuZiYYUfo6stVon6udJdzaAvJevS5fgQvH0FvN4lb9dyLZi8IdEyMdb9URyY7WYGQa/rGUKNtbY8EZ1rJxgzGVG+NhqPjd1XUTXYFa+2Ui52XIqd7ywTuuSBPpoCWq/8FXTmUUYCvE3XSKZDwcqnC3hMXoeEs4ROjHogosAYv/JX8sEIVojk+TGJ2Kfbz6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZpxqQ27CgLlc6gGXPJH+JRCjxgBupNXWZLzMDDqkp0=;
 b=GvA7sn/+wjUVF7umaKyYhzB9oZSxmcYVxohpGFzQ/asCtEcLlY1aAmbfcZ+kTP0mo2/KoXts9GmrRNWUtB/4HyvrTjJChUS8Emgh5OWNC3VQrA4xZC7BIISCOdnvGLWrJP0Mm08ZamLI+k5lAFTrbZuJwTK23aHXHj6e+4A6T3clUdVINAiNN11eiT+XuO/nt8FHm5P5DvozQN20X1TNwpxcPI9EHfFCm3D7saFGzFpCloGDS/dGhqwPZfwwABeqOKUQbsrSwAWFKRlHpla+W96PmN8ELtAtn23IPPczZdH+hkze6Y7rZWJgkvNdRHcMCHf3K28uAvm98mQEPRxvBQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DBBPR04MB7868.eurprd04.prod.outlook.com (2603:10a6:10:1f1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 03:33:56 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 03:33:56 +0000
Date: Tue, 3 Nov 2026 21:33:46 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Chancel Liu <chancel.liu@oss.nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] dt-bindings: connector: Add fsl,aud-io-slot
 binding
Message-ID: <auqnmulXoW-iFYJI@SMW015318>
References: <20261103070433.2307145-1-chancel.liu@oss.nxp.com>
 <20261103070433.2307145-2-chancel.liu@oss.nxp.com>
 <aun9Hj1Ypc_xSYtL@SMW015318>
 <5815460c-f8f7-48d6-a0f2-3ed56e20bba7@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5815460c-f8f7-48d6-a0f2-3ed56e20bba7@oss.nxp.com>
X-ClientProxiedBy: PH8P221CA0056.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::11) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DBBPR04MB7868:EE_
X-MS-Office365-Filtering-Correlation-Id: 64662fed-f9b7-4583-0185-08df3a247483
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|19092799006|11063799006|4143699003|56012099006|261022105027099003|261009223027099003|261026121527099003|261026140227099003|261028144727099003|10067099003|22082099003|18002099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: 3TnPq5X5SiQVvp9Iywv38VrZfrYvpOTUCZGUIQ3DlovCzuYSrVSvSnMITW9Mk2jxJfWH08LUuneRNRpv+3Pb7CmRcTrHkdwRAXyr7yhE5aexjUhylI8h17cL4Q3F/gfWQNwAcC6DBdPgoHS2MkhloG4ru3zImm/A9Lty2q/ehT0vWJJMTu0+NY8MSj93b1UQ24O0uU5MkuRotuwlGHA0T1n6fWToprjZJ8EbN1TVuvgdoPlFKUroDvwcBRwrWEAYhpmi8VYHjYGU8K2Z1kK/iawKz43QYHnKKEbWsu8k3HUz2s3wTB1dF+cTs0s8Q2v/b/gwEZNnJDd9XEwf83URIsU2727dggp32eO8jpnt9799jfkr/d+bFK0Zz2cHHkJJc6Lyi60CsNdAxXw48hNgTc5VMuGV7kA30+8pODLynn1DaU0DWe5Q1TCoY0J7L/2CZ+AJd8jrJFKRLdRSCExGNz+vkW6gYRYQZKvhiHtwpzpdfgAE2eWfqptg/YmRFfyQX8EHtYkw498IciYnxcCoorwVJ7BIIUN8m35Heo+bqI/jEkjHTqHFHnSXHXV8YX4bvFE7oVkuRWZvYBIoXAZAOKcgz6s8Tl0EoI3IU9w7emAgiXvs00b0OAb3FMca4j7z
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(19092799006)(11063799006)(4143699003)(56012099006)(261022105027099003)(261009223027099003)(261026121527099003)(261026140227099003)(261028144727099003)(10067099003)(22082099003)(18002099003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y7p988niKBm3+s92K28meIirz5OhEc3I4moKSp3V59yJUhgBrZLZKeXOW7m7?=
 =?us-ascii?Q?nHzyh2vwWMEr+A/Eo22BioDoKW3TwcGTSPXCN7tzaJAG3vK3bMHS/ebzbPZ6?=
 =?us-ascii?Q?XSK8Tg/jtVrXpuX2222sfQybBv+3UemZLyD5hHwFpo+Ux6cmlKNmQLkwIr9P?=
 =?us-ascii?Q?n0XHMpkD/fjrrkXpgSDAzhltGcRevqfxMGuinQWn9Z1W1i1NLNlNWcLwlgxw?=
 =?us-ascii?Q?llwk8nYIcefN6Ip6iG8nQCXg/lCaTwjyb7OdE3IH3fMgbY7OQJ+V49A5fnam?=
 =?us-ascii?Q?XMmBEZU37nwh3AMjY3YT+7H9aPpk37x9kbSYO7HvN4sYhffnAhlUSzuBMBA8?=
 =?us-ascii?Q?xSkEOgDitguOW5gRjM5HlZre1V6DR5G8B/y1j0UlPXoQ7vgWDI34hDKW/f3X?=
 =?us-ascii?Q?njAxc8Dc6u2K/+VX2bi3GZLPUBsQHZtq/pg9UK2LMz5KRLx9+cUbsFEx/dLE?=
 =?us-ascii?Q?CpLWyxEUB7wnH72GTNdQ7HiJaT27EyPgGDkqem1UCMp0dkCeWx0c0rTC5qhX?=
 =?us-ascii?Q?NjJC5RaczFdeyqGmDXO/qL+PUsuRPvsIqV8za2ZseRoL1jMYBWr6P6Sht5ev?=
 =?us-ascii?Q?gnY8HtYF/W2PnVsau1R6cSQnhfvx0R5HYeaGAxXU9BLgpR73UKWtrLOlvPFu?=
 =?us-ascii?Q?Mcwa01lBnjczzSdS7/ub3M8FzQuJSEmE8mxm/x4CJ9Nh/bykHcJe+WaXB/Zo?=
 =?us-ascii?Q?4R2DxmR14oBLp/h0eHVGN0oA0grXJNxaxk9zpXksKxJaMCc4JSMokXODuOTu?=
 =?us-ascii?Q?NYYjikzOu+8Zz6RP/u7R2ejj519l7RcfMOOWJPouhIlF/ISexk++Ay7ONY+4?=
 =?us-ascii?Q?b38t1/lBmoQ97JKL0OKOya6unNhtDjMkoPDD22wiGhkNy7lQyVvYbnOgkEfO?=
 =?us-ascii?Q?wlXE7/ObdwvFoU7/gW+/2oz/QL7qkbNDTd62nWUZX0f/0ZB0aH5FI3ryk0Hb?=
 =?us-ascii?Q?2qc/Iz8nnZMfC9RRVePTlLlnkYZk5qDVAzdaeEnistTIuIq3dONH1qY3JZuH?=
 =?us-ascii?Q?B9E5Fsxa3ryH6zSgwatu8StqkpU8vA9+09y9QnCre+lwfJwqGURw05Ps+hVW?=
 =?us-ascii?Q?9o6zn1xaijHLigqjJW8x0uw+h9XbYkTxv1sU+6deMnwwb5GzLfznDvOhBZTq?=
 =?us-ascii?Q?gublEqJk1bUDFANkGgQ/JY5AQXJDar3HC6+ssumk55gJgwkYqr3OSAV6Gu+g?=
 =?us-ascii?Q?VSa8njUN/9K3Y18lResVwDYn4iSdbPvdL2nbOnm5NqJHIRmu8CY71lj2T8IN?=
 =?us-ascii?Q?Aj3y1I5K9m3mNNdKsQjjqs4rG8vF6S46FP14QUCATqBMGukc7Ic5ducbjjAL?=
 =?us-ascii?Q?xrqNaKQ4ClfHEriA6DxDePecQYevI0s7kxUoFNjiuSJmQA73bJy5lE1oVDTm?=
 =?us-ascii?Q?dfJei+/gvxKnqEMsURgQGtWdcuN74URyFg212zYK9v6FVLpE+ABnCrM/GO92?=
 =?us-ascii?Q?CnYqALK05FUy/PdMsP2JoL/2mEmF3MhSdyMrkQqNv59Ydw9mE+Q+qU6/CqaD?=
 =?us-ascii?Q?xt2oSK0RFUrC7ZlivH6W8r0XQdEKTbaGA3djiDgPXRcau0hOVr8AvVeD14n5?=
 =?us-ascii?Q?IZqqYqXXeRt7LRqVr5zXknJC50gJ6TvP3wWw9q8gBnZ+uIkrd0zGZydXZ5r3?=
 =?us-ascii?Q?hb/FBL1EAoUl1nn0Bxukyr6O6w/aRZoGv5T5JkY2Cv7WRyCtBcI/YF3qKRuf?=
 =?us-ascii?Q?oj6mxtXm76yEhGB/k16taQGZ+cBN+lSCzeRzAZLYKYbpMOoZD6+xQ5pOR8QH?=
 =?us-ascii?Q?bOtgZgVmDdfGIWDv3DNCd8olhEHIN5honwsT1ZcUq6Hsv7t1fz6c?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64662fed-f9b7-4583-0185-08df3a247483
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 03:33:55.9977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +f06lhOZJbJyoVminBGSB62YGTvpVn81RuEVfrEWkjM0xhBdppxfkIG6307ZUw3QEwuJmxa18ChHnXNL2eI60uEcdEVWHdDakgNKow1W8nK4FL4cde64ZfpX061P7Mmj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7868
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_193401_181622_EE0F7585 
X-CRM114-Status: GOOD (  20.75  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 04, 2026 at 10:13:30AM +0800, Chancel Liu wrote:
> >> +properties:
> >> +  compatible:
> >> +    oneOf:
> >> +      - items:
> >> +          - enum:
> >> +              - fsl,imx952-evk-aud-io
> >> +          - const: fsl,imx95-19x19-evk-aud-io
> >> +      - const: fsl,imx95-19x19-evk-aud-io
> >> +
> >> +  gpio-controller: true
> >
> > I remember Rob said needn't gpio-controller if gpio-map exist
> >
>
> gpio-controller is really confusing in such nexus node. However if
> remove this property, dt_binding_check reports:
> linux-next/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml:
> properties: 'gpio-controller' is a dependency of '#gpio-cells'
>         from schema $id: http://devicetree.org/meta-schemas/gpios.yaml#
>
> Based on Rob's explanation:
> https://lore.kernel.org/all/20260918192012.GA1465432-robh@kernel.org/
> that a controller property and its corresponding map are mutually
> exclusive, I think interrupt-controller should be dropped as well.
>
> >> +
> >> +  '#gpio-cells':
> >> +    const: 2
> >> +
> >> +  gpio-map:
> >> +    minItems: 1
> >> +    maxItems: 3
> >> +
> >> +  gpio-map-mask:
> >> +    items:
> >> +      - const: 0xf
> >> +      - const: 0x0
> >> +
> >> +  gpio-map-pass-thru:
> >> +    items:
> >> +      - const: 0x0
> >> +      - const: 0x1
> >
> > I think you should pass thru whole u32 0xffffffff in case GPIO add
> > new flags in future.
> >
>
> I found this was also been clarified by Rob:
> https://lore.kernel.org/all/20260918192012.GA1465432-robh@kernel.org/
> Okay. I will use 0xffffffff to match the GPIO index exactly and to pass
> through the entire GPIO flags cell.
>
> >> +
> >> +  '#clock-cells':
> >> +    const: 1
> >> +
> >> +  clock-map:
> >> +    minItems: 1
> >> +    maxItems: 2
> >> +
> >> +  '#address-cells':
> >> +    const: 0
> >
> > There are not child node, why need #address-cells?
> >
>
> Otherwise:
> Documentation/devicetree/bindings/connector/fsl,aud-io-slot.example.dts:20.19-32.11:
> Warning (interrupt_map): /example-0/connector: Missing '#address-cells'
> in interrupt-map provider
>
> >> +
> >> +  interrupt-controller: true
> >> +
> >> +  '#interrupt-cells':
> >> +    const: 2
> >> +
> >> +  interrupt-map:
> >> +    minItems: 1
> >> +    maxItems: 2
> >> +
> >> +  interrupt-map-mask:
> >> +    items:
> >> +      - const: 0xf
> >> +      - const: 0x0
> >> +
> >> +allOf:
> >> +  - $ref: /schemas/gpio/gpio-nexus-node.yaml#
> >> +  - $ref: /schemas/clock/clock-nexus-node.yaml#
> >> +
> >> +required:
> >> +  - compatible
> >> +  - gpio-controller
> >> +  - '#gpio-cells'
> >> +  - gpio-map
> >> +  - gpio-map-mask
> >> +  - gpio-map-pass-thru
> >> +
> >> +additionalProperties: false
> >> +
> >> +examples:
> >> +  - |
> >> +    #include <dt-bindings/interrupt-controller/irq.h>
> >> +
> >> +    connector {
> >> +      compatible = "fsl,imx95-19x19-evk-aud-io";
> >> +      gpio-controller;
> >> +      #gpio-cells = <2>;
> >> +      gpio-map = <0 0 &gpio1 8 1>;
> >> +      gpio-map-mask = <0xf 0x0>;
> >> +      gpio-map-pass-thru = <0x0 0x1>;
> >> +      #clock-cells = <1>;
> >> +      clock-map = <0 &clk 1>;
> >> +      #address-cells = <0>;
> >> +      interrupt-controller;
> >> +      #interrupt-cells = <2>;
> >> +      interrupt-map-mask = <0xf 0x0>;
> >> +      interrupt-map = <0 0 &gpio2 27 IRQ_TYPE_LEVEL_LOW>;
> >                                                           ^  missed count?
>
> Sorry I don't understand what you mean by "missed count". With
> #interrupt-cells = <2>, I understand the two cells before &gpio2 to be
> the child interrupt specifier, while the two cells after it are the
> parent interrupt specifier. Could you please clarify which cell is missing?

forget it. I confused with msi-map.

Frank

>
> Regards,
> Chancel Liu
>


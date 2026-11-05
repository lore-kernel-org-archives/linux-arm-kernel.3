Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302C6606A333
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 17:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SdAvW1Ib;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=VakWIn0O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LRLP08ZDBnfRKN6wiq9EQ5PStGwFuYRLDcBqS7jF4X8=; b=SdAvW1IbVrds+fcQ3vXWNuA5xT
	pfLatCStakjRmCCyxXWJSGXSo984wQ2+wyBU3iyTl432FrQV7Xn4bDjhQ/3meWT7S/KueuoOATApT
	ch3tK5mGAfTjroReGwkMn0OaeK8Zqq2vjBxvFv5oV5viBbsZolUJ9ZEPjCMY52e2AS7ETM9DM+TgU
	TuGsmwhXkdsDiM5ruEZsJc8iRmSUp1jq5zVR96FhDh5t25Kz7bCekmVAuKn1joiLFH0UjvczQ3OH5
	pnNYZedl4jVFXbfFVc404wGIT3dgJ8NUWpbxnLuKqeKbnVvQ6AwrYuCHDWXgBSI3d9Sz+/Vwxp/nQ
	8C7y0Dfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1BC-00000009tcZ-3VF7;
	Thu, 05 Nov 2026 17:23:14 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1B0-00000009tXr-0rTy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:23:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pz3cmqu/o8LhXfV4w8DdOCPCrJZwZTudjIU5WyNoJ4f14HCQLC5LqNhcKxlSpt3/PKxxV8u7ABCDVUoWDbEw273qwPjzt4aCsVK054CKznsqTIr9VZERg4KnG1EkJ0QgHjZGaq2rAlR2lBHSpcos9rPdPeMgW7g6UdOsYE9p/7zD8B1UFIs/qLwDGNIqrJhSHMUB/0CEGnFve5vmDX+PQuKzLq4TgP39ybd7XQrzlPfRVsPq3DBqTxT6ZfIOf8bBlcBISn7H45s9cjSo95sf4Cfg0G2ks2y/C6FfZOz/L33ojDhdys/YLBMrxWoAJ7cybsTvT52vX+7BfaLPZMdIgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRLP08ZDBnfRKN6wiq9EQ5PStGwFuYRLDcBqS7jF4X8=;
 b=azdxYZq2OOfnwNOmR+s46Ye8xz9sO6++BAQLcq5CC8wP+q15GvEMCBmVoIYiHGn1LBfIem3zSJdyyfedv75YLqy/3fxkdr2yIOm7wU+XYUJQ47KgaORt1eEn7RnDw4FximElkbHgTKwwwE5GiztzejTQUdm1X9T0hgyaDCPhIaFqSTpcDzzstMN53xvKSm/UUqnzBoWtHSQCh1VtfdQMznMtQ27NRR93IyjmhyI7I8Y+Ig6y7ZMHn/YG2XXHml6UaobWGrUqtEJN5b+ysAcvBUh/rD6VGux7lbEj0vee4ukmakVoZixvD+ppJPCjFBpzdR9sTbxZU9ZKiyTo63MJSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRLP08ZDBnfRKN6wiq9EQ5PStGwFuYRLDcBqS7jF4X8=;
 b=VakWIn0O+nmT9Pdtqhje6/iZR6ldd8JtZNDv79ZBhkEG4QYgsnwCPEGGHTaUdNisDxw5HTwuPnmFQSY7q9Zjf3xf1sBoJFqqsQPPYSkW9veItpHuj/Gv1Cdc95MWXy3AsryJK68HyS417wfSOeSowmuxmZULYTOt5Rp19Rv/lVc+KmNNfEqIdvsh1hzekWWetj45HmWChQBr2XknpftGlKRnfd3277Qau9Oc2AFzvu8E20ebAOqaMmEFfgMY7FgvuhWlwvhO82v+M748URruoZjoEeS/9cRu3RVgFq/zRGg+FmHiftAuHIVT4mP/6DLmwzr8MB+kZSu1SyDr+iTobg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MI3PR04MB891867.eurprd04.prod.outlook.com (2603:10a6:290:9c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 17:22:58 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 17:22:58 +0000
Date: Thu, 5 Nov 2026 11:22:46 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 01/11] dt-bindings: gpio: vf610: fix clock
 requirements per SoC
Message-ID: <auy7ZilMnk3RwA4V@SMW015318>
References: <20261105-gpio-vf610-fixes-v3-0-504e19de5ad5@nxp.com>
 <20261105-gpio-vf610-fixes-v3-1-504e19de5ad5@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-gpio-vf610-fixes-v3-1-504e19de5ad5@nxp.com>
X-ClientProxiedBy: DS7PR03CA0231.namprd03.prod.outlook.com
 (2603:10b6:5:3ba::26) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MI3PR04MB891867:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cf9121d-0493-4df4-8d66-08df3b616fc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|376014|23010399003|366016|1800799024|18002099003|22082099003|10067099003|4143699003|56012099006|261021121427099003|11063799006|261026140227099003|261026121527099003|261102123227099003|261028144727099003|261022105027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: Qr++3araosltcbs6guBKfr61uSCJhRrGkr2tOkwxbzJIJ+l1TbFbjIFKsaAP8NYJ0uP/XhlFymOMGcsH5nvjawbJWWfksYnC7TjHrqrZmHOFuj7CHvG9HpxrLsLpI24b6GdCHNsI2KSWLnW0hecxzzfoz2MRMu6tX3VfJ7xoxZr50fSJwrVlt2MXu/+AnH5drdA/Xlmz2c/dNnqy9OnR1lChMkfdtAJGGfAp2UGp5xfsb8tXpyONlXDb1RqKfHDYRnbMzh1ERtJR/5HIm8nT4LybzCccRbkGQS7wBIZyJfxiX1YBHaMYhXwbaEUpqWTp1CRu8v+e9GqeFbBjm+orVpyu1al1L0EgrQc3uR9YivXq3828I36cdLhtx5cMj2hXj5mRJfDnnaaqT1AovB12MpqsSmni2+PtdtngJ/jkpeG8j9YZ+exmxFE1lMvqvd+BAzP7lSc0iwI4hGq4ObT5fZ4gjCAkCtET8Vlc6+d95ZCHHZMJKajoj8yZM76q/cTVFiD8O7edl8EUiB9bcEoe0zL/sPwQlpDfGpbuKHJSGz3qQkbethP+VOFskcbF0xue0Sl1ShIbwyfR9Iuxh1UIbo7koev8ukH/6wL1RwNmymGrEDoRnuXd5hgmzNdXKDr5hNcVCTVYWGtKV1LZ62pT/hTvEoZvbt3wo8HEmjy+D4w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(23010399003)(366016)(1800799024)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006)(261021121427099003)(11063799006)(261026140227099003)(261026121527099003)(261102123227099003)(261028144727099003)(261022105027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1e8I/TRk8SHvQ7nT+xfgahgDgl9hynUvluC85okr0uMoGNAxVQpgfqmztkVw?=
 =?us-ascii?Q?cb7oQmjWeBqarN1FMMj+L2XQxSsIkPKKhG7Xy+lo0LKWJRnIvElxeR0N5Y7C?=
 =?us-ascii?Q?WTIBqRxzT8/zVwQsohkJWTiuuEufXwhiER6+GTczsUKRLVzR3+KQzawIGWip?=
 =?us-ascii?Q?NvUZmiyLBVj1zXZiW8kb1thdP2zjvW/JF8nlwIIZBrFil2BVgiYwBLIEE9O0?=
 =?us-ascii?Q?GBxzCIGKHYeAMnNQrgRlG6Iic5e+F2ids+AJ8q86uqG4mU243+Lp5mXQlweY?=
 =?us-ascii?Q?KFmufwtBpgvbuQG3D3gOWRpeeQqHqJzU9ivBdZ+xJvM85BcD/wEo6BfiBk97?=
 =?us-ascii?Q?c9As1e2FAGhJXAiVWyCX3JkotGsTLJyPdBSOAeMVLCPKic2QHgrj5P2SWniT?=
 =?us-ascii?Q?oeZAThqKkCyThW/aOK+8Jn8E09JahGzMD9sedkupy9FF2khkkcnPyb9C+k9X?=
 =?us-ascii?Q?tqXxjFwt9eSrigBmj8VIiy3JJPfto6xHlWxK18FcPwOu+E7yIgQZoqzi/+Iw?=
 =?us-ascii?Q?MMpe0XWdxChUEm34b9XFMyt7+UwNj63lelybgmDwLlYeVRg1At8NS8v2vMiO?=
 =?us-ascii?Q?v0uUB6IRg7xtPx8iywgPCeUAQpNR7wDSTtYSYSqrx0yNgtD8qWF6fieGFSOv?=
 =?us-ascii?Q?K6wsDtNIT9ooBHTxyuKZbIXsiUy7SQ1OH4Y5Xs3soQf2EJgNmBsK/fTXS67u?=
 =?us-ascii?Q?HMmqcUGL8aQviSS8kSj0WkzHPdGbJcSz6iIR68qyA2JNeqZtl2Jl3I0YVuUN?=
 =?us-ascii?Q?YP/d4Nnsxam0ClInHp7S9Xuxr9aBqWxUiFxX9s8roH2fYmBnKAxXjAbDIXCS?=
 =?us-ascii?Q?xhn+q5iL9CK4GAMNkjKZJPLGkqwxnbs1xNxOhcP+NGeid6yIKaSaeuSKkDTO?=
 =?us-ascii?Q?NhLuoL+lI+pcAEub8SLTcHYPMi0KVLsTzpdCjU7k9ZN9Cjk6GaURmZeXDvRT?=
 =?us-ascii?Q?yO2nJO4IaGMhaW9P3za0pzROzS3i/f7cu4L9k6LZbrZOhhBB4QvqudG8PMvc?=
 =?us-ascii?Q?JbO9nWcXraDKgX0TRZR9LxEjTogAtZtQv2g+cwolY1QU3mxIB28hSYojom29?=
 =?us-ascii?Q?2bjzVfG/JqJPBcLTQd3di3GaAhMts5K6I244RQCw8HnCUyOqN648396EiBm+?=
 =?us-ascii?Q?eZWIzv/dDRmc7FtoiBDBI5Gn5i5rL2GxNyy6r5V2g7v3s7afDyDaYLnBbt24?=
 =?us-ascii?Q?1/kmacHFCA5H7NHRcXFztNOU4/TsrTCjsSo+AlQCn4UBiXgNUwD2BOZSip7x?=
 =?us-ascii?Q?NZPlKePxToO/LbN7ZoChrucGhTL1Mp9bvQG1lQcAuNjS4oNlC8Om1l9m8gu4?=
 =?us-ascii?Q?7QzXvG7l/f/jCzh1WJLAcJzK2zqyABOMY17IoObpI5nr2in3dR/ueAIwf53l?=
 =?us-ascii?Q?u4HjgTZ4dnkvUxyaS2DzEWMxvccccYgvFTFzTT0/H2GwA7zgVdxem12jAwGH?=
 =?us-ascii?Q?Ot5tY/9+1zHg3qCr0iGyPS6lAbSl/W06cS0PtFA5FesfirNIkqnuZu4LEEJN?=
 =?us-ascii?Q?wfQwEaJYMV87hzmxmy8nfwj0L0/3U2SbkKfzeOrMIF0gVtUR2vIK/9f7uRpI?=
 =?us-ascii?Q?2zx/SP4Ark8lTeCHRYuum+Vp+EAlfOmWzuCvkhUW7Q54ViwfMsE1lGm5DdU+?=
 =?us-ascii?Q?pM0fGDjUNOkb0XPcN7blHb8qLhB3rfkatx3ntBvMm46Uew6XA/VjuWSHbrMN?=
 =?us-ascii?Q?daXUyGYWKfkbkFdkGHdmG3O3l9KH0mo8Af7FuApTlMNE0w3ao0bVjqLziqjv?=
 =?us-ascii?Q?9/372dFPJ3bCE2jKVjheTzcr6p/+3mcoK7QzOrY8p8ex+GUN9vLv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf9121d-0493-4df4-8d66-08df3b616fc6
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 17:22:58.5035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xUEaOwmUiVhlg3SNWs7ps0pxK3vjySOIyYuUJml1xidNsyKg8uCsGbNmXxBZfMCnq63sL+WtvEzjveWgctRbZtLQg/sbi7OoYjgvGdB+DlmE8hfsD5o4ZybpfnBAJl5j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI3PR04MB891867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_092302_270481_510146A8 
X-CRM114-Status: GOOD (  14.98  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 11:52:59AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> The i.MX7ULP GPIO controller needs both the GPIO and PORT clocks,
> while the i.MX8ULP and its derivatives (i.MX93/94/95/952) only have
> a single "gpio" clock. The VF610 controller has no gateable clocks,
> so force clocks and clock-names false.
>
> Fixes: c61d8b5791ab ("dt-bindings: gpio: gpio-vf610: Add imx8ulp compatible string")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  .../devicetree/bindings/gpio/gpio-vf610.yaml       | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> index a31f64b6d40b..d1d5315ee164 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> @@ -57,11 +57,13 @@ properties:
>      maxItems: 32
>
>    clocks:
> +    minItems: 1
>      items:
>        - description: SoC GPIO clock
>        - description: SoC PORT clock
>
>    clock-names:
> +    minItems: 1
>      items:
>        - const: gpio
>        - const: port
> @@ -117,6 +119,45 @@ allOf:
>            items:
>              - description: GPIO register base address
>
> +  - if:
> +      properties:
> +        compatible:
> +          const: fsl,vf610-gpio
> +    then:
> +      properties:
> +        clocks: false
> +        clock-names: false
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx7ulp-gpio
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +        clock-names:
> +          minItems: 2
> +      required:
> +        - clocks
> +        - clock-names
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8ulp-gpio
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names:
> +          maxItems: 1
> +      required:
> +        - clocks
> +        - clock-names
> +
>  additionalProperties: false
>
>  examples:
>
> --
> 2.51.0
>
>


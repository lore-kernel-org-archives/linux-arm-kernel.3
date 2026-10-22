Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894E3606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 16:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NaAQT/NJ;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=PYjurc6j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CX4s1nDn2NuvGZIT9wG8mO0WEOLJYhaIPl5szunQF2k=; b=NaAQT/NJttKl/Fz935QsLGpDXq
	AoPN4ErrqwhHiko0Y1+8zltoP5MKKTUqAIjmMfF8CNgXNYh9T5RLJrfxhZuyAbN2Ctxv2hs5nP/Dg
	NRUFttjyMmAshA5O78Ns6IIqvNNMpgS5F2ezNXgAaZgIVPBgjsBo7YXxethyWwSUYuNtIYRMYgWlY
	8x78sbfZU/mkg3L5qbQpND5mZrEvwBdGmNeHdHjWRQBQMGUatyotrU+keFqzy3LshDzhuHUp5xFOm
	/BAIXXynmfQ9TiT3cYvA742D2wQ9NXMNyLPP7l48zCzo0L9pAsqTr23LS73ckUFZmBMWjylAla2Qb
	JODYgEYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvGz-0000000ESV6-1QWb;
	Thu, 22 Oct 2026 16:04:09 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvGv-0000000ESUQ-1Rdg;
	Thu, 22 Oct 2026 16:04:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qOB8KQsqZIvxAYD+QGY78i7FrUfdEqfrMNZlgID8TsYMea0oS486PNlr7RwK8X9/bhVdS5z1ElbvUvCbjdDP9lUcpnM0X87yWv9OAcUzP3GFEajMtOcM02PFqA1U222DZeH7tS5xdHMO48KRWcDq/hw5XaNWYBABUHenIKxC18oYyYMwAUCjJFdRXUc3zMyN94YxucbwCXdERs3TstQFf3NlyuGmfQ5DfxhOtWbrLu2D8+iVDPzIM+kGtFakomgL/mvjZBI4DGDS6HVgOGIJUO+SkQmhwZUM0bHITkamvzaX45i+7IEyr/6gGAPk/V16RE+IRvzRH3X9++1/NHMmCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CX4s1nDn2NuvGZIT9wG8mO0WEOLJYhaIPl5szunQF2k=;
 b=sSWAI7BPa7N96Ji4fK+X12/1YWho2MvrhnjWH9ZBJ72bAUAetB39mZLXIdAenbaK+5B7Y8E0jxx77A5zQdtJuKJh65Mb1/Vi+z6ehZyd4xpp3qMonOy/JpY3mGOlTGVEbKYSwYwJwJoakw6NFdjXbmOozrY04tF4dOUVCig6PgQRLvwdd1zYSrw4HJuYJMS9eTf0yzU4+OSg0rQEJ/6emWzA6n3RttBYFMU/wzvDBZhqkXmPTutjQJHkJnVcT3KpaaApQJ7KZxEFhQvHOQPqgkcPd0WQA8Sd7xDB985lrhCj85TXFDO0YOmJeJURMO5n+Ya7FEUKviv5ptwp5G3xtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CX4s1nDn2NuvGZIT9wG8mO0WEOLJYhaIPl5szunQF2k=;
 b=PYjurc6jdvcV60VMN1t9KMVZ2VhmjwrSUlYMqKwirvTPegCVM/FyMLMOXssAHAfL5NAQbHKM3ObaHTRsy9nWwLQShTDE1xFOHngvsd08GGpwpr/uiVhx7X9SBToRurE5xindFSbaPvEo0UlpNxUUOo+LN2rMq+VRHRfD5eN7SnUZY1/J+4skxv9UQfY88nwLS1NA0QUNpT0m2hMJkNVFfOuVang7sDmG/gyEh3e/TERm7RyiFsmhefc1b7PwKkJtERpcR1+DVUsgouorOtkdaadeAtvytlJhvARKk+PCYtYaI/7r0lP6JHUSsr6YsFRKzabUGLfDjZVU8LwU/SPs8w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AS8PR04MB9126.eurprd04.prod.outlook.com (2603:10a6:20b:449::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Thu, 22 Oct
 2026 16:04:01 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 16:04:01 +0000
Date: Thu, 22 Oct 2026 11:03:52 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Long Cheng <long.cheng@mediatek.com>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: mediatek: uart: synchronize completion
 callbacks
Message-ID: <atoz6M7RHU14_a3J@SMW015318>
References: <20261021-submit-mtk-uart-dma-synchronize-v1-v1-1-4f7718cfef41@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021-submit-mtk-uart-dma-synchronize-v1-v1-1-4f7718cfef41@gmail.com>
X-ClientProxiedBy: DS7PR03CA0202.namprd03.prod.outlook.com
 (2603:10b6:5:3b6::27) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AS8PR04MB9126:EE_
X-MS-Office365-Filtering-Correlation-Id: baebc57b-7246-492e-13e5-08df30561647
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|19092799006|366016|1800799024|11063799006|56012099006|261021121427099003|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: mQH2Um/gHPE25UKMVSvKfwWs5lrdgBZ1nM3o1PoqhOVP8i+SMMSMufcB3Aakg75CZvIaI8lGTW4RiF83YN8RYlZAtyPutqCZ94fK/ZqZIeplPYx0jDh5fIyUt4b6eM7G3cqJWOjgljiq+QdnuCu8S4C67Zio3IDF0s8H8AXFEMSnf4wRWiirwHbBi4qAgWziqSxbYsgClB9Tla/cR+6IE7IhxXbIwskIPp27Eoxig7l9buLHvi4ZUo90VsIAx2gYXyHs5yvMVIB1w5fy5MRK/GsbWge1ItzOMiRAosUcQcEppUwiTfwEjb0f6+IPEA/ifH+i4o+kLOOTNPHlRFSDPAsWXsU32tNgES3NDWRWKvhr9snWg0Yp3zjPZd9vrpOIg8HdtQPN5UxBfBWNUqOsUZ27aO1bfUBrATW6cX0kXFMsg/okNmx4npeVllmfsRXq1u/gzdlIqhO1PHcfU+TGUAwI7GUjFJCCKez4c1AAeVzI1xBR8nUbOZQCynRjKrEUPyDvpMTINKdJ6Fw5sKzMK4LM1FxRO+1Rbi6QOunxedvnCF7MMVgADY589eSDeidDQs+pk3IRT3zUymGBwV6R41o5OlbWlDzxwUIRPPPZSR0VFlLp6Eq6AuH7ub7sU+mcrOkCeFNB95L6AH7bUEmzqj+Vt2LErJjPrAWAoXN54Po=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(19092799006)(366016)(1800799024)(11063799006)(56012099006)(261021121427099003)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/qYC2wsf6VXtBItPfEC8ofDkhIWHQYvagEIdtVX7MGkJwxHxwFST/EwGxwWS?=
 =?us-ascii?Q?WipNN5/vNQBdBnWzN1QLEKGd852/wHMI7TjbpvZOEDc8SyhhddA+eXm5fOym?=
 =?us-ascii?Q?Q0TwQPnkiuE3um8ux+1MJT+0Eb8PiSrWx27Mp3/HPel9ai/pQTs8SeNCZDEQ?=
 =?us-ascii?Q?P6ILoTHPJVFSncn9h3t4kUk47j3kSsAj916EOaO5upRuOwYfmr+mETiK7XI8?=
 =?us-ascii?Q?mj6RsHIHc2cgU/09AEa7M883cSZbFGHoBSxAuUatwXAkiGwuz4z18/wFfdBJ?=
 =?us-ascii?Q?j+4fez/vwca8SmXFmnmq1h1MLCU2q7o72akmU3R6+V/aB4pul87P546CAebp?=
 =?us-ascii?Q?jk1jGbvkhB5JpRF8aT9h+1oCBSlNufxsxjihBV6RJpyqdltwOpHQmhQnspfA?=
 =?us-ascii?Q?HC4vMiR6LVvIFrmaCzGgJYZpg6pJVFwLWomo7RPslomPeBatyh00c5jaaKgh?=
 =?us-ascii?Q?po8KEOMD9oec9xX4FLTvpunEfIsQk9M06wi70jYOxrptqaDcuVJY15zFSP3y?=
 =?us-ascii?Q?mjkJlFNkJUHycmI4zACeeKQC0CFTdilMW8QlLeHqLI/L/Hnc8b6Zz3baPUsl?=
 =?us-ascii?Q?POAtLR3Mcdvq1+z/hMCpyzWVWkbLDtA6ZMuR+WvJBgZfPpHd0QQreB8BLmEL?=
 =?us-ascii?Q?Za2hTdacNCbYfwv+g30jD7hLYjmRCfjZ9D8qgQMc/41Gz0po6tImQ8z4oE0F?=
 =?us-ascii?Q?KZg2AEqUQLmB6zNj7hro6KnJk4Dk0VLWKoh3MqS8qoj5NsllPvlKB+rMvyvN?=
 =?us-ascii?Q?xUn267JuJ3nyTkulyOwkGW/9KgUL/PKFWk8eCZoDmql/5++SAw55+7cawF5L?=
 =?us-ascii?Q?9bwFrZ8IdBzFjr9IWv7+RWwBDq38LOd/TBCyzD94kFcG/8DCRskVsg7dVimo?=
 =?us-ascii?Q?evFxjYgCH3uImQTOulHBcD7IITa2r8t/5TDFlaBQPw5LW33dePV2BaXbQplG?=
 =?us-ascii?Q?68Z8Not8dfuW3gezkAIX3qHf3Pth1cvn+ghFesGDeoQYy0Z3Zf8/oe959mYH?=
 =?us-ascii?Q?sVhNy/Gu2Gqob90zsYOyba/Ef5M11g7EzCpBHurrEbIYWQMmHVPtuh+jhDFm?=
 =?us-ascii?Q?Jcz9dD2uor8ku9Yp+O2daeGMO9gcS4An5PcSF+/JWhs1ye2aBE0bYnr2S5Od?=
 =?us-ascii?Q?SEoq6mHYXpfgrElFL6smUzu3MHq7i9wyy3ya6FrGVR4hUjhg4SlyeXK2xl7j?=
 =?us-ascii?Q?bI7m6BsLputN19k3kD11wREdcmIklnwJ2epYR6B3FyT6ZKD/ekKp/PSurvs7?=
 =?us-ascii?Q?cadWxiX8GJBoEH+tMC7RDf0cs4EKInujafiYGj9rbecVzh/c9Lwh1m20O4gP?=
 =?us-ascii?Q?mfOXIR1jMHOqDI3mCWTcHFiVRwUK3Toa4NZPgokqlpx17spC4Ca5rYjPU7bx?=
 =?us-ascii?Q?e5iBedH7sqOsk3pJvz3M/SbsumM5HLUAzSwzNMUg3gOhJ2DU+EcZ+PzLOMiP?=
 =?us-ascii?Q?14lGcJZZdrHN5VfU74fJTGTL2L2XlOAJO77GdkBU7gu547xw9rosFg2E9Wnr?=
 =?us-ascii?Q?4Pcb2r/l5XHXE4tl4lhWOfctjQgUkwXVVlrcdIh7+Jy1TON67np25+nPpBST?=
 =?us-ascii?Q?f4U+yT8fWZlqK53MjIEHaX75ZxLmkniIjhBqRYDJ/9PtnNeybFhs7WW6K+eE?=
 =?us-ascii?Q?qSBfRfNxoIrA21B14E2HIslgDMZbgaP+bOUlp4DkwMZRVBaXMmUYKn80/x0N?=
 =?us-ascii?Q?3o0eoEUp88zXlY3KG9ylFbXuUW2COAB36Qq7gvGdMpFHKFH8Pc3Hw814BFen?=
 =?us-ascii?Q?peyWreFcF+cJTXiBBDvGjLjdZigeM4J4oiytOLFyuwtoWcGMQ0XX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baebc57b-7246-492e-13e5-08df30561647
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 16:04:01.0701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zFrb3JtVdg3wmxY6qfXqVvdsDV5nQrzmHV6JOMkNetcwbX+C2/TmqX49FibA55FIiL9jFwhJaxILhUwrFf89JVRhRyfkfEWReOtpDC7gEZsSaXdN8EO8YA6C0MZz4u2x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_090405_535911_EE7D45A6 
X-CRM114-Status: GOOD (  20.87  )
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 03:13:24PM -0600, James Hilliard wrote:
> Terminating a UART APDMA channel waits for its interrupt handler, but
> completion callbacks run in the virt-dma tasklet. A callback already
> removed from desc_completed can still be running after termination
> returns. With no device_synchronize hook, dmaengine_synchronize() does
> not wait for that callback either.
>
> Implement the hook using vchan_synchronize(). This lets clients finish
> asynchronous cancellation before reusing callback state or freeing DMA
> buffers. Keep the callback wait out of device_terminate_all so it can be
> performed without locks acquired by the callback.
>
> Fixes: 9135408c3ace ("dmaengine: mediatek: Add MediaTek UART APDMA support")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/dma/mediatek/mtk-uart-apdma.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
> index f74e9a328588..7583c287da5d 100644
> --- a/drivers/dma/mediatek/mtk-uart-apdma.c
> +++ b/drivers/dma/mediatek/mtk-uart-apdma.c
> @@ -440,6 +440,13 @@ static int mtk_uart_apdma_terminate_all(struct dma_chan *chan)
>  	return 0;
>  }
>
> +static void mtk_uart_apdma_synchronize(struct dma_chan *chan)
> +{
> +	struct mtk_chan *c = to_mtk_uart_apdma_chan(chan);
> +
> +	vchan_synchronize(&c->vc);

Can you create vchan API, which use dma_chan as agurement like, basic
move this function into vchan-dma.h

vchan_dma_synchronize(struct dma_chan *chan)

So below callback direct use this API and avoid other drivers duplicate
this segment code.

Frank

> +}
> +
>  static int mtk_uart_apdma_device_pause(struct dma_chan *chan)
>  {
>  	struct mtk_chan *c = to_mtk_uart_apdma_chan(chan);
> @@ -514,6 +521,7 @@ static int mtk_uart_apdma_probe(struct platform_device *pdev)
>  	mtkd->ddev.device_config = mtk_uart_apdma_slave_config;
>  	mtkd->ddev.device_pause = mtk_uart_apdma_device_pause;
>  	mtkd->ddev.device_terminate_all = mtk_uart_apdma_terminate_all;
> +	mtkd->ddev.device_synchronize = mtk_uart_apdma_synchronize;
>  	mtkd->ddev.src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
>  	mtkd->ddev.dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE);
>  	mtkd->ddev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
>
> ---
> base-commit: 93f51579e7df248780214094418f205253383cc5
> change-id: 20261021-submit-mtk-uart-dma-synchronize-v1-158c8303b574
>
> Best regards,
> --
> James Hilliard <james.hilliard1@gmail.com>
>


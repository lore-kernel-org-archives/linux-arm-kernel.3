Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D849B606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 16:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0gtF9sFy;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=QpIMNp9e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=msp/CdsNxPPQfCaPx/mtdKTHxVLf8rISD7+b75SPj4Q=; b=0gtF9sFyJt2KmocdCPFnMKU4fx
	uygnga3zj7mFaXIB7qzyXV271oueCq1pEMvVhQCGk7zZVFFmfc+2OKcMzu+Yg2XBRXhppkTzrnE5w
	u+ob15LtngVQF0m8MLRiDEH1uTUo1ARbgqXHYsLBqCM58GQQgzOzmkm3KbKaa1hkMRxfSj5b07aw2
	rMX5Qfq4p/h7g+G5ErxFvnxeqUO7+FMFUetnlRYYCrcYDzgZNbN1SQxlx2MKttlNLAhw66bP0W+wV
	l6np9fUzII3emlBjy1nXd0SEIaVyEboABwoiIlfQkdhcathIivsA8Ft4u93MQGSYzrqF4yqAnCXaq
	/5mH0HuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLk6S-00000005N4l-42f0;
	Tue, 27 Oct 2026 16:32:48 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLk6R-00000005N3o-0OA6;
	Tue, 27 Oct 2026 16:32:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d2bv4n5/cn8YY9sl2KwZagpxJyscbwX/YBFKHMIS2QHY4L9RUYL0XFVo6RZOR3h1jxw5KEDEd7dyNu3bVCWiXJIEgLdtxzfIHN4VN8S2JPRsjB2UlBbo0BefMtHzVe4AhoFLyDlmt1nNoKjabBeCvQvECC6wb3Ln0gKy/tIMS9ayZbenOhl/ncUbqJtoGLOR94wAXnsWswSUozOuBcMXgVm5rj7Ndv5P9Flcdr7Gi4zE5VyLj/PKMfBHDgytJV5uQ/A1t5kNgOYNumXduukv7047D7wvQQn84VGGExAjqOzpVK0jDbQI3d8KrbjYMu0jC/MX4LyNMe4bYPeQAgPSKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=msp/CdsNxPPQfCaPx/mtdKTHxVLf8rISD7+b75SPj4Q=;
 b=TsdtV2V7vqJzaommVGLP4+akdflA1xj2VyVeIWRRuW5e7ySbDpPed+SD7FKCsX5kea9nP4T1iE7eHNGLexCsBaQib0uhkxJxZw8zmvP+aOG5nlgHeoD2OsE8CxH/gOCBPK90QMwx23AFHKN3ko6HtCf7k4aClX5um4qKOAbXfoJgXD9pyknq1HuuS9PB3EHAyyoZmc/Mh35Fg3T6FltJA2InLPgVs9y2xjPd8BSLGSmOB3B6A7nSbtnqKOChHiSvnc1xXd7QgLvGgQDbdJ8K/yIay2K2NbpT8UBQPPqyh3YEXfpiKmyrUMzwgzSp+V8aP1UpiOvSX7guPM8ZsF5WNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msp/CdsNxPPQfCaPx/mtdKTHxVLf8rISD7+b75SPj4Q=;
 b=QpIMNp9eN3yUOLLUkctxxCazB5TJw9La/hU5i/LGxxWGsVIoHjSVW6IDitdY0t0VCOt1xz85cWimr8L8P6ypjFyb1P3FnYBrSe0aEDRLskFPLUs8tOgaCZck2duWb1taIXmvpwtCj1/b+0EgZ7wi0zRapylL2nEVQpj/1nSeYdwYlcBzya1bxjXMq/wNNEz2Gy68Ac5H+R5aXl5SFrmpoYAWmjCnanKwrIimYFl8A7AxD+DXNI9+pW79y5RQxNsvM+Ke7pOr2pnyicwGiOtUIdYgsrfI5jwh8HEN82wTHHdADtABrUQFReoT4XPWmS/SRAxZC5K6RjZjdcemmraipA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU2PR04MB8743.eurprd04.prod.outlook.com (2603:10a6:10:2e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 16:32:41 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 16:32:41 +0000
Date: Tue, 27 Oct 2026 12:32:33 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] dmaengine: mediatek: uart: make channel termination
 atomic
Message-ID: <auDSIVuE79Fl5BkM@lizhi-Precision-Tower-5810>
References: <20261022-submit-mtk-uart-dma-terminate-atomic-v1-v1-1-aa498ba5da25@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-submit-mtk-uart-dma-terminate-atomic-v1-v1-1-aa498ba5da25@gmail.com>
X-ClientProxiedBy: PH8P221CA0002.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:2d8::27) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU2PR04MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: d0d28108-5c52-4155-75b9-08df3447eb93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|19092799006|261026121527099003|56012099006|261021121427099003|11063799006|261021123027099003|261022105027099003|261009223027099003|10067099003|18002099003|22082099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: SL0iDcHYlSGlz3qTr3Q8CeH4tnrLWfFz/nZvQ8lacdnU7rCfw6Y7ILkyGM6wUUr50JOD8YOi6fcN/qbVcSjU1wal7xBAgszu2xsdRvMaP3ShYHJEpDiY4chc25llWWN5e78cZpFV4X41V/Vc2qhSICbkCw1OFm3CQVS8kl5LTXUVhtHvXT4ublJofbxpLAbg2awSJpONe8cz+2th5N0OafEUegY981jd/tYlmU73R9bD0hCn+lwnJ+yRjrKvWLqpVNXLzhED8HnQw5OwX8oWGuzMj+w2gP7k17aKTjyXTm+1crWF8OnTqdZEX0zF+YT/1VJ/rTYrCPIxqATrtNfFJD6Ysd0+k0a/zDw8tm4Xw47K1gXZR5lpzxcvt+zyJvVHwMd5Z5xw3ac3lr5sQH82YU7K+qOt0Yrwy6TyByVTtSmP0PbiOaMuP4omx5ln8oumjzQkzrR/k5mMUD3txUqPyPn0FxJkTlWxKfb8qntWwWfRP9G7e5WB4SeJtnlKfVGLBJpGpXJ81BkS7NAQ1NI8j8EvWW69Or5QBH9Ga0vbU4fDnTE/fcmDddDb6zu+J2t4mldk0XN/GrsOZIrWlcd44i5yQOOXCQYYGtAoJI/KKG3VmEsMolA9xNqhCQJecryVKNDhvtFQk2jUsPTc2Hm4xxl9Lh+3ynTdXtd7SYMcfGA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(19092799006)(261026121527099003)(56012099006)(261021121427099003)(11063799006)(261021123027099003)(261022105027099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZXa9UN6iGGHLkKZtCjUxeWvVbvmDumuXL9QeuanFVg7lzEsnIHTPEgm4X+O+?=
 =?us-ascii?Q?XGGUBTSgTEce9GA2pb6pIxDHAPmM9XKqAMumzF1pMTUJZokY0XDiobF/hHJ+?=
 =?us-ascii?Q?9PJKWQ3Nxv3pHbWs6mQidZsRacmbNLIfZ0veN+dOzqA7PhoF4SLSxiBwVZgp?=
 =?us-ascii?Q?3HyDIAfimM0bB8T60u3n0VRf2+Cgyd0OgD91T6Saah+7IhjtAjbYjGwKvsDg?=
 =?us-ascii?Q?wHpS0wcydFoV9utWaXao78KW/hymX877nWA6bmHoFDmMfa3zC+wv/QXdnw6U?=
 =?us-ascii?Q?m4xao9LQ1Jl/IVTfZEOVB2xOg1J60zErgiywvWPlcfD++z7B9TfBnPGCIstO?=
 =?us-ascii?Q?q/B5gCdBv+TjqlfoN//HdCBZ44aR2E9pLL2htC553kfZY/mTjyKnOx8UqQul?=
 =?us-ascii?Q?LKwUfcPiQ41kmE6BouWUujOUvaBTVWrpGciMOWEfsW1w0j3mehqVI2C5/Cgx?=
 =?us-ascii?Q?VVGr8VM5ZJK0aTRzSAYRZv8wnMvlCPaVQykkRhr4LRGcQ/BtATa2vFuN9C/i?=
 =?us-ascii?Q?opAkQZDK650hifHEOh7YqnTosZ0Lws1UB4uo8zpAoU9B54dP85Gs65xNdF6J?=
 =?us-ascii?Q?bKJtLoZ3axqsXZqNznUTfMnQolETt543RbczYVeTpIcTdy9ry+sOgoGO5ZH9?=
 =?us-ascii?Q?Mn+CnqRy32osVzg2WW0+20Wd1a9Wgx0RWJoqqu04qLMPQFaJvM/9tiLPg9Bt?=
 =?us-ascii?Q?5Ou16svygKvWD36/qtetofU1M1EWLHg2ZIxpuOsy7tXlsWopmnWqhl4bzTS/?=
 =?us-ascii?Q?qA+KjeQZoKbK4AWocFh/4xT92F6umGa4hsIQRWOFicB9VE9AeQnr44y3fJzy?=
 =?us-ascii?Q?+zCuHyXjye1ezGZY8mQWRwMVrBVXPRjzMarWGt/qjIUTe9Tr3IoHi5rx0JSB?=
 =?us-ascii?Q?8wUGe7dxsItzywmue7KPcD/WVydsRV7T03S06+fbu90gNtvZyOK9fWFrt5fa?=
 =?us-ascii?Q?whyOPbO6Z4sVFWsVmLFeXqDbCZFsc7wceo+A8KD/mICchyZMmZlVDg4XGroq?=
 =?us-ascii?Q?EM57aQGTaZs5YRpyux1offcJ1bTsGQn3rHe2CxbEP5bQ+1gcv1T2PuYCyufi?=
 =?us-ascii?Q?RbdLs0rInFwab8/uYCD7miauw6HyYaYGMzcvohfJEXb917QAeHUco+uFIbpy?=
 =?us-ascii?Q?+RY8nuBkSDL/+KxXGEpLjLZYWm5yn2c4qC8ENEwt8TM7DtHLJwD0ueM8IBT4?=
 =?us-ascii?Q?Tj3+OZQGmMAaS9YU7286EU6WqwN4bKfJ6PzDIC5mC/JXeifhkLwkwj5sqT/n?=
 =?us-ascii?Q?Q0UWDgzwCXWYCXpeiGuH1SOl/tlh2LQI9m5eaF5AgybK18Zag6HUdTljTrq2?=
 =?us-ascii?Q?chYKcp5AwR4oX3gXW4XKP2OZfUBlfyKJi4c5S//m5sq7ecZW7Lv6I+FmexEI?=
 =?us-ascii?Q?v9xigCtLk/FUnLB80duHa63QRmM9DcJe3Te+EafDN28KCOyd/cDgFgu/NzQQ?=
 =?us-ascii?Q?+AXUCt8SLWQoECmMIwB1Ny6y2pdorlwrRo6IHHXWyEX3lGCbTMdpHyefOraJ?=
 =?us-ascii?Q?mfPLH+UfemGlfSWfXQP0jUef57QPP3GSaDRKElglHHMO6ArdTpdstAQhcjnt?=
 =?us-ascii?Q?6bOxgmAMXKTvgobaJ4fBtMT2BVToLjhO0FLFjbabcupfHWgsUuE+WlWmk2ZM?=
 =?us-ascii?Q?HDdcIXT6r6LNHQ0K+BZ5igblwqmZq4O78FZZphqUiUbfVCo2JeabK2EbIaGT?=
 =?us-ascii?Q?PFOVlQfvPPl9oD5HgUYAw1EWixcW9o69pclxkpUzzgKfr9WFlcDdoDhlysDm?=
 =?us-ascii?Q?W/fbARG8Wz3USlRTMK4pVsajiurC98Ne7JA8czYq5EHcVnvD623d?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0d28108-5c52-4155-75b9-08df3447eb93
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 16:32:41.0114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VVZe6KKEPIZeqVnuGgubMAQ+RCknNPpXK1u+mVJTBAhjAiAvm06S+HF+q2Oo7SDdMiVD4RKp4aueLYblDfZeXXYi65R4WUmJ67HFEyViY9vdpnYN7T1bWu67RHa6p0oA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8743
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_093247_136303_5A83645E 
X-CRM114-Status: GOOD (  23.85  )
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

On Thu, Oct 22, 2026 at 03:18:26PM -0600, James Hilliard wrote:
> The 8250 transmit flush path calls dmaengine_terminate_async() with the
> UART port spinlock held and interrupts disabled. UART APDMA termination
> uses sleeping register polls and synchronize_irq(), which can also wait for
> a threaded handler or for an interrupt pending on the calling CPU.
>
> Serialize the stop sequence with the interrupt handler using the virtual
> channel lock and use atomic register polling. A handler that was waiting
> for that lock must check interrupt status before accessing a descriptor:
> termination may already have masked and acknowledged its interrupt. This
> allows termination to retire descriptors without waiting for the handler.
>
> If the channel does not stop, return the timeout and retain its descriptors
> instead of freeing state still owned by the transfer. Continue attempting
> STOP after a flush timeout, since stopping the channel is sufficient for
> termination even when the flush could not finish.
>
> Fixes: 9135408c3ace ("dmaengine: mediatek: Add MediaTek UART APDMA support")
> Cc: stable@vger.kernel.org
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/mediatek/mtk-uart-apdma.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
> index f74e9a328588..73d4b701ac85 100644
> --- a/drivers/dma/mediatek/mtk-uart-apdma.c
> +++ b/drivers/dma/mediatek/mtk-uart-apdma.c
> @@ -256,6 +256,12 @@ static irqreturn_t mtk_uart_apdma_irq_handler(int irq, void *dev_id)
>  	unsigned long flags;
>
>  	spin_lock_irqsave(&c->vc.lock, flags);
> +	/* Termination may have acknowledged an interrupt before we got the lock. */
> +	if (!mtk_uart_apdma_read(c, VFF_INT_FLAG)) {
> +		spin_unlock_irqrestore(&c->vc.lock, flags);
> +		return IRQ_NONE;
> +	}
> +
>  	if (c->dir == DMA_DEV_TO_MEM)
>  		mtk_uart_apdma_rx_handler(c);
>  	else if (c->dir == DMA_MEM_TO_DEV)
> @@ -400,10 +406,12 @@ static int mtk_uart_apdma_terminate_all(struct dma_chan *chan)
>  	LIST_HEAD(head);
>  	int ret;
>
> +	spin_lock_irqsave(&c->vc.lock, flags);
> +
>  	mtk_uart_apdma_write(c, VFF_FLUSH, VFF_FLUSH_B);
>
> -	ret = readx_poll_timeout(readl, c->base + VFF_FLUSH,
> -			  status, status != VFF_FLUSH_B, 10, 100);
> +	ret = readx_poll_timeout_atomic(readl, c->base + VFF_FLUSH,
> +					status, status != VFF_FLUSH_B, 10, 100);
>  	if (ret)
>  		dev_err(c->vc.chan.device->dev, "flush: fail, status=0x%x\n",
>  			mtk_uart_apdma_read(c, VFF_DEBUG_STATUS));
> @@ -415,11 +423,14 @@ static int mtk_uart_apdma_terminate_all(struct dma_chan *chan)
>  	 * 3. set stop as 0
>  	 *
>  	mtk_uart_apdma_write(c, VFF_STOP, VFF_STOP_B);
> -	ret = readx_poll_timeout(readl, c->base + VFF_EN,
> -			  status, !status, 10, 100);
> -	if (ret)
> +	ret = readx_poll_timeout_atomic(readl, c->base + VFF_EN,
> +					status, !status, 10, 100);
> +	if (ret) {
>  		dev_err(c->vc.chan.device->dev, "stop: fail, status=0x%x\n",
>  			mtk_uart_apdma_read(c, VFF_DEBUG_STATUS));
> +		spin_unlock_irqrestore(&c->vc.lock, flags);
> +		return ret;
> +	}
>
>  	mtk_uart_apdma_write(c, VFF_STOP, VFF_STOP_CLR_B);
>  	mtk_uart_apdma_write(c, VFF_INT_EN, VFF_INT_EN_CLR_B);
> @@ -429,9 +440,6 @@ static int mtk_uart_apdma_terminate_all(struct dma_chan *chan)
>  	else if (c->dir == DMA_MEM_TO_DEV)
>  		mtk_uart_apdma_write(c, VFF_INT_FLAG, VFF_TX_INT_CLR_B);
>
> -	synchronize_irq(c->irq);
> -
> -	spin_lock_irqsave(&c->vc.lock, flags);
>  	vchan_get_all_descriptors(&c->vc, &head);
>  	spin_unlock_irqrestore(&c->vc.lock, flags);
>
>
> ---
> base-commit: 93f51579e7df248780214094418f205253383cc5
> change-id: 20261022-submit-mtk-uart-dma-terminate-atomic-v1-19693366ae4c
>
> Best regards,
> --
> James Hilliard <james.hilliard1@gmail.com>
>


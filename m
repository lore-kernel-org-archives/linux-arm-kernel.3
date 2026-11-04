Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E276080786
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 19:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f1/my1hx;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=B5/mESXO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=17LcxMRWTpK+S4an8ixgrCp7XC7KStke6rt6JHkC7e8=; b=f1/my1hxyhz40MQhL7PltRbOns
	a/YVNcI47SAhh6B1/4rkTs5VlIZpop4k3E5dUVyrZaBSWyfctgdCbCzwR+zSKay4Pvx+j8o64LgdW
	LvOUxi00TPgvXKjLSHYJ+nvuyJjS1PIYOLUXq6bqguSwL96iBICY3JTy6kPmLL7nNSFgSMBtM6SJQ
	a6YzauWJnMVdbcaGASEXUJhPPu1kkqCYLLpsakdLEy4eaugYPYZzI/WyXj6EkVtjfDQ4GFOlPek4F
	XATtUIWuRmebYtSQmFZ+K8XRyb2Jj24EZRBSZDvbdyfmrseIalym40HiGTaCkkXThK1xg2pPNQrbd
	BWaFixPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgo4-00000006goE-0UqH;
	Wed, 04 Nov 2026 19:38:00 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgo0-00000006glf-3A33
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 19:37:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YS6MLyeMfQM8vM8pPyV4DB6iGurwZ3eWbSNJYwm1zAIfH0Eduaq4Yc2tvM2Y+Wkl4XY/ar7r3mdGQdCUY6/6nAgKLVt1AmJu8iLuUiMbmq2l4c9IZ6if7d1PFvHUp8ZH42eu7+7DOS7Hggv2BKuN3+H0IA5NN4yMStRhw2gikUaBK7eBqFT98js/oLxOGi16LH/LSJY8nLyAj4Ktu3bdopzFcv8Kcf4+uRUDJdKCxiKXBIzonuDx43+lj/A41HllmE/eAan5ML/521qAVidfcYg80r1+2Rj73fA4EU0birAS29ekznZBlBqO5IMx31MV/ImPSaGrtuAkI6ObMULciw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=17LcxMRWTpK+S4an8ixgrCp7XC7KStke6rt6JHkC7e8=;
 b=Zbyz5hHZcTnoKVc59uIaR7SFPRB8elb3IBn+/FH8lzbe0J5FOZcveYTV54/cs/7iq5Rp2DhAf+m0FkG0tM+WOeL8Z9LAi3+nYhzfmMfWSdckTydNkWbRAxi31bunJfmtqKyirc3XVx2YVFF1U9G+x3Sb8WtZacpyxmVA7O4EOXUuE1VdE8gluIzdTRLLB52t2Vltjk48AJgxoC9edJSwtGL2z2CFcsCrUtqujdCAN+bdUV+gKvUSp+vE6gasro/eStTHfr8y1/iUIQOLgVwcCHikJS+fh2aKzTuK+KBubNkJPjIuFvQIUsJmFCX3LuA0TDp+J9LyQB+v/x1GMg5spg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17LcxMRWTpK+S4an8ixgrCp7XC7KStke6rt6JHkC7e8=;
 b=B5/mESXOZlA8dknioRtQDxNf4fj2Wbf59KXwAntkyxquzpExhFMRX1Wu3TVeJydpjNg3DJqnhZidK//c50yuIYshJRkRC5v0iCNkSBtlEAzuk8LEW2kNH9LWH7dhWXVctsIXbVbtG9ZyO+mdtgp7g7oFWxXpVTtLN6mNJxDuB3LQ8tWQUCUGs3qxVHlkRtPaTj29MwYwbdyUVrfbvQqfb95u8xxy807PCOXIiXpj95PGArza4RmQh5WyHHSTPbnN4bquY9udxna1Gyn+rocvqmFPih84opTPhB9INxW881SrovVfXMg8QcjPHfdiAFPQtCbBtl7925GFo2pnZ+KUfA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV1PR04MB10307.eurprd04.prod.outlook.com (2603:10a6:150:1cd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 19:37:51 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 19:37:47 +0000
Date: Wed, 4 Nov 2026 13:37:39 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/5] dmaengine: arm-dma350: Support integration clocks
 and resets
Message-ID: <auuJg0QladV4nRIA@SMW015318>
References: <20261104124411.296640-1-Jelly.Jia@cixtech.com>
 <20261104124411.296640-5-Jelly.Jia@cixtech.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104124411.296640-5-Jelly.Jia@cixtech.com>
X-ClientProxiedBy: DS7P222CA0016.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::8)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV1PR04MB10307:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b711fea-bbf0-48dd-3f8f-08df3aab1ab9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|7416014|376014|23010399003|1800799024|6133799003|10067099003|22082099003|18002099003|56012099006|4143699003|11063799006|261022105027099003|261102123227099003|261028144727099003|261026140227099003|261022075727099003|261021121427099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: wuJy50R92B+2/XgWpUodWElcC29T3RIG7nxYlvPWIPTliSADA7jvLXAlpMJ5XF/YJ+qojVJTMjVB3qGiG79dpUVWAo2cWPEvzYNHFBBEJqPK1xx8qLSrU/n9LboMn8WaP+xV5LwkmY4W+1f2q9tg/XVX6L7JW5cZHsAkBUU8/nYfF474XaNeuFVghCFNASLiS/pv7VuU/PomiQFjj4w9tWGp/3YegOFATn06D+IXwbEfodiIuN+TiqtOv94HYpmuipljH1/cFN7tblUjl1+ZqkGbBxPLC+fcL2FDSpfcjx/xWL3RxT3deijg9j6z7JwnCpbpxQI0dR1pNsEPn2O1RKV5BNTGbRIvaIafi4zeRgNScsShSYDKnyyOTH+2IO+53ybuxxMOdORsGWZGKe16xxKfJaGSEfN1fy07znYCW9v5vfARg8jqIYHZa3FAOpkXE2akhx+/4QCnALuNhuo7HB+bYZ7j4Uqc8EJdXBhBgsg/B3XzFHTYlpbw5tA9JCEESilircmZC2p79sp6P5XR25B+yzrldw1OPfCVvg/aO2f+Ae0hjju9FDdSNfhIma4E4eCIGLFDL+fsUTGBs7hsYYYFIOeNc3wGJkxC9ehBkA3tfnIb9UnDWyqccS4hg04J/qVE2DFznQtDSRUKFRM0DX2wqpz0K0i23mH4AFgKNLs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(376014)(23010399003)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(261022105027099003)(261102123227099003)(261028144727099003)(261026140227099003)(261022075727099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MUBQ5kUi0TkMPtydUhh4sKrpqt3R2+j1MS5yE+EgcrAilxF7CMFSYxYtCpTo?=
 =?us-ascii?Q?Lo89YgiLQRF4VlStepI6q5QK0ba/P3YwWspzsq4C15eFqMnsoQPuCf1wNez5?=
 =?us-ascii?Q?1QDLMLKP5dSgqhNpVmUmtlJXo80olZXv7HEpr8cikKGMYTl8laImRxk2Sci0?=
 =?us-ascii?Q?TpWBcRiWKQ+IKYTOhiTu6sva8+OcEskJy823VuES+HveC/r1AyBNBp0Pjzwk?=
 =?us-ascii?Q?ytS+Om74wBzZwI5dwNmChupc96NkU8djpdqVIvXJsXTI8Sz0JrZX2ChkUM9S?=
 =?us-ascii?Q?/vbgkIpvSM915FjaAF/rTahIGWD2UNZGgshLjnhwtMNltWdbkPQupQHgKvJl?=
 =?us-ascii?Q?fpWwGj8LGZnmS0/5Sh6OZc+HnK+A8jBJP7j7RvkhbCHN09AVEAbwDnhsSlF7?=
 =?us-ascii?Q?71Q4b8Hw4Q4Fjfb7KhlaNBzJPE+oOJfg7Rx4y94ouyr41Xw4gASrVC8qQFHD?=
 =?us-ascii?Q?CkWRfJaWpGYATxgrY6fcnfd3RNqoshPVZ1HDV/ERmSC76SvRWA7NKVgx8/Fj?=
 =?us-ascii?Q?0ZqP7hH/dZpoaY897P+8ipGo6GmPTfPUDzN5Cxr7m9e+rEkEAKMJcQfA8358?=
 =?us-ascii?Q?bHq4LTAp1OSf5M/2nBsdEHhu1Vti4GgDCdrpC6KHAspcrxdCYGsK4/1S4HOZ?=
 =?us-ascii?Q?BUCTvBmBJJlP81G4M53OzVHXGRsfO1f192h/tsEWqh5l7k2vbNUyZ8ujtNhw?=
 =?us-ascii?Q?mwdxvwrhWNXTS3k5FkNEDlz8d4s4ioZ7PfnQny7+EwFipFuflOces99Z1/Hz?=
 =?us-ascii?Q?SliEwM7yGzEdbLWt1ezv9ZqWrtnfOuOjf4OZeUfGWgtYYURzvYWqxPFtpCtF?=
 =?us-ascii?Q?WNxDxrtfi4RUnj7ip8JMTG5yFi1hdMnvlXUSdodVMGnKFlBSoz06B6UHRRG5?=
 =?us-ascii?Q?Io1lKUNoice8wj2EgBXlvl4FcqDamxsEM//AkkfYHfR7ET39dco2VOJjNBh1?=
 =?us-ascii?Q?vJVtOCsVDydVhXUKZ52yj5m2KhE6W1z+bA3AB5y3eu0WEJfxXD5n1h+mgyI8?=
 =?us-ascii?Q?wuKC29jQ25lm7SxCeYz0zHGqaqCLei60SL4BdCZDghOacWAj6FEwR9UuZ+ou?=
 =?us-ascii?Q?RWSeUrfLZOTff1jNWGCYFt5I5CXSImS1GXzm5ZGosZg+byDhWCQ3kKA0iY/5?=
 =?us-ascii?Q?vvtTvHRR+cwUt8oVh7l+VykMpqY+yAPiYn+NLcE1HPgXUQJYUjq3FIE2vN0e?=
 =?us-ascii?Q?a2oWOL1VIPYmvT16sGeYU5hHt2OXYXuomXdoZ1x6FHNRdIhEKrw8gxJhRkyY?=
 =?us-ascii?Q?ATaJWVAMjSBFrqv1TQP4BM4+YFpmxJjxgwOGa78K4qr25mzHUz3WzfTWXgIi?=
 =?us-ascii?Q?njbv7LX3qEuVgpOvfbZmBJwIFGAKpGICvodrAwYR/+8GgbyQ1/Yu8l/h8URK?=
 =?us-ascii?Q?IHfeu/auqAqw5u7wB6JsdaIPzzRtZbpTqJvQxr5GP5u+t1O6+IIjPD6tVpJV?=
 =?us-ascii?Q?IUmPZTBKGSGV5bXYTNWSAj91P+x50+k2g7xQWZjlyhoc2mR72SWWVOUDb1sT?=
 =?us-ascii?Q?hWkHGLunE3KQU+nJflefzEk1cfZM5pYpt9Okp6HOzU/FXOniW6Kt6MxuKcaE?=
 =?us-ascii?Q?i42qO5SjZ6BSUeevS+MupWN8b8g8SLW/k4Nw1uth6MAh0jL4RXu9wAkWPakO?=
 =?us-ascii?Q?u3yintkVklglBremmmWo7s9iiHygM95bpas/NN5pm/fEE7q7CO26JRX8zZtl?=
 =?us-ascii?Q?PjnVByTVP7CucE9x13JuGvJStwmAn5loBQz+v5ePPAPvDrM3kuPpouUcde/V?=
 =?us-ascii?Q?8TPT/DuksTIjtD7D3dz9C2EwVaLr9/uoEtxRIna7yDIyS3MN/3Ck?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b711fea-bbf0-48dd-3f8f-08df3aab1ab9
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 19:37:47.3798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RFBo6q2P+aTGjBaPTUNErqvbJxlCzYuloMzK1vQ1RDjcUh4EBATawpcAwJ3ZFvV2xtkRoEX17aGOYKQwEHaM656CNFDPrQ2JZriiWYbJhmxoa6jwSMPIDMfYTP7DVu5q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10307
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_113756_815124_02004381 
X-CRM114-Status: GOOD (  20.99  )
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

On Wed, Nov 04, 2026 at 08:44:10PM +0800, Jelly Jia wrote:
> DMA-350 integrations may gate the controller with a clock or hold it in
> reset. Enable an optional clock and deassert an optional reset before
> accessing the controller registers.
>
> Use the deasserted reset helper rather than requesting a reset pulse.
> This also supports reset controllers that only implement assert and
> deassert operations.
>
> Both resources remain optional, so existing integrations without them
> are unchanged.
>
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/arm-dma350.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
> index cfe3bacfab68..2f22f8a0ab47 100644
> --- a/drivers/dma/arm-dma350.c
> +++ b/drivers/dma/arm-dma350.c
> @@ -4,6 +4,7 @@
>
>  #include <linux/bitfield.h>
>  #include <linux/bitops.h>
> +#include <linux/clk.h>
>  #include <linux/dmaengine.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/dmapool.h>
> @@ -14,6 +15,7 @@
>  #include <linux/module.h>
>  #include <linux/overflow.h>
>  #include <linux/platform_device.h>
> +#include <linux/reset.h>
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
>
> @@ -1247,12 +1249,24 @@ static void d350_free_chan_resources(struct dma_chan *chan)
>  static int d350_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> +	struct reset_control *reset;
> +	struct clk *clk;
>  	struct d350 *dmac;
>  	void __iomem *base;
>  	u32 reg;
>  	int ret, nchan, dw, aw, r, p;
>  	bool coherent, memset;
>
> +	clk = devm_clk_get_optional_enabled(dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk),
> +				     "failed to enable clock\n");
> +
> +	reset = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
> +	if (IS_ERR(reset))
> +		return dev_err_probe(dev, PTR_ERR(reset),
> +				     "failed to deassert reset\n");
> +
>  	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
> --
> 2.54.0
>


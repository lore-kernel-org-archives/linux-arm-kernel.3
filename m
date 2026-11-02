Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8E3606D80A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 21:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bNTwSF1I;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=JTrtsslS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=B7oeejlljlzsKOSahHiIP7sjsDW85N7lzkaWo4d2u7w=; b=bNTwSF1IxGiHNH+rwC64KKXYVf
	lLM6fCUtzylne2yhXYkhSLTM2O5jm3G5FWFDfcZnMBJtLoWWSCEJ8MDBrWekGzecMqqBpL6NXzE5t
	OXevmb6iktBCd6+fOV/xe44HrrmspBcTG2Eewz17KKBwPmhto2BZhvP73KG1hOqEhGYlOrRsLjlqH
	CBL4YwbEdFHLBo64P0EMmp6QI1ZwmjOVgC4n/5wACdM1P3uX+nqJya7LsJA7DA2VkFLrGkNtF71Qn
	3zkm7XSAzxDS0r6PLy1fav3LXq1WGfKcCtN6tqqH1edgf+bN5VvUIpx7XFrgyWJpeux/KtP2b/mgj
	mc4SJo/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzOm-00000000S1H-1kos;
	Mon, 02 Nov 2026 21:17:00 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzOj-00000000S0Y-12Dh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 21:16:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SXDYmPxykzb7ulamocHuhnlka17uvxQ4PizNRQPOaJzo3S4C1Hc3kGVLSxPVpfdAch1UGh2Hp64zyNS3R2XQhohYBWG/6JMaPjtpHDhuNoa1qHPbM6QSCSrV6ynGDFp9vkc7jatnMztLtU1x5f/DbpM+LWwxPe3T7DmOTE/Tliuuu+R2ZpYFin9WYGCezttLlvXDZIz9hgWIdYFD2zsok2E6p96AR/dK5mhtpEVDEJtghVSPqOLGmf/hmK1EjZnCEDdS2KzFogse9oHO6AhoqcSoXPWuq5tG4N94/XOwh1RfNF8DXS1zdS6UZwo1X/zKe7tSS1b0EqOrPnS/AbhFhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B7oeejlljlzsKOSahHiIP7sjsDW85N7lzkaWo4d2u7w=;
 b=AdlDQ7GqLBBFBOLxmk49qh3DfOTDUaQnidiLREyJZfAHtEh2QWjrfKljg+7EdoY7Z4Zpn39uFPQxwaLaGMD6N2OTIaNcL4ia3JBtiSfoJfIG9cEfJRaxb+lgXhsXrtsVus57GpZHzG3pATIML+9211fnNNayn6V6We8zhwXJ5SvZ7UGsxkUtVnoQpuNLhv7ReYqzy7QdYBb+pOEH1dYaj1OjM97z7cwKuAOwhB00Kvtz884g/x15OTY3czM2jrW/fShpQDp9sULSAzKJ4NaNAVsYCj7Li3Sx7hhoYlMILpITmLCweUzHmVkSAF+DyYTOJ8NkIZnZX6NInoBrSUMh9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7oeejlljlzsKOSahHiIP7sjsDW85N7lzkaWo4d2u7w=;
 b=JTrtsslSJtW9CioWOcivlJvFQyA31JLUVkUvWQXYPam1AqIStMHjwGZcQO0eLYXrdM6ym1zAEi/jIsJL+MsKWL7Gd5MSDPKpHmicVH7CkYAYvuxPyVYacp4NYUDA8Yz2d4DpOSegBWygRlDUAHOKKlkGRyx/w2RlEDv9sFmFidy1HbkQtJLw8QAIRBaxW9DMKzVAN1Vh/chcDouylfZX64HWqtu4CIGQB8wzGBWgP/KlY1kITixndzbHQmB4HZWOCqtJFLnQd9nRWcMPB+5LjJTNQn7e6o/ZbRyXzbiFoNEm4eHODE8aXdhei34h2GovpBZS1ijEVW+ACO0i49xUKw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU4PR04MB10316.eurprd04.prod.outlook.com (2603:10a6:10:567::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 21:16:53 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 21:16:53 +0000
Date: Mon, 2 Nov 2026 15:16:44 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH 1/3] clk: imx: imx8qxp-lpcg: Reject duplicate clock
 indices
Message-ID: <auj9vB35cnh68Oio@SMW015318>
References: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-0-1c3fc3fe727c@oss.qualcomm.com>
 <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-1-1c3fc3fe727c@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-1-1c3fc3fe727c@oss.qualcomm.com>
X-ClientProxiedBy: DS7PR06CA0013.namprd06.prod.outlook.com
 (2603:10b6:8:2a::13) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU4PR04MB10316:EE_
X-MS-Office365-Filtering-Correlation-Id: c7f095d4-13eb-4740-db00-08df39269dfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|19092799006|261102123227099003|56012099006|261021121427099003|261022105027099003|5023799004|11063799006|4143699003|261028144727099003|261009223027099003|261022075727099003|261026140227099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: SqmQfSVHgoap/pwGSwHRf5rMDpgIF+34NBuLsJqagOkVyAxVgNMdK+28CGF87thJYo0/lp6O3+f3WWkRclWhuyY5kjEUY5NXkMYpspth0au4r2VEtn7ZKUjiyDF9nk6TGjGbET+gsXWI3QwRDlAI2Va2qWFoksBYztQblRp4sMzZzYxViEwCJ1hZy6pWht5bFmIjlklkWBNfSVHrMzRu43MtAn1+Y7DD6LKxRhKLQgzc5yaYptn9HOJCjlqseWMP/ahH2Qi63qAIZQtyGpwQVZUy2Sc3G7gEVGu8rUS9uERTxKTd1Qs8yCHXQjGi0VUyPI/sB9MjLziGUQEYPLEPIh7SB4TcSCU+5XGn6RLRwcHBGbYBJSRQxfPVuDGk0uXVqG39jwEfNCTQ4ZJ7bkvKrvz5WaEuBdSK5Kkx5LTrjhUJkeMqxCPRAEMfT4+PvC9bXIEeAD6nRMmswEW5Wd1oXveVOtJ8Le1tgFVN/vHI++Xkbc3uwE++dMllapbquvp4VBwvi5cm9bUOyouRZjy4W8djmvK02LEcKci23gnHjJRg5IAsTVMkdfey4AOMM6SZ37So82cVyaB5b8AvvHYFZjSddVKM7aKZpuJX6Ra0Bt4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(19092799006)(261102123227099003)(56012099006)(261021121427099003)(261022105027099003)(5023799004)(11063799006)(4143699003)(261028144727099003)(261009223027099003)(261022075727099003)(261026140227099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WnPTG2QKGrg3dNhwE3ICvSzDErpk2tmnAp1L0cV108G4dwj3+npdYlNLp+w+?=
 =?us-ascii?Q?wa+TKfYmqj4m8EoKGCaVN9EH7lzAq+UTJZl1S+phQEi7noxOr9ibQUjjUP1f?=
 =?us-ascii?Q?4itvQe8TlkWKrANNyc+j7OudDERMOtGoAvNW2ERKHJtX2EIuDIjDYTsQ7W6L?=
 =?us-ascii?Q?2rzFWxovMM2aQXFkDwZLcnMf6+BNgS7Af1MuqYSfB/GICL2KGe/+E+W6c3w6?=
 =?us-ascii?Q?bW5x2UDv1l0Kga9Di7inZ5dg3qu8n1CCQ6AgNtQcfeAssK1DVMd+HsR66gYl?=
 =?us-ascii?Q?K+NbFWafP0xRV4Vqjum1hLowZO0CpN+R5+KufXxHA6Aou81G3+dFSqc9uvrV?=
 =?us-ascii?Q?kMLroP4V5aG9srdrwhY4/MIo489s0Zy7J6SOiEgrzhfLFMlSXo1TDZRoujsE?=
 =?us-ascii?Q?bVtmq4joyfoxiP4cWmGrWWPC8MS4w89tXWLxxjBzRn8dewDqGDZFdtMdVegt?=
 =?us-ascii?Q?o5ye7gSVeOxWyt27kuM6cfw0SEccrDUWPFM+dbBrK0r/uZriK49fFY+4CKMt?=
 =?us-ascii?Q?f1PtvIj/sYve5GpQzOxarYqlt3vVT2/WsICqZLTHZiTsSt7rOKXA7CkfcIZB?=
 =?us-ascii?Q?+svUHifUxOxAW3Qn90HWatTSILOk2mLuz/qIgFH6ZIhb8tdl9V4XzuHp0mLY?=
 =?us-ascii?Q?H+7EOm68yVbWV81zNrtWtuatAg3wNaJJD4EiV8X/e+jrO8YaBYTzGRlmpS0H?=
 =?us-ascii?Q?idmBC0BV8rth8MnksHQOyCUIv+IgjIpqhUd/fRSHtsPJ3ZeDe+Ih0ruPgs4n?=
 =?us-ascii?Q?WfGTxC/M4tfDQdLtwtwA8W3o2kzyDfBcESY3HUEnp5qcAsGRKNk3NznGTjQD?=
 =?us-ascii?Q?fncDRa/PSXpzt7JXQts9YginveCrUzEs9xdA4ycP+7/sxxHu9R097o8IdEdV?=
 =?us-ascii?Q?7T4UKTzmb6E3L35vLByWpFVjqiCE+6DnFP5dZdvx0f6NHhrOoBYX3UxC3Uer?=
 =?us-ascii?Q?vWnPXyy7q8GZEzNQoGxB8OSxs4Tf1y3bXslJAIeCmOo0E5j0MLKP5sZIGMW4?=
 =?us-ascii?Q?y4QlID1yDlBQ0WDlQzyECMmI/QqqMRv1Q0tQkuP/z+z+CZSLSv8u7CWrc+Di?=
 =?us-ascii?Q?71XkdKgoZ82INFjEc5ZeRkpujie8MSJ8kRIHrStRr9dbdw4vbQqnFC2Qm7Hy?=
 =?us-ascii?Q?tAVtFmI8vMMcvxE3SSajk/gX+lEmQWwkROYarofyzkhtVGKNZzPyfW8WfxGE?=
 =?us-ascii?Q?pIgMeDvOOHfsjhRUvrDLP+rIpoon3Kw+I/bjjCPUgEV+0/xAMuYESXRxkUFJ?=
 =?us-ascii?Q?XjD8GixRSREDP7ntA5iX36cHq+uJ5fOlXR6U1tkS46hWdc2oawVk3VWMcd0F?=
 =?us-ascii?Q?I+OYi0bjr+EI8a4tl9u/57PQEJ5i5ruIE06OBmdZbSzAXFtMVusmpVBrLlzB?=
 =?us-ascii?Q?O3scVqFv0uFcEk5ZhPrM/bkrWJlUwQHgkVUY3lTJuKTi66A4qq3qeV5bDMTU?=
 =?us-ascii?Q?0Zd4lfITZyDCT75N4AXKLu8rVDvKnjvfqeI2u2s4ol72XqoWhSxA6hh7iXbk?=
 =?us-ascii?Q?QuxOBPgSp+LFNy4bpbMZoc/uEc10g3PR1bWpxNhYdkKJg//CprwT3UBZQHyq?=
 =?us-ascii?Q?UWRAD30cYku7LZpaFETvMwd8XJ5oGa5oAxwHF2tSmOIBrGRoWiKiHFTH50Gb?=
 =?us-ascii?Q?IlvHMZRvrokvNm7QkzaUOM7JZ8iRD4l8lFu66i8xElTAxZPCDSRNsvG0i83E?=
 =?us-ascii?Q?3TQMhwOyV73YSMWpCHDXTTR5TqBFVRryOAlp0WEtkix52yiuCfXADivqKq6f?=
 =?us-ascii?Q?O/9JCjBbGcXVd3TtB+U/J+Nt9WI+kkIBk7kp6jkV1aVLU0bNVnre?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7f095d4-13eb-4740-db00-08df39269dfe
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 21:16:53.3864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aAzKudHRmHZPMfHyeI+l3BK0cnYe1kMygGO120TJCGgQ6CaW05h7udSmm6G8Z0u8mwckRKeXqMxcPB5fWS+SN9x/LJbo3yf7sxRsmEvO8q7itSDFGloJknktTIme4V8j
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10316
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_131657_293348_E736C28B 
X-CRM114-Status: GOOD (  22.42  )
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
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 01:48:49PM +0200, Abel Vesa wrote:
> imx_lpcg_parse_clks_from_dt() stores each clock it registers in
> clk_hws[bit_offset / 4], as every clock output of an LPCG owns a 4-bit
> field. Nothing checks that the clock-indices property names each field
> only once, though. If two entries fall into the same field, the second
> registration overwrites the first one in clk_hws[], leaking it, and if
> a later step fails, the error path computes the same index for both
> entries and unregisters the second clock twice.
>
> Reject a bit offset whose field already has a clock registered.
>
> Fixes: d5f1e6a2bb61 ("clk: imx: imx8qxp-lpcg: add parsing clocks from device tree")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-07b8d98e-feb9-4c88-afb6-3b5e0b05dc00
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/clk/imx/clk-imx8qxp-lpcg.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> index f0cf6cf91899..e57e7bc074a9 100644
> --- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
> +++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> @@ -251,6 +251,19 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
>  			goto unreg;
>  		}
>
> +		/*
> +		 * Each clock output owns a 4-bit field, so two bit offsets in
> +		 * the same field would describe the same clock. Registering it
> +		 * twice would leak the first registration, and the error path
> +		 * would then unregister the second one twice.
> +		 */
> +		if (clk_hws[idx]) {
> +			dev_warn(&pdev->dev, "duplicate bit offset of clock %d\n",
> +				 i);
> +			ret = -EINVAL;
> +			goto unreg;
> +		}
> +
>  		clk_hws[idx] = imx_clk_lpcg_scu_dev(&pdev->dev, output_names[i],
>  						    parent_names[i], 0, base,
>  						    bit_offset[i], false);
>
> --
> 2.54.0
>
>


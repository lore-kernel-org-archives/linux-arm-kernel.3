Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C028606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 17:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HC70BWOi;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=J+SItM/P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=p2qWL+hG15bsXbukSqC9XQCq45YkLHHp7iYdUx3jFp8=; b=HC70BWOi40ho67NVlRXDtwtMQP
	mvKlyEjpPnNS/I22kxA2d04ioFl3fH+pyXCAoU1nxOS/tM87aIK44KmRnwoXoVMIPFMobDC3wQGtl
	ul16rXTa9fbTPngAc9ENr2w6ZoSLlAPGVnrLIOWcvVx9rvW8hq/ocyPeEFyVH3GLCiGbHCPBo79PZ
	z+0TKcJGooelXSamZ3YwMoekm0U+tGgCu6alVfss9Xv0duqmUQ/F2dZqSVpZ6j0EG3nAQ9Tfw5vIF
	qzPsRdIFmlLEb7WUP4MqZcYKuGF9rYY9xKTrymAlxDkhp2GUusilH8izdgUNJJKdt+1x6KfYNNuiZ
	15NNAW2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1SK-00000009ykQ-3BaL;
	Thu, 05 Nov 2026 17:40:56 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP1SF-00000009yhM-2T5j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 17:40:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kiy0Gan+Yz5p8tSnEPNpWSnorqJHflmXW+e2YU/lDJ91Uov64n8W/FkcbYZ06om0yxSeyfZcI8sXc9Y0MHF7eVUL3VYs3q33VEvZw1pwIelalwkVXYowsMAgp6BujEsQ63OMSAtBVekw1zVpgxWe50/hzjAtACc2UUReNjuwRYG6MtYY+nNVFF1HAtAzv3AMVfZaSnTnBFLCaq8uNymynFGv6MthdJAwKB7AZeGXXfs0Ai4Mp8HwOB5PydLm5VasWKe55F63qatHc3JW9RJXaz/gAo8kKs1ZmPhrADIROsqHgNl/hp7a/eTTZYCU9IY58VAXg/6SOO6XOLDcVgvS0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2qWL+hG15bsXbukSqC9XQCq45YkLHHp7iYdUx3jFp8=;
 b=fSXjlB/1dGQdHDUeCCty6J+cBiD5n3fX0tnjFDiiJMvMCxhVtUzQTi53wNasNEXgYmbz11GoEZjK5MA/L1ZYkx8Z/y1Upwjf5+zsdmNOaDQslAxHa/kF8mmlAdQ+JJDiju2rDWGj1jsVJ7b9PuCdtuxKqd2nn/PmjKIyrXvUKRV29ns9hg7vrU7ce8BALcBpSEvJOlewZWbuqqAOvXOFkyP/EO2ymiTBn0HAFkBI9ZNysWFKQBPxIkWXM7glI2tUGx88DoM5s1XIOsdyJ8+TTaCK09yZE0fCMJjCQNICvHFWJ8ULyBGPw2ddEoRGxoKyQBLB5YtCKE0/JCVTadHQag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2qWL+hG15bsXbukSqC9XQCq45YkLHHp7iYdUx3jFp8=;
 b=J+SItM/PwRhvrw3DbkH/JCndEvMHc9kgz+3AdYQnB3iMPFpP5wfX41cpv/pTcGqpQqHZ0+skXzV3KjqdJJF5trbEhEAG4KzqTO2pD5qRnNqxLlEyU2Y1DsazUpmhypvJwoSmq5IoWYqOjShxuHEzff5e03dPX58ySwEwpy/sQoaT71DfQVQHB7pIJkQQkjc352etaWNHO1sNHZU1z7dTOSHpqZPHiWsXG6PotRI2WxWKesEZI2hJ2nUAPN2hWY6rsYCS9vkNvY93e70C0KGChSqdYr1TpZxCW07Ex5k/lxwXrPs2vqo4ud6lyvrlZRcU7ZcNbwwA6UUU3bmFMcWI6w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by BR0PR04MB796737.eurprd04.prod.outlook.com (2603:10a6:2c8:4a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 17:40:45 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 17:40:45 +0000
Date: Thu, 5 Nov 2026 11:40:34 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Stefan Ghetu <stefan.ghetu@nxp.com>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Florin Pavelescu <florin.pavelescu@nxp.com>
Subject: Re: [PATCH] clk: imx: pll14xx: Fix potential integer overflow
Message-ID: <auy_khm664OQmE-Q@SMW015318>
References: <20261105094632.159200-1-stefan.ghetu@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105094632.159200-1-stefan.ghetu@nxp.com>
X-ClientProxiedBy: DS7PR03CA0242.namprd03.prod.outlook.com
 (2603:10b6:5:3b3::7) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|BR0PR04MB796737:EE_
X-MS-Office365-Filtering-Correlation-Id: 66b6a5ff-5e59-4d34-bd47-08df3b63ebfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|7416014|23010399003|376014|1800799024|10067099003|18002099003|22082099003|56012099006|261009223027099003|11063799006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261102123227099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: fgqm6NlzwPBkis04LB4ZC8yyu7JT4NazPF9P8rOnKO6pzY+8/cZxxrWtmgL4cE29u4RhQAjl/R/Cct6ozmSVE3CpSPanAe88wLdNM8YcWr+BWT4Bz1/JmEz6jcP6KVzsfV5D4yxaL9XwrRUVglaYBzpYZAYbQXinKV7Sq3PjXo//KKM6Oo5Q4s0GrypyKlqyhVijX2vJfiJA/zs4+eA3QO8gqXCYmD1yI3rORZKn2o/MG9Xth5vjcEmhAW8Uxnked2sTNpIqmpYLuIE1lJsU63Oo3wF5o61ztIFGkUxB6KufVWuImWoNdhy6/OLZLlcb0BdDQukV7MPWFdIGdB2xNLNxRUjbdZ7ArE6fDTQ6kF2S+wQ+aH6BO0FjzgMrmj/B6j98PYjj9jKmu6E+HWsUbAF7tGhuGi/Vlv/frSCcy25F5KLi5BMhNoBCYd718UTKxCs+ZhGds4GKOzKwPdZqGDjGOVB81lMZJU2rYpX8ts6ySpea8g1RqQ0EOE6uVe3szC2wt2CWkKLw7JoYjOo3FqNl84l8DUQ7bkKbA6PvU7kAPo0sFV3Tka16MXxehoCud4tVgCsenczhNzRe+4l5IAeX2c3s/GyaOUMVfMk9i4SStQOwj509hfaxWDEAbztOMeWLk0btHHGkLJOggGMvizi47zLJpRjYsqoapLeBQf8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(23010399003)(376014)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006)(261009223027099003)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kLTNdyWPEQDfES48AJU+dm2okgyQoDlVDjWD37qrWeqRzmeQSElXudYuzQYX?=
 =?us-ascii?Q?ZUym0DI/TAoaNBsLSODpawAun9cRORtg64uUMAVgbGtcS2rSsuiwThRE2jvy?=
 =?us-ascii?Q?n6AXWbhmrXxkZZaGin+fci57UZ6gu880D/g137hgzHY+HaNtww7X6+0rYDtF?=
 =?us-ascii?Q?G2u9z+ogoCkoqoXOrvaqZprC6iLCwADKan4Z6Dy9BY9B8Qw5oCsnmXcvfD0Q?=
 =?us-ascii?Q?N25RrfvJK2201X5SVEWbm5MgNfKziHYiEn5tBUt2HyPcN15jiGpa/Qu3u6IM?=
 =?us-ascii?Q?Mq/9Z9QZr/IL0jmrUEEJLIuO1agtSnynsPhseueBsOAzyDfmsYyWjubJjeCb?=
 =?us-ascii?Q?YGcA6tk6dfxj/8gSQcS7j2+LQJMsjdu04ACWhyHxNHbq3XcM5aZz9zLOh4IS?=
 =?us-ascii?Q?CKjCC7TjGMXZgsltHsW++p86XVAUzOi9rSz9B25cIFdNIiUPt3m6WKCvO6Wv?=
 =?us-ascii?Q?P+nEnWBqw3aBIKIvjEbJjScmIUPif5X4Hi+fsvIhrTLtqRf5N7LonsN0fLpf?=
 =?us-ascii?Q?NI8PcSiHBOmxYgL8sGBJn69y8fP1KAQ+/zyhYftrkpF2TbgoKKWvc6hy9z/Y?=
 =?us-ascii?Q?V0AEO82TkdMxbJb8XfzNko59kaQQyGixjMFWvNQ1mWlq7VRp6fNQaBvbB0QK?=
 =?us-ascii?Q?IELEBMuuR6W5/oedrkGBWHibAgEm6r42Bo5y/2FF0F6KcWcztXI/5RzgVydt?=
 =?us-ascii?Q?tezJlg6OTQAElIceNUSR9uwnCUa9gbZq8Iin3VvQQhqWcurxQPlpe2Esl3T8?=
 =?us-ascii?Q?GzF+uDgFgnIaSVcCSfUnMtyn2wpJ+NW6fGc9A5J5k0AZ3vnDBLYRdIKUatmV?=
 =?us-ascii?Q?Gttkyo8X1jvjGVp1oUfRypbDtbWHJcCc3nA/dtyLnOd+ekX3tFALza6kqrQv?=
 =?us-ascii?Q?t5arbPGePnIzq2DL9fXmDW4DMY2SYXLpsawBiMtf6VHPXNUFELF8ZSHtDimm?=
 =?us-ascii?Q?o26wopTjiLmnBVR8NKYyfMsmVmCOifVixaxeL8NK4DRK18lEnrY0cTPCGR0i?=
 =?us-ascii?Q?gtNIpRaa3g3pO4fjb00jIEcdgc9BMycVXtDVOzp9o+TLBz8h4EGHjx92ve3z?=
 =?us-ascii?Q?yEVFcCaKApKOOpVRMbNzghbX2qbTjfZPlNB4DMB90m1DSW65/e4TzshoBTWT?=
 =?us-ascii?Q?+bYFlewVU4YDIC8EsIUwj7N6OWraqefXV90KKAzQ2agBVEFub80sqVwDyHrk?=
 =?us-ascii?Q?pQMoaH7sBr6THqQ7ZU7FUaddJVX5tRBRAwn+uCjaswmUByEKTS3LrQqNRFMo?=
 =?us-ascii?Q?UHyC+2m7A3q3T7YKWZcwvZzJ6E4KHhgTcd2XLkrvL6FL93d1xhm1IDFkfwy7?=
 =?us-ascii?Q?O0jTlmpZBMLYNiAwdfoyQEqC8CzVXNuGEZoqTaNvvvK3p5ZZth715EEN7HoZ?=
 =?us-ascii?Q?Rhm77ITB2Tqzz9ndMS2D1cXLxPxmv+4A6YQlyUjpMVAEVV+4gMWYMwQDxegi?=
 =?us-ascii?Q?cIbfK1TlFm49S0wguXj8NYW8UIT6rApKQe4wpYjpbMUFGEntw/RnIpdNdJmD?=
 =?us-ascii?Q?fe/RHvDkHT13eIib92e4USsdQQO/qIKcsAx6xrb0BmHzHMrkT7U4jIjohnq4?=
 =?us-ascii?Q?0nkAS2P9TO9EivU6nktEA2ubg1nuh91oKtPnjSXzrljhOIpdyAQy7vfrbAy+?=
 =?us-ascii?Q?uo0XRe1vwkF3HERUdZt6BThuBPjEetuD+ypjoxwmcrbXB/N8IBEewnh+KITV?=
 =?us-ascii?Q?c08kt6OvE15oGKqnB3kL/sXXlTC1gGNLOmoESMl8EjBKV5my5mt7Y2O/iLrC?=
 =?us-ascii?Q?KWwEFpjT4vl4+o5gvn8grne4d+4NKzHAnx2pzgzUDFOd3vzO2iFw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b6a5ff-5e59-4d34-bd47-08df3b63ebfa
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 17:40:45.8937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B44+fwGlpFOXRHDyQyXHTX9q+Ke3w7n56QjS96yo/MXSBIbXXAhbhafYWFYphZ6iuR+ETwADYaPmaEpYcJgBq0wLSu/WOmlWXh1j+W3i2zyx52q9zQJlVSa95jRFtutR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB796737
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_094051_638116_DD6B098E 
X-CRM114-Status: GOOD (  16.06  )
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

On Thu, Nov 05, 2026 at 11:46:32AM +0200, Stefan Ghetu wrote:
> [You don't often get email from stefan.ghetu@nxp.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> From: Florin Pavelescu <florin.pavelescu@nxp.com>
>
> Cast to u64, so that multiplications and additions will be done
> in 64-bit arithmetic (and the results will also be 64-bit)
> and the possibility of integer overflow is eliminated.
>
> Fixes: 53990cf9d5b48 ("clk: imx: pll14xx: consolidate rate calculation")
> Signed-off-by: Florin Pavelescu <florin.pavelescu@nxp.com>
> Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>
> ---
>  drivers/clk/imx/clk-pll14xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> index c6438144e507..08f9d3fbc75f 100644
> --- a/drivers/clk/imx/clk-pll14xx.c
> +++ b/drivers/clk/imx/clk-pll14xx.c
> @@ -124,7 +124,7 @@ static long pll14xx_calc_rate(struct clk_pll14xx *pll, int mdiv, int pdiv,
>         u64 fout = prate;
>
>         /* fout = (m * 65536 + k) * Fin / (p * 65536) / (1 << sdiv) */
> -       fout *= (mdiv * 65536 + kdiv);
> +       fout *= ((u64)mdiv * 65536 + (u64)kdiv);

suppose only need one cast.  u64 + u32 will convert u64 + u64 automatically.

Frank
>         pdiv *= 65536;
>
>         do_div(fout, pdiv << sdiv);
> --
> 2.34.1
>
>


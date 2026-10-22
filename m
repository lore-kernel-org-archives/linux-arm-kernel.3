Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7523C606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 16:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=acKFyRpY;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=rSZp+T77
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QfIF7AUd18nrUINuY9KG2OvvI9ij15PSgjEttO/h8z0=; b=acKFyRpYy7P/IisOCBEFtA2DuI
	PWfGYcdU8kZC9ehM59uMrFmxY1lcPjAUpheKMPZtE3yJ2fp6wUleKp6KWBnKIuXLO1+bGRacsbEoe
	8CWEFEPgdpQ9LhYtDAXoYxuVpuWheJNA6SepdlEM7nuv2jD0XuxWp+x37BX5gLnfmm3lWM3Zkfgjc
	PzMPNKefgOF7ZhmfqDtQ62rI6IAYdv3uM60mwqUYGPXVOaVX9bqZGfTgnrDAAwdhZFghi0DWK7gOk
	WkOoQfLcH+VzunEi0vnTcy/kAqFzkaXApKZip0RmaKp1vt5Dkix8AjJJhezlt42Nf7BNSdTIjRqEC
	BlTDPifA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvdE-0000000EUCj-1q5S;
	Thu, 22 Oct 2026 16:27:08 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvdD-0000000EUBe-085J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 16:27:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cfqci+TE1iTuzkTtCA9avTZsGORm8c9G7NtpbrT0x+24AvwzT/mRf6cZM7bHcGisVkTU5cb8OsDOFCXC4q0ery/LZcvqblXXSSRJF3E0Ew77ta7fOZGZZ0vtLonFSiyZVaA4PWpszXTRdgBDeFzza/+zvyXFbwpJO+3qlbIymwiRzQoOVST7Ii4MFyzmmPgEcihmq/I4gXwuw8fhyEOyXi2oVpBYlKXcxxGPaU1f1MfbjW+xKX+Us+6ezLzCGHXuqtU8tkMXPCXTYgcKeeDW5SGeryWSXw44svXNlFuHglCb3LGLITNN5dy5HO5GUQaBsD2RFMGF6lj3HqaWHDA3iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QfIF7AUd18nrUINuY9KG2OvvI9ij15PSgjEttO/h8z0=;
 b=Si8os5V2HZJdna8QVu1x7mYH04ht265XweHVSDwB/mP18eA/Ajoh8UDGH20AWpMLYoryw2Y6xTPJPuXa2AWP1wQJn0iJcZmGc4vY/yMlcJq/kmoHlqjsUHiINrJByvMKNsNGTNKePQBTn2TCQMkQ5GhRJVOV5GgoByEDEvJ8CRHIIiemTmOt4I4OkdX6+53VynWLc6x7k5qmpIs6iyABNt3IX2z0TXNU15FWvi33HeC72ymDN6XDuKWAXulW8wiQp4/qsLxcoupZ84Rbthz2gowuE2wb60ZsksYv9PtngbWva9U3YSzoN8h/3rxsfuh+R2cxNEqbjiugRYCaWd3CCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QfIF7AUd18nrUINuY9KG2OvvI9ij15PSgjEttO/h8z0=;
 b=rSZp+T77hCNFBHuhtAVPq5Yh6mGLRChqSJvyyjfvJLiYaTmN3dVjMndJUTYrXu9tEZ0D5IKO/+2tAIrXNIQebSCnuQvJx+WMZyAosiPtbMVBj09z+2FJtg3QhF167pHuNidqnoR0BxUrCtP6IxJegFRfaqZcZJCfvujyow97BKWokHgQ4k61ln0DaNCHzCVCuX1n+0NPQJ2Hnga7GdVBW8Uvoa880WjdrAFCOm4C5tWnm/yWFdVoC4ZotxIuBvrArTxsJ/JZ1t61TQYyqwOJTNfAsO6grKsQIRiOXTjQPK97ziI34q0r0BRCs5LPzRP/CpdO9p9+Lt4iLdOTTOxRKw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by BESPR04MB068037.eurprd04.prod.outlook.com (2603:10a6:b10:125::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Thu, 22 Oct
 2026 16:27:01 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 16:27:01 +0000
Date: Thu, 22 Oct 2026 11:26:51 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: sun6i: bound burst selection before shifting
Message-ID: <ato5S9rXovXJO6-i@SMW015318>
References: <20261021-submit-sun6i-dma-burst-limit-v1-v1-1-41a7a476ef66@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021-submit-sun6i-dma-burst-limit-v1-v1-1-41a7a476ef66@gmail.com>
X-ClientProxiedBy: PH8P220CA0032.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::10) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|BESPR04MB068037:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e306486-ab42-4a37-83c9-08df30594cd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|7416014|18002099003|22082099003|11063799006|261009223027099003|261021121427099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: YqGWQDWdtc4f/05/jAntzC6sF7soPeE/B7gfbhmLkkjf3n3mII1jHP9ZrG+Wm6dGzXh6m7hwRQ7wlbG51vivthizL5Qfli4kYabSSWeO+21rb8SaRxT2/0i8HZ8WxbTlRj9bUxjvEv69x7NYlqzf8mGvjoZCJXwrsLelJaTOrMT/JQ8sOEhw4ilenv2rB3aP/Lg+MITxcL7U3aQ4pGHCQHeG6S7xechXw1xl3ZmAADoxypXN9PJB70J/enrh+SH4/EkGBiUW/x57OKM9y+yePbph6EAvg9KSL2qkhpjVQCSrN2gVMjsFWReICLOQIZ5ZRFq5fmDW1FLu0LcEEi57p2ys6jFONihS4irSMXw/L1G6v0fNLFHJYRr5ZlAR9wPcbpNfeBiUFzi+Klb7g4CXZFVHqWSLduKh8Ra8UtXQhTuoPJBT5keVCJ7HqnGYpDDlKN23MOJLHL0LlCcxqi5ImIvbZZDn6h/0WSLtT4AMBwPlgMUXRQB1rLaN5nL+asxDtB4/vZPTrBtEEl6QyQUcr1cbHy18dtIOeknzzXjK8PRKXxK+poYSFeme+EifaUHE4f6HX/v8kG5qQY5lcfnksdnZofXQClOWEhgq0enwlpZDbY7pJgcdoeWHVL6VrQZsdjsgLmNHMOAeCyoIfoZSy4FMTqS+2l9OzWeSYT+zalo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(7416014)(18002099003)(22082099003)(11063799006)(261009223027099003)(261021121427099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j//oX+0kq/3/c269MH3igy6kzgyCwvsOe2/VN9lOk7OkghhlPuI+y9LjhZKS?=
 =?us-ascii?Q?zakdrTIAioNgX6yx5J34ZqIFW/AMcmwyDTg9pR7C/n5xYcNnL5s4D6Nxhm03?=
 =?us-ascii?Q?AgEdiTd6NgWGkdrFKpMKPSudxVAdy845B+KsVEXqljArigHUra4eGAPJh0t8?=
 =?us-ascii?Q?zFj/g8aXLLBgZ4yu71LItTc4Vg8R+kwZ+X1gIILeib2sEWkwlf7dFyQErnZQ?=
 =?us-ascii?Q?otqxIxLoI//JJ/Ei6SQ6K4RMzw+DXi4WnpJoRHX0klZugBFlYDBtCpTbZgm9?=
 =?us-ascii?Q?p4sm7Qw5R+7ek28PNyVQSh1gzRKY7AGI5jwrHLB6sAf/+IA3G6tNELewBEzw?=
 =?us-ascii?Q?rlQ97MSRgKgjb7yM9jwcfxfItVwLhbP1OiEYiaRqgwr2H7hmU+BZw60d6bfj?=
 =?us-ascii?Q?/6ui4aaJ9/s5Zb8BQmgYOeW21WxS74JvQzctt7+ulgBW0L2SfgJLJAik2AAQ?=
 =?us-ascii?Q?x1Rtqz2fKg7ZZ4OIu1VxfMcGLRM7BoHtYx3MqiZ73MeE02qHEfZVxh1qcmax?=
 =?us-ascii?Q?T8f3MikTeAI9+0Sj7x3wUftNTk1kLDcZIpBFYMepnWrcD0plEhusO+uu2npv?=
 =?us-ascii?Q?eWhCmUW32pOqBTdllGGgglOFDpHJtHAvZ5EIg37G7xaOLDp1NHM6UTbwBrVQ?=
 =?us-ascii?Q?RlZ1YY/5+1LGlx2/kVZPUK3iSl09z6H2atIYBuPHCmpiejke9M9D4dbtbTJa?=
 =?us-ascii?Q?g28f9uPAz+wIaR0PmXVIJ0LrLDR0Pc7LmLqZ0zc0+SoeAa1LoqPS4PuunCAo?=
 =?us-ascii?Q?MWlMmK+NO74vpd3+Tu23BVBeUwnn6qeLhN2pkvRbqO/IHPezlgCoJvnllvw8?=
 =?us-ascii?Q?ao1FER3QKc6TuXCr5n79D3gL1VKZWEHPJLm/6ZT9RNEZXwNtcRWhP8bsa4R8?=
 =?us-ascii?Q?bG1UhnwxSQkP7IUou8SNHRcRyWB0us8z9UbOs9qkik7+NvEviCqgtlUaLqtj?=
 =?us-ascii?Q?RUEtE8X6XRVNQ5maRRRkd/vF3iNogGOfa/z5GrMXrlaeasI8IthMR5CIg0v9?=
 =?us-ascii?Q?98Kidwb9A/XCscsyYq6XFx7xVK7C/9mjhXVfrJ4M0t9IMlWq5ol99qyoCDzH?=
 =?us-ascii?Q?VGagnvfls5DZrzg+qJ9dg5gnwHUdeO9ZExoyFkapQMuvbbmwHTF7YPy90HfJ?=
 =?us-ascii?Q?/hld36mY0lH9D8v2bTD4UDsBUdOJSRkOZZv+TRMVwpNmRs6AcTtUFhpVMN94?=
 =?us-ascii?Q?qM12cpMUeS450L5w9byzm5dMPmXmTdaCRbtUwdBtUGb2xY0m19c5Co7DOIMV?=
 =?us-ascii?Q?xU7wVyO5r3Gb7krzXgoTA2z4sRP/cHJRCgEjceZG405EZnjSwfn49OL/CCDL?=
 =?us-ascii?Q?D1yZuRxR9Ocwbhng42sMdvFjJZ/FXYsrYTYy2znV2pxYF7d8wQaBP+UBVzq0?=
 =?us-ascii?Q?1wUkkL2KSJ1tZ9AgBcqDiPhITRL1lDs2vi+7V7t2qKAt5KWcF+lmZdDJcokN?=
 =?us-ascii?Q?qtsYHZHxw+8zTmH/8Ndivu2Yq73vIWuJqieuiVEu99KksjLckN3wXL+95aJX?=
 =?us-ascii?Q?CNND5ZZa7YTGrNLzzReDSd2PlwEOBNvTgZLnUlegAlWTtRzgRc2rjlvFO+hv?=
 =?us-ascii?Q?HWF8ntoQNIzHoKBLwJT6ZcAAQTV2VwNe1ZNpnfdIQUxBISGaPyf+OqNXHrEl?=
 =?us-ascii?Q?IvLM29qGFPJJyP0eHnxaS9jevOG43ofX8psZ0jSL1XvCIzpm6r2+QvLdPGXN?=
 =?us-ascii?Q?kKPmVOzz+8uAWEqfxYCdhKHoQft8S/4cAua1YAD2D2ZUslLryH43P51JfpN4?=
 =?us-ascii?Q?5KpeGnV7m6d1fHgcWtEchp/ZdTfZda65/VYNiqrxGY2QBV6c+xsr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e306486-ab42-4a37-83c9-08df30594cd3
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 16:27:01.1104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XL2t/ZomTcaRvdlKPqWrcT3cMymmZ+PJtDbXCyLzIp2UJkrfsyETBy+vlqZcKKmFDSqbmlbICL5csb8dXrCm3p5vRye8qeFQtEtK+zrzhIuc29IK4JdCZBLdP9OjoTHF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR04MB068037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_092707_074169_3284D7A1 
X-CRM114-Status: GOOD (  19.05  )
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

On Wed, Oct 21, 2026 at 03:06:33PM -0600, James Hilliard wrote:
> find_burst_size() tests BIT(maxburst) before reducing the client's maximum
> to a supported burst length. DesignWare UARTs request a maximum burst of
> one quarter of their FIFO size, so a 256-byte FIFO supplies 64. Shifting
> an unsigned long by 64 is undefined even on a 64-bit CPU. The fallback
> loop can repeat the same invalid shift.
>
> Limit the search to the highest burst represented in the controller's
> nonzero capability mask before either shift. Larger client limits still
> select the largest supported burst, while smaller limits retain the
> existing power-of-two selection and the zero/default case is unchanged.
>
> Fixes: 7178c3586ab4 ("dmaengine: sun6i: Choose appropriate burst length under maxburst")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/sun6i-dma.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index 7704b016aed8..a8b12262b3c3 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -590,6 +590,9 @@ static u32 find_burst_size(const u32 burst_lengths, u32 maxburst)
>  	if (!maxburst)
>  		return 1;
>
> +	/* maxburst is a transfer limit, not necessarily a valid bit index. */
> +	maxburst = min_t(u32, maxburst, fls(burst_lengths) - 1);
> +
>  	if (BIT(maxburst) & burst_lengths)
>  		return maxburst;
>
>
> ---
> base-commit: 93f51579e7df248780214094418f205253383cc5
> change-id: 20261021-submit-sun6i-dma-burst-limit-v1-47e32971471e
>
> Best regards,
> --
> James Hilliard <james.hilliard1@gmail.com>
>


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB65606A329
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 21:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YUEVIWNG;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=s7tFAKAY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eTjOON0/vBDcvVJ/FmQQ09Tbl5fglLEwcqWbGygI/3o=; b=YUEVIWNGgZSj2i6BAzomKKUlGk
	J+rsqd8AO247ePDURTMAk0k4tOWA/5pButPFQrvkUTIxmme9lA5fm0i5opglT7QChXrG0+4k91JEM
	18b96BEdimtYtvtazYY3inDskHnrVzfUt36PC716QUQoys1it3jKxEZMdhpSaeibrNXdy9Wh0WKy2
	HAgQXCjoTe7fsvN5FtAsNgiX//Nb2uukmqbf1YUSRiIDSk916XqmCXVRRsBKBTehBYjEcL0iZOZ7k
	3rHla3NQ30bKStfpc7DrBHLvMsUgRcocggkOt9xqDAFAX1MIQy++G8FGau3yaq5TnKtK2MwvC4uU4
	pTx+EARQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzYD-00000000TgQ-0vcv;
	Mon, 02 Nov 2026 21:26:45 +0000
Received: from mail-westeuropeazon11011028.outbound.protection.outlook.com ([52.101.70.28] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzYB-00000000Tfo-28K8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 21:26:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QG6TDDAm1hrk1q4DGQd+IGbkxvb4yq432/et3dzhumenPkAoIqU0353BYNUm1EYjH8OhdId241wxUCN64z/1xueZSdEa/ub37elgi5AENN/JTB/ZoV28bF1K2IIpoVOYtFNtLFZ7oOmolRpxEH++JfQ/iGP2mAzDpv7uY0Ag2Xk7hKqq8ZscC0S8QF3mnYOXSasxqJw2l41D36oi2TtrqbezsDNMekWLwu80UBrfDC9onmQfJW56znTS97ZB6HS3Xqn/tSzb5PJyklYkdB5pdIuFAa8N17HadnjfaHDjNd+hOmyBS+7hzD8yDIekHPD9PY5MZffeBiJ3jiHCTq2bMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTjOON0/vBDcvVJ/FmQQ09Tbl5fglLEwcqWbGygI/3o=;
 b=zVN5UZX38nvrCj8tgcT4WnkTF/ig64IiCKR7p3BddWFiKzttG1V3fKp+xYRszpy+i2fWfJ8EMFYsDOIiOOB80MzgBkHUtrL2KY6u9nHO68dJRoiRA320K12hwmXMOvpMaoSEHNKeIY8qu4fBjw2274j1PLoA7Hz4ZVYdVvvdHdN6BVpr9ocwQYJjf9mIDgvMwEvs4oNPIU9mi9A58u9FHdaSeCcEohoVNiTvFxc4RmQ22RjVrhuylX3zQSO3OF/8Y1DvCFSSlzhtvaxpL11sSJCZYnBSlAUJe6/qpFTi7QN5UJSqsCuamzy3WOuUih6W/dJYGKqoncGssetkj9gQBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTjOON0/vBDcvVJ/FmQQ09Tbl5fglLEwcqWbGygI/3o=;
 b=s7tFAKAYzcyfcDzwxZ70LLHdhb5Gx5yb/w1z7cQSxyGw3dOxNGXWyKddMh8gOVI3iq4QmpiccUazhAGfzRxvWRH5IJDyDyQAzEa7F4yCpECp6g0g8UoPf5/Uslu7BTTokBqc3D3MpvEvMh9CoGElvSIMtGxtU3C4yl5g6vmkxI1vsjI0eM6LUgW6DXu0DiaR3fjubtoKc/WHAtdnjFI2YgQ2ctDFQXbAXDY524XsC54vvL5F+R3Qjk/OJoq/PxZcX6B3a8Ce5rBp7hQ/HCFOlrSR+AOZHojc4hhtosOT1WaMFnAJuKkGMObJdQDCBvwoGVjGEbqaRGw63gpbLqiUSw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PA4PR04MB7680.eurprd04.prod.outlook.com (2603:10a6:102:f3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 21:26:38 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 21:26:38 +0000
Date: Mon, 2 Nov 2026 15:26:30 -0600
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: imx: imx8qxp-lpcg: Return an error if the
 parent names cannot be read
Message-ID: <aukABmc4KlHbaIjt@SMW015318>
References: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-0-1c3fc3fe727c@oss.qualcomm.com>
 <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-3-1c3fc3fe727c@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-3-1c3fc3fe727c@oss.qualcomm.com>
X-ClientProxiedBy: DS1PR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:8:44d::7) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PA4PR04MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: 57f083b3-6f87-46b7-b04e-08df3927fad0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|19092799006|4143699003|11063799006|56012099006|261009223027099003|261028144727099003|261021121427099003|261022105027099003|261026140227099003|261026121527099003|261021123027099003|10067099003|18002099003|22082099003|261102123227099003|3023799007;
X-Microsoft-Antispam-Message-Info: NewAGhXKLWyLEjJNNzUMuKHiV6Sn7rq2WulZi8opcNq/fSPh/Ic5bV37O4NIV9kBVyYHZ7m+zi94SD5urOAe5z21edR2jOWTZPEDf3/XA/9SZlQwkrVqHLrotv/XwgyN9XEGWYTIWAcD7FqdDBr0w2SUMvXasGgIa6jNrGI375E7hVXgQ0MjRmRNs85UPbFE8GNLtKuM2i1QecmUbMJsRL0l3BemMbdISOfrDT31oDKCusZyMtcKJwsHzSo0TXEzMqpuMnQrB/8CKOG+920acq9T7ceUlIiNvw6v/3ddjIVgULzgISnKirK4rv4R0e9b4VSM+od79lgtT/qSTSEfVsZwshdHJBhGjkRQGD+TbYcDDmg/SO+z9XibfdFqHybmNBqmCHg4DTLdOQOMHHQBtBTyq7N374ZlWy8WGutKrJyLdbp48yZnEc7t+1/VKW5vj2Dl6NQtPV3WUPBtRgOnk/AZ1sDzHlygN8LI0BzHW/wwTzE4rFk+TJth7xb3fA/yns/J6F5SZaei2gwKoC4cIj4fFKYT1d9rzpybV+wzCYKLRXIa2bwBpLtPR/vYHsPwIB1hsnW0gi0mf76VrlwchpEUK5iNZo6fx+N4DfwbnQOjoyAWtDswMLeQCTcnfx7tyi3dSWGi+z+GByhAvkoAoIoM0h3RdS+HoMhm7aU/HlA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(19092799006)(4143699003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261021121427099003)(261022105027099003)(261026140227099003)(261026121527099003)(261021123027099003)(10067099003)(18002099003)(22082099003)(261102123227099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BvYR3wa18voXu3VBSkXCOarxRGMWrtUrCk00rlOOwPhR5TAjWSlUtgVHMrKB?=
 =?us-ascii?Q?TMP4gJtlyWLzUd7W/GgpnHoJq37+Pac7LgsyBwnECpyNZRCZE+ibyuQdPH/K?=
 =?us-ascii?Q?myFrcEaM/nK60H3WEDQ4rDZILdraRKCvHS+k4KdBq1WTUBsQfSwFgYNFp8jU?=
 =?us-ascii?Q?227YgZTL8dy41ZuB0dawSVZ64sZM5QEdyN4ZvnCjfPm6Kh8Cc15Tze5I3unT?=
 =?us-ascii?Q?e3NINwrCR8YcnfO0CkePooGlVck+u8vHcUQT7MAoCfLttraAO1p7mBqx4GRW?=
 =?us-ascii?Q?6DkrrLBSAp3HilMBC4cWN7g30flZEb2XNHz0yc/PGYDkZUEBlvZ+etILS0Du?=
 =?us-ascii?Q?QrnmcAIFsPRdYCBzMDutZt8UvvDsawPVN7kWIAqdSiTXY8OPg55I+gtkt20k?=
 =?us-ascii?Q?pIpxef56c2qJ+0aT+nt1elBLU6zqSqH9FInbiYM26nFBWU6xf9dpJybvAC77?=
 =?us-ascii?Q?ecUZKWx7sKbzmx3xU7vImSRUMDegaPLMZCBUp2lSgYIECn7OcgKE3Xho8vyX?=
 =?us-ascii?Q?fpBkY+MCqRaQ/1Raxw8ur5yi4uof5J2xhkXB3wtrNl/BLW6aAPA7jHsw33/1?=
 =?us-ascii?Q?PsS9rwLv7L0dWUMc63weDuh5E1Fb4zNeYLVOVf5RdfYd03POLLCVWIpJsDjn?=
 =?us-ascii?Q?8lW9s5pnRLZWoGEd4JRam6R6nJbp1VnBa0FAn5WXO8cgrFn4oBVvl1Cf9OeM?=
 =?us-ascii?Q?RH6t7Seygekb77F6PtwFOIvktEkDwzYzdzmKznfVBmeh3t9DVjSSrNND0g9c?=
 =?us-ascii?Q?IsVO7lzm33D494iAbs32ffcqC2xmXb0I7kMqbtgNBBtIm/o4DZb5tcP/mFqf?=
 =?us-ascii?Q?INUY/Cp2joKN3HbY8SNfM7hRHxWmnMLsh5ZWoICVocNqvMk9PcB1NMRSmkSW?=
 =?us-ascii?Q?0XtRgKAptQicc0lVIR3AW424RGD7muYt6lqZBc2GWgavKihBo7V/V+hB3OiT?=
 =?us-ascii?Q?5cUnPCaMxp2na2NXWdIjPRRmHK3UMrkAmjYe2/9sApURYM1s5bvrgkjZ+Qgp?=
 =?us-ascii?Q?9SHOZZFgnHD85Aiz3jGGccDLSYx44OtqLrgEDCOO7Wz2eFMPxDmDaQ6pA3S/?=
 =?us-ascii?Q?mW+kWEuzTt0dmpQDQ3und7OpWdSF27577Y9qDpaB3fdHW1SgyDwFx4lV0jeZ?=
 =?us-ascii?Q?A3bjKnbY7hJuIYreJ/HOmO9WIlwvcS86dhplfXlgNmYr/C0Z2f2SrJLVEthz?=
 =?us-ascii?Q?3eGoP+THTNtIYlkplA6ZgS2twb9QUP1v7FY/cUq8lEG8SEixbaa1enC8okeT?=
 =?us-ascii?Q?4IYsUTDjQWwt3LX1fkBFRtGhxBVqaq4VKWAF/SpbNJuaOGo2yHkLNNyoxoyh?=
 =?us-ascii?Q?1QwzuFwTihidesBoEaU1xqwPci/9NL7omms6MS5Kd4hHdIHmLotMCAcmDP5F?=
 =?us-ascii?Q?UAbL7CVw4ih9E50lere2MdgHy0lDfeBpTnxstGpQZTzOz1YwdAArHfaYMFME?=
 =?us-ascii?Q?IoV9In27NTZs/QPy7NXSpZjEG/7Cw5gvuyUnNN8Z/wKTI9FCKHwyWnnhg1qa?=
 =?us-ascii?Q?111sb3rqTwFWM3wGsBO9qnuXCczaF5ZJZ7BHwnV6ekVIPNxVB7lQWYeA9+XZ?=
 =?us-ascii?Q?7MHeJ8q8w0iIRUPgPFUdr6SzGMq1mtg2Jmrsame64LRQeyAfpnzlBhFuFaRm?=
 =?us-ascii?Q?HObClz5TFYGHbiUhqnVpIjZ60y4V3YXtwuC3H3KSAkjITu3DV/oWwqXyCMao?=
 =?us-ascii?Q?tx0uTHIyZVgUdx5QUl8Vsy8WBTtzSYAzNQEy2ZD9SJhmB/UYjl3crQP0g/+U?=
 =?us-ascii?Q?NMnYhsTn+AG3Gm0SSPIjNGJDKmCmMXCjDhOzpmPemcsF4eKg6Yq1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f083b3-6f87-46b7-b04e-08df3927fad0
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 21:26:38.5105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1iAZo3pO8Abf+8U2IYXuT2BsarITf2J4GhQbN71uIE3qwUpmyovNbakkP/IVz6R8eMl4xke3/rwbGkOTNY4Bi7BVOxBikjZpQKbyMoJiN0izd7RHIBzs6GceRbuTSLRb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7680
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_132643_575374_57EA1589 
X-CRM114-Status: GOOD (  20.68  )
X-Spam-Score: -1.9 (-)
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

On Mon, Nov 02, 2026 at 01:48:51PM +0200, Abel Vesa wrote:
> When of_clk_parent_fill() does not fill in a parent name for every
> clock, imx_lpcg_parse_clks_from_dt() returns the number of clocks
> instead of an error code. The probe then falls back to the legacy
> binding as it does on any error, but a positive value is not what the
> function is meant to return on failure.
>
> Return -EINVAL instead, like the other parsing errors do.
>
> Fixes: d5f1e6a2bb61 ("clk: imx: imx8qxp-lpcg: add parsing clocks from device tree")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/clk/imx/clk-imx8qxp-lpcg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/imx/clk-imx8qxp-lpcg.c b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> index ae8cb5408246..4070e06f9c7d 100644
> --- a/drivers/clk/imx/clk-imx8qxp-lpcg.c
> +++ b/drivers/clk/imx/clk-imx8qxp-lpcg.c
> @@ -231,7 +231,7 @@ static int imx_lpcg_parse_clks_from_dt(struct platform_device *pdev,
>  	ret = of_clk_parent_fill(np, parent_names, count);
>  	if (ret != count) {
>  		dev_err(&pdev->dev, "failed to get clock parent names\n");
> -		return count;
> +		return -EINVAL;
>  	}
>
>  	ret = of_property_read_string_array(np, "clock-output-names",
>
> --
> 2.54.0
>
>


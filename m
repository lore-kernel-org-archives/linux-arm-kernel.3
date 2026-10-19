Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4546606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 20:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2scsjv6N;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=bEti7Ikc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQOtkPt5LVnBbxY3OHTrWfQoC0FIfbjInHxo5htkhzM=; b=2scsjv6N4567LWGWM5IiRX8wdR
	0UkhWj0wJ/wkCDrSj8j9/kp+Y2qcVEadaV/LVNhqLuWLMxK1hQbhrW5Tgrhf+M7RqFnvC8ynQ3PBh
	wyFah/FCtd7P0hhzi8qiS3GJ3MRYTc37u+2GcKXu3DuyPLYzLs7fOL6i1EkV7rRkWceiLogx3JjTv
	G89F6K+hgvWgUfWH8ZGHDJFX9RBGk7/pLfBF4RG/U/KlK7yGSy68aoXKbbWP/zu2lO0PvLjn2UMEq
	cDz3POqA2ySwxjIQed8Jw23e10T9bU3A8ILG1lxOYcTQNGDLVMNoGh3HRhbuIMeB0Q7+OQ3doRsAJ
	jYghpCRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIu86-00000008Jqw-07sp;
	Mon, 19 Oct 2026 20:38:46 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIu83-00000008JqI-25Zp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 20:38:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vC6zMh3Y1Et/HhPt+htMcXJtys5uh8fy3NgWadiXiy55vR/MuQY6MZSdzMDmY/XqaY8L+cbKgUFUTijMHIWeZ9gP5Kdj3yUUcX2zNCK2TSWr+CBapeV5HP98pWXqStak6Kbhjvh6ETWA2qyvdwffNKhju7wUh0pgcmQOrKf5UPME6174+Mh4krkqTkXd/2SI61p2gsRxsrQPfMQduAMMA9JEJvwIan1PVSNwTP3e2pv/JE1VaRZ1w+PNTGI1FqgLFmu6lsjpu7cidpOAWDIurJk5VP3IRhpLMUVnZpa3OcGiAD/kaLzJ+6ysjQtefjWZThVC51ftYcKz4VvmFyNGKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQOtkPt5LVnBbxY3OHTrWfQoC0FIfbjInHxo5htkhzM=;
 b=myR3aqUpnaZwcdronSr384B4Atju8ft11blabLCXd8PkWk+F6tfUx3EjBr+wFgOGP+GFsoIRQGRfmc7cru2rSnrg9bBUZMDkv2zxneXpim6zow08mSErQ2XVYHfRC7qHseml/yl3pyC2Tsht4Ypx8RViyIK3fQRFBSxeUekXPhu2lbZdOPBGIQwLV0Dp7O7S/VUhCynARRFCH1YWxbJrnWgu0CNh1+Z5L+PZv7xv6CT7+1ISPDYis0RrIF3867G3413ooJTvkhm3VZ+EmGmZGeR7IWgzjcY9ezkRQfMpCEXQUlDiZkhwB2HGCV1c3//eFe0RQUsk+lXXA48jDsr3GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQOtkPt5LVnBbxY3OHTrWfQoC0FIfbjInHxo5htkhzM=;
 b=bEti7Ikcezk7lz6mqMILxOWK3OBzgptQKL6DEadMfuugxve8LPGgs2E910GRBaro1TQXM41H+qB9MYzK4av929BIOHq6676bvssxDW704tZ7N0PdbbgH93p7KIUt0+ep22lvXlD6PRXcfTyf1MVmuG8UhvUWBLaa5d9J7foljMl29uM/mt3AbLRgmOwjYWtMigeoxnzfcY3bvl4dX9W0VSpz49gr6ZQaWYzkkveCVXNCQK4nTGcXIibv/1YgW6TwiF/SVDWGV//OK+4DnekOeqDJW1QGC4C7zGrj/wE3OOjuOlXj9K+2owASNJcTa+Ab4J3YpcV4CVBYMCnkY2j6Fw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MMZPR04MB387749.eurprd04.prod.outlook.com (2603:10a6:190:4f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 20:38:38 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 20:38:38 +0000
Date: Mon, 19 Oct 2026 15:38:27 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: peter.chen@kernel.org, pawell@cadence.com, rogerq@kernel.org,
	gregkh@linuxfoundation.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	balbi@kernel.org, linux-usb@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: Re: [PATCH] usb: cdns3: imx: fix kernel panic on remove due to kfree
 of static platform_data
Message-ID: <atZ_w13x6QgsMhwn@SMW015318>
References: <20261019084944.2051097-1-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019084944.2051097-1-xu.yang_2@oss.nxp.com>
X-ClientProxiedBy: PH5P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::9) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MMZPR04MB387749:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a09aafe-d7cc-41a5-4be8-08df2e20f447
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|19092799006|23010399003|1800799024|261009223027099003|56012099006|10067099003|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: mZFUktY1ju9RSiqCELbBLTff31PCWHil17zFg6AQa8Nf5EeQwa7ZvXyG00YGIpNr9wsueUDNm3MDpw7gx0h8MuviWnNQ5vE7IUQny6HM3HVTJy8XnxGqriWzids8T3isnv6Ucd5kDskXroILoBz9zH0SIjjJyt83x13Ge8tXoPvPJU0IklEUfak8XS4q3Z63xy8bgQTkQSX8USQ4NDHBxhDfRyCNPc7niRY2rPzf/BQhwWUWX8Ilnthv6IZnFuN8GCgBkvPBn0V7jCmQ+8BP2cCq+rS6YHYSwbrmrRKPXIzcJGq513nkG8GuwMftKH0SZLybKUjJf16eaRbptQLGtCKETIqNJX18YKywnA8zmi4rpdOWtJ1mun2LgGCqR8GR7jS8snyTxLLkXwBkf/lG7yJ8YhcFuJ8IJYXWYD0Ea3D2LLA8ibkcu4uKz/IjuWMCYBWz9Q840TciynybSTgoXmvl20LoCtC/hYf/94avEOPxbF2ahhyT1W2yZ0ls1r3gXl+Xq0VxF9u0/QTZjVXjKGbLwtYSgGEPsl2dIAmdf1gDbgJsJQFidyJQeMcvdI+bgibrD+lSpoWmfCRV/MULklpHgI2MWl9cBYbsJXcaYPTpJGTPUyCCfcZpsHhYUeXOKHW0kRrDRO4uTE3g5DOH2zOJ0ovhch4NPFen4L+SEhA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(23010399003)(1800799024)(261009223027099003)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TXfCjmnfhoEzCxFKBfjhiQSg6vPzhlLlOKPGgCZYJ+w91BvOr0NxFVTJIrLc?=
 =?us-ascii?Q?m2Sy42IB4Q+oh5laetDrMKTeg67GfLx5PNtOGerWTkSQWurFuyq5gHc+x9R2?=
 =?us-ascii?Q?uQyTBzvuZaZkH+WzEE9/rgOM7YEG7NcsPdgxyzmsoH5s2wuWc+BeppBXS1fv?=
 =?us-ascii?Q?Vgm0NITh/Mi0WHX799covvjz99Fhrc2KPvTYsK/5VkF4X09x04+8MfdmZG5o?=
 =?us-ascii?Q?QtKZbmUCwAMFs5NI7YheDQZLOf9SwZzkRe6R8ZMS3k9RF0hoOfVOAxDGDO0/?=
 =?us-ascii?Q?TiIjs5adZXACPgom3VSurg6EqrDItOLodL8D5ABOoxnhgoT3q4SlBCOEvqJL?=
 =?us-ascii?Q?7huCUxZJPH0DEMVIEZY5jH3DB3z2mJmquo8FVsKEYgLI0ZKqYxcoGIaC2Cbi?=
 =?us-ascii?Q?XnTu5OdnNxTNGoUkiOzXMVFVuko5Go0sVSvddzh8tg+CmNaKlcmT4xzyqPby?=
 =?us-ascii?Q?t7P4OjKZjg5Pq5f5A1TYL8C9PHOUy0qfNZmL0nQD+uVVeqBXwUoawGrM+6Qu?=
 =?us-ascii?Q?0af3/0ZwWQFFC8EMXyoO7xBd2wBxEwDVJ9iQ9KqY4Ks01+uBPMFralDv2Hmg?=
 =?us-ascii?Q?9/vpHF6hBRe1qGX704amzIaGY/nZNsvrFrnqF69dwmDlTziWiddrfSv15DZ5?=
 =?us-ascii?Q?AmuZynQBWSuWSIBoiW8+NsZQSIZwj3BVN0Mw3AsGX0f1EN9lKbkoSTZIsh5z?=
 =?us-ascii?Q?JkQi8YtX3lvxOOXuq6iUcsfnY4fqlfXr0XvRmJBdDPdRgnddAV6uVwe7RxDR?=
 =?us-ascii?Q?3Ypnu9Bd9bOSuariUc6pOi+Bd08872ZzwmbAa/krm5AR82rUXZBwsMaZ0iSG?=
 =?us-ascii?Q?aZdIrOhNOQHBvxPaFJ3zZv9wborroxgMnUK8leMUVAbJL4bVtZU8MN3hwP2t?=
 =?us-ascii?Q?Wvuku6guQWA4S9XFPpSqYOvJGAvXndyyg1UKLvOG7arvERWEWxW3PjQrvwM6?=
 =?us-ascii?Q?4O559Yi1iQ4kidQYpDHQEUsXZu8kxJNTjS/R7O3Fbr6M/6Y6RYd6fjaBtHJG?=
 =?us-ascii?Q?mp+MHIDm6HzsNiL3wfMeo8gEhbF4Vo7ExAMavSgvmiFXxGro856Vkq/iTvxl?=
 =?us-ascii?Q?TxMzWHPF1QINWSrOCJ2Q2Sma8SOYtIlF539Z1fyI3ZdYqwG0nlqQ0qDapWfI?=
 =?us-ascii?Q?Xzpvwn8LzwNgc5qml6cePUhrSv0grn6A9oPQ8/+cm5mLoU+zfIzAXOeKAxnT?=
 =?us-ascii?Q?gAPgmTQbtLZWP7+5D2GA34aTyl5dA02R8w/V5d9b21Yqq16tCR+z3T3qSMGp?=
 =?us-ascii?Q?s+CNZzyarZLnTUdN3sgEx0ekkAoKgUQUzkisRC+Sk8O13fxDB6y49R1VWmaQ?=
 =?us-ascii?Q?LaKM0fL2kYT6xQjCG/2bdkwaKElCE4Q8kY79xxizytDnZ/3+xy23blmlJ5eo?=
 =?us-ascii?Q?juoHX69+5J3rxF0+LeQTX/CGhkdMrgvjq8qNEhU5JAWZDIaiFdCWv9aRbv9p?=
 =?us-ascii?Q?11xMEwKwONDlLqD5AkvIDB0w/Q1Qcx8BsPSTWc36kdrU2f8P3MNIAJi5xLRx?=
 =?us-ascii?Q?pOAbRQKtKv5msHbYvuyLEeH5eoreDXrq1FynHfbFKXwVgD1SqMg5hdnr0OCl?=
 =?us-ascii?Q?yQ41oNIDX1x5P2WAR2y9e+nZxlfsO7fvo2byLDPX3ZGubwPJjzom2zZcStce?=
 =?us-ascii?Q?T1U4D2pDc5+UzXrMJTDVJpnR00sDZVVubGbXA50Bp3NxaWqmymmzFI+Mhi7e?=
 =?us-ascii?Q?SfohZUrBx6o02nGLX24pIxTrnPXos79zqJFqHHLGkQC8z9W2WCGwo9aR5wfV?=
 =?us-ascii?Q?B7c9kLNrax9eMFaa0HpzeHb7vt/SW9OzWF7pEtxmN3OkZXlOtAxY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a09aafe-d7cc-41a5-4be8-08df2e20f447
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 20:38:38.3633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L7bHSDUlAuVP4/MHzv+3biQ0I8TcqeMGPNnHFUI7ZoDxa/L3Soxk4h1nuti+UjdO6VqhGin676Nh1xUvOs1Y9ZBrQONklwlUbeO4DMeHsxsOL6kCdXfsHfhxdNkR8RDp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB387749
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_133843_537987_DEACF408 
X-CRM114-Status: GOOD (  21.34  )
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

On Mon, Oct 19, 2026 at 04:49:44PM +0800, Xu Yang wrote:
> From: Xu Yang <xu.yang_2@nxp.com>
>
> When cdns_imx_remove() calls of_platform_depopulate(), the child
> platform device is destroyed. platform_device_release() then calls
> kfree(pdev->dev.platform_data), but cdns3-imx assigns a pointer to
> a static global variable as platform_data, so kfree() on it triggers
> a kernel panic.
>
> [   56.809541] Call trace:
> [   56.811982]  kfree+0x44/0x398 (P)
> [   56.815300]  platform_device_release+0x24/0x4c
> [   56.819747]  device_release+0x3c/0xa0
> [   56.823413]  kobject_put+0xa0/0x120
> [   56.826906]  klist_children_put+0x18/0x28
> [   56.830920]  klist_prev+0xb4/0x1c0
> [   56.834325]  device_for_each_child_reverse+0x7c/0xc8
> [   56.839294]  of_platform_depopulate+0x34/0x80
> [   56.843664]  cdns_imx_remove+0x34/0xcc [cdns3_imx]
>
> Fix this by iterating over child devices and clearing platform_data
> to NULL before of_platform_depopulate() is called, preventing the
> invalid kfree().
>
> Fixes: ff6d6e6c6778 ("usb: cdns3: imx: add glue layer runtime pm implementation")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/usb/cdns3/cdns3-imx.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/usb/cdns3/cdns3-imx.c b/drivers/usb/cdns3/cdns3-imx.c
> index a2f041e1707c..2c86fadd2cf2 100644
> --- a/drivers/usb/cdns3/cdns3-imx.c
> +++ b/drivers/usb/cdns3/cdns3-imx.c
> @@ -218,12 +218,20 @@ static int cdns_imx_probe(struct platform_device *pdev)
>  	return ret;
>  }
>
> +static int cdns_imx_reset_pdata(struct device *dev, void *data)
> +{
> +	if (device_is_compatible(dev, "cdns,usb3"))
> +		dev->platform_data = NULL;
> +	return 0;
> +}
> +
>  static void cdns_imx_remove(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct cdns_imx *data = dev_get_drvdata(dev);
>
>  	pm_runtime_get_sync(dev);
> +	device_for_each_child(dev, NULL, cdns_imx_reset_pdata);
>  	of_platform_depopulate(dev);
>  	clk_bulk_disable_unprepare(data->num_clks, data->clks);
>  	pm_runtime_disable(dev);
> --
> 2.34.1
>
>


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A38606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 16:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xCbvJlau;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=UFbZk2Zg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JxVvs8kh07+rdyhURSwshuYnSrGrYd8ZDW1qDfaSLvc=; b=xCbvJlauja5YDJr3FCBvTfz1oW
	3viOiFFEB4L9SjFvn5TJvNgTZLrUDHl79OSeWfa/v+KxJJyk0br8yard8kYUljtjiEt/TkBuabfcC
	RQGMdFxh3275Q7kcyMuFMJ6F44kJcmroRhJSG0gUhFHZonkU5AnW+rw+YIgfcMG+wNWem3i3hZZeo
	GzFD3k8+IuklWT17Or2Jq6hVT/bPwPsDCU9KO4FR0V+LJJ25LDixlEN1jBQua493ZtjulcJnegf+r
	EtljDHzIWT1u0QmGV7oyVh4zUIboCyDVjSiYkIaqRIVVaO/SHDP/4rXbazMYEQh0qh+NCqTkqJrWS
	bUudjduw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvf2-0000000EUXt-37dt;
	Thu, 22 Oct 2026 16:29:00 +0000
Received: from mail-westeuropeazon11010043.outbound.protection.outlook.com ([52.101.69.43] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJvf0-0000000EUXO-1kM5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 16:28:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VAzfT/Tx6IR+Arh/O8m1os4QwhxQmfcyPDxcxucqbi4be9ZRdTAk4Ni579T4vxyNoVRG8OWUnGymRPfKVpJLOxXjRe4ZnnC0Pd1xpr7HHFyD2k+V5aecpJAPocOncaVFO0HlD286sStiwHZaYnhzSjZ9Kr8bHZ/D+r0Xis9/B3c+2hdsrGgcofVgKj2OHHBrL+k/VnBcWBRGptclC7piXkbBldGEnemeV2fR4deWEX1Z4vWgdFTUZFJ6z4pqx700dI7LtHPhERsdaWlBr2tPsyHBDJu1DPlCNjXFu9oxpZcvlRI2tpP7dOQH9HSzav7EbqE/Wxtb1DpKzkQ1FW/3AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JxVvs8kh07+rdyhURSwshuYnSrGrYd8ZDW1qDfaSLvc=;
 b=QPj2pA2PIUVEIBafIU30uQ4DhP28koaKhnLr4RmL+o8j3l8PGEM2poPOw++PTaWdjdkImZEU9QdB0W8undAqjCfHVWQmSFtZGHOL14IzyIld0gUDfGAVRIPUf5G/oiZdiLRiFc+EJKfrNivLzoHYob+jUj7TcPOPhcPnyxHrpMdGK33Vi8vFa9iwRbvwNaRF0yT7NROx1yfA4OiLA991WaU7eGe/RcPwHYJrRoWxlbwthx8QJTsmWo0CgRqskuwKF4R8rcdcpBucf8bat4J7bKM9VtmAI4GNgzjVbmDMXzdW/SHb4S2NzuIO0gQGI/y/8w8oE1a1VkSg8jxLGH4z+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JxVvs8kh07+rdyhURSwshuYnSrGrYd8ZDW1qDfaSLvc=;
 b=UFbZk2ZgzlwDS6QJiNowTePVrlYZ5sos2z4TzEtGFBDRkA1trda2VgP/q8rFB3s3aPUtKE/qZucp6fgX2Jh6f7vIsCmQIrys+mlQEV5feiGW3/cNiPL7m6hVsxMScz3uXZZsPNHUD1tntIH0Vq4yBKXEK0C46QIf/nvsu0klCEdKFhltkngOQh2o5z9HcJ8tO4q176Luh8sEFlUUY/N9lUZCUlCgXeaYNzSx+qEETrydQu3G535NlY+ajHev6vyb9rIF0AUmzUJzXf1zSqojmjmwT+liBrKxuLWWKNlZVextcamxJuzfmuDLMSboSaQQk+wAxZLoSUGmyA/e4HQUFA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM8PR04MB7348.eurprd04.prod.outlook.com (2603:10a6:20b:1db::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Thu, 22 Oct
 2026 16:28:53 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 16:28:53 +0000
Date: Thu, 22 Oct 2026 11:28:43 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: sun6i: use the channel pause enable bit
Message-ID: <ato5u_Ew-7E3Ll2G@SMW015318>
References: <20261021-submit-sun6i-dma-pause-bit-v1-v1-1-38d286b69dab@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021-submit-sun6i-dma-pause-bit-v1-v1-1-38d286b69dab@gmail.com>
X-ClientProxiedBy: DM6PR02CA0159.namprd02.prod.outlook.com
 (2603:10b6:5:332::26) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM8PR04MB7348:EE_
X-MS-Office365-Filtering-Correlation-Id: 933180d2-b79b-4fa5-c58f-08df30598fbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|376014|7416014|56012099006|11063799006|261021123027099003|261021121427099003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: OBGNeT7++iQI0Cn9SDIYIkxBx4qivhkWhnFSzT8cwY2IgGxcgq3WotTYbAfYCeNL+G5gB/vpz1Q9wUPdYK4Mr3yWd2jt1rI+8gm58wprNvi8NklW/oW0kpfTtTG9LU6ML8zIgIEw5iFSvAexaxaR52+khMU04TmKo/JiedE5fejSMtyv7JVauwJuny+0k4TJcOGjjMj/j6ybPzFY+hcrovUG9iYv/zOI1w/kTOuiMf0l260EAGG0rvgfa8MddIV5MFN2r5U2UmZXmH8nXtXjuXbOHtObWMUuHvQg4zWhGkKFl/HHMS84N+YN7uUOsMp+rGME6ZnVjWfX3xUwwFCG4MA2Aa3GvDgL5QT2vDbGq9lgpRzYUSM7s2vXKT/hA9w7h8/pciSYYP+RgrcFXwxAMyLY1ieOcSUS11ZlBFlfDaO5qb+lVWrv7TkCJkoVRLkOxlgK2rifMKZXR5gNoSwKwwmpSAi0a8hqJJB0SUbVXUFrxDhz+b4ebDpf2ijmwjQk6yZ9d8eysi8VlHR3x7rjq580F4jbppF84VLuT3Z6bHXk+qOiPVIhDzWCo928/K+lU/YRx8G9YqEr0jZpnikc9ewYknCjLtYSTCyqv9htq1yqRI3cNuBsU+Q7et0JLs25VYBHn4tpdA+BjVgqnggwnCKn0YI1IUmbrd55hiTmysE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(376014)(7416014)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g4FiVgUfK+Q6s979HPu/0Q7WXerWwpoYUKwM/eQREXAxv2suhgQf/ADwGw7M?=
 =?us-ascii?Q?LYrue7LfcAVXBiNawCzG0uXTv3w2fBundvABmwWuLfwp4l8kYTi8ngJeK69+?=
 =?us-ascii?Q?EcHJyW2WCj2wLXxzP2Zn+boU9VQUbqtF6Cp15G9XBw+ztfCN1Rw0fIMHHlOe?=
 =?us-ascii?Q?4XPdX0Lc318sEUqx/2sBi6/GHowiVe27K2EYkXYlTirWXD8OrZeBahxYzDrs?=
 =?us-ascii?Q?r15xL7RclwMO6fikpoAocst4IpcGw2Oz514NLsno87SvMP8az3o0OngvehfA?=
 =?us-ascii?Q?DtsARo+/7/IoYxHl/qNYIyT/3apJwaoSDVCoV2gIGrOYblCAl8+Ujsi4VgBO?=
 =?us-ascii?Q?etLTzpKjAYexR7TOipyji3ubm/rvqnZsCK1tXOGPc2p+OeviGjifaD6rW63E?=
 =?us-ascii?Q?eoMu0J7J2XBaUBUQuyEEoc6XuwOFeudNTWbBB2iN+mDRb8Abxy3IZ4BlnbCY?=
 =?us-ascii?Q?7hOtILu/YjVTOdAsHct3z9m0NG+J36oghxKsE3rZwwIhAe0lLUJ0HcqCJPh3?=
 =?us-ascii?Q?EVT+DZHHrshtFCEpEhssiMg1DqckjY0OzGeTaRXgxCmO6f1LViPJ3tRsqiHm?=
 =?us-ascii?Q?l1qVRq+9FGKlDoTuR6J6LSd5qOh8Qovd52i07GWwaHNiXHhG43hBcYSJk7Vq?=
 =?us-ascii?Q?SSefO9YjauIWhbUQZvUyfO3hQlRVVzG83eESKhd8YxpzLOEEOCUCdGPaFEUr?=
 =?us-ascii?Q?qb4g46ceCJEQyTPfVQylpHa2IDHuHrPObqu7iLDfldMIWH4C6rFw8BMv2/DF?=
 =?us-ascii?Q?kmAeDYTWaB+ZDOdygISrvFbV/34/g1MGRrtsbL/iE9Z9cETK1FXNV9RDaRkj?=
 =?us-ascii?Q?8lyYASWEgqDX9E2JGciIXSP/vdp7RfI6hEyOLOzOnJmmFCgn4TlvLLhyksO8?=
 =?us-ascii?Q?XwCFmQrT8atjuiUPEidB6K4KTlwmLz7MnO2FHIb7BpoRTJ3C2M9rd+hZeH3k?=
 =?us-ascii?Q?1XSDDQZD3KG72RjebLMjk7h5Ux4ve6hP1Vz1g3xQZPrrjuQoU/yr1dr7R997?=
 =?us-ascii?Q?IEE6N4LolZZBOCQEUpDoHmp2nG/G8cD+DMkzL8vqAwYI3CamxwxyHPoiDdvR?=
 =?us-ascii?Q?UveIW0DbUXHx7cTUT+dI9ASSAxhjGEgZzZZV7NKxb8hWatU175MtfZ8MrtqN?=
 =?us-ascii?Q?PjyferrLS/aVQ0I3U3t8PEG96kwAISmxTHJqwFogf9KK4JGYUcM7qXCj5WwO?=
 =?us-ascii?Q?2ZNb23yQonPTuC8N66ZNJPMFYNUTtKBIGnuCSi3QQ0Vq2KO2uH8oAEZ/Jf7f?=
 =?us-ascii?Q?oCjVfKbqfpKKILmL1xEMHiSZA+4XamtnsVkr24uhQp7WkRlnEGFn4SJmC14x?=
 =?us-ascii?Q?pOSBMhU1JfBUWXqz3ROxCGlkO0gJTMKnGWlVtddK1td1uz1111PGSrfOrW46?=
 =?us-ascii?Q?aXRkM2aCcM8W71B+n8KVqqMu7C+dz1nTk/30Wh0jQ/yv69mZ/ObLl/SVmvL+?=
 =?us-ascii?Q?3Edw+7n8aSzn1z3KXTFm41v8T8b1LbMIUXs45tD6dJykEJSqn/XNe1V4dXOc?=
 =?us-ascii?Q?JkYuIUMh5fXvoYdb13XUwk1usbvXar1YY9SqfzUeC0boc45WWXFP1nB6rWIX?=
 =?us-ascii?Q?CBza7Ap6x4dU6Cqlsac7l2sLDsLSJQQkIugBzUIlvZU7twnkV2IHosV2zLPN?=
 =?us-ascii?Q?CAsG6YPcYrDoIeqgLzeGHJ3oFkI/Gldy+7t3NBzZElboy2YDnjXpywPr6i+A?=
 =?us-ascii?Q?pyaFtR4dY7ibKRcetv5Gy+9gqqFgBJUm8Su4GhSD2eyltnPTEWPw6gRxYcwk?=
 =?us-ascii?Q?dVxO9I7xq0sCyw28eEZqzV6nJPVDy0ccOy0ns3p2RQOS+z4ZnK+w?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 933180d2-b79b-4fa5-c58f-08df30598fbb
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 16:28:53.3420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BXtB7kCQsuI5BB0B64XJNIk2KY5govDEG+WYh2Eg9+3q6FDXHtaMbNy2Bu97Rqr+N/mpFfB6B1+NBPgYTxXtzv9Qx4SE3gNzWT4h7OWfSatkK+pIjMVY3dbOt7ktixfU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7348
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_092858_454657_52F6EDED 
X-CRM114-Status: GOOD (  20.51  )
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

On Wed, Oct 21, 2026 at 03:02:13PM -0600, James Hilliard wrote:
> The channel pause register uses bit 0 to suspend DMA requests. Bit 1 is
> reserved, but sun6i_dma_pause() writes only that bit and returns success.
> An active peripheral transfer can therefore continue while its client
> expects it to be paused, for example while the 8250 driver reads RX
> residue and copies a partially filled receive buffer.
>
> Use bit 0, as specified by the H616 DMA channel pause register.
> This fixes the pause request itself; it does not add paused-state
> reporting or change the handling of transactions already on the bus.
>
> Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/sun6i-dma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index 7704b016aed8..204b0b812431 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -60,7 +60,7 @@
>  #define DMA_CHAN_ENABLE_STOP		0
>
>  #define DMA_CHAN_PAUSE		0x04
> -#define DMA_CHAN_PAUSE_PAUSE		BIT(1)
> +#define DMA_CHAN_PAUSE_PAUSE		BIT(0)
>  #define DMA_CHAN_PAUSE_RESUME		0
>
>  #define DMA_CHAN_LLI_ADDR	0x08
>
> ---
> base-commit: 93f51579e7df248780214094418f205253383cc5
> change-id: 20261021-submit-sun6i-dma-pause-bit-v1-618c1c3877d8
>
> Best regards,
> --
> James Hilliard <james.hilliard1@gmail.com>
>


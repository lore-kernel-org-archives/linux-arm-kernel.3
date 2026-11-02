Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86AA7606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 21:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z16RgGZk;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=LoULCwFV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dQPgNcDoxS9Z4Z5D/eK1EpXXJaDQQ1NiLuBBqBfRQS8=; b=z16RgGZkE7llWbjYddIbHDldm2
	+uEQIxQ9vwttOoua+omLtjATtMcvTKZ9ALZQUMAul0mwUAWRqoR/OLMIxcyGz8sJ+69m1FXzCccA4
	u6A1XzIPsVYR2LCqW5KJLyYJpHRki44KIts4AGUdiEULyEVQKrWjG1gIIXLZPil6Yo3pdQp/H6R3A
	uiwMXrCUSMNbgzRCaFzG7X8/zeXPmAm4WZnip6KGXSQm3IY4ubsqjZpftSwgqQs055q0hs0aFvmRC
	DVUCQ0BcKuR1On64pil4WqkcZ15E85PGAYPCnJTd/vGP8tpRn60w5DeCdoOdd6gFHU3/4naduA/L/
	mcqOIQow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzLk-00000000Rdd-3CWk;
	Mon, 02 Nov 2026 21:13:52 +0000
Received: from mail-westeuropeazon11013026.outbound.protection.outlook.com ([52.101.72.26] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNzLh-00000000RdF-1Xjg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 21:13:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jpp5z5cwFFw8BNMJHbCSL2zT2STrR3mR5IOSzgqnJLF6pWrrwun6V8Ho0bvpEkM7SFpv3XezD6WO5xHmAzr61Hb6Hf79bU4TMgFmE31Rq6oba1B8L7txhIfFtLG7L+2fqgrCSCGx+t39fUwi5fpxWnoTYYYJlySU+e8q4DrWyFriqFhW1dU1uRcZhcJewvabp4fBhD50CH0/O111MX6EE0wcNv9DzytJnnu8G6vntFckcek30n+DAK5PbxAQDNXusVcf8SMPM4HL0+8hZJ6IZRXGOZ13wE2WMJ41UJF+MRERz2r4Sq/RteNx8WUP0/jTysEvupzifGJH4Pip8rnonw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQPgNcDoxS9Z4Z5D/eK1EpXXJaDQQ1NiLuBBqBfRQS8=;
 b=T/inmwxKF/5gCCxx6Ah3Tg8XJ4gWBjhO4TVQAQc+cIKeKz8IJ4WuRx5nzSX9GasBfJTgdXgJsdhGUatnRYhPcXwrSnJN6y+BPRaqE4rLxkn3JPkbZQ1llMSY8Q3VWENYWUM7ddY4C0IgPlnPMbvt9K2SKkc5ZzR56iyf/q34lC+wAMkz+oYKDoyqjTG++nEgiAOZWuYaMfNWujNJ7uov7gbx8vU8dKZCPcqJ6aZ/dO4fWR4hIMwdLAm451hmFi2ekZNq30iAc+zpcI8pSWYcYgvM4Vkfj5MCcMUbBcgtCWEEbYDS5b6dpklGaeBma99FDfU3u8zG06VbOX90QNOppg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dQPgNcDoxS9Z4Z5D/eK1EpXXJaDQQ1NiLuBBqBfRQS8=;
 b=LoULCwFVtBcGbzjCE6OktoMeGb1gEq8hcGLvv5TZ41N4ftKk3XPNpqbLWg+22sM5ApC+1gHpVXuiUqhevB+abl8L6f6kqvrtz0IRCraGXGYA8rcxdpyWAWk58Qp/fkxp7z18NDfJFUWHAumynEFNJQX0KS1npGVQ/XU+32f6v9sQAZNGYk9TaTJZiUexXpV/SuzFFVFN4s1PJgFv8R8sH9ARU7s16FDbUzZJvzZJ9bSNenS3eNZ2OGFJ9sdRF4kVofjXIqGMarBoZ2uOupPjDVKS7m70MlBITiqhcuLLnJrWP6AfN63k8oBJxRC86Xx8zPmY0S+471T49NZEWdeaSQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU4PR04MB10316.eurprd04.prod.outlook.com (2603:10a6:10:567::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 21:13:45 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 21:13:45 +0000
Date: Mon, 2 Nov 2026 15:13:38 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: =?iso-8859-1?Q?Am=E9lie?= Delaunay <amelie.delaunay@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: stm32-mdma: Fix runtime PM reference leak in
 pm_suspend
Message-ID: <auj9Ao7t68nbn8_0@SMW015318>
References: <20261102104432.873-1-laixiangwu@cmss.chinamobile.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102104432.873-1-laixiangwu@cmss.chinamobile.com>
X-ClientProxiedBy: DS7P220CA0094.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:25a::14) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU4PR04MB10316:EE_
X-MS-Office365-Filtering-Correlation-Id: 6432f536-f675-4cd3-3388-08df39262e30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|19092799006|261102123227099003|56012099006|261021121427099003|261022105027099003|11063799006|261028144727099003|261009223027099003|261026140227099003|261026121527099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: pCPx/NBX7S6oFl8T2ZKo+ZxD+Pm0MJJhYZOX5EtuDYK/nY/ExsxA6AaE+dny/9YuTeZMwEZw3zFOXIH6IFgNM/cid2ZZm9EAmo60IH4R2VSscY/5YljgOQXrKXeSxIoaXbFTfu86xtRM6KG41eO9Nr8qax3tSrZ26qJa/TskfIbXf1v0pIpC8snvrABqWjMmijV/Z3qJFA6l1zgeWa10nld9bk6iIqBZchdGp84mp3kKgmRF0MdIfhZTQ3JUaJE84XE/KgCk146opwKRlJWOERVDWGUF71GbYdXd945HvTpz8/aiDvnETqTvwbp46lOTORnrKA1XR4jXKzAc9kw2HkIsrl3UjVmPWVziefsWMWypZISummD4JxRIQXfmhxoRLsxxj8hFq3b+MkQ41N8kfv4/slrG59PX+JriQoGruNujETxr47ck9KPwb4xDXb9cBempzwGD8XOEqWRQok4oFpqaHtCi3siLaSaL/olBB6r70mjHs0IP+RsxgpvbjQdSi0ra5WPsoeDN9uVesVrDEyh73YyyhutPoCgvtf+UY2Ce+76WoHzJhjeTCm1FahloYist/Zc+aX6Qvy+GkFhlVVzxngVEk9YTMCxkKB+4rHY/Oevr3eQliYjze5HaN44JieFeUgK4hvESLZqiu3Ynv4EXU3jER1o/LIAn+mgaMeU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(19092799006)(261102123227099003)(56012099006)(261021121427099003)(261022105027099003)(11063799006)(261028144727099003)(261009223027099003)(261026140227099003)(261026121527099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jqj620lkCPB1uqEJP9brZw1elxVti/ixYufw7Pux3BT0PbWffN474sAuSWwI?=
 =?us-ascii?Q?QwNNb/FSi7eQELFXZlasaiW5XmodmhXk0Wgoy5tPTmlg+tunedzNmntjNzOr?=
 =?us-ascii?Q?Qf6EeWQIokB/wcku36wmmi80qpgKTrhTE3tDwbefidcaCY0CL3gnP+ia2zt4?=
 =?us-ascii?Q?Ukg5+sImGSR3MEulgx4CK8IH8+VkwhxL1Fc8lIi6yyGPmOBDRU3ufTLcOh81?=
 =?us-ascii?Q?0nM9nUvBsFtLRj4zURCtdQK36QtSOPSQXqOqHr3R+gWttsvknOQYndYzuXyo?=
 =?us-ascii?Q?RAIDKX6r0P3/43HKYDhIFNQzpiyOPmTayW3tbJefppSSgAc84PY5O36YJPxL?=
 =?us-ascii?Q?QwUFuL07wgvIoftkiiichFnH7LBZJCxl1uBoU8LmCiUBQb+NyEzxy8CdeEpy?=
 =?us-ascii?Q?mxVY9pVXTAvOrQn+qiP8VGNLfY8dbQH0JSwJ5kJp67lmyfymdfbVQkoTv61H?=
 =?us-ascii?Q?nR8Vo0mgVrwAg/DLPsLQTjGFsUxpsuHi9e0dw+UndokQ+9ecw2KK/pxTv7zk?=
 =?us-ascii?Q?Rzp5eF5+I1xDJIrf8zLKvsZbZNsULWOAVmgEeFg6V5yF8wvG2PzylwQ9jgB7?=
 =?us-ascii?Q?PWESebJiCcGZrxzHwscN9YDlnrjO0onijekYqnpRt/vw/FHGSgmmdT4zn24V?=
 =?us-ascii?Q?W49EWa2Y6AkjmCLSW/XYFFcYcpf/acVf6xXc+bbx/hL026hOmZjkhUls3wZS?=
 =?us-ascii?Q?XmdW+3/y6DvTGok4HR1i2daEW9C6O1+05bYW2EoAhbxN/aB1Cg0/jU9EgCVj?=
 =?us-ascii?Q?vxjJ1F5In16IprTSNsEyt3ek4j0mYzBdcEfdMlvlrrQuOv17S8FjSAfC/M14?=
 =?us-ascii?Q?EheglFWSk2u+FE7xqPB+/UL8ja/BdCjgpBwP87GZ7Uj9laXWCs5t3ydfnYUe?=
 =?us-ascii?Q?qjp0e1KQ46Y8gewHOneZTHFrXssM8Eidd4hezp8f/tMOdYaYoT695NCklrhz?=
 =?us-ascii?Q?u1fyXkRV7Ekwm7ePJ9WDjdwrvf4koMdsZiw2SEL/8oUApnnkgZDTO5vUot4P?=
 =?us-ascii?Q?yDKJfpqqfEMZ9LwPb0fCK00oMfRKiR3S+ZVrevJj/5Bxa1D2toS4v5sarBwq?=
 =?us-ascii?Q?8qHYkrLmVv9gfTozmyXvsmg+m9o7u6UeV08dFqqtxWxRFriF3z1gCdx7brxa?=
 =?us-ascii?Q?EbpyLnClalTQIimzTomuupYiHewVPZmF5GkGQE6VDWedjZtNdbzG1YCIvn6E?=
 =?us-ascii?Q?kX81uSgDS/MythZhXUcztyrpNwKx10ys36+0Fnwf6CjEWm5I7YfMmC4W54nZ?=
 =?us-ascii?Q?Y3jUNZMrJCIoIS0scoZ+COnBfV493kbUWH2n+KOdPBGqWSUZlQLWJA5MMnM+?=
 =?us-ascii?Q?c75XyaeYW7GJOocGQ4GyUfOQaUSUNgI+WHb2UyCTvlO/MUfFm8RMsbNYZWmL?=
 =?us-ascii?Q?6FOZLXXqOqPPgA1q3vdNFepqIyvANMR1mgeFx/UepQfPv0ySoPD7kRV+MAeJ?=
 =?us-ascii?Q?mcKkWQufkSA5BbUM9Ao+f43DSFVtWnFFaVXtUwXow/SHUkIGCKUIWiA4hLg4?=
 =?us-ascii?Q?ZrXsyo0y3Hh9GGx5hne1qQe2KYjPeVDa1OG+yvautmkHpL2JWu9nPn2/LvbR?=
 =?us-ascii?Q?MmPC/uBLfAke86dyxcbOcHrhGqDVF3NyPfbe9yZfHm4ROuJ2iX+jsSJMQJyl?=
 =?us-ascii?Q?0a5G62QjVq1HyfUZHnSwsdSV7EhXuOsy47VBiTNkdDAhaZ/LFXIcQziKxGTO?=
 =?us-ascii?Q?73LQYJaE+UhL0gzrZ9exZFuIxxx3kIwT/WdZTJEoCYnV5H5pEOwa0e/4JDLW?=
 =?us-ascii?Q?loT8aYRz+nT85gpgRYfqQcce+oT/Lc+5GE38XptIqhPPxapa8mc/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6432f536-f675-4cd3-3388-08df39262e30
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 21:13:45.8042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xlzlOSZtPkJKtevXSti8fdIGaM95EiDXiXxUa2XjKHzlAnpMWR33DvzaXLkYLY5lbPK76m4cDp/SR8LAgoPsxb2W4ujCSJADzDIpzDS/X9VlqCqzYndzLtvqK5V5empD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10316
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_131349_415216_72E13ABD 
X-CRM114-Status: GOOD (  18.17  )
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

On Mon, Nov 02, 2026 at 06:44:31PM +0800, Xiangwu Lai wrote:
> [You don't often get email from laixiangwu@cmss.chinamobile.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> stm32_mdma_pm_suspend() increments the runtime PM usage counter with
> pm_runtime_resume_and_get(), but when a channel is still enabled it
> returns -EBUSY directly without dropping the reference.  The matching
> pm_runtime_put_sync() only runs on the success path.
>
> Each failed suspend attempt therefore leaks one runtime PM reference,
> so the device can never runtime suspend afterwards.  Drop the
> reference before returning -EBUSY.
>
> Fixes: 7cb819c856d9 ("dmaengine: stm32-mdma: add suspend/resume power management support")
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/dma/stm32/stm32-mdma.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/dma/stm32/stm32-mdma.c b/drivers/dma/stm32/stm32-mdma.c
> index e3bbdc9ee..fe1ff4a00 100644
> --- a/drivers/dma/stm32/stm32-mdma.c
> +++ b/drivers/dma/stm32/stm32-mdma.c
> @@ -1785,6 +1785,7 @@ static int stm32_mdma_pm_suspend(struct device *dev)
>                 ccr = stm32_mdma_read(dmadev, STM32_MDMA_CCR(id));
>                 if (ccr & STM32_MDMA_CCR_EN) {
>                         dev_warn(dev, "Suspend is prevented by Chan %i\n", id);
> +                       pm_runtime_put_sync(dev);
>                         return -EBUSY;
>                 }
>         }
>
>
>


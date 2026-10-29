Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A29606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 14:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V4+HF67p;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=mVVa6jeH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/QHaDs7Q5t+bitdkBOuYQyUw8KWjtToeayq+3mLSQwQ=; b=V4+HF67p+KiJYPbh55uoT2s1V9
	oPy/qMpu/9+UOwZcCdJ48sJqrb8vF8DNtpjuFmYYhuSrK/zALs7fcorSW7oTQNe/PgjzYpS63SGxh
	UUEzwEargr59IQWofIcVwRJ5UAzSMpBdFG/F76lkFbbX/FS2TTLp8L5PR56e+IK5u7tlhXYSAwZC8
	+YBUzVPsV39lqNsC6CGDJLFoPVBsCj3d7uxfL+IGVuYzJ9eZosXhfYw4Fb5r+zUxmW0SgVuN/M+1D
	0Az5GCOex/812VAe5JhUBpHjzng2LcD5ZkRtnHV3rspX/yk6RJvR4qVehST28jk1UB55EVd8B6XcC
	i7SQ1qxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMRTT-00000009a5R-0iDX;
	Thu, 29 Oct 2026 14:51:27 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMRTQ-00000009a3U-1O4S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 14:51:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GelqPDotqsy6diaVM3ZtIqFAAkvDCMwGGlCe40f0k5iM2H8bndF9iSOXQYnBo+gj8XSyjZ2QBHSS3e/HEhx3NW4otTdRlIGYKPnGBDu11fvunDcFqjSsXzb5sAflcbyFtO4meZxK7omtWJ0xu45BOIWtStSk3XZYGNnEvXQyApSSFUJPR7u+39Kd/D1xHrasbLAZpHc984o0tuzeDICrWX4xhUzzWDRwdwrNXawKcoheIBfARa8FGWkpCYSIWX8EvWyOENNWz2CHXIXOtq+NG+2FKtvZC5muU2Nwv/BUZf8VWi50TfO+DbwBQNg1nh6ISUfUBrjH41k47Plr+f2UCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/QHaDs7Q5t+bitdkBOuYQyUw8KWjtToeayq+3mLSQwQ=;
 b=ExyqgUzZm0JvQRiLL/srsQRuJ7Kot6yXj1kJRP7IwmcOcHhYaZzQE0yQlu+P+ByNzaPQu99UbD1SrsZraxt9zWUdVKJWbGSLQ1q9/jL/bZJYyjFMLWt7FQcADQBVr7uBysXKHuXCBAkBPUaekRZUEWmqFBvtL6kNTqxfr9iQjyL9/Rv6f7jylR3vkPv+Q158//HrctnII19su/4Ro1uOEimpqlesV0EqlGTsDsRnb5BnHEY+ikN8aMyfaKnZI04Uvl/vB44AFFqyx0MsHYIRZnfEhxNF2rQ04Zl2xSyHGJ/7KungSGu2cewo52U/SXi2H2lRauMZFp0EB/pxUj8QYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/QHaDs7Q5t+bitdkBOuYQyUw8KWjtToeayq+3mLSQwQ=;
 b=mVVa6jeH5jC3GE9zP3D6AUVsuMUOhX2pePfKfaMcfLQa/cKHXPBIbjr/8I5TzPm7zuYTb1/hzC7SXOZyJrlGCJUqPtb6RyuR7P5O6LLB8Ert88genSTf02MEj+hF2WD6chFJLFNl4lZQjr4rLIYqugarX3avrSdh/Zzze2sMBgKFGBpY6g0NRVuckUNzO1HKnGveU3+/dxx/e+LUNuYXzJaqSOad8k+y4JtPTfu7zBn51LfOQGvoOAoPrw251grcFmkR3zD+rUYu7fUfScWDkeZeBV6BD9LpezE/dFxSQdCkajapV9LAfwyQJWNM3fyAKe15X+RSsCCQCc+1+szvMQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB8331.eurprd04.prod.outlook.com (2603:10a6:10:244::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 14:51:19 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 14:51:17 +0000
Date: Thu, 29 Oct 2026 09:51:07 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 05/11] gpio: vf610: drop unneeded header
Message-ID: <auNdW37j4fd8s7kX@SMW015318>
References: <20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com>
 <20261029-gpio-vf610-fixes-v1-5-45b484b4c434@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-gpio-vf610-fixes-v1-5-45b484b4c434@nxp.com>
X-ClientProxiedBy: DS7P221CA0031.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:8:25e::14) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB8331:EE_
X-MS-Office365-Filtering-Correlation-Id: f4c45d99-76c3-49fb-abea-08df35cc1678
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|23010399003|6133799003|18002099003|22082099003|11063799006|56012099006|4143699003|261021123027099003|261021121427099003|10067099003|261026121527099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: yrInHPjikwdrOJRIE5j247HZUCi++Oo7xsf1u3ekMU48m86qKpv58DuNl4D+lI25Jh3LRQ4ZVefA+ZPspny6sMdJdyBTrW04uOMe3S9MGonBMaoVPRRzWAR05K7Ups6tCBqO9YRMAKpoBm/R87BggDBykn0+q5u56IqIgycuQ6BgB2ZnuLWvAuvF74YGgHpo2kyUGxsA1vsq3eLQRwKvcPabyWJMC6Jre3E3nC7sM19vREtmcaVulX0h+9oVZIVzi3XBAcg6TQCupH1ewrSfwe6p0fH1vkOjJihkxYPXDlGIsvF51uKsauIaASWnZxMnhHWRigghL5wxSLuunH4eaUhycpv3VXJ0KoMoBF4fosAC3wumMWfch/WD4QeJnxuCigBGVbqxK3cSyDEB3ElDWHw3bFZuJRsmZ2E1N/jnrh341vj0b7Kmc34paqXV7WHz8rgFyl/BJGfW/6Dse6tBZ03SRSNo0motLVOGIiTsjr7Q5+mzX9SjbGVvrqWGLe7o6sX/97K/6Q1sSVlJNFNkgadF/3o880HZUSI7l8zOztz7xqxhdween1bxUBl4eWx8Atzv4jWDlPIt4RMjna7nIC8fTwhDpf5ycaj8qVc5N8MQzgz64X3q8HTMmQqdYkCnSe2dCzIoHkXHabj9tY/PrB30st5K3O5atMiIyTmct1k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(261021123027099003)(261021121427099003)(10067099003)(261026121527099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yuNa9UgkZ5LHCzlsYD+ObQPajdplLoc6AmD4VHp1bjPc/eymx8NJ+ceeCyZd?=
 =?us-ascii?Q?78Wgjh5a3uxcLU0y9rg46TWLYTdSxoNDMyDf7N5yKpjzQKnMUV9cX2pBWqSz?=
 =?us-ascii?Q?wdTFgtz1VJpjhZZRbfClhdnCo5RKVZmb7wrxxEll32fCsimsu7/VenqDvRGv?=
 =?us-ascii?Q?a03UhSuo+lIaj9f5Z2DxEM+nVHBMRSRQ++XnYbrWgj+IszZ4iTM+IDGqGMRH?=
 =?us-ascii?Q?SzjHimr6Z2GRivASsiBfv+Tx7o5JqlyA21pixB4fsu9+2RakOlxjKH5C/asm?=
 =?us-ascii?Q?B0ezuVlXTi0k6ffBR0OWA5DCZ2ty/tVazvNBONLeoyzHSXg/FWB6RzWutv6L?=
 =?us-ascii?Q?VmZdTQ4bl94S7DUBYyAUSWS0N+2cR36WkU3kpu1uQ6khNdrPyDBZwALhqKot?=
 =?us-ascii?Q?ngKqZZ2CyNPYzu7YQIFdjRiKD4uj3S1QflhmX/NLnlHPNdnLFfIZOh0Hm5Gu?=
 =?us-ascii?Q?eqg6ge57UwJL+EmLtLZc8rQKYhYSH2brjN5sWzxBmk19mbQqvtztEXe3FGdf?=
 =?us-ascii?Q?kCCBABEdo+0RGWrQxQl0GMFNRxc76m8OcNI/cZPQT0oeNCDVhf3tJ1P1Eft2?=
 =?us-ascii?Q?dTY+LJDUbfC5ZK2STQAl4fijjwLUiCKjSAao0To9tF4ByM3yqEQsZovONDH3?=
 =?us-ascii?Q?DU964KJMoqHSVr2CAUolK8ZXyYHNfy0+qq9LESeqD+Ql8UVuGBCaoQzNy+zV?=
 =?us-ascii?Q?T/+wSgL+Vw14mq4BeoSiJm1mLFvO+z+2ZNGlXGE91E49lisT1VDdqApdaryA?=
 =?us-ascii?Q?t3w0yvIl7u49h2Rz3hysjMCsobOc86Ryozj/2pLQEdSraaQbEJ30UWUnVgfg?=
 =?us-ascii?Q?FkGst55wC6Nyf3DVWIcj0rXmnyBmxGb4Eth3FDv1z1qCEBAy2Pyv0eCynMzR?=
 =?us-ascii?Q?DVfFgTaZtc8My1kx4qeeoRCMHGddudapBgyvK0aLhi//TbZsf7xrOjbRgToY?=
 =?us-ascii?Q?9zJlJIuzhuxNHMYzRJ6N5xCk/Z0CBDc+PptsOEz59DBh3fPyGmhOh+A13vpp?=
 =?us-ascii?Q?AMjNTSDmxVRJU5xu68Xtzp2h5AzV8iw1MpVJM+GA55Vjx3U0aLgSv5ImSWas?=
 =?us-ascii?Q?zBewBvmRc7FqyRPVNoNNb+P579NNC4qw++x/AS2kReYRfHh6KcH6SB+uAP4Q?=
 =?us-ascii?Q?Lxqr0QLqGf4ZBW6NC1IkRS+EZ/KdH5SJajZHPuywQUMwhPMr6eDRFFwduX82?=
 =?us-ascii?Q?0DzcxlQCKW5IyrzSbt5DrtaMfsYth0TQFSLtHhrvGxCfDzhN9PFcxKBRly/V?=
 =?us-ascii?Q?Tb3sBMbKpjJfZPgIdlBFMerGmh0hCtKfe3UFJqwCL+ofpAj/Q3DLwjYJmYCH?=
 =?us-ascii?Q?4oXALfBCW+rEHy2ilsnjrW68j2Q9R8q96FQV+biDCUl8zoQQSkau42XbVhPm?=
 =?us-ascii?Q?Tanhc8DrAf7gQ9g53zeu/cyMOm0Kx0tt8ZXlv55/E5o/KkVDJON2K+Hy4IXN?=
 =?us-ascii?Q?C+5VKChoyCT3l9qZl46k8T2SeyAVpglFHWt0BqEf1GvD11E3sgyG9yYxkHst?=
 =?us-ascii?Q?JLXy/2/vhfantxSbzR9ZeMkmssUvkjIEE8IHL1Ig0P3UDPf2/of8Z29dP2qT?=
 =?us-ascii?Q?0XI46MSthcMB0amWXqBjexYVCOvIUQgKLRvCUJlu9XfO9iSH3pBG/iJXpBl/?=
 =?us-ascii?Q?X0s/wJuOJSONrVAPTXF8wi1U/FYT9rPzTg57PsmDvhW+ccz5vIivG7h6yVHS?=
 =?us-ascii?Q?YgDAgU+xVIaXASxi7csh+mH9HQDfHbh8mAuBBB6eN9rNGTkibdXSxrpQ2FaN?=
 =?us-ascii?Q?rrDi+SpJB91Ohcdg9BQzw+hHLr3hklMx9DMh+6aA1BaTaKzjB309?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c45d99-76c3-49fb-abea-08df35cc1678
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 14:51:17.8340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zBUQ0brFRTyRTib9gVNjIKpIARuDr5Z47Nl8mRgmlC6K/gKTBnTyHtK5LRRAiPSRu31fjy4Y4Hhlu3BbNYJoqsaEPftHCCgwIYucQyvosg8l5YuXUgZDWu4fUx/6iHMc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8331
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_075124_488278_2F963DF8 
X-CRM114-Status: GOOD (  13.31  )
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

On Thu, Oct 29, 2026 at 09:42:29PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Remove the unused pinctrl consumer header since the driver doesn't use
> any pinctrl consumer functions.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/gpio/gpio-vf610.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
> index fda3633ee2b3..4c46342bc66c 100644
> --- a/drivers/gpio/gpio-vf610.c
> +++ b/drivers/gpio/gpio-vf610.c
> @@ -16,7 +16,6 @@
>  #include <linux/io.h>
>  #include <linux/ioport.h>
>  #include <linux/irq.h>
> -#include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
>
>
> --
> 2.51.0
>
>


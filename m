Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE91606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 14:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TEBEFnF5;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=OBphp18/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Pq6s+u2TlIWtZL+DDokegL/xiT6K1SaF82GBWh2B82A=; b=TEBEFnF5MT6cq0hahAm8MUlBnv
	fJ3E8Jh0BhpCQbhqtaUI1Janors835K58gyBfbhqw0DT2LomIIpo/+zS0hiIEmi9p4q+5qIFGo6sZ
	XgKczICLhV3QXxf2R7SFk48g8Xn0658jOZe3hNbqEJWi/bxZ2VLg9iHkg6j3ekXBCUT3AJwy0/hGG
	xcrIHlb3T5wAzHQxsY8g4s44IJ/XJw7IYRNYMzGkEGaSjhrk4fXe1aYS5dtMjX8REjNAFTaQDHTMn
	PGOlhW5QpXi8JSlaux0BW9xNFKpBAXoww6AVLghBFX3mMixMT3+rJfM6oB0wTh9lxhwVP+OnFVug5
	ebpbOMPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhsW-00000004zUu-1V6p;
	Tue, 27 Oct 2026 14:10:16 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhsU-00000004zUI-0KLN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 14:10:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rxDWmB8futg0FhR7bcDVgqk1RgStOtAQ6GmhZlKsk38w4qQq4Jv3H4jvXRUxJbcrh1rQq9e3znpska3i8iOmsCL5Cawwh9Qloo+QunoWjK843iEefilZiFgNLJVqWmRZ4uXgIdZ2kdvuQPczIHTHioa2wR5QlKdDVUmeaiwvcI/XNurd4GzXBfe7yRpcqqCAJm29JpfU+TKj4kAUOHRbt8Pam4A4XAM7R0LtD2DjXpD/KyQgWTq3aPA0BsjswN9K7IUX5Psr/3e/mMDFUOLOKGRVf0RNRJ4HGDryCns855qkl5OljPOvE3DFMmsydAhHsda+/YrVQw+FZuMzqn32Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pq6s+u2TlIWtZL+DDokegL/xiT6K1SaF82GBWh2B82A=;
 b=ZfF9ASnkQoXr41DC9SIBNK4QKZcNMY+cTzmjXsuuPMZJyveTCWEdeP/MeRXexF3ANEiT6EQu1lheg8jUjSFuc7pi2AR6+/RTffaeIaOeMo7qKgzmhIe0JVh+JOYaL15VCRZbKqS+F7taK1HdwI4r/jQMk9RW3XsvxbcJqr0Tyxj9Rk4akfF1i3NOxhJdDHaGQbHjXVGOPOqeXItMT0PZw1300ETaRZnhHZkA7jT3TnTtARNskKNRpRyjeZeoeBgm5PSne53lltU4pLoS9YKgY/o5e/fxz/USe36U1fxUP6caZ46OoGuGeQCrQWaaCi6yIW7EuT835TX0A2RAdbx6lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pq6s+u2TlIWtZL+DDokegL/xiT6K1SaF82GBWh2B82A=;
 b=OBphp18/FUzbWhulGya7C+kzoMpV4r+ylsm05GeetE8K3fQvssOmKEhrRtBeLWQKWPeXGcxoUWSOwD8PwWJxf2/i+BhpjEDjJoEuGH4ELK1GXVmGLdNVEJknen3CyBp+gtY6BmlwmRrE0sA4r62eOyJZKoNgsYGHDpfwlwxwpuOxIjkxUJpHoJE94RitNOIS6iELDBXFwur2rwlkBT+IWQshswWo2TDXg8KyBBCdn4Gkz53fnkzRgEuZMSDCfS/jWOi4LRsP8ZsoZfQ1GiW95mqPxDuNuOMJ98QGezQiqAzrdQb0aSoBozuDytNHK54+Mr1KiAQnQTOBJkUaxZEqAw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI0PR04MB350952.eurprd04.prod.outlook.com (2603:10a6:800:364::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 14:10:09 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 14:10:09 +0000
Date: Tue, 27 Oct 2026 09:10:00 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v7 03/12] gpio: mxc: use 'unsigned int' instead of bare
 'unsigned'
Message-ID: <auCwuBsoTY0mjWxU@SMW015318>
References: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com>
 <20261027-gpio-mxc-cleanup-v7-4-v7-3-7b602d70c149@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027-gpio-mxc-cleanup-v7-4-v7-3-7b602d70c149@nxp.com>
X-ClientProxiedBy: PH7PR17CA0015.namprd17.prod.outlook.com
 (2603:10b6:510:324::26) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI0PR04MB350952:EE_
X-MS-Office365-Filtering-Correlation-Id: 41c9ce8e-1059-4946-f205-08df3434025e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|366016|376014|1800799024|7416014|4143699003|11063799006|56012099006|261021123027099003|261021121427099003|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: pfIRz/fN8WZ8hp7jH1O8kOEacFJXb14aDbFP5hjiulTygNAzHLTVph4yDSd/A5LQwGDx190JPnlbNpfqVtnkyu0axY+ydAYQsHtIMN75mWLgbgWmSTgmqUE40B+p1oPmUyHO+jAVVldGLyK2k4RFwCrqvWT5ohVALSwIqNyA1SQy5M08itoz/pamaGo2kTeAKgr/qEQkkROHj1+R65gvL2fmnZM6WDg2Y6H95uH4TS6X64RHPGQ6McEWZr/kfBFwAVLOGnIzvCox4j1GdwdtxMOgxEdn+U9kv7tlORmgJZw9dyv2ljKYzcL6Sf2c+cxJW+xrBiiW8l/fmKrK8a2ED1uqIfEM5T6sFfqC2GonB+y+rN3R/TiZYB4y2ijPqjqvL2tLlO4WrjnUJIT+BdjcsfeoU4Py1l2SC2iW96DVpAt/3/2pQnaroEoBv5mKVrRk6eiQBQA4MJ3t6gytBzGUV8NykoG+frs75m9NhqdNQcNYof0ryCmdRPEOvTyLsu8/0HICCml1j8Rk4YvivLm2l5cniIIPA6tPqZxIAfKI2Wi7pU8jy2Ku+A/H25TIAO2dSpBliLsSQIS63MjeshbG+5IAevRwjvsgN5lu43o0AHYnYhLYyeMEUDhg62ELYIIhuKcE+RdBrrpYKDuCX9HcUDEmm2hPbSrQOJfKZXmrhUM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(376014)(1800799024)(7416014)(4143699003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XXaMN+cqVgjXohQWGjNnUV2o/MDNJVWRg1e5p5iF9jAjMdt39YwcaUcB0G1O?=
 =?us-ascii?Q?OPeXTt0pBmgoTZlbtPzgB5Ozpu2XMU1ZoHLo7GUqmew76geSpjWZGsUBd9oy?=
 =?us-ascii?Q?HZclcJxLoLP4n50OoSQsA1+c4WWEAoZY10PW2PBQBunEv7EsGcqn7VlqWJuO?=
 =?us-ascii?Q?z/tS20VgV6oRbewIfOCBFWOmefuoNsIPb55krvAdccDoqhw/A6B85TUyA6ra?=
 =?us-ascii?Q?UodxOWgiIyraA6tHodF1SZN2mfLrKcuo4UAu+B+/wrLf+FeBDCTcSGcRHd+O?=
 =?us-ascii?Q?CauuVw27pdRbnpIuIIz1ejIXUy/zx1+a3gUXog7r1a/TMKvYjr4xC3U5euah?=
 =?us-ascii?Q?PYc6s7Ay0ObzFGJhg4XCjY4NhhOgPPJ9Ib2b/6PkCxc5VSV6/R3MoBcQdDvW?=
 =?us-ascii?Q?FUjolaDKd1W7B+sBwePsdP8GiZn997wEr5vaxRS1L8DjrdKy0mkKVjUCnxSH?=
 =?us-ascii?Q?S0Q2a+5Y0SgwMJ0qOQzaCdpYbzR5hfi3rCHAb4fLsKTcQwchsIzrSIxvExYa?=
 =?us-ascii?Q?6x/4LhQRXGxuaBa5mIVltH27ZIJpyWgqheGDlifCpp8K7XgqgEsEMdo09I3k?=
 =?us-ascii?Q?gxTWKsv1masNr+2sSsgZSkE0cXMVMj7eQm5nVnC8AU2w1i92QKfYw5s6n1Cf?=
 =?us-ascii?Q?lQKI0E7/vluxURfoetE100bDyP/om0HTqMujXo29ZllJD6Usa1149DzNGXkz?=
 =?us-ascii?Q?UbIDE4YqSgsPoy1f/NVpGj1ZHjICxb38Z0ogDq7ROhT+391UV+2fnRzQ0+LI?=
 =?us-ascii?Q?1FCz54QCQ2UMQMJEtXn/uDsXwK8qLiIjjR3IF59aOS4WpT+T3YklLXrylfpt?=
 =?us-ascii?Q?NI14FiiZwJ/zygWLqqib7E35U7c6+5HyxyrZiYencb20Pe2QGpKpZSsH5pJw?=
 =?us-ascii?Q?lYTezZYj5HiHqNSlOpo22HlUVObtNFQy1id9KzS2fwqHWzw3C5oibhLAl+m/?=
 =?us-ascii?Q?60knBCoyHvwPdZq7aQH3wZ5aTrP5kO2rvMvXoiVKE75SvRf7dz/RJPM98sCx?=
 =?us-ascii?Q?X0nfUi/Y/PZfCFvipUph77Xvd5Rgi1HNPJ+9YZx5oJf6/ded1z1QoY4xfdT3?=
 =?us-ascii?Q?qC5lwtxIb6J9kOzzspiilDj3KvP/PLw7fAcoCNtKU+n6ZYxEIRAtQH/qsy2O?=
 =?us-ascii?Q?2FCYj93ivY9lmXaSs7QXbzLPpb9wslEMm8AGubk4a8s0+iV3NlyyJ9nevZA/?=
 =?us-ascii?Q?AV29+qlKnSFu0CvLT0jEdTVQeb7y5BaqUO41T3KYsf/YO3rggrehaZSEG5+8?=
 =?us-ascii?Q?akaXv5+v7Ito4x8r/Xdro9Aeotz/XOU9V68si7vYiJTcIxP3+Ycf22HWxUu2?=
 =?us-ascii?Q?ybtH26lLq9zDzDPn1itBnuNJ0YZn23G8BeR69W+5XuwWsChA1gXdGTVXByDC?=
 =?us-ascii?Q?1fYQCw580Id4kwsJEZw7JMrlgwu9Ls7U/ylqgEGRMIg/JxpYMAx6uaUUlTwC?=
 =?us-ascii?Q?80+TtoViEeniupMrKH3Uzk9TqKOboN5Z5dJCKAN/ejJTYt9zUO7DItNFZNBK?=
 =?us-ascii?Q?HCcr2PhPTBUgxYsmgsS+HmqnbHSLCFaR4+PTyIlWYMPJQLqusQROGrphG52f?=
 =?us-ascii?Q?IqJ6RiQtKSwJHbW/ghPBawI89ndCM4AiE6CUAem0vj92EauJEbdA8KvFrcxE?=
 =?us-ascii?Q?LuQGhXo+c02EwTgQJ213RPkwfVGBztVbwERqJ0RNKdXBRqloewJQtrpAp/cI?=
 =?us-ascii?Q?V6Pjm+Tpwd6jeaWq4ROjgnxBQ4XcI9QZ9qzh2umPKxvXk0Q/9U34SX9mGO62?=
 =?us-ascii?Q?KIjJTppQ/SNasBWcllZLh9so6lrNXAX/Ct8e6usgF4SADadKiNqZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41c9ce8e-1059-4946-f205-08df3434025e
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 14:10:09.4690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O29yN8y8nNO6U/Up8Ht8P5/mnfPr56WXfPGdOW2xcaUqqhDaoML4yKYZSUTTM0tQ62BTcWT3UvTC0t29zVNn4mJDaOM4D4dDE4j+5g/dLwxk1Bw41HAca+4m0ihp8Iy9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB350952
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_071014_183265_91DC7F09 
X-CRM114-Status: GOOD (  15.45  )
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

On Tue, Oct 27, 2026 at 08:09:30PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> The kernel coding style prefers 'unsigned int' over bare 'unsigned'.
> Fix all instances in struct mxc_gpio_hwdata and mxc_gpio_to_irq().
>
> No functional change.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/gpio/gpio-mxc.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 848d7725ccfe..43868a214c17 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -36,18 +36,18 @@
>
>  /* device type dependent stuff */
>  struct mxc_gpio_hwdata {
> -	unsigned dr_reg;
> -	unsigned gdir_reg;
> -	unsigned psr_reg;
> -	unsigned icr1_reg;
> -	unsigned icr2_reg;
> -	unsigned imr_reg;
> -	unsigned isr_reg;
> +	unsigned int dr_reg;
> +	unsigned int gdir_reg;
> +	unsigned int psr_reg;
> +	unsigned int icr1_reg;
> +	unsigned int icr2_reg;
> +	unsigned int imr_reg;
> +	unsigned int isr_reg;
>  	int edge_sel_reg;
> -	unsigned low_level;
> -	unsigned high_level;
> -	unsigned rise_edge;
> -	unsigned fall_edge;
> +	unsigned int low_level;
> +	unsigned int high_level;
> +	unsigned int rise_edge;
> +	unsigned int fall_edge;
>  };
>
>  struct mxc_gpio_reg_saved {
> @@ -367,7 +367,7 @@ static int mxc_gpio_init_gc(struct mxc_gpio_port *port, int irq_base)
>  	return rv;
>  }
>
> -static int mxc_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
> +static int mxc_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
>  {
>  	struct mxc_gpio_port *port = gpiochip_get_data(gc);
>
>
> --
> 2.51.0
>
>


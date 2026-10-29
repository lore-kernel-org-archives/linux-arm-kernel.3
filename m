Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E855606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 14:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3QgPLpPy;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=VEszlmkl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2sqgxEPW5qkdPrz2kSZep+WB17RIwaV85YEKIvwD9ak=; b=3QgPLpPyAS9dXrFV8jcxlMRCHV
	1DHwNi9umooFAgz7A4UhwG+N1KPdar7lUW8F7NL2P7GXk5PHekEvR3B9ixF8wSo5GJwu8GjRJqQ7g
	YHgK9XJAP0FGN4JcxQE873jFKAi9zUEkqn04E7515y/uvt/MYukTfPICd0y6oX6DAPh9FeoGtmZyS
	HqSfuDb1Br7ZQE7o0OFTXPGPqGddOmK2M81Vuns5Z43aMfP6yWfDhSHjMlcaE6WZan92nJ6dmkNhU
	l3ErQzlwSJgUiAwDbaT/H/jtLSGpTkbXgZ+X0X3KEd0VJxkdetWJkhEyD2fieVNFfz5H1RX1lrr8P
	dhh7RmkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMR9t-00000009Wih-451S;
	Thu, 29 Oct 2026 14:31:13 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMR9r-00000009Wi0-2UjT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 14:31:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=caYho6FVKLD+m3021tMMU71EJv44sioKc7vSj7AWulFku/5pVZz4EycxbypQpJo5Cnsozfjdm7ekctdB/O4T8nArkEwAK5NY/KJjrrThr9wcWFo2qYIFU2Iw+0a0G88mtECud4tq1sHcZ4ALm3DgTHIvAOJoBget0k/G5/Xzd9BfBC6Pui3jJX26dyw6RkpC4OWoAm2UJmSMBmqstCHlx6edi7fEIvwO+8i0nzf9/qPeH9pDA0mzyfUGyqhBR0TuO+ZGCavkjHzk8pVWmOBJXpbCjBCkNsMvvd2Ia+is142Wnb6hTCU/acoFvp381tq4+WzOgkYGJ+8FWocCeHfjXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sqgxEPW5qkdPrz2kSZep+WB17RIwaV85YEKIvwD9ak=;
 b=yEJnTH87G7IRgNUOzgYpjZsHHOHflEGX2/GQpu1KGxY1Dgd0ZrorePsMG69XtkUdH7vyPXfJowIdczY8/n/3mFSQg9PqEN9Jg5wqowA3Ag+9zuEiA1m9hF/2OgUTDd3s7RYKHvXDCFhkn8rmqu+dtRKmqlf9wSY7esc6BV4voGLgfloaoSeOaztcl2nFiLPzFZ82EVxPpxZNv+rK3TdKPxXAcXJSYx0brD5GcYSCLdQA6oxddl8FrMeTNf2Y0cUq0l32dGJ5F2xzso+kVmDYUoaheggVsv2eLmtWLC9A6RESEKzf3pFoiLL7dlmu0+3kvMrkuaJ24zgOPJpB+HQ2JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sqgxEPW5qkdPrz2kSZep+WB17RIwaV85YEKIvwD9ak=;
 b=VEszlmklQ8My7L3F8w4nY58quBqW4NsSixnfzgd+ouITH5NHMqZ5Xd+OSiqaCIlhVTWIDuK/ICkU/+4aaxY5VdIPoGSv7pUwHA2p8ul3sBviLzizNVR7C3rgbytNXEXuPB6geHWK7TduPbR60773MAk/e2Uv22GChKMGQ3J2wdTC1uh/Qo81CVN4uCMoS8hxbMJ1QjDFYibC8MOKzalkdz4mRW0qHE0qahwaRMWyymBmL30QmX9nIwB7NxlbP7UyzunAbQcUa0RzPMv79brGSrVVz63jv4fMPjuVRDTUT3uWw5f5L67xdf8d4eR/yP3J6deHQxt0fa4WFWpa3YtizQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM6PPFBCA68DFB8.eurprd04.prod.outlook.com (2603:10a6:20f:fff1::a92) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 14:31:05 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 14:31:05 +0000
Date: Thu, 29 Oct 2026 09:30:52 -0500
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
Subject: Re: [PATCH 01/11] dt-bindings: gpio: vf610: fix clock requirements
 per SoC
Message-ID: <auNYnPKIHw22cnpe@SMW015318>
References: <20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com>
 <20261029-gpio-vf610-fixes-v1-1-45b484b4c434@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-gpio-vf610-fixes-v1-1-45b484b4c434@nxp.com>
X-ClientProxiedBy: SN7PR18CA0001.namprd18.prod.outlook.com
 (2603:10b6:806:f3::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM6PPFBCA68DFB8:EE_
X-MS-Office365-Filtering-Correlation-Id: 648fe470-ac51-4a76-339f-08df35c943a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|7416014|366016|19092799006|1800799024|22082099003|18002099003|261028144727099003|4143699003|11063799006|56012099006|261022105027099003|261021121427099003|261026140227099003|261009223027099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info: oPc/0DPopV47Zwy0Uo3lHt/JNMGca0R28xrqqq7w9jPcFkXuuRr+QoxZDwp6KNWmGyLA8fgNIqin64mY8vOBagI7R67Saeu0yCYN+yWe3abbrlPMS9MKQ+LlcYsIdZgmYd+eRHvtFffKnzXAiFV66atmpsMoOvnbv4t9lSglh5ycl2yzTduLKBaSEhTFv5jkQK4w288PY8tAz/Kt7GdUzQncPxgtSRyEwz1DXSy6cTHTaeL3f5oSmy1dIA7mXXNI3CSgL6UInAkKfwp3r7TKGcdqLhNP4ahVV2+bERDPOvx4+NIA0enQJPMWbtf/OPyiYNQzsunB1f/o7w7faD9/+AcnolNKOzjpW0AhVI/8XX2043zSdE3TpHldH8iG2owQJDb19aux3VnDbmzwN81llEdERQQvZFvdI/O9qAQ8Gyf2teRDCGGknHbuXsviM7EZqHCVzAX6hmzHBNqZEFLAdNN2zGu6OHrZto60/HhQMWTfGPno5a+IJZo3IS7CpELQTrOoQUyJ7e0HBmr8CeymPFnlfSMsTFFdiJRfh5lpu3RystZ59QEMix23cOiSoo1VU2ZcYGLpWriGm5Pv6JFTWDdazS+mVsohn19Ax8Bqsrl3bSd9ZF5Wykh2QxcKpBpOzpgnM1MR5ul3nMjGevgz2UhiqSWlZ8czB8cN3Av7CFw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(19092799006)(1800799024)(22082099003)(18002099003)(261028144727099003)(4143699003)(11063799006)(56012099006)(261022105027099003)(261021121427099003)(261026140227099003)(261009223027099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f8JJQa4YFVLjnPxGioFxMW9yEO7zPlqGlupOiFJv/C2xnlhoK4HQV62pJUWz?=
 =?us-ascii?Q?4MJZVvJmpkszmmVlgKk8oxB4BEsPnhO6RGpLSvojSEYysBG93C1YhNpC1GN+?=
 =?us-ascii?Q?DyKYqbdBkXK+KGDc/VlL7b9Qd5XjaPIsAftUuuCV5X3hy0wnY37jQwWfB7TM?=
 =?us-ascii?Q?lNcPhUpZVZfpf5P0BvS5TdHW6OSs7K0CaeTsWQBcXQjBpHfP/VNHb8zMbEIo?=
 =?us-ascii?Q?5Dw8E4Yby67gwBLPdocq6McqzhSXH7yAN5Mrcz7SFq9ePb0tF5FOGF6KiMSz?=
 =?us-ascii?Q?h3zkYhT6yTkfW4H1k1YWgmPjAB95k8pePlw7Dpm49CMkJR4vyMmlZ/A+kLou?=
 =?us-ascii?Q?4MHr/S23xV/dLOYIqkQUjSN6w0Rbe9A17bof7Z7WD4CHWHZC6DX025N+AV60?=
 =?us-ascii?Q?2O9UQ8IiENZTWSt5/WD1Hym+lRRmJ/kyFqB+PA1Bs+7iiyVwZ9gKQa2pLXWF?=
 =?us-ascii?Q?uh6TOhDfluFpHLKHJnQbcFDdwLIMKtZDTGTGeinFB1LGG4ICw3dpLkKUuwS5?=
 =?us-ascii?Q?l8aW9jNR12zX8bha4VrL/on2tF0Wct8vjHxKtnrcVgrNmJe9NDFfzZ+TYJlh?=
 =?us-ascii?Q?j4wFQzoz/lo7w7YDn1MBisVR4RtYykevxHCp7dqrsdNPIE87PM09Dddj1B0S?=
 =?us-ascii?Q?HjbhBi52cxN87wvmOGVd/y2P+9FhrUolVFNsWOH+gHmWP6WVmiW/7KWf9OOP?=
 =?us-ascii?Q?XFDsplg+mzZEqyOjOwM4/pj2AtzJDer0ElbXRXPerpWy3GV9H3YU26hv8781?=
 =?us-ascii?Q?PxVK2OLNxhcFGs7W4T5Mmo27/4sFMmUAjsUM9xl4QrL63Ss8U58xqOtV3p/1?=
 =?us-ascii?Q?cAMJIuY+Z2HdKAnMYtscq5JrKXaH4qa9nCNA4uuw41Oqoc4muuYEHGltcC5D?=
 =?us-ascii?Q?VllzEw6ARfr9tPJbbxLX5F3eWRk83dDmEbBX3E9f1ARHO5+c3ypocjpqIhsJ?=
 =?us-ascii?Q?+6+B1g6hvAEUQ9eJrjlbeQJdDKZClSAj5aERXMTx4r+50J90zW5317Ppqn5+?=
 =?us-ascii?Q?Tg/Uuef8XSJvqu+ElzFpKO4PrTfdXqMO0Y4/y12oZSRFy5jku+lfJdyJMJqN?=
 =?us-ascii?Q?qCvP7+5GVzJJkEKZmoIGOPOHsWsMb9JqVsIba0R2UAxNHgW/v9P8jAANMEsC?=
 =?us-ascii?Q?84g5wMe55dD1t023ggj6JYMgjc7cwOkZiip2N9s/PVjBPu0E6sh/tN/lX9y1?=
 =?us-ascii?Q?0caqZyelKyLonGNvMeFJXH2Q7X8DfWgwvI3vhswh54eTvtZcUtlRNqy5AHwz?=
 =?us-ascii?Q?sZ3yi0zQ3j4vaR3vEISf8hY6nnFnRzOxvzkKY0so6TPhdKon3BczHaHl9IFL?=
 =?us-ascii?Q?KUhUHfMKu3tOTYFiWVBkbAAijmr2dRgHOf5rBG5dwtykR+r+xumMEPxqHq1/?=
 =?us-ascii?Q?z4N6Kx9HzVaIZLOjOzgqzCnNz+bEhvZ3jE5hT6faApZdm7/sip5NHpu5bkOu?=
 =?us-ascii?Q?FkYMiLvtEsmdHGitQGt4A8gcfVWmp6wKeviCkaKb4zxd23YGwkLezyfWGgD2?=
 =?us-ascii?Q?GvsISLgO14lAUcOwft4YhDBe5zQ2gMRPRCXPlhpjBn524aDbLIPCh2sY0HMd?=
 =?us-ascii?Q?qjfa4pz324x2b2fzChEyNNnIYwmY9TeTMzvKT68SxaUkJsA/5h4auNK6/eep?=
 =?us-ascii?Q?95MNnrwz6ljSQheDjSR6Gl7kgdwoZBF7xwEH5K054+jxC1l6gF2Zm8AzuY/6?=
 =?us-ascii?Q?HUMgRgRF7G7Z+zHaA0cDRCOKRumDDksW0yXxyczXXrg81j2DXxXxhfHonETq?=
 =?us-ascii?Q?x39UQdMFQ7J4hTFgx6SFR1YMaZQQb+GBiQYwY7WXwNgmBxO4naS1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 648fe470-ac51-4a76-339f-08df35c943a2
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 14:31:05.1509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VDYLRZ+B3JqxDPN0+g+UOMq64ZqIVM9qBCL1zq+dmFi3Q/TcT6/HzgdVSWek3uVXPxRLb4BOcZBbcowqCnBd6SoEW4Ee3DCE2Huo+2z+MkOTtQRa5kmbvLDC6hnUDED8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PPFBCA68DFB8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_073111_636682_C1F65CC9 
X-CRM114-Status: GOOD (  15.26  )
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

On Thu, Oct 29, 2026 at 09:42:25PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> The i.MX7ULP GPIO controller needs both the GPIO and PORT clocks,
> while the i.MX8ULP and its derivatives (i.MX93/94/95/952) only have
> a single "gpio" clock. The vf610 controller has no gateable clocks,
> so keep clocks optional there.
>
> Describe the clock items with minItems/maxItems, require exactly two
> clocks for i.MX7ULP, and require exactly one "gpio" clock for the
> i.MX8ULP family.
>
> Fixes: c61d8b5791ab ("dt-bindings: gpio: gpio-vf610: Add imx8ulp compatible string")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../devicetree/bindings/gpio/gpio-vf610.yaml       | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> index a31f64b6d40b..822fa11d18d9 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-vf610.yaml
> @@ -57,11 +57,13 @@ properties:
>      maxItems: 32
>
>    clocks:
> +    minItems: 1
>      items:
>        - description: SoC GPIO clock
>        - description: SoC PORT clock
>
>    clock-names:
> +    minItems: 1
>      items:
>        - const: gpio
>        - const: port
> @@ -116,6 +118,36 @@ allOf:
>          reg:
>            items:
>              - description: GPIO register base address
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx7ulp-gpio
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +        clock-names:
> +          minItems: 2
> +          maxItems: 2

Needn't maxItems for both clocks and clock-names because top already
restrict it.

Frank
> +      required:
> +        - clocks
> +        - clock-names
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: fsl,imx8ulp-gpio
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names:
> +          maxItems: 1
> +      required:
> +        - clocks
> +        - clock-names
>
>  additionalProperties: false
>
>
> --
> 2.51.0
>
>


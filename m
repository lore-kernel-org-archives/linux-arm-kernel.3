Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31A4606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 19:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zq5l/crN;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=EFec1rmD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TgjcH2X0iwKVb8P+szXGbyxcALMb9b+Cosfo+ApNGXE=; b=Zq5l/crNRDRwYjuN56gA3KoP5+
	CBLR4lFC2fSSa89X3opbKU3OxD1WLkl5kXjMCC2788tg40WuHq31IpbLNOPES6g8JhYKp4koOqmXL
	kWtqFkDwY1LmCOACn8HHxkvyXSKbU0LnGH6YOtNFrC9mXPBKiT2AWejYIIJ7H5kZFroXReZEQohKg
	ZwCQQofAThSv6NGNU3LGQjUlKyn5FHlp54QXDGVe+FdLvuT5eHuRUegLKpLpPbwhBeZp1ALRHiEj0
	0rZ7zzCWP/hgECSQiZFf3sXHO2mIAlxec/peO2ACBx1DMSpQioigGbmwWR8SirB1heCbLOQrpxbxE
	Hffhfegw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIsco-00000008DWC-2BS1;
	Mon, 19 Oct 2026 19:02:22 +0000
Received: from mail-westeuropeazon11011021.outbound.protection.outlook.com ([52.101.70.21] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIscl-00000008DUy-0xtP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 19:02:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sVXkAovOYbfrwYfl0mjNNmqgIUjJJJm2XAdTtokH5v+rhH+ZmKA2OVWnhrxD32D+lssAG41QULSiyHkm+lKUovJVIqiEgV15960zI/6fJa2/k0/tE2FTiX8yEBBBUfNTCLjt3WU1bObt7fXnbzuBaDuDQ8IbIw3AIDp43A3+ZPe1vYhdqNx0GjyRZLifOCC5JSQersfe7xeillaiBSREzDQlKSsuZtiQzIXzjEdMlXumY7TV8afe67+sm7gumdgqCqBDVEXqcOZYZ+rFBF1WQ80zifCpLp0A5fHwMyD68L+rAaJ09TI1MXS6ANadKj/4IV8nfIY9c1WnvYCo7Mn6Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TgjcH2X0iwKVb8P+szXGbyxcALMb9b+Cosfo+ApNGXE=;
 b=GfDFHjkSf4VzIKMpH3NZBMY+4xFERtd4wa+mQJ5a4e069LddyrYtJOT0rDBPyChYzwXvLH9dFF8aK6HCWVslGwA9Sm/4HReDxsHxzKBbiL9YleWC1WBpygUJig8lCEKKZDMRV4SqRJByby2w7uNHFfDVRznN8GR1h9dJvacwMVjt/TCE2vq7nvv+D/i37fzkmHS5BfC6U0gGnk53t+3d32PcMFZDrYtrogXF6nvfiqtj8zuxNk/KXsUSxNbVzFkKO3FYmC1r3R38C0jlU19dfyUTc7XAgZghlpylSneieJB90wGrHx9wq2Tk8tTEOi1gsMVDCgr+0KLIIW3f7uvAEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TgjcH2X0iwKVb8P+szXGbyxcALMb9b+Cosfo+ApNGXE=;
 b=EFec1rmDZIZgRHQi8N/fkShAB8smk4ay8ip+kCJ5bbNCWjFYim5u+NLWaLe/vylS8r9xo6Z4evXYuQE7WgCe2treO2oCfiG3evp1iBsSXxxql8O0YmNyJAYl6lXh/ojrmhcBQZdA0M5wc0QIP/jSTVe32SBqK3tjeyButyY5T5Z0jnif10m7tSN/X81HD+CO85rcVaBRm0exAok8XTTXwvvvywD1F4/H+mIAnHaOaOj6/T1oTvx94EuLUbSdmWTdvnLNxQhiBa0DaVP8hRZ3qM6wtF6E2wrFnY70pVxyLtet4n6pP412pX24PRZrJVDA2AsatNTqnOmBww3KZzuj5w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by VI0PR04MB12661.eurprd04.prod.outlook.com (2603:10a6:800:346::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 19:02:13 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 19:02:13 +0000
Date: Mon, 19 Oct 2026 14:02:04 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Daniel Byrne <daniel1.byrne@intel.com>
Cc: Vinod Koul <vkoul@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
	Fenghua Yu <fenghua.yu@intel.com>, Frank Li <Frank.Li@kernel.org>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] dmaengine: drop DMA_COMPLETION_NO_ORDER and
 DMA_OUT_OF_ORDER
Message-ID: <atZpLBovBBsSGHPq@SMW015318>
References: <20261019150632.4026424-1-daniel1.byrne@intel.com>
 <20261019150632.4026424-4-daniel1.byrne@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019150632.4026424-4-daniel1.byrne@intel.com>
X-ClientProxiedBy: DS1PR05CA0012.namprd05.prod.outlook.com
 (2603:10b6:8:457::9) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|VI0PR04MB12661:EE_
X-MS-Office365-Filtering-Correlation-Id: f12e4e31-3b29-4c36-9347-08df2e137c66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|19092799006|23010399003|1800799024|261009223027099003|10067099003|56012099006|22082099003|18002099003|4143699003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: 353FMh9rjuRfqq2Jm4rnS41FdYVejFQ6DkDH3Q6LpEg7WSBikyLCKp+/pWn/lewc85WRvs/vxZVGWz7ahNS6gs31W9mmGDkbiW5JCkLmddRElvtm21XXGncijUc2dnA62UaEFgSZyJipY3ZmbwdS0DLXgHLKH2T3iZd2SGVw3rn06a+BKWNjQvdJ8xXbihL80tke8vGezXOzw6u+nKEwJNlgCkg05JmTv8SvBhWRZcA+7BuzRY0u/qUhnaB88TniDjA3Z+oFHIeC3/Vxbow4CJ1+4WC2pRLaT9tDcX/DgQMSPrwfRDkqXJlXvLlUdzmYNcGmkpiU+Mv+nZO0dWhGGcFR/BLSRe6Y1oNsazw0sdIACB6EZXJOrLUEPcsGA4WHlDt3pQd5x8HDdTyL/9nmHhNd2jkK3jGQrcWO0RvPOTo2aIDNFoCV6t77h0cwXNPqgeuJlJHCc0Ui9VykQ3rkYUwh0YTUtMan12qbqQ1jvSkYu0l7zxvdmhauZuhF6aup5O7uL+/6wz5/DfOlps42PDL1gNsT++pdm0tQVuqNbAYYq3jVntrKFkasswuFrcFLVb7f6Hhog4j3u5MH0DYuhxt/aWu+7W/5czKe5bmlmkX8/stwy/TuglkNcORAWhokXC/e6r3x0vT6tRNEzMU0KzGBGilcGGPv7u/CFMMeRm0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(23010399003)(1800799024)(261009223027099003)(10067099003)(56012099006)(22082099003)(18002099003)(4143699003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CA3vHgouPtDts/FIQP4ZZTRiZB7dYu9r/4vyThLhGiqKM27WLWdvgOcwACUu?=
 =?us-ascii?Q?ITrSbedxhF6auag0bqRODphGldiZ/mcOZG6F6DH/MllxnZ3gKSbAd+Z5YK4Q?=
 =?us-ascii?Q?k/ew+IHwh2mvO4wbJR1p3B0LCZ14BF/eSqmHS9J83v2AVCO6xI8DKmbj2Cyb?=
 =?us-ascii?Q?gdUaeL+UP3tB6XFd1IqXU5XB4uP8dYUSIKf8ihESKunjJf//2G1yBmih8Hl5?=
 =?us-ascii?Q?/SlxWh+9IwZmTXP22oXRKtVpt1HeSMPIhI3QDmLvKXnsNpY2HaWx1cKHE/TH?=
 =?us-ascii?Q?cmEDFmpRp6OH7ygH42jt18J+88xt+Os393LbQUqAM/93Ajd1rhAHF6zQ/cIV?=
 =?us-ascii?Q?c3bUbP7FFIfC8DZ33op70f4InILd7tdz5itYeRbZqvcNTMcRqoETp+PzUYZ7?=
 =?us-ascii?Q?kYmG2dyM8lDLd86idFW9XZrJQoNl1J3lgyceifGqtYrjkQ2JrTYtGBBwYSUf?=
 =?us-ascii?Q?m0K+/2s9wqu46YM9SM5yQOygZqEFQF1jILuje2HQUPRjrFPnqi07zWQfCw19?=
 =?us-ascii?Q?Bb40WOV9Lvc/7OCq9VdNp9NvLTxAQqKMOG2CJBFjeCWQzyaHXWO/tYvt9NwK?=
 =?us-ascii?Q?EIkpt6cVQJko0g7fXVI8o+Ewz/cOCRojKuxCgD/PhmCpi5Gs0NJi6oyRMnx9?=
 =?us-ascii?Q?jIc2mY0L1GfQBItqnrQBmxasAOopDEpTeOM8izEz92O6CfvTmmRK8Ul4aU21?=
 =?us-ascii?Q?lPhbwPR4XxWtRDIc1fioGaRuyykFxjMZbVNxrEldCcMPyy2rbLYXMAGMsbN2?=
 =?us-ascii?Q?JuD437cISsZNxP5pja08i9KHnD2UCMVpcXTjUpA07RknsXkouHohqBnM3Jka?=
 =?us-ascii?Q?negGoXJCva2msKYK2+0tCV31Tcy7vCuzpZixIbzZZdfofCi6rcY1+JokAOro?=
 =?us-ascii?Q?A1L5t/Mco9C+OBlDkm3Lq9/qJFel0/4dnwbGfCl9a7iRhoJlxAqMXs8bhYQn?=
 =?us-ascii?Q?fftzwU5t2equtpuKqems6ofI7RBYUGVCr/ov5HhJjxKh0+cr8nOgUaDzd8R3?=
 =?us-ascii?Q?fXUH8M9YK0QHyaxUyj47V25Vs30s/hGKycCtxAEDWEbzT0i5nImhRndgqRU0?=
 =?us-ascii?Q?J+ycW8nV7XF6zQMssTCKDc6bIELpwqdPZKdyR3bmPw7KDb8uu63Dlqur/s9J?=
 =?us-ascii?Q?7vNnRsy6Mh2JX017JM3cvIjatc1SmvWQZ2LWL9MqzNVG19YUM5TKQ82zOqQy?=
 =?us-ascii?Q?HrFYdlICfFOG3/yqm3IWz7cY1xuJV7phqERVYbSg4ZyccJpCMGdmsMfhWu+Y?=
 =?us-ascii?Q?BfkIXMOs2eC0VmGidpDqfls6g/2qVE+Zr9d0yD6wwxFS3KFooayNLuB4owjL?=
 =?us-ascii?Q?aOo4sWbfYi6LKdLaBPvP1QL2awkKWBB/quiygv22J2munbAExUEajXy35mO1?=
 =?us-ascii?Q?neDUEE37JeXL5eUfBUUGWRhiRDTpj4YTekBY4yvZBvIwExCXgVevotX3KMSX?=
 =?us-ascii?Q?L66ieXlzISE1T+hyRCUgHNzG16ymqRlDBg+RvyOjyC6yPdxgeqsvsiDih80h?=
 =?us-ascii?Q?CThPy/Cdg+h4hWopO9Ek6Cc2t0QIpMWxny1o27yyOcSzbcVE87r43EqA7xou?=
 =?us-ascii?Q?7ydBOCArjx+yD78+Cq4SERT19p21sZ+CHVrSScs1sW4CuiWViGVGCkOE2ATZ?=
 =?us-ascii?Q?QBl5Q6zGEsJmoGdz68Jx4uKWKF47hXw7Ac59MaLbKpV+gOKr59ci2ntH15Bb?=
 =?us-ascii?Q?FVocVfwxPhkCHKcFLn/5gCg6/RqaE3objQ+rmalHG/MIrnchuylzD6KAKV7O?=
 =?us-ascii?Q?sF/O5ub+WhxYnW6YPG0XvgK2fEIJ+CYz66zuAvrPFDOOmmljtN/x?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f12e4e31-3b29-4c36-9347-08df2e137c66
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 19:02:13.8131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TaQCm5UGpu7lM8CnVd2G8BoQhsw/ifozhAImPN3X51g//ODIvqUzxh1GS4MWtr0rQ2s8MomSkgwqSjkw3k59vvKYS/ewdHA8aP9zmJh9R5qrsvn558LvrATM8wVSIRrU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12661
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_120219_271254_193F1444 
X-CRM114-Status: GOOD (  11.93  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 08:06:32AM -0700, Daniel Byrne wrote:
> [You don't often get email from daniel1.byrne@intel.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> DMA_COMPLETION_NO_ORDER (commit 47ec7f09bc10 ("dmaengine: cookie bypass
> for out of order completion")) flagged devices whose completions can
> overtake submission order. On DSA this happens when a work queue (one
> dmaengine channel) belongs to a group that contains several engines.
> Per-channel cookie tracking gives wrong answers in this case, since
> dma_cookie_complete() moves the completed-cookie watermark past
> still-in-flight earlier descriptors, so cookie-order status can report
> DMA_COMPLETE for a running transfer. Clients were told to use
> callbacks only, dmatest refused polled mode, and DMA_OUT_OF_ORDER
> existed as the tx_status answer for such devices.

Thank you for such cleanup. But I have not understood what means. Does
DMA_OUT_OF_ORDER will never happen now?

Frank


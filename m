Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B58606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 20:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZLZ5cXrF;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Z7r362V+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hIOkdjrAl6wuR1RTnxpjyuNSLc0DXX81ygYrQSAuZWg=; b=ZLZ5cXrFzaWUCddxOlzsL6iafS
	LDxVcCGl5f9gkeFHv+LW72fDcudQKwSerNjGxWtqkJ5DvFbg2CfwovyHKNeMgV2e3rcsiT6GUemfY
	fimb5MrfaXJnZOYqxAm0U3zJXAFBkjuSRjO6QwRMhB0r+JwhUojXA9RXV48dqxvRSm5xlm02Y6wHc
	3iwMyyF7Ovk9TrHnn00CB+ysDZEKRh3tSg2arfDh5Sr3Fo97CAOm+gfiw3upEM0hfH9NHYZX9cP9s
	LF5UO7Qub02baTROdMlqN5vAOJiaoNvBYpA4p4sCM7bhsccA3rOnzlh3p3B3hCGF3oWxel86WB8wh
	iPm/Su9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJzLe-0000000Eva4-1UDT;
	Thu, 22 Oct 2026 20:25:14 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJzLb-0000000EvZe-1wPd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 20:25:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YS1zW3xRR5mOPphUOqabgn/ehfvX69BFL23Dqt9OF9SkuNIk+n4eocpamZlXHU6ZyZoX3cLD7sxLV3p/kabMirHV7mS6bpO4EjztMScxjFobpDW2ZsaZSx34wHPgUCrDir0PCvnPEfO6gn9iqKjlAX3pyCW6T+OhFNcTiLvc8d8BInqRGmI70VirvMdvyv2lpE+mGYjofa1UkiftT9a4e/9HJ9I2U5z36EoNkavVkirhINVunVukWQnnxRETGzuebeOkjtDKuenowZZqiDTpEjllmx9E4miXeP5OaikGqxrza0+DXmcJ2EzH0aQRaT02xyNg/J1OGsFXfhXHfDnIig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIOkdjrAl6wuR1RTnxpjyuNSLc0DXX81ygYrQSAuZWg=;
 b=wXkU7qzx4nPmiu61RtX0kuLOwy/V/Mh92KjFsd0KrY2EA0BvV0MTvRQMio/jGwCE2IMSdXp+oDSbCxT23w3tILjmAjW8QVOwGZsgkkls5+s93cVbGjif3w7fsNdL894sRqrhLa3ahbWqysgVmK86nEJe/xhHj8XYaRXyNUXcNXAa4Ml9aOzScw1rSdfEBMuI2obRLAfMvEFIBGVxUaoSwDuWG0PKbKvPSh3DY2RZ6ta3L7Zw9YkPuetuEsMaZu0POamRPwLjXgWXTGApaoyLhKYR2xPjX0VgzNaN3il4pa0LkGHEOsWmO96rlSu/d7qYyxmzXSefaZN2HT9i4+eiLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIOkdjrAl6wuR1RTnxpjyuNSLc0DXX81ygYrQSAuZWg=;
 b=Z7r362V+Dt0LQwWy5J/SKnBVgdIiUGEykOkygIWDC4TP7RfM8gMGozIGZ4lGf5aUY3F5dKFRJ8rklCH/Pcuaini0/Bco4JMhAOUXnBMfuRWeZ7teMOxcxxE+JzbLva5af5keZRuZbt64Pnt+dVagLVKgyUIVR+Ghrlfa6vnDwNxOo/2j9ItuA6NkK9KLMzu2GDwTRAwF3sUkrMlueFpARjijtDmhtXT2A8Na1biQYbOCLAjU9vH8kPH2C+gaDLvZSHYdNoUy0PRT/N+6bxEB9LejOBidCp75pDvzHdGD60/lcmF2fYKupF93mMRelNbYp6tY1hynpX4BHwJd2i4HoA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PA4PR04MB7967.eurprd04.prod.outlook.com (2603:10a6:102:b8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 20:25:06 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 20:25:05 +0000
Date: Thu, 22 Oct 2026 16:24:57 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Francesco Dolcini <francesco@dolcini.it>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: freescale: imx952: Add GPIO5 lines 18 to 20
Message-ID: <atpxGZ_6ii-fax3l@lizhi-Precision-Tower-5810>
References: <20261005172622.135725-1-francesco@dolcini.it>
 <asPfQZURHvVzbgVU@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asPfQZURHvVzbgVU@francesco-nb>
X-ClientProxiedBy: DS7P222CA0012.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::15)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PA4PR04MB7967:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a93b7ff-e98a-4cd1-e909-08df307a8f27
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|19092799006|7416014|376014|366016|6133799003|10067099003|22082099003|18002099003|261021121427099003|261021123027099003|261009223027099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: zOns8MYtADKXj5pqgvLufm8nvmtmBFnyE6zB4eOpf6aqLk9V6PPWip9s1X67c3Bl8bAGrW/f72l2CALEKCRL9QFybhyYWNi7DWq8Qt8Nqocnpgj1jYz+4gaADDMk7PF5sCjdtbfbhgrmTd1oFrH4//5SFen21i1L0m16R+J2H7qrq/eaIyINbbHbwnga9HhAaK6KQHSN87PRbHopP1LE71l1BAq7FzzKMI7LhnXxFEkRcDqksxQpEEatC1WgZdRkluGzgxbpk2WyCwHRMzcTH8yewc45KxEN8WGkOjepg3jbSwk6RI0QHQxbXVf/keLacchtIIbmYGmwfmD0QSaWNRW67WE7B2jJB2+OUMU24jsvgnuHu2uz8LFv8kJzxuemmYvHYuEQhETAh41xp66Glg1uUpJ4QQvcgZQy118vVbHz2a+XxvudD1p3+X88S01nZ/baqbsCWOugXuxisUI67Z9r/V3cwPwkBVltXD9cD6uX13/bqmsO61uU3SSUblCZrLMVRA7Yp0nr4f5Q1ASJv1h5OXgYOYdIZM5UW+lcY1rFcIqcmLEAtQC0LAjZc/PP2Y8Oc8r3YEP6KEDj88zAkq7C73DSgtnP2AcjdiXvupSu0kb2OQ4VeBL9lawmF/nbIiVCBwi+/UaobqJyfjcBtZK1HlXYSkC4297W7qJKAWU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(7416014)(376014)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(261021121427099003)(261021123027099003)(261009223027099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mXV4NXs4xLV9eUpujSA0zkEVVW95FumLvo0P2n3wbdEM0SSGxlh0U7dilc6F?=
 =?us-ascii?Q?LI+Nn+uznm0p1TARHAqdA2GR2ssmmXd6LjY7m8ATqUtvEKUJ3Jp2HwB5sjUp?=
 =?us-ascii?Q?hcKXQS1/0M1gpap8h77jCNiMh5XLgPt6NLNHo0/uGalVs7sDeg0KlKQkG51P?=
 =?us-ascii?Q?qFPRWtMgLRZOa6xA5lFvrWbUb+nHnPbRxGiM+JaP7AkBzvAhl0IhVShbT2bz?=
 =?us-ascii?Q?kVpBlxtKp2o/aNSqFurLIwbHzPKXKhVj+RrAxvY3Pf14EEIy2DaCznPNde5R?=
 =?us-ascii?Q?1KHfIoEfapZ1QecPAMamjCRLo98z4S5z1Q2cVGpgq89piamBVrcw6xw1xGam?=
 =?us-ascii?Q?fPzY8qpHAqhAZGzSWLuvXVMKAt0QUp9z2gtOLp7LwqMoQlv7HW0sm0TzW4d6?=
 =?us-ascii?Q?Ux08fwLmWOfZ/FuGxQKglgOgJuTxdQnpY3PExnE0+FlnKIZSUjix2WVNSY9a?=
 =?us-ascii?Q?hOf977eSNsHQxJ8B25g9i/RBsN7AnzfF5v5cIhmM19cVM0OMA01mh/ASpcei?=
 =?us-ascii?Q?2QbdQwMiXRk/O2IzR+8+4uWHQYHaKDRFoxC8DPeKII67akotEHRqPOLM2Bpg?=
 =?us-ascii?Q?tKZCXnlZgMB0kxLoaqphlJsl6r5UkQH+SuqzU3F2OxCGLhTdjXUsTLQR6gvN?=
 =?us-ascii?Q?bWU2OMVeEZsUDn1OTLHijFc5DbC2K3Cu+G/wHm5ghuTHTqb7DxqHn5zEKYZo?=
 =?us-ascii?Q?0ouU3fqXTPVbBWfd4U0G/WbxOimHXrD/GKEVBq0XEgtq4vK+Zliyxc/kSSUW?=
 =?us-ascii?Q?4NDA5k2Yrotm+XndLfeQ/UKhPPtPnYmWEsIqvEmZIVlPs+qNRpvT23gfSyYF?=
 =?us-ascii?Q?jOcmNZ+IN239LHD4wlMyDLwBK/LGMetc5e8cnJEjsszCQt82DeZT9euOEiWb?=
 =?us-ascii?Q?BWv6eBh7YSjYC61iBMyb2fvV5gPQGuhzGu29ksB8yoiPFtQD/ugLCNJ8E3iL?=
 =?us-ascii?Q?swlEWlZTTHVqVXD3YI4ljlH4kMXrzWq5R5db7j6ZMkpdXgGye8LtbSELRfYv?=
 =?us-ascii?Q?V4/h7Q9jp4ZKi7zRgowD9dbH739mF3FWpSj6Ri0+W7wWcIymL0g91kj51eIs?=
 =?us-ascii?Q?gFNappoC0o8vqRYE5p9rxhjVq7f38hFrYou+fqujiqz76asjLMelEDD/3HoV?=
 =?us-ascii?Q?LtL2qAkBDf4z+DoTSwG+bncVPvQTcX4cIG/6vXkY49PNR+JTms5UKPKhMAY/?=
 =?us-ascii?Q?hUFi185lIzRwLY4leX+rIvuU2lC89n8axX3HoFgrcP08cy7C6GZGLYJpTFFB?=
 =?us-ascii?Q?ssx4dpygshEyQJL4qTL3uBJDxPUHG6FAiwoW/x++2owkODVONxcQRmLPZXbC?=
 =?us-ascii?Q?1OrIPT37zKhJBE/x9ARWZK5n3yWX4cSkMeECdj7kB8045r78bjHgD0EE6thZ?=
 =?us-ascii?Q?sVRpOqSCmLSASSg4VbH4FKjZzeI/bSX0+Eazm9M/sfAF6dqSqJyQwuqkVWS0?=
 =?us-ascii?Q?5oeaa92okYQZ3dg9Jwjr8sxpAjTLA4YrOIg4j0Jw8CCahCW+Q1wgylraPzZk?=
 =?us-ascii?Q?hga+ONgwMgOG+szSjpOBbWAovZ72kcELmyMrqlt9zrihBej19qGzrPTjePhs?=
 =?us-ascii?Q?HwI5X47tf4luFWHH81ZSlSC2doP6IENPHWIWDX+2ADqjMY45tOEYB72Gu3Qx?=
 =?us-ascii?Q?aq/rXaYGM2c1Cg4PNEBQm/NWLhIOX8J0w/44HxiqhzSviHLqcImQjegIoSOo?=
 =?us-ascii?Q?onXe3imVmiBebY2UlnMg/q2tF1V5U6ZZStqDRW9UtxMgR85mWVtboVEDgKBR?=
 =?us-ascii?Q?nbY74WYlrEwuVlisFjwmzBUUX1hncvuRvIt7riYcbRGGWhhiwM3H?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a93b7ff-e98a-4cd1-e909-08df307a8f27
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 20:25:05.7898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1SZTOst9iybrhFGBX/mRAUe5ZxUQ8hfZZBzpXJ+/dTzepMxGmhrpTnhNpgGYcdVl+7Ti0XysYDTSSs6xgQIxPAeXnmIJreV5Jg8gVwWRhwK+XUnj9ApaLUy+VKPK6Z9z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7967
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_132511_887879_021C6B29 
X-CRM114-Status: GOOD (  19.60  )
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

On Mon, Oct 05, 2026 at 07:32:49PM +0200, Francesco Dolcini wrote:
> Hello Frank,
>
> On Mon, Oct 05, 2026 at 07:26:21PM +0200, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> >
> > Add missing GPIO5 lines, GPIO_IO38, GPIO_IO39 and GPIO_IO40 are
> > GPIO-only pads fixed to GPIO5[18:20], their SW_MUX_CTL registers have no
> > MUX_MODE field (IMX952RM Rev.1, 2026-07-08, sections 33.3.2.44-46 and
> > 33.3.2.184-186).
> >
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx952-pinfunc.h | 6 ++++++
> >  arch/arm64/boot/dts/freescale/imx952.dtsi      | 4 ++--
> >  2 files changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx952-pinfunc.h b/arch/arm64/boot/dts/freescale/imx952-pinfunc.h
> > index debe6ede2d70..72cfe7893af8 100644
> > --- a/arch/arm64/boot/dts/freescale/imx952-pinfunc.h
> > +++ b/arch/arm64/boot/dts/freescale/imx952-pinfunc.h
> > @@ -307,6 +307,12 @@
> >  #define IMX952_PAD_GPIO_IO37__WAKEUPMIX_TOP_LPUART7_RX                0x00A4 0x02D4 0x05B0 0x02 0x01
> >  #define IMX952_PAD_GPIO_IO37__WAKEUPMIX_TOP_LPSPI4_SCK                0x00A4 0x02D4 0x0568 0x04 0x01
> >
> > +#define IMX952_PAD_GPIO_IO38__WAKEUPMIX_TOP_GPIO5_IO_18               0x00A8 0x02D8 0x0000 0x00 0x00
> > +
> > +#define IMX952_PAD_GPIO_IO39__WAKEUPMIX_TOP_GPIO5_IO_19               0x00AC 0x02DC 0x0000 0x00 0x00
> > +
> > +#define IMX952_PAD_GPIO_IO40__WAKEUPMIX_TOP_GPIO5_IO_20               0x00B0 0x02E0 0x0000 0x00 0x00
> > +
>
> Frank: the downstream kernel has different names, that seems not
> correct. A double check on why you have this wrong naming on your
> donwstream kernel is appreciated.

Add peng fan, this file should be generated from tools. It may use early
data base.

Frank

>
> Francesco
>


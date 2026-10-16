Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97ED4CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 10:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZYUedZXa28Lju+l9xb0vqn222/5sp+7qp3/akDhswg=; b=kSbeW8aDSjxl20dcJaOi6FD/b0
	xgyQGfeSrJRrFfmBlstu7D2urhXZmOqHFq3JeiA/zxbMjat0RxtOiUTbHTjvDlTFRznqI4S6sG76N
	q6mfPucTBSOa9o16Ddmy8+j83N42D6iRqoYJqiHUE3KGfVOOOzd/Xap8B4v1LkjTusjgEsetvg8Mt
	B8aoz+LrYtzFH1xdbKs8JL/HWEcdsNucpkem0CBTtd3/gFr94a0roM0yx2W5ZotnJZKT+9b4z0v/O
	2u9/L2C68epRttEJ1/onJn4FV7g2yt8wlik0u8BFXdVMAhtf979gvv1pug03Pvps9nuiUb5kNbSVr
	kl5TZMDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHexx-00000002aHy-08vw;
	Fri, 16 Oct 2026 10:15:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHexu-00000002aHi-48Ev
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 10:15:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rZYUedZXa28Lju+l9xb0vqn222/5sp+7qp3/akDhswg=; b=GcJqPnflwogYLSe6lC7Tpkn/me
	WHbKEh8d5vtgvX8UqU1Nx9vOGG34Moc0akKisAP31ysnaZJT3vpRfF0arkDJZlHFErczia6mRz3e7
	/H4N6dspSo8td6bUSDMpEdoRTfMpOn5NRCvTok6blPTk1baeu2GdjFD28f08YYr0I+ziyMcjPV2sJ
	lWRYvrIV5a39PwKOAs4nbLLbsJWggBj4MNSOIOQ4p62a52HO+XsLYfgYmjf1fWlp/h+JasZfS9Fhk
	oVIHIIBBIp8pjn+p+UqLZmogTJIuIbb3AduIcc6E6XJZkHZRRiCf+62FzNbDx+0/55PdCNCvAlLv0
	SoXnsRIw==;
Received: from mail-westeuropeazon11011008.outbound.protection.outlook.com ([52.101.70.8] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHexr-00000001McU-2vzu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 10:15:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VIoyUbYA4nlLUEji1GL0e31ceeqHzDKqFw//o5pB5gRI2c6liz6OAtd8wHUWXUWQ5gAM51QZh6PAY14lWfdjZgSaclI0s1cqY4hZy5Wi8veEqhdOmvyXYgtaA4YeivhR/h0F9ydM082nYzK7HIGD7NyzkV8muG20ct/wCCtubfuzWTZ6eV17QaS+U0FJel6xqacd1xgu9AXzZUIWYWq72yRSuu3N4qeyQoN/HpF+Piha8ItbWzjocMdcK/hZw/LxMGLvuWKlf+tX9MbdQV4m95JQw5AmiQyjliSgnsTsADg9/cH8m+6apjkwcxblwVf8px1pmGPkaqtnO+Ozv8IYOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rZYUedZXa28Lju+l9xb0vqn222/5sp+7qp3/akDhswg=;
 b=S8RkvAJqHoZBRwQ+mXtHQzyj5g21v0ZAXrO4giq0KTvVNZ+gEgKuRetiFyFf26cKOK/gIX+Q8pMTFkYoBbqwns2pTOvxojmBEtqADchrj9THUI0lpzAjJdvHRLEd1SJFPaXcNqHQPwPSf2NRAmSsHhSkCnds1DSP7z7oH92jiec5HXWclYRmNi1CWsaA93rNGyJJRMX6wFUCVTHVNzi0peFG4kzHH8shFOn8LbZ2WDKE3V532d1O6gp6l0UmA0EGJsKxPkXmdTE0dpnLZT0ChQHsq3OIonMMWaGSAQY1C/LDZLbjuYgwBYdhlrnx3C6UY2ou8b28cDDWLdSqYLtFJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rZYUedZXa28Lju+l9xb0vqn222/5sp+7qp3/akDhswg=;
 b=Bnb4MedLCEc3lRLUvpoOsAv00Wd0mdy89qXDvV3VM737p6zGo/ueeD/OCOeRISPkiChmOzLp9/GUuZuEBKw/6SCoujuensquVG205dCHwPEWpIh90Eh0AAAOQyj9hzZj3W/vdBf9zD9gnlCfiRmPaHn3cE4Goj6b8wlf3NtUmYvaHg45hDs+Qq740rL3t5UkVj9JrfDVaNQt4cLhhQufj9CAy4mBgGClGDntcDpkz5bWBU9nNW3S1HlDRr1ElysWkP7/o4pV2MVP8mw5xkcm9QNwgCI9OTjBMy/Fmzj58Uo5LbAujNalzFWHNSeAdKxGt4THtk/ANaE/729wKxnSCA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB350878.eurprd04.prod.outlook.com (2603:10a6:290:c0::7)
 by PA4PR04MB9224.eurprd04.prod.outlook.com (2603:10a6:102:2a3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 10:14:59 +0000
Received: from MI9PR04MB350878.eurprd04.prod.outlook.com
 ([fe80::8537:1cdd:6c49:6151]) by MI9PR04MB350878.eurprd04.prod.outlook.com
 ([fe80::8537:1cdd:6c49:6151%6]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 10:14:59 +0000
Date: Fri, 16 Oct 2026 18:16:38 +0800
From: Liu Ying <victor.liu@nxp.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH v2 2/5] arm64: dts: imx8qxp: Add display controller
 subsystem
Message-ID: <atH5htXNBjFYq6wn@raspi>
References: <20261014071657.118378-1-alexander.stein@ew.tq-group.com>
 <20261014071657.118378-3-alexander.stein@ew.tq-group.com>
 <atBLglf0gSLS7XkW@raspi>
 <atD9yeOeHZiKzhZD@SMW015318>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atD9yeOeHZiKzhZD@SMW015318>
X-ClientProxiedBy: SI2PR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:4:197::23) To MI9PR04MB350878.eurprd04.prod.outlook.com
 (2603:10a6:290:c0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI9PR04MB350878:EE_|PA4PR04MB9224:EE_
X-MS-Office365-Filtering-Correlation-Id: c0c54936-1b5c-4953-ade5-08df2b6e555b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|23010399003|7416014|376014|1800799024|10067099003|22082099003|18002099003|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 7R59r+HM5YhmG1V5eTW4p8UEKPu8zJN1j94QcJuJ5aIC5jflHSKzgsJ9+DtNVHtoMKmXfYaz9TXcmQg9r9J4uX1p90A/0f+nOa+huQYMA4C902GLFT+SX9gKK1Z71foi0nmN5nwvJROGrMOKJywSxNHspWmk23/g9n1b7iei4hPSsxAONLX4PAOUE20/7zo4SLbedc/CR5CwDOriNyQrtqk0YDmPHzxWRnvhU4LK7eg9bESoWbpxpg9lDfovMqH5Hkc7MxEYEzhiM0j2Kw0w2xEJBaT/v9YqOEAVWhxdjqHbTCMjuLUgbKcEbK7IFtUmoA+7tsdbIDkL9lghqTbKoVA+LndpOThqSXX/LQAL5bABU0UwN14tWQcPaHq8844fdw3iURxPP4osVEtfHCU7rY1id4IGDkesA7hYB/VgmT8F8xpB8Tb7SP7e2Z3e3caw5RA7XP6zYNg8Afwihh4BI8zrZAagzvY2Bcrc/dM21ySkUZGTo0eyZiWjEGuUny13LxlISMJTKspKXgsSCILaIAWCbaEX5AcCSHPXhgVKgUBpPVQz5Fi7oa1EgwpeMp658iSnv7ZcBKamSElsa7HGv9JxSmWET84jzYNNTB7KOVE0rcqSBAOqqmT/KOwNfvXUM3ZNgEMrGPatAxyExfbt1/+wo13evYI3ZB7UkxF9kOs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB350878.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(7416014)(376014)(1800799024)(10067099003)(22082099003)(18002099003)(4143699003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6XKOOa/UJIAa5BzT+6yLMRQO6uwWwG0QNIsLO856U3vW1sf1Ny/hCyId6nwF?=
 =?us-ascii?Q?vPYbRXtpLFuli38fB6b5tQJL2vzhTrQ2oCnwkfX+OVijn0v24i7j8VxpYTB5?=
 =?us-ascii?Q?IkL98WeUrE50S0bL8mInrya6mgTWZgGU/LLpxWIX3F+Ug/uIgYgsV1MM5GBG?=
 =?us-ascii?Q?8PtgF4LdZzjps3mt7Xm0UN+GCIwGGOvD0fLR091aI6avMU/BWdekWtJwPhxo?=
 =?us-ascii?Q?X9GO5pPvKwnv5e3H+rgqXvMRrAxhx7DzVn7EViMEL2T1U7Peo5RYO1yAu0xj?=
 =?us-ascii?Q?6ft+xvBHkdlLdmpVoX1NVHZ+dry81iC/iCZNHEuEP5xRi388OKPcPXW+oW8n?=
 =?us-ascii?Q?EOyLhQ+qAQUA9RYQVRWadobCQymGZ7KP06DVcMs66UEwDY2fM63HLyGRvdwc?=
 =?us-ascii?Q?DQRaGH9t+1Q+CtaYyp85WYxnNMJjIhIbJ2tYrd2Fx0uApQ2rJpm7zn7Mo0SB?=
 =?us-ascii?Q?tAeA/efDLbEXxfA+QLkjQTqifIx2vhR9bx05mXiKKVHuhfPPZVRLYMqGDH0S?=
 =?us-ascii?Q?AZ4toMM+HtQEdsEmswgnXQQWCOVXiXFlTQZKTN6BlQaoOWyYiyD1wfP0WjIY?=
 =?us-ascii?Q?KfuqveeQ6We1fhvdITV8Fq6P4v2biiLf+6o3tdZJXQuEGn2wL5lqn4DLyBHO?=
 =?us-ascii?Q?E5lBG5gsJqQT0ymIy8xO/642wrXPBMHqFLr9PPFdAbvFdh4q8JuOJlKsYLRS?=
 =?us-ascii?Q?dD8xaUj/pdWs+A1fP7NIEokaEmefBJy1IN7AezGiR+FaG7P4SEnMqn/f0SzF?=
 =?us-ascii?Q?YOmDheIJmgEqGyKjgnwB7dr2INyZv9C4+SpVQc+WPBuRlBnYjZjPdX3Xzh5H?=
 =?us-ascii?Q?82YPyDUHxA6ByY7iG5Ned78yWRbawdXrD2Ca4QUkxuJTPS85ON7eOsKlvSpr?=
 =?us-ascii?Q?9E4PvpWk2LgGz6nUg1W6mPQVgjeteSVKXB4MKcp5LgFiLf1gEqSPG7jIcVbE?=
 =?us-ascii?Q?R3c6rWuh4+aA8ckvhtq3+/nsl0LRnSNJtZ6jgrhb751zDnEMkh2sc8tuW8C/?=
 =?us-ascii?Q?bcHyXhaid6rmxqiI3mpUrVCKHNVFTAi5v/jtzRowUsg1IKhR4Qq8dO2ESux9?=
 =?us-ascii?Q?aJboF8+3ONEmx2YaiLtxKoGUwelcEmiKefOm+R3rp37BTcHofZfBr+f9FTEP?=
 =?us-ascii?Q?+Wj+PyrrUIdgExnSkTMd4P2UB4Yce8vg7GM8cQ6yl/m/Kip6GEYJup2VciB4?=
 =?us-ascii?Q?icwRPbVaufGaVKkwiR8qmVvck1mYLYKZrwt2BuApHeSmWTkcyU+crLAAsdi5?=
 =?us-ascii?Q?kjo6cfZfuHZBqkDy9Vsn9xLEQIfr4J764lboabkS7MK01GMEI+rEIqmLvPRl?=
 =?us-ascii?Q?5nICMNi/oWMAceJ7aYSQ9W3ERa48Ju0urB4WA2MlVraqVol9WeDdDP/dh1gv?=
 =?us-ascii?Q?SpLurjURjMEMNbNXlwZJpwhJhfZM3k/7m95JADXJ2LCdd9VMCchzAHaIooEF?=
 =?us-ascii?Q?tHkov3NMjS27AVg51QhKf2tAQ3bvKLJDa8Aq2DfICse30640ZBOqejdNVecM?=
 =?us-ascii?Q?l2Kqwrr6+Soy9kLQDMdo/g5Eg1wVlXbKs+b+ydkwdVGxopCKzyhKa+/VEPeo?=
 =?us-ascii?Q?IT+WAZ17P3P50he3OOGTTJAP2odTdbyq8qYvwg+FRKmN4Zo327NCtojvk/hW?=
 =?us-ascii?Q?y3Ds/dBrCe/qkuisgmDmrKqZE5iiYrZKZHzCWQram6cN7ktsFj8Vd7xfuoEs?=
 =?us-ascii?Q?ZxEvSflAD1yFFZnKACNm41TFkpLsSsUhm3NCHBEiXHlix3L4gGqrAGoWiehH?=
 =?us-ascii?Q?H6L4ahY41w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c54936-1b5c-4953-ade5-08df2b6e555b
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB350878.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 10:14:59.0387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4mQ6pkN1nQ/r3WCUObw1rlezkgi2/Fr59p2W/c0dWdA1ns8+DM3uZllhgv+VHY2KNOZikoTMZRhIZU4bv0qUgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9224
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_111503_909917_A410EEE5 
X-CRM114-Status: GOOD (  21.12  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Oct 15, 2026 at 11:22:33AM -0500, Frank Li wrote:
> On Thu, Oct 15, 2026 at 11:41:54AM +0800, Liu Ying wrote:
> > Hi Alexander,
> >
> > On Wed, Oct 14, 2026 at 09:16:46AM +0200, Alexander Stein wrote:
> >
> > [...]
> >
> ...
> > > +
> > > +			dc0_framegen1: framegen@5618d400 {
> > > +				reg = <0x5618d400 0x98>;
> > > +				clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_1>;
> > > +				interrupt-parent = <&dc0_intc>;
> > > +				interrupts = <28>, <29>, <30>, <31>,
> > > +					     <45>, <46>, <47>, <48>;
> > > +				interrupt-names = "int0", "int1", "int2", "int3",
> > > +						  "primsync_on", "primsync_off",
> > > +						  "secsync_on", "secsync_off";
> > > +			};
> > > +
> > > +			dc0_tcon1: tcon@5618e400 {
> > > +				reg = <0x5618e400 0x588>;
> > > +
> > > +				port {
> > > +					dc0_disp1_dc0_pixel_combiner_ch1: endpoint {
> > > +						remote-endpoint = <&dc0_pixel_combiner_ch1_dc0_disp1>;
> > > +					};
> > > +				};
> > > +			};
> > > +		};
> > > +	};
> >
> > I'm thinking that it would be good to have a complete display controller
> > DT node in the first place, including those prefetch engines attached to
> > fetchunits through the fsl,prg property.
> 
> what's current prefetch engines status?

I need to address quite a few comments on v6.
Some are difficult.

> Is it possible merge at v7.5 ?

Not sure.

> 
> Frank
> 
> >  In this way, display controller
> > driver's life would be easier - all child/grandchild devices are always
> > available.  I'm considering to adding a check to the Linux display controller
> > driver to ensure the availability(at least for critical child/grandchild
> > devices).
> >
> > --
> > Regards,
> > Liu Ying
> >

-- 
Regards,
Liu Ying


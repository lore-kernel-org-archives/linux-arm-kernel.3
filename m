Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17541606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 20:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wJPI+pbr;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=pw32fWz/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fQpfJHQUGVmNEY/l4tCJAsSay2myXs3boj7FROnJUuI=; b=wJPI+pbrSkQ/ZMwesCp7M3Twhv
	F8Kt6eS3dQG1zAw8Lpbr8RjsKI6/HU/saP9KS5q/iB1YnB02HuTVFyq01NDNonMRIinOaZVxhupB8
	my4rQKJRYkFVkVlikW5kuuXZEC5nGyMouayIGd3vxw/MKCX3uONMCCU4dwqMZz4bnBYWWXLicK+KD
	LNi41LPzJKW9mraZb1NksjVjc82EUdIobNzNDbF3E7tWi37lIOiEAY7WDd4xT1Us9ytC6Ac1A8wIi
	0iArJsYBiJOVZjD9/y77nhPr0F3/+hitiWp9SodUUd76QPJEqnDXJ2JFeOns47TfiFHb1RuLGRzYG
	Ohd0iy/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM9wd-00000007u9F-3dLg;
	Wed, 28 Oct 2026 20:08:23 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM9wa-00000007u8a-36Oy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 20:08:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TIjxECSLiZIfqtoW+Qn6ESAnIOQXN1vsMlWrQfeEnhbwVjPLKHHNzIwimVcQ1C/VTUvNjMOsW+1EZiDHsaIX6LyhUEYvEIjT/tE3TYPN4kfk+jMw89uNpFa4PzVczlKKcB35Y2s6REYJA2Il28SWZFdVBwyNx5r5Ei39fgOlgWjxvUOZIX6H7TjmLm4/CnboZZcc7IX6C9dNCa7mDacHYzNYrQab/6WW6UrDBKQgBsUCmJKG/NOLeDDBUdGDFOch6KZJvF6nQtcnPUrhav6wYsgX7LQhm3j4Ys/WhI3Vx4wr5O5wNddGOzgNQhRrSlW2RZT9wFu3COZ9TPAsVJ21DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fQpfJHQUGVmNEY/l4tCJAsSay2myXs3boj7FROnJUuI=;
 b=B2nXGJxxk8jtbt0MewcGqobMz+nb45CcCAJOcfiA8Ia8/qVCGyiKu7g1/JRCg0Ps8PA5sdXjlfHLp84SBXA0ucG3dmVWRAt/gEGe7V/jkNLBR4DzgpaFpOI4qCdHoIcm2NTAsZYza6T7hmGgGVrHiFmqicY+cWtDs9Tu3T3Sg3ojftvgxr2R90uM0/7SEZNuyOH1zmJqpzIr8X4+0wzmTebBuIyyHqxktPN1hXed08sgAsV/n0P7zcHYAgtkROwoxkIwmPuiZPdcbS3Z27EtsVO+vIb3P/B8kvpR+ceT1siF/PgDO1zJ/+4Kf4vCfFm1MGya3w1mv50NVojXcAYRFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fQpfJHQUGVmNEY/l4tCJAsSay2myXs3boj7FROnJUuI=;
 b=pw32fWz/ydhQxjshOX9bfJvZMg+Up2sLCNgWMUbeBXFaTp6S5DOQOBgdTPDHAUJ3LnOoLb8f/jkuhuHzjk3I+g7TBw552AHu7sGVw7CCYRKHCL0eArVciXBgOV1hyZo+Glf3OVPspwlIYsCXRdIgRvmN7RPa1pmOW/wQEeaGXEhNXt2bb2RkFO05HqelRFcWiRHJ+MBnUK8cOJRnpIXd2fTjHvZhT6WsAk9Gqk+1tFW/m34lHbQrvJE+uWn9c7PrD9qHNn48igePj+1BkWvhLgrDLh9//hE+6FBhsd1ec1Zkqjn2pVxhMflpR/G1jCSZIsRzmLfSTu8KAqKy5ms5zA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVXPR04MB913469.eurprd04.prod.outlook.com (2603:10a6:150:393::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 20:08:11 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 20:08:11 +0000
Date: Wed, 28 Oct 2026 16:08:03 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8qm-ss-conn: add usbotg3 iommu
 information
Message-ID: <auJWI1bqt4kX70pZ@lizhi-Precision-Tower-5810>
References: <20260720-qm_smmu-v1-0-3689fbd8b516@nxp.com>
 <20260720-qm_smmu-v1-1-3689fbd8b516@nxp.com>
 <b911ff91-ce7b-462e-a7fb-f8c6d682c85b@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b911ff91-ce7b-462e-a7fb-f8c6d682c85b@gmail.com>
X-ClientProxiedBy: DM6PR07CA0117.namprd07.prod.outlook.com
 (2603:10b6:5:330::32) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVXPR04MB913469:EE_
X-MS-Office365-Filtering-Correlation-Id: c785ebb1-d765-4d79-ee15-08df352f3140
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|19092799006|23010399003|261026121527099003|11063799006|4143699003|56012099006|261021121427099003|261009223027099003|261022075727099003|261022105027099003|10067099003|18002099003|3023799007|22082099003|261028144727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: PsrwILutSR4jkq0CaUTeWqLlYS5W5O/JzsIqoD0wIOMtdJddFYR1wrRem8yiXSwuD6/JxmAugAMhL++fekEoELeEq2b+SSMifUqBP9eYW9kU7LAHFHxQH/exRMk7mw5xXjW1Z9GhodMAcyvizlGlN6VrJFq0YkMe38+1hKonSogE3HoRnggR2UsrVlMj56ts8eFeldL4imdvp5KV0WAtTpuh/TtCV6CDOXLyTFcqS4upPVV8IJIoHlBV5gTLTT30ddrfgEHgdt/uVDdc7qicx9RF3psYnVf2hn0G8FqdFg5CNK8JeqgL4mqZwqlkFbNwDYMmDS8jTTOJU0mTE+2NH8KkMyddBQWWw0GZqiM/53HvnNB5//UOoBxzo0td8TiVKpdswXwehjttEpyOqVDqA3ndgRboZb1ouaey0ZpvMeTYnReRx48DOByNWUrSxdE1hBiRQxnrlRzDpkl01IEDd3rMw3aITFcmK51fCNDhUdG6lx/3ymyQW/aXwiKq0N2GNGvemV8iXUJreNTjaST2oXohPtB3bh1qUtTfhfDOQLP/2L15oSxcoZ0uD2OluOkiKtefYHAOyTj9F0zXG2PaudAcBo7YLEB5aY4kXstrrRMhsLiB1c5XHp7ccVRN/IE+DgwUOdAcV3pqs06HT9sGz6zEwI6ll3jMfuHaxdUQ7bg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(19092799006)(23010399003)(261026121527099003)(11063799006)(4143699003)(56012099006)(261021121427099003)(261009223027099003)(261022075727099003)(261022105027099003)(10067099003)(18002099003)(3023799007)(22082099003)(261028144727099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H292NMm9TteGo3S2y9fDlkjq/2BvkQyC4jeqrJcTbLyiRk8LKi3MvJsPAqcV?=
 =?us-ascii?Q?mopVyYo7cGdtAxJupLxe4mR2qXtREgU/+iJud/0Dnu7ZXMFSo4/qrcfe5wEN?=
 =?us-ascii?Q?OQO5mDACUQVhlJ1CiQQwGcdxiGADR01tFbMFT/SFDD68htHUMUpgdnJin4/U?=
 =?us-ascii?Q?PiKXGj4qG9Q310iG9hmD77T3nG2k11msV1Z1dcDchPqQvvHum/8FzOmaprle?=
 =?us-ascii?Q?NSBW9s7nyaFONf7JHkLBbpbBILyvknTz1+ppIzE2SuYhhUlFMGQJ8S09b5iY?=
 =?us-ascii?Q?saRLCt8NuugN3DnySnvpb2tv9rV1v7dCgGQuhrK80MzXsGHl4/rgm3CJHO/o?=
 =?us-ascii?Q?feCzngQyuU7u95pEOwNVmm5DW+YD6l4vl3Lij6RF2r2pSBUp3Jor8iSJ3/MA?=
 =?us-ascii?Q?QF1oIg7qxQIN8jdQMrFQ+UGom4Ag06OLUAGLT+lh9u2h6wB3BLlg1te1lcXK?=
 =?us-ascii?Q?ARfU+QS6OEfti4FaQz0wySrIO3tgtFZco8l8uxdSsbTDu4wGjnSwPbRVR2Ff?=
 =?us-ascii?Q?eOugVLNsqus69bptLW/ws99QhdyAzR8/i3dSzSoEudw317vzC5ElWl6Lexh3?=
 =?us-ascii?Q?/M/a4z6yZQvXtTcW1XjLnm+v1ED0p100ZDAMh3plmTL83ozzvVr7z9DmOOKx?=
 =?us-ascii?Q?r/7qE6TNV12y9damD8mY0kuex8FvIlP8MjPY/WULdek0CIbafjBHzVJTndop?=
 =?us-ascii?Q?A/4DMy190ClH+B1wxncZ/2j1htCb9FOU6pjC7ywpJVs+KhxA3KtdHxlNMNxV?=
 =?us-ascii?Q?fNbGekgohccGh0HasMkA9IK4KlXUlahGRyIgDMvjsIkHn0ITUQ1gyKICDzDf?=
 =?us-ascii?Q?VebaVvmh9bBE+OiGAk5q4Q/pmIvOJAHWRCxa1lGHhvTP6RfFDF7KpgWK8Cel?=
 =?us-ascii?Q?ZcfSfbAfKSY9iAJ5KSFjSVTOjrpTmG6wNgx47KNajbsUIJbXk7ogM2LQtWnr?=
 =?us-ascii?Q?wItGJLHBnonotkDbehVcpnr2NddPeWMMrAuQiavxUP9HqmQ+PQWfpAANLJV5?=
 =?us-ascii?Q?TXFcHjJBJGQdcc6btHbTfVcJu/sF699Ux8G8NUbxeVDhcW3G+VKWGI66JY9Q?=
 =?us-ascii?Q?EPfBW07+MIMKM5FQDOrmAJEf8Pl7Iy18d1rmaDuDN6ATMPT/F34oiUw0E1Uv?=
 =?us-ascii?Q?iCrOCxdXhRYIPtkbUtgz+n5fHeTFnA4gS7r++dyoTPw8rIr+PDdhctlThkML?=
 =?us-ascii?Q?R+T3neyTzRVTLIn4cSlPtu3mw7C3MyWDjPuKsENRe+ftd6YeQWcjng+54Eos?=
 =?us-ascii?Q?PvmTN/JmrpQ5omCPYMeA3Yp8Lqjcas8ZQilN6On0R9S1wcpGS5vpbiUcdUeR?=
 =?us-ascii?Q?cdMVKEafrpfjb23W/LMRtzRBp8VZ7eu37Ek8ibso36FU6g5wecrAA4im3DxC?=
 =?us-ascii?Q?dsSAs8beR6/SwmXPQYfgDqIhKzvDZBgQczBC8fAC/MEYpKeVCydDO6D6XIlc?=
 =?us-ascii?Q?JcO3pQCEp9vNiO1zQJ1SU3IaUfQMEVfMaazEBft5kI0Jz5MESxIgbF3UWV0k?=
 =?us-ascii?Q?7jwMVucwx1FURw6aMZkX+AeYjQ+D2uOR7q7RDhFOBBQ8DFSz/rILHqYsW67A?=
 =?us-ascii?Q?tg1Gg4fm3I7/tMlQZ/bPeB4qpzNL+TVR3VVXJXMH6xQ11jVrAlWjhKi+nK9e?=
 =?us-ascii?Q?1SSPMu4uvc6MDgLOvaHg+NFoeTEGHhEGZXegVY9xgH0YdnxW25w4ypKsBoDl?=
 =?us-ascii?Q?O0Eh4AMK4Qi1g4HMnGzS5w7/rXLMzogudx6sLTBoBRQJPelMffrbynnQHD+v?=
 =?us-ascii?Q?3iSqT2M9SX9IK2A9IUdvyVnoQk7OeFwQPtwIKe3pto6yJ1Lgf9Yc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c785ebb1-d765-4d79-ee15-08df352f3140
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 20:08:11.7007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w78gQYTeCe5xbqPNUFhK00boLR7yfNhcz5ghA7Wn6Mv9oLt+KanYZI8H2l92+ELitboMy8xSCzOhAegAgkYqvZMQ/b4T9V7Uc5AVoF1mmOLDn4MnIUyZEXCKX2jn28Ji
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB913469
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_130820_789328_CFB9C106 
X-CRM114-Status: GOOD (  20.12  )
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

On Wed, Oct 28, 2026 at 08:44:21PM +0100, Emanuele Ghidoli wrote:
>
>
> On 7/20/26 23:10, Frank.Li@oss.nxp.com wrote:
> > From: Frank Li <Frank.Li@nxp.com>
> >
> > Add usbotg3 iommu information.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> > index ccf9f510e0f88..1370a571153a5 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-conn.dtsi
> > @@ -32,3 +32,7 @@ &usdhc3 {
> >  	compatible = "fsl,imx8qm-usdhc", "fsl,imx8qxp-usdhc", "fsl,imx7d-usdhc";
> >  	iommus = <&smmu 0x11 0x7f80>;
> >  };
> > +
> > +&usbotg3_cdns3 {
> > +	iommus = <&smmu 0x4 0x7f80>;
> > +};
> >
>
> Hello Frank,
>
> this patch, now in mainline as 73c3b40e536d, breaks USB 3.0 on Apalis iMX8QM
> (both on Ixora and on the Apalis Evaluation Board). Right after xHCI starts:
>
>   xhci-hcd xhci-hcd.1.auto: Host supports USB 3.0 SuperSpeed
>   xhci-hcd xhci-hcd.1.auto: WARNING: Host System Error
>   ...
>   xhci-hcd xhci-hcd.1.auto: xHCI host controller not responding, assume dead
>   xhci-hcd xhci-hcd.1.auto: HC died; cleaning up
>
> SuperSpeed devices no longer enumerate, and no SMMU fault is reported.
> Reverting only this commit on top of current master fixes it. The other commit
> seems fine.

Does it only impact superspeed? High speed work?

Frank
>
> Adding the same property to the parent as well, like the NXP downstream tree
> does, also fixes it:
>
> &usbotg3 {
> 	iommus = <&smmu 0x4 0x7f80>;
> };
>
> With that, SuperSpeed devices enumerate again.
>
> Could you please take care of a fix? Otherwise I think we should revert this
> patch.
>
> #regzbot introduced: 73c3b40e536d
>
> Thanks,
> Emanuele


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3CE606A322
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 14:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tAge6EDe;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=kkSBIKI+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uEk9X6QMUSN/rscXagG88wCXX2uSzcyGqVNWVGM+tUA=; b=tAge6EDenVDIu7Xd3p/GUvCxvE
	XL1/ReDIvVlefwDia1Lj85HmU51rqYldx3Q+DSkAIrAxw8asXgFyKA2kl8bAZp7wJIOodA28k+sbA
	Hj/w0IMFJFzFtp2nVZwReRDUDKhP60eVeZVXs3H996wqtKLejao6BfyAEQFD4TbdSf1LUZ6OrY3PN
	Zw9/3bGuJgxxC/bvF8aBauU/bxtC53gO3re6/2JfYdqNHBRky5zOmhq/UkK6m4MukJxKty/tG8XTM
	U+bJ6Khryt1K3TCsbwdOegQGMJd3wLoMFxxZ+jW6GxrhJVjU775lYA3GfTdlpQSPsFohHwhwyfGti
	6+9HBePw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLiR1-000000054HQ-15VR;
	Tue, 27 Oct 2026 14:45:55 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLiQx-000000054GQ-3Rdk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 14:45:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R9B9P91dpzjnM6b5x6O+ISxREWiwLKYbJNxdsLfJMtKzVN7MiSPV7WikO149PQGMV5FFd08ihrnyDVRslp0bOm8suD/I1Ph79qpik8p7Cf9yhHtTCr0Qlij5UMkJt9fqHpJT9kGpYcyarftXCcyjj3FqYA2mGzajQRsIt2dDSpI94AIu+JLYkajkIEEFphEuj6CFqkqMHVyBSiMdveBmugcgMtLcbY/ktFq5tmu0Z8LxKB8jDeNbvGGK3uK2zvbiKv0Vq1DlHMmeefqUf6/bcXlgXS+iBJ6TutbDDPJvHOuUy3IJW0fdXnERvOKbrGLKiUUTJ9N3wKdzRZlGfnNrcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEk9X6QMUSN/rscXagG88wCXX2uSzcyGqVNWVGM+tUA=;
 b=vcwtMXJABAQlci3xWaK22VNAUn5XRhcbWjUJfMFNhkkqiJEtPL0+0VcmTBpuQsnXn6xljcVIBEHjrqdqugtkffbZsDV9Af1SbvIxwY2J3cRYm7qY3f7STndxrzHbosDDNGEHCsPZGJzCdcNwQIYtdrpzo92KC7dCBnQujanRaijvnZkuverEjtTG7AClqJoHDEJWYH5uamMVZ0wRmINZIvblqicCWGOwFe/5J6SowWMt7+OypKrnV2hW5rf9oFSCaAgT5uDHyUII8SupY7DJERBZzQc1b4ozYtLTu648njjItDWnSrDY6wfqeNdBRe+NaPV0ypPCQ69cpQmKFri83g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uEk9X6QMUSN/rscXagG88wCXX2uSzcyGqVNWVGM+tUA=;
 b=kkSBIKI+iUduJDtfd7S7nLrUgCuErMaQjjpgiY7W26YiBVX+TwQ3XMIV5HMdIAqKtZUZQefKHbU95YI+c8SuclSWFJS7rDq6y42MyQFUOsvIAS62w+Adn40BqREhbjH+L0rieG/44YnnoP6zVdvB3loWKcYz1kyyxJUFXfBF5x3nucFrAXWlH8DkHT6GYrE52vpvkAkRoiwMkQxEXxSRhSKIP0QgjwYqP/giXQMAvoMb17Mx76pdYbj3QBVrqaAhO30xH6ihutXnKt5hFB9NOlBR+73rdZ83lLXlfQNRZmy5ZYksddibC4q3usgDzixhv9liUL6eRH/0cEcyOlxyVQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM5PR04MB556016.eurprd04.prod.outlook.com (2603:10a6:20b:7d3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 14:45:46 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 14:45:46 +0000
Date: Tue, 27 Oct 2026 09:45:36 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Marek Vasut <marex@nabladev.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	Aswath Govindraju <a-govindraju@ti.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: imx95: Add support for Data Modul
 i.MX95 eDM SBC
Message-ID: <auC5EAZ2arNqdsvY@SMW015318>
References: <arvPDq8sjjv7na01@SMW015318>
 <49303872-5622-4e1d-8e1a-01394ec29367@nabladev.com>
 <20260930174413.GA2463938@francesco-nb>
 <ar1bhpji35CbArtY@SMW015318>
 <17f240e5-9c65-4562-ba51-535b0c69c5fd@nabladev.com>
 <ar19W4wX07p8u3_5@lizhi-Precision-Tower-5810>
 <4efdcea6-a099-46a6-8d07-dd5c583b962a@nabladev.com>
 <eca44457-d3d3-4732-977d-d30a408b7b66@nabladev.com>
 <at-0VK3LQ5c7rVmF@SMW015318>
 <8768c05d-417c-41c6-a275-33ac7f74e345@nabladev.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8768c05d-417c-41c6-a275-33ac7f74e345@nabladev.com>
X-ClientProxiedBy: PH1PEPF00013300.namprd07.prod.outlook.com
 (2603:10b6:518:1::e) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM5PR04MB556016:EE_
X-MS-Office365-Filtering-Correlation-Id: 97adb1bd-a41a-47e3-ee51-08df3438fbd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|23010399003|366016|376014|1800799024|22082099003|18002099003|261026140227099003|261009223027099003|4143699003|56012099006|11063799006|10067099003|261022105027099003|261021121427099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: hic682IdI0YAtuQFBL4rU34r6T91hKwr93MNLTQYMHDTLQkC6Xz5j5ksezKtK65MPXjLcWdMjVkPQ+Oqb7OFukrKyL0gNPRdXHSmcAadxOOD5NEd2QJ7KC2xZyNy2bg4FddP85ykyUTGuP50GsLd92kMcXTMhyT8mO8hgjoPV6Ns93+sq5GAZQhNipVTOTKgek4aOGDS4f3HADZZUn+jtfA8Dgqg/gZTWgDjInAf0A2oX70OMCXNqHliYLJUnXk5tTuFhw5cSQXbw/ZIGm81T7AfTT/TqMjJgfK/isENyAFCNkbyMHN3eBppA3RSMINnOO8RpsItPsAAivuTi+HqwYn2siIVhQ/f+rWtAvcOBagCb2w8MTG19gx76KieI9sRjSOy8p4iJegro08bM7lK+mpQadD6MUy2TnQZ/PlQ7FM3s4T5ldOJXDlKCkzVqffYySp2xSdrDYQUSWOVWTDPRfSbKqeqo4UTwdPsGdYpGB0sf7JjKe6bfv096XyLPitspeZqYn+x4IPWfiakFhomr4PUoJMZipJWLpxiu3P8zcrTiUjrRrDVXpdGJjDaAN/b90h/oolV+X4A5O5QV/D0pY0srKEPi2S/TsSk7J/bmwYBL2MTuCg92snVIOrD912l
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(261026140227099003)(261009223027099003)(4143699003)(56012099006)(11063799006)(10067099003)(261022105027099003)(261021121427099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m34LAeOP5zIPbxGNDB/kyu9gR0GkybqsiqtiLXgUzjiuJuZLnLhb/XJvc9Fb?=
 =?us-ascii?Q?MPGq+0iFz41KJbKbLbgJl1+QLr21RgA4MbxVuoxV59TBEqH2uD7GVwu/cqP+?=
 =?us-ascii?Q?U5mbUgtKvEkMPCnSCbIo2Yjwf0XF0KshpFTv+xzOqtTOlxIopFNTaZt3vn4R?=
 =?us-ascii?Q?gpqW86tDfNXF8u0DdCDZ0V6rE3gy04A5uNYyWkuVsPh+xWwEW4ASEB9m6Our?=
 =?us-ascii?Q?F1bViyBEOsKSbJcpHGIXtHKM3armaqcQxqwwEXcw873YIhlvJq2lJxcHDDeS?=
 =?us-ascii?Q?oqfaWb3NRR+NCx96Tl4WgZ8Bz54n9qCzP5tWfEAy0rhA07wEqueqImsa0c3J?=
 =?us-ascii?Q?dNCzBY4mj0h0kfsf0W6fimew3wMDAc7UxOhTkHabl1/pD0cu8ZeW2ZV/avkt?=
 =?us-ascii?Q?FJdTwxhIL1rgh9F3UgoD6BWtAoTs/jI5yX/QDmMSr171jayV+HDp5chJV3E0?=
 =?us-ascii?Q?PFuO+9wbP3T8YV1Yd7ZxOY9uWiMVI9IeVPs5XGzgSFCt5Q8g1uwQRgQOxGAM?=
 =?us-ascii?Q?PCW8+23NvUmnrkTb62YuVuOwhaFpKVa9M+2AAOIoT8xTqO6Tk7Q7rxdM26eC?=
 =?us-ascii?Q?1Zn9DxdrWvab5IhcGsYJWRId/u/uMJmiaPw5kYTJGclfASeHOXjoHkAcumMP?=
 =?us-ascii?Q?tA4ECSX6SDsnD3O35adJSQnMU+LrUteYpL9TBdmrc5RXutQw1NxAmnnq+l+w?=
 =?us-ascii?Q?a2OOkEo/CCUaJ/kTqFYGob0CAmWfdiw0OI+rGDY2fEj/Q86Stx+zqpNCKblM?=
 =?us-ascii?Q?AOG/dREYRj2mOeNCd0JodKvQvsaMIOLahZXq3mRxVAi1531MRNvIapaAlJaW?=
 =?us-ascii?Q?eHnzaCOta5+v91UpG8L9hPn9FsPAhhwC6vnyDWCWpfpeTqUjtAkQugC+7AMd?=
 =?us-ascii?Q?YiJZseaGjpHBCzm1ms91SWCs7AG5cAYUweKohzvbKOAPv1ZnTf07cfjye9hg?=
 =?us-ascii?Q?c8Q0JwULUsXbR5pj9Zt/pd+A/ycQwQnLpQogs33jolfQQQvgY8NsY4/s1W5x?=
 =?us-ascii?Q?DRfA6j4VzYPEt+8DZprsg2TufuneforqrNJFc42jOr4Np/04eV+CE2GXW+iw?=
 =?us-ascii?Q?syPksdANgGFS0w598g0r8W8OqedcjqYdBYRcYQqm/Hh5wiZOaz3G49WhioNa?=
 =?us-ascii?Q?FrNugSjLXrDJk+ucGB+BE9UEeA7R+2RXX1/v0G4XcyxY6QesGkjGVSRwPMU6?=
 =?us-ascii?Q?Y3EFVctjDSzhWZeNi3r/+s+F/3w8A3yLjIK04HD2v3rhlxdbZgkIrNR4r2dl?=
 =?us-ascii?Q?2/0JZYmvxQf2SKR5bWpgsaKQTep5RpyDn7anvwYpb0V7ZmZOq3thhtHTxWKs?=
 =?us-ascii?Q?yoyVBi5iAhMlSzOM0uWoOciyeWOlMj/IuZoIFHuJK5b0V9pV9t5l4gaynure?=
 =?us-ascii?Q?duvz4RID8BkAoIR7tevxd9c7ZDnwiws58fiGo+V0Mwddaw3NE279XYEnMNi8?=
 =?us-ascii?Q?AW20faYNypg6QIMDyvLgz/+gMjq/Qsszjhkg62CD3/RAm2TDyd8tlwtC+UZB?=
 =?us-ascii?Q?5wr73SOQyd2EkaCl7f45S1luhrlCjCMTjOhOQrgw2tuRADmfSje9ySEVDcEg?=
 =?us-ascii?Q?IJORtRn58hV2QzGb4FEMkaAD7QlLhja4Sr3L6hEbFM9gAp033b+YG1KsSYT+?=
 =?us-ascii?Q?DwTpMMaYF2VszgmNDYsB51P34RvlKh7JeTIdVipU9762Owhv7+sIdBVRi/lo?=
 =?us-ascii?Q?dxrHDiuDqqt8c7UB8IT7xjo9p+9vyRjkaMUheDpk6kdStW7icZqhNsCEaYGr?=
 =?us-ascii?Q?iItfTbSqTt65lyZNzG/XPOZAUr/MJME8ggr0AgWFFi0S4r76x6g8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97adb1bd-a41a-47e3-ee51-08df3438fbd0
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 14:45:45.9548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SZsjWwKfC7vfhFIUNCe0IhwL6i/nR/3JCEEWnaHx/jmrYtz8Nc8BVjmDb3xIXL+vvbpag8IN3L7XEiMP5wcOeSd/gmAGqU3VhWABN2fdJAsuhyR28kOaUmcxkMRZ9N9b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB556016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_074551_861015_F3A9AD21 
X-CRM114-Status: GOOD (  19.08  )
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 10:46:23PM +0100, Marek Vasut wrote:
> On 10/26/26 9:13 PM, Frank Li wrote:
> > On Mon, Oct 26, 2026 at 04:04:02PM +0100, Marek Vasut wrote:
> > > On 9/30/26 11:49 PM, Marek Vasut wrote:
> > >
> > > Hello Frank,
> > >
> > > > > > > So I suggest remove it now and add it when need.
> > > > > > Can we please go with consistency between these boards from one vendor ?
> > > > >
> > > > > Yes, I am keeping consistency, then ask remove it. I applied alex's v2
> > > > > version. I put v1 link to show krzy's concern.
> > > > >
> > > > > https://lore.kernel.org/imx/20260319125013.2421621-3-
> > > > > alexander.stein@ew.tq-group.com/
> > > > >
> > > > > Changes in v2:
> > > > > * Changed commit message to imperative form
> > > > > * Remove (currently unused) display and backlight nodes
> > > > I sent you a V6 with those nodes removed.
> > >
> > > Have you had a chance to handle the V6 ?
> >
> > Does first patch picked by vnod?
>
> What is vnod ? (the patch has a RB from the DT maintainers)
>

You touch PHY bind
Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml, which supposed
picked by PHY maintainer, vinod koul.

You missed phy linux-phy maillist and vinod koul. get_maintainer.pl

Frank

> >   dt-bindings: phy: ti,tcan104x-can: Document Microchip ATA6563


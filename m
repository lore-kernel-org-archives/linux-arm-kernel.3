Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E818DEC01BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 10:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l9qEg0HWniI5H2X6ihd2hYL4/0dN0x/02N2i1UwHvfg=; b=FzkyGAWSoGniOpjoNX0O4VJKqc
	PH/L6QG17BIhJDeW9NrK5oSYcHwoYC3sT1RWP3KY2CcRme5/ZjjWPaDkDVThItE58Qi7O37IFtgah
	NH9PIMcbgVd5nSirQDw/nc6J6aZDgWFn4yTU4d7BjNBrW4niJy/3HgEc7CapTgZYaaOqzuG5Vj262
	2Df649JqYGMZAK46V/4gcI/ORbhuHY+DKMt3gJjC+XdAG+55fTDBwZwyvZVMVZ5rvhCdht0coDBJe
	bIkw3GWvgCEuACCd9EbNt0NyiF5LdfbXGRhOQDkj6/vpZTMnbFnIEHaahVE5QXGxtzINdj9L+fne5
	TI2xlqgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4caw-0000000GWdw-0ROg;
	Mon, 23 Mar 2026 10:33:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cau-0000000GWdl-33A6
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Mar 2026 10:33:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=l9qEg0HWniI5H2X6ihd2hYL4/0dN0x/02N2i1UwHvfg=; b=YKYQ5n9LPuyhvTtkSD26nVldk3
	C97hARl6LLcRJqsBFgJ+lG2XHI84NZWAzkc7b+nlZ3nH5kLKeeZsxhz0YOmSEC+gr7+vOviawXEgy
	vMRI32SkrG4OLx/Q3GpcIv1H0bTcVu5Z5SoQQdWufUQqODcgzz3ByPSC2snA/bbBlqy6io4+u7J8q
	k9J576lHGDZBf/2VaE0kQyUkF0k882G2ArvRz4pm1PRSkEhva/VZeDQIMJnGc0k5LR8JwRxkTHMp0
	5wL4XQ/it1p557/KZJPvo76+9sSUNTihSbAXFYAGeaikipuQ/qEz+JIVOh+trwneE6nd4yxF8qy0p
	GHDgf3pw==;
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4car-00000001Evd-3PO4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 10:33:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XE6YSdwQqKdt6tR9bEHkuozf4nRAi02TjUyUxnSB+90MaCMKwPX1gX16rs5APvC0gwfmjNtu6Dt3dHeCJF3cbFfRH30E5A4NlF16luOtAozAl8Sylb3DVuOj+pOMEewr9ID42T5QbWGV4dWhlr19F0tmVKa2yFvdzRQyvo4I3xYzhVtIl+POAqPXbNrvb80huVXnnroI19s3xtoeKvqGgGrtdfxzoMozUSVTRF44ESRsOLh9BNlVv4yfmelVvtMBGF6IU2ycOmv0hpFqxNnjLAFKizUvI3vwwPoExsPKN0V1jFckcGMw/ZC7fWtRjOuWDhtPWAey4HEM9HwzS0ncsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9qEg0HWniI5H2X6ihd2hYL4/0dN0x/02N2i1UwHvfg=;
 b=ZRnYx/0ltWZaTITGklCzRT6+Psu1sRdwGWfdG6llf+vmhjF1ef/0T8oTx9kvH/k85ct4NcIkGxStpMHxdsx+SlBSX7Jrx5XrLw0IrAyyY32Pzntr4qsJkwSR42bYswGNx2lKMBBiVHFqDsz9n1AjYx4OJEHElH745nQhnhsQX3ZkgtFcy1i7Kqr26K/QTcQsNz9IkVGWfrKCErqxyEpZbnMEjyyeddN9ZbpmZrQWPORWDOae8GAIC8NRRqyn6y/VYZKplRtBdRfULGDM6nuA5Vdfzh6878402ElL5EQ8Lw/cA7xdjq3/qIMc1mylXk/P+LcX5S8bvEn4T5I/1Ao/Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l9qEg0HWniI5H2X6ihd2hYL4/0dN0x/02N2i1UwHvfg=;
 b=iGpXA1VKaZ5q6Jg6LREQtLYlpKQg8JCo/I4Shf3u4S177EzIc5VZrHfF9Z8Nfd3kRQ7QTIy6zmFTtOAjw2IsUqnlczunMf77m0bI9QbYnDLvrMk21/2gOkWXV8smUu3Sp909LHzvYZdRCiIQknvKcw+MQZmxwqREOuHXDWJE7Fyt2QeOYosrhzI7sEeU6s4kPrrhz8i155vPpxyDV/8xg8/jZgYVXRAwtnh2tp4gH+XKuTCkUlK/ypYEyMw4J5GTes6V9L+L2L0dmA5hQ1FyCdFGUOCyfrgLcoiRk6kzamrwU+x2fT1ENcuX3g15dgtzQZXGMXF692vg7f31NF3sYw==
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by GV2PR04MB12320.eurprd04.prod.outlook.com (2603:10a6:150:30a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 10:33:05 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::b476:c19a:24cd:3694]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::b476:c19a:24cd:3694%3]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 10:32:36 +0000
From: Wei Fang <wei.fang@nxp.com>
To: Russell King <linux@armlinux.org.uk>
CC: Claudiu Manoil <claudiu.manoil@nxp.com>, Vladimir Oltean
	<vladimir.oltean@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net"
	<davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>, Frank Li <frank.li@nxp.com>,
	"chleroy@kernel.org" <chleroy@kernel.org>, "horms@kernel.org"
	<horms@kernel.org>, "andrew@lunn.ch" <andrew@lunn.ch>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH v2 net-next 11/14] net: dsa: netc: add phylink MAC
 operations
Thread-Topic: [PATCH v2 net-next 11/14] net: dsa: netc: add phylink MAC
 operations
Thread-Index: AQHcuotUXzXWZtrvPkOHkUVrkHLQObW72lgAgAAO9+A=
Date: Mon, 23 Mar 2026 10:32:36 +0000
Message-ID: <PAXPR04MB8510A24C5ECFBEEDA27892E5884BA@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <20260323060752.1157031-1-wei.fang@nxp.com>
 <20260323060752.1157031-12-wei.fang@nxp.com>
 <acEIQqI-_oyCym8O@shell.armlinux.org.uk>
In-Reply-To: <acEIQqI-_oyCym8O@shell.armlinux.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8510:EE_|GV2PR04MB12320:EE_
x-ms-office365-filtering-correlation-id: ee039572-0fce-4cf2-2b96-08de88c78072
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|19092799006|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: eeBUSGUJuC85qnIILEtggGEVpZWWPCDqUrAMuu8lOa7vmQUtw1oJkUQ937iDna1iAWln13EFHDi5CLVtV4HJMrYRHdg4nHPktffDbl7u8dyI8uyA+fyh95CqCDAMmfiARNqMbKG+GCMAgdA6FuhxIGYc4tYXgL+QHwMmO+mVpeN1AOObr3EsJMTzlUkEtsaltLDB0Hn7V6R3mypSHQxqlBsFsiEiyFaMCgjAM/aSLQDziUjEe0Uws1kmc+iP5YsoCBQviNNQQjt0nTRIalZ947yfK1u8M7nRysYD2ludC/dFVwoLO4HGm/wH62a82RDYAD86fxZROT61bgo6Lk6Ad46yqriWsndsf/uo0GlL6WO9Khry1zPTl1qT1mCd4qV5hmcAxUgQIBFzIVBe+LEPR9RhMP/sgRdv6YMtx16jeCpnhcLf2KT6O7T+hRlWcnidQUBiUIasnUs9nLYt6Gu8M5+zQDMsfdBNRw6r64+ctFd+pb7h3oxRQ0XQ9AVh4PsQLGK4pKezE+RPJhG23+58urq1lDX4L2oXFB8+00eFIjAy2E1PyGNRVIA4Mff+3aMgJPbCbOSPj61JQG4XYPX8zt8GrUY1iuziSH/83U2799+be1MPuU89GBD6Os2f2gVFWHNMaUvxHq9CDDuKiIykS6+xKcezFlmI8+u/jwu14TcaXPDrm18EffStuFrOfaV+/WBnSx9GzqMvDdJfsEHLfOgjq3AeFIlImibsDCemROQQsHExzScHTHWXQOc+aP/wvPD5akaVWciVNT2sn73xrtd8Ob29B2PTSqed3cA693E=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(19092799006)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sZYWdCD8s9+mxTbzUnQGEm5b/Jgk7Lr9sVkAx8DXBBngQcQ7oPvhglNQMwHT?=
 =?us-ascii?Q?mQRGZ7AVobAVq31inG65uBR9cPMsT08N08qCWqqFxOUjCnREoaptkG3KVzp8?=
 =?us-ascii?Q?slUx6vIBpY1FVHR74RhGnJDFoS0C1WU5J5OoeAmFCLdY9QE6hAaCjp7eIYff?=
 =?us-ascii?Q?vpckxfB2KxnUZ3+I8vPg/64fFzxuCw2PO5u9uFP0uwPDK2uxmN8XrbTvSc8G?=
 =?us-ascii?Q?lO9zorzWYrJHULDermK6CwgPQ5+dzwkj8hFEopuoFPSqGERH0KnIbqG9rFtB?=
 =?us-ascii?Q?u5QpGmUaRlnaMvJR5iCreMToWY5tvxG72GG4wV0KxgjYDJSjVN08ZFY1+wcz?=
 =?us-ascii?Q?lCt9potm1F0rwsBxtfeFE/WrEbP/zHGbn3+xeN1uGTd7mMSChVKutHRlGbdo?=
 =?us-ascii?Q?8EQu1J0FJqE5sHlp/4tVR80VPAVWEpfuxohAaBTHmg69bx3yUZRHUKByc6Pr?=
 =?us-ascii?Q?BKVTmTiR90RmZEDUxyykTKVjS26UBg4cY8jPCXodvArYXLAgslBg7n77YXFe?=
 =?us-ascii?Q?oA7RYbmYhKvcDK5c3j+2F70ukcROc3JPbNozwjKjtFTBX6AdJFpyR3pRlEje?=
 =?us-ascii?Q?l6jacvVAk17lf8anqPVnS7LlsfIfmGhqJXsLERr5ohPtbLvR2fB21bZ3ICod?=
 =?us-ascii?Q?Aa55JQ86mLPDlIv+ev31seNlvhPYRjhLcgnVc9n+gIWx2l6cncCfvU06uXhT?=
 =?us-ascii?Q?wXSd67a//yAvHI4YFHrUyqfzF6SCbzAO2x3wHd6ZKfdU9dvWXQ/l2MTVHr+A?=
 =?us-ascii?Q?LXLJ31khjcsZByZWXhKL5Asy45vILmjYCPTT80cC1pLXZFqaQf4ET7c3QCZP?=
 =?us-ascii?Q?S3dSWn4T8jzM21C6AlBCASFEmsfw7ztJg7kBeQcY3qbyOYKqACA3uAgm1Y7i?=
 =?us-ascii?Q?Sgmh1IsOsHxPPFYBjxZ9Y3IFgK0hh4gzDfOnQLzEFlMaRHFZkw4cAM36ja7J?=
 =?us-ascii?Q?sT3BHGGqqs1729RWq4FLVjgFB2nSrASsjCdX/ThPeP0C2HIN1xZ/V2rbcNwv?=
 =?us-ascii?Q?hex6V4hrMs2oBv26CEsHtZySxwLKQLggCNNN8XzOVmFVxsodlEySxuKirA+S?=
 =?us-ascii?Q?hi4W6Pfr8Ux8FGeGFR2NClf7O0o1aPW1Z7ra6xoy3ny443IVtOw3FMqbYjMO?=
 =?us-ascii?Q?WB/2w1I0PvLZUigrwGezW+sQ0BWyoE6L52RsqgtGCV0Ygn8jtOtOio96H3lM?=
 =?us-ascii?Q?paOpEDL/99QZ0cih39vWwwgGA4VkX5DhybOlUrNRXA7NuUPQ+P+tQM6LYQru?=
 =?us-ascii?Q?7R8LIDKMKIAHk51BFT9xK3XcyiG0LuTesdNpdv+PCUSOJAT+oRocIO1VlWga?=
 =?us-ascii?Q?UbPWdmXOa++eD6qo32LI+j4wfyfwsCSX59ldI10vPgG+Jbk1m15Hi7hFmD88?=
 =?us-ascii?Q?JmxDCrK7mVmsYdQjvI8GaPHhID7O5/RtouqOeKpDO+FwT35w6aZClR1PQ1EC?=
 =?us-ascii?Q?B5cFNRR5Jc/aqD3qNuNS/OohpcQrimJgBm9MQEqTrmB+Np514RxyjJkOTW9O?=
 =?us-ascii?Q?Z8AYQXgjzHKUBqF53jMF0euq1hG8VZMIFb9bwSjEAuAmw/4Q00q/QFaCA7Rm?=
 =?us-ascii?Q?2REfODuQ1UzBGq4QHXS2VrfjVZfpwP0iRqgNEWA1JhEFZEWSeJ9GUu5PRieK?=
 =?us-ascii?Q?wh4OUhrUI6rndoV+xtFF+82yfTRu4Jk3wgf3xXSPn42q7IBqtscCJA7m04Vw?=
 =?us-ascii?Q?K+ysHmvI9TSzTEzzDizY/3nod9qjme6akI3PpKw7NV37nE0T?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee039572-0fce-4cf2-2b96-08de88c78072
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 10:32:36.7528
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d2nz3dWqBGohCPB3405cis7twHLeN90V4u0dZ8QbrKmDLUHVUeqAWfAo1v0vFg8TiSGuvi8KEUKVDUHmlTGldg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12320
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_103309_973870_498A79B5 
X-CRM114-Status: GOOD (  26.48  )
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

> On Mon, Mar 23, 2026 at 02:07:49PM +0800, Wei Fang wrote:
> > +static void netc_port_set_mac_mode(struct netc_port *np,
> > +				   unsigned int mode,
> > +				   phy_interface_t phy_mode)
> > +{
> > +	u32 mask =3D PM_IF_MODE_IFMODE | PM_IF_MODE_REVMII |
> PM_IF_MODE_ENA;
> > +	u32 val =3D 0;
> > +
> > +	switch (phy_mode) {
> > +	case PHY_INTERFACE_MODE_RGMII:
> > +	case PHY_INTERFACE_MODE_RGMII_ID:
> > +	case PHY_INTERFACE_MODE_RGMII_RXID:
> > +	case PHY_INTERFACE_MODE_RGMII_TXID:
> > +		val |=3D IFMODE_RGMII;
> > +		/* Enable auto-negotiation for the MAC if its
> > +		 * RGMII interface supports In-Band status.
> > +		 */
> > +		if (phylink_autoneg_inband(mode))
> > +			val |=3D PM_IF_MODE_ENA;
>=20
> I would prefer newer drivers not to use phylink_autoneg_inband()
> anymore. Note that there is no need to support RGMII inband in the
> kernel (nor is there any proper support without a "phylink_pcs"
> being present to provide the inband status.)

Thanks for the info, I will remove it.

>=20
> > +static void netc_port_set_hd_flow_control(struct netc_port *np, bool e=
n)
> > +{
> > +	if (!np->caps.half_duplex)
> > +		return;
> > +
> > +	/* The HD_FCEN is used in conjunction with the PM_HD_FLOW_CTRL
> > +	 * register, which has a default value, so currently we do not
> > +	 * set it in the driver. The half duplex flow control works by
> > +	 * the backpressure, and the backpressure is essentially just
> > +	 * a long preamble transmitted on the link intended to create
> > +	 * a collision and get the half duplex link partner to defer.
> > +	 */
> > +	netc_mac_port_rmw(np, NETC_PM_CMD_CFG(0),
> PM_CMD_CFG_HD_FCEN,
> > +			  en ? PM_CMD_CFG_HD_FCEN : 0);
>=20
> We don't support half duplex backpressure in the kernel. I notice
> you always enable this whenever HD mode is negotiated, which means
> there's no way for the user to disable it. Flow control can cause
> problems. Ethernet relies on packet dropping for congestion
> management.

Okay, make sense, I will remove it.

>=20
> > +static void imx94_switch_phylink_get_caps(int port,
> > +					  struct phylink_config *config)
> > +{
> > +	config->mac_capabilities =3D MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
> > +				   MAC_1000FD;
> > +
> > +	switch (port) {
> > +	case 0 ... 1:
> > +		__set_bit(PHY_INTERFACE_MODE_SGMII,
> > +			  config->supported_interfaces);
> > +		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
> > +			  config->supported_interfaces);
> > +		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
> > +			  config->supported_interfaces);
> > +		config->mac_capabilities |=3D MAC_2500FD;
> > +		fallthrough;
> > +	case 2:
> > +		config->mac_capabilities |=3D MAC_10 | MAC_100;
> > +		__set_bit(PHY_INTERFACE_MODE_MII,
> > +			  config->supported_interfaces);
> > +		__set_bit(PHY_INTERFACE_MODE_RMII,
> > +			  config->supported_interfaces);
> > +		if (port =3D=3D 2)
> > +			__set_bit(PHY_INTERFACE_MODE_REVMII,
> > +				  config->supported_interfaces);
>=20
> The "case 2" above already ensures that port is 2 here.

"case 0...1" uses "fallthrough" instead of "break", and port 0 and 1 do not
support REVMII. So the check is needed.



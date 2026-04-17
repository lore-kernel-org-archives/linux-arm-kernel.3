Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0F4F43688
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 09:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oY60FxbzNYWvAAAr+KW2arht9w3FzzsUZkx+BrLSXEw=; b=N394lYefLWHu7Br4bV4+CdiVV/
	AG/e/+DUCWzpam+9gJMKHFjrzrp4je3COy7sHCrDW6o5G4/tk8BExbxiBQfSNpWw/xqCO/qpw3X8j
	jOlrAz1B+4mkodJv+7WukGtjKGfrJw76nhShfXmRbu6ETrjMZEx4Xq0M0FpEsy/n7lF+VavoiUA/y
	J/YvlA9XE31XvUbm3FXLaOpvNU+SkhxNhPdiORlmudn2iF3gA4dC3fVl+K1tSG/XQPFXNYCTc3CbC
	RTilchj2ssF4FDks5JG9eQE+wBzMZPHsXDcS3kzoRjIyJHvjuk87kvyk1qheet+zJffkGFzqD3RyE
	u8RXMzhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfVB-00000003ou9-1eNk;
	Fri, 17 Apr 2026 09:28:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfV0-00000003odc-1ZCx
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Apr 2026 09:28:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oY60FxbzNYWvAAAr+KW2arht9w3FzzsUZkx+BrLSXEw=; b=lOvWjfBqFNJ9Jw8Ku/BeZuVx6L
	EuUn+eWut7KjBd1ST5I1Fxh//P8GV+xxvQrswz9XD/FLCMlpuYY+5fs1+sAa9t3Nb2AT+TJjG7MDa
	WKC0gT6w9NPbDTv6WZkszvCXqTZJq7yZ3IRCR9udABnckHbffIJes4Grk+TlmkdA6oitNDuM0Y6/R
	2jsPTTSWBEnf4Pxn4EYtbUfmdi5Kn5ZNMOcMC4LtN35Wu1xwNDaN4gP1g7ksOifRKC3zls9/tByVd
	jamJzOGl7rDDjpp2JvUyjeliDjbmHvmHbqGt4EiqtZ4YAoTn87gzIq9g3OOG+rrZaiS5A6EPuE+Aw
	2qXcz90g==;
Received: from mail-norwayeastazon11013020.outbound.protection.outlook.com ([40.107.159.20] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfUx-000000054rp-167T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 09:28:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qalZssWHMJqtfpBomtpCVwHZl2o106Ygi7WTPL7HUFB24aMSiHcO2wC8H+XkkbvclPOqrLzpLPzsreW8oU/mVaARoOEj2ia7BOTBJZFACTvfHv87or5I55S660x+9LuVYks7cUo5diNY17j6TsBdHLg5H1CVUyXU1Zmmmau1JcSwN3gvHav8vQcANwAMRPHfEcHIm0ewgqaNEPDToU+hJWaLETVYf7flIww1fwCe6zrqxcd1592S/Lc9jHsUFAhKEiB00opPj6g6EmRZuG5Stk7mEcDH15oHsveunjj1nG8BE2oyiV3UkTQPuDRFFux38ky+VGkLwhmR1bVn+O1RvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oY60FxbzNYWvAAAr+KW2arht9w3FzzsUZkx+BrLSXEw=;
 b=rPGbxz8t/5KSoXLIUgGqsbKsE2Uez7ugYpqSNrgG7sX3G8mBoOLdr0ixO2iu0+R16nB3WMFc5oLALeXpp2+XhVMpgaboDo6YGKU5PMCn4kF+tAuNUGeEPh56z7NcDKOcHck3AfnbzorYMTFZPZzjPKm/6OxBuwhG2jqTWC91OEIQkEUq8pEVIG1LgoqF1RxYhV70KYdAYCv13DwWawzzuicjTvsXbNolh2lJWvxJZO9QN08bqyo+KtDB0PHorGOyTuoRV4P3Bo/obLJYjaWrTAoFJna2pv6g1UzFQA36KQkt13FGVPi/F+c1JGsXr+w6PMwOIY1x+ulIFZuMNLoanw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oY60FxbzNYWvAAAr+KW2arht9w3FzzsUZkx+BrLSXEw=;
 b=R45CJ8GNLiQaOrcP3AXjyNSR/EIOY0NlLV0eoGl8I/lEj9t2JgkhSEG0Kelq6BGW3CuAPvLPiOrk/vN1O1OXlKyGfBtwliZiyZRRePcSJ1sQnfHLCreSP4+LnSEoqaCvSZdY4qrnjO0AgAVzyowUrlDVXU8ktd1A8GxbPWmaCNpET3mGjhBnYoycdljJAaADj0m46FoXQG5QvahbGmljHRog/yNSU7YyQoUNp4OTAqNsOE/NqeaycPEImdJg5hkUgFGxGf+/er9qeugAo+VcXoU2pIpSuHgkR9I/z/v3ZMW8H+VmFaSC8yTdZmDy/t2ZAsnN8DMml5E5TDk9bgeL4Q==
Received: from AM0PR04MB5220.eurprd04.prod.outlook.com (2603:10a6:208:c2::19)
 by GV4PR04MB11941.eurprd04.prod.outlook.com (2603:10a6:150:2e8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Fri, 17 Apr
 2026 09:28:20 +0000
Received: from AM0PR04MB5220.eurprd04.prod.outlook.com
 ([fe80::cbbc:93fd:f7b0:76e5]) by AM0PR04MB5220.eurprd04.prod.outlook.com
 ([fe80::cbbc:93fd:f7b0:76e5%5]) with mapi id 15.20.9769.046; Fri, 17 Apr 2026
 09:28:20 +0000
From: Hongxing Zhu <hongxing.zhu@nxp.com>
To: Peng Fan <peng.fan@nxp.com>, "abelvesa@kernel.org" <abelvesa@kernel.org>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, Frank Li <frank.li@nxp.com>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "imx@nxp.com"
	<imx@nxp.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>
Subject: RE: [PATCH v1] clk: imx95-blk-ctl: Fix REFCLK rise-fall mismatch on
 i.MX95
Thread-Topic: [PATCH v1] clk: imx95-blk-ctl: Fix REFCLK rise-fall mismatch on
 i.MX95
Thread-Index: AQHczkP/2tDj/rWRvEKEo2F74GRsJLXi+qSAgAABwUA=
Date: Fri, 17 Apr 2026 09:28:20 +0000
Message-ID: <AM0PR04MB52200085AA3479D659092AA38C202@AM0PR04MB5220.eurprd04.prod.outlook.com>
References: <20260417082910.489995-1-hongxing.zhu@nxp.com>
 <PAXPR04MB845979CEDF7426A07BCB6FA388202@PAXPR04MB8459.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB845979CEDF7426A07BCB6FA388202@PAXPR04MB8459.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB5220:EE_|GV4PR04MB11941:EE_
x-ms-office365-filtering-correlation-id: dbed9715-85b0-496b-5013-08de9c63aa14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|56012099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: K/dLvojQt/YbmXoxTx/dyxtq/J96O544nXdpQ1edu5cD3nYWJfVUXSnczxFRMYRZ64MykV/mZClvLiggMv3OmCfpRVtQH0B+QhQYzroSkveUXa4bPqCDJOWrZ5PFKqR91Sp0L1NmxUCGClhMEhOrVmzCsudzdPANJo10AfqB3t5Ck4POtZIFmh38wAfvUGFP4xsDT/TxQaJZmYpb0UIKs7UMyeyoGTb9V3As3sC10pFKhn7WR5jYKAHxuxG41rOew1r50F6jokm3zEkItVNUIMtJ4oyWXwiay1FXUwvXotIpQ5cRa6l/jaioJx1TN9Ws+PlQkLvkrActgod+cjOipvjum/LitdiZTkmwyggoCd912kBTQipJZPTnQQWEUF6w6yCK1WHtTkHq69+VsYzHOndDh153izhFGcpDMETLyHJbJCRAx5XLdcj106QNLej6N0zMlteotogvSRfI5a+iSI77Rm5q0akAqS7yDDarjBua6KwwAigxcFrUkFfyrwLAMO3HA1She9EV826HrjiLWa1LfoW6RnwG/oekAr0atwgMDyJOQrEEmUIVTEemqsxG2ah91urtnyRPa87EdAp8RHGEP3kyLEQCt6l+VnBuDywIDAl+4N9Cj63bCL0VfK4vDsM/Fi2/cJOxraBiy2jQBOqY15uShPGG6H3Th5+BSO9UEY9utyQ5kGb+6Jfos27Q4WolWGZ9qkNWnsIhsXw98TpfGfURwgw28Y41eSY7cVOLLmu0qZvFqMLuAWwYKl7VcBP55wVdKGatxBwY0BIb0QjCWuZTJdkTHlonqUoOGZw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5220.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(56012099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gafAdcI/8h0ptx6mbSzmq5+eC6QHWjz2adtkumdnNmJZO/NRBMMYRw6rBCdk?=
 =?us-ascii?Q?oCG4Wde8MihwJTDQrM1kY1YJ5XgVutfH3AQREqcYLEJN5RVoddJX4/5WbalF?=
 =?us-ascii?Q?xZr35pz3Ev2bt73HCEterlZgvpDlBAYrxSbaYUN+c8VylJySlCPDcHgve3DW?=
 =?us-ascii?Q?zw3HLfv3S0OVXgVAAVTI7Uj5p6lIhq/HA35TDxf7R2IjdR5el4Wq8PUIB1uk?=
 =?us-ascii?Q?cjeXMp4o2wG2qohIeByOSB8HqeRO6aqfjqKEyNpuuyxMq9j4TeD63Ays7EIM?=
 =?us-ascii?Q?rErM/w+TXYhjvt6ODXqFMwNyIbPAFm+nNf6Kpj1X1pJe+0KFPMpZP+0CFLOR?=
 =?us-ascii?Q?HVUkB/YsWwLu+epGCEEfxKHtVLKsMRCwIDe8VAANkBxtxlpvqHH3cb61I8Wm?=
 =?us-ascii?Q?CEN8YWObfPcy6CYfN6VtdpxjgzX7VMMsc4IkgMYp569CwoTeFpqndqWvdT+a?=
 =?us-ascii?Q?x87OGGC5qe/oFoknCk1sLA/WKZSBZx86LaOTaPthH/Lc0hZViDkmErLHWNs4?=
 =?us-ascii?Q?Vnp1IxDL8PXShm6jD9MRZnjJgLi9GqQgwxkC1lNkjAnh6Tr7FAuR7EJYzk/c?=
 =?us-ascii?Q?v0z7k1TzHQ7Me7/GxhI4z7qa9UVYEVrXB5QrwCWvMiiawVJb/vYK5OALQ5ry?=
 =?us-ascii?Q?zDOX0rExrcFKS8d3zvbL8wRDDxCDFAH8Dn1lkbP/ABYmeZyafEVESp4Tl/XZ?=
 =?us-ascii?Q?uebI7TZxsyAe90AnjS9CESB8bx8O7EgWt+JiSzLrINHFyiFnQHMMN0+EdJQ3?=
 =?us-ascii?Q?vJX7ZbyXt9q0d4unVCJvTWCCGsXOsMGBurfz68Qt8tusy/5k/gjwqUIotauG?=
 =?us-ascii?Q?cogEzNNx5FQsvi73jWHKy4vXMqUEqMdlktiggAHfXEcwgoRu3tRVbnyRrUaI?=
 =?us-ascii?Q?olIPGA4G5Ay8NRhV52FPuvqU43Q9NjfotbCmSuDckSLQNiaFP9Qwe0h2ebbV?=
 =?us-ascii?Q?m5eyoHeGT7ZY7UV5Xdg7idUoPizs9I8oBUbFeaLAIFMVHOdEw9yPXpA1DE0y?=
 =?us-ascii?Q?4afxuFeDClY6W5g4DFsh5EYJDYLBG2U2Jjb955iatZz7UQbzXuXbuVP0UHwU?=
 =?us-ascii?Q?MWyOxr4BygzRht6AAA/NzgiNz9sIFGWWt0m+Bxva3GXRVbxRRkunmOMlrpcI?=
 =?us-ascii?Q?hGej6miz9kvGwzLhj7qO/nqivh8leOAZGjzQx5ZC9GkkqRllbdxc11aJBVjF?=
 =?us-ascii?Q?2C0K5YRe4hruKE5pd7WMGj1wZIgv9K6kT8BKQ+rK6bLwj/N8FaVvNoOdd2kJ?=
 =?us-ascii?Q?yWIcY33tUpzN624jNqihlU5sl15kNeQscVPzoc+lN+lZQE+LwCA0JCvq7aIc?=
 =?us-ascii?Q?SA1IG+e7KcLdr6UMtUtBi3mtTxdr0ymric9k3u54plby6R9c9n4lPSylYr3y?=
 =?us-ascii?Q?CaMPfkXveCv+xbbFhAw8cX4GkCxOVh15qYeGwP3ssvR48tY9w7v0QT+8c0Yd?=
 =?us-ascii?Q?16PkDj2Oqwjp71tqk6NKirtLIWCsLlcVnJWHbSaqN1nNftc704xq+UyNHGMj?=
 =?us-ascii?Q?mL1AyJ4Fa250CuH7nqqv2lLFtn/ov+mowBnMlVrHYNrbR3jZyTjhVFpWwID+?=
 =?us-ascii?Q?8y/q9TxoPfH+CeKwiOiqXr7yj1OxTglr7rNYe0eyxeVmuKINHuBqncdLFi1C?=
 =?us-ascii?Q?VZib8fblVVT3Kg1PoiMCXbdF3aiCS8vbxEZT6zmAZ73jkaB0lrW89rKMQY7W?=
 =?us-ascii?Q?SrFDs+uzotkq4DER9UpV3+T9G2/lrDIKzW64v+PwGzCRMnhk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5220.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbed9715-85b0-496b-5013-08de9c63aa14
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2026 09:28:20.1746
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jNILUaifM64oDVSFHACNQLCUQ6d77xuUXRVNSpCToEAXP+FtKy+m55oVuh4u6e9bCKfYM9ZOlof9Vi0ky/YBhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11941
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_102827_420256_4BAFA6A0 
X-CRM114-Status: GOOD (  23.62  )
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

> -----Original Message-----
> From: Peng Fan <peng.fan@nxp.com>
> Sent: Friday, April 17, 2026 5:22 PM
> To: Hongxing Zhu <hongxing.zhu@nxp.com>; abelvesa@kernel.org;
> mturquette@baylibre.com; sboyd@kernel.org; Frank Li <frank.li@nxp.com>;
> s.hauer@pengutronix.de; festevam@gmail.com
> Cc: linux-clk@vger.kernel.org; imx@nxp.com; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; kernel@pengutro=
nix.de
> Subject: RE: [PATCH v1] clk: imx95-blk-ctl: Fix REFCLK rise-fall mismatch=
 on
> i.MX95
>=20
> Hi Richard,
>=20
> > Subject: [PATCH v1] clk: imx95-blk-ctl: Fix REFCLK rise-fall mismatch
> > on
> > i.MX95
> >
> > When the internal PLL is used as the PCIe reference clock source on
> > i.MX95, a REFCLK rise-fall time mismatch is observed during PCIe Gen1
> > compliance testing with the Lfast IO analyzer.
> >
> > Fix this issue by configuring the IREF_TX field to 0xF (15), which
> > adjusts the transmitter current reference to meet the PCIe
> > specification timing requirements.
>=20
> BLK CTRL in HSIOMIX should be save/restore for the settings you configure=
d in
> probe phase.
Good suggestion, thanks.

Best Regards
Richard Zhu
>=20
> Regards
> Peng.
>=20
> >
> > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > ---
> >  drivers/clk/imx/clk-imx95-blk-ctl.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c
> > b/drivers/clk/imx/clk- imx95-blk-ctl.c index
> > 1f9259f45607..bc6957299cec 100644
> > --- a/drivers/clk/imx/clk-imx95-blk-ctl.c
> > +++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
> > @@ -44,6 +44,8 @@ struct imx95_blk_ctl_clk_dev_data {
> >  	const char * const *parent_names;
> >  	u32 num_parents;
> >  	u32 reg;
> > +	u32 reg_init_msk;
> > +	u32 reg_init_val;
> >  	u32 bit_idx;
> >  	u32 bit_width;
> >  	u32 clk_type;
> > @@ -289,6 +291,8 @@ static const struct imx95_blk_ctl_clk_dev_data
> > hsio_blk_ctl_clk_dev_data[] =3D {
> >  		.parent_names =3D (const char *[]){ "func_out_en", },
> >  		.num_parents =3D 1,
> >  		.reg =3D 0,
> > +		.reg_init_msk =3D GENMASK(10, 7),
> > +		.reg_init_val =3D GENMASK(10, 7),
> >  		.bit_idx =3D 6,
> >  		.bit_width =3D 1,
> >  		.type =3D CLK_GATE,
> > @@ -410,6 +414,9 @@ static int imx95_bc_probe(struct platform_device
> > *pdev)
> >  		const struct imx95_blk_ctl_clk_dev_data *data =3D &bc-
> > >pdata->clk_dev_data[i];
> >  		void __iomem *reg =3D base + data->reg;
> >
> > +		if (data->reg_init_msk)
> > +			writel((readl(reg) & ~data->reg_init_msk) |
> > data->reg_init_val,
> > +reg);
> > +
> >  		if (data->type =3D=3D CLK_MUX) {
> >  			hws[i] =3D clk_hw_register_mux(dev, data-
> > >name, data->parent_names,
> >  						     data-
> > >num_parents, data->flags, reg,
> > --
> > 2.37.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380B8EC01B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 10:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hkeih7pufrw+pq0tKoeFUy3mK/ef0w38zDphdZtKitc=; b=ZfFs9hxnP5gbQIt39dANN6EwzR
	vy1Iq1C5OXxa/aq4m3V1k/Lx4KAksMeSRvgSe/e66mg+qlmPZcZKMfYC8TNP+zMfLeFgxxqi/pZV5
	rTEAq2oPKkoM71G4cvGAcf9EUrCMSq8B3U5bU/2dK2jN7BGZfuSM5ejy+aqg6JulYu8YPEvNYP4WY
	WWYbo5dylP4koJhm5ZJ2fSkaYUkv2IbRUQ40lWNA50T2col8Mq33OZ9VPxxx/kSAi+RQP6HMO7UYy
	Tz2t1CY8tuwEzs2Az4oLvxOKlz50qAVXX1dFLXRaLZOtIfJoe4N9sUxMNtDfd55iDm3ejktVOO37Q
	dH7182UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cPX-0000000GUtT-2EYM;
	Mon, 23 Mar 2026 10:21:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cPW-0000000GUsQ-1eJW
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Mar 2026 10:21:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Hkeih7pufrw+pq0tKoeFUy3mK/ef0w38zDphdZtKitc=; b=gwL6kIUE/vcXOPw7gazGsFUnSW
	6cqSouR2PE8PRSkD8qhZQYh0bnL0Lm6VhZSUjhgH9RWzFtnk0w0iDwu4BFE0GmAKbpEudCO9zWnrM
	t79zMwQsBHmhXnz77tY5VejBbGF3AqWKUa6CkuubLqyFEJgyUv1mXnspJ/97ixUEpvwqRaXc/nOCN
	3l8wR5F/sFSuVM8nbVB0wef4xQdsNMUZufbcb6pt4KWIZFCJsmqu5LNXLUngKh9u4vadqPkNnNJ4I
	2MQOnlrG50omYZLLu+mVeYRu9ZTMCFBeDTdqLDf9ruQoIafm9u5P35z+J93pkmFgtCty6B/wUtNlt
	hDl1cJhw==;
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cPS-00000001D61-1Y85
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 10:21:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VJCpdBVZg9xav4E6pYxSfXypQriOp1M9QKQEpIx19635cwNU5X67g/wN6BDdYT1gW/ukAao5idusk7GJHaZLeWFMgfzTBG/CVvTEXTMNp7UADapWufqxvu4qhbMrJg0F9U8bIce1Oab1ORKfuBPDmYOOPWpO0eBni4y+OOpByFnTgo2mHJkjZGCqqftRRCTzOCH0STrdnPZYuBqW0jsirrUfPWj4OfgQrW7oavaCHRWiSGeXxbOIYH2wpUicy3Is+MC3/wGmnf3gtdEVAtCpHMHW66cFJtWPu2nNMttupLi+Vi1mHK3d5HCciDr/lHPMuxXYVjAyBrltsyzQi/sbpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hkeih7pufrw+pq0tKoeFUy3mK/ef0w38zDphdZtKitc=;
 b=ypRcfI0ipb9nhA+ouEC2xy9ZWidDQkNNvMRWYtFCQVXIt/sUg+81wBW3Vrtejb9oKxYdQjqY+yglBHx/FnSU0TAmkN83E4gyrOtLPYV+niNTYyAii63WikjZSb8YXMbwqXBHRyR//IYbk73W5oqC1HBdfoRQ0Cx4gY9oksj8HaILk2OS3u7uAKxifeRPnbRILsJ877ptkJ8LeuByCmx05QDDMSP64uPLfViusY3yXwNMdpsT7LxFwtJ/deyQssUjDj4Fl7+J4WeR1PCV1kNUZZAjEeKegqkD+5fiCI+ATCefDYx8Qmp/wUPyDwVC5yh8ryvsYzozJ06BUMxiW7QGAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hkeih7pufrw+pq0tKoeFUy3mK/ef0w38zDphdZtKitc=;
 b=bTS2dXIluikYWoaP2O4F7BNcr3L90CvKW2RueQHpwYbdv1KEk57h7PVd1k27K1hLECpDhfqNf2m2hM/6oTza4aihw3TylJEHPVbvVyNWLbrhaOF2sH+jRuF6Uuu8aDgM2bGEQcwD3/5DyH4TbVIgVeaTwMrobFKQM8IZ74GsY7kRMIkuFbULGube8EfhH79qv4vBDof9gT6uY+0C8ZVHzu7W2mHJ1j6hEYiqc35xmSyor/oxq1d3wqrDnVr2qoQF8msJ4og3SeB89sH/AdgZSy4uZTpE01EdIYWqWbn6TNohTSEsGf6ZwD2yrdFFmnk4JtDeNKTSJ4RTFZZbO7pY1w==
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com (2603:10a6:102:211::7)
 by PA2PR04MB10334.eurprd04.prod.outlook.com (2603:10a6:102:417::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Mon, 23 Mar
 2026 10:20:55 +0000
Received: from PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::b476:c19a:24cd:3694]) by PAXPR04MB8510.eurprd04.prod.outlook.com
 ([fe80::b476:c19a:24cd:3694%3]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 10:20:47 +0000
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
Subject: RE: [PATCH v2 net-next 13/14] net: dsa: netc: initialize buffer bool
 table and implement flow-control
Thread-Topic: [PATCH v2 net-next 13/14] net: dsa: netc: initialize buffer bool
 table and implement flow-control
Thread-Index: AQHcuote84lxYz/saUypBRN66PVRZbW7110AgAARBaA=
Date: Mon, 23 Mar 2026 10:20:47 +0000
Message-ID: <PAXPR04MB85104288918BAA15CD739C0E884BA@PAXPR04MB8510.eurprd04.prod.outlook.com>
References: <20260323060752.1157031-1-wei.fang@nxp.com>
 <20260323060752.1157031-14-wei.fang@nxp.com>
 <acEFwqmAvWls_9Ef@shell.armlinux.org.uk>
In-Reply-To: <acEFwqmAvWls_9Ef@shell.armlinux.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8510:EE_|PA2PR04MB10334:EE_
x-ms-office365-filtering-correlation-id: 74755bbe-2e0a-4d92-a67d-08de88c5d97f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: j6ZeeywxksAczU+//iAepxaaPpgES8RpG9m8C8UwX3fm3OP+Q69JNDOGTTF91ZJrhRRV9yZCz+e4PEKjvvxlc5sh8FwHMuVNoo+i7ETA1Om8UnorKps1+Rb1xqfh5w9DkLMFoscsRae2KgC3/rJdzPESK85d3AHAsot55duOEUpj8+vXXahM/huScKBB8LEicfSL2XHmGR5LIJHJfeym/Gle3bajDIu2R3zEVnmN4O6LJVO8F+4/JUm9AQFN9SfY5B9eTnTYdIJREHJ0oIKD+btjk9j/p+KncuxZFsx03utfhpLDOjTDEupN7lJbApIzDzGFepedGc7rwMSjId/fCgFmxNtK83HbHCRv45fYhhi0ODd1RPlUlilm0tm0gav9i9KT/Hi1/A/2Bo+A9pmTkeWpwYiC1bcVccDQ4uL5Nl84kqc111MKpgRUHxQ/pFnpl3yVEAp3neap2wAuuUn7rvxKBdEc3Av2+Smazs3prQ9bZi0GSuzIpnwF2Rk7Rnvzl8obYq4Kk0jaGqFn4mnPvYBeLEAHcOGisP5zYecjq29M81fIbk9h/e+mX0TOyyMR/yTnnMXjPV+8cfadWMU4mTwdqnYjhYGX0qK3co6dE36ASxTc+qSdJkGkytrLminSs8xVNwhgFrXa+pxMhDBw2nd9xDvHUzhUEk9Pl4vmP4ZbPwS8mXA+0+ZFiXWEPOEQ2t7pgaXKOnbieEczNXizFWiDvm+UOCtgYZP3wjleT28OY/z+jakrKByse9EAunGBBnEq7KvB3YntlRGv5c4N8US6xHPOWsRIbnVPyNf0XpE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8510.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GveJNakoJK71/e4fErRtI1jcJ0vdSNEyMKN4iulKcsJcvkr/jIY8rG1Sw76Q?=
 =?us-ascii?Q?d2394VZYkfngV0SJrpCQcmcHHSuvHtfUSfdU+gRWpcdBoVxfcoECdRhSBW+J?=
 =?us-ascii?Q?JDOaoFrmKhDJiN5X55LwytNLHNZ6mcru4RdUfJvutx4FOarXlI5f1/kO4D23?=
 =?us-ascii?Q?ZfsU9S/eZWYWLdnXvL6JylyyM0fbzMwE4S14vxAc6cG5GEQHbsYpMXfhykt/?=
 =?us-ascii?Q?PaXsxteTcD6YbHjGGgmMjXpin3mAOOTbrW+a+IAKjMslLwsgLabqHUJ3QBK2?=
 =?us-ascii?Q?XHjfspKttVxeSyYBh/j+zYCFwECukWFQbwvX5iIc8VEPjMNX0XTpn6XaMlOv?=
 =?us-ascii?Q?ZFufuZkaN5xzMUQ4SrnNTz/0Bzap1nhTkArueJdSJtCARMmEnDE+37G2gGUP?=
 =?us-ascii?Q?AWpOOcQVBd9iNMsIj6VByVK/7bStpDT7r3g79rtizjY/E1XmvODbhkebaa8V?=
 =?us-ascii?Q?MY7nB46N6z+15O+a/EXuUsFw0d4Mq6caeOfGis2ZN8IIMbUuRjpYSoGN+s+T?=
 =?us-ascii?Q?6dSg36z3Q82UABsS3TB0pMqhOvTY20YQlVe+XaCwUl3LKA8DGegJApMfikbj?=
 =?us-ascii?Q?fhVLY8hAg4Oaw+fgeM9rF4UOCERr0ZMr69VH9Tixlgxmxh3dzLwz7v32rUqU?=
 =?us-ascii?Q?eiMBEm+Hi7PX45okllE1lTfF5vpC+GhWxN4NPK6xSTHiFB7Wdv+pYi1oswvG?=
 =?us-ascii?Q?9LRS9zwme6UsfbhzTa0lXWvPHmoD4oyH7jCaZ7REZK5FYjB2JX8J/uSSssui?=
 =?us-ascii?Q?pXQu3FxA5mJdlWUOpuu8n08ZTREyKi7VOD30G36I4iwegdCnOLcltTJvcw61?=
 =?us-ascii?Q?cEIIV8vrYqR98VO8tAgQ3YWkjDMWeRWDfzmGgomiXh0Y48nLhIigTLI1zOy1?=
 =?us-ascii?Q?YyQKIF5xpYflDFZbl1fhalx+HY26gtzSGpHtfulmciIaxCDK+TXB+IGE+Qm5?=
 =?us-ascii?Q?EAHJ21ZRy/MX48duRZsDKnNyGi4Qjx4LKbCa3JH5eIwp8W8jSYkZPDopeZSz?=
 =?us-ascii?Q?k8Cgb+R0LmaH5M4vN5oTRqx4D24KPGuYkVTETRv6C5yQSrhptiE1Bk25vAjG?=
 =?us-ascii?Q?abDKZ0vTNRHCuckeI8PD0J6EgPmYv9prkyYM3nnSK7rPpAf4wHQSQXO1tcTx?=
 =?us-ascii?Q?DHB8JneaNwpIM8ZCLwKHvVzVjl+JUfubeIaOz81ayUVMdvF1B2NKIYiiapl1?=
 =?us-ascii?Q?CadYkVmBT2bxNTJfHLf+PBFWdQ6yqhPM/vSuNp+dNVATlObjb0yyiczzucY9?=
 =?us-ascii?Q?YYituDMXtAamXpffV//JvG4ErX7FXvPZaVrYQS6rlWKPY8k06gZq4uJEOZAG?=
 =?us-ascii?Q?OCqgeE9hdz0i4umgTVXE9bnjcxdSH0pYw36l/OdHMKv3h5VaTx3usfbu+GKq?=
 =?us-ascii?Q?hvlhZ242VaimIVu7HIfKVkaekpqAwnNjyvEkspSw8dAFvVuSLh5/w/P98Qmn?=
 =?us-ascii?Q?W+/mjNcMh+8WfHmj77UhzVJH+mXopbsulNsk0KEx926h8A0HKXBTJUkYqkp3?=
 =?us-ascii?Q?9LvmmFQqLvqLi11KFHTPGSg5c00HFw1qMttEvdLgRDsJ4ijlwlPIxcnRjySk?=
 =?us-ascii?Q?iqKPvR8opqnUx8JMb4eULDfL0Jh46Z7OjtRkLNArItUE0Ea0hWegQeL6VdSp?=
 =?us-ascii?Q?7L5SqD2V8QEO2Y6iqFMZkis2bjWliX01rj5u6Bdz9UZuybe9pGswi1DDoHxH?=
 =?us-ascii?Q?d/1jkH+lQwqelMWFrpAaHb9RLL7ArjTrotZ5TaCuSc4Lwk0G?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8510.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74755bbe-2e0a-4d92-a67d-08de88c5d97f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 10:20:47.1710
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YqphzsyvX0W24526C9yyE19rJz5zdnj80ZhTLrca1+ckO5G13ydeLeu29Izg40a0PBBuLqkBBBZGsPKyseMOOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10334
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_102122_617158_C1EC528D 
X-CRM114-Status: GOOD (  12.71  )
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

> On Mon, Mar 23, 2026 at 02:07:51PM +0800, Wei Fang wrote:
> > @@ -1288,7 +1411,17 @@ static void netc_mac_link_up(struct
> phylink_config *config,
> >  		netc_port_set_rmii_mii_mac(np, speed, duplex);
> >  	}
> >
> > +	if (duplex =3D=3D DUPLEX_HALF) {
> > +		/* As per 802.3 annex 31B, PAUSE frames are only supported
> > +		 * when the link is configured for full duplex operation.
> > +		 */
> > +		tx_pause =3D false;
> > +		rx_pause =3D false;
> > +	}
>=20
> I keep seeing this totally unnecessary code in reviews of mac_link_up()
> methods. See phylink_resolve_an_pause().
>=20

I will remove it, thanks.



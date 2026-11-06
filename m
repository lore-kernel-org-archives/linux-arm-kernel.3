Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFD7606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 02:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d/d1AXyV;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=SjhFGKqm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GeVQkxVcB7WZPeejm2TOLX9uTcMHcgubKNTlCWpA+o4=; b=d/d1AXyVPP9UshIrSOopxTckru
	HeU5dJggmHiC/22m44OPV5C+ybA/BqY2AtbT8z8vjyOVkLg954zpa+83W1LgWM67KH9GRVHRZFHIW
	/9JjDh8jh6aZt+TXUNHciT3F3y/GeYW0bdUejz49qDRu+Unf2BXyVPkF+W9iGzygBE+9BV7708FRt
	JPgrX1dx7nKNvdLZ3Hw4SmAQ5hM2qxR3AeNYZYR48wBnS2wgTGgd0lr5AHPti+SAYKEAygtKoNj0r
	iaDLg6v9IFWY6AlnfEOQu6vBzr8FRkMSx0odDrMtBtLuCsy5Ia6RC8ELhpk7tYG29zFN7eTJqD18L
	vt6O1J8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP9QR-0000000B2YI-0Ahk;
	Fri, 06 Nov 2026 02:11:31 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP9QN-0000000B2Xk-26BS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 02:11:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tr0Uz/EqOJwc41YA8KaAeHT1DtIbLLRO8fjlVXEzRL5/S5RActzf7SDYF/tBP0uARYY2ZD7dEJRG0ktlDMDCM4hsOrmmJLVl18NnHplxQ1o424irBmyKdjv+uV50NziOnk/uaHmS5Ki0Z1ynrCvCbjRdHgBVoVMEEWAbsvtgMjIPh7NVPndWp7+pAPcPfjQYNBbDdhYeT8PvkInQOcpcL5Bqz5mg5P8xB2KShNsbVAZMqrCulgHgM4XWcwef1KMxD+J/q4Ja7gKB0NG2SNgQLROf0Eq+hNpBxclazlPEIcQGE5MCBWqb93xDIU9m9Or1pCCwNwJ1Pk4osGhBzdgIQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GeVQkxVcB7WZPeejm2TOLX9uTcMHcgubKNTlCWpA+o4=;
 b=eVugQGc2P44P/a4nIue/xTlzD9SAuCHdQKQXTQ0wRW76FUwxS8Q5YTKmw+z2Tc1onUISTaYzwABaMPmr5252b5wX0OkHK25+y/kb5RNrszfj7ms1bc0jaP9bWQ7Sx91CsQlm7Tj4TD8bErM1HT2sME2kCFEvKYePRN9XObHHDz+fsksU7JLKgqakZg0hm0ABNdXpOz2xQtSwDFLXsGIOMK9DFwV3mg3jqTDT87heLJnIwdQ+abNhqrBdK5lqJSiRK7t94EkvK4+M6LmUy8pPpEVqrgf2fj58FtZ+LnjRZ1bPAcBfp1q2Ku1k2oSOUmr+mzDTYepOoHg+1PFSGlrf0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GeVQkxVcB7WZPeejm2TOLX9uTcMHcgubKNTlCWpA+o4=;
 b=SjhFGKqmIqD5MO+AfRWL4mtzvHP43LZ6/t98w5/lGkO3Fkz6+WY+Vd/fbS6lYG40yRfVY3KxUd07MAAVy2oV5WF12INYbxt266V3x9I29FjlrobHerxdJmx64qBC4MHJR+wJYOysGCEb/CEebEf8RMSUiWeBQxF/SmIZA8idoL7dk+swLnhR52sMD2q9yHiYqB0GsecB+12nFvW2CQc76zxhyejQ5p9Zw54yu/tKvircljbaok1DdBJ1v3/WSKHclAorWBpr7u5sJnoQxJ9lC0p30objiOKLCLEkuELfSkHLoOaYDs7s0u+fKBCPVYz036JidWsRr4F7SZ7wt6smXA==
Received: from AS8PR04MB8820.eurprd04.prod.outlook.com (2603:10a6:20b:42f::13)
 by AM9PR04MB8212.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 6 Nov 2026
 02:11:19 +0000
Received: from AS8PR04MB8820.eurprd04.prod.outlook.com
 ([fe80::35d2:bfbc:a06e:fcb]) by AS8PR04MB8820.eurprd04.prod.outlook.com
 ([fe80::35d2:bfbc:a06e:fcb%4]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 02:11:19 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Joshua Crofts <crofts@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>, =?iso-8859-1?Q?Nuno_S=E1?=
	<nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Eugen Hristev
	<ehristev@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Frank Li <frank.li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
CC: "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>
Subject: RE: [PATCH 06/10] iio: adc: imx93_adc: remove redundant
 pm_runtime_dont_use_autosuspend() call
Thread-Topic: [PATCH 06/10] iio: adc: imx93_adc: remove redundant
 pm_runtime_dont_use_autosuspend() call
Thread-Index: AQHdbR+euUEnjqmEIEGg9GX0ijAEsLcgTbMw
Date: Fri, 6 Nov 2026 02:11:19 +0000
Message-ID: <AS8PR04MB8820E824F11971A6CCA2E4BB90762@AS8PR04MB8820.eurprd04.prod.outlook.com>
References: <20261105121635.1612-1-crofts@kernel.org>
 <20261105121635.1612-7-crofts@kernel.org>
In-Reply-To: <20261105121635.1612-7-crofts@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB8820:EE_|AM9PR04MB8212:EE_
x-ms-office365-filtering-correlation-id: 383dc14e-fab8-4a2a-6c32-08df3bab3f24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|23010399003|376014|7416014|10067099003|22082099003|18002099003|921020|38070700021|261009221227099003|4143699003|261026140227099003|11063799006|261022105027099003|261021135927099003|261028144727099003|261022075727099003|261021123027099003|56012099006|261009223027099003|261026121527099003;
x-microsoft-antispam-message-info: OCr87zNI90CyviaQDSMn5lMHmgcV90TFnyf14uWu8zPvqlmN+osDGjKKEuzgNw5TGkaKPG7T9D+aJQzasbPOvbc1DJ69Dc7kQfOBV0GCX7KWaxDfGp0Vf1aci+nzpSPGexlYdy31dHKBHgpUtwBA/0cA6RoRcammthNU1AeL4LpdsHlqKmo08MoM9EDORMgXqQnkGN0rpK35u/2s4EqdZe9MitMbMDqAFb4whmdOfBPagWVDB/D6L5hZBAiLB87So+h25ba/tD+EYG9iJGKMq9XvDQbyJNSHJX8Q/9iFMoNe8ei4lVmhsZZE+XHyfroeKohzgqvOZXi4eTDsotF1fm6QMLJ2+FGqXdxePFLMkfXSW2uzZ1jupyVLt+ifUSAFqZJ9faq9wzAg8OK7SUVOIz+phy4tjR0prxkPp2bx0WEJUBvvxkMV0Lbt2+JszHA7SyS0Xvg+FZnWUgZfxqoIOKnZjh1mSToQoaianFTXs0mQijJ/4NLfT1cr8L4wlWuWHgF8JvZZLTTFT+bo8nlj9h27uNLsx7szhQImaTNgOQkkeT8csEVLtrFgdOTMpRV9SO+KAEpIqI/Rmf6D/kUBj4iXKiycJcIsDEPkSZ472bSToVQasD6WWXYEd6XEen2oBexar0kNTzZEu7M3RjgbQ9XpfHzuRl7qgnLY8rCDmHDuIDP6CAQYOwPzaiO2nXc+YJPS7AxglEjqpn2igWcXSHvZhmVlMbGBE8hllY6ql9E=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8820.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(23010399003)(376014)(7416014)(10067099003)(22082099003)(18002099003)(921020)(38070700021)(261009221227099003)(4143699003)(261026140227099003)(11063799006)(261022105027099003)(261021135927099003)(261028144727099003)(261022075727099003)(261021123027099003)(56012099006)(261009223027099003)(261026121527099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Xloxb5Py5D+1hvyyXKPUIiJGB+Ex0GIKWui6YBgHg53GUz0BYZlZlj+3y7?=
 =?iso-8859-1?Q?b+NyInFm0UbXtuiLirGVlsBnBcxyszL6AvqS/Of+QsnfDaJV57dcD0U3lt?=
 =?iso-8859-1?Q?0f6Phm2z2HFbeSQ7l8OBWP7dOTf7UZLYK2KgisnjCHEKcGbi64gRrVB3dx?=
 =?iso-8859-1?Q?ofaf/Zz4Ao5CRF3+1pSZIjLJr9O2W/pZGlMsrbMCa/vzuTGoEEnLHarhhO?=
 =?iso-8859-1?Q?jUJ9NDswgW/YYtRoYG4XDVZEcrKhPBqeAmvARJTe+m/kC7WRBhkrtTbmQj?=
 =?iso-8859-1?Q?ZC5136aV3zgDhjd6LeWhvqbwA1DTJ6CeMxGwc54cxawzTeWbbyCE7qQrlU?=
 =?iso-8859-1?Q?3eVslvkWayBnNunkS9nHgKq4i4KjbjXPJgBoB63mUuXKksKRQLjukDGtX0?=
 =?iso-8859-1?Q?u50UEx2l3VszZLjux8d6aX51qSOjjzsXQpkkrvMExC1aZGix0q4nVtg6sY?=
 =?iso-8859-1?Q?3B8dIrx4yb11MbaG6FwJqW7IToC0eC/N+JTX0V2X4+0Dhl9n+G0dabcMWk?=
 =?iso-8859-1?Q?0RJs/dyqiG2Lqf/XM9mm49MYImqSd+WL0bln8sq+Zhl8vnJOY2GNeXAboq?=
 =?iso-8859-1?Q?7S0YH+jIYZ9GJxnDq3xjOsCdk0JJBT6PstqECn+CmcLzi9UveHjGYLW7XV?=
 =?iso-8859-1?Q?HRK3oIr8E/ucTap/IM2ODWrHYUrgZUWvug7a4WV+weEUoScLNiakhdaccX?=
 =?iso-8859-1?Q?j2TURjttFtdP2O3B6jXr9c/p/8GIzvlf1nwyAcf+N+V6azCGfPlFcMKYEW?=
 =?iso-8859-1?Q?GB9wqK+4/202+ghnOFfW0qmaXxoUBPlgpH3PXPXxYJ3RKf2Ho7TESpRKAR?=
 =?iso-8859-1?Q?yU4Z5WzVmii7M9kUpn9m1eTEA/+SlNA1pfnhFeEGIU7JYLN+IDB4oQukzJ?=
 =?iso-8859-1?Q?/VFvwshDgptOe6VJEnTzYLPnlmyCH7+2Ov/+UN8g1VoqXTCeECJYcMgi/T?=
 =?iso-8859-1?Q?sEGnYXaqutwC7vW8N5rzQK8w6ygzy5ZxFK3OoO9tUbf5fcJmrK9XpRXIaD?=
 =?iso-8859-1?Q?TxvjavLBAhdXdeMWR4OTVnAD+s5dJthMRkGCQm62KSmEYMdWeAo6jCeE2A?=
 =?iso-8859-1?Q?zXzBXTSzVmSoN30G1Dw6BI4lFZq3aECZA7pw/QU1GSDFcVtxBqdMmZjF1Z?=
 =?iso-8859-1?Q?U4mAlwbVuIqQgDeHbYHaBGdzsoo+rIK/Kw8bJvDgiwuTqsNmYquP/m8QXD?=
 =?iso-8859-1?Q?ut0zUxc/kn4BHzQmj/Bgkhw6Qzu6xHblG+geFzE6o3SNmxUoUXAVmK4scn?=
 =?iso-8859-1?Q?MucFKIM/0h3vEpNDzUWMrDjX2Zp7CrtESDH7KJ//FvVbcYTQ/WtiDcFHwK?=
 =?iso-8859-1?Q?Lj6qlVQQcEmTOunK7ai5dGtoDUkAr6cTAw6pJLYycjP3hi5/cnfQEBV6LR?=
 =?iso-8859-1?Q?UV1BTrlY8r7mfB+FhWd441i2EScd9Y2Ecu+U61GRG85OmJLMIrpw8Dj90m?=
 =?iso-8859-1?Q?VEapJ6dCznNVsyqUTb4x6DF0Z7HsIWd5+iPK0ECIKl1Xcv6IdJz8VOXxvz?=
 =?iso-8859-1?Q?SUNge5I0JzkKXnDLNZoa5HOtMakvVKeAfu1bbTfC1UatjbDq7pRYGcprN7?=
 =?iso-8859-1?Q?yltSV3bF82F7s3RMyqYtHMWs5ft7Uxmf/ti7DTc/Fr0qspn0y9XmRyaeTJ?=
 =?iso-8859-1?Q?agqcqxS7nf5MsKVF0+G1VpY02SGAJ1Z3ov0+lGicjP2rvcA+XYJDF0vmEk?=
 =?iso-8859-1?Q?qZRJu/azQQtTHt5PECLzQ6fX6/JbNdR1AiAIMo8WSnNb61q3YlR5bQXe1z?=
 =?iso-8859-1?Q?ZdmxO0rgaVHVs4sgNIWSIfkpuc5NPCi8MIovE/03LQDkFs?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8820.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 383dc14e-fab8-4a2a-6c32-08df3bab3f24
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2026 02:11:19.3952
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /20bilYVUBzH+7DeTLpNeCTccGv1/59Ne5RJDu15TGcljLq6nqsjCZ4KsGleB0k7M6s/UqIlyOqkXnwz6e9jqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_181127_566064_D2F53BE7 
X-CRM114-Status: GOOD (  16.12  )
X-Spam-Score: -1.1 (-)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> -----Original Message-----
> From: Joshua Crofts <crofts@kernel.org>
> Sent: Thursday, November 5, 2026 8:17 PM
> To: Jonathan Cameron <jic23@kernel.org>; David Lechner
> <dlechner@baylibre.com>; Nuno S=E1 <nuno.sa@analog.com>; Andy Shevchenko
> <andy@kernel.org>; Eugen Hristev <ehristev@kernel.org>; Nicolas Ferre
> <nicolas.ferre@microchip.com>; Alexandre Belloni
> <alexandre.belloni@bootlin.com>; Claudiu Beznea <claudiu.beznea@tuxon.dev=
>;
> Bough Chen <haibo.chen@nxp.com>; Frank Li <frank.li@nxp.com>; Sascha Haue=
r
> <s.hauer@pengutronix.de>; Pengutronix Kernel Team <kernel@pengutronix.de>=
;
> Fabio Estevam <festevam@gmail.com>
> Cc: linux-iio@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; imx@lists.linux.dev
> Subject: [PATCH 06/10] iio: adc: imx93_adc: remove redundant
> pm_runtime_dont_use_autosuspend() call
>=20
> Since commit d1706f9da9f4 ("PM: runtime: call
> pm_runtime_dont_use_autosuspend() on reinit()"), driver core is now respo=
nsible
> for undoing any
> pm_runtime_use_autosuspend() calls on driver exit.
>=20
> Remove the redundant function call.

Reviewed-by: Haibo Chen <haibo.chen@nxp.com>

Thanks
Haibo Chen
>=20
> Signed-off-by: Joshua Crofts <crofts@kernel.org>
> ---
>  drivers/iio/adc/imx93_adc.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/iio/adc/imx93_adc.c b/drivers/iio/adc/imx93_adc.c in=
dex
> 797adaf371ba..1ced0c59609c 100644
> --- a/drivers/iio/adc/imx93_adc.c
> +++ b/drivers/iio/adc/imx93_adc.c
> @@ -415,7 +415,6 @@ static void imx93_adc_remove(struct platform_device
> *pdev)
>  	pm_runtime_get_sync(dev);
>=20
>  	pm_runtime_disable(dev);
> -	pm_runtime_dont_use_autosuspend(dev);
>  	pm_runtime_put_noidle(dev);
>=20
>  	iio_device_unregister(indio_dev);
> --
> 2.47.3



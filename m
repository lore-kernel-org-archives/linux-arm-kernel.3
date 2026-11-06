Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B830B606A328
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 08:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u6eNO7do;
	dkim=pass (1024-bit key, unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.a=rsa-sha256 header.s=selector1 header.b=GIn1O/kK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Ur6IVRT2TIw3h5RRedxRy9hlQoHTaFNtRY48hY8vkNM=; b=u6eNO7doIo9TeMKwZvhF7Q1yFq
	7SJTRwaEW+J2b0A+8/BIvotQYqfPj9xIR+mvg8gu+SwPxNyMM8R0GayIOVc1qnUB8synybKOH1k1f
	3KjDdToMEbbe76h+U58beU2QvqnxLPvSLFtcqXC1rjX0GoBRWCzZ/P/F4T0UCE8w8j2OVdrHVgru2
	0vF/CEwNfZ8ysoXJ94k9t7xd4/Mj4wjNKhXYse+jy7NpsKmjcDmctEVdCb0F01Ppf5CA5XWdiQoqD
	geYonc4bKVMeQi7sJ0P2Rw2YFMYiym052LItNwHs815WT1VqaoOu70Ng0xNS48FyTG6n6QtzRM9kP
	jUV+BZDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFKk-0000000BZDK-154f;
	Fri, 06 Nov 2026 08:30:02 +0000
Received: from mail-japanwestazon11011039.outbound.protection.outlook.com ([40.107.74.39] helo=OS0P286CU010.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFKh-0000000BZCA-2cC3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 08:30:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eavd3JGUcG0XYsgdkcciQ9W+dbuAbyFApohNPO1goSzitg5M4bRI8XMdoZ5zTcpNfbyHWvwoP1mqMKGL8AMyxpBdDYXgtohNtbYzhYlw/nzjpsDnzxRupPNBoodcDyQXpnzYlrzfVAckZlKl3DtMqj9/HcEf46jC7XPqSUYJgOttXMaDMCB3hnbTVr72fUhGLsF86CRN747o5VM6GhjklV/uv3+ObiPLmYKr/FOvv70qVpWJMG+zKYTxvvoZ1SuNHEBKFwhPCiB3zKGc0kkM65Kh6EeMdAxm9090a3uqr7//KYVxLx/4lirvg1r1fQKa4dQG/scj3Tsbq0K2IvN8Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ur6IVRT2TIw3h5RRedxRy9hlQoHTaFNtRY48hY8vkNM=;
 b=J4WYvPULC5BHiiHyP2ctwFQZfsLyfRGWoPVNOTMz60W2SzInq2K9bFW3HDx2ywoVedDfjhuj1EG9UOS98KpHOuS1tMw8MnVRqGun2mW4DlIt+V02JkQviOBh/2M0KxmM7HXQ4EzJ0uewGZI/pF3/oaWkGCf+G1TOfkbfTmUCvKf2p1MAgQSQ5XLx4DYk3KcyBcYD76L/RMuFwhLJPagPVddKfGaXR0RraSDWs59+avwQPbjD4/3E+FQvFkaBHJDqP80+5q7onUaF1APfc7tGlSO1TmDvxCmiBlHaAJt3w790j+dNAIUpKcd60a/CYtECM8gbeyCm0i5nTB43q9+KKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ur6IVRT2TIw3h5RRedxRy9hlQoHTaFNtRY48hY8vkNM=;
 b=GIn1O/kKenp+oq1GkhkeenvPAWWBO2FEIG44nSzSYtVDCyWD8c67kF7AhDNldYr2NhAEGxxaDsKPTrbqkFrP96k/pdeIfPVrKi9w/kXVCwx2kKWNPKGx63cIwgikHNz/c7ROK2V9MZk0ryI7FEiTzfYcKNySGGr7GGrpAoMooV8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB14590.jpnprd01.prod.outlook.com (2603:1096:405:23d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 08:29:53 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%6]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 08:29:53 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>, "biju.das.au" <biju.das.au@gmail.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
	<bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Ulf
 Hansson <ulfh@kernel.org>, "magnus.damm" <magnus.damm@gmail.com>
CC: "linux-can@vger.kernel.org" <linux-can@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-pm@vger.kernel.org"
	<linux-pm@vger.kernel.org>
Subject: RE: [PATCH 2/9] can: rcar_canfd: Add Runtime PM support
Thread-Topic: [PATCH 2/9] can: rcar_canfd: Add Runtime PM support
Thread-Index: AQHdZ6cRKhqrBWVFt0GPnL02pCtZWbcgwmKg
Date: Fri, 6 Nov 2026 08:29:52 +0000
Message-ID: <TY3PR01MB11346F0FE5ADB3161E81E6EA586762@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1793278754.git.geert+renesas@glider.be>
 <011735aa3a7568229db473a7ff92681176338db0.1793278754.git.geert+renesas@glider.be>
In-Reply-To: <011735aa3a7568229db473a7ff92681176338db0.1793278754.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB14590:EE_
x-ms-office365-filtering-correlation-id: 9c69c4ff-ddb8-4481-16d2-08df3be02176
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|23010399003|376014|366016|921020|38070700021|11063799006|4143699003|56012099006|261022075727099003|261022105027099003|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261026140227099003|261026121527099003|261028144727099003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: tnIodvQCjgzYuaOi0LWYHPrVaTmMw1iGAgmE783nX8PFS+2kpGQRA8+xAfJrE069HZxv+FyUPMOsI5Sk3REnz618UoA6eA4fJHubNxuv2VO8HTUP9NbuBCB4aEv/rc54ykr0CG5tVvqNZm4cvQC8PE2ttZ6sNdkH87slWbOvNnWfMzYtGcAMDJ0PRh9ItgcW8a6q8UZkB7WNUMKgxYCH9g8oLIpcbvFM0aHVhuoM+eIASAm7Ytn9csZ6dcxOZlvsECqsvgi3//RQt78pPKiCXNAxTIiwonwrA0V//hKIZglgz1/NoHHmoMCcVZjFYj1Foct/3P3vTPirJIh3rW8TzHYFMKyxytNpYSczRCwlysNOnGEBtStQDWu2WwamCRZ4aGtDh12Cp25IYzAiwsAMd0cLwaSaOe8iugraE7XkZ/LDrlN5/PJhVy5VSYdXhffK43n3gZHioLm38Q+Y9Hg1HQyDeNDNlD3xhfVDP/Faea+uijF60qCXQKvhSLlM4jquXu3v4dvkasurWb1ZNNRccD2JrryhX3t4lcQ+op6GiLMDRZxCdwm6/VmwP4cl+mTMoocYDRad9ipo8n7QmK4toc3ykprYAIj9OZHQhiYoCeUVINHhskmXKe+7ekoiOuJzqnOAaoQdQcAsT7EklmLXjjuLRUMrMIfhf1S0bVk0YV79/wajR0VabG+9b4yERrU8NX8BTyXSXRqpybK7C7I0vGRzvFhjQo4HpXdzf29oMf2vJNLumSkySLpEr/YuHHGE
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(376014)(366016)(921020)(38070700021)(11063799006)(4143699003)(56012099006)(261022075727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MZEw8DzIovUCRE5vrtzlofv/40xyAT3gx8Rq7heRt9v1bxCXg2DsIitCObK+?=
 =?us-ascii?Q?SEMocwD9++H5aA5FRYsZbiLlqg3d2ZCP3G8GNTbnwXSU10DkHWHvdbCB8xmr?=
 =?us-ascii?Q?FdmsWHHKtYdC5FPwcmw4nVwBZfLk10mMU8YS/Uop/TwISqzOgRu1JkUDSyNz?=
 =?us-ascii?Q?F4hW6T/buOvG/vTAjV2f4XFV3M9bTqUW1ukY//pZctkOlJJ1FpcIwPmfxHxS?=
 =?us-ascii?Q?BURicHleIDBkYm0ySeD5ePJRck43QS5xYgznMkR+KST7cSqI12G5RTQwDl2n?=
 =?us-ascii?Q?foSOkNkItZAmcZuVRzEg7HDyr7LDcii0RV0pJXaGm5rkU+wyuy2YPcRGP9pU?=
 =?us-ascii?Q?iTa4cgsXsMUaNWzERllUDDqSbNw5s0fAVULsLjdXkar1O1GV2QAnoaF7xf45?=
 =?us-ascii?Q?jA6RTt9+GlIvWryuJedHEveSSv5bSwQ2e/8dEb0LXk4NhZHMUKM96M98jHaH?=
 =?us-ascii?Q?3g/xDUhwUk897usRUkYDy5UomFbhNcKmD9U7W3PHe3PX33DreEN6jfhyO/HZ?=
 =?us-ascii?Q?lwR+A1/0I8qIHr+3QYJTwDdR1O8weZEregl7jyc+2zFmca3cLfxq+3yFLhpS?=
 =?us-ascii?Q?DtaiCy5SgGu/EczhH4lk9JXkkp0nwuC7KPpAhbU1o7g4EcasVbvryW5bfFl4?=
 =?us-ascii?Q?1lhgoWBAz7ncYlk9Mtg/EgPlBN3F7fugO5Q4vgsIMgSwFvKOzZhFsfBSFmvh?=
 =?us-ascii?Q?Wcad6zvyYYfFsAUqspIwhhdF+w7qCM6NJqWhP1qtdgWsLa76taYnQyqz0t/8?=
 =?us-ascii?Q?dMlxdCunak0evYr+kQQQoZYJn7PEpgQedRiwGR0Y0z68rEu9wqYBHNJ1KpyN?=
 =?us-ascii?Q?OI1d61SjVq55gAfN9vd3hwbxPN14QFEbUonjYW82XQpdoBLN0mJpqrxhRhOy?=
 =?us-ascii?Q?Gn5KG+mJtrGkQmTulr7JNdpeaXjWB+qBPLktbe6nGSw+4nYVfKG46AAU/yxJ?=
 =?us-ascii?Q?BoKpp/0WIZHV5l72kHgDmfcJUcWY4723eiXHs6KyteM5RgV9rtDH/Kcp7Y5t?=
 =?us-ascii?Q?5aPk92jPDjKJOMJwcC0gXwKBi5KtH+r52VBPZD6mNVSOXotDcdnFLpVSlk6j?=
 =?us-ascii?Q?x6G/sAxjbf3Phse1Jp8rjyzZE97d3cUsiE9VF8LOhGDlRDIyOAqfTqMPD6H0?=
 =?us-ascii?Q?2KjldQxNX1JRB6sGXjyUv41WCeDi5dO/MZI0OMtu47MtU4T94/asMe5I7Brd?=
 =?us-ascii?Q?yoakuQlCzpuqT7d9MQ8Qf2ncgOFbAO7gtayxi31E80fWaj0p1sR6q2g/lFyX?=
 =?us-ascii?Q?vTVNFGelDuRoHBbvJL1WsouvMS83QK8sKJ4j6z8X9ekBJP+Mw6db7Y1Fk/LT?=
 =?us-ascii?Q?oQ6GGZHzgLhfbdsxt4bqjklUUmmIH39cX5yozh2YtM7MMBFIpGRKWyuAeqJ2?=
 =?us-ascii?Q?ANuCkOpfwdQBeA4fZRn7iyqokoj/Y7GkDJgN8sw2QfcusddM65P9GL6ZnDWd?=
 =?us-ascii?Q?qHBmFyQRgiWvI5Cji64lCuXM6XXIM76rmkyIar2N2VyxGNgL9YGgv79siFKn?=
 =?us-ascii?Q?oKfRwFuclA8zJXi/K03M12u6O7Yl1HVojCEpORrTrxuVbqPY4ZKHmGL1h4Ol?=
 =?us-ascii?Q?30bA4jeeTcrwe5qPwve8ul0v2u0XZsKrmhCDMCtz/aixIBigoiHPBPtVBnEB?=
 =?us-ascii?Q?3R5ENmgE9kD2N7l9URfnCUEH77+hxvPqmkHoY5zeaQcBzanDBVmEbxSeTFbU?=
 =?us-ascii?Q?l6l/Naq6J62uAG45/Zh7FK9VlnRJfTBSyTkSwJukG2z8U/pwYgmohljcen1Q?=
 =?us-ascii?Q?PkEsekUCJA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c69c4ff-ddb8-4481-16d2-08df3be02176
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2026 08:29:52.9983
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IEkpOXZaHO91Kw5vpShSLPeVd1AStRzZoTElTkuAt9bwp3f+tvoSZO5QannEzjsF8MFCJ2E0fQYGdyuKzIl/q3EGIac1E2Udi4exyHugVxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14590
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_002959_690482_8DF9B30D 
X-CRM114-Status: GOOD (  21.12  )
X-Spam-Score: -2.1 (--)
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

Hi Geert,

> -----Original Message-----
> From: linux-arm-kernel <linux-arm-kernel-bounces@lists.infradead.org> On =
Behalf Of Geert Uytterhoeven
> Sent: 29 October 2026 13:11
> Subject: [PATCH 2/9] can: rcar_canfd: Add Runtime PM support
>=20
> On R-Car X5H, the CAN-FD module is part of a power domain.  This means Ru=
ntime PM must be used to make
> sure the domain is powered when needed.
> The CAN-FD module is part of a Clock Domain on all supported SoCs.
> Hence remove explicit management of the functional clock, as this is hand=
led automatically by Runtime
> PM.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju
> ---
>  drivers/net/can/rcar/rcar_canfd.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rca=
r_canfd.c
> index 4d805df5ff9e8933..74d9ffd2790587b9 100644
> --- a/drivers/net/can/rcar/rcar_canfd.c
> +++ b/drivers/net/can/rcar/rcar_canfd.c
> @@ -37,6 +37,7 @@
>  #include <linux/of.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/reset.h>
>  #include <linux/types.h>
>=20
> @@ -2004,9 +2005,9 @@ static int rcar_canfd_global_init(struct rcar_canfd=
_global *gpriv)
>  	int err;
>=20
>  	/* Enable peripheral clock for register access */
> -	err =3D clk_prepare_enable(gpriv->clkp);
> +	err =3D pm_runtime_resume_and_get(dev);
>  	if (err) {
> -		dev_err(dev, "failed to enable peripheral clock: %pe\n",
> +		dev_err(dev, "pm_runtime_resume_and_get() failed: %pe\n",
>  			ERR_PTR(err));
>  		return err;
>  	}
> @@ -2016,7 +2017,7 @@ static int rcar_canfd_global_init(struct rcar_canfd=
_global *gpriv)
>  	if (err) {
>  		dev_err(dev,
>  			"failed to enable RAM clock, error %d\n", err);
> -		goto fail_clk;
> +		goto fail_rpm;
>  	}
>=20
>  	err =3D reset_control_reset(gpriv->rstc1);
> @@ -2074,8 +2075,8 @@ static int rcar_canfd_global_init(struct rcar_canfd=
_global *gpriv)
>  	reset_control_assert(gpriv->rstc1);
>  fail_ram_clk:
>  	clk_disable_unprepare(gpriv->clk_ram);
> -fail_clk:
> -	clk_disable_unprepare(gpriv->clkp);
> +fail_rpm:
> +	pm_runtime_put(dev);
>  	return err;
>  }
>=20
> @@ -2093,7 +2094,7 @@ static void rcar_canfd_global_deinit(struct rcar_ca=
nfd_global *gpriv, bool full)
>  	reset_control_assert(gpriv->rstc2);
>  	reset_control_assert(gpriv->rstc1);
>  	clk_disable_unprepare(gpriv->clk_ram);
> -	clk_disable_unprepare(gpriv->clkp);
> +	pm_runtime_put(&gpriv->pdev->dev);
>  }
>=20
>  static int rcar_canfd_probe(struct platform_device *pdev) @@ -2254,6 +22=
55,10 @@ static int
> rcar_canfd_probe(struct platform_device *pdev)
>  		}
>  	}
>=20
> +	err =3D devm_pm_runtime_enable(dev);
> +	if (err)
> +		goto fail_dev;
> +
>  	err =3D rcar_canfd_global_init(gpriv);
>  	if (err)
>  		goto fail_mode;
> --
> 2.43.0
>=20



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C16B606A91E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 17:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KIqqugr2;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=YjCOoZqs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=GtD5de/xZ1Ta1YCoNeixODXl4ulZefkq1xoLEjgSB1Y=; b=KIqqugr2BYjTz2+VAOJAa8Qh76
	r/XpkQO0PinFW1mMjLBmw8/2sKzgeZbjvHmYRRCL8qDl+XTvHWKH6pXgSqXn4Mripw0A57ZPFC94g
	yZDBc8O8jFfGsjXtjFFHXkSXkBlMEVsdpYHioZZGIB1wbOx+KhE6e8WYWSU9DHvmxiriturLthoWE
	e3mk2USXOWWHGTXK043FElYlClHMJk+i/zngHbd9vQpnBmB8dPRrlhBluFRkXHMcMR2hbG76N2AEj
	tl0rq7ZXBXHXhthR3kIqjE7S8XUib1Al1gaM4Fhq2LvC+Pcz564V7zsB89bD64ueKdBmTJN2T2XrU
	zTfxdjXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvXC-0000000HPam-1FXt;
	Mon, 02 Nov 2026 17:09:26 +0000
Received: from mail-northeuropeazon11010002.outbound.protection.outlook.com ([52.101.84.2] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNvX9-0000000HPZz-2mPY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 17:09:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oWmjpiqNb+zVLzoszN5Z+IdSSxmqqsfUuAzI+LhTxvmrf9kNzdWSgWVAJ8JjT4rW6Ova5qn03BcC2pBeUsGvn0P2VQN4H8bM4tXvBLkC60YMDunJ+Waxa9FVchkO/kwHjv8lQCrkL3SkyIVlr+QKMGEmZmr2BcioFx+RqL8upYjv6yggc/6DXSc4FfAZMd1PGvkC8qeJqwdbiFekB5zrjb4iSptFFlaGgLlF1UIfxZWi7E4FwW6pFkyo+DqJQ5rNPdINXA5SClgOvoOkLlaEyAkGPGrqOmY8z/Zb8+Fg23Q9mhHHG0pNT0lrnz8pYvIaBHidEov6YqWw1PXdIIaEyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtD5de/xZ1Ta1YCoNeixODXl4ulZefkq1xoLEjgSB1Y=;
 b=iE101OpK2aZUsngUoVULJNPJnZIuJEu0twjGypeXURRBBH5Yat9G+N364YqhcdJmZ0Krz1vjCDjo1hdBOUs2HYgViogIUrRLy+4MszRoXzrN2OsxlmqXNPlY8Y2oT8d4+LmrFz1YPwm1vtNP6/43qGW1bc/ycR9atabvAStzidKI/afAO8ydIeHFdtgOC1MGr1nBS3hPsPeCCFYrwbQytmh7Qqo6Pknf5P6fI5yY3GwrJ/hdTmDaxisZtX+yr09cMLzDwr4Dn4cbHdwv/rlK4efyz+mNV7aO6i6q0nCsvEuUE1D86EzmQ2lOV5LAhvY9o3NhLpacBwb/untekIuJrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtD5de/xZ1Ta1YCoNeixODXl4ulZefkq1xoLEjgSB1Y=;
 b=YjCOoZqsPDd8+oA2CeYCyEcj3ZxBVWsePCpKdJO20TiiCZMAxz7HfpGxy26vuE05AZl6LoG2LfJ8+kzYM8gYiSb6x8aeIlLxZhpVjMGuLEPZQK790umBH8GHB5vvHNz6bdKf7nhvI1vUHubF0tW98IohhyyodzS7ubSeGO2i/kQ4jtu9/ww8UKCRGlULIBdqTnQJA+mJS8jU0Q4JHYm8aQgRUISSB6+/oOjcVfDDChA3SxqORC+Setl/2M/bb4+Sv0/CwaZYJ1chquRDammlDsFMt4O/UqoCV7NVbrfpMf5txYJO96yePY5s0BBk1rZ/3h2ioxeyjhMFV4OCnhHStQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MMZPR04MB461369.eurprd04.prod.outlook.com (2603:10a6:190:53::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 17:09:19 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 17:09:18 +0000
From: Frank.Li@oss.nxp.com
To: Eugen Hristev <ehristev@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Stepan Ionichev <sozdayvek@gmail.com>,
	Felix Gu <ustc.gu@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Shuvam Pandey <shuvampandey1@gmail.com>,
	Piyush Patle <piyushpatle228@gmail.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Cheick Traore <cheick.traore-ext@st.com>,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Shi Hao <i.shihao.999@gmail.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Michael Hennerich <michael.hennerich@analog.com>,
	linux-iio@vger.kernel.org (open list:MICROCHIP SAMA5D2-COMPATIBLE ADC DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91) SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-renesas-soc@vger.kernel.org (open list:RENESAS RZ/T2H / RZ/N2H A/D DRIVER),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] iio: use dmaengine_desc_set_callback()
Date: Mon,  2 Nov 2026 12:08:47 -0500
Message-ID: <20261102170911.3867389-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7P220CA0095.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:25a::11) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MMZPR04MB461369:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cb69592-1ab5-4e16-8a48-08df390407d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|19092799006|366016|376014|7416014|1800799024|261021121427099003|261021123027099003|261022075727099003|261009220027099003|261009223027099003|261009221227099003|261009221727099003|261009223327099003|921020|261102123227099003|261026121527099003|11063799006|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 6bRDkjSbedM7sDCoRwTpMiY7p+tnN22+M/N2y/5ZFTQgNiTi4GAp0WzVBUcnxQ4ptDk2OujG6/wFkoXeehGXZP92/XQUYwUirmHoNxS17v/f9JbtNgi7SeL8rKql19/niMjXgbCN0k1cas55XcNtNSrz8Hga0VYrSqnljtrNUUrdR0J4/xKIUQrVOK6+GYRo1vVn77Vfqc0abVAT3uxYGDTNvPLpsUHjY6raFUZJzGi6xokO4tMAyJIDqhr3uWwZJSrYkqgGB0Pc4wLoKv4mkT+jk+Zz9tHsWeuwMe4saSwdsAmw4sYAR8DEwIEpLOxbfLFuak/lh0DXCdAr0E017wkS3iCxO/K+7k39xw2/RUa+v9IMhH6HBgi38XAgiY6MqVZTM0tvugYwYPtV5u2rEtkpFB+aFPU29jN+XFF47GEn8TtvVMk/j6y/VWdL/VJ6lZEIcYi4nqF0UXoeYiVXDyuyHhvVFmGEVXHvsgiVw15GtaNQrEDfM5EO2zt8gdnKtZIYeC3EXdePL8Je3NGL2rqcsdqCDm82SVTCD+v8tDsuA72MNJ0ckLr2qOFI4/07wI+vQHPUv0PI/Um9u8qBHWy+tooWDLsXvyU3E4gxpvWSR5X+NEy0AoQDPwkx70uSvuNFzKnxLuF3azGx5BiGwHvgeoHwh7mCg4Ilka6wt6FWBJRawKPF3ql9X4Q296Sdo9CbkAGcksAVRZIc49KJiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(376014)(7416014)(1800799024)(261021121427099003)(261021123027099003)(261022075727099003)(261009220027099003)(261009223027099003)(261009221227099003)(261009221727099003)(261009223327099003)(921020)(261102123227099003)(261026121527099003)(11063799006)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BegK4D0i/f6u1NKTrksfWHe0Y7uboF0cLAuVWgES12QhTKgX9GDI/J5NwFzK?=
 =?us-ascii?Q?NlNEfUOPxzugLjJ0JtwhdOPd8kG+SUiAjOowQTt7K3q4hIJas44PVWwIJsIt?=
 =?us-ascii?Q?dpjfj/S+LKrvuSDValCf7rY22RNkxi8HUoCqfcp49c6WWgLJehqHafY4eUZK?=
 =?us-ascii?Q?xK6LhH7FSu1HvUDKGLPUQOUpNbUR9DzEY5j1XP3eCckxD3Pf5OhTUu2rI4Nj?=
 =?us-ascii?Q?PoCL6NFFqRq3pOgTRkV00P2SSs+WxwSle16YXeklP8+jTzBI7fsKBIqGJDXI?=
 =?us-ascii?Q?cXF0mBP3YMrWdPFhdv9kA3EvpGZ+HYz+JzckSOYxG9yHvz01GLvYyO1ZpMso?=
 =?us-ascii?Q?NN1xEbmPAok0XZ1CXXmUzUAhq5p/pTjTb/x/TQxCCsjCOUgNGHSpw4RV7QmP?=
 =?us-ascii?Q?1pE/nc4l6cFR5P6S14SIZKBjSJ7pedwvLMMQMreZbuZiN5e4hX6FAnTaClan?=
 =?us-ascii?Q?JGLeffUojDXEzG0LraBjZn3s3jE3OxqzSxExA9IyW1mAPVZc9wO1eX0SBnNn?=
 =?us-ascii?Q?oxXqHAl+zPYRdj3ML82sBt62JogOUOAUE9L09HkA+jeJmNgCVSLiJ+VUM4QD?=
 =?us-ascii?Q?L7PnN1P37fQ5vEPQecZp1a+FLVmpY15Wi1KQQBmoNf8cq1so6ntqKIX846Of?=
 =?us-ascii?Q?Bdvp5NiX59liD1ODSRX81ep1qpVZSL9DLzid3s0t8cnAH0xDt9uKwNaezFxh?=
 =?us-ascii?Q?/pw7H4CiukGVtqalZGcJwc0FElw62bbeIAdSwcwUcSwwMsSMDGBiFWNW9Jy2?=
 =?us-ascii?Q?GpeKKdF8CMdDpnaIsO10bE05SD9TKEpwdazCvq/jjE7QzZMc5wMxtWHLZ8ja?=
 =?us-ascii?Q?rNx4rL4Rerk5KUxA/9cA1UoHazF8hM3LGqZM4HsdkxPKY/vjWa5cXN1EVlup?=
 =?us-ascii?Q?Fr/AuTP1T25539XYVGkGdrRaQhzDP6l1lLwg8Sv7qnJTPSGAS/m97tT0R5f+?=
 =?us-ascii?Q?VV+iswHKXca08OSiHSd+JSOE8BHM9Jk5kO/dmZHUMycZcPDVBHbCXJol992y?=
 =?us-ascii?Q?/f0QJUVSkBuwtdgyKs87wqTgeJVBUZqy6IXdcV+BuNxnx4CRWXuqBcwwgFiU?=
 =?us-ascii?Q?V0goi59t2f4khUnmVXr9Mu7IasBOCYVwEr4EwaObXn8cdJvpYsHdflqrVrQ7?=
 =?us-ascii?Q?Df1cGQ0OtxoL2om2uTtaupA/iUzwIsoSQiOToGXoCNSzsvbubLqJC1e6Mm7n?=
 =?us-ascii?Q?aApZTGan3yF8CGl1CSavJngwVfTABvOVbi52IaSui0DfNBeXTcbJZmkUXlKG?=
 =?us-ascii?Q?sV0ueLLcBhaBu1DthRn6/MUbZrctuJYDuZNV+GbAqDuiJOSeDz3eZ7PKQSwF?=
 =?us-ascii?Q?zCsF+clDPB5E72r5XqPd6WHb0XASNRvSnrUwi13YqkmfINSbvV203/VcYB9S?=
 =?us-ascii?Q?YpzpLqN1l6IAaxUew37SI9cTTP43D0iW6YC4Op5YFcKIyXdgrx2GeqDO29wS?=
 =?us-ascii?Q?WV6S+ieEQ16quc/0K0+RBRu9Hd5HPMwqwRjq0WF/cYm7A5CULa6Ni/oakC1M?=
 =?us-ascii?Q?jjdNStpqzTFOJiD4G3/pj61DwoGfaIU13t+r0M9qv7JPLFSMLljQruHk412r?=
 =?us-ascii?Q?hrxVQ307LbCHUF7NRI5ar9xtIKhKGhQFaMmryuEEUE+Cg+yDxegOsrXZA7oY?=
 =?us-ascii?Q?iIT7nx8FzCvzF/c7iol+tK9hiaZelyXW8iavb3s75Ypmg4tEtDjgQJ5ajT3A?=
 =?us-ascii?Q?/loR0ldli4yWrgEB0KSQril6J0DmtbQ+SVyi88G48BKDsyd5+UhkmITCI36E?=
 =?us-ascii?Q?Rm1W/xp8NGY37lze5eeWgK4xIAnRevU=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb69592-1ab5-4e16-8a48-08df390407d4
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 17:09:18.4703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sBj01PgA42r1MxetSMHYm3VhZkg+kMjtW01Kt3BiBZ6xPoY8n/VworPjgvWAg95J9xPelViuq2VDFovvBAf9btPgkTwdP1f7BkTu5A5MDZ8aIedTFObRm0oJjr5jnJLD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB461369
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_090923_726271_B4D96370 
X-CRM114-Status: GOOD (  10.91  )
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Frank Li <Frank.Li@nxp.com>

Replace open-coded assignments to callback and callback_param fields
of struct dma_async_tx_descriptor with calls to the
dmaengine_desc_set_callback() helper.

No functional change intended. Prepare make to struct
dma_async_tx_descriptor private to the DMA engine.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/iio/adc/at91-sama5d2_adc.c                 | 3 +--
 drivers/iio/adc/nxp-sar-adc.c                      | 3 +--
 drivers/iio/adc/rzt2h_adc.c                        | 3 +--
 drivers/iio/adc/stm32-adc.c                        | 3 +--
 drivers/iio/adc/stm32-dfsdm-adc.c                  | 3 +--
 drivers/iio/adc/ti_am335x_adc.c                    | 3 +--
 drivers/iio/buffer/industrialio-buffer-dmaengine.c | 3 +--
 7 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sama5d2_adc.c
index 78081cbfde5e8..d479c9bc9b3e8 100644
--- a/drivers/iio/adc/at91-sama5d2_adc.c
+++ b/drivers/iio/adc/at91-sama5d2_adc.c
@@ -1240,8 +1240,7 @@ static int at91_adc_dma_start(struct iio_dev *indio_dev)
 		return -EBUSY;
 	}
 
-	desc->callback = at91_dma_buffer_done;
-	desc->callback_param = indio_dev;
+	dmaengine_desc_set_callback(desc, at91_dma_buffer_done, NULL, indio_dev);
 
 	cookie = dmaengine_submit(desc);
 	ret = dma_submit_error(cookie);
diff --git a/drivers/iio/adc/nxp-sar-adc.c b/drivers/iio/adc/nxp-sar-adc.c
index 2f716a2f97b80..82d8d921b0293 100644
--- a/drivers/iio/adc/nxp-sar-adc.c
+++ b/drivers/iio/adc/nxp-sar-adc.c
@@ -696,8 +696,7 @@ static int nxp_sar_adc_start_cyclic_dma(struct iio_dev *indio_dev)
 	if (!desc)
 		return -EINVAL;
 
-	desc->callback = nxp_sar_adc_dma_cb;
-	desc->callback_param = indio_dev;
+	dmaengine_desc_set_callback(desc, nxp_sar_adc_dma_cb, NULL, indio_dev);
 	info->cookie = dmaengine_submit(desc);
 	ret = dma_submit_error(info->cookie);
 	if (ret) {
diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index 8ba7b0fde8a19..3e52b7d660dd3 100644
--- a/drivers/iio/adc/rzt2h_adc.c
+++ b/drivers/iio/adc/rzt2h_adc.c
@@ -394,8 +394,7 @@ static int rzt2h_adc_start_dma(struct iio_dev *indio_dev)
 	if (!desc)
 		return -EBUSY;
 
-	desc->callback = rzt2h_adc_dma_callback;
-	desc->callback_param = indio_dev;
+	dmaengine_desc_set_callback(desc, rzt2h_adc_dma_callback, NULL, indio_dev);
 
 	cookie = dmaengine_submit(desc);
 	ret = dma_submit_error(cookie);
diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 600f975f1d7b5..fa2a781e37777 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -1901,8 +1901,7 @@ static int stm32_adc_dma_start(struct iio_dev *indio_dev)
 	if (!desc)
 		return -EBUSY;
 
-	desc->callback = stm32_adc_dma_buffer_done;
-	desc->callback_param = indio_dev;
+	dmaengine_desc_set_callback(desc, stm32_adc_dma_buffer_done, NULL, indio_dev);
 
 	cookie = dmaengine_submit(desc);
 	ret = dma_submit_error(cookie);
diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
index 674767da3ac37..f0239f5f30afe 100644
--- a/drivers/iio/adc/stm32-dfsdm-adc.c
+++ b/drivers/iio/adc/stm32-dfsdm-adc.c
@@ -1006,8 +1006,7 @@ static int stm32_dfsdm_adc_dma_start(struct iio_dev *indio_dev)
 	if (!desc)
 		return -EBUSY;
 
-	desc->callback = stm32_dfsdm_dma_buffer_done;
-	desc->callback_param = indio_dev;
+	dmaengine_desc_set_callback(desc, stm32_dfsdm_dma_buffer_done, NULL, indio_dev);
 
 	cookie = dmaengine_submit(desc);
 	ret = dma_submit_error(cookie);
diff --git a/drivers/iio/adc/ti_am335x_adc.c b/drivers/iio/adc/ti_am335x_adc.c
index e53c839e87ef3..230f1c990317a 100644
--- a/drivers/iio/adc/ti_am335x_adc.c
+++ b/drivers/iio/adc/ti_am335x_adc.c
@@ -259,8 +259,7 @@ static int tiadc_start_dma(struct iio_dev *indio_dev)
 	if (!desc)
 		return -EBUSY;
 
-	desc->callback = tiadc_dma_rx_complete;
-	desc->callback_param = indio_dev;
+	dmaengine_desc_set_callback(desc, tiadc_dma_rx_complete, NULL, indio_dev);
 
 	dma->cookie = dmaengine_submit(desc);
 
diff --git a/drivers/iio/buffer/industrialio-buffer-dmaengine.c b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
index b9f8b5b3aa6b6..7ecb9d875b8e8 100644
--- a/drivers/iio/buffer/industrialio-buffer-dmaengine.c
+++ b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
@@ -160,8 +160,7 @@ static int iio_dmaengine_buffer_submit_block(struct iio_dma_buffer_queue *queue,
 		return -ENOMEM;
 
 	if (!block->cyclic) {
-		desc->callback_result = iio_dmaengine_buffer_block_done;
-		desc->callback_param = block;
+		dmaengine_desc_set_callback(desc, NULL, iio_dmaengine_buffer_block_done, block);
 	}
 
 	cookie = dmaengine_submit(desc);
-- 
2.43.0



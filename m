Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B05606D825
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 07:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZWWh3AAS;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Zx2SHYh8;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=uI0lbW0C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EJlKqjpAijH3WS8yEeI2US1tgZ0HoqeMyFkM97euRXg=; b=ZWWh3AASMxV/Do
	w/pJU0dbQ2Cueiwe+eAuTFcUNNoeSm/1CITJSsrXJHfAqpYm0evxK5P0c6yiMJoOv9HFlcxX5mX2v
	BLTdtdHED04jkxWka8GdAOV/J8AVMuWi20wFfELsIw9IByW6e44SuWVO6OKoDdIBL09dJUOyqhcI4
	zVu/GMtzkvvWBXGOZWnBVhsC9Kasuqq08owhsTUAZXp5pzwBlfAUSSsR31XQ9Co3lpGp3HrqFdEt8
	VF8cvoYo/FO10dEC2ngXtRRpCMvpKEbdHu9sEflSmCmX6xe1lEamDB1ZeHXVgaU+FhKE07GljIBsI
	jt6PZYz686pB7tXjeWrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVaK-00000004ZJu-1Ws7;
	Wed, 04 Nov 2026 07:39:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVaI-00000004ZHL-1WVU
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Nov 2026 07:39:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=EJlKqjpAijH3WS8yEeI2US1tgZ0HoqeMyFkM97euRXg=; b=Zx2SHYh8p+QrXL+Bok+pZ8dc1P
	7PIAwOY2HDYp7tB1HO7Y5dEuuzQjndC0k/UlIb5Rqh4rh683KxXbgoODC/PPsZ4z9acofyKH6n1zA
	a/IvG12EDEFvd+a1f/nlufD4hJCvjC1ADj6ZmDeDgmWAmqEpDCRUOS2PFrjHzTzHs6u9JlQn+lZ9Y
	kDjqfDFamdpGf/PnmQ+oKUPnbUSRgtw4XUNVNegTXXjuiiGrahdncmEhLt3vhanFgPSoNI3gWWJvo
	xZr/m7wlDxbTNSuG+Ae660/fJNoT8UAE55n+cCCwQ2X61DtEey24ZoS3rQ4TmSjAH0yCWfxiFMo10
	mnvAB6rw==;
Received: from mail-francesouthazon11011068.outbound.protection.outlook.com ([40.107.130.68] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVaE-00000001JeL-0v9I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 07:39:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FB+6TvTOinDX+K63TLlbqom7VG2shRwdB16+N4fICu7uFi6MV0t3mf3RtmNl9jcifdJSP5+e2dERuYabOxZUuwMnIAMwCgJsx9K4VykNmxBxwcd2z7RzeptJ3nO91dMVgQ/p0ZVETBd5dH8CJ49XCsGZriugcfEb9VjbSzE5ao/3XNeTIltyOz0PxLSrmc5jwGU1X5/myJZB9JtQ4i0msSO+9xb3h/iPIhyazGGUcjhxO5pEblrzxhUQNiHRg73EXUp1umCEBw26IaaJriwn43CnkJQ/qvpiUAc0ydDESu7ds3oC1ci1ZLkwpH7Ma0gTKZilNnaEFvePhSrF1Qb7ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJlKqjpAijH3WS8yEeI2US1tgZ0HoqeMyFkM97euRXg=;
 b=vLCW9DXTyfdvSyLMkequadBx9DpGVsw3l4SDSDYHaEuXKBsxsb6YIsDEehaiWAE3g4PlpFtpMf/IbKI4R9DpGdW1yp1lRaWpzgtMVw2cYhBHPOOmovL1BfTPpQyNeGk2jvu4D/UD1vSrJzwQ64XZ2iQN8oMEXhg708bxwW0DaJGfRvXrYmhgEI49Kp4tuVmL13fUSEYzcg0cWZjff9PL96wfoMM/ERV9l0rEqvSNO+Q8wOildTzFlv7zWX+QLJxFO8yCTxjEet2SpagR9GVO82UomGSPfvSoCM9560dnWNKhS+vJzKZPNctC2wDEU8lMXyp1Z9PY92+E5UtH6mmbbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJlKqjpAijH3WS8yEeI2US1tgZ0HoqeMyFkM97euRXg=;
 b=uI0lbW0CeLRcJaGaMF8BCfe9lh0OCmrziuaCmfT98nJj+qMCQz3EYDUy3lMdE0DCEQxS3fQYN+/ewN8R31G9NmQPhIbGswhBVHu+ehtRp4gr+X+rScZNFOlQygOF2XitubWCc7XKTQ3XBJPZQkozCInYjJFjnAv2K/8g1XD+GOFbmRSk3n8N14ETHiVBDffzcIQOLVs3FdjM7UuwQ8Q/nShdrAqtcQKWEmu3++BOfGzB+A9YZV4IJjkDIdcmQX73viv1+RgdZSbn3UAEX2vPfKIdSCFoHC5VO7Cn1floqftv/ynjW03toO5HiAO3DeP7kAUvdpRbbJZ7UcANP6Gd2w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB6849.eurprd04.prod.outlook.com (2603:10a6:208:181::7)
 by MA6PR04MB404727.eurprd04.prod.outlook.com (2603:10a6:250:58::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Wed, 4 Nov 2026
 07:38:55 +0000
Received: from AM0PR04MB6849.eurprd04.prod.outlook.com
 ([fe80::5935:a7b7:baf6:6c65]) by AM0PR04MB6849.eurprd04.prod.outlook.com
 ([fe80::5935:a7b7:baf6:6c65%4]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 07:38:54 +0000
From: Zhipeng.wang_1@oss.nxp.com
To: Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Radu Rendec <radu@rendec.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Fabio Estevam <festevam@nabladev.com>,
	Jindong Yue <jindong.yue@nxp.com>,
	xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 07/10] irqchip/imx-irqsteer: Allow building as module
Date: Wed,  4 Nov 2026 16:37:55 +0900
Message-Id: <20261104073759.386777-8-Zhipeng.wang_1@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261104073759.386777-1-Zhipeng.wang_1@oss.nxp.com>
References: <20261104073759.386777-1-Zhipeng.wang_1@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:194::9) To AM0PR04MB6849.eurprd04.prod.outlook.com
 (2603:10a6:208:181::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB6849:EE_|MA6PR04MB404727:EE_
X-MS-Office365-Filtering-Correlation-Id: bb2afe8e-a1c1-4c0c-9e95-08df3a46ad91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|19092799006|11063799006|56012099006|261021121427099003|261021123027099003|261009223027099003|261026140227099003|261102123227099003|261022105027099003|261026121527099003|261028144727099003|261022075727099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: itzLM/dOb21xmq+B7EG36dihxGwLvJ8eeJ3vCyZqqZmf8+dfW84ayRvf1FJmg1Oe3idBYtj9fJ6IHgVzZ70wCMyEkpy4bp4QFk0qO2jSamm8jV7ISK4+T6M57G5f10DBxC7JfJjGn0PUGhVesJVNeKoxJZovBM/law/r+L5dwrIVj0kjYSrwalRyPMBXtoEFxQ9DM5UPm5zUxgkEvfYw8km1VIx6cmYNfyAfYXAHShWtlHFPieUhf3BRgmhnB7m3a/s0k++TLreiZMBC+CGMhngXogKKloOFVMcFzzEJF4N9iTSU9oSjXlFf3+3tYCrrtaF4OTIylXQ7wvZ8+DLvZkludJ8se4FeUfyLq2miaIbKW0gzD69dbRm7nF+PuXl8zX7p5Ty3vKzXychVNgPE2mFI+8FxV4lTeE7VyY3h3FB5YhubCWCIpXtQJAsC7h54f6Q4MzSFt0kZbZ9GCN553pcmg7CX6WI6o9d21op3nMJrP9+lgBnxraisjSL4y+oYeW/7z/lVnQKNGyOyjCqmFJGn14ptpFuZbUBAa3nqVoozgI+l+jxHQWjf+S6uANvw6Z8sn9GwPnYoN2/jIPolgLY/s9YYTt5q53lpSNzVCKFjjrS51/yTXybBsp/F6YJfM6LIsB4N4ovqJQcMHcDrjklRu5IS2D5jEvXDF8R72/E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6849.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(19092799006)(11063799006)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003)(261026140227099003)(261102123227099003)(261022105027099003)(261026121527099003)(261028144727099003)(261022075727099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hhwiom05D1pNXfHn2WGjhpYw6Gz2BnYrGmiiWUbeTaGDCQHfvrl8/sme+zir?=
 =?us-ascii?Q?NodFmNLzrb1IvZ9m00mKazFamMQksYHEJAmX7xbsamW+eYusLglyjl4ACXt1?=
 =?us-ascii?Q?V8NSqXO1BM16AiKZjRkCjyUyvcaEonL2egI8ekFX0fcE0sMRXIB7EUN8I0hd?=
 =?us-ascii?Q?Z8vw5E/9ru/N4vvv38cedMEl4LxCka4ocWuisySjSwqI3hA/GX+hfwhhK8ba?=
 =?us-ascii?Q?bscrAILrx3JNw6pE45F9p2ptlt1MvLLu2exbW8bMMTwcYGI9WCHt1JzNQa14?=
 =?us-ascii?Q?BpbM6ccln2Vyw/2byp5OcRsNP8RwsR7UtYj1/B/nsMZmOzNm6rg/KkWN9RGR?=
 =?us-ascii?Q?GQ53WF2CON6kMgVV46VYk0DvSEwUAJF1Dn6asDTa5CvHvFiwXW7iLIvfj9sZ?=
 =?us-ascii?Q?e+Xkkfg7QJ/jTNkK6SC6Dpblt4ZNalLa7ERqZ0xGu0xICv1K9TxH17ppZeb4?=
 =?us-ascii?Q?V+RfT2Sm7HytB+dD2Iec7V+99iW0bIKWI1mGYQdKG7nSFTWZgAina0r5UBG2?=
 =?us-ascii?Q?ZNHbqzlcGeioPIyCuoI90mjOXv1Cgqdz454sHruibdWNxqIrCQzyXjv7fl+b?=
 =?us-ascii?Q?W9Nq3J3soks4OsQWkVxZwj3EA1Hq4LR411BZPDUNuXJkmKbqiqoaBa/j6cP/?=
 =?us-ascii?Q?hUNMtcTxQw9Dd8h3KI7BzR/oK/VnPTTL6reoWDUHnYGQhhYcgWM8H4/ReGA8?=
 =?us-ascii?Q?9F1pQqI4kCPQWRLVwyFvCBFgNby66s0214ckAQpEzEjrPWRhN7I8qsfThadF?=
 =?us-ascii?Q?Ycs0/EMn/IhI8vbVyBHBxo5oWFzrfRnRolHpWZ+6+tzpwrVtV6cf4npoV+RT?=
 =?us-ascii?Q?NQeYwX7Fx+Ti2o/lvOHFmT1/Oz4Y2W+Vtj6QrXFEM9ujcdbSIKZDDt9UJGe4?=
 =?us-ascii?Q?WIG7j6B/zKoDH1gt2Pwerw2KV/yhlf3Ia4FF2ZnpIZyN+lEb6oLz/Sc+e6hO?=
 =?us-ascii?Q?V/HK/CUgvm2VIVu7ImsKZdCqghztshVnrV9T+9Tn01RR9riPscux6br5huII?=
 =?us-ascii?Q?NJv6DzlHD3Dik3CD4bqLxJaMIuQ9jsVo0wLx8LnigFTtXEh1e4w/BRHmwJtV?=
 =?us-ascii?Q?CjJeqffLsu6uHoZS+Z5dllmO0bcKUvYD/L4YPyv2uws1nwpea6BMkG+s4u4X?=
 =?us-ascii?Q?DIf1YC4m3FF2pdUwVnBtAO60HaEZmrGv9kpRCbs9AGU/OUbSUrvJyyZLKkJW?=
 =?us-ascii?Q?/3JHbzxubMU4TNTaPllQqYatAw5ek/gUMBIuofQsw8MeC2qOC1ujwrhZyjGr?=
 =?us-ascii?Q?62bEq/8kTNTGp6eTxt/m2rYypQCMBIab+hP5G4w1T5/V9x2j5uuPrwQvnswk?=
 =?us-ascii?Q?Bi5zprcDgsl04QgXWezYNnmi9Fd06m5RsSIUHqKDEz32mrC528Zk0f2uvWEc?=
 =?us-ascii?Q?/n+Qg9sv3AdlH0ED7a913x7tsAKh6U/eoOiurYboK3ax4WibldfBwaT+Y2sL?=
 =?us-ascii?Q?11Nnnyv73w70kY4pljNenp9ja4Jcrrk/ACSAM4z/kdnXKB1XFUfrW1gCQGnN?=
 =?us-ascii?Q?60zb7758TJ/WAyleOX/5/ujByI1XLJWeTJHV4ZaKx5LEyqt6YhEmZiZIsPYF?=
 =?us-ascii?Q?p6KYJ6L7hJzmA+WNgzlQlDis6jIk3ztLqILlCg33Y14bgTb7zpI3DGWLlmJE?=
 =?us-ascii?Q?P0jvLJuS7u/ZwSleV2gu8MHrbyWpyxMit0+3B37XZsqJNzYHFRbfkrLCJvz0?=
 =?us-ascii?Q?fwLwFm60M6HVcV1661qVGyVHegP7uvXBhpRTMvyUKqggcI+56417RxPZIscl?=
 =?us-ascii?Q?+e+rufidssRez2QOhBVrlpo5r1NYm5oDYNT7hXE9DbtcP+FGbZ3MlEu141iH?=
X-MS-Exchange-AntiSpam-MessageData-1: fKhAwWU9OmIwOA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2afe8e-a1c1-4c0c-9e95-08df3a46ad91
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6849.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 07:38:54.4953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZMB3BHmTVtFFhkS59adsSlHH+ehtd5pt76GkQkgEENlqEuH1bjQZUWkkouESiWlxGtWtxozIYPbEbNFxZlH6oIW2BfzVFeuBMW2TUj4Qs3g5MVgH4SrHeGzAXBFPCrC4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA6PR04MB404727
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_073858_166463_D4567FE9 
X-CRM114-Status: GOOD (  14.11  )
X-Spam-Score: -0.0 (/)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jindong Yue <jindong.yue@nxp.com>

Make the driver buildable as a module by turning the Kconfig symbol into
a tristate and using module_platform_driver() instead of
builtin_platform_driver(), and add the MODULE_DEVICE_TABLE() and module
metadata needed for autoloading.

The clock, runtime PM and IRQ domain are already owned by devres, so no
further teardown is needed to support unbind and reload.

Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Reviewed-by: Radu Rendec <radu@rendec.net>
---
 drivers/irqchip/Kconfig            | 2 +-
 drivers/irqchip/irq-imx-irqsteer.c | 7 ++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 20b77fbc51ee..105108d2e6ff 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -555,7 +555,7 @@ config CSKY_APB_INTC
 	  the controller's register.
 
 config IMX_IRQSTEER
-	bool "i.MX IRQSTEER support"
+	tristate "i.MX IRQSTEER support"
 	depends on ARCH_MXC || ARCH_S32 || COMPILE_TEST
 	default y if ARCH_MXC || ARCH_S32
 	select IRQ_DOMAIN
diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 063a071ba163..a14a8b80d60e 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -10,6 +10,7 @@
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
@@ -359,6 +360,7 @@ static const struct of_device_id imx_irqsteer_dt_ids[] = {
 	{ .compatible = "nxp,s32n79-irqsteer",	.data = &s32n79_data },
 	{},
 };
+MODULE_DEVICE_TABLE(of, imx_irqsteer_dt_ids);
 
 static struct platform_driver imx_irqsteer_driver = {
 	.driver = {
@@ -369,4 +371,7 @@ static struct platform_driver imx_irqsteer_driver = {
 	.probe		= imx_irqsteer_probe,
 	.remove		= imx_irqsteer_remove,
 };
-builtin_platform_driver(imx_irqsteer_driver);
+module_platform_driver(imx_irqsteer_driver);
+
+MODULE_DESCRIPTION("i.MX IRQSTEER interrupt multiplexer/remapper driver");
+MODULE_LICENSE("GPL");
-- 
2.34.1



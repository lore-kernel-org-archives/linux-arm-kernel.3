Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6660E606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hWr157b+;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=okCISsX0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dCt47WZoMvpuJYTUXoeGlP5psA8sHQJaOmeiwuB8IBU=; b=hWr157b+IXyULKpq9D04FKppm9
	qKPOLCwdr0NCEs/r2OklpLNyxUZPftFjCqPjKuouC9IqnkZIsI2rn5zozLjMR0eFNqjZXVxjg1SOM
	EN0Ru6P8eRQtT1apud0czqCSNQOaJQLrorJNlVQYZZUIrVctm12PLx8tU91iz68J9qxq+S86AZacG
	kUmmajTIDrKV8xOHNHamiJgavJIv6nQE1CJzzNm1U01/GR9X1dM6CjfCbDC+tetus7zMyUcpHxURO
	WF/kCIO70GbsNWclON5S7R0GlwrOw5nM7ifh0xRp06MRThFkomIR+rViB4IghusJDhxcMTSZPZ+7k
	3NDHWVNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEBg-00000002SYZ-2H0F;
	Tue, 03 Nov 2026 13:04:28 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEBe-00000002SXa-1wBt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:04:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AnwEsY3YzQdBVMn2Ed/mUvr/xzKVCfv+YaTKFpWEze4Onn10NriHnoFIIY8HYk2VX+HLOp0qWVwBZHVLZLsBYfF2o+dZJ2m49Taef9We3G2nJUzh3Op3fYYiKbgDINlLFaa1L9izd6mm8foK0JSZTsnZh47wHsUx7PzB83MRlEWHPwyFJv7rqsYmmL5i9TdvaKX/oaGK0iJ0bMUdAbWThhp0inelySUGJNuY1IqXFQdQRVvuNNiBXOeXAhRoeVvRo8U1cyESgvoH0nuDhwnOBGcnWjU/dcpODvQFr3+b40l0/4sZCz1mz00J2339ANxqcN+Fh+0ri7rix5k/0c2Mdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCt47WZoMvpuJYTUXoeGlP5psA8sHQJaOmeiwuB8IBU=;
 b=jc6fu99DeJr9S8pjDGQNWDEqDmzScmCTKXg0Gx4/34Bi7r9yvjgcX8hanjbOc8Cotc+vtPoQDKeKVLj4r03HcDy7u5PqRh9ogO5uvCDRBgIPfWn2XxZj+Yv7+jb+Ldwm6y80jMKspUcmd5XbQCQReI1Afx61u3NETUX16VzO+4VqxgtFXUTdRbB2hRYsnc3cIf0NanJEz4e30dHTduk+eeC9HzRvDTS46WJFHeSaarujs/ojNPsN/h5NXkSWZp+QE5P1clEJoBrbCQMMCra58JHmTLIX6ncSwqWT+4rhgmWBvDOJTS0SNPBNC5vEvczSE8pie9gbzXDxjxOpzfDnoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCt47WZoMvpuJYTUXoeGlP5psA8sHQJaOmeiwuB8IBU=;
 b=okCISsX0Ck6ymj8sOw51QuzYFmP8pqTy8DmYrhj6HuSzgjfhAlOsNXnNdxO6GMgQ9FqozNcIPJV7+sFRMvHGz1XYrxsVQ2nr2KpBPKXFMsIiyb+C/eeiObs94BYV2csVJih35obcaAWwuihXwg3gCEEMbaAofe2oLBYIqVo4I1hFUMpUR+m//9qhRcLey7wvxCYCA9HIv9HSETE4oYlZJ3vfVQgRbOIAueZ01gf+0reUnzs3gkEHcjH3yf/i6oRs9+ZuaRBHlxeulwiDeW3zvy4esO/0cTEtn+ZyuR4lF8YyrPVTWtr41iRBA0vr6lgIMzLbKdaCJWIFobFpyQwzHQ==
Received: from PR3P189CA0022.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:52::27)
 by DB5PR10MB7795.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4a1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 13:04:17 +0000
Received: from MI3PEPF0000855B.eurprd05.prod.outlook.com
 (2603:10a6:102:52:cafe::a5) by PR3P189CA0022.outlook.office365.com
 (2603:10a6:102:52::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Tue, 3
 Nov 2026 13:04:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF0000855B.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Tue, 3 Nov 2026 13:04:17 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 3 Nov
 2026 14:04:59 +0100
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 3 Nov
 2026 14:04:13 +0100
Date: Tue, 3 Nov 2026 14:04:08 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: <Frank.Li@oss.nxp.com>
CC: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, Andi Shyti
	<andi.shyti@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Dong Aisheng <aisheng.dong@nxp.com>, Frank Li
	<Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"Oleksij Rempel" <o.rempel@pengutronix.de>, Mukesh Kumar Savaliya
	<mukesh.savaliya@oss.qualcomm.com>, Viken Dadhaniya
	<viken.dadhaniya@oss.qualcomm.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, "Pierre-Yves
 MORDRET" <pierre-yves.mordret@foss.st.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>, "open list:MICROCHIP I2C DRIVER"
	<linux-i2c@vger.kernel.org>, "moderated list:ARM/Microchip (AT91) SoC
 support" <linux-arm-kernel@lists.infradead.org>, open list
	<linux-kernel@vger.kernel.org>, "open list:FREESCALE IMX LPI2C DRIVER"
	<imx@lists.linux.dev>, "open list:QUALCOMM I2C QCOM GENI DRIVER"
	<linux-arm-msm@vger.kernel.org>, "open list:RENESAS R-CAR I2C DRIVERS"
	<linux-renesas-soc@vger.kernel.org>, "moderated list:ARM/STM32 ARCHITECTURE"
	<linux-stm32@st-md-mailman.stormreply.com>, "open list:TEGRA ARCHITECTURE
 SUPPORT" <linux-tegra@vger.kernel.org>, <vkoul@kernel.org>
Subject: Re: [PATCH 1/1] i2c: use dmaengine_desc_set_callback()
Message-ID: <aunbyALexzDkGj62@gnbcxd0016.gnb.st.com>
References: <20261102170004.3852546-1-Frank.Li@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261102170004.3852546-1-Frank.Li@oss.nxp.com>
X-Disclaimer: ce message est personnel / this message is private
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000855B:EE_|DB5PR10MB7795:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b6f2809-5464-4699-20b8-08df39aaf79d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|7416014|36860700016|82310400026|11063799006|56012099006|261009220027099003|261009221727099003|261009223327099003|261009223027099003|261009221227099003|261028144727099003|261026140227099003|261022105027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: Pwo7uJT+cJRwHjkWmQ6CCfHj5g+9jtQm+QhV4zHTVpPoEXnsZsc87lkPMHzYRDxflllEIWWs9LJtg8rEQN5DLdmMwg2pLUl7/qHvTUpB4Oi5yYrP5kR+3snruPmFgAYAjEU7Fq6gX72hBunp5car3rVLKssUidVBNBpafiVDZ/wJbNekSPt+ZCvsahq+nVjRdR39JnWBiupSgwz2strxBHyJ58CVBO7JgAGWPK/kp0SJMTyit7nCF9ichBAoRGXpiW3q/KKe6saPdzjdk6OzDZstAKNoQWCXCjx0rX3aa64DCUmW78kjm00Y1/RYlbOfvYsg+orYH0KXtdOtO4jkSWp7/ih+t/OLpA/cANXfJpp/PcBwrADYryVMsds4ewY7P5JJGBJyIYbduPTsLaDH+sCwLhSoDk3Ns6bAkitQPfcEFcesDey10xR5DpitEByrZP2VzEmOIWC99z87aujvciH9cum6Rq1HmifOtx83GvL6UVMcp0Stb3nkdffQGNWHDaqwyTsdCawdctaBehQgmwfi8npXcmtQ9hWb1KwuaQDOxhagnvAY1pp1FRw7uaO5xmNl9FGXxzsro3Ll7nn/KTAff0axhGGNPVVrBkCRTcOHlGYDyUEKeI98OzUOS56iM+UrXZRxIS1mb/frYPL9TFY0P2UO8XGaDuwLVKfeQRybVKLbhGFApZaYc7joWnbQSUr5EHUDn4tV1j1eqRp5oQ==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(7416014)(36860700016)(82310400026)(11063799006)(56012099006)(261009220027099003)(261009221727099003)(261009223327099003)(261009223027099003)(261009221227099003)(261028144727099003)(261026140227099003)(261022105027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /fXE6qgHMt/v35Jf5wmd+wRrRm6ak2wtq/ucq0OFiXCdmanRedPLlznkl9Ll1uhXAUKa9Sen36tsphqSf8w/VZ54wbiKp242+Jtfq9AC2sQfQFJogsnK8ivHDVtZzM9KhrHqZd+v4Oe7Des9Jul40+Ry5FTDms+xIv2UQ9X5eHR3wUwfEZ1AgjH6yDCM/1XmfOyRVtaSWaDwx7D+lv7vZDaMeM+dTXf7p8k5j9+VEWZzHvzOw6uYf5QbAV1IEVKShc0YJbrb2fBK3p7q3WBGqGWP2p+DeUZpokogj61tKAUXM5mZ1VQAXksIj9jvn7tu0nHOmz65zHmW6vRme6TQTOr8C3OA5pkAZlqBDUNoRgLPaL6/x9lZGPh2opj8gDpvu47scY22Fep74JdjJX7EvEbpLKV1hRt6mAv7dogVWfJCHja/lKvGQelRUGgjol1A
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 13:04:17.1056
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6f2809-5464-4699-20b8-08df39aaf79d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF0000855B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR10MB7795
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_050426_523652_70389465 
X-CRM114-Status: GOOD (  10.12  )
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

On Mon, Nov 02, 2026 at 12:00:02PM -0500, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across various I2C bus drivers.
> 
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/i2c/busses/i2c-at91-master.c | 6 ++----
>  drivers/i2c/busses/i2c-imx-lpi2c.c   | 3 +--
>  drivers/i2c/busses/i2c-imx.c         | 3 +--
>  drivers/i2c/busses/i2c-mxs.c         | 3 +--
>  drivers/i2c/busses/i2c-qcom-geni.c   | 3 +--
>  drivers/i2c/busses/i2c-qup.c         | 6 ++----
>  drivers/i2c/busses/i2c-rcar.c        | 3 +--
>  drivers/i2c/busses/i2c-sh_mobile.c   | 3 +--
>  drivers/i2c/busses/i2c-stm32.c       | 3 +--

For the STM32 I2C driver:

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain


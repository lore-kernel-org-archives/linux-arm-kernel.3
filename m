Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9925E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 03:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CzZpaYkZ;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=coXZM9CP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vJElXUuu23Tmr33Ek8+YXRuweKEpn1hlvFNUSPvtfXQ=; b=CzZpaYkZxTrJroF2vLEAuMeyUC
	/n9OD5acpIEEv86o6AMr6d/cg3T0pvX0wHBf4VDX8yhGnteOyOsaPg8ZKTLckL5JK12a5eTeOXMR3
	BpNW/gEO7OJNHCINHfp8rsHJEwQ3sMAdg3MvpEDMJhaF9lkiwLfDa4yZY5Vxk9+XR5P5J3so3StYY
	MWJExBY8CxZB/1zmMwfoZ6yr58avLXKTKAwKy01n4L5KXewkSMf9EvMqr9euleD14uPbhd7MOQ8Cl
	e/3jLKVfd8VtnZLrzeahVR+ZgIFIMWUtwI0/wWUoyBu9RaTRHfQ2I4nVIYXzaQP/AmHcP+VCJIVwT
	sBce8+Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLBA4-00000001eOh-3zON;
	Mon, 26 Oct 2026 03:14:12 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLBA1-00000001eOK-47Wi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 03:14:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=au1oCUkwILIHY7UpmgMocKWIf8SjE+RWfB1d548iyvRWbjqrXdBeNUYP0zf1tQRvwqxzhrOcdAcViQmlnDQMWfjdekqUX8h6hxSnVvS16I2MTud1gBGzptf7PhKRC2VREPdykjU3SEnkE6fQz9swFlIxXxW62lAnXrT/ZU6iqAHAH/yxtVhYrzTlvaCOrD9HQZSX3aPhwypk4C87vr3/82ZjOwtMv1I7zhj47PJXxJXFx0u+ZxbzaTD3PxSv12Zg3lYq864UBBfLGBohICIfxHKG0ZXsicOb+8oUPVMUzVNOezNOaJFH/B1mUsUpyZtBIEH0ubyTzP/WQv4E6lLaoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJElXUuu23Tmr33Ek8+YXRuweKEpn1hlvFNUSPvtfXQ=;
 b=BX67koEfUH5KdGX1RmH7So/IhO81d1ll7duaMRux3KDStgggE61NO0rfXZcuUIssnHmABJIj1Gj9DAYpvM0rOqi7dbWcRmVr7kkRXMm7GZ90/r7jt6JrmOMI2W5aZRLYH5/lqCuKt7owPsLQotv8lZR1TWCmP04ICthq1tZu4+Vd/UICgVH3M5vWZuI4uBVknXY6wcfB7oNiKAkyzv3hxEb+oZU5OEg+5/xSH0QarrXppqhsqsAQ2lbc0JlDga83cXNAepadUYqLvKnaAMluX0uas02eOztzsXt56ivuEXiaLVeIcOmxwuhllfgDYR7Yk2k3Rgkf+GYDI/zffxdo0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJElXUuu23Tmr33Ek8+YXRuweKEpn1hlvFNUSPvtfXQ=;
 b=coXZM9CPY3d6zJoAK2y8SuclRR3DxTmhaFlD7QNSnA/Bs+uvYmiPNhAXKK6Izgg2SLJXwIesWTi1u1sIsjMgMNQAltTlDjCzVyr19RActUbw4NlvQgDfHooCk39UHlC62odYT0MyGZcUcXFXa68UOgA6zKlOqRXhW4s4FaO51OoPu2cfvKLbUiiuZIxwzghGEI9Y3/77mv39VZYjhPiQm3NVwgzdDzbuJe7dKmJ/99bvtj85PKgi1fvonP5ln2owFwjDABeKqQPjQG7zH9CBJkPMAID0VOdko1PMh1QE+jTeMobL3h5C8B1V0jIuBMJKmoljFRIz35B8NFaUDxG86w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB350878.eurprd04.prod.outlook.com (2603:10a6:290:c0::7)
 by PAWPR04MB9838.eurprd04.prod.outlook.com (2603:10a6:102:380::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 03:14:03 +0000
Received: from MI9PR04MB350878.eurprd04.prod.outlook.com
 ([fe80::8537:1cdd:6c49:6151]) by MI9PR04MB350878.eurprd04.prod.outlook.com
 ([fe80::8537:1cdd:6c49:6151%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 03:14:02 +0000
Date: Mon, 26 Oct 2026 11:15:38 +0800
From: Liu Ying <victor.liu@nxp.com>
To: Frank.Li@oss.nxp.com
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Robert Chiras <robert.chiras@nxp.com>, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v4 3/7] drm/panel: simple: Add Waiken WKS101WX001-WCT
 panel support
Message-ID: <at7F2sW6hZzdngZV@raspi>
References: <20261023-dxl_lcdif-v4-0-4ae8395a4b23@nxp.com>
 <20261023-dxl_lcdif-v4-3-4ae8395a4b23@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023-dxl_lcdif-v4-3-4ae8395a4b23@nxp.com>
X-ClientProxiedBy: MA5P287CA0299.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::18) To MI9PR04MB350878.eurprd04.prod.outlook.com
 (2603:10a6:290:c0::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI9PR04MB350878:EE_|PAWPR04MB9838:EE_
X-MS-Office365-Filtering-Correlation-Id: db7f3966-644b-4874-9077-08df330f2fb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|7416014|23010399003|366016|1800799024|6133799003|18002099003|22082099003|56012099006|4143699003|11063799006|261022075727099003|10067099003|261021121427099003|261009223027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: 2iFEZkPdpLjsaoeq8kuzS2PrX1qNueetofI66zlnrHXpyqyY/Mc+I91ZWYODx7fSPAzWAeMUx4pHgs/5n160zpvLD3/Xgn2K/XpcMS7RmToP/4PN8j0XKoAPF3ELWKw9Of+MJwVHR2JUeZjku8AbxfF4tbzhh7cIgd5qY5kjOvZjhY6+OPaeaikLUSL6gZMvteOok4zAH1aGG+J/trD08zDOAHgSeT9eoF1OiUoe6flsHT5LwFr6RDkOiS0dQL/qujSyIEwjWIlaknNV7C/Y/XY8HgwlvCgWwq9Ap3IKHy8Uuh/9HwTiXCQaq3q8vKodte4uJOzgxg+hbRE916mvGeEQBW9zxJLBjtZdEg34eotg1d1tSp41+keFvMhoSDnq0peKLF8EclpW4IrKTDoTBdNkrLTG283/ZE/Gx3aoRKNRAx3SSJzSJypCFWV33dADhI/C4PWppc1k0OPRsZbDJYZJmaGzw3zOVY6d64wTKDAjEoQO2ErZtjeohdAA7dm9rWp4sUMwSaJ5JYBpg38K7+y606qzUbAnBlM7I/V7eqEyX7QOj8uFLRyJmuzKfkQnFFGCfAqzrS4HhDvk8jcKM3HN8oAT6pR1hYJNBEPwK0ZBn7U3o5rDAxCa9qUxLzr/Eg4q484sXcxfxDAyiopGq8GSSVCZGgRxIHIlRg3G9G0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB350878.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(23010399003)(366016)(1800799024)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(261022075727099003)(10067099003)(261021121427099003)(261009223027099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a1wkSsAq6IRA2VTvSHxILxyW7yNP/LdejPLhTqCe3oIUStJaZjV7fPSgREhD?=
 =?us-ascii?Q?r+j0IGmYDzPO8+hMIogi0yhabwgvEF7IZ8c7EZ2tUYDubItSILMFtt7sFhCV?=
 =?us-ascii?Q?PViB561bFTDiBJDPeGFycv8zX8Au6epJmeVPFazvxpLSezSRlZclN1hupHHB?=
 =?us-ascii?Q?54tp7m8JWCIzyVbpOw8Y45V+MTppu9T9uY5V03RWbwwelNTgoRhFwm0JwBHw?=
 =?us-ascii?Q?MN/nQiHTy++HmsWPg3i492xJn+DvBq51SQpS1dwimoszWpyNsHsDExjfWQ/i?=
 =?us-ascii?Q?M0I2d3xfvt8mBTlwNeMcwKp7fktRakIYoy+lDy/b4rXkJP4fgnDXHftmgJiC?=
 =?us-ascii?Q?g992rP6dQWV894T6nYn2Q9M0cI1eBCyZT32qLSfMwgUoLLxQmosiovtUGEL5?=
 =?us-ascii?Q?aM8CmfcKn0WjXP6uSPZm44HzhaLXsy/+xIk82Ya/jdRTlep1WXKjkoctZwcN?=
 =?us-ascii?Q?YlEiV7QOVfYyXhC+S0vx3VjJx/+lQy9YUZ/KRLUNNksvm5bUa4cPqc+m3rSY?=
 =?us-ascii?Q?NWFmdn/ORFHKKIrvFxFtiQtLxiOgHML4hqDkiamnb3LzOAdSqnGlF67aYcFf?=
 =?us-ascii?Q?V5EFUs65iOqktAUV/JWjUT324VEq11tJFQyIuGd/LD6G5+D82tASyL6RPXsD?=
 =?us-ascii?Q?EqklJIHQvrlnZaF4p7OtlGc4M0fuugjJVrQpMRHcy2ppKnd/nc1tre9MyYav?=
 =?us-ascii?Q?bFrhT94Im4hLNmZbHbebrwRTNoQbCRf/qMbSO1pvgKqC+uHeG9Zh/7dyi6ZT?=
 =?us-ascii?Q?WboWMzLz7Irqf45BlyLtbWWZ68hJOv+0PexVvnEsrpuVIgm79dPS3HiKReaI?=
 =?us-ascii?Q?JM37zIyMxV59TN5TBB15BgKZsmOgpdw9m/pI+uc29upj1CE/CKJUncq5zieH?=
 =?us-ascii?Q?GnE9TK116WfvqZSS4M13hwqp4KrjAj3IpKdamYG4uDqPceuQIONtyUFWEftY?=
 =?us-ascii?Q?8zfzm5afvZgd7o4UIYGXUVfZTCZJ42V2Tv+QVBIH2MfM4GyWI+Q5l4NLYuYa?=
 =?us-ascii?Q?gNk3dKaodTzO8mciTwJoJ9IKIGY29IsX3xQYmUZjdKanAFVCzr0utDapsGJP?=
 =?us-ascii?Q?X6fgQEhVP9BRbFX/4aWtSB+RTcr0lCHBrPHxUa15WFpY34aE7Hr0qSDkeAVS?=
 =?us-ascii?Q?l9hv/jMgfZ4VX/3VkiFoS0z/c86C660TrUTymuh2E6+f962Atq+zcoFKMBfk?=
 =?us-ascii?Q?W9RkEJ1w1N6YoZpsgbc+HDQkLev3tdS7KnEEOn5cX68b5J2vkW23K7oMraCS?=
 =?us-ascii?Q?EiE6pviL17jV+y+jP6RzVTLamO1nTCSlCgr3OacNO63wx7q8GSNbtRtWSQC5?=
 =?us-ascii?Q?DOkdlGKUHOX6Jfbophl7L7jxGD3z2W6ueHvuGM1EdKDYsb7F1YXBxndMd8Xg?=
 =?us-ascii?Q?HOGopvsXhV1GnGiH4y/EKejWAtcpomz4N72RefV0xxp4uz6s/xmbHNSZ0PLS?=
 =?us-ascii?Q?Dv0lStpjWGufVE30MhGNDuPExECGJTiFhXZoFcfvU1wMQnZZ7pLfyIFwpoEt?=
 =?us-ascii?Q?cB+4yDST/qn3JYJxDPTRj5Pl9T7gFKkkr7uiTaHLg3AkDAtiReepweyS8Rgf?=
 =?us-ascii?Q?pAqMuRLKyFqTjQljM3lbW1NaoXgwrqg4jgUR+LK19089Jw2UcHCbGGGmO8M/?=
 =?us-ascii?Q?Y5LDz/ZN8bKOcuNNj5hgq2ZQQNmHpP9j1sLOAI/Beac4BQT6XU60qljKEuU9?=
 =?us-ascii?Q?srvtcB7I9zPhbKw06bgVHJCwATAwaRpGLHre+pIEhdlKCKLWN5QD/WxeUYP7?=
 =?us-ascii?Q?wcZ0Ai65tg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db7f3966-644b-4874-9077-08df330f2fb6
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB350878.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 03:14:02.8857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nN0iK2UIHYviCv/SUE2VeOYzpSyQNhj24AGMeK+25uLz4sd4YwHWmV/d269wFc3siqSE50ZLgV9tT1infp3VLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9838
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_201410_040106_BCD66668 
X-CRM114-Status: GOOD (  19.64  )
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 03:45:11PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add support for the Waiken WKS101WX001-WCT, an industrial-grade 10.1-inch
> IPS TFT LCD panel with a capacitive touchscreen.
> 
> Although the module advertises LVDS support, enabling LVDS operation
> requires hardware modification, including the removal of several on-board
> resistors. As there are currently no known users of the LVDS configuration,
> only the default interface mode is supported.
> 
> If LVDS support is needed in the future, a dedicated driver can be
> introduced to handle switching between LVDS and DBI modes.

s/DBI/DPI/

I assume that there would be a new compatible string for the panel in LVDS mode,
instead of a new dedicated driver to "handle switching between LVDS and DPI
modes".  So, I'd rather drop the last sentence.

With this address:
Acked-by: Liu Ying <victor.liu@nxp.com>

> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v4
> - s/LDB/DPI
> - variable use 101wx001_wct
> 
> change in v3
> - add wct surfix and change to use MEDIA_BUS_FMT_RGB888_1X24
> - Add information about lvds support plan.
> 
> change in v2
> - update height to 135 from 136 (sashiko)
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)

[...]

-- 
Regards,
Liu Ying


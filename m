Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7FB606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 12:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kqTMDEW4;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=MTNax6Xv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yjWPbrpdgv4x8QEFFoIe1nVcCeRKRwD21w/gAfBuOic=; b=kqTMDEW4lk3tKzbSBgadBZ3SwA
	FOFukGTGeMak9mIshITM52PIiyHFrVx66z6UF7yNbtE8ZF9WFzzvw1VB1hS0AcbvK+aiJXUpHIIEn
	vhiyCJizCDkW3Mxl9KZwbIGPF5zYMRsmZop/BlZoUv6QhgduGVbCL5c8GU6v020i2IEFWs+wWva77
	NP7gGC4A73bC1othlLNBnXGZelC2hcqRvY+9VUY+yCSTxvzEKgDUoASlyyb2r8VZa/PtJWodBu+S0
	3aIKzn5/ih6YLT7ImsWLSHFJ7dTW/UR7JJmhG60+VK6wy9fw+z/4DY8QRZWaE/oYSTzvQs4LFWf88
	xMYPtH7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODz4-00000002Q5L-3Kew;
	Tue, 03 Nov 2026 12:51:26 +0000
Received: from mail-northeuropeazon11012057.outbound.protection.outlook.com ([52.101.66.57] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xODyz-00000002Q3X-3d1H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 12:51:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vKtjC/vDWAdft73sLbozLu2JNBsI71wFiYtnai+MV0XvZKkC1SfbGH9OeoFlRu2wAnLKRwyOnbuXBxTdBxj+0iLj/cmX9cf4TyQ/1cOr6iRnAvsY6cGqK9+PELSQ1U1TvWEv1NWxiFFvjySgr0CtSTYp/CFHuyqTl2BR6HO4XkF1xusFGjcmx9tZqSMu3ECNSrSObklc1RBP2ZVgEKeppJZroL4MqywolgOTWgBFbfjODP88mYdYr7kkyoZCgQsRWZbE1GBbwhqrSLgwyYv02VPySjofrTdELQecT8hTacUTWwoT6Fio+evdkxWhOPhpwxb2C1rw0oAVC5HWG8BfhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yjWPbrpdgv4x8QEFFoIe1nVcCeRKRwD21w/gAfBuOic=;
 b=AUGJwCqCulTvS72Y54Ytvhl60mhBG6w0HfMNmkk+UktDXJ5QCiyMokRRBOffIuk1QxClUqlAf0BL/t67Pvtic+MRKNBr8ByWRIi5qgSCYM6+vDfIZ34tJvctVTj5QtadkTIb/V/QpWKS0ei8f5sTkjdTSgsd405QjN+tL0CMaIXnw5QN+0jP2Jw1Q/J2trNIa4MIELnMwtqEr4fojJSyEz+5xR9GFZGT8jOgPFK8aJ51SGAEbfYg1pRAQEVGXR9z7no5mdJ2zRuDMHByurnCnlUq4DgLoHfMObIMBWXj13gHXJVcwS9LU95lLGZ4UwXZpOMltM0S3UboP9wXL1kV3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yjWPbrpdgv4x8QEFFoIe1nVcCeRKRwD21w/gAfBuOic=;
 b=MTNax6XvhGZ/R7J9i0aWNRI96D5N5v4d6EGNz17jOB8lA/G3XkSaMJuOQMiGSthDxScTg6+WA1bS1p0GJstMuadkcCP2+8NHPDCrvkPsDImLuRjjJA0ObhhXxCQ7kV1588CdIMFh7Iv5n0dXk6YC7Ep/a7pEXzqs5wpxM9GxHlO05yrzVU7N0W9bm6WY1+7Wm1Ao2DL+fCUz1wWPGDLr6co/ffqyCxsk+pkd6FIVIZkHRb0pld5I0cVbPoR9jPYehmX5JD+jm4GPMmV57HrmBJ1oN7A5WjQTjFEeofn/7/HYbCp5yyE8D9OgYtJ6Zekx5Rj8einSF1XHGPOlepKszA==
Received: from AS9PR06CA0079.eurprd06.prod.outlook.com (2603:10a6:20b:464::13)
 by DU4PR10MB8759.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:569::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 12:51:14 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:20b:464:cafe::8e) by AS9PR06CA0079.outlook.office365.com
 (2603:10a6:20b:464::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Tue, 3
 Nov 2026 12:51:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Tue, 3 Nov 2026 12:51:13 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 3 Nov
 2026 13:51:58 +0100
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 3 Nov
 2026 13:51:13 +0100
Date: Tue, 3 Nov 2026 13:51:07 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: David Carlier <devnexen@gmail.com>
CC: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, <linux-media@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: stm32: dcmipp: pixelproc: Round up the compose
 lower bound
Message-ID: <aunYu3XpKWjx20AS@gnbcxd0016.gnb.st.com>
References: <20261018032011.207050-1-devnexen@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261018032011.207050-1-devnexen@gmail.com>
X-Disclaimer: ce message est personnel / this message is private
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F5:EE_|DU4PR10MB8759:EE_
X-MS-Office365-Filtering-Correlation-Id: 33bae05e-0997-4fbf-8a88-08df39a924d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|10067099003|18002099003|22082099003|261102123227099003|56012099006|11063799006|261026140227099003|261028144727099003|261026121527099003|261009223027099003|261022105027099003|261021123027099003|260925022911599003|261021121427099003|260925021311599003|260925021911599003;
X-Microsoft-Antispam-Message-Info: nwkNEdX0Fp4+XUSM4GUs9DQH+TiE0Z2+7nVsdcEiDRW9zge8OKHSyQHW9ZbmKB3oUYyJGbh4w6dr0dB5aExfyAauY3Q/ra7t5Nq/sHm/NNvOpCFXc+HE8P1BsSxjqi2mUilkzyMGMjWumq6mr/G3O4RroD4EbmBGKhu8IpcxA6e3/l6t5h+wCMiDMyJ+ZTeqepBzu6crKHfzM44Ctr+cEx2sPrywMtQt/V65neX2MllQHsvn4bTEW955dr1JqFuNoFfwB2Hd4FMCdVF7gSlRKaloiA64sDytPCL4DB5VgkmkGTyXchBQ06fzGXeJO24gnz6rRDrVGn5DY8wbtZnjC93dsgE3oVN9XoaR2HUkNwvx40/mlVldllx8T6dus0XqT+AS+6HXO/mOnqiLGN3beaQGEq6o4nRrPAz64zlmxIxaPF2a44Q1+migtTylDzNdz0qh7Q2IXpZPAx0zJyGEowONfb4oZqR9soXstnEoAi392ye58xKZRpiELZCyufImiBBZy8RW/6X8zt5t31iuEPJchACCMaPwL73GznjUeW907yN6NDTq6cIDEugej0zhXcItSL+3D0IF91nth/g54YA5tiw6rwwYi3ktQ12C9tVquPiK5lJJ1m3x+oB/AKr8GB1I5LvcTdvSnqvjhgt27DlGk+LUSuVxCyEnBjn742TLbpUqEMcQb0b6EFH1cEHW6/6NAimY0eg2s1nm2+g38Q==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(10067099003)(18002099003)(22082099003)(261102123227099003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261026121527099003)(261009223027099003)(261022105027099003)(261021123027099003)(260925022911599003)(261021121427099003)(260925021311599003)(260925021911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Dw5rUz4WV2ux0aJG4we023Zz8aiOoMj5UK9qMbZfbamU3A6Ka0NL5eU8Zy4AobBA04ZDRgbDTcCOkTl1JYA67R/FQuDxHfY+zFEu2ak5xRxWRd3FNgaqvKrchYTZjTtJDObsh38To2X6XnHQPfcZ3hq1Z6VHgPLLZ1u4/sIjkGljjqqlf+Mdy1uqWe3eiMp010f2K+GgpmLAzrfXlQuH6ghiE+Rg93nIyrIaqnAQGuKGnEX35eBXbYeMXOK2iXHHXu3Oq53rpLoOAa0Pqouil+KJNTwEUeK45o9/Fmzmoi3AO5B8tZ5j1ogYYX6vI9/54q76ncF77/DUNax895/kAZmKSsOvrAMlakXuWtGpa8NMzBH5zxdkx5wT5OSICjOWKBgMaw2BSIPniaUsI8HcjDIrvJqMgobD5PGUPLQpSKqh8b07GEMuHOhtVrXccddq
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 12:51:13.8975
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33bae05e-0997-4fbf-8a88-08df39a924d5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8759
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_045123_315570_40A2D1B9 
X-CRM114-Status: GOOD (  16.42  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi David,

thanks for the patch.

On Sun, Oct 18, 2026 at 04:20:11AM +0100, David Carlier wrote:
> The minimum compose size is crop / 64, rounded down. A 17 pixel compose
> on an 1100 pixel crop then needs four decimation steps, which overflows
> the 2-bit HDEC and VDEC fields in PxDCCR. Round the minimum up instead.
> 
> Fixes: 239cf9e5fda1 ("media: stm32: dcmipp: pixelproc: addition of dcmipp-pixelproc subdev")
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  .../media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c   | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c
> index 7d8e5f0863bf..9055682481de 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c
> @@ -597,10 +597,10 @@ static int dcmipp_pixelproc_set_selection(struct v4l2_subdev *sd,
>  		s->r.top = 0;
>  		s->r.left = 0;
>  		s->r.width = clamp_t(u32, s->r.width,
> -				     crop->width / DCMIPP_MAX_DOWNSCALE_RATIO,
> +				     DIV_ROUND_UP(crop->width, DCMIPP_MAX_DOWNSCALE_RATIO),
>  				     crop->width);
>  		s->r.height = clamp_t(u32, s->r.height,
> -				      crop->height / DCMIPP_MAX_DOWNSCALE_RATIO,
> +				      DIV_ROUND_UP(crop->height, DCMIPP_MAX_DOWNSCALE_RATIO),
>  				      crop->height);
>  		v4l2_rect_set_min_size(&s->r, &min_rect);
>  		*compose = s->r;

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain

> -- 
> 2.55.0
> 


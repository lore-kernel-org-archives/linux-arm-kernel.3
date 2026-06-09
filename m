Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1559BCD8CAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 06:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ixN5sl4KqpBq5TH1IeM1A8SbsbJ155eQ6EgVTheelrg=; b=QLRz5oGvJMZi/cG1HFjsphaKpk
	Go2HBqwLDur2x734hQSIMN8FJcP5cQ/aLFusUIjCnFv7MgEdD0LHcqXYYeBW5xeYNkY0zKYv1RgVR
	eyxh4vuZJMq7VFPLl5xxnWYuNMTGY1JIfZxLUH5kezbmksjZCzhKC2xFaISA5vuIRSr3SA2OrTc3d
	xef9Wj4NLCIWUqD5meO4vGexO1CMR9bRwhshYaoEvJGlvri6T65SexMG4641OHq3173+WdLOGhw40
	8x8ZSKlZd9TR9aGpFz3mI/pD7lrl/ebYHxpgLJNuaPdzmWM08PxRHlmmuS+gRExlWriw1uUp1UQBC
	KKTKeX7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWqJj-00000004v0V-2AWg;
	Tue, 09 Jun 2026 06:52:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWqJf-00000004uzi-0mfI
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Jun 2026 06:52:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:Content-Type:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ixN5sl4KqpBq5TH1IeM1A8SbsbJ155eQ6EgVTheelrg=; b=ocpFhSxTnnYlhKxrWIT2HIA7v3
	06MMPTynpZDJksUkFujZFPoJUA9/W3rNpTgglHRSoi2ows1Mr4z4FA/pkDsFWfMr42SfZMkW1wZsr
	rAyShj0vHzfWAZ037YrPImhkhEvx6OUfa6yXxZMtlEHN3NiCI5IMMf41928mtPXLlG7Dzp+Ca6ktz
	bmp+0tbASFF/0AUlDmktOzQhXu0npse8/YdYUJ4kzewH7KwTOrV+AHbpmJwAgDeTvvJfgVyyI//r7
	W7bO+dSPak/zrqQw+JTOi4cw9J+kI4QvsuKRk/AmhnDMfbL4FBPidfH7QhdknNwBcaG/mzNs2bgyZ
	BegaKDJQ==;
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWqJc-0000000247s-0WOB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 06:52:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nq+yk3OOevlMeqS0yA2Xitzee6zZNDXjaG43jAsqkrVchetBNHUQi1ra/LI7rRV5TLmTWQG5GTB1zqBr/+gUXiS0ym7fxuDd/Z1bAtvSKd5mFiZcvEB/B7VIG1GScd7WpmG1ZUNsyNrDTT4G7Px6ZTe+mVGEejuAzOe567rjsHVHi2TSSHifYhCRCtg0YAukrKvs7vnR4O5y+5QbhlsjJKhoq01UyyBoFlhn+ZBEihFuyG6d1MYOZtI5vb6ROJUoNfkCNTxu+6TjOI6/HIAzsNAf+b3kJgZa+mhlAknYicW34/scAPQAXvU3dCJoNMXbk3Am9dOLbUCgfI+K3hfoVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ixN5sl4KqpBq5TH1IeM1A8SbsbJ155eQ6EgVTheelrg=;
 b=GHDz++BfaTrZvbBNcI93wdvYlOS06EOJHyszIElkh5oZTsxVrxd9hlrJtzg+zQj8J8diue7CypBuGFdM2amQWw24cxzGXGtVxohqsKbvh1sNJhGFE01ogfKD8/kbu8PJvF0pMxKT0J/Io3DUcyQ4/6zWjvzsXICMas0yhdomO7AQyjzhrHUnUCASqAJxsvPScGuFt8Jf6//MTV/3FCUiY0zMH7hMzEKVnJP2g2yu316cYXietYXFfJa5KUCLdjztI3fllfgonmQdODz5VA4XtwrFVcGcGrLaqas3ETBZ8e6ujkXBsPLCY3Gnb+AWwsgGGtaImepDwbHhIDzwvrEfOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixN5sl4KqpBq5TH1IeM1A8SbsbJ155eQ6EgVTheelrg=;
 b=ijyTd0G+2C7+Az1rH3NU2tz1HJxZWEdpAbdhgNbctc1E7+Ro+dlWiYPNWCglXgFblUTkuV9NvmRWQopcwTkdyv+O4dc7aZTdTlykmPR1AoZyaz2X8lwdrAI7X3S2FjGyWCpLDMP7M0lId8VLPkTyr4NYIqlTS6sJPnbhBh3akxzZd+K5nurufL/FI3L8ptbeRKRCXsIJ5R/VvIaQJqm7cUuCUM5fJc8v666OOmetoeLGtwcxowMciTncrca7ytHUpErwJaOHTT+BdI7KxmMW2VTZju8UoKMpFYGcIbG+OMpuZUV45nCl092coIPP91uokmBCsZ5nxXifr9VfcX12nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 by GVXPR04MB9952.eurprd04.prod.outlook.com (2603:10a6:150:117::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 06:51:55 +0000
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c]) by AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c%3]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 06:51:55 +0000
Date: Tue, 9 Jun 2026 14:53:23 +0800
From: Liu Ying <victor.liu@nxp.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <lumag@kernel.org>,
	dri-devel@lists.freedesktop.org, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 17/78] drm/bridge: imx8qxp-pixel-combiner: Switch to
 atomic_create_state
Message-ID: <aie4Y-OPHWebkVw3@raspi>
References: <20260608-drm-no-more-bridge-reset-v2-0-0a91018bf886@kernel.org>
 <20260608-drm-no-more-bridge-reset-v2-17-0a91018bf886@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608-drm-no-more-bridge-reset-v2-17-0a91018bf886@kernel.org>
X-ClientProxiedBy: SG2PR01CA0184.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::9) To AS1PR04MB9287.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9287:EE_|GVXPR04MB9952:EE_
X-MS-Office365-Filtering-Correlation-Id: dc2a2916-bfbe-4ff2-62e8-08dec5f397b8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|376014|7416014|1800799024|366016|56012099006|4143699003|11063799006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: rcqXNGVOVdJShJxmTPaI1Np/9s+MgSYL4GHzz0lPAfleHMcZpZp8inxMZWdlbpCKZKw9uUJWt5RA62vSkasipsRfRA2EdRQU9/vELQaCKv2cdOMr3+cwD3U6I/2qasKq0xGbFVrvH/1d2dA4qkqqr2IrOVlA2kSm9vyj25ZFOzWdCIImRKKpDo+/WZKdBE9RjkYLAhsO3QbmoHES/irGQ0EGo/GLoMuQeRzr7WERb7zABPTzHdnngCKFuY6dol1tFlBnwqIsmOeVdb1Jem6IB4zYTG62AlPruDhJdewidhIGqdgd7g+FSg81aCbT0QaEVbTMrQQdE2DLy/iRA/mKTv9PAgNJVosl3wyJs+1ZRGpopa4MCwqZ5EVlZeOBVAgGu41VVSykhRvySJM1vEH/W8OY7EAv5VX6vqNy4k3wKn3uG2Uxibra/dbiexwEy9yab1BhHNWUMtQtxcvqMPVHYMJhcvJb6uYByr8/afUu6VB0wxxm+YM7ad5jzANSZkJqauPlSCxaNJP7HUq89ultza+4Nn8c2bzQ2mw78tJS1VL9hZthjKoxhGKWhAxlyJbW4QuwIXMtlcQVWjOiOcf7Eo7oMrqpMMg4WbCqTUSAgCE+zvFNNHw6Zmk9lNQ3Gt0EjYB0yVuKIG41CXkThaGWCC0HE08RGE4N07Sa/0b1he+D1ryvHXz4wgiU9KLueVE/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(1800799024)(366016)(56012099006)(4143699003)(11063799006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sx93qdVjryHw4vsetMVQAHyfC2YSYyOE4ua97f/FLtGz52m6YwgzIcMwsOlG?=
 =?us-ascii?Q?w3YPtZmZo+XyV2R7EN0Y1LtZ0lgV0RVqrXt9WVEY3KiDaPTiPxZfNsu298L2?=
 =?us-ascii?Q?FMXc69lcy/4XOVRK7TyyBf+Rxb5jKODRMYENmQul38bypz8xyNQKap/+kuGD?=
 =?us-ascii?Q?Otjl9a7jdeneuWCKW3AvONtor2aHNIg/POmdoxixU0YJ4qz7Kyb7oQgnfzYm?=
 =?us-ascii?Q?BO1flAHMWGQhf4DZzh65wWZlN9dOB8bXA8+h46zOpCczBi7GRB/2fcdLpxi8?=
 =?us-ascii?Q?Tm5Ind74MUlDrkOE2+J/2WXPB12iu/zTSLnXrjZMql5TaiogBRKhRSTKLs5J?=
 =?us-ascii?Q?/PDkNH2YJm+8yOTkKb9LOvW8sjf7mi+7YByADS2rT645BhEfzYecNKQDEq6W?=
 =?us-ascii?Q?acLfUdhXbFjmPSH2rT3kZikzKExicAQGO1Nj6vdPhJX3wtHP1/3OQhSR59Dh?=
 =?us-ascii?Q?NLw/FeyWLBBmtzRSCEnQqip0S0q+W6TD1HOEU/yGN96qWlBDnQngwxf0rnEi?=
 =?us-ascii?Q?Kb7U0OXabvmg71v5e5L5pZgawJimcnfxjUW/TQ8yjEAd8DK+nCdbE8cVsvda?=
 =?us-ascii?Q?oiGCXTBzJN1zmHGuoPI9kTKiDI5QWhaKA/ZQW4zFtrEIThs1sN79GaEBrhf+?=
 =?us-ascii?Q?k9+PzTFAX/ZiiBhUi5Au2V1xdgB4rfCt4NgPXMnHAvWyAvDhgltCfB3zaXEM?=
 =?us-ascii?Q?z5u6lldOktsSwCVNVbhvSpmmBCdi8GDfbcJi+BfGGdbIg3DGjKesKuSdwwJM?=
 =?us-ascii?Q?p4T5KV8ONPmK56FiEknUbooa66DL0AlqCOcT84N4jCplAbD7iBPbkC2fb7N1?=
 =?us-ascii?Q?zBWzb2HcnO3DhtPP2i775pQi9+8nssD4Wq7g+8ul5XonC4nmYC+EDlKCmXNc?=
 =?us-ascii?Q?V/R0br37i/64eyBLWBy7jKSNaC+YRMZEohZT6/qPr9/1LWFuS+GSPFLA+x5Y?=
 =?us-ascii?Q?hhBKPKUKKcDPKKQciYDxwqMd1jI/asoLneHTDIhcUABpLDuEbaGY33yckVmB?=
 =?us-ascii?Q?olvL7C9kX54ltfT4dD9OWCle9L3skrEKnevHEcfQYY5E9d7TodJ9N/ucQTua?=
 =?us-ascii?Q?Pj7ZOHnwLq640qKchsFtg1nLD03TT/AhuZhTy+2cCBVSvLwZ6c2RsUBRynqI?=
 =?us-ascii?Q?Fo/JM9j8pA2Fa4AvwAe5CTpbVrUv3bv93VabDLKo/QED+ULUg4+wtYZMgklH?=
 =?us-ascii?Q?nQL6/h20RYsJcEvHf9IJqA3nidbD6BRzVoKGul8geajnAqjCxlilgiwBDUV9?=
 =?us-ascii?Q?/od3yrzItfNKUH94lwoIWuKsbuUwqy2cr0+W9fc/lvotWQMUhr+0Tbtl2xJx?=
 =?us-ascii?Q?XSc4DD1xmwdC7X1rhBle85Vw2b2rgZNhTCjKJ19B4dQjuCpU3drEexAgmI5U?=
 =?us-ascii?Q?0H0pzf0kNW/S2f01/gWTV85d7SaO2AzZRK85vPyjz+vaTJROE1vKhu2cQB/c?=
 =?us-ascii?Q?NKzeKmFRUvqTSOtgQxbrztw+LMl6SKWgB2k7P0ebrAdJ+dTHiHb9nVwd4CdI?=
 =?us-ascii?Q?YSXyC0J1lABw9GjgWfAnu/ZtU70UakcP8J60d16sz7+6kVrnhNdJRvOmmG1R?=
 =?us-ascii?Q?VA5P8Rm10sR3s7HEUDOjrlasyJ7U9XDj+PZZkDfUq34vikEOxakoy9v2B1Gn?=
 =?us-ascii?Q?fGk06eqFa3tenukDl80jGGG7shnVmvKAiH2v/rwTjeaTuR75HkFffhmvEgTN?=
 =?us-ascii?Q?t1Y3V97ehvu5wcinV9pyzrFaxo4ZT9aUZ0CCQwNif0Y/AAoH4GNfT3NLUHRK?=
 =?us-ascii?Q?btBn3EaqFg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc2a2916-bfbe-4ff2-62e8-08dec5f397b8
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 06:51:55.0422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IPxCSkaWP+kajwpe40u5queElWTHkwt3TjLBAyi1+k44sP9DWYQZo3NTw+pOztJ9hyf8K2S3vq4uLZc9xktQig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9952
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_075200_369004_A82490A5 
X-CRM114-Status: GOOD (  19.45  )
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

On Mon, Jun 08, 2026 at 04:35:59PM +0200, Maxime Ripard wrote:
> The drm_bridge_funcs.atomic_reset callback and its
> drm_atomic_helper_bridge_reset() helper are deprecated.
> 
> Switch to the atomic_create_state callback and its
> drm_atomic_helper_bridge_create_state() counterpart.
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> To: Liu Ying <victor.liu@nxp.com>
> To: Frank Li <Frank.Li@nxp.com>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> index e0ee51a9ca7f..941ce2f91e9e 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> @@ -249,11 +249,11 @@ imx8qxp_pc_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>  }
>  
>  static const struct drm_bridge_funcs imx8qxp_pc_bridge_funcs = {
>  	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
> -	.atomic_reset		= drm_atomic_helper_bridge_reset,
> +	.atomic_create_state		= drm_atomic_helper_bridge_create_state,

Nit: drop a tab after .atomic_create_state to align '=' characters vertically.

Reviewed-by: Liu Ying <victor.liu@nxp.com>

>  	.mode_valid		= imx8qxp_pc_bridge_mode_valid,
>  	.attach			= imx8qxp_pc_bridge_attach,
>  	.mode_set		= imx8qxp_pc_bridge_mode_set,
>  	.atomic_disable		= imx8qxp_pc_bridge_atomic_disable,
>  	.atomic_get_input_bus_fmts =
> 
> -- 
> 2.54.0
> 

-- 
Regards,
Liu Ying


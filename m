Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28985D232F7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 08:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DqIjDWDNDsxEnQmjqSn3lRLsKhnspZsn6fUpo/KCo90=; b=kvXeq9cmweI0wajFbMA714F31Y
	APbcjCl0HYOyNBgjouuW8Kv4ZcKdlwAVErLncYQSPK3EYLbEgCgCfqZhEQImn+trO2ZiEge4gUiAq
	Jm5yOGrAwuo6FrCZg5Dbqol+1T1kdIE7asRIndjU4R8IMdcByEf6YHjA1mLbgBsg9QSKQFhYf1g+Y
	SyVWCCU8x0LKZKyj6V/Z6FOrCwPlEBXHLHpDUn5pJTY2av+isIBY0MkvBH41Sma/WF0vDCc9vHmNq
	eG3UTRpc+vvhX9ugdyT/yl4Meg7xBXF9ndcfnfVBkMHQxXr1YhnzECrYUVZIcp7Vf+yAIu9xvxjFd
	Bny5Q+Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8Bw-00000001wG8-0XF7;
	Fri, 09 Jan 2026 08:49:56 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8Bs-00000001wDa-44zy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 08:49:54 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260109084949euoutp026ca40c81dd59fedeb81a397dc37bab8b~JA_AIUtPO2815928159euoutp027
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Jan 2026 08:49:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260109084949euoutp026ca40c81dd59fedeb81a397dc37bab8b~JA_AIUtPO2815928159euoutp027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1767948589;
	bh=DqIjDWDNDsxEnQmjqSn3lRLsKhnspZsn6fUpo/KCo90=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=YMRNwSI0wOZceG8PA3KPr6eUHpRCI4nEB1T3hx/UIUIEVNxe2jnxPUWw53vAm0Xm1
	 mh77tLU02YzvuYMn7HWU5SQGgp0Ra/nxZGl2zLQxNys4T5mpfMsy+yMVavw/YhWI1V
	 NSbVonu+LY+EjcCjR0PuqWH3TWe0nlE7XUaZit/I=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260109084948eucas1p25d45866af56896d55a77289f1816a144~JA9-oK3f80983509835eucas1p2E;
	Fri,  9 Jan 2026 08:49:48 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260109084946eusmtip19166b5af025e4b586d8c35e4bbabd918~JA99w3fNE3189931899eusmtip1L;
	Fri,  9 Jan 2026 08:49:46 +0000 (GMT)
Message-ID: <098a1557-aad0-4db4-822f-ed672e97c473@samsung.com>
Date: Fri, 9 Jan 2026 09:49:46 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 11/12] drm/bridge: samsung-dsim:
 samsung_dsim_host_attach: don't use the bridge pointer as an error indicator
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Philippe Cornu <philippe.cornu@st.com>,
	benjamin.gaignard@linaro.org, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
	Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Adrien
	Grassein <adrien.grassein@gmail.com>, Liu Ying <victor.liu@nxp.com>, Shawn
	Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, Jagan Teki
	<jagan@amarulasolutions.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-11-8bad3ef90b9f@bootlin.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260109084948eucas1p25d45866af56896d55a77289f1816a144
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260109073233eucas1p2221313acb7879127ca0582b2391ba460
X-EPHeader: CA
X-CMS-RootMailID: 20260109073233eucas1p2221313acb7879127ca0582b2391ba460
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-0-8bad3ef90b9f@bootlin.com>
	<CGME20260109073233eucas1p2221313acb7879127ca0582b2391ba460@eucas1p2.samsung.com>
	<20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-11-8bad3ef90b9f@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_004953_305411_EE7580EA 
X-CRM114-Status: GOOD (  19.85  )
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

On 09.01.2026 08:31, Luca Ceresoli wrote:
> In preparation to handle refcounting of the out_bridge, we need to ensure
> the out_bridge pointer contains either a valid bridge pointer or NULL, not
> an ERR_PTR. Otherwise calls such as drm_bridge_get/put() would try to
> redeference an ERR_PTR.
>
> Stop using IS_ERR(next_bridge) as an indication of an error, and instead
> use the 'ret' integer.
>
> No functional change.
>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 8dd058124e93..afaa63c4d3f7 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1891,7 +1891,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>   	struct device_node *np = dev->of_node;
>   	struct device_node *remote;
>   	struct drm_panel *panel;
> -	int ret;
> +	int ret = 0;
>   
>   	/*
>   	 * Devices can also be child nodes when we also control that device
> @@ -1926,16 +1926,17 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
>   	panel = of_drm_find_panel(remote);
>   	if (!IS_ERR(panel)) {
>   		next_bridge = devm_drm_panel_bridge_add(dev, panel);
> +		if (IS_ERR(next_bridge))
> +			ret = PTR_ERR(next_bridge);
>   	} else {
>   		next_bridge = of_drm_find_bridge(remote);
>   		if (!next_bridge)
> -			next_bridge = ERR_PTR(-EINVAL);
> +			ret = -EINVAL;
>   	}
>   
>   	of_node_put(remote);
>   
> -	if (IS_ERR(next_bridge)) {
> -		ret = PTR_ERR(next_bridge);
> +	if (ret) {
>   		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
>   		return ret;
>   	}
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland



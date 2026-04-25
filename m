Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2748FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 11:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48ReSiUtvl93P03PCfkJxXqECnverzLuXVkXma09cxE=; b=2h4R9eoiYHmz0ZMVOtsjtgwB5g
	9851ByzHL0j6FKYKj7OMy61gYlI2pEEgJU3CRbclBenv7bqLh1OxPTRRrvSK+pbWB/UU83bzquSqu
	6/ZPl0IGoMl5XMfkXIBr2AvEpGKGl+gsCNIccNFbfbHbsaUDlkiBi1zpJbs+TgG05gXls/5SZn7Ob
	ahOGuSDDIU8bhXR9zwQ6EbVE+2wU1HHdB1l2DE1GjKGxPszSIgiz/8jeDpvQzBYbIbXGbG5uFRR9s
	4ZS0odWPwI5q4vNIIKEWHUNtsAg2xyRwITB+JNeUohqchmr/Bx/3dvbbvf/UEilICzXjDUCTnD7C6
	px7o194g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGbBr-0000000EOc5-2V9w;
	Sat, 25 Apr 2026 11:28:51 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGbBo-0000000EObY-3qqU;
	Sat, 25 Apr 2026 11:28:50 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3D1E3986;
	Sat, 25 Apr 2026 13:27:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777116425;
	bh=FEep56iE/C3Rq9sexNZ6bqN9RA8e1jk2/IcVlqsnXbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Je9cmv6Tz/gTalUsJn4gWByA5bstWnvoRHiy3jcUp0uSYJgj9w9zf+Mgb0Fnx6vEY
	 MOHqJAhAnz+LYUrJbThmsrw1fpihNPz38Uf9Ysv9Z9as49Kvnr7YnwAZtdgvBSDb7j
	 bpBC6fVC4UacbKv3WXKf+Mm5Bx/b1fPMbMAdt7v0=
Date: Sat, 25 Apr 2026 14:28:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dennis Gilmore <dennis@ausil.us>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Alexey Charkov <alchark@gmail.com>, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v8 3/6] drm/bridge: simple: Add the Lontium LT8711UXD
 DP-to-HDMI bridge
Message-ID: <20260425112844.GB2964234@killaraus.ideasonboard.com>
References: <20260425031011.2529364-1-dennis@ausil.us>
 <20260425031011.2529364-4-dennis@ausil.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260425031011.2529364-4-dennis@ausil.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_042849_093888_FBBFAA05 
X-CRM114-Status: GOOD (  15.61  )
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

Hi Dennis,

Thank you for the patch.

On Fri, Apr 24, 2026 at 10:10:08PM -0500, Dennis Gilmore wrote:
> The Lontium LT8711UXD is a high performance two lane Type-C/DP1.4
> to HDMI2.0 converter, designed to connect a USB Type-C source or
> a DP1.4 source to an HDMI2.0 sink.

As far as I can tell, the LT8711UXD has an I2C control interface.
Shouldn't it be an I2C device ?

> Signed-off-by: Dennis Gilmore <dennis@ausil.us>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> index 8aa31ca3c72d..42c1f3d5ba0c 100644
> --- a/drivers/gpu/drm/bridge/simple-bridge.c
> +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> @@ -270,6 +270,11 @@ static const struct of_device_id simple_bridge_match[] = {
>  		.data = &(const struct simple_bridge_info) {
>  			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
>  		},
> +	}, {
> +		.compatible = "lontium,lt8711uxd",
> +		.data = &(const struct simple_bridge_info) {
> +			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
> +		},
>  	}, {
>  		.compatible = "parade,ps185hdm",
>  		.data = &(const struct simple_bridge_info) {

-- 
Regards,

Laurent Pinchart


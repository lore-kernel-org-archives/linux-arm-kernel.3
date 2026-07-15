Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94913C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 08:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rFNGUCLtwL0J9UMzLUhMW3/R8y1OqX7JmKnCzawnBV4=; b=kGAgAPTAfL3FEmqpAYFurNKSyQ
	oydASurFneslUFkA4ncDQ3e0iTWNDVpxHeE2vHPUOi4HSl2Qyy8MvMeCtsSgXEqJosFQXAh+SvN+O
	pv4zLoSChjT+BWfvOQ5f7qE7NH0PLt6IPlr2Cm++munFz/ov4ZcA0GYecP6k6nYNskWAv7E0aBdVk
	Sf/YhBQh50iNVgP8OKw/Q2nZU593Wc7SZQuRNPdpROCRs1/CKKb9P7cxYDA3SKgrqHoLICiHtl+0f
	IlhcEAYDlS6/iJM94ULtX5H9/h8j03ynOmRt2rwmzafArFcvHp9RICoRCdM8Z32X6S18kSfTTUfqk
	44addkJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvJO-0000000EChA-0aAw;
	Wed, 15 Jul 2026 08:49:50 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvJK-0000000ECfc-1uq4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 08:49:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D9060C2B9C4;
	Wed, 15 Jul 2026 08:49:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F0D8D6035C;
	Wed, 15 Jul 2026 08:49:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 51F9311BD3C24;
	Wed, 15 Jul 2026 10:49:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784105381; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rFNGUCLtwL0J9UMzLUhMW3/R8y1OqX7JmKnCzawnBV4=;
	b=v0kbq9Wp0Snw1mUEYQk9jToT+RDLdlswU2d0gC17xE5U6j9w26ZQcy27tuDIGkUnAsWC1r
	mfHKBcv8AJCFniJb3MRRErQT9zgqyu8yiiG8WlCormo77+OHu3roSFs/eepL/Uc4wb9WV1
	FbHWqZcpMDLxwYSTsZt8U3SBiWe14c6eWGWevDaw7Dgp2wSempFJvZIklMt7ywWFux98Zm
	MFBSwcNJRqJbqxBhDAMGbIV6SF3THRFUdD+AyVAuTBGTmxgDX9iIQaY/gXXJ2nLOVIu9xj
	6NP6WpfY8ydvPcYOcFNuJvo9SL3ml07T795y/M9jWuPy4Zf6L+qUYNadwe6HRA==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 2/2] drm/bridge: ti-sn65dsi83: Add reversed lvds
 lanes support
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Wojciech Dubowik <wojciech.dubowik@mt.com>
Cc: linux-kernel@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260713082622.52985-3-wojciech.dubowik@mt.com>
References: <20260713082622.52985-1-wojciech.dubowik@mt.com>
 <20260713082622.52985-3-wojciech.dubowik@mt.com>
Date: Wed, 15 Jul 2026 10:49:31 +0200
Message-Id: <178410537112.253594.1490996314225033236.b4-review@b4>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_014946_879933_59BE65DC 
X-CRM114-Status: GOOD (  18.01  )
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

On Mon, 13 Jul 2026 10:26:20 +0200, Wojciech Dubowik <wojciech.dubowik@mt.com> wrote:

Hello Wojciech,

>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index e6dbe51d0dba..d676ea3b40e8 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -148,6 +148,18 @@ enum sn65dsi83_lvds_term {
>  	OHM_200
>  };
>  
> +enum {
> +	NORMAL_LANE_MAPPING,
> +	REVERSE_LANE_MAPPING,

Please use a fixed prefix and use the suffix to differentiate:

  LANE_MAPPING_NORMAL,
  LANE_MAPPING_REVERSE,

> @@ -854,6 +873,37 @@ static int sn65dsi83_parse_lvds_endpoint(struct sn65dsi83 *ctx, int channel)
>  		goto exit;
>  	}
>  
> +	ret_data = of_property_read_u32_array(endpoint, "data-lanes", data_lanes,
> +			ARRAY_SIZE(data_lanes));
> +	if (ret_data != 0 && ret_data != -EINVAL) {
> +		ret = ret_data;
> +		goto exit;

The goto-based error handling is getting trickier and trickier with more
error conditions. Can you please add a preliminary commit in this series
that replaces:

 -struct device_node *endpoint;
 -endpoint = of_graph_get_endpoint_by_regs(dev->of_node, endpoint_reg, -1);
 +struct device_node *endpoint __free(device_node) =
 +         of_graph_get_endpoint_by_regs(dev->of_node, endpoint_reg, -1);

and removes the entire "ret = foo; goto exit;" logic with simple returns?

> +	}
> +
> +	if (!ret_data) {
> +		for (i = 0; i < ARRAY_SIZE(supported_data_lane_mapping); i++) {
> +			for (j = 0; j < DATA_LANES_COUNT; j++) {
> +				if (data_lanes[j] != supported_data_lane_mapping[i][j])
> +					break;
> +			}
> +
> +			if (j == DATA_LANES_COUNT)
> +				break;
> +		}

I think a memcmp() can simplify the implementation if you use the same data
type (u32) for data_lanes and supported_data_lane_mapping[].

> +
> +		switch (i) {
> +		case NORMAL_LANE_MAPPING:
> +			break;
> +		case REVERSE_LANE_MAPPING:
> +			ctx->lvds_reverse_lanes_conf[channel] = true;
> +			break;
> +		default:
> +			dev_err(dev, "invalid data lanes mapping\n");
> +			ret = -EINVAL;
> +			goto exit;
> +		}
> +	}

And perhaps the whole if (!ret_data) here can be simplified a lot as this
(pseudocode, not tested):

  if (!ret_data) {
      if (memcmp(data_lanes[j], supported_data_lane_mapping[NORMAL_LANE_MAPPING], size) == 0)
          break;
      else if (memcmp(data_lanes[j], supported_data_lane_mapping[REVERSE_LANE_MAPPING], size) == 0)
          ctx->lvds_reverse_lanes_conf[channel] = true;
      else
          return dev_err_probe(...);
  }

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3242E64AB3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 14:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fXsGM16t+k9xHW0mYA2cadaYwtcg7Q66kddImdrdG4Y=; b=SlaNRGuDyBv+2mbB6G0WooqcON
	Gti2iwfkSVQC9vSOREtiQUqx0tTSXAQ0kldbciFqR0poxSK0crsmjb87jxqSacpimr5eZi4OtClAU
	YDjOD1VkgbyyMt6W6kXe2QR9VvH3rkJeXLdOn6Aouc4qKpnmNyEqKCxG3DIOnd7+iGLB1mFHhjpGE
	q8xwcjVRtiNf2YVe+SrOigXowfx84qpuC7WKsoI1mGIBDRT30nDog26YK2BpMwmbRIAnbsdv4vTj5
	zU7ppIOGEQ1IofmaWi8Erqe9HpdBdyrfJo2CFa3SDjuwrzSgAUzgU18CrheXcmH9Zqfvg83seF/VM
	I3o+bXKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tITs3-00000009m60-1vWu;
	Tue, 03 Dec 2024 14:27:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tITr4-00000009m0V-3LyT;
	Tue, 03 Dec 2024 14:26:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fXsGM16t+k9xHW0mYA2cadaYwtcg7Q66kddImdrdG4Y=; b=VxvWkLupN9KqUznKUvJPPfjTy5
	B22xNRrEpUj6+koulvaOPacOP1Imo4LFB+eO+b4qrhqvidVHWtVTQH/gnh/16yLc5SoBrHJV0Z85T
	ReYeYfDLA2XEz09kipsvPiGjSSZ//FaLeJhT5H424FYBy4Ke5hiPufezOdvlNzwzTQupqFUo+rzyq
	JO63FSxqrvwuogkB//7kFGBTEqoXN/q0n9zoqXElEcIQZZOJaBD3361ofigxCn/kZZZuzzF6p3qVt
	5Wz9lNd37n9veVcFdeZN2sI3ZbWXMgaUxCJUGa0bziPKsnUyJYTCoLcPgHukn6ucHI3FPtLbnpt99
	wEhO6FrQ==;
Received: from mgamail.intel.com ([198.175.65.13])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tITr1-00000002OQ2-2jV9;
	Tue, 03 Dec 2024 14:26:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733235980; x=1764771980;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=uMWXhqZwProDmwOA4vHMhW1QbQjGRI1y8AQlSmfmBzk=;
  b=RBPaYjLqOfDbzXxbFWMXmAWS5m2kYCbYsYPWdIIc2jiWx9JuUKwMLr4J
   pi+0fS1oOh5jcvi83wu1CkmcBPkNxqq2/Uws9bYmgOej/gNQN3TOv7SOf
   qoJb5PV0FU3PEcl9IYZ5Wy52+n5SYf8UdjSfRJJf6Qff/ddQb4FAOqFj0
   900FI9kpblzxL83lIhvGKTebE79LzNpogvS7eepjfNghYZ/Z3170maCbn
   bUn+esnIG9a3QMrModV8cwpNkvgFQbh7j7oFMxGcA33yqmj/cXYQDCl7g
   LKCu7q/aYy6B6JTCcglAx12TSy3eaUcr6PheT25w5lVF+P+s1FvO0cWLF
   Q==;
X-CSE-ConnectionGUID: 1EKRtRypQMmHCxzx4QWl2A==
X-CSE-MsgGUID: H6dJZf67R167RhHTXoSgMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44480683"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="44480683"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 06:26:13 -0800
X-CSE-ConnectionGUID: aDPdg6NdRb+ONzW7kLZxAQ==
X-CSE-MsgGUID: Tuwzy8/pRA2RVBUpHZa5NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="93328558"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.135])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 06:26:01 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Phong LE <ple@baylibre.com>, Inki Dae
 <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King
 <linux@armlinux.org.uk>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?=
 <heiko@sntech.de>, Andy
 Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, =?utf-8?Q?Ma=C3=ADra?= Canal
 <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 7/9] drm/bridge_connector: hook
 drm_atomic_helper_connector_hdmi_update_edid()
In-Reply-To: <20241201-drm-bridge-hdmi-connector-v5-7-b5316e82f61a@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-7-b5316e82f61a@linaro.org>
Date: Tue, 03 Dec 2024 16:25:58 +0200
Message-ID: <87a5dc4zd5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_142620_069963_2A2B1E86 
X-CRM114-Status: GOOD (  25.20  )
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

On Sun, 01 Dec 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> Extend drm_bridge_connector code to read the EDID and use it to update
> connector status if the bridge chain implements HDMI bridge. Performing
> it from the generic location minimizes individual bridge's code and
> enforces standard behaviour from all corresponding drivers.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 67 ++++++++++++++++++++------
>  1 file changed, 53 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index 12ab9f14cc8a8672478ae2804c9a68d766d88ea5..71ae3b2c9049016d1cc0d39a787f6461633efd53 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -17,6 +17,7 @@
>  #include <drm/drm_edid.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_modeset_helper_vtables.h>
> +#include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/display/drm_hdmi_state_helper.h>
>  
> @@ -175,17 +176,55 @@ static void drm_bridge_connector_disable_hpd(struct drm_connector *connector)
>   * Bridge Connector Functions
>   */
>  
> +static const struct drm_edid *
> +drm_bridge_connector_read_edid(struct drm_connector *connector,
> +			       enum drm_connector_status status)
> +{
> +	struct drm_bridge_connector *bridge_connector =
> +		to_drm_bridge_connector(connector);
> +	const struct drm_edid *drm_edid;
> +	struct drm_bridge *bridge;
> +
> +	bridge = bridge_connector->bridge_edid;
> +	if (!bridge)
> +		return NULL;
> +
> +	if (status != connector_status_connected)
> +		return NULL;
> +
> +	drm_edid = drm_bridge_edid_read(bridge, connector);
> +	if (!drm_edid_valid(drm_edid)) {

What's the case this check is for?

My preference would be that bridge->funcs->edid_read() uses
drm_edid_read*() family of functions that do the checks and return the
EDID.

There are some cases that just allocate a blob and return it. Would be
nice if they could be converted, but in the mean time could use
drm_edid_valid() right there. Additional validity checks are redundant.

BR,
Jani.


> +		drm_edid_free(drm_edid);
> +		return NULL;
> +	}
> +
> +	return drm_edid;
> +}
> +
>  static enum drm_connector_status
>  drm_bridge_connector_detect(struct drm_connector *connector, bool force)
>  {
>  	struct drm_bridge_connector *bridge_connector =
>  		to_drm_bridge_connector(connector);
>  	struct drm_bridge *detect = bridge_connector->bridge_detect;
> +	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
>  	enum drm_connector_status status;
>  
>  	if (detect) {
>  		status = detect->funcs->detect(detect);
>  
> +		if (hdmi) {
> +			const struct drm_edid *drm_edid;
> +			int ret;
> +
> +			drm_edid = drm_bridge_connector_read_edid(connector, status);
> +			ret = drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);
> +			if (ret)
> +				drm_warn(connector->dev, "updating EDID failed with %d\n", ret);
> +
> +			drm_edid_free(drm_edid);
> +		}
> +
>  		drm_bridge_connector_hpd_notify(connector, status);
>  	} else {
>  		switch (connector->connector_type) {
> @@ -246,29 +285,29 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
>  static int drm_bridge_connector_get_modes_edid(struct drm_connector *connector,
>  					       struct drm_bridge *bridge)
>  {
> +	struct drm_bridge_connector *bridge_connector =
> +		to_drm_bridge_connector(connector);
> +	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
>  	enum drm_connector_status status;
>  	const struct drm_edid *drm_edid;
> -	int n;
>  
>  	status = drm_bridge_connector_detect(connector, false);
>  	if (status != connector_status_connected)
> -		goto no_edid;
> +		return 0;
>  
> -	drm_edid = drm_bridge_edid_read(bridge, connector);
> -	if (!drm_edid_valid(drm_edid)) {
> +	/* In HDMI setup the EDID has been read and handled as a part of .detect() */
> +	if (!hdmi) {
> +		drm_edid = drm_bridge_connector_read_edid(connector, status);
> +		if (!drm_edid) {
> +			drm_edid_connector_update(connector, NULL);
> +			return 0;
> +		}
> +
> +		drm_edid_connector_update(connector, drm_edid);
>  		drm_edid_free(drm_edid);
> -		goto no_edid;
>  	}
>  
> -	drm_edid_connector_update(connector, drm_edid);
> -	n = drm_edid_connector_add_modes(connector);
> -
> -	drm_edid_free(drm_edid);
> -	return n;
> -
> -no_edid:
> -	drm_edid_connector_update(connector, NULL);
> -	return 0;
> +	return drm_edid_connector_add_modes(connector);
>  }
>  
>  static int drm_bridge_connector_get_modes(struct drm_connector *connector)

-- 
Jani Nikula, Intel


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65333606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 01:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kVaVOxnj;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=X/Fm4VDX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fTHe9pcXTKxRGNgBHQwELDkRI1+tQnp9o4yzAANBj4Y=; b=kVaVOxnjnRn/hd
	9747XDbQkZ2B9Ts+UMaPXTBWvbQtKeR1C4W1kWpF0Ox/38F2iUNrlLlVj6TVVhp0vLXhZTvNa4bvY
	mCBCEYuPz/1sISXqN1jI0+D4zYgsGjDigWwNTF1fC6QgJwH/wTwp9n87HHI9C6jeSO8e68WnC5EZC
	1lXd8XSvSofy1biAXX65f7Rd5Eu2p1A3ria/duKLDVAed/hV5yyue5VxEPVg6LTPZgmWzo7gB9uoi
	GKCHPp6hA1j0bqhDGqxTpKR8ZmyXAvHxWrEF5OHcq8HB4T1DYGYtJmmXpx69dXhb0lSpX33xJIxl5
	F1QMBb+tVMqKorECnZcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK3yS-0000000FG9G-1wKQ;
	Fri, 23 Oct 2026 01:21:36 +0000
Received: from mail-m83154.xmail.ntesmail.com ([156.224.83.154])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK3yO-0000000FG8f-1BXY;
	Fri, 23 Oct 2026 01:21:35 +0000
Received: from [127.0.0.1] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 520f42c30;
	Fri, 23 Oct 2026 09:21:25 +0800 (GMT+08:00)
Message-ID: <e19ac7d1-5a86-4a96-a868-56a4abda3ec4@rock-chips.com>
Date: Fri, 23 Oct 2026 09:21:08 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/9] drm/bridge: pass down IRQ_HPD to the drivers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Francesco Dolcini <francesco@dolcini.it>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
 <20261022-hpd-irq-events-v6-3-337ea3ddaa62@oss.qualcomm.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261022-hpd-irq-events-v6-3-337ea3ddaa62@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa1665937f503a7kunmabefcd952d3a31
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCHkxKVkIdSU4dHxpNGhkZTFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQkxVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=X/Fm4VDX9sFENPD6Wn9qD+Uao+7D0Epq2pQrsnbwFBrymGk6h8O6RmS3bL18Vm4+OOE5fn9EHK7f5aXlKmzlgC52HGgkZdlKQwycb9gdto26fXfwfIFdx0+DDP+R8+nr+Q9Qgl+MLUiC4hQPHMwHPlcJ75OMdNIu2jiqwx+mQLE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=fTHe9pcXTKxRGNgBHQwELDkRI1+tQnp9o4yzAANBj4Y=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_182133_141680_017B3089 
X-CRM114-Status: GOOD (  16.24  )
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
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/22/2026 9:27 PM, Dmitry Baryshkov wrote:
> The DisplayPort standard defines a special kind of HPD events called
> IRQ_HPD. These events are used to notify DP Source about the events on
> the Sink side. Pass down the extra status to the bridge drivers via the
> hpd_notify() callback, letting DP bridges to act accordingly.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c     | 3 ++-
>  drivers/gpu/drm/display/drm_bridge_connector.c | 2 +-
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c     | 3 ++-
>  drivers/gpu/drm/msm/dp/dp_display.c            | 3 ++-
>  drivers/gpu/drm/msm/dp/dp_drm.h                | 3 ++-
>  drivers/gpu/drm/omapdrm/dss/hdmi4.c            | 3 ++-
>  include/drm/drm_bridge.h                       | 3 ++-
>  7 files changed, 13 insertions(+), 7 deletions(-)
> 

Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index b3bb7f2cebb3..b1ffbab89a16 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -429,7 +429,8 @@ static const struct drm_edid *lt9611uxc_bridge_edid_read(struct drm_bridge *brid
>  
>  static void lt9611uxc_bridge_hpd_notify(struct drm_bridge *bridge,
>  					struct drm_connector *connector,
> -					enum drm_connector_status status)
> +					enum drm_connector_status status,
> +					enum drm_connector_dp_event event)
>  {
>  	const struct drm_edid *drm_edid;
>  
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index 898273f60cf6..1b0a1a00d8eb 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -151,7 +151,7 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
>  	/* Notify all bridges in the pipeline of hotplug events. */
>  	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge) {
>  		if (bridge->funcs->hpd_notify)
> -			bridge->funcs->hpd_notify(bridge, connector, status);
> +			bridge->funcs->hpd_notify(bridge, connector, status, event);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> index c4355c5cc340..a637613ae2e1 100644
> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> @@ -323,7 +323,8 @@ static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
>  
>  static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
>  					  struct drm_connector *connector,
> -					  enum drm_connector_status status)
> +					  enum drm_connector_status status,
> +					  enum drm_connector_dp_event event)
>  {
>  	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 6abe30bdff12..fa8942922b53 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1541,7 +1541,8 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
>  
>  void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
>  			      struct drm_connector *connector,
> -			      enum drm_connector_status status)
> +			      enum drm_connector_status status,
> +			      enum drm_connector_dp_event event)
>  {
>  	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
>  	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
> index da412c788503..8f2f4201da60 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.h
> @@ -31,6 +31,7 @@ void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
>  void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
>  void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
>  			      struct drm_connector *connector,
> -			      enum drm_connector_status status);
> +			      enum drm_connector_status status,
> +			      enum drm_connector_dp_event event);
>  
>  #endif /* _DP_DRM_H_ */
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> index bd6c4d2dcdc8..72972a6fe989 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
> @@ -429,7 +429,8 @@ static void hdmi4_bridge_disable(struct drm_bridge *bridge,
>  
>  static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
>  				    struct drm_connector *connector,
> -				    enum drm_connector_status status)
> +				    enum drm_connector_status status,
> +				    enum drm_connector_dp_event event)
>  {
>  	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
>  
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 1981d24a700d..6382ef5f1ea2 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -509,7 +509,8 @@ struct drm_bridge_funcs {
>  	 */
>  	void (*hpd_notify)(struct drm_bridge *bridge,
>  			   struct drm_connector *connector,
> -			   enum drm_connector_status status);
> +			   enum drm_connector_status status,
> +			   enum drm_connector_dp_event event);
>  
>  	/**
>  	 * @hpd_enable:
> 

-- 
Best, 
Chaoyi



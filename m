Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B35CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 03:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6j251N+TTWj2dwg/qF59bibn6Pq6K+CmCvwfdrpKx7o=; b=ENOrTeuMCZhxECtTxgUXa8sHh5
	cKgqNCxRtvIfvZdpTqRe+MZDCrr0Vo1UL1fJWokDduOiFoUZT+qMtjmXg/IuzpjSvscIjVcZMA/gx
	MBQ2hmdyf0D44qsfgXXBMJSjEvoutLqSBFJaC3YVVFvuYVzZ/uAnMSYC8DylEd3nXO2e+wCb9PRnh
	jKI05NliWdgAH4ao+1smtvdnx7YQERfcUmzB8dikhonMoxZ7A7aZX77pThm+YZCf9MfNmxDDwKXV9
	abW5lJ+mgQ1M2qO4rArBivXFiZskwlloVPs0o4NuU0LXxRHMcP0riGN6TF1ohlfvQX4YktsW12V1B
	zvfjOBZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0tmZ-0000000CF70-1VeZ;
	Tue, 23 Sep 2025 03:33:35 +0000
Received: from mail-m1973178.qiye.163.com ([220.197.31.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0tmV-0000000CF3s-2YwI;
	Tue, 23 Sep 2025 03:33:33 +0000
Received: from [172.16.12.153] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 23b8da0fb;
	Tue, 23 Sep 2025 11:33:21 +0800 (GMT+08:00)
Message-ID: <ccaa0f30-6b18-4d44-bda5-e90e1b087ecc@rock-chips.com>
Date: Tue, 23 Sep 2025 11:33:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] drm/rockchip: cdn-dp: Add multiple bridges to
 support PHY port selection
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20250922012039.323-1-kernel@airkyi.com>
 <20250922012039.323-6-kernel@airkyi.com>
 <idyrlzhd5sotg3ylr7vbwmczimglffc75nafxbnhhm3ot2jn4w@ixerm6elfmre>
 <e10484e2-fafb-4e50-866f-f409c12259a5@rock-chips.com>
 <3n6gvt2lcf24smt6njiqoqt5h4733z36hwvc2zfyft62d25uu5@vwl26mmsfzbz>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <3n6gvt2lcf24smt6njiqoqt5h4733z36hwvc2zfyft62d25uu5@vwl26mmsfzbz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9974a20c3803abkunmdfc552bfe7f27
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQk5JT1ZPGh5ISxgYTkoeH0hWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=SlPVi1oSXf0cIDR90Gbl+WHVoEiSBgo/rezRMw1ZUjKfpSHz1UnY+sIXOOZrJPeGg4fHewcX/QApxVfWX35I0knqL4JTlhgJbWI3kVYHwzv+KXNfumqhePewOGGBuAq4ZTr4jrTvcKoPs/6xS+A5nqnloqTsSH6n8gM3BROQ29w=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=6j251N+TTWj2dwg/qF59bibn6Pq6K+CmCvwfdrpKx7o=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_203331_834315_3306F98E 
X-CRM114-Status: GOOD (  31.00  )
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

On 9/23/2025 11:22 AM, Dmitry Baryshkov wrote:

> On Tue, Sep 23, 2025 at 10:09:38AM +0800, Chaoyi Chen wrote:
>> On 9/23/2025 9:50 AM, Dmitry Baryshkov wrote:
>>
>>> On Mon, Sep 22, 2025 at 09:20:37AM +0800, Chaoyi Chen wrote:
>>>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>>>
>>>> The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
>>>> the CDN-DP can be switched to output to one of the PHYs. If both ports
>>>> are plugged into DP, DP will select the first port for output.
>>>>
>>>> This patch adds support for multiple bridges, enabling users to flexibly
>>>> select the output port. For each PHY port, a separate encoder and bridge
>>>> are registered.
>>>>
>>>> The change is based on the DRM AUX HPD bridge, rather than the
>>>> extcon approach. This requires the DT to correctly describe the
>>>> connections between the PHY, USB connector, and DP controller.
>>>> And cdn_dp_parse_hpd_bridge_dt() will parses it and determines
>>>> whether to register one or two bridges.
>>>>
>>>> Since there is only one DP controller, only one of the PHY ports can
>>>> output at a time. The key is how to switch between different PHYs,
>>>> which is handled by cdn_dp_switch_port() and cdn_dp_enable().
>>>>
>>>> There are two cases:
>>>>
>>>> 1. Neither bridge is enabled. In this case, both bridges can
>>>> independently read the EDID, and the PHY port may switch before
>>>> reading the EDID.
>>>>
>>>> 2. One bridge is already enabled. In this case, other bridges are not
>>>> allowed to read the EDID.
>>>>
>>>> Since the scenario of two ports plug in at the same time is rare,
>>>> I don't have a board which support two TypeC connector to test this.
>>>> Therefore, I tested forced switching on a single PHY port, as well as
>>>> output using a fake PHY port alongside a real PHY port.
>>>>
>>>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>>> ---
>>>>    drivers/gpu/drm/rockchip/Kconfig       |   1 +
>>>>    drivers/gpu/drm/rockchip/cdn-dp-core.c | 398 +++++++++++++++++++++----
>>>>    drivers/gpu/drm/rockchip/cdn-dp-core.h |  23 +-
>>>>    3 files changed, 366 insertions(+), 56 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
>>>> index faf50d872be3..3a6266279323 100644
>>>> --- a/drivers/gpu/drm/rockchip/Kconfig
>>>> +++ b/drivers/gpu/drm/rockchip/Kconfig
>>>> @@ -55,6 +55,7 @@ config ROCKCHIP_CDN_DP
>>>>    	select DRM_DISPLAY_HELPER
>>>>    	select DRM_BRIDGE_CONNECTOR
>>>>    	select DRM_DISPLAY_DP_HELPER
>>>> +	select DRM_AUX_HPD_BRIDGE
>>>>    	help
>>>>    	  This selects support for Rockchip SoC specific extensions
>>>>    	  for the cdn DP driver. If you want to enable Dp on
>>>> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
>>>> index 1e27301584a4..784f5656fcc4 100644
>>>> --- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
>>>> +++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
>>>> @@ -27,16 +27,17 @@
>>>>    #include "cdn-dp-core.h"
>>>>    #include "cdn-dp-reg.h"
>>>> -static inline struct cdn_dp_device *bridge_to_dp(struct drm_bridge *bridge)
>>>> +static int cdn_dp_switch_port(struct cdn_dp_device *dp, struct cdn_dp_port *prev_port,
>>>> +			      struct cdn_dp_port *port);
>>>> +
>>>> +static inline struct cdn_dp_bridge *bridge_to_dp_bridge(struct drm_bridge *bridge)
>>>>    {
>>>> -	return container_of(bridge, struct cdn_dp_device, bridge);
>>>> +	return container_of(bridge, struct cdn_dp_bridge, bridge);
>>>>    }
>>>> -static inline struct cdn_dp_device *encoder_to_dp(struct drm_encoder *encoder)
>>>> +static inline struct cdn_dp_device *bridge_to_dp(struct drm_bridge *bridge)
>>>>    {
>>>> -	struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
>>>> -
>>>> -	return container_of(rkencoder, struct cdn_dp_device, encoder);
>>>> +	return bridge_to_dp_bridge(bridge)->parent;
>>>>    }
>>>>    #define GRF_SOC_CON9		0x6224
>>>> @@ -191,14 +192,27 @@ static int cdn_dp_get_sink_count(struct cdn_dp_device *dp, u8 *sink_count)
>>>>    static struct cdn_dp_port *cdn_dp_connected_port(struct cdn_dp_device *dp)
>>>>    {
>>>>    	struct cdn_dp_port *port;
>>>> -	int i, lanes;
>>>> +	int i, lanes[MAX_PHY];
>>>>    	for (i = 0; i < dp->ports; i++) {
>>>>    		port = dp->port[i];
>>>> -		lanes = cdn_dp_get_port_lanes(port);
>>>> -		if (lanes)
>>>> +		lanes[i] = cdn_dp_get_port_lanes(port);
>>>> +		if (!dp->hpd_bridge_valid)
>>>>    			return port;
>>>>    	}
>>>> +
>>>> +	if (dp->hpd_bridge_valid) {
>>>> +		/* If more than one port is available, pick the last active port */
>>>> +		if (dp->active_port > 0 && lanes[dp->active_port])
>>>> +			return dp->port[dp->active_port];
>>>> +
>>>> +		/* If the last active port is not available, pick an available port in order */
>>>> +		for (i = 0; i < dp->bridge_count; i++) {
>>>> +			if (lanes[i])
>>>> +				return dp->port[i];
>>>> +		}
>>>> +	}
>>>> +
>>>>    	return NULL;
>>>>    }
>>>> @@ -239,10 +253,11 @@ static enum drm_connector_status
>>>>    cdn_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
>>>>    {
>>>>    	struct cdn_dp_device *dp = bridge_to_dp(bridge);
>>>> +	struct cdn_dp_bridge *dp_bridge = bridge_to_dp_bridge(bridge);
>>>>    	enum drm_connector_status status = connector_status_disconnected;
>>>>    	mutex_lock(&dp->lock);
>>>> -	if (dp->connected)
>>>> +	if (dp_bridge->connected && dp->connected)
>>>>    		status = connector_status_connected;
>>>>    	mutex_unlock(&dp->lock);
>>>> @@ -253,10 +268,36 @@ static const struct drm_edid *
>>>>    cdn_dp_bridge_edid_read(struct drm_bridge *bridge, struct drm_connector *connector)
>>>>    {
>>>>    	struct cdn_dp_device *dp = bridge_to_dp(bridge);
>>>> -	const struct drm_edid *drm_edid;
>>>> +	struct cdn_dp_bridge *dp_bridge = bridge_to_dp_bridge(bridge);
>>>> +	struct cdn_dp_port *port = dp->port[dp_bridge->id];
>>>> +	struct cdn_dp_port *prev_port;
>>>> +	const struct drm_edid *drm_edid = NULL;
>>>> +	int i, ret;
>>>>    	mutex_lock(&dp->lock);
>>>> +
>>>> +	/* More than one port is available */
>>>> +	if (dp->bridge_count > 1 && !port->phy_enabled) {
>>>> +		for (i = 0; i < dp->bridge_count; i++) {
>>>> +			/* Another port already enable */
>>>> +			if (dp->bridge_list[i] != dp_bridge && dp->bridge_list[i]->enabled)
>>>> +				goto unlock;
>>>> +			/* Find already enabled port */
>>>> +			if (dp->port[i]->phy_enabled)
>>>> +				prev_port = dp->port[i];
>>>> +		}
>>>> +
>>>> +		/* Switch to current port */
>>>> +		if (prev_port) {
>>>> +			ret = cdn_dp_switch_port(dp, prev_port, port);
>>>> +			if (ret)
>>>> +				goto unlock;
>>>> +		}
>>>> +	}
>>>> +
>>>>    	drm_edid = drm_edid_read_custom(connector, cdn_dp_get_edid_block, dp);
>>> So... If I try reading EDID for the PHY 2 while PHY 1 is enabled, will
>>> it return NULL, even if there is a monitor there? It totally feels like
>>> this is one of the rare cases when caching EDIDs might make sense.
>> Of course. I did consider using cache, but if the monitor changes, then caching the EDID doesn't seem to be of much use…
> Yes... It might still be better to invalidate the cache on the plug
> event rather than always reporting empty EDID when another monitor is
> enabled.

Hmm, I will add cache in v5.


>
-- 
Best,
Chaoyi



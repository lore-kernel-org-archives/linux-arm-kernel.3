Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1393CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 03:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUnJ2CE0BnHDgBWcL76+TzXIrZ4HxTgehwBTbISxmcE=; b=LObAwxc4iFVYXSUAcyXEzZI3kH
	HvDiJ5kJEwFFRTEEXUvZwJF71QeaycfSS5vDY8we9G3tynw7FhPLvhcW1evBu7FqRoHHPMy0NeM6j
	nWnyCGRiZnTkrhktqz5EUZQLm0pnUBupiK35jfSJERj1fRXDtaJxemYyfVBa7+qI71S69NbREGB2j
	j+x6ycEvXlAp4tpF2Dr1UMz2MeDffbQg2CtVlGD3bbrCkd9xdcFDr/qb7y8M+Uz+RcTGVCeRiFIRP
	QiK7erEXNOaUBRRP/ltsCbdk+ndT7mqQm6EzMc5l574K1fqroS3WtbWmih7MM4E3imKVkcAKXFgTV
	kFaR6blw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0tbc-0000000CE9p-2gUv;
	Tue, 23 Sep 2025 03:22:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0tbY-0000000CE6p-25fy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 03:22:15 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58N3Ce9m009181
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 03:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oUnJ2CE0BnHDgBWcL76+TzXIrZ4HxTgehwBTbISxmcE=; b=kpMoLxaw5pxOjYcc
	CKzOGh6j55O1iok4v8USxkJW92/TEHIvWEMIX2HoCD+QyCNCKQTMWZFBCR6vsjDO
	mVO1uo8lPfJuI2O6eAFfXYgU/aSZHZ7rAFeOPKx3QxxydcsQj4fsPjwwZN0CwP2Q
	CXbX42afkayRcQwlSti38gjZN3+aciVwO1eRvdh8JBL13zdiLuxLrDIXFXP3yBXr
	S8K+Yk6HS9tE34d4EJYkCCP0ogAbwWWAwr0cZpuMN3IELugNUWvM81LB2MWI9YX8
	Oc1Z+yIcC7wzetn+4IEBU0Ck/a9GCTtrCg4cydfqaE+BFgmzn1nTEpTiliahtu3N
	amQ9kA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyeq84g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 03:22:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-78de70c9145so88596006d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 20:22:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758597727; x=1759202527;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oUnJ2CE0BnHDgBWcL76+TzXIrZ4HxTgehwBTbISxmcE=;
        b=YUgfcuI3scJE6eDNtVMrGzfaq5vZkn4e+37mbqUmnjs0ajZQ+57Ab/NpyOEZJMYB0f
         72llmxjwxJkOfc8ollctANCOxf7DLCiYJOVAhY8M7BMWJxLaTesL/lQAV3sYKUVSFxw7
         M0jpH4dJXAWCDd1NVwT/NQ18VynAcUrkXDtPm9Ld9BN8Zlo8MevGA1M0ZW5n0FU/xGbe
         /sgj164yCT1QC1mCSdxa6avICbhQmst3X/OMVrEIpcthkcVVNO24mE/Qh/0rQGJx3x5C
         U1arVlJxhKRjcSoAfkpfQJ3VdzVrp4Cc2aO1XDZHzoOgGkPjPUqiveOcfhXwGLwTLgyF
         /tbA==
X-Forwarded-Encrypted: i=1; AJvYcCVHRYbd5VXI8O2azlLv0AXmGt5mMLNGVj1cU5D/Ctf1c/SSlE5VUA2A28NnyBntIDY/kGuDQjEpJKuPbkwRzRXg@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9jpfrtFb/C1OWtlCEXORRPgNhOHLY/Dc2zLF6muXS+iiHNWS1
	NYW7rPd6kTnU8a/wlvdp5bZwxPgGCMYtYBvk/fuYNXCGdsxyLMylWxoeCGDRUubxQ9JKWHCwcgL
	jvWYUkVPbc5/9Tfq/q6pRRtW1f7HML24ckWETosJBrEAFzQEoa3T9LRBh9QMQehOwBOFGpmaKL4
	ZitA==
X-Gm-Gg: ASbGncvx4StP75iEZi5lr70JZ+SJG0H5Cz4xWHrEmBqYnA+aXnHupNs+xXwWLcv+8ZJ
	gAW9gu2ndgzuWj5AjMc2Fktj7CEGayhnzHDKjfvnYIuRFF98kCUe9UZUW5aYQAvM5XlT6KxVqrv
	3++7tmgOcuUdEnbYAfFkO8mQOqyxOLI71y3Ew4uJCOqAJ6k8/NxsefpjHD4dYX5j9U52EhQPcHL
	D9Y0kjwkNA5A1RXypOI/zMPxz2DeZdRHt1wa2h+LE5iYexpE0kYk8iSzjeL0U64p5++QSc3QWND
	jrEa9aL5p06ILyywnhiMhzwrkIQhAcjQMuJHXL8QwaGh4PIUJoooQvTCajmZp/x06ryOpAFZA5q
	SwqEMbnPRQjDl7HRihocvblMfOulZUOFkJ/1BTN6PBIrJcZfhqtL7
X-Received: by 2002:a05:6214:19cc:b0:78b:e6ac:7169 with SMTP id 6a1803df08f44-7e7131d6edbmr13878436d6.32.1758597726941;
        Mon, 22 Sep 2025 20:22:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIgFDuQXlz78aQgFJIuN6m1QzDuD7QbClf/2Di5vm32tNyLwxeGQHA2RXdv8rX7kJSHv2lUw==
X-Received: by 2002:a05:6214:19cc:b0:78b:e6ac:7169 with SMTP id 6a1803df08f44-7e7131d6edbmr13877966d6.32.1758597726347;
        Mon, 22 Sep 2025 20:22:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-578a8fad2b6sm3799691e87.69.2025.09.22.20.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 20:22:05 -0700 (PDT)
Date: Tue, 23 Sep 2025 06:22:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Yubing Zhang <yubing.zhang@rock-chips.com>,
        Frank Wang <frank.wang@rock-chips.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
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
Subject: Re: [PATCH v4 5/7] drm/rockchip: cdn-dp: Add multiple bridges to
 support PHY port selection
Message-ID: <3n6gvt2lcf24smt6njiqoqt5h4733z36hwvc2zfyft62d25uu5@vwl26mmsfzbz>
References: <20250922012039.323-1-kernel@airkyi.com>
 <20250922012039.323-6-kernel@airkyi.com>
 <idyrlzhd5sotg3ylr7vbwmczimglffc75nafxbnhhm3ot2jn4w@ixerm6elfmre>
 <e10484e2-fafb-4e50-866f-f409c12259a5@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e10484e2-fafb-4e50-866f-f409c12259a5@rock-chips.com>
X-Proofpoint-GUID: tQr2XRqjrBqo7wx_ci0cNKFxnwRVirHF
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d21264 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s8YR1HE3AAAA:8 a=O6fFDK9WeBrGYpzTqrUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX+QJJsUX2vatL
 sFEsEuXxpwW3Bc64Vp/kcNdDflnIRRHeS4gPu+tsl+m4WLEAUZD3WlVq+4VAXyOZjUZQ7uWxWFv
 sehWYLTNaR74Rgc4VtkrV7rkBmcP+qsgoMbldtVSW0rWNWnp4FYzLRtcLGfwMi25wYm28sHZLiS
 WijUUgWOnuAVaFlNniQjCneKe9a5li5Ytlf3fpq2vVM743aMqZMvdC5S0dK4qQnoEMTZ3w0VFc7
 mVYqdkYIup0gYVqdHtWMxzz+xwwoIzBgmQRER6VEuzhpsXt5JlEwZXpoCZT8GpfHKevu+CYhny0
 OtA248zZ4ZyJukFIWThmMyskzgezsGXS4CJpxD4mXs1xKwb8v/CGXtlrGcZbcZoYDrRQjgz+aii
 0FD1RBL3
X-Proofpoint-ORIG-GUID: tQr2XRqjrBqo7wx_ci0cNKFxnwRVirHF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_01,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_202212_538071_08CE795D 
X-CRM114-Status: GOOD (  55.11  )
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

On Tue, Sep 23, 2025 at 10:09:38AM +0800, Chaoyi Chen wrote:
> On 9/23/2025 9:50 AM, Dmitry Baryshkov wrote:
> 
> > On Mon, Sep 22, 2025 at 09:20:37AM +0800, Chaoyi Chen wrote:
> > > From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > 
> > > The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
> > > the CDN-DP can be switched to output to one of the PHYs. If both ports
> > > are plugged into DP, DP will select the first port for output.
> > > 
> > > This patch adds support for multiple bridges, enabling users to flexibly
> > > select the output port. For each PHY port, a separate encoder and bridge
> > > are registered.
> > > 
> > > The change is based on the DRM AUX HPD bridge, rather than the
> > > extcon approach. This requires the DT to correctly describe the
> > > connections between the PHY, USB connector, and DP controller.
> > > And cdn_dp_parse_hpd_bridge_dt() will parses it and determines
> > > whether to register one or two bridges.
> > > 
> > > Since there is only one DP controller, only one of the PHY ports can
> > > output at a time. The key is how to switch between different PHYs,
> > > which is handled by cdn_dp_switch_port() and cdn_dp_enable().
> > > 
> > > There are two cases:
> > > 
> > > 1. Neither bridge is enabled. In this case, both bridges can
> > > independently read the EDID, and the PHY port may switch before
> > > reading the EDID.
> > > 
> > > 2. One bridge is already enabled. In this case, other bridges are not
> > > allowed to read the EDID.
> > > 
> > > Since the scenario of two ports plug in at the same time is rare,
> > > I don't have a board which support two TypeC connector to test this.
> > > Therefore, I tested forced switching on a single PHY port, as well as
> > > output using a fake PHY port alongside a real PHY port.
> > > 
> > > Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > ---
> > >   drivers/gpu/drm/rockchip/Kconfig       |   1 +
> > >   drivers/gpu/drm/rockchip/cdn-dp-core.c | 398 +++++++++++++++++++++----
> > >   drivers/gpu/drm/rockchip/cdn-dp-core.h |  23 +-
> > >   3 files changed, 366 insertions(+), 56 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
> > > index faf50d872be3..3a6266279323 100644
> > > --- a/drivers/gpu/drm/rockchip/Kconfig
> > > +++ b/drivers/gpu/drm/rockchip/Kconfig
> > > @@ -55,6 +55,7 @@ config ROCKCHIP_CDN_DP
> > >   	select DRM_DISPLAY_HELPER
> > >   	select DRM_BRIDGE_CONNECTOR
> > >   	select DRM_DISPLAY_DP_HELPER
> > > +	select DRM_AUX_HPD_BRIDGE
> > >   	help
> > >   	  This selects support for Rockchip SoC specific extensions
> > >   	  for the cdn DP driver. If you want to enable Dp on
> > > diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> > > index 1e27301584a4..784f5656fcc4 100644
> > > --- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
> > > +++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> > > @@ -27,16 +27,17 @@
> > >   #include "cdn-dp-core.h"
> > >   #include "cdn-dp-reg.h"
> > > -static inline struct cdn_dp_device *bridge_to_dp(struct drm_bridge *bridge)
> > > +static int cdn_dp_switch_port(struct cdn_dp_device *dp, struct cdn_dp_port *prev_port,
> > > +			      struct cdn_dp_port *port);
> > > +
> > > +static inline struct cdn_dp_bridge *bridge_to_dp_bridge(struct drm_bridge *bridge)
> > >   {
> > > -	return container_of(bridge, struct cdn_dp_device, bridge);
> > > +	return container_of(bridge, struct cdn_dp_bridge, bridge);
> > >   }
> > > -static inline struct cdn_dp_device *encoder_to_dp(struct drm_encoder *encoder)
> > > +static inline struct cdn_dp_device *bridge_to_dp(struct drm_bridge *bridge)
> > >   {
> > > -	struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
> > > -
> > > -	return container_of(rkencoder, struct cdn_dp_device, encoder);
> > > +	return bridge_to_dp_bridge(bridge)->parent;
> > >   }
> > >   #define GRF_SOC_CON9		0x6224
> > > @@ -191,14 +192,27 @@ static int cdn_dp_get_sink_count(struct cdn_dp_device *dp, u8 *sink_count)
> > >   static struct cdn_dp_port *cdn_dp_connected_port(struct cdn_dp_device *dp)
> > >   {
> > >   	struct cdn_dp_port *port;
> > > -	int i, lanes;
> > > +	int i, lanes[MAX_PHY];
> > >   	for (i = 0; i < dp->ports; i++) {
> > >   		port = dp->port[i];
> > > -		lanes = cdn_dp_get_port_lanes(port);
> > > -		if (lanes)
> > > +		lanes[i] = cdn_dp_get_port_lanes(port);
> > > +		if (!dp->hpd_bridge_valid)
> > >   			return port;
> > >   	}
> > > +
> > > +	if (dp->hpd_bridge_valid) {
> > > +		/* If more than one port is available, pick the last active port */
> > > +		if (dp->active_port > 0 && lanes[dp->active_port])
> > > +			return dp->port[dp->active_port];
> > > +
> > > +		/* If the last active port is not available, pick an available port in order */
> > > +		for (i = 0; i < dp->bridge_count; i++) {
> > > +			if (lanes[i])
> > > +				return dp->port[i];
> > > +		}
> > > +	}
> > > +
> > >   	return NULL;
> > >   }
> > > @@ -239,10 +253,11 @@ static enum drm_connector_status
> > >   cdn_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
> > >   {
> > >   	struct cdn_dp_device *dp = bridge_to_dp(bridge);
> > > +	struct cdn_dp_bridge *dp_bridge = bridge_to_dp_bridge(bridge);
> > >   	enum drm_connector_status status = connector_status_disconnected;
> > >   	mutex_lock(&dp->lock);
> > > -	if (dp->connected)
> > > +	if (dp_bridge->connected && dp->connected)
> > >   		status = connector_status_connected;
> > >   	mutex_unlock(&dp->lock);
> > > @@ -253,10 +268,36 @@ static const struct drm_edid *
> > >   cdn_dp_bridge_edid_read(struct drm_bridge *bridge, struct drm_connector *connector)
> > >   {
> > >   	struct cdn_dp_device *dp = bridge_to_dp(bridge);
> > > -	const struct drm_edid *drm_edid;
> > > +	struct cdn_dp_bridge *dp_bridge = bridge_to_dp_bridge(bridge);
> > > +	struct cdn_dp_port *port = dp->port[dp_bridge->id];
> > > +	struct cdn_dp_port *prev_port;
> > > +	const struct drm_edid *drm_edid = NULL;
> > > +	int i, ret;
> > >   	mutex_lock(&dp->lock);
> > > +
> > > +	/* More than one port is available */
> > > +	if (dp->bridge_count > 1 && !port->phy_enabled) {
> > > +		for (i = 0; i < dp->bridge_count; i++) {
> > > +			/* Another port already enable */
> > > +			if (dp->bridge_list[i] != dp_bridge && dp->bridge_list[i]->enabled)
> > > +				goto unlock;
> > > +			/* Find already enabled port */
> > > +			if (dp->port[i]->phy_enabled)
> > > +				prev_port = dp->port[i];
> > > +		}
> > > +
> > > +		/* Switch to current port */
> > > +		if (prev_port) {
> > > +			ret = cdn_dp_switch_port(dp, prev_port, port);
> > > +			if (ret)
> > > +				goto unlock;
> > > +		}
> > > +	}
> > > +
> > >   	drm_edid = drm_edid_read_custom(connector, cdn_dp_get_edid_block, dp);
> > So... If I try reading EDID for the PHY 2 while PHY 1 is enabled, will
> > it return NULL, even if there is a monitor there? It totally feels like
> > this is one of the rare cases when caching EDIDs might make sense.
> 
> Of course. I did consider using cache, but if the monitor changes, then caching the EDID doesn't seem to be of much use…

Yes... It might still be better to invalidate the cache on the plug
event rather than always reporting empty EDID when another monitor is
enabled.

-- 
With best wishes
Dmitry


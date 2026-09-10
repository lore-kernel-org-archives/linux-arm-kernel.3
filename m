Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEF9C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 08:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZN6HtlaVAVG7FaFfctXwYiyQfxVaBlmMtcPgGoGm23c=; b=Lt31E7xKDCAnpO/K4yoImOEx67
	7lwrA7411JUkEyXCUVj2AnfT3b8dSB7NSnf2zFTiVBVbvG4gcNA1ADOl36rDES+HCFqQch4/WxqkH
	9PzXXlJJ6ifm5pEReD4JkSqxBK8aCYcr/50NDJhtG8PfcZp6/ia2YHah3grY5V/ChHI2aSt0Ll4O1
	Eh3nV1TYeiPIBw3xFuxRifsFi6tIy1nnHSAg+FR1RY1zEQqO2+IkOS5lX9fKdvDcNT7XKe+QvAeEk
	z8B6bZYRrMXPHWJwlORAvh1gdoTYNLazBoNKWqnhCgtLGxSURgrUKC3iMTxQUrHm1DUUTGPYPilBY
	SsWSWhaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Zy6-0000000DiDi-1M5m;
	Thu, 10 Sep 2026 08:17:14 +0000
Received: from mail-m16023652218.xmail.ntesmail.com ([160.236.52.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Zy2-0000000DiCT-0it1;
	Thu, 10 Sep 2026 08:17:12 +0000
Received: from [127.0.0.1] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d424001d;
	Thu, 10 Sep 2026 16:17:01 +0800 (GMT+08:00)
Message-ID: <388fd1ef-a8c9-4419-8bf2-10af7063e734@rock-chips.com>
Date: Thu, 10 Sep 2026 16:16:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] drm/rockchip: dw_dp: Attach "max bpc" connector
 property
To: Igor Paunovic <royalnet026@gmail.com>, Maxime Ripard
 <mripard@kernel.org>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>,
 Heiko Stuebner <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Imre Deak <imre.deak@intel.com>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
References: <9e77b5c5-f1d9-484b-ae02-846fae1b3642@rock-chips.com>
 <20260910075141.48803-1-royalnet026@gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20260910075141.48803-1-royalnet026@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa08a64411a03a7kunmd603e3c96b951d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1kYFggdWUFKV1ktWUFJV1kPCRoVCBIfWUFZQktKGFYaSh1JHh1LGR
	1MTU5WFRQJFhoXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0
	tIVUpLSEpKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=QsyzdKtR8GyvZXLIk9XQ2kqA0UgUML0r1a5HagEEzhjSTt8B7Od9kKHB/Q8+mHRk+xB4sMYEHpEg56AFZIdmelBTdIHi6tnmX5ez3I+5pCydNWkRX1TcoSgXbH7k6vDhfKFXodb9DNs1fsjTcNxWHY6pYs00xVQQ/13Z6NDPuFc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=ZN6HtlaVAVG7FaFfctXwYiyQfxVaBlmMtcPgGoGm23c=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_011711_005315_46628E37 
X-CRM114-Status: GOOD (  23.02  )
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

On 9/10/2026 3:51 PM, Igor Paunovic wrote:
> Hi Chaoyi,
> 
> On 9/10/26 09:16, Chaoyi Chen wrote:
>> I don't think this is the correct way to go.
>>
>> I believe max_bpc should be handled in drm_bridge_connector_init().
>> Take a look at its implementation. HDMI already does max_bpc there,
>> so DP should probably do something similar.
> 
> Agreed - that is the question I left open in my reply to the bot. v3
> moves it into drm_bridge_connector_init() and drops this glue patch.
> 
> Three points I would rather ask than guess, since it is shared code:
> 
> 1. How the bridge advertises it. drm_bridge.max_bpc is documented as
>    "only relevant if DRM_BRIDGE_OP_HDMI is set" and the helper only
>    reads it inside the OP_HDMI block. I intend to honour it on the
>    non-HDMI path too, relax that doc sentence, and have dw-dp set
>    bridge->max_bpc = 10. If you prefer to keep the field HDMI-only,
>    a separate field is easy - I just did not want to add one unasked.
>

Maybe we should consider adding a new "DRM_BRIDGE_OP_DP" :)

> 2. The range. HDMI attaches 8..max_bpc. dw-dp's format table goes down
>    to 6 bpc RGB and i915 attaches 6..N on its DP connectors, so I intend
>    6..max_bpc when connector_type is DisplayPort, 8..max_bpc otherwise -
>    the same gate Dmitry used for the DP subconnector property in his
>    msm series [1]. Nothing is attached unless a bridge declared
>    max_bpc, so existing non-HDMI bridge connectors are unchanged.
> 

And once you use DRM_BRIDGE_OP_DP for the check, it shouldn't affect
other users. The max_bpc looks reasonable.

> 3. Where the default lives. 2/3 restores max_requested_bpc from
>    connector->max_bpc after drm_mode_config_reset(), but Cristian's
>    v11 71/74 removes that field [2] (HDMI keeps it in hdmi.funcs). I
>    intend to keep the value in struct drm_bridge_connector and restore
>    it from there in drm_bridge_connector_create_state(), which folds
>    2/3 into the same patch. 1/3 is unaffected.
> 
> The state still has to exist before the property is attached, so the
> non-HDMI path gets the same create-state block drmm_connector_hdmi_init()
> has. If you would rather see that block factored into a helper for both
> callers, say so and I will do that instead.
> 

Perhaps @Cristian and @Maxime have better ideas?

> [1] https://lore.kernel.org/all/20260722-drm-msm-display-interface-v1-24-368c10fe62fd@oss.qualcomm.com/
> [2] https://lore.kernel.org/all/20260901-dw-hdmi-qp-scramb-v11-71-bc12954a0688@collabora.com/
> 
> Thanks,
> Igor

-- 
Best, 
Chaoyi


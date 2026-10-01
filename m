Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D6CCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vV6OTvuJYZtjjpZl15Paifg8cRuEWHs4QPK5ZrgS+1U=; b=Ezd9iZOeQg5Rn3RNFlSp/9VJPQ
	fNlQevoN6DybZPSbdFtvKYVldpv3PjporviNRK4BoJ9lNqF9D68WYJ6bi9Ng1pqAEm1yiGEi0k0SH
	203I8LgROneQgE9K2HjX90UmbdahdwAtuH2VmQMksK+DEUzhtd7PdZFE0rKV7rXhF1xA9dkWwqOFs
	LgNvTh8NMIkk2NcC05EgygkvlRnCS+YlAmm4CekYmxODbkCA50w3eGl2g89jk8BauT8r2U5kOCp6j
	8Qymun2/iIaMTEcYZz9fREjI9rGDjFowSde2Az4pmqFqXEceiSZir3ILd8molz0SqEXELNBkaQzRX
	EWjUbosQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCC6k-000000089ib-2Iq1;
	Thu, 01 Oct 2026 08:25:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCC6h-000000089gg-3sfL;
	Thu, 01 Oct 2026 08:25:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=vV6OTvuJYZtjjpZl15Paifg8cRuEWHs4QPK5ZrgS+1U=; b=pGRU+GAKyxWS0GVLVNgG6evJoS
	aQZChsPxe6xCBCRKlhu7Er7Wtt2F9x+abluC99OkN0X3B03U4gw84NFWZTTaCgNXiJR1MHVdb7t/y
	vyJsWQRv5J9k35173xiA0SCtL8htqpDtjnMbfu2MZM+lFRWyXL49L4qXMxH+0u/p2VY2/vqvthIYm
	EPusVJfBQx/sUM1x9VkLR0NHXSlR8Dq8cL/WimBoMJKknmsu7kTPNGBY4rdSWYkROsZ5T69Dqim9t
	9h8gH5ttT5+WDd334F0q8BPZ9w1ZQiR/haZGpIUzhBCmajdotR0lIn6Lsi5Tbd84mgN5J/T1LteZC
	TaQCg7xw==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCC6e-00000004jHl-2OIi;
	Thu, 01 Oct 2026 08:25:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790843131;
	bh=hWBYh+HFET7KkZE5QMWM2qDP25k0apkoZdP3D+xIBHw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KtjvyFdULBK0Ofvzj3udV+h2ELm/yCmZN9QKHtm79IshBQfmzMYAosiPaqUyKANuQ
	 44VVhhYKi/Fg+peN7DfIjfp6ppfMwoNepFmcH3RzIepnuChHPDgbp7nnkvPUxzwoMP
	 nZw3CEwCkadrx3FMymmRTnV/f0ciI3Pd0fol/8VL26Sj6IjCeSfeA3NG567O2d7TyV
	 0TtXATodj+dPDzQ5Kh3Vl8CEDafGjEQt3OxAAANlBLkfLtLl3sRJ428CqAMgfeWM3J
	 wGoT5ucIe9Q70uBhij7f6Jq4y5LIi4l9qsWH2RwooGvseDD9OmxP7eDYrq0UxuQ5F4
	 hWqXAOIlQ5eww==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3467917E0528;
	Thu, 01 Oct 2026 10:25:31 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 01 Oct 2026 11:25:12 +0300
Subject: [PATCH 2/2] drm/bridge: lontium-lt8713sx: Drop redundant bridge
 funcs assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-bridge-alloc-conv-v1-2-f0a1fe040a86@collabora.com>
References: <20261001-bridge-alloc-conv-v1-0-f0a1fe040a86@collabora.com>
In-Reply-To: <20261001-bridge-alloc-conv-v1-0-f0a1fe040a86@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_092532_780648_ACBC1808 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

The driver already allocates its private data via
devm_drm_bridge_alloc(), which initializes the bridge funcs pointer.
Remove the leftover manual assignment in the probe function.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/lontium-lt8713sx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8713sx.c b/drivers/gpu/drm/bridge/lontium-lt8713sx.c
index 926f9e1e85bf..18696b75bec1 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8713sx.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8713sx.c
@@ -554,7 +554,6 @@ static int lt8713sx_probe(struct i2c_client *client)
 
 	lt8713sx_reset(lt8713sx);
 
-	lt8713sx->bridge.funcs = &lt8713sx_bridge_funcs;
 	lt8713sx->bridge.of_node = dev->of_node;
 	lt8713sx->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 	drm_bridge_add(&lt8713sx->bridge);

-- 
2.55.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794B8CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UHEqE/D+AHPU6rC2qpBn5gKziK0fpTw0cqWSWgdlPb4=; b=Nu8/4IEveSXqqrJgUtiBEHgB8z
	8ZMJsas6eNsoCFD9v+KaAJX+by9XUHFUz1903v/sxoUqqwYbjVNTmW7uZsMyId2Ie69lEmjeo5uNE
	BCnjIl1rcct/7Jk+nG0eRdiN64NrzhOgyD++xT7Sz86FrfEWUWy0+MuyWlmB7q6p7j6rkklN/Vo0S
	m7Bvh6uaj2oz7+2vnfKaG7J2W5GxlbULmpAZPVKOOYw0FiPNeqmG+26uXhYxDypdGmNdT9W9vWdoX
	/6Qeml6a/uJ6uKHcPqfGUxOVVgf3/+3kkJtFKhQ7z1KC5i5VKP/Vppfs5n8g7u+HN+oiNE3ip/NPp
	x5L6NTVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCC6j-000000089hs-46GR;
	Thu, 01 Oct 2026 08:25:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCC6h-000000089gM-02DM;
	Thu, 01 Oct 2026 08:25:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=UHEqE/D+AHPU6rC2qpBn5gKziK0fpTw0cqWSWgdlPb4=; b=edjG3s2OGYcxe7xcWGAf+07XXk
	kooKftZiz2N+i9UFvZD2HEfzzjoblIkGXrMFdwx54bQJ9uJE/aTpja1Mc89bHiX+QkJgr/Ypu544E
	wUGUHDmXo0WgOEC+qj9J2/FOK0OTMawBuW7x9SAxeMCQ4ZP0lQGHc3RsPhTUt4eUL1b1NHGLOhqp7
	czncLqG0Aovsca8JJ/xvcEORFf76+tC0Ju+Op1IAU7AZU8G257R1sAA9xRz38qFlRHrP/VNuzcqaS
	ehYXnQBgNiaXVkFHtend5TY6Mves3UliOMRn0RplnGvpQgjsWnRm0ZzRTLmCzRVEXJHjSK6oOHeYN
	uERFvKVA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCC6d-00000004jHW-2yWX;
	Thu, 01 Oct 2026 08:25:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790843130;
	bh=XmnQzRPAA9UtiMcHbTgbsicWkfFAuGNu46pm6UCxaj4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DxulFU/ifCwsNUBKjfTwKkRyJwqZO69nw694CpR206B0FIgnm5AiCYUH9ZPXQZpkS
	 kjB0oZV0fv53Nl5jktJdRqHSD1zL4EyHrpqWCsN/tDXM5ijEtGYdjJ4YZq0VPNQgtt
	 7lpTuQj+g+25Z+sHdpZ4S48jBe400oST+c5OBUfdCNIMaT3k6bj32a6gW7bXlVJq0U
	 Z4Gxta4HCyzUpOgGlE0rTiXsLtNHKELuo/Tgm5XXXMBDtfbA8TkqXWYmaPUsrJ0124
	 MCTy8MoZf78bwlG+loKxEN9tOfenlfHVBaOPcTvmUy/sBDp9hNJM0UZpfYZyrlMnks
	 Yg3ATsHJqYkhw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 78C0E17E0524;
	Thu, 01 Oct 2026 10:25:30 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 01 Oct 2026 11:25:11 +0300
Subject: [PATCH 1/2] drm/rockchip: rk3066_hdmi: Convert to
 devm_drm_bridge_alloc() API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-bridge-alloc-conv-v1-1-f0a1fe040a86@collabora.com>
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
X-CRM114-CacheID: sfid-20261001_092532_317134_D0F144BC 
X-CRM114-Status: GOOD (  14.06  )
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

Bridge drivers are expected to use devm_drm_bridge_alloc() instead of
devm_kzalloc() for allocating and partially initializing a private
driver struct embedding a struct drm_bridge.

Perform the API conversion and drop the now redundant manual
initialization of the drm_bridge funcs pointer, following the pattern
established by commit 9c399719cfb9 ("drm: convert many bridge drivers
from devm_kzalloc() to devm_drm_bridge_alloc() API").

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index f28d6a883e09..39c65ee07caa 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -703,7 +703,6 @@ rk3066_hdmi_register(struct drm_device *drm, struct rk3066_hdmi *hdmi)
 			 DRM_MODE_ENCODER_TMDS, NULL);
 
 	hdmi->bridge.driver_private = hdmi;
-	hdmi->bridge.funcs = &rk3066_hdmi_bridge_funcs;
 	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT |
 			   DRM_BRIDGE_OP_EDID |
 			   DRM_BRIDGE_OP_HDMI |
@@ -747,9 +746,10 @@ static int rk3066_hdmi_bind(struct device *dev, struct device *master,
 	int irq;
 	int ret;
 
-	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
-	if (!hdmi)
-		return -ENOMEM;
+	hdmi = devm_drm_bridge_alloc(dev, struct rk3066_hdmi, bridge,
+				     &rk3066_hdmi_bridge_funcs);
+	if (IS_ERR(hdmi))
+		return PTR_ERR(hdmi);
 
 	hdmi->dev = dev;
 	hdmi->drm_dev = drm;

-- 
2.55.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A1CCD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 18:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8k30gz9vz3UFGlsNIyXeeJx3RIgE5znUSB+laop1qFY=; b=spemo6v0RPS2zM44esoI1btaKz
	pcLANLi950OXXLOdSDwag3kWlPZWZ00ThL09xzTi0ZM4qC6JwCyq+MIh9B0NzVFLz1dBa/jhhEev0
	+3n/XBzubmsdk+ss1TsGy1TFFPD6YLePre6GcAZfatf7g0ZSVFXPIdDGc6GpwtSTybtZZlRKYqZRL
	/iCNS4OoqzqZ8MX0XFOvB+Lve1anuow6DMTqwnePaQZNaujaZ7rQRSTAEGU01pU8X8DKqaeV+Bfpc
	tHM6wR2UtrJjTgZ+umAs7XaFwSbv1fggAvVbTNEG8nHNSKqUsncfczjMh2IVoWDEARv/EvMnPu8PP
	flqlD6sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM8wq-0000000BMdg-0A8L;
	Sun, 10 May 2026 18:32:16 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM8wn-0000000BMRr-3bmZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 18:32:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1778437925; bh=8k30gz9vz3UFGlsNIyXeeJx3RIgE5znUSB+laop1qFY=;
 b=lXkjUGiBCbCZr8HvfPd/5BUmatC6X6A4sczKjrtzPqkRbq+BhGtELvVRSfYCclmczTSq0Lkmk
 fiCSDblp0VqVxH4ZU/SPjWPRZBBsYh2Dq3Hoqiu8DlowZkAKxK9OjctgWq5cLW/d1E8G7S1C39s
 PZ/CHoJm01ZflQ2amyR/rFbgxfHfL0l8IPS7LSCDYfk1JxxCJFy5/qRPEDg776WEt5TR8KFB3a+
 QVrRFAiSNWppnl82QsTEP1+xwHamuJUaiAqJSo+dPc7y1pEc38cx3OqGyVKNT5I6zHYr8aJTNTW
 2hRmP22ghIKRDrUw9sRxiJRJx4Se9aV7foOcmLK3MSPQ==
X-Forward-Email-ID: 6a00cf0f61db3ab145b0f2ad
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.8.0
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 06/10] drm/rockchip: dw_hdmi: Remove empty encoder helper funcs
Date: Sun, 10 May 2026 18:31:07 +0000
Message-ID: <20260510183114.1248840-7-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260510183114.1248840-1-jonas@kwiboo.se>
References: <20260510183114.1248840-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_113214_048353_EE426BB5 
X-CRM114-Status: UNSURE (   9.55  )
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

Remove the empty disable() and static return true mode_fixup() encoder
helper funcs as they do not provide any useful functionality.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index c7933f3eb64f..6aefdba0f1f9 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -226,18 +226,6 @@ dw_hdmi_rockchip_mode_valid(struct dw_hdmi *dw_hdmi, void *data,
 	return MODE_OK;
 }
 
-static void dw_hdmi_rockchip_encoder_disable(struct drm_encoder *encoder)
-{
-}
-
-static bool
-dw_hdmi_rockchip_encoder_mode_fixup(struct drm_encoder *encoder,
-				    const struct drm_display_mode *mode,
-				    struct drm_display_mode *adj_mode)
-{
-	return true;
-}
-
 static void dw_hdmi_rockchip_encoder_mode_set(struct drm_encoder *encoder,
 					      struct drm_display_mode *mode,
 					      struct drm_display_mode *adj_mode)
@@ -290,10 +278,8 @@ dw_hdmi_rockchip_encoder_atomic_check(struct drm_encoder *encoder,
 }
 
 static const struct drm_encoder_helper_funcs dw_hdmi_rockchip_encoder_helper_funcs = {
-	.mode_fixup = dw_hdmi_rockchip_encoder_mode_fixup,
-	.mode_set   = dw_hdmi_rockchip_encoder_mode_set,
-	.enable     = dw_hdmi_rockchip_encoder_enable,
-	.disable    = dw_hdmi_rockchip_encoder_disable,
+	.mode_set = dw_hdmi_rockchip_encoder_mode_set,
+	.enable = dw_hdmi_rockchip_encoder_enable,
 	.atomic_check = dw_hdmi_rockchip_encoder_atomic_check,
 };
 
-- 
2.54.0



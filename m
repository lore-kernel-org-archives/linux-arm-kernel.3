Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28ECCC54F5E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 17:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/kVs+oVCA3mqRcn9PZgnQuf8ABuTuxEmj/HC9hj+dE=; b=VqpW7/dKqchVq9gDlk876jMGJi
	BjH0jyp/jiYwr2dkS3cKjfEWwHebbTMLdZ3DqTIJ7Di8ocLrqLNXgzQMxQvu4Eh5iJaUmIJ0nh9EH
	gzbLDQq2zLfonwWONgxpDWRbJUoDiAGAQKb9wfDN+gorKsEo4iyXSKTjl9lBzDMRqDN4yc458PJq+
	Qo12sC1bQiHKeglZGhoOv/DBGzLbrqM/FLeweA7NLwmApNadTZCyZXU0C8TwULuUTxH6q4sjOkYzw
	fRlj3sHsXXWXdsY+vy/UV1NimFriYHsrLz9fSf9e2pz8jHKl63bYW0sLzbm+mRHhVd2QPT0PNR17U
	DTdEfLBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolo2-00000005zkZ-1kGg;
	Tue, 28 Jul 2026 17:41:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolnX-00000005z9s-3Vlg;
	Tue, 28 Jul 2026 17:40:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=h/kVs+oVCA3mqRcn9PZgnQuf8ABuTuxEmj/HC9hj+dE=; b=SCDeGymDSmiX1SnKY94YE3Oucr
	RXLb/wm7fvhV5gtEPmqx50fdtyWC8SAcMYa/7x0tsghJXT80hW/PAwo3RCjG5pgygZyesqz1g+6uj
	VMBBq3TARJWC+r9NgyKq0Ep+YYr8PFIWj9Ju1cuO0xgXxuaaJHdASHiHbHBDWKCXKLdVGm/YU7ke5
	2clNUz/3GvLo/fs84WXOYd/2OvxFRFWDBytuhv2Vu1uYBU98agWWaZ35UriG44a+1cM4uAGSKTEOQ
	soG0mCYQqTTU/snchXhpXxlNuHzkWBooLX5SEIVplVYbX7i4u4UUZ69AFqQKNQERxLflOwBEAS6C+
	EvElSaxA==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wolnU-00000005ATc-0FLo;
	Tue, 28 Jul 2026 17:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785260447;
	bh=1HZ6TnZb1RJLoxq7Qwcu8RatOuTC6uAWV6dcjk4cHmY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qyEVdcfGPZSarEK+lG4JW44hLv2J2zvXPBHUlfUbJ7JPjvykTtY5Ed8nX5iSVsIzZ
	 4w2UtzxDz3OyDYpyzpNvqS4WhYymUai1uL0imvWmg6lxikImfOU3FplygK1Zry9xED
	 KZ6AxBy+FHD4y81gwHWDM8k5cAbm/gigQ+I+iuRuzR/0faxnLYCfjmDaLMKq3XebQc
	 Jz0IqhZFX2qGsDLXLsa6lGVpo/rO90C+auW8US5/HnGaeGW7q9wVEeo4jxhN+bqpKJ
	 UEevLOVOASJlpDuMdI+Tv+jfgsD7IEMoTTbXYDsLvnoKPV4qRr9ee722KLHMEdsaTH
	 NN/S3wiIHDGaw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CF98617E07B2;
	Tue, 28 Jul 2026 19:40:46 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1CF2648004E; Tue, 28 Jul 2026 19:40:46 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Jul 2026 19:40:49 +0200
Subject: [PATCH v7 13/18] drm/rockchip: dw_dp: Add runtime PM support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-synopsys-dw-dp-improvements-v7-13-b7640fa8cf48@collabora.com>
References: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
In-Reply-To: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3624;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=1HZ6TnZb1RJLoxq7Qwcu8RatOuTC6uAWV6dcjk4cHmY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpo6Z0nrympKTR7Jkux+/TPtCNPN8ysyQQK2
 Lgv1zrdbvwttYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqaOmdAAoJENju1/PI
 O/qavWAQAKjX9OxV4H1GU4BdKgGsxDvahaYZtNSLNW/07VSFpcZ+Z1m0dKcZp7Ku/X5M7/3Zkx4
 knIoVWRengwv+/WDQuYgOfpQAyY+YUwDPkVg8kFf5NP8TkciixwK67o168HGenBMDJGfkRjY2OS
 rkon0NBte8HhZcwJmTyJucYgWyIiHKukP0yRaN1LY4KhAzATNWa2L1wHd9rkpkwo7L36QM5a3uM
 WfZX6479XOFINVCvwYUVSAvLQLsFHmk0iKhnE2s+OBehv3nEQ7E7+uQzLQWfD/VrHiv/NK79F2+
 SXuNHbpq05g84qxlHDXFjxfebt+sSGP1Rpa1pYbhYhHj1du5WNSJ1wcoQSZSEqRvhk3EQHaRuNv
 ZkhyegHOcLx6OZrWZ7sUoWsfASitlaIamxaoEts7pLuDA6697UtRpS2fRlTzYyFDvTNd653yJAp
 gCylUxnC4niZc1RXH49mAEnNfuI1uFF460yl/styQP9cgJ+OjM/5VJFfbnvGTMy0IJHqiaM1eRB
 llrDK5ape2CzOo9yzf0OG2w9HIXvIsnpbxV4Ylk8weLOMgb7g0cCls/vF047enCynvHJK1jpr9g
 HUl3Z5d4LDQ3Rqbh5hoGE6LFKAw+iaGV7PxmZwZ6l7wekjCT3xrQbxsd/v1IqtilvbWXQdk3wYI
 xRz140kFMEFot9BXotpM0tA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_184056_238893_D595619B 
X-CRM114-Status: GOOD (  16.03  )
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

Add support for runtime PM to the Rockchip RK3576/3588 Synopsys
DesignWare DisplayPort driver.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c | 50 ++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
index b2e817044c94..01915f7b24d5 100644
--- a/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_dp-rockchip.c
@@ -12,6 +12,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/videodev2.h>
 
@@ -54,9 +55,15 @@ static void dw_dp_rockchip_hpd_sw_sel(void *data, bool force_hpd_from_sw)
 {
 	struct rockchip_dw_dp *dp = data;
 	u32 hpd_reg = dp->pdata->hpd_reg[dp->id];
+	int ret;
 
 	dp->hpd_sel = force_hpd_from_sw;
 
+	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dp->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return;
+
 	regmap_write(dp->vo_grf, hpd_reg,
 		     FIELD_PREP_WM16(ROCKCHIP_VO_GRF_DP_SINK_HPD_SEL, dp->hpd_sel));
 }
@@ -65,11 +72,17 @@ static void dw_dp_rockchip_hpd_sw_cfg(void *data, bool hpd)
 {
 	struct rockchip_dw_dp *dp = data;
 	u32 hpd_reg = dp->pdata->hpd_reg[dp->id];
+	int ret;
 
 	dev_dbg(dp->dev, "Force HPD connected=%s\n", str_yes_no(hpd));
 
 	dp->hpd_cfg = hpd;
 
+	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dp->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return;
+
 	regmap_write(dp->vo_grf, hpd_reg,
 		     FIELD_PREP_WM16(ROCKCHIP_VO_GRF_DP_SINK_HPD_CFG, dp->hpd_cfg));
 }
@@ -200,7 +213,7 @@ static int dw_dp_rockchip_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct rockchip_dw_dp *dp;
 	struct resource *res;
-	int id;
+	int id, ret;
 
 	plat_data_const = device_get_match_data(dev);
 	if (!plat_data_const)
@@ -247,6 +260,12 @@ static int dw_dp_rockchip_probe(struct platform_device *pdev)
 	if (IS_ERR(dp->base))
 		return PTR_ERR(dp->base);
 
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_autosuspend_delay(dev, 500);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
 	return component_add(&pdev->dev, &dw_dp_rockchip_component_ops);
 }
 
@@ -255,6 +274,34 @@ static void dw_dp_rockchip_remove(struct platform_device *pdev)
 	component_del(&pdev->dev, &dw_dp_rockchip_component_ops);
 }
 
+static int dw_dp_rockchip_runtime_suspend(struct device *dev)
+{
+	struct rockchip_dw_dp *dp = dev_get_drvdata(dev);
+
+	return dw_dp_runtime_suspend(dp->base);
+}
+
+static int dw_dp_rockchip_runtime_resume(struct device *dev)
+{
+	struct rockchip_dw_dp *dp = dev_get_drvdata(dev);
+	u32 hpd_reg = dp->pdata->hpd_reg[dp->id];
+	int ret;
+
+	ret = dw_dp_runtime_resume(dp->base);
+	if (ret)
+		return ret;
+
+	regmap_write(dp->vo_grf, hpd_reg,
+		     FIELD_PREP_WM16(ROCKCHIP_VO_GRF_DP_SINK_HPD_SEL, dp->hpd_sel) |
+		     FIELD_PREP_WM16(ROCKCHIP_VO_GRF_DP_SINK_HPD_CFG, dp->hpd_cfg));
+
+	return 0;
+}
+
+static const struct dev_pm_ops dw_dp_pm_ops = {
+	RUNTIME_PM_OPS(dw_dp_rockchip_runtime_suspend, dw_dp_rockchip_runtime_resume, NULL)
+};
+
 static const struct rockchip_dw_dp_plat_data rk3588_dp_plat_data = {
 	.num_ctrls = 2,
 	.ctrl_ids = {0xfde50000, 0xfde60000},
@@ -289,5 +336,6 @@ struct platform_driver dw_dp_driver = {
 	.driver = {
 		.name = "dw-dp",
 		.of_match_table = dw_dp_of_match,
+		.pm = pm_ptr(&dw_dp_pm_ops),
 	},
 };

-- 
2.53.0



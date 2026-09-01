Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD92C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GseR/4rIwmv4ssW4cil/yTAT5gQZjTd5OHiT4vt1s7c=; b=H54wQpdOWI2aT6HiRQewfeSZsp
	c2Vonc8Z3hIbA08g9N1zyvaZsKb6ugH1QOLLq+7lMxTL/8/WWXJCx/xQXji2SLJ8sKQlAYniBeQLK
	fHcPudnipu7Up/PQSUje9OoBcxVx/UzTJmZAxR41W6xV7JNRFx7r6Q4PhbBR+dPHpqDkIeH1gjWTI
	wHcryEbFsxAcRFA4/gfYFHihyF9WFWTygLlCB1D8YPsIORHge/wgaDmW5Vg05RiFWxMBsqDQiVy1F
	40wkU+QQeOY/y1dVmaGDBtS/vUfK0FF5e1ozQnkXhOzpHlwF7rzdNpVKWpfoeDpIxg9SxrJkwpSGf
	L0OfJU5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Tc7-0000000D5xt-3w0O;
	Tue, 01 Sep 2026 18:53:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TZz-0000000D1To-1WSd;
	Tue, 01 Sep 2026 18:51:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GseR/4rIwmv4ssW4cil/yTAT5gQZjTd5OHiT4vt1s7c=; b=diJ5RNslwezE58otZowfFmnZJM
	MlUO1Oo7cGRjfy0oVrsNTNYpQluF4ES+ScFLVoCjK4JSQpocIaneSFLvkNf+k4VwpRP+5bBNhunrn
	9AYr6UCVdT8iXFfvY4lyZEzCdaCqDu4Qs6cD8XynI1IRXdVscIx4VkCRF03IMvpRwLFdCBOczv+b1
	WWgsy8U+GBKG9UrQxYnpWM5DEg6pU9OJ5P1/y6ehK2MTVm+S2S0rH6o4DYwVoAZ0nh/Sy5D1M0Ygt
	g0N12Fn03Qpmw4HtJIwaiJD4LLKUsNeha2KCpdvm/hb40g0daPMYvPh4mWpOUuUQMhUK6Qr/UXAvN
	xcCRgP2w==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1TZv-0000000BHeM-0ZJM;
	Tue, 01 Sep 2026 18:51:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788288686;
	bh=9+B0lSYbOtT/mNa8n8pzlwF+N7/unRvesgf3I/R8mRg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mOE/zo47NqcktPeFz6KITCmmEVvDv/qiq04xSJ1SJVWtzw7hAOUd6GhIJEOXOPaPN
	 lQ1/6SZsU127+3kZQIZYYW6tpGsm5pJYRywXFHWl+heVB+OwAra/QRGc7zkBIj1NCI
	 fjxamXAaXgxZ/AgM/NBpYF0x8NFHba13o9q0aMHM8cULUfa9UcRDhxrPPrP/ws6TfQ
	 uatxnHtbLsO48lY3FopDf5cd8R3o7+cQFis0OYzEEucpaC68eXrfZTqUsFY9nbJ7G4
	 SAAcHiEobWwb22CeTi9i7+qnb0SJNf54Mmocjte5VwyGSfqgc2fNkpowdWU+6uCHlU
	 mjYLy8m7wGEGg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E4A6D17E3C8F;
	Tue, 01 Sep 2026 20:51:25 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 01 Sep 2026 21:51:25 +0300
Subject: [PATCH v11 61/74] drm/tests: bridge: Set supported HDMI version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dw-hdmi-qp-scramb-v11-61-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>, Helge Deller <deller@gmx.de>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-fbdev@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_195127_268440_2BB7C7D9 
X-CRM114-Status: UNSURE (   9.80  )
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

Bridges using DRM_BRIDGE_OP_HDMI are now expected to also provide a
supported HDMI version.  This is not yet enforced, but will become
mandatory once the migration to the new HDMI connector initialization API
is completed.

Advertise HDMI 1.4 as the default for the test bridges, since that is
the highest version that does not require additional initialization
data.  This also avoids implying support for HDMI capabilities they do
not currently model.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/tests/drm_bridge_test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_bridge_test.c b/drivers/gpu/drm/tests/drm_bridge_test.c
index 15583ade8494..a445f71c31b8 100644
--- a/drivers/gpu/drm/tests/drm_bridge_test.c
+++ b/drivers/gpu/drm/tests/drm_bridge_test.c
@@ -497,6 +497,7 @@ drm_test_bridge_chain_init(struct kunit *test, unsigned int num_bridges,
 			bridge->type = DRM_MODE_CONNECTOR_HDMIA;
 			bridge->vendor = "LNX";
 			bridge->product = "KUnit";
+			bridge->supported_hdmi_ver = HDMI_VERSION_1_4;
 			bridge->supported_formats = (BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
 						     BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) |
 						     BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422) |
@@ -597,6 +598,7 @@ drm_test_bridge_hdmi_init(struct kunit *test, const struct drm_bridge_funcs *fun
 	bridge->ops |= DRM_BRIDGE_OP_HDMI;
 	bridge->vendor = "LNX";
 	bridge->product = "KUnit";
+	bridge->supported_hdmi_ver = HDMI_VERSION_1_4;
 
 	ret = drm_kunit_bridge_add(test, bridge);
 	if (ret)

-- 
2.55.0



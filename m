Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE03C624D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KisaMHIutm5DN3h2ng9q6TTees/JMa9YN5vJlAhrawA=; b=VqQIz0FylpwIFTu+nNPLgFS5OA
	qr05b2W26ySMiW2mzBi2yVpFXok33qOf9nes/0iCoJ5vql/1F/Wu5zpqzAPBRhwzJGDoTA6B8U8/u
	bMCekn4CjH4l+5uUgFDVgOPRa6St77b2tKiklllKuo1R8eEfkolpShooLK7UYkKPRFcsxl9azTiWh
	/X0kwm5+ASh1li2PhVSIk+SgAvpOh/fIfncV3T1WNnwQY1H1mvvzQq6Juep8joeaxZ8uyC+7MoRk1
	gNq6bzYojpswk3Zj30rktPeH/74yypGnGKx9bi3U/o8ExOhppgi28YmhZ1jA68kmiXKxbdKX9tcRX
	yy0TDm6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Tab-0000000D2gr-1V9t;
	Tue, 01 Sep 2026 18:52:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TZh-0000000D1CA-2PAv;
	Tue, 01 Sep 2026 18:51:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=KisaMHIutm5DN3h2ng9q6TTees/JMa9YN5vJlAhrawA=; b=M6b+4w7RJkZVT3k7WBT1aaa6+c
	F1QgXLBv0+mxsyhx2Hf3/CecA4hGVIKA6t/lZD+X1g2Hc/5Q1wo8QBi1ItCEZc103LoYDIyJSjz8J
	x8OJ8pfWUdINDA9Kxy1HXA5Fv4N6aHCgO8zOVOFVMerwtHatfFdqVRVcM+O13WSCvU3QdMiARFW0W
	Hf2YvGeGdw/sExbAX64zvZkVdwmrKDxDVbqlm3JlFQeSQK+wVFQ05e8OkDfNMGoq5rTTGqYZ2zsVq
	cUzPUf07eFCNEfKkxa/uGlyfhc5N1Mw3KzylrA7aVw70LnvKEBg1GqZwlOijRgxJ/i/yudXbl20H0
	X7ISl77A==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1TZc-0000000BHQE-0Uh5;
	Tue, 01 Sep 2026 18:51:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788288667;
	bh=5t2O0x2IaTGAztgGLk1cEPqBZ6e87+dyfW947n6d1x4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=c+nyW75/z/MxX2p4pYmS5SMdKdM7qh5WDOjpVp27ID5gVClkIOz91NmvxPae6ZAcN
	 fsui6xfDq3rUXDxd5SzlZH4/e2JKy9pfzFz4f5R+GyN69C3RxtRdtPiBp6gZ6IsV8Y
	 8g4Xsz8Ixd1ysu83fPUitehgWXkigKunkngeh9vjEHm/JdhcCf8PSXH8kGEaaFBLIO
	 DkzGQyDhf8MeECuS4rYFSiqxQhFTDEBQCIhCQ29c8MjJw+7AygPVGwJdkWE7Bn7OI8
	 RUMQ+JKMSqsQ++BZLh9jAWQdFhvaOsqYkx4lIA8y3KYv4K9y2PTDobMR6GfpO/kVQu
	 /hF6umpU6GbLg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DE43E17E04D7;
	Tue, 01 Sep 2026 20:51:06 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 01 Sep 2026 21:50:59 +0300
Subject: [PATCH v11 35/74] drm/rockchip: dw_hdmi_qp: Avoid spurious HPD IRQ
 thread wakeups
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dw-hdmi-qp-scramb-v11-35-bc12954a0688@collabora.com>
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
 linux-fbdev@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Diederik de Haas <diederik@cknow-tech.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_195108_364682_238C29C0 
X-CRM114-Status: GOOD (  12.90  )
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

The RK3576 and RK3588 HPD hardirq handlers read shared status registers
and currently wake the threaded handler whenever any bit in those
registers is set.  This can wake the HDMI IRQ thread for unrelated
status bits, and on RK3588 can also wake the thread for the other HDMI
port.

Mask the status value with the SoC-specific HPD interrupt bit before
deciding whether to wake the threaded handler.  On RK3588, select the
HDMI0 or HDMI1 HPD bit according to the instance port id.

No stable backport is needed.  The issue may only cause spurious IRQ
thread wakeups and does not cause functional breakage.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260702151346.5A4EC1F000E9@smtp.kernel.org/
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 456bf2f194d7..dff400233154 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -34,6 +34,7 @@
 
 #define RK3576_IOC_HDMI_HPD_STATUS	0xa440
 #define RK3576_HDMI_LEVEL_INT		BIT(3)
+#define RK3576_HDMI_OHPD_INT		BIT(4)
 
 #define RK3576_VO0_GRF_SOC_CON1		0x0004
 #define RK3576_HDMI_FRL_MOD		BIT(0)
@@ -64,7 +65,9 @@
 #define RK3588_HPD_HDMI1_IO_EN_MASK	BIT(13)
 #define RK3588_GRF_SOC_STATUS1		0x0384
 #define RK3588_HDMI0_LEVEL_INT		BIT(16)
+#define RK3588_HDMI0_OHPD_INT		BIT(17)
 #define RK3588_HDMI1_LEVEL_INT		BIT(24)
+#define RK3588_HDMI1_OHPD_INT		BIT(25)
 #define RK3588_GRF_VO1_CON3		0x000c
 #define RK3588_GRF_VO1_CON6		0x0018
 #define RK3588_COLOR_DEPTH_MASK		GENMASK(7, 4)
@@ -348,7 +351,7 @@ static irqreturn_t dw_hdmi_qp_rk3576_hardirq(int irq, void *dev_id)
 	u32 intr_stat, val;
 
 	regmap_read(hdmi->regmap, RK3576_IOC_HDMI_HPD_STATUS, &intr_stat);
-	if (intr_stat) {
+	if (intr_stat & RK3576_HDMI_OHPD_INT) {
 		val = FIELD_PREP_WM16(RK3576_HDMI_HPD_INT_MSK, 1);
 
 		regmap_write(hdmi->regmap, RK3576_IOC_MISC_CON0, val);
@@ -381,6 +384,8 @@ static irqreturn_t dw_hdmi_qp_rk3588_hardirq(int irq, void *dev_id)
 
 	regmap_read(hdmi->regmap, RK3588_GRF_SOC_STATUS1, &intr_stat);
 
+	intr_stat &= hdmi->port_id ? RK3588_HDMI1_OHPD_INT : RK3588_HDMI0_OHPD_INT;
+
 	if (intr_stat) {
 		if (hdmi->port_id)
 			val = FIELD_PREP_WM16(RK3588_HDMI1_HPD_INT_MSK, 1);

-- 
2.55.0



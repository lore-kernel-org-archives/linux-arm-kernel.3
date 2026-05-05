Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF08CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 22:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LKk2lOdNWfkt1eCYOmfNgd3jqYBhtxIyWUAe9HYdujg=; b=IOfZt2fI6o/jzWgs7/VgW9wTU+
	3hY5/F7qrwy3kPCSu5NQ9NdZUcY3UD42B2ZB1oxzEb26zrGAzRvVgGNY/X4ET6dUH/Htas8etw7L/
	PXFEgObGGYrGS2x8ulZlj1biRNujr4mKvEZ6r6+oxLkJc6oLAGeb2Mp82WkVmt6zySSDfELJ0gAKG
	eJwbc9EdVJmOn17G5fgAEvicRNvB3oZZk2fqz1SeS46rLzQP0aK31EjpwydpHNXi5tFLEGZvSQduy
	+u6hQpy1R0+fATjzmqcst2ejA0drtkm9OuMyYmzsqCWQSqwt/5geA2K5TSjycRJxVDt5yw2ud12ve
	Ys7eN55A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKOIz-000000003jI-30JZ;
	Tue, 05 May 2026 22:31:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKOIw-000000003ig-2dQt;
	Tue, 05 May 2026 22:31:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778020305;
	bh=fg/sLnYHOzh6YaK+QYdUXNpKykuvb8anEC85IqiYw/w=;
	h=From:Date:Subject:To:Cc:From;
	b=Oc82tQ0jzjYAu2BqxNb0BtpXBfkTYm5BGAVvYBd/ZiQUg3HIlLK+DahwZv7GnVeOt
	 4Fh2fRNxnjmb3Wl9T76EljYhjnI8ovTk7JPNoGLrnvyvDfDvEO7MD+Z7kQLOihwOJY
	 nmquX5+ioRwzUJnPbfgRrEKAsBZNyBaAo/7FDmikMcS8Nr2XZ3CvHJZHKVBVktjL3F
	 urBe4J2q84hDCugb/LvHtoCV2q15lY+1BtiJfUZUM3b+oCE88lAlXl8mM+102aVzyO
	 wZwdNFaPODgPKF+K4XjI+2PRv0Ptmd3Kwjz73H75oMJwKwqAD0DxZMmS9Jf+q/S5Fa
	 KFT65EQoPXo9w==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2727B17E05B5;
	Wed,  6 May 2026 00:31:45 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 06 May 2026 01:31:15 +0300
Subject: [PATCH RFC] MAINTAINERS: Track dw-hdmi-qp under Rockchip DRM
 drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260506-maintainers-rk-drm-upd-v1-1-f67537b4bb29@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwMz3dzEzLwSIE4tKtYtytZNKcrVLS1I0U02MTNOM0syMDE3s1QCai4
 oSk3LrAAbHK0U5OasFAsRLC5NykpNLgEZqVRbCwBVT4a0fwAAAA==
X-Change-ID: 20260506-maintainers-rk-drm-upd-c463f6b04769
To: Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>, 
 Andy Yan <andy.yan@rock-chips.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 kernel@collabora.com
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_153150_840852_8A9A8F3C 
X-CRM114-Status: UNSURE (   8.75  )
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

The DW HDMI QP TX library was developed for and is currently only used
by Rockchip platforms.  Add it to the Rockchip DRM drivers section to
ensure all relevant parties are kept in the loop on any changes.

As its file paths fall outside the generic wildcard patterns defined in
the ARM/Rockchip SoC support section, also add the
linux-rockchip@lists.infradead.org mailing list to avoid any
notification gaps.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0dfad67f66c0..cb3c8e5fcb21 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8754,11 +8754,14 @@ M:	Sandy Huang <hjc@rock-chips.com>
 M:	Heiko Stübner <heiko@sntech.de>
 M:	Andy Yan <andy.yan@rock-chips.com>
 L:	dri-devel@lists.freedesktop.org
+L:	linux-rockchip@lists.infradead.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/rockchip/
+F:	drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.*
 F:	drivers/gpu/drm/ci/xfails/rockchip*
 F:	drivers/gpu/drm/rockchip/
+F:	include/drm/bridge/dw_hdmi_qp.h
 
 DRM DRIVERS FOR STI
 M:	Alain Volmat <alain.volmat@foss.st.com>

---
base-commit: 4cd074ae20bbcc293bbbce9163abe99d68ae6ae0
change-id: 20260506-maintainers-rk-drm-upd-c463f6b04769



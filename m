Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6296E9B24E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 10:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GtHqO2+Jq5dFe3Khs8+unOBwWfmB2Mf6huNRl3WyEk0=; b=bQ6TSt9gjyK5r/IHhOIFtISsgC
	cncDsE1NGSkkmHSmUr8sTIwqfNuozHxU21LEWBByZJ6x+8PEU+EFgC4M9Rm0JAwlNvEVCC6d20r6T
	IMFqeExTUa9a3Catd2hgpqclOX5ejK9KAWnhx1zQXmuvTVw+q7J3L8nXsYgzXuKYhg13+BxlorbRS
	k4FRXHMVdX51kMB6T1IenNsnhiDr7pafe1uQvMAMjt4C8oZEx0ZocPwQYyCiYYlzhxbLi0WzDgXLg
	v0vocEyVNAST2T0aAiyng4uBI3z489oIn7JmZFG77kqOsvmnHgG/6NtmSHe10jtmMO+5Wsr5VKb0f
	1L3zme6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuq8o-00000001urM-3i9Q;
	Tue, 24 Feb 2026 10:59:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuq8b-00000001uWQ-2JjF;
	Tue, 24 Feb 2026 10:59:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=GtHqO2+Jq5dFe3Khs8+unOBwWfmB2Mf6huNRl3WyEk0=; b=LsG/g5gIieyAORI1mo8O+qMY8C
	l7lxI+Q9DaZF+lx496ArR/drShrrPkoQa+4/qNnl/XViyRA9ONogTxXxGUMWdNrCE/lCx5P2cSUTX
	8xpueK1ZofxoNixARyy/+qu3NseLzcLtakBRY6yo8G1NIyBb9fVTQpXcXSQMUKwXpSBAfAN31WkSy
	3l1bOeqIu7r/TAQwEHYeGcceX76dfp85Q1rjeGUbozw7h6HwOc/vSMzC3czfULUidKEuD6etgycjI
	k/PdWjv5bUMqYK9DMhANzEyJcIgLCy3yrC1juRMwzuHtHXlqeD7twO5AIC3NzXP6YgsUWKFL8IyYA
	IkHR/sqA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuq8Y-00000006vvy-2L5f;
	Tue, 24 Feb 2026 10:59:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C5E94446C5;
	Tue, 24 Feb 2026 10:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD9DC2BC86;
	Tue, 24 Feb 2026 10:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771930768;
	bh=l8p4wTTQLQPtd/d4pC052EXGqibRJa3coOy/6vNsnLY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iPv0SrZGdf2wk9NXqeDwWTxSWH2nKiSLOJ5nfLENxVj//CkNisvUmacGcFv4Nmssw
	 MVrBZLGoCNoyydargw346T0MIva+yL+RAG0IGmZDwPSFfAc2+39IzDeu61RckToi2K
	 DwqNspbTtbyP9gE+pP4ZVyxqs6iMqMZ2VNoNqVRFiqtvxTGocO02Th4ajjN5fO/Ig/
	 j0bZiaHFe3eyR9d/Dx4Uo/9Paw2wW7DacKK7iGcEkuFIiSfQ7UlAs0pEpJHlk+T0Wz
	 /CG3zHFS71lH66BLZY60bYBr7k/S2sg3ZJkJXlHWaM8s5nieo+v+WxvNg/WojNIFyl
	 oqb/FaMzs98Yg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 24 Feb 2026 11:58:51 +0100
Subject: [PATCH 12/14] drm/rockchip: analogix: Convert to
 drm_output_color_format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-drm-rework-color-formats-v1-12-bebc76604ada@kernel.org>
References: <20260224-drm-rework-color-formats-v1-0-bebc76604ada@kernel.org>
In-Reply-To: <20260224-drm-rework-color-formats-v1-0-bebc76604ada@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1890; i=mripard@kernel.org;
 h=from:subject:message-id; bh=l8p4wTTQLQPtd/d4pC052EXGqibRJa3coOy/6vNsnLY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlzW9LTO4vWTbszYZLt129OK84c75JlNJkyrfPXy23KZ
 gtVFVisOqayMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEjjgz1sc9EJbXvCf6382v
 f2qdzNe6D9HR7YxF5pIWO+d8V4xfeLjQr17uuoPoNLe/wRIvtdjlGOv0zdkXJx6888Pv1ebnHqp
 nX64Sr9ztb961/xqjkOn+Kub1t5wWiqXsCNhnKGyU8Ou1wgoA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_105930_971192_36A8CD1A 
X-CRM114-Status: GOOD (  14.16  )
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

Now that we introduced a new drm_output_color_format enum to represent
what DRM_COLOR_FORMAT_* bits were representing, we can switch to the new
enum.

The main different is that while DRM_COLOR_FORMAT_ was a bitmask,
drm_output_color_format is a proper enum. However, the enum was done is
such a way than DRM_COLOR_FORMAT_X = BIT(DRM_OUTPUT_COLOR_FORMAT_X) so
the transitition is easier.

The only thing we need to consider is if the original code meant to use
that value as a bitmask, in which case we do need to keep the bit shift,
or as a discriminant in which case we don't.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index fdab71d51e2a71d644f128b1bf1c39429b4ad52a..96bd3dd239d251af3d5a7d0fbd4dd74942d44f2d 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -169,16 +169,16 @@ static int rockchip_dp_powerdown(struct analogix_dp_plat_data *plat_data)
 static int rockchip_dp_get_modes(struct analogix_dp_plat_data *plat_data,
 				 struct drm_connector *connector)
 {
 	struct drm_display_info *di = &connector->display_info;
 	/* VOP couldn't output YUV video format for eDP rightly */
-	u32 mask = DRM_COLOR_FORMAT_YCBCR444 | DRM_COLOR_FORMAT_YCBCR422;
+	u32 mask = BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) | BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422);
 
 	if ((di->color_formats & mask)) {
 		DRM_DEBUG_KMS("Swapping display color format from YUV to RGB\n");
 		di->color_formats &= ~mask;
-		di->color_formats |= DRM_COLOR_FORMAT_RGB444;
+		di->color_formats |= BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444);
 		di->bpc = 8;
 	}
 
 	return 0;
 }

-- 
2.52.0



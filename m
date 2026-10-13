Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783C6CC6B0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 22:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bU0ONzdgOuoM15QTJ9m95DYR6yhWgbAnEuZ47n0lcDw=; b=yxmD18txA6xRcvv1se9DhYTOE7
	xyBIHCml+DXOpiMW8aycx88h3Gb3eotbrR+i4zXWWWvmCL7ceEuzKKwK/Apb/+6wC1/VLvN9SP8zT
	WnUtbg9mU1a1Rg0URj+t0jZh0i3PvXLHtT8aMZCHHbC3UNmULreNfCjx2DemZWTI/2LuNJnI+ejk/
	a1+UzVT1lwTUw5wuF9w3GjnIpMi/kMfMngPH2nRDSZTgWpowD/ZimbZczHTeVfMAvw/Odd1JUZAfo
	yZLONXijWtrL0t3TTDlb8W3zI2SJHGs3Tr7aX7mweptt2GWCCcmzNVFar6kENN4soWBiHityW7lh5
	17DC5i3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlMh-0000000EBfd-3u0i;
	Tue, 13 Oct 2026 22:52:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGlLs-0000000EB5G-1rOm;
	Tue, 13 Oct 2026 22:52:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=bU0ONzdgOuoM15QTJ9m95DYR6yhWgbAnEuZ47n0lcDw=; b=aN5IA0V0xmTT80Wt/W4CC/3Dxy
	weajTG9EiT/J0A/cHxVJhAvTyA3v+3h5HaixutqyPKgvrn8L5wSA8vA/C83f5+1/THl5zj+cuUe6w
	URqEZGcL6qs7AtZa0v4NWY0UyEGComvtP4uVgSrFnRcBBwl5jV2njXc1RNIDMrnG8S0xDqxPD/N1U
	NfrVWZOzzi9CMInmwuSPiofIdvLPDatvLaPmddsGxU+U/6Ct7gzwhU3v+G1H78f0Tv4AeZe9XQAxs
	1UxRbyaQg+THfUBcZyg0KcxQ6gpknX/9f1wc6NvjvPu6ceqDsUP3XtFZo6qHy3m9X0bZkXHr6W7Z6
	k0GMuj/Q==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGlLo-0000000GAnX-3Ea8;
	Tue, 13 Oct 2026 22:52:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1791931916;
	bh=o75JY06VhuM7Teqr20IQpqo67gBo5M66FC5oasjs3To=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UKCzFCeEG+x9oAEIigNBGKZ5nNJ4PsSpFUwB/YTONdDt61+5vFJi4dAjfAnZoHoPu
	 r0uqzjwK3pLVCcYuQW2vWxlliSoa/uQ0QGhbiuk2b9HQE+T74umgJ6wNyH+fZCF6nL
	 0egKs56nnc0InYjHEqu9qFndAYE1wDRoURQ1wdimPbY8LsYWizGokcaiQfumO1CX+G
	 WlySI7q4hJn4+JWi6fawvZdxbJJTzkE/MhAlIyisXrIWfs+7gn+/jFOL0e7Tndvi9a
	 Uk7NaJD8RJ4BFBE8JOg3f2GmO+6xHBmFuXZR4c597lGtguyDTkxsEmcQk/grYlLOPO
	 ekqTRRMp/jkNQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 48ECF17E0FB1;
	Wed, 14 Oct 2026 00:51:56 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Wed, 14 Oct 2026 01:51:25 +0300
Subject: [PATCH v5 08/15] drm/rockchip: vop2: Avoid DCLK source switch for
 10-bit YUV422 output
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-dw-hdmi-qp-yuv-v5-8-6fab0fe43a9b@collabora.com>
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com>
In-Reply-To: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Daniel Stone <daniels@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Daniel Stone <daniel@fooishbar.org>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: kernel@collabora.com, Andy Yan <andyshrk@163.com>, 
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Paunovic <royalnet026@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_235205_203146_3EFC44C9 
X-CRM114-Status: GOOD (  14.72  )
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

Currently the color depth is always factored into the DCLK source
decision for HDMI output, which can break certain modes when operating
with depths greater than 8 bpc.

When the required transmission rate exceeds the 600 MHz limit of the
HDMI PHY PLL, e.g. for 4K@60Hz 10-bit RGB output, VOP2 will normally
fall back to using the less accurate system CRU as a DCLK source,
assuming HDMI 2.1 FRL is supported by the pipeline, otherwise the mode
will be rejected.  For YUV420 output format this never happens, as it
uses half of the RGB bandwidth, hence the rate remains within the PHY
PLL limits.

On the other hand, YUV422 always transmits two 12-bit components per
clock cycle, regardless of the color depth, which from a clock-rate
perspective is equivalent to three 8-bit RGB components.  For example,
4K@60Hz 10-bit YUV422 requires the same bandwidth as 4K@60Hz 8-bit RGB,
typically 594 MHz.  However, VOP2 wrongly assumes it needs 742.5 MHz
(594 * 10 / 8) and ends up switching the DCLK source.

As a consequence, the modes requiring uncommon pixel clocks, such as
those corresponding to fractional refresh rates, will fail.  An example
is 3840x2160@59.94Hz, which would likely rely on the 593.407 MHz clock
rate unsupported by the system CRU.

Note this only affects YUV422 with color depths greater than 8 bpc; for
8-bit YUV422 the 8/bpc factor is unity and the bandwidth check is
already correct.

Prevent the incorrect switches of DCLK source to system CRU for YUV422
output format by forcing 8 bpc when checking the bandwidth.

Tested-by: Igor Paunovic <royalnet026@gmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index afa4bc6cbcc4..2fa27028892c 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1954,7 +1954,15 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
 	 * to 4K@60Hz, if available, otherwise keep using the system CRU.
 	 */
 	if (vop2->pll_hdmiphy0 || vop2->pll_hdmiphy1) {
-		unsigned int bpc = vcstate->output_bpc ?: 8;
+		/*
+		 * YUV422 always transmits two 12-bit components per clock
+		 * cycle, regardless of the color depth, which from a rate
+		 * perspective is equivalent to three 8-bit RGB components.
+		 * Force 8 bpc here so the bandwidth check reflects the actual
+		 * TMDS rate and avoids an unnecessary DCLK source switch.
+		 */
+		unsigned int bpc = vcstate->output_mode == ROCKCHIP_OUT_MODE_YUV422 ?
+					8 : (vcstate->output_bpc ?: 8);
 		unsigned long max_dclk = DIV_ROUND_CLOSEST_ULL(VOP2_MAX_DCLK_RATE * 8, bpc);
 
 		if (clock <= max_dclk) {

-- 
2.55.0



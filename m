Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB23D116F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 21:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUL89ob/MZ7ra+D7aghfzym7THuhGc6TJCOHD38hX/8=; b=xHOXstyxzlhLfgkRGRqTraanw+
	lMUyIjSfnvpAPaCa7nTf1c2rV7sJfWlc3mFYwhV8v8U+AiBrNaISKuE8dDnhBbDwJFOZX/tmWfeZp
	Qxm5ispIsW5mduzhLBA5Ssuh/drwReCeSlX/9XrQbF4NJL9jRmuN954uOO+kCtl9+5fINa52/FJwP
	lLLL6mfuZC9qo2FMHfyBMW4Tp0R6UL1Zf9WCeO93GNC9KLFAkSkhcPs1yutSWWjxRh3Npl8Z7sqAU
	ehPl8FQhgSoNmUdQvdi+2AUR393JJ5jnlpgFgOUW1wAt0v4yRvUZ6Cpukb1m4T51hRGFqZlCoiv9j
	s2WCNFnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP5hP-00000000wSo-0GhT;
	Fri, 28 Nov 2025 21:08:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP5hJ-00000000wLo-3SbE;
	Fri, 28 Nov 2025 21:08:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AUL89ob/MZ7ra+D7aghfzym7THuhGc6TJCOHD38hX/8=; b=i+bOjkoizIwP5C1g7KJxx01oEz
	jEGr0kUkw6qeGo5Y42/3IPvqKrX6L2oG0/q6HSdOg0If/TWHJ6xgeESDvcjp2vBDcq1J1vW0R1AGe
	KwNUgXT9+GhIwKXKCzwJzz41ayBtJ1X/0KtkA/zh5RivGrpG6ehT7TcCjLo+aY5L7cp3CMiP6+4Ip
	SMqrQ5NolLRIBpZEcY2btPqZjBdCFPoT5nyFD84z/X9are0D+DvnL1lCANlaaDfG3UM7JB4q3DTS1
	idBHgkC7ytiSB9okJItR9GkVRNUGBYy62FZGPOJ9iIXQJ6cUZZ3b9BODHqIMK1xy+kAbTvWqbBNks
	wJfd2/VA==;
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP4pg-0000000CWuc-3nQM;
	Fri, 28 Nov 2025 20:12:46 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1764364048; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mxA1iGo24AnVpzkbM6BFLHKJF3iTThE8TR5+4oDudIYkq2aRD+MuFBxhCfnIgqnaE7yOq6YIbTCp5qoDILcqOIbHU//xnlKjg09juvQP9APX6q5ycatW3GgUXt9YFutVgcqHPNpMnHccrvAziowtpfMAxFRVSbmovmd6BsdmwUo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764364048; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AUL89ob/MZ7ra+D7aghfzym7THuhGc6TJCOHD38hX/8=; 
	b=XHytapiDwhIUtnRCU2MtjBEzMk+36RFBJmmUXDPAHkzHAkXkJ4LZflj5BOZS1S7jTMkFQB+PYihTQv6IrpRUUee3ljaBAFaxRhv6hUW8wen1SiejREng7qnQ+KZBHBTYpBo5yHBc4CuGvEKMwbdsmVF6R91xZ2MYCewX/j4+Xws=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764364048;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=AUL89ob/MZ7ra+D7aghfzym7THuhGc6TJCOHD38hX/8=;
	b=G3GMaRlOFV+JTmQA4moCKVm1kvg7TNvyrLx5eOtUvfYAuUBkaWMMQRkmSsfprQA3
	4+emIaOiuRG2z70gh8h0i9GkY4LiikuJdildcFfn6PHV1sQn2Q3O1ftaqt6IaBqguNS
	3tEVbdUcEdkioYJTvFcApu1DjvLm0buhWa9TIz4k=
Received: by mx.zohomail.com with SMTPS id 1764364045671467.1689841398395;
	Fri, 28 Nov 2025 13:07:25 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 28 Nov 2025 22:05:48 +0100
Subject: [PATCH v5 12/17] drm/rockchip: vop2: Recognise 10/12-bit YUV422 as
 YUV formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-color-format-v5-12-63e82f1db1e1@collabora.com>
References: <20251128-color-format-v5-0-63e82f1db1e1@collabora.com>
In-Reply-To: <20251128-color-format-v5-0-63e82f1db1e1@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_201245_332901_E7C7AEF7 
X-CRM114-Status: UNSURE (   9.07  )
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

The Rockchip VOP2 video output driver has a "is_yuv_output" function,
which returns true when a given bus format is a YUV format, and false
otherwise.

This switch statement is lacking the bus format used for YUV422 10-bit,
as well as the bus format used for YUV422 12-bit.

Add MEDIA_BUS_FMT_YUYV10_1X20 and MEDIA_BUS_FMT_YUYV12_1X24 to
is_yuv_output's switch cases to resolve this.

Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 0a1adf36a24f..21afcca1218c 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -369,6 +369,8 @@ static bool is_yuv_output(u32 bus_format)
 	switch (bus_format) {
 	case MEDIA_BUS_FMT_YUV8_1X24:
 	case MEDIA_BUS_FMT_YUV10_1X30:
+	case MEDIA_BUS_FMT_YUYV10_1X20:
+	case MEDIA_BUS_FMT_YUYV12_1X24:
 	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
 	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
 	case MEDIA_BUS_FMT_YUYV8_2X8:

-- 
2.52.0



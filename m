Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EC8CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 10:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yb2r1of5loNXUA3s7yCuTMFFTkpPo9aPBQ/B0F892Dg=; b=H4uQOxsWkzCBbSYiASVN1U8L08
	NsQ2+I0qEGyrt2QvqntonTpLoi01u5tRQ0BFS/5cMCDZbdFFLj+96R3WAdGA7Kl0P/hRmgtGVQ3pg
	Zi1UxknzMCF6oeWwD4jr7BZsdi54xBjWWVPrdxzlDw3h7sJsAHkHdvXwh1rLsiEUmfZeRSLxWLcDp
	CT8GlMiWhRkWIohB+krGGCJibWqYsChXyf5ibSWwCnALOKS0GU4xSJcRm5GVueoOdvV6hJULKg0h2
	0YM44SfpeDQjQkwLLcFuhEYHIbsjweFb9vviJLGAWcums8QtfolpqCFhmOr+/eJFqFt/lRQRrtunL
	tVtOxETQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXyhs-0000000AinD-3ZHp;
	Fri, 12 Jun 2026 10:01:44 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXyhq-0000000Aimd-1uuM;
	Fri, 12 Jun 2026 10:01:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781258499;
	bh=QWz/NnIpQ/tgJMgqCseSLhJn4QG66Z8YNoUhv7tJ5QM=;
	h=From:Date:Subject:To:Cc:From;
	b=Nxo8nx+spDC7UmghhkCZl8ZY3C7oc3KJfPG4xTDCYVKEYprVsqaXiObzNC+S+m15m
	 SV8BzD3oyElpJQ6bA8p19cScZPEtlXZ/iG6j4Pi/n16IaYRrtwOoFCUE/c8/+XJDxk
	 JRI9InulItPIEj8E7Plp7mSridItdSOaEXfYpeqWqMhyGOknBifxIXHOjIvtVA6SZ9
	 38ewavdMix/Js4vQkXujL92F/dFEsYW3DQGnMWM1dnTcpKvnTb82zn4+Rr3iCDfXEM
	 XoQ2hyilabflOyiyjI7i/7e6WE1XrySNxufaik7CuN44OK8pQt8Kfulj18E5Ji6z4M
	 Thqsl4atsANxw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AD7EB17E00FE;
	Fri, 12 Jun 2026 12:01:39 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 12 Jun 2026 13:01:29 +0300
Subject: [PATCH v2] MAINTAINERS: Track dw-hdmi-qp under Rockchip DRM
 drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260612-maintainers-rk-drm-upd-v2-1-3ff65fc41a93@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7ZhSoARX3sOwaMsgVaFkCkRDu
 LsFD+DiL17y/38rBGJHAS7JCkyLC84PEeQpAdvp4U7omsgghVSiEAp77YYphjggP7HhHuexQZu
 rrFVG5KWqII5Hpta9j+Nb/eMwmwfZaX/bG50Lk+fPYV7SvfdXsqSYYqvKIitNboysrta/Xtp41
 mfre6i3bfsCbVAimNIAAAA=
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
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_030142_662292_448EEE7A 
X-CRM114-Status: UNSURE (   9.09  )
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

Acked-by: Andy Yan <andy.yan@rock-chips.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v2:
- Collected Acked-by from Andy
- Removed the RFC prefix
- Rebased onto next-20260611
- Link to v1: https://patch.msgid.link/20260506-maintainers-rk-drm-upd-v1-1-f67537b4bb29@collabora.com
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f1caa6e5198b..ac68fdd9879e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8849,11 +8849,14 @@ M:	Sandy Huang <hjc@rock-chips.com>
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
base-commit: ec039126b7fac4e3af35ebccaa7c6f9b6875ba81
change-id: 20260506-maintainers-rk-drm-upd-c463f6b04769



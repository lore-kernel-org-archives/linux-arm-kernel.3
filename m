Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B117EB3657
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 01:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3fC2Nn5X8P5yOSNUsWpqsLgYAZejIiStJ/Lna0+JNLY=; b=g0pCTVTmutuG4M
	6u9ZFbqjbOekZF0xcR3NkWqTpd2KJNNmEeiSKbYZjh3cqxYqLNsjPvAOZX6rWfMS+JKuftzhax2gm
	iJyOYdXIVeeWNiBkuKu8I6fwpw5eZM+M73Nlv6vNFj+4uoWyHOzTYwWo+tIT3zcAKdJvHUovA5YN+
	KFdTnm6uIWV/EBtcjTu6AD3gamVIQXTV0UnU4weSXjmjoC/OISGWZfMvJwq5l2CCTlHmNGLnFXaHr
	yvskpXspHjhtmBn5GBBDNnEt/vV1cPfSnVfuLHeXQqd+6L6mtBThqarlZ5gMtXAG+cCp4qLnAKoOR
	JeZphTcR2yNsXnQ1M5dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxEiU-0000000EM08-0wph;
	Tue, 03 Mar 2026 01:38:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxEiR-0000000ELww-00UY;
	Tue, 03 Mar 2026 01:38:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772501903;
	bh=EZTrxedXe6o3XmZTgm35uvahJZuUTXRHnJiL8Eab/c8=;
	h=From:Subject:Date:To:Cc:From;
	b=aPXBXjm69fSWglULn5pOeOS61J3dU/oMPMSCuK6efFy/ZTfx+v7GmzEK+3R6rfHYH
	 cYbQXF8XRlZTVDOrbpot/EuHGBg/uAsY67eIyPj6EybAQNo7D07hFo9wUJMIM1OpYc
	 rHaLkK2NwCx5J4kSdl3Cks7o3r2ZszRDIs5eWwJVbKLuBRKnnGl8/JoFy2UrBLUkQa
	 0pSQl84t3JirL9wPOgXl1A4xkNyGaObM7+YNjKhMeQcWOPXvbvW3/9naArOe6Pt0lC
	 f+5FrLiqZJuglZKDHCxQqbF2rCOMdXfpZ0USX7C97vwCuv9FqnkChE66BR0mJrQRLw
	 N3S9YGzd+SouQ==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 973D917E0EA0;
	Tue,  3 Mar 2026 02:38:23 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v4 0/4] Add HDMI 2.0 support to DW HDMI QP TX
Date: Tue, 03 Mar 2026 03:38:06 +0200
Message-Id: <20260303-dw-hdmi-qp-scramb-v4-0-317d3b8bd219@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33PSwrCMBCA4auUrI1kkj5deQ9xkUxSG2hNTSQqp
 Xc3LQgixeU/MN8wEwnGWxPIIZuIN9EG664p8l1GsJPXi6FWpyac8QI4E1Q/aKcHS28jDejloCh
 qpWtVVIhtQ9Le6E1rn6t5OqfubLg7/1pPRFim/7QIlNFalK2pcgaybI7o+l4q5+Ue3UAWMfKPU
 jKATYUnRZpKcSxqzXO9pYhvpdlSRFLScyVAJViL8KvM8/wGnHZTAEIBAAA=
X-Change-ID: 20251203-dw-hdmi-qp-scramb-cdbd8b57ccf9
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_173827_221043_C4C75785 
X-CRM114-Status: GOOD (  10.99  )
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

This patch series provides the missing support for high TMDS clock ratio
and scrambling to DW HDMI QP TX library, required for handling HDMI 2.0
display modes on RK3576 & RK3588 SoCs.

In order to allow addressing the SCDC status lost on sink disconnects,
it adds an atomic variant of the drm_bridge_funcs.detect() callback and
a new drm_bridge_detect_ctx() helper, which is further used in
drm_bridge_connector to switch to using the ->detect_ctx() hook.

Furthermore, it optimizes HPD event handling in dw_hdmi_qp Rockchip
platform driver to run the detect cycle on the affected connector only.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v4:
- Fixed conflicts while rebasing onto latest drm-misc-next
- Link to v3: https://lore.kernel.org/r/20260119-dw-hdmi-qp-scramb-v3-0-bd8611730fc1@collabora.com

Changes in v3:
- Used drm_bridge_helper_reset_crtc() helper to reset the display
  pipeline and got rid of some boilerplate code (Maxime)
- Rebased onto latest drm-misc-next
- Link to v2: https://lore.kernel.org/r/20260113-dw-hdmi-qp-scramb-v2-0-ae7b2c58d24d@collabora.com

Changes in v2:
- Collected Tested-by tags from Diederik and Maud
- Rebased onto latest drm-misc-next
- Ensured the recently introduced 'no-hpd' support for dealing with
  unconnected/repurposed/broken HPD pin is limited to HDMI 1.4 rates
- Link to v1: https://lore.kernel.org/r/20251203-dw-hdmi-qp-scramb-v1-0-836fe7401a69@collabora.com

---
Cristian Ciocaltea (4):
      drm/bridge: Add ->detect_ctx hook and drm_bridge_detect_ctx()
      drm/bridge-connector: Switch to using ->detect_ctx hook
      drm/bridge: dw-hdmi-qp: Add high TMDS clock ratio and scrambling support
      drm/rockchip: dw_hdmi_qp: Do not send HPD events for all connectors

 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   | 167 ++++++++++++++++++++++---
 drivers/gpu/drm/display/drm_bridge_connector.c |  73 +++++------
 drivers/gpu/drm/drm_bridge.c                   |  58 +++++++++
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c |  44 +++----
 include/drm/drm_bridge.h                       |  30 +++++
 5 files changed, 296 insertions(+), 76 deletions(-)
---
base-commit: 0dd7a23da214279cfb77b0eb03c38614867524d7
change-id: 20251203-dw-hdmi-qp-scramb-cdbd8b57ccf9



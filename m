Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18292C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 19:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WNxeSCCnet4CkHdiyZTAAA1x8X2Y0UCpmMOTSw5+y8Q=; b=U3olP/q8HyGtMM
	pNWx3iMZREVz3kuGTHwlxDBhag/h5nYQwylG6G7t3+a86x6CQt2Hr587jl83YoBCjc7D9nPRQOHCG
	oSe2xOLORNrbJp2KlvPMjeqCKwcVoiiohhbCszL+MGycp0HoaSuMXYOXyrZJb6YOpTd8yS1oEZoQY
	gMh6fypdMGaUavW2Nl0QUkcy+v2FQZkSDunBmkAeUVxy9K6Sr19OOa2bn4jnCaH8bLSg571IfO9DZ
	GhdMQaxfXoEofORODxQ+hPGzLdRlyTjfWe7l14qCLneYRr0LI3XHisvB5hDja7Xpsk+MuifOujaT7
	EKSaACGz0r0UsfVBbBiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKo0-0000000E4iH-1J0A;
	Thu, 19 Jun 2025 19:20:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKlm-0000000E4Cg-2Hsj
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Jun 2025 19:17:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=WNxeSCCnet4CkHdiyZTAAA1x8X2Y0UCpmMOTSw5+y8Q=; b=Ag5LWPDWwhQYA6NdB2Z7WeuhnH
	XUcY0eToKzJv3ZEwVLZ+JNJRezk0Uy1mKEHNRDbuNDGRLsL27M6LN3T4N1ncWf6KBiWJtWx/YsIQL
	esA4U7ILOSkBEfBDP7b/HDwTiFh27YsuMnduJoLdpzR32wP8CkDQdVCoD70NPilEF7A4yDp6XZJ7F
	9Z/1VfoKyXnGhbYzqsNzrcbkJk3YcthNkpQBLUirYync1HL/LIQZ3slE9m6GajFds2AwlqqIhym0Q
	k7sa+j6iKcPZGZJrI3ftI3BeP8U2KGbgP6S+bXNH5w5uuficOWqwMfY+5go+ZfgGznHlzvxHeKvAx
	sTqgF70Q==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKlg-00000004YZT-2R3T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 19:17:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750360656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WNxeSCCnet4CkHdiyZTAAA1x8X2Y0UCpmMOTSw5+y8Q=;
	b=VqJa+ewG4ANahctR5JOj5H5443f7ok+FvWFZUY8+yQyAcUWz8772G6fUD0x4Trz9opZkQ8
	ZIBRrSw+kkToRc8W+Rd7s6OtBeSzgKz46M7Hz87NJ1QSMyFY+ptlni2aH6DQy++PC57IRj
	yMpcvl7b3c9CNUgyKO5FJZ5sScNgR0U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750360663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WNxeSCCnet4CkHdiyZTAAA1x8X2Y0UCpmMOTSw5+y8Q=;
	b=MhcBy8liSF3FPGaTfhzdjXjxRg/TnhfCg86NaY0yiltev9qSiI92xhM2bN+n7zWeupUoa1
	WWpVi6K6NjO/F1WO+hSIDbQDHDykLtBoRLDKnpWu0C51rJgws+vA8NK+qF3+kLkyJ1yljH
	9/0SKG9U52VmRZPPJcNVYgJ6f/F49Ds=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-400-w8KCcdW6PGyi6iZAp38mQA-1; Thu,
 19 Jun 2025 15:17:32 -0400
X-MC-Unique: w8KCcdW6PGyi6iZAp38mQA-1
X-Mimecast-MFC-AGG-ID: w8KCcdW6PGyi6iZAp38mQA_1750360647
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DBFE31800287;
	Thu, 19 Jun 2025 19:17:25 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.132])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8720C19560A3;
	Thu, 19 Jun 2025 19:17:14 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Subject: [PATCH v2 00/16] Use drm_panel_get/put() in of_drm_find_panel()
 and its callers
Date: Thu, 19 Jun 2025 14:15:52 -0500
Message-Id: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOhhVGgC/3WNzQqDMBCEX0X23JQk/lR68j2KSJps6kJNZCPSI
 r57U+m1MAx8c/hmg4RMmOBabMC4UqIYMuhTAXY04YGCXGbQUteyUaW4VyL6wfE0eApumE3AZ25
 elDCuvtjKt62RFrJgZvT0OuS3PvNIaYn8Pr5W9V1/WvnfuSohhW1KjSqnVK5jdKNZzjZO0O/7/
 gFd/HAlwgAAAA==
X-Change-ID: 20250613-b4-of_drm_find_panel_part1-ad57c4f88a0c
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750360565; l=2637;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=ZRNWhl8tPiNTSHULKlMX4iESdr8yY7z89H/qS9FJwy0=;
 b=Me2aDfseSSjZKBVpcXSnUNCCs9+uXI061gfe7inuN4RHWSfozagYa7azYKoJZFsAPN+vtWMQi
 myeZo0xBVRuAOyI4/S7anI0CzZlg6ddvE/fGlnFUC6pTGERGIA6vnNJ
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_201750_782173_2B30F869 
X-CRM114-Status: GOOD (  13.02  )
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

of_drm_find_panel() returns a pointer to a panel which the caller
holds to either do panel setup with the prepare(), enable() like
panel helpers or for APIs like devm_drm_panel_bridge_add(),
devm_drm_panel_bridge_add_typed() which expect a panel.
Either way, once the driver no longer needs the panel,
put it down with a drm_panel_put()

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
Changes in v2:
- Get the missing reference in of_drm_find_panel()
- Add changes to all drivers that call of_drm_find_panel() 
- Link to v1: https://lore.kernel.org/r/20250604-of_drm_find_panel_part1-v1-0-c632e12e131d@redhat.com

---
Anusha Srivatsa (16):
      drm/panel: get/put panel reference in drm_panel_add/remove()
      drm/panel: get the panel returned by of_drm_find_panel()
      drm/panel/samsung-dsicm: Keep up with refcounting
      drm/panel/sun4i: Keep up with refcounting
      drm/panel/exynos: Keep up with refcounting
      drm/panel/rcar_du_encoder: Keep up with refcounting
      drm/panel/rz-du: Keep up with refcounting
      drm/bridge/lvds-codec: Keep up with refcounting
      drm/bridge/fsl-ldb: Keep up with refcounting.
      drm/panel/omapdrm: Keep up with refcounting
      drm/panel/sti: Keep up with refcounting
      drm/drm_of: Keep up with refcounting
      drm/fsl-dcu: Keep up with refcounting
      drm/mcde: Keep up with refcounting
      drm/bridge/analogix: Keep up with refcounting
      drm/tegra: Keep up with refcounting

 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 1 +
 drivers/gpu/drm/bridge/fsl-ldb.c                   | 3 +++
 drivers/gpu/drm/bridge/lvds-codec.c                | 1 +
 drivers/gpu/drm/bridge/samsung-dsim.c              | 1 +
 drivers/gpu/drm/drm_of.c                           | 2 ++
 drivers/gpu/drm/drm_panel.c                        | 6 ++++++
 drivers/gpu/drm/exynos/exynos_drm_dpi.c            | 1 +
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          | 1 +
 drivers/gpu/drm/mcde/mcde_dsi.c                    | 5 ++++-
 drivers/gpu/drm/omapdrm/dss/output.c               | 6 ++++--
 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c  | 2 ++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c   | 1 +
 drivers/gpu/drm/sti/sti_dvo.c                      | 2 ++
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c             | 2 ++
 drivers/gpu/drm/tegra/dsi.c                        | 1 +
 15 files changed, 32 insertions(+), 3 deletions(-)
---
base-commit: 60ba94338047bb5410a3626ced3380afe9285ed8
change-id: 20250613-b4-of_drm_find_panel_part1-ad57c4f88a0c

Best regards,
-- 
Anusha Srivatsa <asrivats@redhat.com>



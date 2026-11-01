Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1D7606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 20:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mPcqjx1N;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xtz16tDV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=F89725KkjE+kUI5LXBxmdgLNt89Tfm7tC84mMjTHCkI=; b=mPcqjx1NSN79oFUrcpRF1fnoPd
	Z0R30bHUJT9WDT6yKkbwVtFqILe48iQLWxxpxU9cP08HDGOvRk5HBK8HRCTZmC1BrR6yX+hS8RX3z
	3ZyL7H8IUtchsnNcN3j7axTUM+8+4w/FmBPx+7/QU6d6BdngK4H0yG0++/CSJurCOSR75EutZTWSe
	s8EN8bIXh23MP4WOel9HUpjytlEhLpibmGRLyu5WGzmPlFxUCUnURZZhr3KhBGNQKMGfxaE0Ug0CQ
	xvaqTG6EN+23W5pAr5mvh5Qqu2xPH37x4fONpaFl7el0FgQWkj51sDh0C+L3cZjIBVD4hGUbjGDKM
	X/DbTUuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNcG2-0000000EssH-3wSe;
	Sun, 01 Nov 2026 20:34:26 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNcFl-0000000Esph-3heF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 20:34:25 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so24482675e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 12:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793565248; x=1794170048; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F89725KkjE+kUI5LXBxmdgLNt89Tfm7tC84mMjTHCkI=;
        b=xtz16tDVKmjeeOiwpFVX/cL7O4LC3Ls4ZWhlqQw81ZQi5EFyTImzKSVSPzZfRGrS//
         bTVOJ9eU5NECTEYhiRi/VxQrsz0ubFPmwWP0w3J3+Rk4wuXRHPKo2pL/kBv2t44T/NbV
         pbWX5HXwpC67BKVjOoYyhOUau7Gw1Del+RZA/dLRIXh4ibakTCe/UO5yW238KYrkE7uA
         YvfTwTzNNTiRkB6X95BO/T2VHF2aeUCvKCyo4wnQmiTdUArZbD001VYpWA9Pv3Ax6ZwD
         7HVBGaPIW1VNhCf2BFv/UPbDaX0027zsEaIenwmoYd7sbWnYtbdpA3k5Hr5M29Z0oHuy
         zcqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793565248; x=1794170048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F89725KkjE+kUI5LXBxmdgLNt89Tfm7tC84mMjTHCkI=;
        b=EXohly0IJaEu+qWefReod72/hfKiyKHVTbR8FT8KqySzp29lYnzt5hnnpsBXcF132q
         X+7b6ZYOTddkoncBsF86UqgMyN/hdNtUvZeHo4JLH4cJPcJ1hLmJ1MxFrXGfxRkW7NAf
         arh3wew495vFSJAOW6qVBGR5ZLaeDA9dPst3pf4Z2S+0nIiH0CWIXvYY19QAEPBABSfs
         A1//A5FMp2fvNmxbqS/7ME7tGdLBXNlnJb3p3jUUDElnDCJzQoekwEcFLwFbR/IRoovW
         Hoe1JrLawZM1fQ62GhLGLH5TvsPppzSZ1wUPsrsV3nSh9mZf8fKk0HZWQzFMmlARrEyf
         YXvQ==
X-Forwarded-Encrypted: i=1; AKwUvBz14U89CGfZihdRmLo/hoG1QNM4CoGW/1tjvJsQJ/egP+BaWrRhc+i8UQIQuAHmRd3dKqXM1BqNXpDAAt/I1snQ@lists.infradead.org
X-Gm-Message-State: AFq9FYJt3PaDuvpvW9wjoNeXheaiE/v1S52IjGj7Kvay8Tfglsj2mUOx
	IIYfxz6Llv85iOdbSQwDTXdjBN0Xs3jGflcwfuzKXv9TBRv9LwR7EN1uhe4XK2k0gyo=
X-Gm-Gg: AYBFou1vpyY0y56wFhhoNvyuWovkCuwOLUS0gJQNGqrXLNgqALlgyvedrRQqz9OcXpk
	LSCGudg9Uv1tGWYlpYUnnFIQUjcpGpbsqWKUXW9Y6Udy70OY29OxwXf+om/Rr1bslp0TCTMkNIv
	NCFgDYbFonlzKtTevrwcrsjMC4vMasLgo1Iw6xWZMM4FGjRMOQhHZnMIynj+JkSieL70dQzJdy+
	MjGXcE0nk0zEJZtS6/moaXeULRMJkktFNvknjcxI+mF1/zUFgaQrNMJDkqoLtkkOMAhEeK9paxf
	BxMcZ8K+HESQRpIEccyc41GoxjhzuBAOUFoPtnJotwuPSSG67/3P/w1nqxlazP8T1jPszBOgrW3
	O9g+Pl+R5BjuAph+nbOmPzRKwQVhhrlVUq99le39ggJPfs5UuPojRZ+t4HKzus8UGg+k30jPV13
	WVn5ZdKhmXLV2/dzN9fPL+4kN+76cAajVbg9TBe1QwIlCOjCR8lpo/qWX2GUMZYnHjIiFgWYdJU
	K8OwI/yK6R+eEloEjdAgeeZ0MsN7xrGmXf5xogkn1BHjpRjQxKpv7IwrTzP7dsaYKUeVQtdFI7y
	c6aHvedPJmEMFD85KzDSCWG6hn4NUii4SNCjf2/WxLD2DWyIhdcedIadgF++0Wm1aeCoclmWgGf
	KuHvg8rltwoasXZSRMlOfJwZAcczkNqIGOY5YsVY6dBYuog==
X-Received: by 2002:a05:600c:1d07:b0:4a2:18d4:f9e0 with SMTP id 5b1f17b1804b1-4ac18c735b3mr192334605e9.25.1793565247854;
        Sun, 01 Nov 2026 12:34:07 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:849f:a468:4121:a85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm263946675e9.12.2026.11.01.12.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:34:07 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH] drm/sun4i: dsi: set the connector orientation from the panel node
Date: Sun,  1 Nov 2026 21:34:06 +0100
Message-ID: <20261101203406.1360656-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_123409_976406_B420AB9D 
X-CRM114-Status: GOOD (  21.46  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

sun6i_dsi_attach() only accepts the panel once the DRM device is
registered, and returns -EPROBE_DEFER until then. By that time the
connector can no longer get a "panel orientation" property: it has to be
attached before registration. The fbdev emulation is also set up from the
hotplug event of the attach, so it gets no rotation hint either.

As a result the rotation property of a DSI panel on these SoCs is ignored:
on the PocketGo S30 (A33, 320x480 panel mounted for landscape use,
rotation = <270>) the console and the boot splash stay in portrait.

The panel is a child node of the DSI host, so read its orientation from
the device tree when binding, before the device is registered, and set it
on the connector then.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
Notes:
- Testing: built with W=1 for arm (multi_v7_defconfig, DRM_SUN6I_DSI=y
  and =m) and arm64 (defconfig, =m), no warnings. Tested on a PocketGo
  S30 (A33, ILI9488 DSI panel, rotation = <270>): on 6.18.54 with the same
  change (6.18 still calls the helper of_drm_get_panel_orientation()) the
  console and plymouth come up in landscape, where they were in portrait;
  on 7.3.1 with this patch the DSI connector reports "panel orientation"
  = "Left Side Up".
  Not tested on other boards; boards without a rotation property keep the
  current behaviour (no property is attached).
- Tool disclosure: this patch was prepared with Claude Opus 5.5
  (Anthropic) as a coding assistant, in an interactive session where I
  asked it to fix the console orientation on the PocketGo S30. It traced
  why the connector never got the orientation, wrote the change and the
  message. I reviewed and understand it, and tested it as described.

 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index d504ae5832..1eb8a4cde0 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -22,6 +22,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_mipi_dsi.h>
+#include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -1055,6 +1056,31 @@ static const struct regmap_config sun6i_dsi_regmap_config = {
 	.name		= "mipi-dsi",
 };
 
+/*
+ * The panel only attaches once the DRM device is registered, too late to
+ * give the connector its orientation (the property cannot be added after
+ * registration), so fbcon and the boot splash would not rotate. Read the
+ * orientation from the panel node, a child of the DSI node, at bind time.
+ */
+static void sun6i_dsi_set_panel_orientation(struct sun6i_dsi *dsi)
+{
+	enum drm_panel_orientation orientation;
+	struct device_node *np;
+
+	for_each_available_child_of_node(dsi->dev->of_node, np) {
+		if (of_node_name_eq(np, "port") || of_node_name_eq(np, "ports"))
+			continue;
+
+		if (!drm_of_get_panel_orientation(np, &orientation) &&
+		    orientation != DRM_MODE_PANEL_ORIENTATION_UNKNOWN) {
+			drm_connector_set_panel_orientation(&dsi->connector,
+							    orientation);
+			of_node_put(np);
+			return;
+		}
+	}
+}
+
 static int sun6i_dsi_bind(struct device *dev, struct device *master,
 			 void *data)
 {
@@ -1085,6 +1111,8 @@ static int sun6i_dsi_bind(struct device *dev, struct device *master,
 
 	drm_connector_attach_encoder(&dsi->connector, &dsi->encoder);
 
+	sun6i_dsi_set_panel_orientation(dsi);
+
 	dsi->drm = drm;
 
 	return 0;

base-commit: a1e63ab695ad76850ab9787b9eb6aab695dc2965
-- 
2.43.0



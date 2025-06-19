Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D014C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 19:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZxgkDT6dse2bUp83U9mVS2fL/N7ehegYmETLcYa52M=; b=N3LlUYnjB0nVABXm4Q3xEHGPQ0
	GuRZFPf94L2w/XHaedXB0IoVdRkPD1jPfU/FdfiBh8mIis+Xr6eYa3Ze82Rv5EgzbDdJXTf3MqK8+
	IHF/MXiEiJDPSdFarPuTsI/DEToBJ8UV7PKUKpdv6QX2BfgBfSBBoWPeajZNegDISjW9edvaLYFEK
	DpwXHQeSaFz5qV+kgvS1KDswC9TkUngn48wyazbOEcYsdUU1k7I5v0McEyYg05GcXVD+rByaIuGyK
	IhzBtWEnleEvoOmMMQ3KZEHXS+C743cPPduT84MvppxKAGLaDv4NehPtVi3uk1ftJteaEku0UatM+
	3/4YJsDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSL1B-0000000E6mv-3DWq;
	Thu, 19 Jun 2025 19:33:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKmc-0000000E4MF-0ZFJ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Jun 2025 19:18:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=4ZxgkDT6dse2bUp83U9mVS2fL/N7ehegYmETLcYa52M=; b=NHRaa25K1Eld63xwHH//x7uCoz
	6x14k44nLv0t/uLDqA61QWU6R8G/0dF/7OpnhwRvkG7NJlY+jMgFqUJ5T5jEY7k2AJxV2wluae3PQ
	77wdbTysB8FqE47z4iTbQUJvmaozg6YY6yX+E7qZc39oH65YsVe+Wp39fmbDcSAMMNqWNUg41KR/K
	HRF1Xb11zcx66QJcBAvia4gdTDKrY4YsPS3HlYKXmZRGh7YY6tKipqWVWsRtlQQyjmsa1lD8LFJoQ
	gsjCIU4+T5YojKNH7ucPxIhBjBIAETycluRwzQTQCfkPn+6ePmLAg8pVZH0yl/B7a/RnP3sL+vdQQ
	nc8FUMmA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKmV-00000004YdO-0hEG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 19:18:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750360717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ZxgkDT6dse2bUp83U9mVS2fL/N7ehegYmETLcYa52M=;
	b=TEqIrBtXNuXYyO3zMmtQhg39UhCnuA90aoQ4xpMHJ0hePtZ1SX/ejLTW02jyQmIGbS/orX
	MaVjMLmlmyDKh+K4foNyuus+mTOGR+cgNtdoqCaLZaE7zlVkGxTKniJ6eripsP7ddTQMr9
	Mqt8suroWN3OusSATzNDg2zCCBoMMyI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750360717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ZxgkDT6dse2bUp83U9mVS2fL/N7ehegYmETLcYa52M=;
	b=TEqIrBtXNuXYyO3zMmtQhg39UhCnuA90aoQ4xpMHJ0hePtZ1SX/ejLTW02jyQmIGbS/orX
	MaVjMLmlmyDKh+K4foNyuus+mTOGR+cgNtdoqCaLZaE7zlVkGxTKniJ6eripsP7ddTQMr9
	Mqt8suroWN3OusSATzNDg2zCCBoMMyI=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-408-iX7tiqNuMJmfgTkwsiQeeA-1; Thu,
 19 Jun 2025 15:18:33 -0400
X-MC-Unique: iX7tiqNuMJmfgTkwsiQeeA-1
X-Mimecast-MFC-AGG-ID: iX7tiqNuMJmfgTkwsiQeeA_1750360709
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 55A4C19560B2;
	Thu, 19 Jun 2025 19:18:28 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.132])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 52EE919560A3;
	Thu, 19 Jun 2025 19:18:18 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 19 Jun 2025 14:15:58 -0500
Subject: [PATCH v2 06/16] drm/panel/rcar_du_encoder: Keep up with
 refcounting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-b4-of_drm_find_panel_part1-v2-6-0df94aecc43d@redhat.com>
References: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com>
In-Reply-To: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com>
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
 linux-tegra@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750360565; l=933;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=YALXQz2Q0/yuQrIopDCTKEAJ3XHgqfCy/EgPk2fI0Z0=;
 b=BraNF0Mjh/d+MGIDhAqtL5nSx8iVHPYNXuzRZZRkJUxtZ9kRf8aNKrYASePFe/ecsbtpK2Kpy
 /N370guTuKZD3iFcNtcO8HeVx5qbolV/tn/nnY4YxGpZCWkqUehh2Fp
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_201839_506905_D442BA39 
X-CRM114-Status: GOOD (  11.48  )
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

The panel returned by of_drm_find_panel() is used to be
passed to devm_drm_panel_bridge_add_typed(). Put the
reference back accordingly.

This patch added in v2.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
index 7ecec7b04a8d0b0794bdd784fd0d7c7c5ba0a71c..b16cafc66e60d7f6c5167beb9e9d0606b17b0281 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
@@ -69,6 +69,8 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
 
 		bridge = devm_drm_panel_bridge_add_typed(rcdu->dev, panel,
 							 DRM_MODE_CONNECTOR_DPI);
+		drm_panel_put(panel);
+
 		if (IS_ERR(bridge))
 			return PTR_ERR(bridge);
 	} else {

-- 
2.48.1



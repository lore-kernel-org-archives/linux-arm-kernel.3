Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF36EC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 12:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQqFrcyVByninqC2k5tKSdWi1Wj8ZnUSQzwicAMA28E=; b=pCKU5LD6wyFJIpIkmvW7ItuXZw
	Sdbs+wYSG9YkEjVGjU3+ADDUZiXlYRAfVyaaPKIYQ6klzQEfglPceFcD9p4fntZq9qetcixYFg8lp
	uZVHlez0tjRLxHcCoQBfLgIFslScDmLrdW/RlMQTevrM4GXQ3sYMxJkk9A7zNXlbKSEldR2M/DtQ5
	3Hw4MZO3LpgjEfSA5TqYh5TzQeHesYHHjzbSNJ7P3S9x/lPlmcB/3SXjgAfgaAJipklm6ZiU4ITpr
	LwqvA3hP9RbyZZR61qNsZxzDnmNOyTQmH3fLcD0WMMdmMVRoQNpxNs9qhOJX4JiA0sAfR4is08EOl
	G+EESjOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Bb7-0000000BKoQ-1hXk;
	Thu, 17 Sep 2026 12:52:17 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Bb5-0000000BKml-02gf;
	Thu, 17 Sep 2026 12:52:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1789649490; bh=HQqFrcyVByninqC2k5tKSdW
	i1Wj8ZnUSQzwicAMA28E=; b=bjCNbwJ68P1t+wrpBz7rE/ynQxy3zCKHWQAcRVdEJVuD9nL7Il
	M3YcnBKm9xGZM78gwEzaI4oMEHZ8hICYqhMRRHnLmleX2/HRBgF4t5aZpDfCAxpvLH53cdIIwk8
	/6+3hX4c87cbdXL8eZOCPvN1Ma5hTt3XMgYiMdlP2PozmMGrbM1FFdBSLa1p3R2I7UCe7exGbpS
	Qug0gjem9pCgJ8nqKkszESWcnkA10Sfj/jFaJL/R6g5asJMNlRMF9hIQ97s8RX8GCf2Mn6bdGn1
	fYW4Smdi3vAOinMtejBNuUNKDwMVBM6ah21W7YpnNY1t+0hNOCfn33/O+388rac5yHw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1789649490; bh=HQqFrcyVByninqC2k5tKSdW
	i1Wj8ZnUSQzwicAMA28E=; b=S1sj6HzkqNHx6mL7S9CTJ4ti0fFKxEZ6vA/8LEB/QK+9jhr5W5
	LfxLVGf2FF3zt3FD79I6pMT3YPDBF4zeGOBw==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Thu, 17 Sep 2026 15:51:22 +0300
Subject: [PATCH v4 3/3] MAINTAINERS: Add myself and Ryan Brue as
 maintainers of NT51021 panel driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-qcom-novatek-nt51021-panels-v4-3-30afbc35d70c@mainlining.org>
References: <20260917-qcom-novatek-nt51021-panels-v4-0-30afbc35d70c@mainlining.org>
In-Reply-To: <20260917-qcom-novatek-nt51021-panels-v4-0-30afbc35d70c@mainlining.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Nickolay Goppen <setotau@mainlining.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>, 
 Alexey Minnekhanov <alexeymin@minlexx.ru>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789649485; l=813;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=mrTB1LmsmAc8ZgfJPlblJeFyOy7amRAcdDErDv0bjPo=;
 b=XJG5fwDNqb3oqRKq80kWerbR148kMKw/HbkR21vvC8jsWTY/JWaFlUZ5FygjPSCUqnEb4O/Du
 koy2gKp20YhDifBBC16lxETOzC2qSEGDdQ3V2yVAoHOOuOvI0YdYhee
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_055215_202272_35185FE8 
X-CRM114-Status: UNSURE (   7.02  )
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

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7291238bc09f..743c785b4558 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8354,6 +8354,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
 F:	drivers/gpu/drm/panel/panel-novatek-nt37801.c
 
+DRM DRIVER FOR NOVATEK NT51021 PANELS
+M:	Ryan Brue <ryanbrue.dev@gmail.com>
+M:	Nickolay Goppen <setotau@mainlining.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
+F:	drivers/gpu/drm/panel/panel-novatek-nt51021.c
+
 DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS
 M:	Lyude Paul <lyude@redhat.com>
 M:	Danilo Krummrich <dakr@kernel.org>

-- 
2.55.0


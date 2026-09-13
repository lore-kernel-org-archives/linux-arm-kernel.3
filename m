Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49750C88E67
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 14:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQqFrcyVByninqC2k5tKSdWi1Wj8ZnUSQzwicAMA28E=; b=izodXk4oiLLHWAQYv9lzmpNYTG
	gRu/aUoA5olYYHYxm+sBmKoMetfbxDSoQeGRSd+ypyKe8lPas/Joh7LplORuOqyhLyDHyDsfA8q7U
	tcv0iIDa2Q4cd/9vA0+qxJD7IB6sMFIT6M/8I5rVxGc+Dqsa6lP0956UA4ICxXlDFKof7cEePxfYz
	ZEpTPRu2TzeCAKDGs7lFeCgwQ1Caa780aapEfIWBEW2jetjIRYTJ76b9sg+vzo5sNgZJyRqjxHqbl
	PFMQIDy4IKOCPU+KO/0zw6nfi/YOr0CgfwcZC3049sbN7E48hce2qqZPQ1wO3XrIzRqnCZ1BwjKt4
	k3aVKAFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lXY-00000001j34-33hS;
	Sun, 13 Sep 2026 14:50:44 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lXS-00000001j0n-1VVp;
	Sun, 13 Sep 2026 14:50:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1789311027; bh=HQqFrcyVByninqC2k5tKSdW
	i1Wj8ZnUSQzwicAMA28E=; b=O+FZEiYo6o84bsowlf50bBFTdLkYhUmmkZM9a4P5FrI730n75l
	PU4MW4R60djUwbYNuYnxLrrSbt7KG/LuW7hPg/GCmVukoSzIETTGjzAwVaZff2ny78Q+sSjOSaB
	4RYzApURYPvUjGb+xImShUC9TgWHSKlL4m4hrsNJCWE7SUqI1D/Wg24n9SXjABHPcjvI1zzTgse
	Oac6q5g4A9J4fFhXgN8L8EqPe5Ibaqy/GF7rIhmHAUfwyUloobUXJVmRWfj59adca2E/dzOXO8O
	IM1EG386pjr5ZqYmipFe6jOqPqDtfM+0OoDwA+ULV2eTn0esWIM57pn1Y0igP3sp7IA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1789311027; bh=HQqFrcyVByninqC2k5tKSdW
	i1Wj8ZnUSQzwicAMA28E=; b=dv5BBfjyZMVLn7mb4NhHdwLDVyx7U4w4jFXGmKjn7C9+W7saWE
	Q0et3zYYnHRxgLAnTowD74gwJLPt1FCvE7AA==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Sun, 13 Sep 2026 17:50:18 +0300
Subject: [PATCH v3 3/3] MAINTAINERS: Add myself and Ryan Brue as
 maintainers of NT51021 panel driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260913-qcom-novatek-nt51021-panels-v3-3-266bc5d7e8c9@mainlining.org>
References: <20260913-qcom-novatek-nt51021-panels-v3-0-266bc5d7e8c9@mainlining.org>
In-Reply-To: <20260913-qcom-novatek-nt51021-panels-v3-0-266bc5d7e8c9@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789311023; l=813;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=mrTB1LmsmAc8ZgfJPlblJeFyOy7amRAcdDErDv0bjPo=;
 b=Thm3nLKxaN3Lkv/4kaVZwyhRIE6D1dEUxQA2bq0Rpw07QEri6giJJgPVzwPfLD7wp/SbBcH8a
 Ubte3KahszUAoizgCzIZky0Kx2WZLRQZM8jzZNtZeRZJuAlURsl4WxJ
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_075038_552488_3ECB8298 
X-CRM114-Status: UNSURE (   7.00  )
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


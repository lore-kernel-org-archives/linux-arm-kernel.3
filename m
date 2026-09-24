Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832F4C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 15:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukLUOMhti9Eo0MeSXTNN0WtzSkR87ftxGnpm0vvhebA=; b=Xy3U/I/kBCQ7UlXqowWPcqFFd2
	c+4KeUnrbdAYuYZfNC25nl1DqTnWgV1CwdDOu3zNPEdaQSozOkBP/IunzWAzGIm7gNxWw8wUuw6MM
	3RLuSBn9BRG3ulEYYMHax4S2G2pXJOVnFSFGDf8EzIa64zb/CtAqCZJPaDTdmlcqPXCoBDTvSS2Ux
	LV/wvkZWz072O8ZCSyptRk7bnWhgi6VNhKIREkQ9B39oqxZdXjDqIgX/CcLu8wDmxbn1y1LACh5R3
	fZgmgdtsy06CSxo65m2Nlir4ADEIjwbx/HG1A+ee+KMojlrNHIZc7D0DBA1+GFSSXOjzdgNgUW11r
	7O7615zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9l3r-0000000BL1P-3kbG;
	Thu, 24 Sep 2026 15:08:35 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9l3p-0000000BL0j-2Z1E;
	Thu, 24 Sep 2026 15:08:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1790262508; bh=ukLUOMhti9Eo0MeSXTNN0Wt
	zSkR87ftxGnpm0vvhebA=; b=OBP1ZeXCB8FPYPg2BRoJ2gxKOGfjgm+8Mpuch4ndYsNVn95dVG
	5c7T5nC2/HURJvTmXzxc+iHVnxeMI3X7neObLM6Vxiu/84Xz2834IL6YbbS5JL/ZpXNUoYKx++0
	eu4YxANHuUuSA5F9WI5TA1nd4FOykpygrQLCOgxL3fyx0mIWftPM3bKMeA3gb4v+UqcGiKB9ewH
	kPT4i+DhOe8vTvVsxWRDGh78k+eAz7MRvG5y4//i6Fbl06ktve3801PHIlZFZ845+IaCQA0lqAg
	L3wudqBFE6j0uMFv/juWUdQAvMqNm6r1g6xHA14JwJA2E3M+Z474IiRmcRWYQm0VeFw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1790262508; bh=ukLUOMhti9Eo0MeSXTNN0Wt
	zSkR87ftxGnpm0vvhebA=; b=DgLZLJQw4JYEsHt2HyaanMAIleHbgJNO6a2dC6+MTbR0O9Qe29
	ArZjRUVhY+rnN7pQTugsPJ8RNiki2owRP0Ag==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Thu, 24 Sep 2026 18:08:16 +0300
Subject: [PATCH v5 3/3] MAINTAINERS: Add myself and Ryan Brue as
 maintainers of NT51021 panel driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom-novatek-nt51021-panels-v5-3-f5eaf5685c9c@mainlining.org>
References: <20260924-qcom-novatek-nt51021-panels-v5-0-f5eaf5685c9c@mainlining.org>
In-Reply-To: <20260924-qcom-novatek-nt51021-panels-v5-0-f5eaf5685c9c@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790262503; l=872;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=Yo9jegclnSbgqe3YozDB9gCwq0NzikrfUngvQp1Exac=;
 b=mGK3jae8HvyV10Y5/WpnzKWUjvR2ywJsqQNIaai5hv3mOUIqdUftNvK0kou5cKwy2TpQqyrX2
 tMn/GuXs1VNBjDGJOL0dPWbgSgOm9pJo0HgtJftH37mgDZN6FlPFn9v
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_080833_810552_0C87DC36 
X-CRM114-Status: UNSURE (   7.94  )
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

Add a maintainer entry for the new NT51021 panel driver

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


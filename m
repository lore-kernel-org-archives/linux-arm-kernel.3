Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7C5C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 15:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IT5wIL01ABwmRZNqLeIlIorXyVzxqkoz0C2MbyXhFoE=; b=OK48+MJp3fmOeC
	YFUEbTiPeMp5MrTnC0lVP7Y3+DenJWXrD0x017a3YpDuvFVUdJobiPmQT36QaUDNmOIkTGvPEQ3Xb
	9KhsIaI61zo5Rz6SsNubl8hWaKbsyT6K0YYHh34jV4E20I6ePYgDY2ITuOFXKZf3T3G5C3JnFEeZl
	8/HDEta8+pyx3NbTWAmcnqqnfEPzPQMG9a4rn0+C/g0GsKGHdNWunpa2ybwS6wdeePxxACj0MAJ66
	+B+Bc3jEO2VkrHwR0PX6OtegKL88PzCHNByaikS3ssankEPrrUCqtjeHmehgbcs8jINqJppmVYkV/
	ZMV1ha22T+jxvCRQHMgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9l4T-0000000BLC4-3R9Y;
	Thu, 24 Sep 2026 15:09:13 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9l4R-0000000BLAH-0KWg;
	Thu, 24 Sep 2026 15:09:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1790262504; bh=IT5wIL01ABwmRZNqLeIlIor
	XyVzxqkoz0C2MbyXhFoE=; b=i/jgABKoJEzbGRbTcMlJ37el+yFeAl2lLAwfH3/AY9VWWZXbsP
	CQqcHXScEuYcPDnRMPkJcFweHWNvxStZZq9ZYDuz6G/uF1vz7bZcocr0rtMJIiiucEF2ZnrYpWD
	aeNsfCnGPhITZqUiX7Ik2xFSaX0wnFjdc0ITIt2rm/LuHC4B9/D6z3ftzsAlelNIHz+26rhov2E
	H94u9L0BVTPpn7A516qxUO0oBw9u0bySQiMQuhevdolVn4MwPCCxHC4XKisK2DDDqGvSN74ZsKb
	v/j7gSua3IEw1ZkMi8npmuhPLkLhKURTvOCRYr0Q7cp0/jJVqTNXiJNvJXMZthr+0dA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1790262504; bh=IT5wIL01ABwmRZNqLeIlIor
	XyVzxqkoz0C2MbyXhFoE=; b=ZMzq40Ac7/CyFWVYoM7d8y/7o0EyL4Km/qyAy3friFH94uhVq9
	LtRR3nxNXEpZwlmtHNICj9m4P1LRI1TqpVCw==;
From: Nickolay Goppen <setotau@mainlining.org>
Subject: [PATCH v5 0/3] Novatek NT51021 DSI panel IC driver
Date: Thu, 24 Sep 2026 18:08:13 +0300
Message-Id: <20260924-qcom-novatek-nt51021-panels-v5-0-f5eaf5685c9c@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NQW7DIBCF4atErEvFQIxNVr1HlAWMxw5tAim4q
 FXkuxeni0ZqZHX5S0/fu7JMyVNmu82VJSo++xhqNE8bhkcbRuK+r82kkFp00vB3jGceYrETvfE
 wNSAk8IsNdMqc5GB61zXW6JZV4ZJo8J83fX/46fzhXgmnhVwWR5+nmL5u9wWW3f+eCnDBEQGtB
 tdLDS9n68PJBx/G55hGttwV+QsagHVQVhBUQwqMsO3gHoLqHlTroKqg1Nph07fUoXkIbu/Bdh3
 cVlAJOzhUlRT4B5zn+Ru0B2U00AEAAA==
X-Change-ID: 20260829-qcom-novatek-nt51021-panels-e2f9db85a967
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
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790262503; l=3057;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=UvbOARMK6GY1e3ow6mOk9/yihgwenDxOFpT75WOc224=;
 b=Zy0TihR1b9K1C++TJWJNN42mrbvGokfVKR5j1+bvjn8aZ4/jwFrW7KLvgfYU1UefkMYUKJdgX
 y53x2s/xJPIDMGLgRo20gs9shHB8wJD5ArO2dcIILGmV5AIcj5onbeN
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_080911_272562_F408CF8D 
X-CRM114-Status: UNSURE (   9.61  )
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

This series adds support for Novatek NT51021-based panels 
for upcoming xiaomi-clover submission.

Although according to datasheet, the IС has three power rails 
in the use case of xiaomi-clover, all of them are wired to one 
fixed regulator.

Maybe I should create a dt option for enabling CABC for panel.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
Changes in v5:
- Added R-b's.
- Added a commit message for MAINTAINERS change.
- Link to v4: https://patch.msgid.link/20260917-qcom-novatek-nt51021-panels-v4-0-30afbc35d70c@mainlining.org

Changes in v4:
- Fixed bindings (Krzysztof).
- Added R-b and T-b.
- Added an off function without touching CABC (Sashiko)
- Link to v3: https://patch.msgid.link/20260913-qcom-novatek-nt51021-panels-v3-0-266bc5d7e8c9@mainlining.org

Changes in v3:
- Fixed bindings (Krzysztof)
- Fixed probe function (Sashiko)
- Added BOE-TV101WUM-NM0 support (Ryan)
- Link to v2: https://patch.msgid.link/20260911-qcom-novatek-nt51021-panels-v2-0-135e3190a7fb@mainlining.org

Changes in v2:
- Use devm_functions and renamed structs and functions (Neil)
- Added delay before deasserting reset for stable initialization (Sashiko and Ryan)
- Fixed dt-bindings (Sashiko and Neil)
- Added a comment about set_display_on command
- Link to v1: https://patch.msgid.link/20260829-qcom-novatek-nt51021-panels-v1-0-cc1ca61bd261@mainlining.org

To: Nickolay Goppen <setotau@mainlining.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Alexey Minnekhanov <alexeymin@minlexx.ru>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org

---
Nickolay Goppen (3):
      dt-bindings: display: panel: Add Novatek NT51021
      drivers: gpu: drm: panel: Add BOE NT51021 driver
      MAINTAINERS: Add myself and Ryan Brue as maintainers of NT51021 panel driver

 .../bindings/display/panel/novatek,nt51021.yaml    |  87 ++
 MAINTAINERS                                        |   7 +
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-novatek-nt51021.c      | 875 +++++++++++++++++++++
 5 files changed, 979 insertions(+)
---
base-commit: 99cc957e3ef3cccd72d2119c8eacbab39af0d1d6
change-id: 20260829-qcom-novatek-nt51021-panels-e2f9db85a967

Best regards,
--  
Nickolay Goppen <setotau@mainlining.org>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1C1C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 09:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LC9rVxldnnZSpZNEWmyL2LQZYkCHll/ZX7oJYcdLzeQ=; b=WGEAZiV14tpqwu
	ZonZS0O1C56BVx7w+c1AqbY2g6hA+Lc5MczLFnq+xxkPQdhSIgZFuxjuJgto2ZGrbmtlVKy0yzqCP
	JusO3KiBUTgO2nji2d3N0v7YiVMBUROQYASODJLcQ94B/A+9E/WVEx/gXBI5pylV4oInEwsYaSYY6
	468KVTdxg5zhLwFZ61Wji/ACgeCW7ns7Si3ou1CLPZ6un/tWdO3XfCgcB5hwjALfjXqQoVULzmWSV
	AEYy9gwTtFvGdnB9uxCpHTxpDjZwK5h3cUvbcpn0UScP/3AKWOVf0MceNFkZknZlFAAho9imx8P3a
	31QHk7EQWOUln3XoK9Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti8yw-00000006lL9-1guG;
	Wed, 12 Feb 2025 09:24:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti8xU-00000006l1r-4B35;
	Wed, 12 Feb 2025 09:23:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1739352184; x=1770888184;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=xUs1bH+W/iCogz1hXGPiTgCgI6O4GmwLfBC8KJfbnv0=;
  b=wNzXIAOrBgq1/nP1+TIBtjfJBdeQQsoqy2Ddb91DsOoQz68e1GuzQgpo
   Lk7lz6RzD83nYKSy0fqojDh0Q0pnjmRxQn86lkWXioEKUeIuNhMzFlFtu
   CeA/go8VtL1lCtpIwJxo7ZGYPXY+PVxNuMspF8KWGzXrQbDJwfb/TyM4+
   Q4PrpL24uQmTe0+o4NiRSwmeIj0bRJ/BtvQkxVgQl94cGD76RHA4zOVCr
   J1+kzW5+KvY0numvyHoM1im6HunXJUm6YpUxijIbEnQeWlKarlb5kSGaw
   hsK35oX9G/WKXKgSmVaxw+ZSawkd4aJqKW5fcrEJIKOdnRjOyGtAzw6dU
   g==;
X-CSE-ConnectionGUID: Im7caqcMRgeiMBKdbNTopA==
X-CSE-MsgGUID: 14u+0lMYQ4mioTEP1VJ3lQ==
X-IronPort-AV: E=Sophos;i="6.13,279,1732604400"; 
   d="scan'208";a="37190261"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Feb 2025 02:23:02 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 12 Feb 2025 02:22:22 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 12 Feb 2025 02:22:17 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Subject: [PATCH v3 0/2] dt-bindings: mmc: Fix the mmc-slot and Convert
 atmel,hsmci to json schema
Date: Wed, 12 Feb 2025 14:52:09 +0530
Message-ID: <20250212-mmc-slot-v3-0-2bf288207040@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEForGcC/22MywrCMBQFf6VkbSS5SWjryv8QFzEPe8E0JSlBK
 f1304Ig4nIOZ2Yh2SV0mZyahSRXMGMcK4hDQ8ygx7ujaCsTYCA58J6GYGh+xJky1cqu6612WpB
 6n5Lz+NxTl2vlAfMc02svF76tfyKFU06tN61stbDC384BTYpmwOloYiBbqMBHVgyY+pJhk7Uwy
 gvmwPa/8rqub5w2t5LhAAAA
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Dharma Balasubiramani
	<dharma.b@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739352136; l=1427;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=xUs1bH+W/iCogz1hXGPiTgCgI6O4GmwLfBC8KJfbnv0=;
 b=P8VjgomucORyCZ1TW0hO3s+2LkILloCeyETpd/3Lroit69beEjtEhR5Yj3qitz1mcZpRjMA24
 S4U58N+vpuIBWU9xe2QtSHVd/I3qYYVcLGZyZvevU3GkdS/zf2XEufi
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_012305_350587_7A2EB0E1 
X-CRM114-Status: UNSURE (   9.82  )
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

This patch series modifies the property status of "compatible"
(required/optional).

Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
Changes in v3:
- Add compatible as required property in meson binding.
- Include the dependent patch that converts txt to yaml for clarity in patch series.
- Refer the mmc-slot binding in the hsmci binding.
- Explain "why" the property is made optional in commit description.
- Link to v2: https://lore.kernel.org/r/20250205-mmc-slot-v2-1-da3c5f30e2d9@microchip.com

Changes in v2:
- Instead of moving the compatible string to the other binding, just make it
  optional (remove from required list).
- Link to v1: https://lore.kernel.org/r/20241219-mmc-slot-v1-1-dfc747a3d3fb@microchip.com

---
Dharma Balasubiramani (2):
      dt-bindings: mmc: mmc-slot: Make compatible property optional
      dt-bindings: mmc: atmel,hsmci: Convert to json schema

 .../bindings/mmc/amlogic,meson-mx-sdio.yaml        |   3 +
 .../devicetree/bindings/mmc/atmel,hsmci.yaml       | 106 +++++++++++++++++++++
 .../devicetree/bindings/mmc/atmel-hsmci.txt        |  73 --------------
 .../devicetree/bindings/mmc/mmc-slot.yaml          |   1 -
 4 files changed, 109 insertions(+), 74 deletions(-)
---
base-commit: c674aa7c289e51659e40dda0f954886ef7f80042
change-id: 20241219-mmc-slot-0574889daea3

Best regards,
-- 
Dharma Balasubiramani <dharma.b@microchip.com>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE4CC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 02:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7oIYTRA3W/rP+i/02M8CuoNQQR4wNmuvMklLAcDHyYA=; b=e9tvCYkbYD4G+8
	fvGJBwYvyzEwa7KW0Mg9uDk9MAK8muT8taREEiH1DCNE5FyGhp+L9kCaRc+YV2P3kFmbmCYru1bha
	GOF3sb9ElKA3YZwmFFLhO4uX2urTsNNmss+aqAGC+waUZ4YFxKLAkFG2hwLHn6Rqpw0zJeoiVAaMq
	9yZ5NDNXDDP300s+nSup64+ekrHpWcRwgClpr0WNXFX5Natfp+VnaCQ4ceeWErnIohrIxTxje2UBM
	X1F3a7T9GDJh98WKcSkA0l016HpRbO8kWAC7bVuFMN7qqSUj/fDDkmKzriGOsYPq3KnhToAKnCstY
	9N89PV2A2h/bdbqEVseg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmOfB-0000000CCRk-42Dq;
	Mon, 24 Feb 2025 02:57:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmOaf-0000000CBld-02ws;
	Mon, 24 Feb 2025 02:53:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1740365584; x=1771901584;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=eyemEMNGosa3n/OdORh+QR5/lkWa2v+ZSdITVPlwPk0=;
  b=NR6ZSxG8qC214AWclzbs0x0YDMn7B8Af4NyOsazUbl1GTp+TUs5mO5Os
   FrLLPTpHZmsJDelTt9NMG1IbD3GCrtBFPZta+xV73cLc+//DUWyQX70b7
   E/DSXXt0xMT/K1g9L56ZEymfptHDm7AaBKjlFmm7sJxp/E+FdG8Pv0lAc
   C6doPGXe3RKHLDcsAr5lQFs1ilP4Vf4oynhb8f6/XcnN2gSUrh57nwE8G
   3oW5lxqClBFpze9B6NxkWkc8UUWEGSXLp9I82tM/UhAnPtAeJ9DbZIZjy
   jfFaeYGlaD/8wpyC+fb8L6pk0WqOF7PUq/t9QyvbNj2WT9y859TBoBJ0d
   g==;
X-CSE-ConnectionGUID: PEkXTKBESfqUq+t0U30eiQ==
X-CSE-MsgGUID: 9NPXPyaESMmg2sWeIQg41A==
X-IronPort-AV: E=Sophos;i="6.13,309,1732604400"; 
   d="scan'208";a="37623869"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Feb 2025 19:53:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 23 Feb 2025 19:52:34 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sun, 23 Feb 2025 19:52:30 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Subject: [PATCH v4 0/2] dt-bindings: mmc: Fix the mmc-slot and Convert
 atmel,hsmci to json schema
Date: Mon, 24 Feb 2025 08:22:26 +0530
Message-ID: <20250224-mmc-slot-v4-0-231620a31e88@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOreu2cC/23MTQqDMBCG4atI1k2ZTBKMXfUepYuYnxpoGklEW
 sS7V4WCFJffMM87keJycIVcqolkN4YS0msZ4lQR0+nXw9Fgl00QUDBkDY3R0PJMAwVZC6Uaq53
 mZHnvs/PhvaVu92V3oQwpf7byyNbrQWRklFHrTS1qzS337TUGk5PpQn82KZI1NOIPS0CQO4wr1
 txIz8GhbY4w32GGO8wpUGw9KoVQg4B/PM/zFyRl03geAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740365548; l=1684;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=eyemEMNGosa3n/OdORh+QR5/lkWa2v+ZSdITVPlwPk0=;
 b=s5k2Y8EORIHPvltG/Ih2kxVcEz9Cv6lHPofX+nfuc0ktRhQu4EsQNp90vxo9mlS4ZaVtgsCWm
 qCIrJ+jwNReDZsOSt+mQjvruxeCAQC3DiLunjhq4vmkE8AyyuWAZgzp
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_185305_122283_479FFA57 
X-CRM114-Status: UNSURE (   9.55  )
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
Changes in v4:
- Rewrapped the commit message with textwidth=75
- Allow slot pattern property to match only 0 to 2 as per reg.
- Add Reviewed-by tags from Rob.
- Link to v3: https://lore.kernel.org/r/20250212-mmc-slot-v3-0-2bf288207040@microchip.com

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
base-commit: d4b0fd87ff0d4338b259dc79b2b3c6f7e70e8afa
change-id: 20241219-mmc-slot-0574889daea3

Best regards,
-- 
Dharma Balasubiramani <dharma.b@microchip.com>



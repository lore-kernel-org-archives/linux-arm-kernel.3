Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA05CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 14:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ArA4CM8yGbvcXCAze1bThQpHSt0CYRptbT3mkn4ruZs=; b=uynZ+Hjl9kJVV+
	4C9bH4i0zo8ojEEf6no/xXw5odmi0wJeRBbsgfQT3B7sm2FLfqif8vrEfgx48/RwZO9U3MHZCyvn0
	KDy1QM7RyEOBK9PTuiIvyp2xSLwzrf/ISqRvxQEo2atV70RnW6ArrQ+kicrJisu6y5BZ5DrbrZKJy
	vjYec4Vq3A3r4KgWCwlz60puqgeX3J0+9+NT36lmarZv3IXcWtLZICpOKFbBDdduEou/hiBYzLc2B
	kRkAE8NNRN+ZgX4Mg92oR3qv/fp6vwBCQSoJvotju4zgXb1PhGc7mlUesNU3knHsm1kBqbzJ7hKaP
	aMTYzIXIs3ID3z5dlqzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uok7g-0000000E979-0UBf;
	Wed, 20 Aug 2025 14:49:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoj7e-0000000DsU3-2ADj;
	Wed, 20 Aug 2025 13:45:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755697500;
	bh=KfG24pPgv1Uh1EexQ+H85Ze6YKWSeO2wkVKi6hfXFb4=;
	h=From:Subject:Date:To:Cc:From;
	b=o2Q2+ZgbK78wJb9uQKi4s/epP/4RRxMajW9l1L4ZrZplygagLaCdFh951EdeS+fuN
	 UaBUbKv1r1pWFjvIqWkFnXz+OqwYtwCmChe7tpXh3ZLXAccO+JrFzxgUM8I5ZKb26k
	 Tm1uDq3v5PcgVILUqrU2M5SVHyhzao/5ZyZlEBVPaOjBrB+sSBGoqYlOyOHpawFqHN
	 GpYpvdA8eBfQGqzxk8UtZWGW0g/SNP8VM36Z34LKi59ReTj7tijITfU5qJlZ95XDFk
	 CZeIt1KFP5yy9nAZwS5iYfifUhZeIe17YAqaT28pswfb22L5ApPB7LmBYPNVzx7i2R
	 i/gh1aPHxuqvg==
Received: from localhost-live.home (2a01cb0892F2D600C8f85CF092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9AFC817E01F5;
	Wed, 20 Aug 2025 15:44:59 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Subject: [PATCH v2 0/6] MediaTek devicetree/bindings warnings sanitization
 second round
Date: Wed, 20 Aug 2025 15:44:51 +0200
Message-Id: <20250820-mtk-dtb-warnings-v2-0-cf4721e58f4e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFTRpWgC/32NSw6CMBRFt0Le2GfaWqxx5D4Mg37hRWhNS1BD2
 LuVBTg8J7nnrlB8Jl/g2qyQ/UKFUqwgDg3YQcfeI7nKIJho2YVxnOYHutngS+dIsS/IW+VksJw
 FpaDOntkHeu/Je1d5oDKn/NkfFv6zf2ILR4Zno6WXJyGFMjebxlGblPXRpgm6bdu+s/ArSLQAA
 AA=
X-Change-ID: 20250801-mtk-dtb-warnings-157d4fc10f77
To: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ikjoon Jang <ikjn@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Julien Massot <jmassot@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_064502_752086_E28A9E50 
X-CRM114-Status: GOOD (  12.84  )
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

This patch series continues the effort to address Device Tree validation warnings for MediaTek platforms, with a focus on MT8183. It follows the initial cleanup series by Angelo (https://www.spinics.net/lists/kernel/msg5780177.html)

The patches in this set eliminate several of the remaining warnings by improving or converting DT bindings to YAML, adding missing properties, and updating device tree files accordingly.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
Changes in v2:

- Restrict power-domain usage to mediatek,mt8183-mfgcfg only
- Add the MT8183 AFE binding before audiosys (it is referenced in the example) and include the memory-region property
- Rename binding files to align with the compatible name
- Drop former patch 7/9 (already applied via the pinctrl tree)
- Drop patches 8/9 and 9/9 until we decide how to represent R0 and R1 values

---
Julien Massot (6):
      dt-bindings: clock: mediatek: Add power-domains property
      ASoC: dt-binding: Convert mt8183-afe-pcm binding to YAML
      dt-bindings: arm: mediatek: Support mt8183-audiosys binding variant
      arm64: dts: mt8183: Rename nodes to match audiosys binding schema
      dt-bindings: sound: Convert MT8183 DA7219 sound card bindings to YAML
      ASoC: dt-binding: Convert MediaTek mt8183-mt6358 bindings to YAML

 .../bindings/arm/mediatek/mediatek,audsys.yaml     |  16 +-
 .../devicetree/bindings/clock/mediatek,syscon.yaml |  15 ++
 .../bindings/sound/mediatek,mt8183-audio.yaml      | 228 +++++++++++++++++++++
 .../bindings/sound/mediatek,mt8183_da7219.yaml     |  49 +++++
 .../sound/mediatek,mt8183_mt6358_ts3a227.yaml      |  59 ++++++
 .../devicetree/bindings/sound/mt8183-afe-pcm.txt   |  42 ----
 .../bindings/sound/mt8183-da7219-max98357.txt      |  21 --
 .../sound/mt8183-mt6358-ts3a227-max98357.txt       |  25 ---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |   4 +-
 9 files changed, 368 insertions(+), 91 deletions(-)
---
base-commit: 5303936d609e09665deda94eaedf26a0e5c3a087
change-id: 20250801-mtk-dtb-warnings-157d4fc10f77

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>



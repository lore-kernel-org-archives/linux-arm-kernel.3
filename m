Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FF2606A339
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 07:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WhWJ9eM5;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CFJNfkeA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CAZapmg+ij6DoDuuN0WapEdXyTNER/gsB6cKYFvO9h0=; b=WhWJ9eM58d31DVRFZbhmf0xWrc
	f3l1voDp3X+yfmIjsvB7ZK4UUeKpSbWGGbJENQhN0MpN0YnC1LCx9UtGUZWjPVLRgSkPmW5YL02LB
	RcoqRzOeNMcgD1jY1FamxBjL2KmJu4QKBSUsnHFrgjNwhh+A3mw7g3y8pOb0A0Rxze1Kf4zo2IpcF
	kXvZmzHzdyGz49/uIidL0cjIN2V6OvhzpZj5YtHU+DelSTuVDNu7c20MShrTd1Qgr8tIHw4GP6mBw
	Tnfli8u2644CtYUb/h9L0vjNJDR4NmcA3vXp12DDtZ/+0Zc36aa+kstVyhVGTY6VQTD/4MtYpoaIR
	TROG4WMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQRE-0000000BEHY-1qF6;
	Wed, 21 Oct 2026 07:08:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJQR8-0000000BECU-0oTL;
	Wed, 21 Oct 2026 07:08:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 489C460534;
	Wed, 21 Oct 2026 07:08:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792566513;
	b=hQioR0XPK3c9HienxU61MccZY4zRO0J6RaIIJZlyHnRSgaXlr1LdxuwO/0NbYsV8haLM
	 OJx7otY3uuZTEl4kre6wlh0kMNwfGC6WCBS2TfOxVL+nmRHO509C898aEZenQhlTbzMWn
	 69Zs108wxjTdJsV2fM02ZE3fn2JWR9iZM3Xj3Isfdzv7GaQCyXfghLoHKgsYiCdGZYRPX
	 wBxpbIah/dj3ASaV0nHXPUhPBtzzaf/915qB2ZXo6UxnyhFXu6KBx2e0zxMymkBWTYaTU
	 htg8Mii9LOMbtMhoQC0Rh1mBuJ2TSA8GA3/pJeWHz12ToW0GJkeWKF+QwIgni8PGqkA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792566513;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=CAZapmg+ij6DoDuuN0WapEdXyTNER/gsB6cKYFvO9h0=;
	b=TXU9qSxYDO5tEZQibaerYdGksVmbU3vuFEkS+85+1wfQGGkF249fk7kzG+T9X5ayLNOY
	 /gm4BWWSp7fJErTCVK7nFY+LjCHsthPYQxbcfMbtlPDq9d060l2YpKgY50bZiCBK5+kSY
	 uTTH1YB9kJJ7f3YBhU8rnoU9jhqkShkzdFOJx98Thf7+u2stK3zB4vkM1qKYDkhbVWA14
	 UZRV836A3LcEYT5XKAGufw2DVsrMG5mt64TwLfwo1BxxINSy9fr1U8643b1vAin+YyXFC
	 1E6e/mqNyWAQeUaB5EscCAOjqyHQPtB2oC8+20mRsjZZ55WOMtGQHafODFzZr2Ln62Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A638D1F000CC;
	Wed, 21 Oct 2026 07:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792566513;
	bh=CAZapmg+ij6DoDuuN0WapEdXyTNER/gsB6cKYFvO9h0=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=CFJNfkeAzgjMeXV5hx+wsLpSqkxUPv8ge1AjeUCCmOiHWdMMf3f2wICrrCD6nDBai
	 uKrOlXE9fnJ6bbltv8ukEnwARQSCkOnPVuEQePcXqmd7wUje7xAS0Iel7hgCsBD0Ye
	 BokJ64GKnzIoECzkg4n17ZVV//jF+0WUEhDxqQO147KWppNulhGCyk3YTA3L/LXUxA
	 nPVE8f5mGaMycwqWThs3XetfHK+abj8JS6j5zK+aW1CYeyddo/PZfD8wRhx0VUWJjc
	 N1HF2wrIXLZ8GXVW+pJLKxQvwjXbPe6XoKuNDlzMiL8zHhgmt4bQbKdJoW1o2wh0AJ
	 FYNm+2tDTZMKQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 05575432F0;
	Wed, 21 Oct 2026 07:08:31 +0000 (UTC)
From: Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Subject: [PATCH v7 0/5] Add support for S4 audio
Date: Wed, 21 Oct 2026 15:08:27 +0800
Message-Id: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOtk2GoC/2XQy2rDMBCF4VcJWtdlRreRsup7hFJkXRJBExc5F
 S3B7145ENzYaHUE3y/QjY2x5Diy/e7GSqx5zMOlDXrZMX9yl2PscmibceAKEKFz3yEPH6HUHEs
 H5JQw6KWVPWvkq8SUf+65w3vbpzxeh/J7r1ecbx8h8Ryq2EFnPEoiSMI4eHPnz+GY/asfzmxOV
 b5wjnLFeeOCjMHkBHkbt1z849ysuGg89CkIUEBR+i2XCxdoV1w2rk07lFwgtFuuFk7rT6xqfl2
 iUgkjSS23XD+4BuR6xXXj1kahwCjVe/7Mp2n6A46+2ovlAQAA
X-Change-ID: 20250110-audio_drvier-07a5381c494b
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com, 
 jiebing chen <jiebing.chen@amlogic.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792566509; l=3939;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=92tlw/eLjbgUFICrONHVrpp0evhwHUkrfMNmLdgv62w=;
 b=Y49zpmumAFlrrAseuLzXViiU4ec+at/SA10D5ud27D2hjJNLQfEeDDySusQBR6sTZWaFv9Gn4
 Tda5dtAjRuKBwoQJ55fGVjsUU5QoSecYHhQMVXNHf87izHtc0pAwP7O
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: Jiebing Chen <jiebing.chen@amlogic.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: jiebing.chen@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series completes the end-to-end audio support
for S4 SoC from hardware bindings to driver implementation
and system integration.

1 Device Tree Bindings Updates 
Added audio power domain and S4 audio clock support for S4 SoC.
Added S4 audio tocodec binding support.

2 Driver Implementation
Implemented S4 tocodec driver for G12A architecture.
Added S4 audio clock support in AXG audio clock 

3 Device Tree Integration
Add Amlogic S4 audio subsystem support in arm64 DTS.

Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
---
Changes in v7:
- Use the supply widget to manage the tocodec clock enable signal.
- Remove redundant MPLL frequencies.
- Fixed dt_binding warning
- Link to v6: https://lore.kernel.org/r/20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com

Changes in v6:
- Fix the problem of string for Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
- Remove clock pad register, and it will be submitted as an independent patch.
- Redescribe sound/soc/meson/g12a-toacodec.c
- Link to v5: https://lore.kernel.org/r/20250710-audio_drvier-v5-0-d4155f1e7464@amlogic.com

Changes in v5:
- Fix warning Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yam when make dt_binding_check
- The audio reg is mounted below the APB bus in dts file.
- Deal with pad clock in a distinct controller.
- Fix warning for sound/soc/meson/g12a-toacodec.c
- Link to v4: https://lore.kernel.org/r/20250319-audio_drvier-v4-0-686867fad719@amlogic.com

Changes in v4:
- fix dtb check warning 
- add maxItems of power domain for dt-bindings
- fixed audio clock pads regmap base and reg offset 
- use dapm widget to control tocodec bclk and mclk enable
- Link to v3: https://lore.kernel.org/r/20250228-audio_drvier-v3-0-dbfd30507e4c@amlogic.com

Changes in v3:
- remove g12a tocodec switch event
- Modify the incorrect title for dt-bindings
- Link to v2: https://lore.kernel.org/r/20250214-audio_drvier-v2-0-37881fa37c9e@amlogic.com

Changes in v2:
- remove tdm pad control and change tocodec base on g12a
- change hifipll rate to support 24bit
- add s4 audio clock
- Link to v1: https://lore.kernel.org/r/20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com

To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

---
Jiebing Chen (5):
      dt-bindings: clock: meson: Add audio power domain for S4 soc
      dt-bindings: Asoc: axg-audio: Add S4 audio tocodec
      ASoC: meson: g12a-toacodec: Add S4 tocodec driver
      clk: meson: axg_audio: add S4 support
      arm64: dts: amlogic: Add Amlogic S4 Audio

 .../bindings/clock/amlogic,axg-audio-clkc.yaml     |  17 +-
 .../bindings/sound/amlogic,g12a-toacodec.yaml      |   1 +
 .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 219 +++++++++++++
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 360 +++++++++++++++++++++
 drivers/clk/meson/axg-audio.c                      | 165 ++++++++++
 sound/soc/meson/g12a-toacodec.c                    |  49 +++
 6 files changed, 810 insertions(+), 1 deletion(-)
---
base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
change-id: 20250110-audio_drvier-07a5381c494b

Best regards,
--  
Jiebing Chen <jiebing.chen@amlogic.com>




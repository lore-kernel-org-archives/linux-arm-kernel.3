Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB2AFEA83C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 09:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8w98V80T2IZaJZtMGFR25TdOCYigHEpLeyiYM7dleq8=; b=eRKD0ZIQexlSgq
	1sCR8bGm3GFfkHNBEWrw4IW8ihEPX2u4/8U5mR7Bi1qqby2fIfvJlu4wOcrEg2YAqZWulqP2nB2dR
	fbFJvUazAQ5E3AkMjg1Y+3D41MoGC043WtbVn/8XD7WtXB+haka5xscidiyOqzsfu5Zy7mG1LHvE4
	HQjjMHETWg6EkJuSU2Tyr3YBDtKIfonabzNMnRE96IJ164gMtqsURFuwkQiX2T5aTbto4ha90PNso
	f1RRQ0vYhXZBdDXdwf78J3AMJZz1WALS0TVkVr1lFmkX3iMGB3bdyxSZVEWSUqfQlzaxCiLhW/lg2
	BY4c/7uXKuTFdNGtXttg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5KOD-000000031tF-0tv6;
	Wed, 25 Mar 2026 09:19:01 +0000
Received: from [2a01:4f9:c011:1c83::1] (helo=courrier.aliel.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5KO2-000000031iT-2nZh;
	Wed, 25 Mar 2026 09:18:53 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774430326;
	bh=qZgg2/em0UQrmXDkkNz9+fEbqFZp6rL3BaB4H4Zgk1I=;
	h=From:Subject:Date:To:Cc;
	b=W+ci3AfOQDl7PXqpLMquScKokZ9vuSF72EboAukLJvl/jienz0GZo2ElWtphU1dq3
	 WI+UojSM5L/RzwSWU+Wrn0Ry14X3kKihrNCeKCn/zwFwwEEf9apAUpX14ob5V56LIN
	 M1/HoITLfboQSg93MPeQwbya96CsesZcWJYB5Xl0=
Subject: [PATCH v4 0/9] arm64: dts: amlogic: Add MMC/SD/SDIO support for
 Khadas VIM4 (Amlogic T7)
Date: Wed, 25 Mar 2026 10:15:18 +0100
Message-Id: <20260325-add-emmc-t7-vim4-v4-0-44c7b4a5e459@aliel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6WQ3WqEMBBGX0Vy3ZH8qauUsu9RepGacU3XxDbRY
 Fl892ZjoYVe9mbgTPjOx+RGAnqDgXTFjXiMJpjZJZAPBelH5S4IRicmnPKaCk5BaQ1obQ9LA9F
 YCbXSrMZW1kwOJMXePQ5my8rnl4M9fqzJvBxLYjEElc1d8XiImaANpZyXaUrRAIM3o1w5rmdlp
 /li+rKf7dNd/6oCQgJrlq5wuC3wbWjJvW00YZn9Z74nslyX3zk7Mcoa2paikhVNBZNx6wZX9A4
 n0BjPajI4lYPPnsj/kRU/WcHF3y+LAihUrGp1S1V7kv2v/L7vX3dLJkSVAQAA
X-Change-ID: 20260320-add-emmc-t7-vim4-6ad16e94614f
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Johannes Berg <johannes@sipsolutions.net>, van Spriel <arend@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-wireless@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, Nick Xie <nick@khadas.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774430322; l=2970;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=qZgg2/em0UQrmXDkkNz9+fEbqFZp6rL3BaB4H4Zgk1I=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKQVj+Pq+QZ1dPHXnx93BiJVL48LoNgsShQ9+3LoMPwrlcwyPr6axg76cgSOR3GKYLjvfenYsZv
 tjC3CZ4d9fAg=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_021851_152486_B665379E 
X-CRM114-Status: GOOD (  11.20  )
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

This patch series depends on Jian's SCMI clock patches yet to merge
https://lore.kernel.org/all/20260313070022.700437-1-jian.hu@amlogic.com/

This series adds device tree support for the MMC, SD card and SDIO
interfaces on the Amlogic T7 SoC and the Khadas VIM4 board.

The first patches add the necessary building blocks in the T7 SoC
DTSI: pinctrl nodes for pin muxing, PWM controller nodes, and MMC
controller nodes. The amlogic,t7-mmc and amlogic,t7-pwm compatible
strings are introduced with fallbacks to existing drivers, avoiding
the need for new driver code.

The remaining patches enable these interfaces on the Khadas VIM4
board, including the power regulators, the SDIO power sequence and
32.768kHz PWM clock required by the BCM43752 Wi-Fi module, and the
board-specific MMC controller configurations.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
Changes in v4:
- Address potential DT binding API break from Xianwei's feedback.
- Change underscore to dash in pinctrl nodes names from Xianwei's feedback.
- Link to v3: https://lore.kernel.org/r/20260323-add-emmc-t7-vim4-v3-0-5159d90a984c@aliel.fr

Changes in v3:
- Remove all changes about fixed pll clock from analog controller.
- Use clocks retrieved through SCMI.
- Add other MMC controllers
- Manage Wi-Fi module enablement. 
- Link to v2: https://lore.kernel.org/r/20260218101709.35450-1-linux-kernel-dev@aliel.fr

Changes in v2:
- Resend v1 patches as attached to the first patch.
- Link to v1: https://lore.kernel.org/r/20260218101709.35450-1-linux-kernel-dev@aliel.fr

---
Ronald Claveau (9):
      arm64: dts: amlogic: t7: Add eMMC, SD card and SDIO pinctrl nodes
      dt-bindings: mmc: amlogic: Add compatible for T7 mmc
      arm64: dts: amlogic: t7: Add MMC controller nodes
      arm64: dts: amlogic: t7: Add PWM pinctrl nodes
      arm64: dts: amlogic: t7: Add PWM controller nodes
      arm64: dts: amlogic: t7: khadas-vim4: Add power regulators
      arm64: dts: amlogic: t7: khadas-vim4: Add SDIO power sequence and WiFi clock
      dt-bindings: net: wireless: brcm: Add compatible for bcm43752
      arm64: dts: amlogic: t7: khadas-vim4: Add MMC nodes

 .../bindings/mmc/amlogic,meson-gx-mmc.yaml         |   4 +
 .../bindings/net/wireless/brcm,bcm4329-fmac.yaml   |   1 +
 .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 202 ++++++++++++-
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        | 336 +++++++++++++++++++++
 4 files changed, 542 insertions(+), 1 deletion(-)
---
base-commit: f6eb9ae8b9fc13c3971e4a6d1e8442f253001f36
change-id: 20260320-add-emmc-t7-vim4-6ad16e94614f
prerequisite-message-id: <20260313070022.700437-1-jian.hu@amlogic.com>
prerequisite-patch-id: f03a086b4137158412b2d47b3de793b858de8dde
prerequisite-patch-id: 123970c9b29c2090440f2fd71c85d3c6fd8e36de
prerequisite-patch-id: 3e2e56b0926ba327b520f935df4ced5089bbe503

Best regards,
-- 
Ronald Claveau <linux-kernel-dev@aliel.fr>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9812F106F318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 10:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HLLPvw4b+KBOPrk4vQUBM39XOsTpK+nmuOtTbcvCLgw=; b=Holh6arED6gCUE
	1g7/MsNTBt7IYrWCFEAnCXnB5Dps20JlX6kbX1bfiYUwoSBx5bsGG1WTLV+dfaxswXEBoj0Sf42R+
	fblOocyd1W+JP74GpmhtcWuq3nNTmRz7N6X6Q7yXEAfGQfhyAcD31wacj0GViYIHPkXv+005mBMud
	zFO3AaWFsDM8pCRAHKrb8+RNLLqLWUg9HTbkAxqtBh50QZmSZU6UFCIXp83goR+eT86V7ddbVm7kQ
	gV8F38aWxNr3fI9Yc7qiOnV9kDOW6ncuHcsZPWH3ZcZfag1LwmBvypqPfb7dDIrLWCFiQZX3vk1Ci
	KOfYZhKLQSghp6fDnM5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hXd-00000005D14-2ZXg;
	Thu, 26 Mar 2026 10:02:17 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hXL-00000005Cpp-1dnY;
	Thu, 26 Mar 2026 10:02:08 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1774519314;
	bh=YrKt0Ww3CgM+qr6VBXPFTJI/TUiGPe735lMX0b/L28k=;
	h=From:Subject:Date:To:Cc;
	b=ItYBcwZivHMGiCGLcWmoy0XvR7D54lAMd808KbEAoOR44pqsXyBCXYGz0TxzyJ1er
	 hv6Kem6meJiUYVyUW4i0oFEXVVs8MUr+tCzJZyB/KTJl3hdUqvMPjAv5FBdwJuLE7i
	 MBdu9mHNPRGgkThVCkMg1WSSIg3d784zWkOT+NSQ=
Subject: [PATCH v5 0/9] arm64: dts: amlogic: Add MMC/SD/SDIO support for
 Khadas VIM4 (Amlogic T7)
Date: Thu, 26 Mar 2026 10:59:11 +0100
Message-Id: <20260326-add-emmc-t7-vim4-v5-0-d3f182b48e9d@aliel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6WQ3WqEMBBGX0Vy3ZH86kZK2fcovcjquKZrYpuoW
 BbfvVktdGl715uBb8I5H5MriRgsRlJlVxJwttEOPgX1kJG6M/6MYJuUCae8oIJTME0D6FwNYwm
 zdRIK07ACtSyYbEnC3gK2dtmUzy97Dvg+JfO4L4nDGM1mrrLHXcwELSnlPE9TihIYvFrj8246G
 tcPZ1vn9eCebvqTiQgpODtWmcdlhC+DJre2zsZxCB/bPTPb6rZ3zg6MspLqXCipaCrorZ8WuGD
 w2EOD89H0Fvu8DZtn5v9gxTcruPj9ZbMACoop3Whq9EHWP3h5z6s/eJl4KevyJI1CqfQdv67rJ
 x8mKU/VAQAA
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
 Ronald Claveau <linux-kernel-dev@aliel.fr>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Nick Xie <nick@khadas.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774519311; l=3343;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=YrKt0Ww3CgM+qr6VBXPFTJI/TUiGPe735lMX0b/L28k=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIHRXjWTzrMh5ahGI4R/IpDrnH6+QXhObnxkTH8FTvGDua87mdIW3Kn2PADGdEJ8fTRpOFFNaXK
 uzvWV+G6OPQk=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_030201_824590_E3EDE0B5 
X-CRM114-Status: GOOD (  10.20  )
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
Changes in v5:
- Add missing trailers according to Rob's feedback.
- Change mux-0 to mux in pinctrl nodes for single mux. Neil's feedback.
- Move disabled status at the end of node properties. Neil's feedback.
- Restore space instead of tab in VIM4 DTS file according to Neil's feedback.
- Link to v4: https://lore.kernel.org/r/20260325-add-emmc-t7-vim4-v4-0-44c7b4a5e459@aliel.fr

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
 .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 200 ++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        | 336 +++++++++++++++++++++
 4 files changed, 541 insertions(+)
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



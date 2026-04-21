Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D46F327B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 07:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BINSjsnL8/Dnlz1WXz1XKYYztcjQz7zyOgqgW2KlOos=; b=Q9dL3ali8ZZTgW
	dEb69McKrm7nq6zE9DRx9P9rf2wBzGsbIbW6lF0f3V31rUXjRvOa3Zz1Cp7+WlmqNlLMN1+yOZDLD
	cZJw3VK3xqPXGJ4wFfCFbLZUFCkWh14qMEFAIa2A7zgVXUmT0OWxJRLFfeN6DhnUQawJSuwQQ0k/l
	bd8IJPq3DMzkqsY9kfMR5LnYzQFWTv8/KG4j2Ccd32hy1FhYdXjMNK60rirmzk6yfqc0TPcR2DWqL
	CBnvFCycJclvjRGZ8hSaN4HbXBaTh3NV8Kkllj59qtwhQf+OTvDHtbVW6GFAR8SulTSzV9KPa4lfb
	RKxBiGZ0vvea1Jqo9UVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5PY-00000008AD2-1vnm;
	Tue, 21 Apr 2026 07:20:44 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF5PL-00000008A2j-1xP2;
	Tue, 21 Apr 2026 07:20:34 +0000
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1776756025;
	bh=eabITeajuymRqUexIOIo+BVIQZEdJ0v8fPBEbG7RFe8=;
	h=From:Subject:Date:To:Cc;
	b=FUEFmPymNo7rImiZEZNN4kJRq+OtwYdxp93qSCVbUXcsKTIr+Fh5CWM4KDyoCtwdw
	 //JxK9jQwDVum668Jm9CgT1euDre0P6G4jGPbeuOmtYkJmQeBpJqBdipjaXcdHOKez
	 faRzK71/L9A+3ch9QHaFJ4XS33Ij1xCzb/i7XsMA=
Subject: [PATCH v3 0/8] arm64: amlogic: T7 thermal support
Date: Tue, 21 Apr 2026 09:19:42 +0200
Message-Id: <20260421-add-thermal-t7-vim4-v3-0-a2e7215ed003@aliel.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32SzW7bMBCEX8XQuTSW/6JRFHmPoodd7jJmI8muJ
 BsJgrx7aTmHBA164GEJzDfY2XntFpmrLN1h99rNcq1LPU1tsN92XT7i9Ciqcps7AyaA06CQWa1
 HmUcc1BrVtY5OAYiPmpBz1l1Tnmcp9Xmj/vx1n2f5c2nw9f7ZjbIsuMEPu+8b27aXTHB+r8G3Q
 Sutflec9sfLA47D6bHmfT6NPzY+rvm4aYNHzzGUwpQTWUSytvdEwWcCEwFctiBRPquMjSakHnR
 vArNFjoV0EHIcObATJA/OxP6zykdJBD2m0KNw8c6yZWAfctEZHZMBMqhD9zG7Zva+3ZYc5dHZ6
 I1qqzRypUGUtK3RlZiixcPVfDalaKF4cYZEc59YJyvBYmN6l3xmKiZHjvSlqQXV7qDqdMWhsjr
 Pp7PM64siEu84WVuifnf8V6s3bYv+dubpMgxqlkVWZShAL1QSoztc9VdiB2bbdswXVXBST0dkX
 O5dwaxzs/e23evdm3CRWyBjXQ+7SZ6bxz2z2N3ac6zLeppftoo2v1t9/tvGq1agdCqGesbYbvr
 QtpdhX+YN1zw/IOzXCHNDABhOgBDAfEC8vb39BVaDuHQ2AwAA
X-Change-ID: 20260410-add-thermal-t7-vim4-00e571badcc1
To: Guillaume La Roque <glaroque@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1776756022; l=5778;
 i=linux-kernel-dev@aliel.fr; s=id_ed25519; h=from:subject:message-id;
 bh=eabITeajuymRqUexIOIo+BVIQZEdJ0v8fPBEbG7RFe8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgMGec55oxeeisqykQiUedekMYyOnR9
 BG9E/7rDWyqdNoAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFNJKc8ds2NciIpw/7eA69vgNRVYzI6nC/NashbgfENw+A37aqeGm4e/2+rkxXPAbza88x7aumV
 fs3HmbvzHAAs=
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openssh;
 fpr=SHA256:kch4osYZ6A1BrPps5AUs6KnfdE2wm4ocMtyTc8TmZMs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_002032_081148_C39267D6 
X-CRM114-Status: GOOD (  10.64  )
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

This series adds thermal monitoring support for the Amlogic T7 SoC,
used on the Khadas VIM4 board.

The T7 exposes six thermal sensors (a53, a73, gpu, nna, vpu, hevc),
each accessible through the secure monitor firmware interface rather
than a directly mapped eFuse register as on older SoCs.

The series is organized as follows:

- Patch 1 extends the amlogic,t7-thermal DT binding to describe the
  new amlogic,secure-monitor property.
- Patches 2-3 extend the Meson secure monitor driver to expose a
  thermal calibration read command (SMC ID 0x82000047).
- Patch 4 adds the secure monitor readout path to the amlogic thermal
  driver and introduces the amlogic,t7-thermal compatible.
- Patches 5-7 wire up the T7 DTSI with CPU cooling cells, sensor
  nodes, and thermal zones.
- Patch 8 extends the Khadas VIM4 DTS to map all thermal zones to the
  on-board MCU fan controller (states 30–100, corresponding to the
  FAN_CTRL register range 0x1E–0x64).

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
Changes in v3:
- PATCH 1: Replace second if check by an else statement.
  Remove unnecessary label in example according to Conor's feedback
- Link to v2: https://lore.kernel.org/r/20260413-add-thermal-t7-vim4-v2-0-1002d90a0602@aliel.fr

Changes in v2:
- PATCH 1: change two const entries to enum, explain why sensor index is needed
  reorder conditional compatible for required, and fallback only according to
  Krzysztof's feedback.
- PATCH 3: Add kerneldoc for meson_sm_get_thermal_calib exported function
  according to Krzysztof's feedback.
- Link to v1: https://lore.kernel.org/r/20260410-add-thermal-t7-vim4-v1-0-19f2b8da74d7@aliel.fr

---
Ronald Claveau (8):
      dt-bindings: thermal: amlogic: Add support for T7
      firmware: meson: sm: Thermal calibration read via secure monitor
      firmware: meson: sm: Add thermal calibration SMC call
      thermal: amlogic: Add support for secure monitor calibration readout
      arm64: dts: amlogic: t7: Add cooling cells to all CPUs
      arm64: dts: amlogic: t7: Add thermal sensor nodes
      arm64: dts: amlogic: t7: Add thermal zones
      arm64: dts: amlogic: t7: khadas-vim4: Add fan cooling to thermal zones

 .../bindings/thermal/amlogic,thermal.yaml          |  37 +++-
 .../dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts  | 102 +++++++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        | 245 +++++++++++++++++++++
 drivers/firmware/meson/meson_sm.c                  |  29 ++-
 drivers/thermal/amlogic_thermal.c                  |  58 ++++-
 include/linux/firmware/meson/meson_sm.h            |   3 +
 6 files changed, 462 insertions(+), 12 deletions(-)
---
base-commit: f7b64ed948718290209074a50bb0df17e5944873
change-id: 20260410-add-thermal-t7-vim4-00e571badcc1
prerequisite-message-id: <20260326092645.1053261-1-jian.hu@amlogic.com>
prerequisite-patch-id: f03a086b4137158412b2d47b3de793b858de8dde
prerequisite-patch-id: 123970c9b29c2090440f2fd71c85d3c6fd8e36de
prerequisite-patch-id: 3e2e56b0926ba327b520f935df4ced5089bbe503
prerequisite-patch-id: 65a5d76ffdbc9b3aab3385bb65cb027004c30e7e
prerequisite-patch-id: 237269801826dd3ad7fb16eb4d7d6d4eab504278
prerequisite-patch-id: 57e9b08a968aedf543d3d0d56cf1ca4db20b2a16
prerequisite-change-id: 20260326-add-bcm43752-compatible-e264a4f7973a:v2
prerequisite-patch-id: cd98b74fa56af72af2553f391c400981d83cd4f4
prerequisite-patch-id: b730f5e42be1d89d193e63a0265495cdbf2c7d7b
prerequisite-change-id: 20260330-fix-invalid-property-bbe54d933f71:v2
prerequisite-patch-id: 8d675e7a239985c762843515b241f0a2f45f9c92
prerequisite-change-id: 20260331-fix-aml-t7-null-reset-2b608ebf9da4:v1
prerequisite-patch-id: 5b5de77af11747ce964404fb827d2ee2bff47ea5
prerequisite-patch-id: 1e37fc75fed1e533adee0f3e7e6ead1f8ff3c55c
prerequisite-patch-id: 65a5d76ffdbc9b3aab3385bb65cb027004c30e7e
prerequisite-patch-id: 2daf583fb5e7449a02bd217d8aca330171b598aa
prerequisite-patch-id: 237269801826dd3ad7fb16eb4d7d6d4eab504278
prerequisite-patch-id: d1ddf9b7710e91f8062de83bd7ba55afb2c4c112
prerequisite-patch-id: 57e9b08a968aedf543d3d0d56cf1ca4db20b2a16
prerequisite-patch-id: cd98b74fa56af72af2553f391c400981d83cd4f4
prerequisite-patch-id: b730f5e42be1d89d193e63a0265495cdbf2c7d7b
prerequisite-patch-id: 9debd88fa60febed9cd7208f86603b4c2d270520
prerequisite-patch-id: 314ef9ff0c4d1d15dab1dea9d92aa065f1eac3e9
prerequisite-change-id: 20260402-add-mcu-fan-khadas-vim4-ac1cbe553c9b:v2
prerequisite-patch-id: f03a086b4137158412b2d47b3de793b858de8dde
prerequisite-patch-id: 123970c9b29c2090440f2fd71c85d3c6fd8e36de
prerequisite-patch-id: 3e2e56b0926ba327b520f935df4ced5089bbe503
prerequisite-patch-id: 65a5d76ffdbc9b3aab3385bb65cb027004c30e7e
prerequisite-patch-id: 237269801826dd3ad7fb16eb4d7d6d4eab504278
prerequisite-patch-id: 57e9b08a968aedf543d3d0d56cf1ca4db20b2a16
prerequisite-patch-id: cd98b74fa56af72af2553f391c400981d83cd4f4
prerequisite-patch-id: b730f5e42be1d89d193e63a0265495cdbf2c7d7b
prerequisite-patch-id: 8d675e7a239985c762843515b241f0a2f45f9c92
prerequisite-patch-id: 9debd88fa60febed9cd7208f86603b4c2d270520
prerequisite-patch-id: 314ef9ff0c4d1d15dab1dea9d92aa065f1eac3e9
prerequisite-patch-id: 34a2bbfe3ce30c530e69af5083aa26534b2c2560
prerequisite-patch-id: 406f88d7dabd3a870b358fb53c21686f29eb32b7
prerequisite-patch-id: d7a75ae3be0f54e0a7e81ccb0043a2f05423c9d0
prerequisite-patch-id: 5e19dc5ace12b532284246f5c2ff3f214d8a9c4f
prerequisite-patch-id: d6a87ebcf5246eb67b94ca0908afa3df9f9383fe
prerequisite-patch-id: 4809bbedf79f59e1abc52c17cffc0b1bbb43d365
prerequisite-patch-id: c050e8bac4b5491f6c7008a5ccb26f20fad38b46
prerequisite-patch-id: 30677db8fc57270787245103c0d5acf8791307b0

Best regards,
-- 
Ronald Claveau <linux-kernel-dev@aliel.fr>



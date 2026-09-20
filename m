Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CC2C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 10:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=603baMjfvZDDRI01HhGzn2fBvUjZwxELyYM5rjna2d8=; b=O1y7L4oj8m01Y+0jaX1w1VV5mv
	EYHyfH6je1qxamOdh0HYAfWgPWR+9K4sreSNHJNdN/kNX4Qu9UqD1pgst3oHeo1jgk3BXq7Qejm8m
	BXY9mVuN9DvIDCRg8HeYZWqrkuM7OvlQZdCJ03tC1V5Krw/OHGs7RCfupJI2QMexMnllx+Wdc5rbV
	cnswqZzSGGBv8CcZHgQ04mdbZv1Iya7dBDOVBGpCaVQDQL/h+CgTnEMuO4Yo60yIoWiFYRBrYi8eV
	vFRItL8bCbW7bJKcVTAZmF8bdzz91ttbTMvq1cF4T8izktkiiKasSl+PfND0S65rygvQh5so7eFSj
	G7cjI8iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8EjN-0000000HFQy-21Bq;
	Sun, 20 Sep 2026 10:25:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8EjL-0000000HFOq-3Bi6;
	Sun, 20 Sep 2026 10:25:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D56B434C1;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0059AC2BCB3;
	Sun, 20 Sep 2026 10:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789899907;
	bh=FTANwXrpGcZhLdDebjS70tAHx07labgED5H/7r+H0Dk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=QC2XbdKn4vjeXGC6hrvhDOG/77Ji/5orNxkqfu5sQPNEHXNuL1joZVhwl0SmHDGfK
	 CKV8fWnHXyZ89ygPaQfmLi2NdJPJTltnddHqICPN4KN34CEpUo2uyIjP0uOo7CuYj+
	 nH2Yp3JqiTDiQ6AODxygUo/CBSaPg2IQ3OzyhZxSvhOTI6JEYgSZ1eEC4y5TRgHZmc
	 vQM4ODR+qvJ9OZZIckrJqIFZAudnz4uvHoxCA/3wyErcVby3vpXG81nGTBHNdbkuOs
	 3o4xCLLizufjWEU/tkkYehy08JJg6JtaNbod/tWfBOdACd1wGQdTw+gsiJ4gCx9cPX
	 LwZAd3ezrXahg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0624C982DA;
	Sun, 20 Sep 2026 10:25:06 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH v2 00/12] soc: amlogic: clk-measure: Add support for more
 SoCs
Date: Sun, 20 Sep 2026 18:25:02 +0800
Message-Id: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH60r2oC/4WNQQ6CMBBFr0K6dkzbaKWuvIchptYBGilDOkA0h
 Ltb8QAu3//Je4tgTAFZnItFJJwDB+oz6F0hfOv6BiE8MgsttZEnJSFSQmDyDCMBT8NAaQTfPW8
 RHU/586U2denuFk0psmZIWIfXlrhWmdvAI6X3VpzVd/3JrVL/5bMCCfYgURvr3FHXFxc7aoLfe
 4qiWtf1A4kYWQ/SAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789899904; l=3172;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=FTANwXrpGcZhLdDebjS70tAHx07labgED5H/7r+H0Dk=;
 b=+lRg6PWFN2RLQCPiESGgdpZI0F2zHAa+dnqwUIn55GLENxdSIr9ertnmnl6ayM1Zywp64iIZi
 cdDCwKjniePC2pBsoZFpw2s+V8P3ZZYlVgG3W5qy48xWxHfwigx8Hae
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patch series adds clk-measure support for the Amlogic A5, A4, S7,
S7D, S6 and A9 SoCs, listed in the order of their release.

The clock names for the clk-measure channels are kept consistent with
those used by the clock driver as much as possible, making it easier to
identify the relationship between the clk-measure channels and the
corresponding clocks in the clock driver.

This patchset also includes an additional patch to optimize memory usage:
  - soc: amlogic: clk-measure: Optimize CLK_MSR_ID to reduce memory usage

To avoid requiring everyone to spend additional effort on a separate
patchset, I have included it in this series. Please feel free to point
out if this is not appropriate for this series.

To improve maintainability, this patchset also includes a patch to reorder
the dt-binding and the compatible entries in the driver.

To minimize unrelated changes, the existing clk-measure channel tables in
the driver are left in their original order. The tables for the newly
supported SoCs are ordered alphabetically.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
Changes in v2:
- Reorder the dt-binding and the compatible entries in the driver
  alphabetically.
- Order the clk-measure channel tables for the newly supported SoCs
  alphabetically.
- Add the const qualifier to the A9 clk-measure channel table.
- Rename "exit_Tsin_B_CLK_IN" to "ext_Tsin_B_CLK_IN" in the A9 clk-measure
  channel table.
- Link to v1: https://lore.kernel.org/r/20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com

---
Chuan Liu (12):
      dt-bindings: soc: amlogic: Reordering compatible of clk-measure
      dt-bindings: soc: amlogic: Add clk-measure compatible to support more SoCs
      soc: amlogic: clk-measure: Support more measurement channels
      soc: amlogic: clk-measure: Align compatible entries with DT bindings
      soc: amlogic: clk-measure: Add support for more SoCs
      soc: amlogic: clk-measure: Optimize CLK_MSR_ID to reduce memory usage
      arm64: dts: amlogic: a5: Add clk-measure controller node
      arm64: dts: amlogic: a4: Add clk-measure controller node
      arm64: dts: amlogic: s7: Add clk-measure controller node
      arm64: dts: amlogic: s7d: Add clk-measure controller node
      arm64: dts: amlogic: s6: Add clk-measure controller node
      arm64: dts: amlogic: a9: Add clk-measure controller node

 .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  |  16 +-
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |   5 +
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi        |   5 +
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi        |   5 +
 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi        |   5 +
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi        |   5 +
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi       |   5 +
 drivers/soc/amlogic/meson-clk-measure.c            | 927 ++++++++++++++++++++-
 8 files changed, 953 insertions(+), 20 deletions(-)
---
base-commit: a2530c83c458a503e55219966217dfd1c36a385e
change-id: 20260710-more-socs-to-support-clk_measure-c826f8ab9e68

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>




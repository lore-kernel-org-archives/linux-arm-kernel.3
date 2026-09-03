Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDB1C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 05:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qPPXlXUl0agOqmkkn95EDQazig5NXSL1SLcSu764JXk=; b=N2A04ia6S9mIkAZ+ea8d7yYLRf
	WpFkr1Z+wgUhuTLLCxkf0XZrE+dD+2IpYiqCHfCl7wCuc/J7DGZXnNqqOxpsTi09v3RlLrgooP3Uc
	CRVf4BNEowZScZtV87jHOod74Hr4ZLi6prGkSLtARfqdkiat4lGP6rF4keBgs7jMt8Rqb0ROWLMKV
	QN2QXag7ZfZSt2FrckVmBD3cxa5d/lpiZCdIcabVljNuC0P01+xffR3BYHhov1Ilho7V8t/vcUXrM
	um28dfJ4keNd9fNFcIb8eXW5BpT92M0yY4rjws7A/IVM/c5UQI4/tahbBDxlgB5xXQ4Txx2VBQwmD
	E8erPMGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zuZ-0000000GO1w-2qSX;
	Thu, 03 Sep 2026 05:22:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1zuY-0000000GO1Z-1JW3;
	Thu, 03 Sep 2026 05:22:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A14A540539;
	Thu,  3 Sep 2026 05:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 626D2C2BCB8;
	Thu,  3 Sep 2026 05:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788412973;
	bh=O6vuoKCQoHoG2GbnoVIEO+PufAG+OYfaUyXLJ2wdgLk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=DpO8MuWw2IvvfecBbQi6GXgQdmz5tBwa3Ti+2m2ENff9zEdS1TO692juiIL1ryiBz
	 fZqqZk+sexvsMzGh3FQscBTGAAokKEoNG5qsqmQ6wsPdBeWB7EH7kZuRyqZpQbuXJ7
	 2yPPYg9y1HLX/C9Aeitx4lkQxMWJ+M9rPPk8Z+6qHtWNhOu6ZnUsIXF7gSnLGe/RdZ
	 9FQ+H7yfbyWbt5b+gwwk5CYhi8ABkJUdsTpAEVv0iHqNrI7zVaLsDkEtT0fsBAVsHg
	 +vQTyBIP8bIjm0MwZhz6dhQpnCaeImgKAQKSjc+lSG9ApqZ+naA+N83uXsqYQDW3Gg
	 FTEniLLsc0nYQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F2A0C624D4;
	Thu,  3 Sep 2026 05:22:53 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v3 0/2] ir: support IR for Amlogic A9 SoC
Date: Thu, 03 Sep 2026 05:22:43 +0000
Message-Id: <20260903-a9-ir-v3-0-cd471c667c15@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACMEmWoC/12MwQrCMBAFf6Xs2UiyrUnryf8QDzFN2gXbSCJBK
 f13k4KgHufxZhaINpCNcKwWCDZRJD9nqHcVmFHPg2XUZwbkKLnikumOUWD1oXFX7JRVQkL+3oN
 19Nw650vmkeLDh9eWTaKs/4UkGGeN4y0a3WrtxElPNz+Q2Rs/QWkk/Pa6j4fFQ4OiV1o6Z369d
 V3fqVH4+9QAAAA=
X-Change-ID: 20260706-a9-ir-354fb297e716
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788412970; l=1103;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=O6vuoKCQoHoG2GbnoVIEO+PufAG+OYfaUyXLJ2wdgLk=;
 b=ek1RQor0splhjxeQQVFAs1R0OdVSOoTglk2DuhmtTqu//HDjzRs9I1bYUYA00XWTiRCM1e3ES
 Q5CSKHqRZAsDT08TVSsVam3GyxlUonGeEaf0rdbbyoyunzbKgPuMgcU
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Document the Amlogic A9 IR controller compatible string and
add the IR controller node for the Amlogic A9 SoC.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v3:
- Align the node of group-remote-input-ao-pins.
- Link to v2: https://lore.kernel.org/r/20260709-a9-ir-v2-0-42c21d7a6ffc@amlogic.com

Changes in v2:
- Rename the IR input pinctrl group and its phandle from remote_pins to remote_input_ao_pins.
- Link to v1: https://lore.kernel.org/r/20260706-a9-ir-v1-0-4f082ca8aaf1@amlogic.com

---
Xianwei Zhao (2):
      dt-bindings: media: meson6-ir: Add Amlogic A9 IR compatible
      arm64: dts: amlogic: a9: Add IR controller support

 .../devicetree/bindings/media/amlogic,meson6-ir.yaml       |  4 ++++
 arch/arm64/boot/dts/amlogic/amlogic-a9-a311y3-by401.dts    |  6 ++++++
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi                | 14 ++++++++++++++
 3 files changed, 24 insertions(+)
---
base-commit: 4336e970ec6890fbd424128c352564a9c1dd514a
change-id: 20260706-a9-ir-354fb297e716

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>




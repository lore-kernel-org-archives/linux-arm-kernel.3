Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F53E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 18:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z9LWMuJlJ5Hr5Z/Q94o+27RR4GZqrQH5qcOc6EkUsEU=; b=p7NrtfUMc1bKE+g3r3hg5lt4Ku
	HSA64R33rpFXwxL2wZFdOieLVzgI25XlkclsHTZCs4ZFIL/gvfSqLQfFwhn8kYcOXhr5NO1MvBI8a
	1T8a77DEnyxhuZnfPYKQSFmllc/fk7kIx0gOqpMA5rbWf5n3aoYkQxGrlIirvtG1aP/oDPX+uVuoQ
	k7gvnQuH2mh1Bu4URqBV6QNZO0NqN6DfHaNidmN3Eabwb9RwtlDqikunK2JRwFFYWfg+3s49jyXKO
	K32VZiwJCfnD3p53IKQwRd7UlWA+aR4RR96dU+y/6yPCPu95KciaBiXeVD0L680lkGDPsI2ai8VAL
	+osKU1Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX2wc-00000003HMu-1Khn;
	Sun, 12 Jan 2025 18:44:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX2u7-00000003Gfu-46zD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 18:41:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8B2E25C4076;
	Sun, 12 Jan 2025 18:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1089AC4CEDF;
	Sun, 12 Jan 2025 18:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736707302;
	bh=wdB68K3PeDbVcgvoTbIYxQc+n0FBFJF0guSndtGbyFQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=mnzWlF9th1vklk/l3qj/a5bxD0PGwevQrvdX9A115AVFzwHvegQTzQAyVB9tUz1So
	 dRHePJ7f7V9PP/5HoYsBWZIDpN8ryAYLgDO0yELKnvPCEgK9gT2FVSxq2gFfmjh1HO
	 NRdiXd9MNBYdt5mObMWcxJvlp6yk7BKXDqjaMayEWlRSQbCPpTfTZGIlT27i9qG7p4
	 d+ibhEcgdRNvkJzzaDhI3An1OMPFyh40JS5KWxM/mrNcvRXNN/MhN9OTNRAf2mxdyr
	 zsqH46vKhypOgKi0SlbTR3JzZsk/VtbCfqYmbUMIShK0BIMTPlo9JEbyT3jpY4KtOL
	 5MfCdL3I46xbA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF2B9E77188;
	Sun, 12 Jan 2025 18:41:41 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH v3 0/4] Driver for Apple Z2 touchscreens.
Date: Sun, 12 Jan 2025 19:41:31 +0100
Message-Id: <20250112-z2-v3-0-5c0e555d3df1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANsMhGcC/03Myw6CMBCF4Vchs7amM5SLrnwP4wKGApPIJa1pV
 MK7W0hMWP6T+c4C3jqxHq7JAs4G8TKNMdJTAtxXY2eVNLGBNBlEMupLijVSnVFpK91AfJydbeW
 9j9wfsXvxr8l99s2A2/XP840HVFqxSdkw56R1c+uGSp5nngbYeKAjKXdCkRQ5c3ap6xaxOJJ1X
 X+r/8sNxwAAAA==
X-Change-ID: 20241124-z2-c012b528ea0d
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Neal Gompa <neal@gompa.dev>, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736707300; l=2125;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=wdB68K3PeDbVcgvoTbIYxQc+n0FBFJF0guSndtGbyFQ=;
 b=dEUdX/RvzmYoZfDfumTur7xk31yF9c5dQuFoa97mpRXNIUQ6r1Ov8oBqjYqTlJWATxkTvu3PO
 G6uXmoYVayQBkeAR8QVXnMn96yA0Cf7a+InmBZ91xpIPJzr+/UB7oU6
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_104144_112698_BFFAA7E0 
X-CRM114-Status: GOOD (  12.40  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi.

This series adds support for Apple touchscreens using the Z2 protocol.
Those are used as the primary touchscreen on mobile Apple devices, and for the
touchbar on laptops using the M-series chips. (T1/T2 laptops have a coprocessor
in charge of speaking Z2 to the touchbar).

Originally sent as a RFC at https://lore.kernel.org/all/20230223-z2-for-ml-v1-0-028f2b85dc15@gmail.com/
The changes since then mostly address the review feedback, but also
add another machine that has this specific controller.

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
Changes in v3:
- Tx/Rx buffers used in interrupt handler are now allocated in probe and reused
- Other various style fixes
- Link to v2: https://lore.kernel.org/r/20241128-z2-v2-0-76cc59bbf117@gmail.com

Changes in v2:
- In a separate patch, fixed an issue that prevented the SPI controller
  from using GPIO CS, and as such, moved the hardware quirk to there
- Went back to uploading the firmware in probe() instad of open()
- Other changes addressing the review feedback
- Link to v1: https://lore.kernel.org/r/20241126-z2-v1-0-c43c4cc6200d@gmail.com

---
Sasha Finkelstein (4):
      dt-bindings: input: touchscreen: Add Z2 controller
      input: apple_z2: Add a driver for Apple Z2 touchscreens
      arm64: dts: apple: Add touchbar digitizer nodes
      MAINTAINERS: Add entries for Apple Z2 touchscreen driver

 .../input/touchscreen/apple,z2-multitouch.yaml     |  70 ++++
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/apple/t8103-j293.dts           |  27 ++
 arch/arm64/boot/dts/apple/t8103.dtsi               |  19 +
 arch/arm64/boot/dts/apple/t8112-j493.dts           |  23 +
 arch/arm64/boot/dts/apple/t8112.dtsi               |  14 +
 drivers/input/touchscreen/Kconfig                  |  13 +
 drivers/input/touchscreen/Makefile                 |   1 +
 drivers/input/touchscreen/apple_z2.c               | 463 +++++++++++++++++++++
 9 files changed, 632 insertions(+)
---
base-commit: b62cef9a5c673f1b8083159f5dc03c1c5daced2f
change-id: 20241124-z2-c012b528ea0d




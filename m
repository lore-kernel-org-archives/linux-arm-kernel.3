Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF796C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 11:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ona4KbVdyi9A86IicpJQ6V4nZMC8ZLL3QUiXntSbvcs=; b=4XxcqkNugM6cyeAP66Dbp47Ncx
	/qjF8G+0uvzOJvjzbAR2O4EgJWvjbblhF1+LvKzsbQOLrf+Y8ikMBiWFdICb9Gg4irbIPXFa+XZ2r
	qWwOGJ/1uFvVdNSUFzpCnxsphuXg39QkjMk9cqFCfrHmFvyyejE1X0OM/Sn6P/GixpOeXmODdCx2M
	rU6JjVrZ2fSLftEUu76Im7HU0CJyQEMmbB7StwTnE3kVMUfrtsGRwkNY3GS6hYCDJfKQcl8TEmICi
	oYUNhXv6z9nnMMfnsOcnzg0JayFdPN3Yww23sSGitJZyvT8E+C5jYaFpxrgQF82yQKMVIbaDO+QVR
	y6LhaM1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzad-00000004MWt-01LD;
	Mon, 17 Feb 2025 11:47:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzSC-00000004Kme-12jF
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Feb 2025 11:38:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Sender:Content-ID:Content-Description:In-Reply-To:References;
	bh=Ona4KbVdyi9A86IicpJQ6V4nZMC8ZLL3QUiXntSbvcs=; b=FpW98KaJ/sRI5apt9YUhKiZ8ms
	2V/nO43KWs3+WDB7mrB24gCSuA5ESnx8+LCKdaZX0xztvLsaui0Y0bgnCc84uqOprvscZo8frIqWY
	UQS6o0V9ijlCBbewX0GySMGeSEyA/lgCKzASYhQv5Q4aTjN17pvKpetbEj2oSwzp/79QFQCeDeOzL
	R1Rrz4U7CZF2UoaKpA3/au2fYBXC5zxlrF1z9iYwev9/FzDZe5q0lT8jquEePWTcRry/TTDby1XpN
	ImoxSOayM9YnROx9si7tspq/q4vnDF9w5h/Uss7O04UhI0z1MAiXI7nb8mBUKrr5Efu29tk3/GaBY
	0vDfgYLQ==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzS7-00000001nmb-2eUg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 11:38:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 439CBA4115F;
	Mon, 17 Feb 2025 11:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D10C3C4CED1;
	Mon, 17 Feb 2025 11:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739792295;
	bh=EJ5uj+Lo5BxDKmeBIn1FiPC18dDjdUmxMUU2i+B+sco=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uebqjMOOJzAM2WdlGVHHaSSosbNrSzXA6unJWp47hJ2AT+5ywEi0Mz8wIEP4JJ7tr
	 3eZ1SCiEM1rRkeD+wFRz19HLixv2IL29psSYdGX7kCVx+39IerzxKXw4mSpnm61f9L
	 1Jzooh3N8D8fwp7t3Q6PorjFzZnp+3Btcku6GVDbG01N3czxAi2a7Dr314DBE96PVO
	 Emj07be8F6pbPIZRaVCYoPyPKcd0qr+BicC3Apq0HVkWaueea4/ELAEdKDCWG+OiOg
	 C1Fdi8dUXzGl/+Bj+LPbrMK3+mSqDamjYN4n88eN7TLci/R2CuW5Iy6ptv6Uu+poPp
	 01ncB68JovdHQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDCA5C021A0;
	Mon, 17 Feb 2025 11:38:15 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH RESEND v6 0/4] Driver for Apple Z2 touchscreens.
Date: Mon, 17 Feb 2025 12:38:00 +0100
Message-Id: <20250217-z2-v6-0-c2115d6e5a8f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739792294; l=2640;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=EJ5uj+Lo5BxDKmeBIn1FiPC18dDjdUmxMUU2i+B+sco=;
 b=vwT0A6gkRH+Zl2/0CowLCLL+90Jxenq829Gs/+O0oAU3C+lsBUwoT/vLs+g93OYXbLJ5rOLz4
 n4dwit1+eC7Cb9YjC7CeL9B5B7deDtzj06OzMD+nxl1PYCFhcQpHCvv
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_113820_014063_D770D230 
X-CRM114-Status: GOOD (  12.10  )
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
Changes in v6:
- Went back to build_cal_blob returning an allocated buffer, other fixes.
- Link to v5: https://lore.kernel.org/r/20250118-z2-v5-0-6d38b2582169@gmail.com

Changes in v5:
- Added missing \ns, removed 4kb-ish of wasted ram
- Link to v4: https://lore.kernel.org/r/20250115-z2-v4-0-d7361ab16ba0@gmail.com

Changes in v4:
- Dropped another allocation, other fixes.
- Link to v3: https://lore.kernel.org/r/20250112-z2-v3-0-5c0e555d3df1@gmail.com

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

 .../input/touchscreen/apple,z2-multitouch.yaml     |  70 +++
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/apple/t8103-j293.dts           |  27 ++
 arch/arm64/boot/dts/apple/t8103.dtsi               |  19 +
 arch/arm64/boot/dts/apple/t8112-j493.dts           |  23 +
 arch/arm64/boot/dts/apple/t8112.dtsi               |  14 +
 drivers/input/touchscreen/Kconfig                  |  13 +
 drivers/input/touchscreen/Makefile                 |   1 +
 drivers/input/touchscreen/apple_z2.c               | 473 +++++++++++++++++++++
 9 files changed, 642 insertions(+)
---
base-commit: b62cef9a5c673f1b8083159f5dc03c1c5daced2f
change-id: 20241124-z2-c012b528ea0d
-- 
Sasha Finkelstein <fnkl.kernel@gmail.com>




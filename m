Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE7ED715F4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 20:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VLtsfvtAExJ8gPzWsvbfNFF7/IyLPrl6dD5b2cjpN+Y=; b=oR1bMs0cjSj2dK
	WtOnbFB8TtgJy++w9JPQ5icxFwd/F0JPaBlPTU1UPxjrKLZjyD3LYEwsAsWSRTIPqf52s6TYciQ2Y
	JNJvCRUIFTe+99454JKmQG2PihLUI2ZTmUrnbKsDE25qrwwjdRKk7F2lVaYG80CWxDHaSthQC1UD3
	+365YVObZitwd4XBrCOSXCnQHwNqYOM6mgdMo36x9xlufXaSTvaO7CzkJ0UInzr/AWNaus1zf2Q1G
	r04PpSRLnKEhRX72BT9yo8lqpxONecd0Ul2DBkujZxwAl/FcExEeI1OP13AMBQRb146f5u0opH1UV
	ws90Nk3gO7RAnHpn368A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjjv0-0000000AUrP-0xNu;
	Sat, 24 Jan 2026 20:07:38 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjjux-0000000AUqc-1ov6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 20:07:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4822227D14;
	Sat, 24 Jan 2026 21:07:30 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id opSmFgaHfVSO; Sat, 24 Jan 2026 21:07:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1769285249; bh=Yr5xNK0ZgmkOiDQM7wC1rXrKDc/tR8QPckZsm1KNIno=;
	h=From:Subject:Date:To:Cc;
	b=grI4do/g79jcoEyadKxUXYWIPkMn0jDuLNmq+XQfV08kb1LEdHwAbUBngQFNI7l/l
	 hY912b3B7gROSWPYz8Xqnx3K7hCtyl3B1ee6RemBSvXsqnyj3juy4XwDiO/hcuDvG7
	 DCiNaEcQtbz7G9DvSBFM9T0sBRP3dop5UP+d8zzd4vqHZxXmiifvUTjzaSoUzjJHsz
	 limPVoN9BiXPsCB9E1opQ82XZ/GCoXmZ5GUnGpPOjOpNtxxpWDTrr3CUHCUQ3Nhoyi
	 quXg1w/o9DXgf2qUGntxFQRNjhET1k4Vj7lU+rLs8RQL/Golm5pIZ797793+YadhcP
	 hz81iSioyfRTw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/2] Add device tree for Samsung Galaxy J7 (2016)
Date: Sun, 25 Jan 2026 01:35:25 +0530
Message-Id: <20260125-exynos7870-j7xelte-v1-0-5cacc3042c42@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAUmdWkC/x3MQQqAIBBA0avErBOmAdO6SrSQmmoiLDTCiO6et
 HyL/x+IHIQjtMUDgS+JsvuMqixgWJyfWcmYDYRUY0Vacbr9Ho01qFaTeDtZ1a5BGrW1iA3k8Ag
 8SfqnXf++HzvCNBtkAAAA
X-Change-ID: 20260125-exynos7870-j7xelte-6a902d588009
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Rayan Marzouk <rayanmarzouk743@gmail.com>, 
 bluebunny <kalorin.bok084@passinbox.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260124_120735_906838_3342343E 
X-CRM114-Status: UNSURE (   8.64  )
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

This series introduces the device tree for a new Samsung Exynos 7870
device – Samsung Galaxy J7 (2016).

I have acquired permission from the authors of this patch to upstream
this on their behalf.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Kaustabh Chakraborty (1):
      dt-bindings: arm: samsung: add compatible for samsung-j7xelte

Rayan Marzouk (1):
      arm64: dts: exynos: add initial support for Samsung Galaxy J7 (2016)

 .../bindings/arm/samsung/samsung-boards.yaml       |   1 +
 arch/arm64/boot/dts/exynos/Makefile                |   1 +
 arch/arm64/boot/dts/exynos/exynos7870-j7xelte.dts  | 497 +++++++++++++++++++++
 3 files changed, 499 insertions(+)
---
base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
change-id: 20260125-exynos7870-j7xelte-6a902d588009

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>



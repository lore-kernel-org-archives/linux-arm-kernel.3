Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B049C44501
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 21:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PxOheComZsT6yxnkUvSnvmdiUDv7GpiTTASR486Q+Ko=; b=EOEnyq4yHJedU148wNrJV18O/z
	8RZaV3h20XfBNjDYbs1GjugWdoIL7G0lzQUvxnjZtpYOWFd1hbrnTIFtXole8wamD+am8GuY9AWua
	4D/emHSX1pTRVlByiWzb106XjqPJ/gR8Oj5Pyv/6RHi4TXeSkTpOEwfwfNhPDxnsuY4GZllz/S5pc
	s438Gc5tSkRNw1YGGz3G2Z6BLYORhkD+LelwVNxCbgzDBWpmmDis6dzyJAZ5uV+2oQLIx3bv9BjeX
	oImC/ori5qKJ4nYgfn9OhpZniRtQitgu+wyJbL/LJJUxeoj3M7HiIv99t3xoixiEJGRv6y/LdqSL6
	V4mZ1QLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wieph-00000006t0U-1yWn;
	Sat, 11 Jul 2026 21:01:57 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiepe-00000006syp-2MWg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 21:01:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 17FF6119847;
	Sat, 11 Jul 2026 23:01:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1783803709; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=PxOheComZsT6yxnkUvSnvmdiUDv7GpiTTASR486Q+Ko=;
	b=ZGujiJqR+iMIpvYV6aLG0wtsmR4mSSle4HsUHt63FFCrKFzLt6F8NQyRhWR9Ckx49tFkwZ
	nQqWcr0HNqI/divQFP2crS9XkXAExBw18sYM6qRf9Ghne7fvcdLY3Yj2xmKsYg6g+TOVLi
	VxXaxewRYVlDgf3a+V+3/f87sO0t0nnoYNfXX9tyGfAeKd35HaPkvuMHBJf5VGHUUMFo37
	N2BNPIfbEjtN2Q3eMjSjhaYlYI+8Cl8oXcdyeCaW/1kfmFslzQXiFBiLk8JxmA7SLLl22g
	Z0DmvBxmFpQehs4n0g9tnxRWUcMv8VQ8kCsimm20k/d/5FlJUY5cyT77g5fxFQ==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 03/10] arm64: dts: st: Fix SDMMC1 indent on stm32mp231
Date: Sat, 11 Jul 2026 22:59:32 +0200
Message-ID: <20260711210131.236025-4-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711210131.236025-1-marex@nabladev.com>
References: <20260711210131.236025-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_140154_820864_69C00F61 
X-CRM114-Status: UNSURE (   9.67  )
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

Drop bogus space. No functional change.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 9e1d240888ff2..a9de9fc5eb411 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -720,7 +720,7 @@ sdmmc1: mmc@48220000 {
 				reg = <0x48220000 0x400>, <0x44230400 0x8>;
 				arm,primecell-periphid = <0x00353180>;
 				interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&rcc CK_KER_SDMMC1 >;
+				clocks = <&rcc CK_KER_SDMMC1>;
 				clock-names = "apb_pclk";
 				resets = <&rcc SDMMC1_R>;
 				cap-sd-highspeed;
-- 
2.53.0



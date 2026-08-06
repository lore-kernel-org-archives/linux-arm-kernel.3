Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE84C5AC79
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 09:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7M4cyM5SsNk4vqLz6cY9kyDwqfWb0dX29kFOm67A69k=; b=zyhws2IkbPWJxEW108mUNGXKOw
	qB/bFT7IESVXcd1Jl2pYUcJdCMOZlmDCPwGqr1tPaVhtBLA8qct56xrLxtx7Oo0LbcOsZXdEqdUmA
	koFcjXZRfnPqNvtJX/P4yR2UQaQfKgHhRQRW8oBShn+ENW0j72y42SNXlx/Gc6VnTtGhJ+9d0GroV
	nbB16oaP57J83AlhszzZkZJOPV6bZscH24M4tqQE7kmj2oiyz3W8SVX9xbLRNSSCJQy+rlR8fuw8h
	zes2ee4Ji5Yqg+9lmRNfLq1+YGNhYQwwJ4fjTVv7I05rs+S07JFFxzF0QVZhyVrdrI2bv3DI5uT0/
	o6W+3Llg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruUl-00000005OUR-2nxf;
	Thu, 06 Aug 2026 09:34:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wruUd-00000005OMm-2ugz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 09:34:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 347DC43FE9;
	Thu,  6 Aug 2026 09:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 131F6C2BCF7;
	Thu,  6 Aug 2026 09:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786008867;
	bh=Z2E9zTsEDJP0zeF+i+JgJFiaNg9dXXSm8HlaEi6y/IU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pdizhPxXUuHxGuXeSg4WLxPTMGebF0ymR/rm8GvYX8qlfK1JffTAeIQaJ+igQqnfB
	 IaF/JuPBQMzqM2dldTLMPfjxo5L6Cwo2Zfqf8KJIV07vLFk3Y7nQbZ34g1z6udA67w
	 7e55vdo10X++1r21fxwabRtkis9BSqCNkiB+lbMy4VFfRYVK6mFegu98WfnmL7YKuY
	 KibHJljxl02Cf1uSoVR4RhT18IhIBiQnSLyxQjpEwaA9kMGXg07FtpMJ3McOUt6xlf
	 RmktpVeGZelocXSvVTy2+KDo7bOLf/YqQlICu26CnDQylTkqX8VTpuaJQ/B9CiVcuA
	 zdWb06iA4d67w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F24CAC5AC67;
	Thu,  6 Aug 2026 09:34:26 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 06 Aug 2026 17:34:18 +0800
Subject: [PATCH v2 10/10] MAINTAINERS: add ARM/AMBARELLA SoC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-longzhao-upstream-cv75-v2-v2-10-6b09707c5fe9@ambarella.com>
References: <20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com>
In-Reply-To: <20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, 
 soc@lists.linux.dev, Long Zhao <longzhao@ambarella.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786008863; l=1365;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=xx2F3xyEKnw6VoTF4kbTyKftrweRLyCy3Ck5hCpXsBs=;
 b=CYPiCCAYitDcu2nNmIqOUgU1M2v+u8yv6F5uq4RplmWynENMCpHv/8g2l3sZp2Jv6N1l+oF7H
 feJngjTBpAUDjsRTFuGGf14U9pSIDGhGLTCCQWqtln7EUtZQ8fI/oNM
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
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
Reply-To: longzhao@ambarella.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Long Zhao <longzhao@ambarella.com>

Add a maintainer entry covering Ambarella CV75 bindings, drivers
and device trees.

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 MAINTAINERS | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 803b60ad628f..c06c84fab57a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2502,6 +2502,23 @@ F:	drivers/clocksource/asm9260_timer.c
 F:	drivers/rtc/rtc-asm9260.c
 F:	drivers/watchdog/asm9260_wdt.c
 
+ARM/AMBARELLA SOC SUPPORT
+M:	Long Zhao <longzhao@ambarella.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	devicetree@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/ambarella.yaml
+F:	Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml
+F:	Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.yaml
+F:	Documentation/devicetree/bindings/serial/ambarella,cv75-uart.yaml
+F:	Documentation/devicetree/bindings/soc/ambarella/
+F:	arch/arm64/boot/dts/ambarella/
+F:	drivers/clk/ambarella/
+F:	drivers/pinctrl/pinctrl-ambarella*
+F:	drivers/tty/serial/ambarella_uart.c
+F:	include/dt-bindings/clock/ambarella,cv75-clock.h
+N:	ambarella
+
 ARM/AMD PENSANDO ARM64 ARCHITECTURE
 M:	Brad Larson <blarson@amd.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.34.1




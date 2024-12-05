Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD08DE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gm9+OqId7pzqeHr+RCfeC7J43UjBvfhH8Qpn0i2IQN8=; b=C5GeVrHJxJA4pLblw18vmRtJYm
	iBp/SzEYZLo+BPPqbuTZeAGvRqxx1AFRZ4ozU94Rt5zZ4s5X/QZU1P7ADkZaKDCsjsSv6OZYcL+pg
	ENB5KPAPUjPIIBZdrQkCzfu+vCOLJETpYWOdqDrbhXHxTQRaTmlCs6CKE4J9hLx0eBanQ1NbShdal
	JX1E2Ko2wfhC0QJdtXxn3LRuki8Dq0b41gj5kFjBRo277o3QUNjoSwHMmvxwcP5hElyoB5/R0Mrni
	4tJkKqyWZJ1oCHf6Ld2QGh30K7BcvA6t8pCvWM3j7uRt8nj794yeKh5lo25XLkXEYZqbGoMAJL84W
	JnsUxjTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBOk-0000000G26V-1oq1;
	Thu, 05 Dec 2024 12:56:02 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBMi-0000000G1jr-3hSC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 12:53:58 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b16a:6561:fa1:2b32])
	by laurent.telenet-ops.be with cmsmtp
	id l0tt2D0083EEtj2010ttVM; Thu, 05 Dec 2024 13:53:53 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tJBMe-000LOh-BU;
	Thu, 05 Dec 2024 13:53:53 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tJBMf-00EQDQ-2T;
	Thu, 05 Dec 2024 13:53:53 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] arm64: dts: renesas: white-hawk-single: Add R-Car Sound support
Date: Thu,  5 Dec 2024 13:53:49 +0100
Message-Id: <7c840b6e08e0af8a6b9bd5516969eb585f16e10a.1733402907.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733402907.git.geert+renesas@glider.be>
References: <cover.1733402907.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_045357_062906_CAA6364E 
X-CRM114-Status: GOOD (  10.44  )
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

White Hawk Single boards can use the same ARD-AUDIO-DA7212 external
audio board as the White Hawk board stack.  Add support for building
DTBs for them, and document the small differences in connector labels.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/Makefile                       | 4 ++++
 .../boot/dts/renesas/white-hawk-ard-audio-da7212.dtso      | 7 ++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index dea812ba55f3132e..68031d0f28fb2a54 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -91,8 +91,12 @@ r8a779g0-white-hawk-ard-audio-da7212-dtbs := r8a779g0-white-hawk.dtb white-hawk-
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk-ard-audio-da7212.dtb
 
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g2-white-hawk-single.dtb
+r8a779g2-white-hawk-single-ard-audio-da7212-dtbs := r8a779g2-white-hawk-single.dtb white-hawk-ard-audio-da7212.dtbo
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g2-white-hawk-single-ard-audio-da7212.dtb
 
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-white-hawk-single.dtb
+r8a779g3-white-hawk-single-ard-audio-da7212-dtbs := r8a779g3-white-hawk-single.dtb white-hawk-ard-audio-da7212.dtbo
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-white-hawk-single-ard-audio-da7212.dtb
 
 dtb-$(CONFIG_ARCH_R8A779H0) += r8a779h0-gray-hawk-single.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/white-hawk-ard-audio-da7212.dtso b/arch/arm64/boot/dts/renesas/white-hawk-ard-audio-da7212.dtso
index e6cf304c77ee9225..1308a35561365f51 100644
--- a/arch/arm64/boot/dts/renesas/white-hawk-ard-audio-da7212.dtso
+++ b/arch/arm64/boot/dts/renesas/white-hawk-ard-audio-da7212.dtso
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the White Hawk board with ARD-AUDIO-DA7212 Board
+ * Device Tree Source for the White Hawk (Single) board with ARD-AUDIO-DA7212
+ * Board
  *
  * You can find and buy "ARD-AUDIO-DA7212" at Digi-Key
  *
@@ -27,12 +28,12 @@
  * +----------------------------+
  * |Breakout board		|
  * |				|	+---------------+
- * |CN34 (I2C CN)		|	|J1		|
+ * |CN(30)34 (I2C CN)		|	|J1		|
  * |	I2C0_SCL	   pin3 |<----->| pin20 SCL	|
  * |	I2C0_SDA	   pin5 |<----->| pin18 SDA	|
  * |				|	+---------------+
  * |				|	+-----------------------+
- * |CN4 (Power)		        |	|J7			|
+ * |CN(300)4 (Power)	        |	|J7			|
  * |	3v3 (v)		   pin9 |<----->| pin4  / pin8  3.3v	|
  * |	GND (v)	    pin3 / pin4 |<----->| pin12 / pin14 GND	|
  * +----------------------------+	+-----------------------+
-- 
2.34.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE26C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 16:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+GikJuas7LhU6ZR5iCGwdBTKzeW7DKTxvDWyoD0o/2k=; b=KDrowCOobwRpJndXulasH+5xXD
	ccLE3qy2oftuCnUmrkwi4xyhfTSgMZFlDc8B5mw1HazzzXa4KlRoI0maBUpvYZrgK1ForNNvDwHxM
	QTWi53akxHTwCD91lILzVzHJ+uEUt6t1UQ6n2/H/l6s+vzHjaFUPZ5eXH1XfRQI6bUo746kvprLK6
	GJ7JiknhrT+oi44J3Zgkm3lGlMTQnCRVnqlmBYckClgrsCRYzMProbNtSZ2299XJGmkYmX6Y0lqhi
	8i3QWD5MDAoyP7/WzNXeDqtCzRMyuyfsopAJU7SOu0epPQR+weeGtr7/H+VxgSgWw2UTFIxD4ler9
	nYtS12DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmCtK-00000009qV0-1iUW;
	Tue, 21 Jul 2026 16:00:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmCtI-00000009qUi-462M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 16:00:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 71E9C4021F;
	Tue, 21 Jul 2026 16:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8DA31F000E9;
	Tue, 21 Jul 2026 16:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784649620;
	bh=+GikJuas7LhU6ZR5iCGwdBTKzeW7DKTxvDWyoD0o/2k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FtPKAnglfcK3J3DBYpKaDXso4V4P4ep1E3YN2TYQmOk1oKmq3p8WdXarFgQlPa5Wm
	 5fN/x58nM2GfPK/f456yOsePpKCYQGKHbmN8kP/VAxkx3DfTnF1xRYBFPbwOfXOtIe
	 M58G4WGR+lWjZMeJs0xjeFgOSiHPPSNy/TyNGuJU=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>,
	Helge Deller <deller@gmx.de>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 7.1 0602/2077] fbdev/arm: Export acorndata_8x8 font symbol for bootloader
Date: Tue, 21 Jul 2026 17:04:35 +0200
Message-ID: <20260721152607.005716965@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721152552.646164743@linuxfoundation.org>
References: <20260721152552.646164743@linuxfoundation.org>
User-Agent: quilt/0.69
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

7.1-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Helge Deller <deller@gmx.de>

[ Upstream commit 470ea955a18c76eeb10ca11ffcb2fe923bfc5515 ]

The text display code used in the Risc PC kernel image decompression
code uses arch/arm/boot/compressed/font.c, which includes
lib/fonts/font_acorn_8x8.c, which further includes <linux/font.h>.

Since commit 97df8960240a ("lib/fonts: Provide helpers for calculating
glyph pitch and size") <linux/font.h> contains inline functions that
require __do_div64, which is not linked into the ARM kernel
decompressor. This makes Risc PC zImages fail to build.

Resolve this issue by defining the BOOTLOADER symbol and use it to avoid
a static declaration of the acorndata_8x8 symbol. That way it can be
referenced by the arm bootloader, and other static math functions and
symbols (like __do_div64) stay static and don't get unneccesary included
in the ARM kernel bootloader decompressor object file.

Fixes: 97df8960240a ("lib/fonts: Provide helpers for calculating glyph pitch and size")
Reported-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/compressed/Makefile | 2 +-
 lib/fonts/font_acorn_8x8.c        | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
index a159120d1e42e2..e3f550d6285786 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -157,4 +157,4 @@ $(obj)/piggy_data: $(obj)/../Image FORCE
 
 $(obj)/piggy.o: $(obj)/piggy_data
 
-CFLAGS_font.o := -Dstatic=
+CFLAGS_font.o := -DBOOTLOADER
diff --git a/lib/fonts/font_acorn_8x8.c b/lib/fonts/font_acorn_8x8.c
index 36c51016769d41..4ff52c79f8c4d6 100644
--- a/lib/fonts/font_acorn_8x8.c
+++ b/lib/fonts/font_acorn_8x8.c
@@ -5,7 +5,12 @@
 
 #define FONTDATAMAX 2048
 
+#ifdef BOOTLOADER
+/* The acorndata_8x8 symbol is needed by the ARM bootloader too. */
+const struct font_data acorndata_8x8 = {
+#else
 static const struct font_data acorndata_8x8 = {
+#endif
 { 0, 0, FONTDATAMAX, 0 }, {
 /* 00 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* ^@ */
 /* 01 */  0x7e, 0x81, 0xa5, 0x81, 0xbd, 0x99, 0x81, 0x7e, /* ^A */
-- 
2.53.0





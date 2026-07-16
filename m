Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E115C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 10:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gXF1QAeuABB0GFYJc2C7zqLj4mkjEXUbycfTqhb5bAk=; b=l22toGVNfzWa4zkyPQRYvlXnOk
	/IhZSlv1F3NF+FMMjGpc4pkNhGlrPD7/Q7YN1UobfPLJEFKSwgIzLggn4FC8AoWXPdKygXynwYWkm
	iYiDzkGq97t5/vgeiQHiRBaJYbQ8wnlfS+WJVRoFQz7cuwQBeZiXl87hCxAMEQChL0k4eGRB1zPA1
	AuwL3wR8hHvZKcz1MKTXf8/kqj/z6xjgD5hq2M5q1rZ3eQGvHhFmZQ3hfRLSqp/6rnAkEkyJ2D4cF
	Az6S18h16DyLb7CNw1q+0ayApunRSzFwgYs6wgG8n8AhKzd20TlbRfJoYXEZfS0twY6xIZY6yQVMd
	lCSJLHhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIve-0000000Gx8W-1FwF;
	Thu, 16 Jul 2026 10:02:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIvb-0000000Gx6j-1KqY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 10:02:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C82412F;
	Thu, 16 Jul 2026 03:02:45 -0700 (PDT)
Received: from ergosum.cambridge.arm.com (ergosum.cambridge.arm.com [10.2.208.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8F7623F905;
	Thu, 16 Jul 2026 03:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784196170; bh=E27i/D3e6bF5+KZUrw0fKEszL9eqozWLnLh4zkZyKn0=;
	h=From:To:Cc:Subject:Date:From;
	b=o71xAlvVqFVzhkOifeYwdb5wcCjJIjCtfjyYkpFDuj/ZtZT7ZvTJFB/DGgWPJipnA
	 xu9VX5655PYVGTZIl7m3WG0ZqLhis2dnf45+k+oqLpPPMoWALEC7b5Ma31ReHJxCS4
	 hAy4xouDS+Pzd7gJ+V5/2nR8p8w9E10EAlyYHC9E=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/defconfig: Restore built-in 9P rootfs support
Date: Thu, 16 Jul 2026 11:02:43 +0100
Message-Id: <20260716100243.1604526-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_030251_407119_8E67A5F4 
X-CRM114-Status: UNSURE (   9.88  )
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

Commit d521c4ca039f ("arm64: defconfig: Switch Ethernet drivers to modules")
had changed 9P and virtio-9P support from built-in to modular instead. This
breaks simple kvmtool boots using a 9P root filesystem without an initramfs
, because the kernel must mount root filesystem before it can load the 9P
modules. Also there is no change in image size with these configs built-in.

Restore the relevant 9P options as built-in.

Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Eric Biggers <ebiggers@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/configs/defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 654a102cb5bc..be9715b1e005 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -200,8 +200,8 @@ CONFIG_MAC80211=m
 CONFIG_MAC80211_LEDS=y
 CONFIG_RFKILL=m
 CONFIG_RFKILL_GPIO=m
-CONFIG_NET_9P=m
-CONFIG_NET_9P_VIRTIO=m
+CONFIG_NET_9P=y
+CONFIG_NET_9P_VIRTIO=y
 CONFIG_NFC=m
 CONFIG_NFC_NCI=m
 CONFIG_NFC_NXP_NCI=m
@@ -1921,7 +1921,7 @@ CONFIG_NFS_V4=y
 CONFIG_NFS_V4_1=y
 CONFIG_NFS_V4_2=y
 CONFIG_ROOT_NFS=y
-CONFIG_9P_FS=m
+CONFIG_9P_FS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_SECURITY=y
-- 
2.30.2



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7AAECD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=udsMJ3ejkdlI/0Wr5ib70BfDnmkIrevT5nLJ96T7gw8=; b=GjzOFsWgWHlK4h+DcV1V6HjYoB
	9RUaxL71jmQV1xY2kxotBONuLFhJuzb/JfcQtwur/z90Z9PjyxJyqIemRukjF8O5cCSkE8QrwSGEf
	UQ9YCduUpLKx3JUF66DWrqcrMfCaaX8IINbcpeJnR7+tQaSKVWd0AgqiWrTj5vULCOPWs607H2I/g
	Sn6Jy/awOjdma9+syI4gJtX/g4NS1WOpyGSGCzrvRZwOjfmd/e8ErHxd6Md4+8XheuJQ4mkKdmKjz
	CFfdVCnWWu0XYgKwGQjJKfeY50GR+IioiurnDJ8Z+xXEQHyR/lfV0QLQ8uzdzGWuwCiWP0YkbhJdu
	m24Ikl1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnLw-0000000FMD4-2aYW;
	Wed, 03 Jun 2026 15:17:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnLv-0000000FMCA-4ATq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:17:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 73202601DD;
	Wed,  3 Jun 2026 15:17:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C92261F00893;
	Wed,  3 Jun 2026 15:17:53 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] firmware: arm_scmi: Grammar s/may needed/may be needed/
Date: Wed,  3 Jun 2026 17:17:51 +0200
Message-ID: <5180d04abfb8e3074a321e2eb73bacfdd61c30c5.1780499850.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
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

Fix grammar in the help text for the ARM_SCMI_POWER_CONTROL symbol.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/firmware/arm_scmi/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
index e3fb36825978ed6f..783c24a20e29190f 100644
--- a/drivers/firmware/arm_scmi/Kconfig
+++ b/drivers/firmware/arm_scmi/Kconfig
@@ -96,7 +96,7 @@ config ARM_SCMI_POWER_CONTROL
 	  firmware.
 
 	  This driver can also be built as a module.  If so, the module will be
-	  called scmi_power_control. Note this may needed early in boot to catch
-	  early shutdown/reboot SCMI requests.
+	  called scmi_power_control. Note this may be needed early in boot to
+	  catch early shutdown/reboot SCMI requests.
 
 endmenu
-- 
2.43.0



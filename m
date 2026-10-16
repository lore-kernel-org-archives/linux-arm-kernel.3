Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B09CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 08:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u9kCNXMGX1OrIECKosrvZm24GXjj3Mp2UkAktpIbES4=; b=vveGTBZn/X/IqK0i7QO7IF17v2
	U1gEuegIvA+LDIDVrbFsNN53/W24/zh3JLMbAkCCdWErJzcj1QMV/BLy8sYwcmkrDLcV4dUO6IdBD
	kpz+uVeYXXHlg4knovqZhyE5XLdWz+S0L0esVaqx1KQyVWXak28r8KgJbuG8rInChPrAFTdf3PGMo
	ERSqD/NGLDln1XqOgXIMx2AiQsssudbNLcw6vspXdjohKEfMO+bamCShmuwNfzt5wd5UE6j96L6zj
	X1Xyl6C6a3GS8Zd4qr+qxy/FfP1fExLGAkaaz9EQKTSmGS4NUA7wFHQIgAjKbAF7PTh1Bcq/JLq3l
	GlznFjAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHcv3-00000002Hw4-2wxn;
	Fri, 16 Oct 2026 08:04:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHcv2-00000002Hvv-18Kh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 08:04:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C69060008;
	Fri, 16 Oct 2026 08:03:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FAEF1F000C4;
	Fri, 16 Oct 2026 08:03:57 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] firmware: arm_scmi: Grammar s/thing/things/
Date: Fri, 16 Oct 2026 10:03:54 +0200
Message-ID: <5128072dc75dbf239dff6c967a88060a4d64b3c0.1792137751.git.geert+renesas@glider.be>
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

Fix grammar in the help text for the ARM_SCMI_RAW_MODE_SUPPORT_COEX
symbol.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/firmware/arm_scmi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
index 783c24a20e29190f..9f6241efd5923fcf 100644
--- a/drivers/firmware/arm_scmi/Kconfig
+++ b/drivers/firmware/arm_scmi/Kconfig
@@ -52,7 +52,7 @@ config ARM_SCMI_RAW_MODE_SUPPORT_COEX
 	  Allow SCMI Raw transmission mode to coexist with normal SCMI stack.
 
 	  This will allow regular SCMI drivers to register with the core and
-	  operate normally, thing which could make an SCMI test suite using the
+	  operate normally, things which could make an SCMI test suite using the
 	  SCMI Raw mode support unreliable. If unsure, say N.
 
 config ARM_SCMI_DEBUG_COUNTERS
-- 
2.43.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7239EC5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 08:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Be9js0Tuhp2AI5YiQYuXoWP19v7+5eXtoMzBIgJyEZs=; b=YcL9h6/NLikywgJrX5I4M2tNCE
	VBZJtwGbpYbZ9t2+D2VG443xrsahxsxqM6qkLljHkhnk48+vIubbYSyS5/3GYhIh/Z7i1rVz7lhCr
	JPgQb7NXJ9GS4WQOGs8yev+PHjWAj0IOwIlIpwBqDr0jeb0bGQY+qgV0H450t2QPpdOWPbGDX/Eai
	US82bk8hO6wqplC+fXp2lY61dJF5Ywj4ObyMeJfHvnwWz0ni6uw62O/ZeGPAVfQqfZDY7n1Y6G/hd
	b+a5otJEPXDeHmdMgPBio1vslJ7QfexytcD+FPmdTCNP+/k+HbD1MhnozI/rCZfdNJPEv8Tj9bT5j
	HF3+GqGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiQm-0000000C2qm-0zno;
	Fri, 31 Jul 2026 08:17:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiQl-0000000C2qZ-23N8;
	Fri, 31 Jul 2026 08:17:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 76117600BB;
	Fri, 31 Jul 2026 08:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2AC31C2BCF4;
	Fri, 31 Jul 2026 08:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785485842;
	bh=EyDlG7h3ndIuQcvzUisuXZB0kEf2xDnlJrllNwQY2Ys=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=gEEkaHytYFdLM+XG2rUclUqGkOX++2FvGXoUZUkBTYAvwK9C8vbcRt6g94PJ3W4Et
	 fkeOdOMENyJunSdEuit8kfe9ILj/dfV79NjON2+z0j4is3jMsQct+dQawfhYkmQbs4
	 9ip62d7OiwMp2G6u67NuNx/AP902U7kwjYHnni29sXpTEV4iYvMk6+VP4brZlAWWdT
	 4XJDa0ZHlFvKGhq2EQ917FUgeqe9NEflhC2sek2pjzslNZetfQDp4bmn+exm45hG0o
	 VHT4yiRhqWsBiAshKSUmuVkVvN0SYNVooagsCGurllA/y4NKd4wazl20RvB4vsS7ps
	 nIouxfbscNX7Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0793AC5516D;
	Fri, 31 Jul 2026 08:17:22 +0000 (UTC)
From: =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD_via_B4_Relay?= <devnull+cleverline1mc.gmail.com@kernel.org>
Date: Fri, 31 Jul 2026 10:17:09 +0200
Subject: [PATCH] platform: raspberrypi: Fix typos in Kconfig files
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260731-brcm-typos-v1-1-740551aba0fe@gmail.com>
X-B4-Tracking: v=1; b=H4sIAARabGoC/yXMyw5AMBBA0V+RWWvS8Uz8ilhQg5F4pFNCxL8rl
 mdx7wVClkmgCC6wtLPwMntgGIAZ6rknxa03RDrKdB6jaqyZlDvXRVTeYpyYVGOKGfhgtdTx8c3
 K6rdszUjGvQe47wfsZBvQbgAAAA==
X-Change-ID: 20260731-brcm-typos-7d134c501516
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Matous Hybl <hyblmatous@gmail.com>, 
 =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785485841; l=1817;
 i=cleverline1mc@gmail.com; s=20241112; h=from:subject:message-id;
 bh=YKRM9m7pQ12Ss81G6YQHueSF8cBMFRNn9Gd+XSDd5BQ=;
 b=9H6aGW6hIZe9IFy/4f6RU5NoAvrII1mU7qYcMssL9dDWBboNZzamc0u4Ns27Mg4TOoSMq5WKU
 Pf4yTT3fZjeC8A/8Ak9RCz8JXIGZF/9MErHgDmn5K59gc4K5h2iQjmz
X-Developer-Key: i=cleverline1mc@gmail.com; a=ed25519;
 pk=EJoEbw03UiRORQuCiEyNA8gH1Q6fIpEWnn/MyaWOWX0=
X-Endpoint-Received: by B4 Relay for cleverline1mc@gmail.com/20241112 with
 auth_id=275
X-Original-From: =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>
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
Reply-To: cleverline1mc@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Kryštof Černý <cleverline1mc@gmail.com>

Correct minor typographical errors in Kconfig help texts.

Signed-off-by: Kryštof Černý <cleverline1mc@gmail.com>
---
 drivers/platform/raspberrypi/Kconfig            | 4 ++--
 drivers/platform/raspberrypi/vchiq-mmal/Kconfig | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/raspberrypi/Kconfig b/drivers/platform/raspberrypi/Kconfig
index 2c928440a47c..cdf98509cd1b 100644
--- a/drivers/platform/raspberrypi/Kconfig
+++ b/drivers/platform/raspberrypi/Kconfig
@@ -8,7 +8,7 @@ menuconfig BCM_VIDEOCORE
 	help
 		Support for Broadcom VideoCore services including
 		the BCM2835 family of products which is used
-		by the Raspberry PI.
+		by the Raspberry Pi.
 
 if BCM_VIDEOCORE
 
@@ -26,7 +26,7 @@ config BCM2835_VCHIQ
 		API, which is in turn used by several multimedia services on the
 		BCM2835 family of SoCs.
 
-		Defaults to Y when the Broadcom Videocore services are included
+		Defaults to Y when the Broadcom VideoCore services are included
 		in the build, N otherwise.
 
 if BCM2835_VCHIQ
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/Kconfig b/drivers/platform/raspberrypi/vchiq-mmal/Kconfig
index c99525a0bb45..827e73a97afb 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/Kconfig
+++ b/drivers/platform/raspberrypi/vchiq-mmal/Kconfig
@@ -4,4 +4,4 @@ config BCM2835_VCHIQ_MMAL
 	help
 	  Enables the MMAL API over VCHIQ interface as used for the
 	  majority of the multimedia services on VideoCore.
-	  Defaults to Y when the Broadcomd BCM2835 camera host is selected.
+	  Defaults to Y when the Broadcom BCM2835 camera host is selected.

---
base-commit: 95d6a9ccef99117115e41e9adb271243bd5e985b
change-id: 20260731-brcm-typos-7d134c501516

Best regards,
--  
Kryštof Černý <cleverline1mc@gmail.com>




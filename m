Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA12FF8850
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 23:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/yRfGCz+H6Wk+KRLLP/U3Hu5ASdZ8/kg+ddKo/mVVEM=; b=3ngEuoQDq/qRNdHnbpdrskwm2y
	ucJo2Mc4ouduCLquY6JPBNb0z3fJGXk7T7AauloTlLHccDepqtmGWi3mR3zkACqZQI7pshnavf9hr
	zVPfSpOSPFEn8tnNlERNdKkjq8k9x0vtlEiU3owHHOT/dr2um2rBP3Qz+glZHfbIK2/kqEtux37mo
	Q5gGkW88gU3JVRUjvSgzl1+vQLHr6EcSHXk1ofFzZtHl9j6mwDq5WoJkRIfgXkz9CmykX2QGdKnyW
	X5S2Y1sdNuSWp/i1UgOK3E0LK4VCOqfP+fHrG68g9nkRdryN4Vf98Yk22yZJfUgNbPcgLsXm+CcpK
	9m4EMw3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH8sV-0000000Fw36-1bzb;
	Sun, 26 Apr 2026 23:27:07 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH8sU-0000000Fw2i-15Wa;
	Sun, 26 Apr 2026 23:27:06 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH] Documentation: ABI: sysfs-class-reboot-mode-reboot_modes: fix doc warnings
Date: Sun, 26 Apr 2026 16:27:05 -0700
Message-ID: <20260426232705.422938-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
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

Repair the docs build warnings in this file by unindenting the description,
adding blank lines, and using `` to quote *arg.

WARNING: Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes:36: abi_sys_class_reboot_mode_driver_reboot_modes doesn't have a description
Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes:1: ERROR: Unexpected indentation. [docutils]
Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes:1: ERROR: Unexpected indentation. [docutils]
Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes:1: WARNING: Inline emphasis start-string without end-string. [docutils]
Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes:1: ERROR: Unexpected indentation. [docutils]

Fixes: d3da03025e6d ("Documentation: ABI: Add sysfs-class-reboot-mode-reboot_modes")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: linux-pm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-doc@vger.kernel.org

 Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes |   13 ++++++----
 1 file changed, 8 insertions(+), 5 deletions(-)

--- linux-next-20260424.orig/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
+++ linux-next-20260424/Documentation/ABI/testing/sysfs-class-reboot-mode-reboot_modes
@@ -2,33 +2,36 @@ What:		/sys/class/reboot-mode/<driver>/r
 Date:		March 2026(TBD)
 KernelVersion:	TBD
 Contact:	linux-pm@vger.kernel.org
-		Description:
+Description:
 		This interface exposes the reboot-mode arguments
 		registered with the reboot-mode framework. It is
 		a read-only interface and provides a space
 		separated list of reboot-mode arguments supported
 		on the current platform.
 		Example:
+
 		 recovery fastboot bootloader
 
 		The exact sysfs path may vary depending on the
 		name of the driver that registers the arguments.
-		Example:
+		Example::
+
 		 /sys/class/reboot-mode/nvmem-reboot-mode/reboot_modes
 		 /sys/class/reboot-mode/syscon-reboot-mode/reboot_modes
 		 /sys/class/reboot-mode/qcom-pon/reboot_modes
 
 		The supported arguments can be used by userspace to
 		invoke device reset using the standard reboot() system
-		call interface, with the "argument" as string to "*arg"
-		parameter along with LINUX_REBOOT_CMD_RESTART2.
+		call interface, with the "argument" as string to ``*arg``
+		parameter along with ``LINUX_REBOOT_CMD_RESTART2``.
 
 		A driver can expose the supported arguments by
 		registering them with the reboot-mode framework
 		using the property names that follow the
 		mode-<argument> format.
 		Example:
-		 mode-bootloader, mode-recovery.
+
+		 mode-bootloader, mode-recovery
 
 		This attribute is useful for scripts or initramfs
 		logic that need to programmatically determine


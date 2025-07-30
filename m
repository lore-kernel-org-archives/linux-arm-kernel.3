Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6725C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 09:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vBTybFK7THjmLoPMZim8+9V/lwdax5628HZkXAMB+yk=; b=fvwdplkc6tb04rQsj3XFLDjuCO
	vwPfItR2HAs62Xu2lLhlZrY2BjEx6G1KJaTZ0eGPg7mDhPsBo6udpK44jAXXq550uHsovCxuDb3mz
	BtOpIB+m8LcUemQCyTdDlMufvnZEHke8i4UohUuP8BJg1q3Evy2jYqFbubwTMuW4OaQDGcbQOgIiC
	r810p8ZhCfVdCysan9GCiRC+kaLOVijSUANs6AxlfzYnBbugi7ox0VV6pndaAUxwb5dBNvhKgITLW
	m545ntD2RgWSaVxOo+d4xVUf9aWyenR9DPMJECJ4wO+N+K8L0A5yqQiWi8v0157MH9giKNIFMWj5A
	N91pqFWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3LL-0000000192A-0f6p;
	Wed, 30 Jul 2025 09:43:27 +0000
Received: from ssh248.corpemail.net ([210.51.61.248])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh3Ip-000000018c6-338k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 09:40:53 +0000
Received: from jtjnmail201608.home.langchao.com
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id 202507301740262167;
        Wed, 30 Jul 2025 17:40:26 +0800
Received: from locahost.localdomain.com (10.94.11.126) by
 jtjnmail201608.home.langchao.com (10.100.2.8) with Microsoft SMTP Server id
 15.1.2507.57; Wed, 30 Jul 2025 17:40:25 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <linux@armlinux.org.uk>, <rmk+kernel@armlinux.org.uk>, <ardb@kernel.org>,
	<nathan@kernel.org>, <ebiggers@kernel.org>, <linus.walleij@linaro.org>,
	<rostedt@goodmis.org>, <kees@kernel.org>, <ruanjinjie@huawei.com>,
	<dave@vasilevsky.ca>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Charles Han <hanchunchao@inspur.com>
Subject: [PATCH] ARM: Kconfig: Remove repeated word in Kconfig
Date: Wed, 30 Jul 2025 17:40:12 +0800
Message-ID: <20250730094012.3200-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.11.126]
tUid: 20257301740267c554ea7e2085ffd15d81d4884a3010c
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_024052_017582_FC4FA9CB 
X-CRM114-Status: GOOD (  10.38  )
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

Remove the repeated word "the" in description of the help field.

Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 arch/arm/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index b1f3df39ed40..20f88ea59818 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1502,7 +1502,7 @@ config ARM_ATAG_DTB_COMPAT_CMDLINE_EXTEND
 	bool "Extend with bootloader kernel arguments"
 	help
 	  The command-line arguments provided by the boot loader will be
-	  appended to the the device tree bootargs property.
+	  appended to the device tree bootargs property.
 
 endchoice
 
@@ -1644,7 +1644,7 @@ config DMI
 	  continue to boot on existing non-UEFI platforms.
 
 	  NOTE: This does *NOT* enable or encourage the use of DMI quirks,
-	  i.e., the the practice of identifying the platform via DMI to
+	  i.e., the practice of identifying the platform via DMI to
 	  decide whether certain workarounds for buggy hardware and/or
 	  firmware need to be enabled. This would require the DMI subsystem
 	  to be enabled much earlier than we do on ARM, which is non-trivial.
-- 
2.43.0



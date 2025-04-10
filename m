Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3462AC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 02:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dpH04vdsDecoOXpA0upqSyJ9hf1jh4q4RdksLptrhFA=; b=tnItO9eWq00PIzlNU9SklJzfN4
	LDkskkMx1S2+BFEYDHOv77zmvFUgceo63Ig4RPzDmOdcpXRKTEumpPOWrKO/c7Jr8ZPxPV28BVWx9
	Bpe/8oGPz6pgQTCAqloQx0KX7PGNN2ENR5klj9glkhOSzRhqXQeQ3KXopshBivdymUY5bzeOY2a4h
	P3bdSocJ1kDHzuGXieWqUVn1FU6T5gsnfcCBeTVrCWVZtqgywB9cWg8v+oj78Z+DpR2cCV/Tayzd+
	f8xoYGBICCJ+M9cmdBshyxnC+CLvyufvDJe7NtNdLHJOl1EDoNGP+BbQ41QEZ0yEWQg23tPlioZ23
	VwzIbGcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2hp4-000000093HO-0jNa;
	Thu, 10 Apr 2025 02:39:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2hnI-000000093Ar-1H85
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Apr 2025 02:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=dpH04vdsDecoOXpA0upqSyJ9hf1jh4q4RdksLptrhFA=; b=CoeqeXei02z+8kzlGT2hoDBM6s
	xbAPz9ulAtC37razikFC1aatlhPweZCmI7erX4uwh7dAddPaADoy7zh2CQio0ZTys+UAiy34iRz2N
	dHSduDKEmfmCJpcClW2R3Lf16Bvdn0WkqBPu9uC2sPghrIBBBqeC0RSluhaqyNtgrZ8YvNO7ZdSuL
	+0ZlxnZYP+02s5Opq/mbJMiu61riKD/WLv+ytsoagn6ZSF3TnTE5Knie0ttw+fDIkvMUW65ofynjV
	cRIz+Ck9fGbAD5rTgx+dVUpugI1Z8ClYoI/cpp+bQI+RqIaGaQTHzU8Ke335XnbErwV53QeHQHjgg
	vTnv6tdA==;
Received: from ssh248.corpemail.net ([210.51.61.248])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2hnB-00000008jzU-35ZH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 02:37:28 +0000
Received: from jtjnmail201601.home.langchao.com
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id 202504101036571611;
        Thu, 10 Apr 2025 10:36:57 +0800
Received: from locahost.localdomain.com (10.94.12.92) by
 jtjnmail201601.home.langchao.com (10.100.2.1) with Microsoft SMTP Server id
 15.1.2507.39; Thu, 10 Apr 2025 10:36:56 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <linux@armlinux.org.uk>, <rmk+kernel@armlinux.org.uk>,
	<linus.walleij@linaro.org>, <ardb@kernel.org>, <arnd@arndb.de>,
	<iuyuntao12@huawei.com>, <ruanjinjie@huawei.com>, <ebiggers@google.com>,
	<david@redhat.com>, <masahiroy@kernel.org>, <dave@vasilevsky.ca>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Charles Han <hanchunchao@inspur.com>
Subject: [PATCH] ARM: Remove the repeated word "the" in Kconfig.
Date: Thu, 10 Apr 2025 10:36:52 +0800
Message-ID: <20250410023652.8266-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.94.12.92]
tUid: 20254101036575d9741c2b0f18886574ac4cb902e34fd
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_033726_600561_9F4F83C6 
X-CRM114-Status: GOOD (  10.35  )
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

Fix "The the" typo in the description.

Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 arch/arm/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 25ed6f1a7c7a..31004f33dc14 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1505,7 +1505,7 @@ config ARM_ATAG_DTB_COMPAT_CMDLINE_EXTEND
 	bool "Extend with bootloader kernel arguments"
 	help
 	  The command-line arguments provided by the boot loader will be
-	  appended to the the device tree bootargs property.
+	  appended to the device tree bootargs property.
 
 endchoice
 
@@ -1647,7 +1647,7 @@ config DMI
 	  continue to boot on existing non-UEFI platforms.
 
 	  NOTE: This does *NOT* enable or encourage the use of DMI quirks,
-	  i.e., the the practice of identifying the platform via DMI to
+	  i.e., the practice of identifying the platform via DMI to
 	  decide whether certain workarounds for buggy hardware and/or
 	  firmware need to be enabled. This would require the DMI subsystem
 	  to be enabled much earlier than we do on ARM, which is non-trivial.
-- 
2.43.0



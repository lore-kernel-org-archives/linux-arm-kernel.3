Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187DBC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 10:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I2eMAS1QoFOyVHmK1FI/Y9oGcQmoyT9GZd4/d7u4S2Y=; b=1czGDi2F421tFALQYsgS6lLR4+
	Gj86JsOMHN40XaprXMR1BqxcTvwzFaFK3n6iInkEJpNdYl6jAAvNpT5kJeVbLvG4li3oJ13kRBC7l
	IYoN4HZCjE74nSn1rM7HvHRB6DD/aKniK9VVl/Ele+Z7swVq59qbMkAseNnIELoiO4ErogkT0uCFb
	rs61gw8oWMkYY8p21bOitlTGkA6zvo9poJ4QgjI0u2RmO4jUI5qIoBJHcLogD0ZyIa8Xr9d5OeKs+
	/M9R/+fDRmpymDczDdx0yts1nJSoyoJNNSZH+CvbwZSTVAIvGAaUr4RlmdCizk7m0SakGO0A8/Qis
	H0goc8QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty6rG-0000000D7GQ-1ZBp;
	Fri, 28 Mar 2025 10:22:38 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty6pV-0000000D76n-2BJu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 10:20:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1743157247; bh=I2eMAS1QoFOyVHmK1FI/Y9oGcQmoyT9GZd4/d7u4S2Y=;
	h=From:To:Cc:Subject:Date;
	b=D18MpWGLOQ1fSszwG+hGtGFG6ZLCM238mK3A/sa7ATAFJFlDbOaB8RTqtiTPn8UNW
	 hwhXT1ugIJE7znrNzkcZ22X/+aoPnnDuVC88HxZ5RdYiHSk2RPkNDF5zPA0yjj569V
	 zG3Y/vbJp+br9nrit0UjJGISWtajczE+RkHPnAmk=
Received: from mail.red54.com ([139.99.8.57])
	by newxmesmtplogicsvrszc11-0.qq.com (NewEsmtp) with SMTP
	id 5179D080; Fri, 28 Mar 2025 18:20:23 +0800
X-QQ-mid: xmsmtpt1743157223tws36nd57
Message-ID: <tencent_3E8155B4A33D48D6637F16CFE5ED293F0E08@qq.com>
X-QQ-XMAILINFO: NQR8mRxMnur9ApmSjGAwIgWVyFsdwRYfpF6XWUljFL9CGWaXb+SYBegsQSuHDa
	 nI0O7Z+SDmOWqkDMzxaTGO3i7OLfvQtyuwZTtBFzupP2Hhi4/Jw0ie/8c8I+9e9Bz6rOBMDvmpFh
	 LjGhF4kIEyIHDng1mYjUXoPH/4hAt1ExAxHyDIfOuEOFGTrXsz1GvmEJgWev5InZEOe6XNT7KOfG
	 i+HZ/Z8zXKp6BCf6dZqzZu88SHg3p70mUuuoE+JaMupi7pDsHUdXqEHfjnuAX0bXY4RfnpDdI+Tt
	 3Sw1o6aBIdLu/e9hsxnwp8ecxctSB/sw0x8xjmVnfImb9HwPWjXX3ON6RwRge8jWYKHuusMa8QCE
	 fOJ/7yfeH6Ls7UxIifcVcAHwbZVKQcPbeZTbFFnf6M5GlqlSWispUd5euM/9w7l3l8kjcMHZh2H0
	 IiXm0GawkZ3AIq37R9Ec3IIvjMhEWkV9E2FTWEoDH9HX4/rkDkwUplHMODNOWqBdAgAMr1k/QgVz
	 h1KVDcnqTnjgu/3rTRmLBOtdjqcYkaCvD6w4L5KBBTmu5zaaiZ3ZUVFi7KBY7OmDSR4AEUzsYXGc
	 TBJpGK6KdTXxMYWh/rYT9ZBfLvakVZvrdm8Bp2o7o6Boa3NUhrC0gpBirYS2yYMfJ+mf0E8wgspC
	 ZZkBLrUnYNo1X0qpepJJBohoWZaRGZQO3Hz7/W+K/nuCV32tdCjA9LEtI+DPfQQd16sdOqXfAAJ2
	 Nom+TP5uAR4l6SFs8+vfPoKIFsaXqicDrtE/bePN7AHSNRUM08NAOwgGIVFhhGUX5EBpR9Szz+fm
	 SJ3ijjMWKDtbF9BKHbKYHxbM7noR0mR3er4vNLCs4eqKUIS4BL/6TzKLKoeVBFHAD+O9VY+/oNoE
	 tdl99IPisRdF7LTjyQ/MrnZzdJDveQYP5gUDYegQ/QIQWOeliZU44VZHgARWnCbF10OfdZzWcDyZ
	 vN6+jra0REvKMV93KNnddkuFcsX60ue7kGgVMA6s/9mG3jF+u1aw==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Yeking@Red54.com
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6=20=28XIE=20Zhibang=29?= <Yeking@Red54.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Yuntao Liu <liuyuntao12@huawei.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Dave Vasilevsky <dave@vasilevsky.ca>,
	Nathan Chancellor <nathan@kernel.org>,
	Victor Boivie <victor.boivie@sonyericsson.com>,
	Nicolas Pitre <nico@fluxnic.net>,
	Oskar Andero <oskar.andero@sonyericsson.com>,
	Bjorn Andersson <bjorn.andersson@sonyericsson.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: Fix support for CMDLINE_EXTEND
Date: Fri, 28 Mar 2025 10:20:17 +0000
X-OQ-MSGID: <20250328102017.53121-1-Yeking@Red54.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_032049_879355_3BB8D035 
X-CRM114-Status: GOOD (  12.87  )
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

From: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>

It should be the default command line appended to the bootloader command
line, not the bootloader command line appended to the default command
line.

This will be consistent with the behavior of FDT, EFI, and other
platforms.

Fixes: 4394c1244249 ("ARM: 6893/1: Allow for kernel command line concatenation")
Signed-off-by: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>
---
 arch/arm/Kconfig              |  4 ++--
 arch/arm/kernel/atags_parse.c | 10 +++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 25ed6f1a7c7a..635e4da33fff 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1534,8 +1534,8 @@ config CMDLINE_FROM_BOOTLOADER
 config CMDLINE_EXTEND
 	bool "Extend bootloader kernel arguments"
 	help
-	  The command-line arguments provided by the boot loader will be
-	  appended to the default kernel command string.
+	  The default kernel command string will be appended to the
+	  command-line arguments provided by the boot loader.
 
 config CMDLINE_FORCE
 	bool "Always use the default kernel command string"
diff --git a/arch/arm/kernel/atags_parse.c b/arch/arm/kernel/atags_parse.c
index 4ec591bde3df..bd163f00602e 100644
--- a/arch/arm/kernel/atags_parse.c
+++ b/arch/arm/kernel/atags_parse.c
@@ -120,15 +120,15 @@ __tagtable(ATAG_REVISION, parse_tag_revision);
 
 static int __init parse_tag_cmdline(const struct tag *tag)
 {
-#if defined(CONFIG_CMDLINE_EXTEND)
-	strlcat(default_command_line, " ", COMMAND_LINE_SIZE);
-	strlcat(default_command_line, tag->u.cmdline.cmdline,
-		COMMAND_LINE_SIZE);
-#elif defined(CONFIG_CMDLINE_FORCE)
+#if defined(CONFIG_CMDLINE_FORCE)
 	pr_warn("Ignoring tag cmdline (using the default kernel command line)\n");
 #else
 	strscpy(default_command_line, tag->u.cmdline.cmdline,
 		COMMAND_LINE_SIZE);
+#if defined(CONFIG_CMDLINE_EXTEND)
+	strlcat(default_command_line, " ", COMMAND_LINE_SIZE);
+	strlcat(default_command_line, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
+#endif
 #endif
 	return 0;
 }
-- 
2.43.0



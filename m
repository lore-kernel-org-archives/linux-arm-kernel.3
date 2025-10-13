Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1C9CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 12:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VybiMm2sR5Hp/9bOjAy99uv6Gp6PKEssL2EO94O+66I=; b=TCu4IyXr5FWuj4dmsu74rAhOfH
	YLKK02B0Sw+pjBIJtV5kA+sTd3Rua0BQvGGA+II67bkPgqDQbJ/0NBh64wd/kYaOIMmg6M9ErpiAw
	uUqBaN14sQusBzvPJfsfKsEg+Wjgamd3h3uxiw5+hJl7k4itmGhT+CSSd9HkKkYVuvnHmIRWmh7Na
	zYagwRrziWrJVS7fz+5e0pR160M+BNBtejO2GbPM/jWwCibwBH2fZnKcHFgIPKi+OEegE9yOZVZLu
	L6Xa2KoZL7X+aHIj+SvdkoZfzBSWqYS2InkOgiueEYxcUl+ccIXqBjq8jI0grg46mU6vEwKr3KjsH
	4xUuBTww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8HLp-0000000D5bZ-3ksi;
	Mon, 13 Oct 2025 12:08:29 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8HLn-0000000D5b2-0WiV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 12:08:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=VybiMm2sR5Hp/9bOjAy99uv6Gp6PKEssL2EO94O+66I=; b=x8P93qoZt30yoY13ulxO+o8Byg
	F44gLzclJ6IM+jP2+U5GA+ahryq2WqbnzfZNgGGbBz/kgwoPelErDKRtNjiLKem8aOdmEvV0eVqe6
	13W0DPgOdx7jIfq7IfxjTRkAQ6qcPQIxs168bljMXCPcemA3pczi3/NaOa0Lf8ntrMwlWzwNVbY3u
	+h8ZXSe44UdNC/qtBhTLr8MC4FOqngH3OOV8jDa3cg3K0RNhQ9/2PeEcygza6vAOUGlcP5c1NluL9
	5+FBd5V8vTgsvYKJJjeLbcvH5JBbZJMbEZzxfM2vU5J3hxti7mxpRRV/qndy2nleRFL6If+NfFNEQ
	ahRWdIuQ==;
From: Andreas Kemnade <andreas@kemnade.info>
To: aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	linux@armlinux.org.uk,
	tytso@mit.edu,
	lukas.bulwahn@redhat.com,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm: omap2plus_defconfig: enable ext4 directly
Date: Mon, 13 Oct 2025 14:07:53 +0200
Message-ID: <20251013120753.101582-1-andreas@kemnade.info>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_050827_167215_3BEB8904 
X-CRM114-Status: UNSURE (   7.82  )
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

In former times, ext4 was enabled implicitely by enabling ext3 but with
the ext3 fs gone, it does not get enabled, which lets devices fail to
mount root on non-initrd based boots with an ext4 root.

Fixes: d6ace46c82fd ("ext4: remove obsolete EXT3 config options")
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/configs/omap2plus_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 1d5f752417398..1499e1744dafb 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -679,7 +679,8 @@ CONFIG_TWL4030_USB=m
 CONFIG_COUNTER=m
 CONFIG_TI_EQEP=m
 CONFIG_EXT2_FS=y
-CONFIG_EXT3_FS=y
+CONFIG_EXT4_FS=y
+CONFIG_EXT4_FS_POSIX_ACL=y
 CONFIG_EXT4_FS_SECURITY=y
 CONFIG_FANOTIFY=y
 CONFIG_QUOTA=y
-- 
2.47.3



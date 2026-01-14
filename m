Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2839DD31A00
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 01:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ghttvb0OITFC54BUl3AexgRbFvczWJIWdZaxuWodWic=; b=dbFYeLXwVl2kBIXaA1TkqsFGJd
	K3ryUSX5+bHdnyKkktAIhRTSBo/VIMA107W4wCZBr9yFl5BkGDhWFqg6YgKm8EE42EKXTbbycR/Zk
	Pdx6ig2lndVulsz1Z6LS3MvA+oG7kIRs/YZL/r/R6ZEtvRxKfJLbAyvOse66uUkKD47Wh9Em1utK3
	pAbM4T+8kgtjxQZfyeV3twkrrqkbSv7PDQ6vjwLcJPTszM+OSqoJHi4J7kU7UZ8YVm0lRZnvFE9nP
	0NsDoFThCgjrKBiEi3u3fxJsvuPeJGdaKWZlKhwWWcnx0+O/e5Zb/Th6hrytxDxdMyrM0ZFBMffzj
	spTt56iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfpyo-00000007xg1-2vDu;
	Wed, 14 Jan 2026 01:47:26 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfpyl-00000007xej-1oS9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 01:47:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Gh
	ttvb0OITFC54BUl3AexgRbFvczWJIWdZaxuWodWic=; b=kFiCIipdFAty0k2S6i
	PjjTs3aP9xwAQYK43iFB+Xng1zyjdAzWbuU43umkYe/LN8MuKggq5JvEpG1keTeC
	eizlc4TV8uJam5D91wlV+KJe1DGPvvVFlYG3h0tjuEGZHnJ9lee2DEBxNlEiddBl
	WwX3JqnN//KK6o7n6MZ1RdIpw=
Received: from X13.domain.sensetime.com (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wC3LauU9WZpRimXFw--.34345S2;
	Wed, 14 Jan 2026 09:47:02 +0800 (CST)
From: junan <junan76@163.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	junan76@163.com
Subject: [PATCH] arm64: kconfig: Make STRICT_KERNEL_RWX visable.
Date: Wed, 14 Jan 2026 09:38:42 +0800
Message-ID: <20260114013859.498148-2-junan76@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wC3LauU9WZpRimXFw--.34345S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFWxtF1xWrW5Zry7ur4kWFg_yoWfKFg_Ja
	97JF1kAr18Ja4j9w4IgrWxury7K3yUuFyruryjvrnrZ3W2vw13Wwnxtas8ZF1Yqr15KFWf
	Zan3tFn8AF4YgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRiHUD5UUUUU==
X-Originating-IP: [182.148.52.15]
X-CM-SenderInfo: pmxqt0ixw6il2tof0z/xtbC1BiXSWlm9ZjerAAA3C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_174723_887702_BD72F755 
X-CRM114-Status: UNSURE (   9.23  )
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

Make "STRICT_KERNEL_RWX" visable to menuconfig on arm64 platform.

I can not set breakpoints when using kgdb/kdb on arm64, the document
says "STRICT_KERNEL_RWX" should be "n", but it's not visable in
menuconfig and the default value is "y".

kgdb/kdb doc: https://docs.kernel.org/process/debugging/kgdb.html

Signed-off-by: junan <junan76@163.com>
---
 arch/arm64/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 93173f0a09c7..cc3aaffa1e12 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -52,6 +52,8 @@ config ARM64
 	select ARCH_STACKWALK
 	select ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_HAS_STRICT_MODULE_RWX
+	select ARCH_OPTIONAL_KERNEL_RWX		if ARCH_HAS_STRICT_KERNEL_RWX
+	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYSCALL_WRAPPER
-- 
2.43.0



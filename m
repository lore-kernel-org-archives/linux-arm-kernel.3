Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49DCD3CCA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 02:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vA4sG2LcbrHKYOPfRfHsAEkNum7WWXZhFvlb2/tyyv4=; b=pIpj5FeatGK8uZDMuNPE4A28UI
	bvP0xT8BHJZMZ4XVo4nLesA0nR0vV0CQuh7VJYBuyF/SkOyj9eddt+OKMGA+y1FrBdtNhuwkVqDxO
	xVbviRtwbMo+OzFNcTisu23t0qQKYWlyjz2daV0mwqRJTixjtBgcN0bLVCr6bAJGZ5NKmJJ2b4De3
	1SSjHg8a9ggz1sBySr73M9rpdi7KedpL5qV1DysQbehopjjp85D9gD0+0gvcr9r+Aoi0eANmixfd0
	AolrE3YNnhSnHuUzAP0IUFfGFBNEJEnPjd9MG0SLDYAb19Hgdg8iB/qdF6vWaPIYYuBfiM4KG4hGF
	qdz0vaWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgDM4-0000000BZuJ-2iso;
	Thu, 15 Jan 2026 02:45:00 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgDM0-0000000BZsw-1ycm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 02:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=vA
	4sG2LcbrHKYOPfRfHsAEkNum7WWXZhFvlb2/tyyv4=; b=TFYyYYtBiwIdA4AhIj
	OI27ipBY6bTZD7fnjgVPi2lLbHb5s5LAbNlh1yZ8qn0eM/7IndXz+ZTHkYpdx9SO
	LAvSyAD/Bo6RoWlqNsgVC+BkvqA7VJkqqhjbFtcG0XGQgz/HGxoTq4aaRyEiQmac
	/XClkkUEObqhczSmcbuRDDb2k=
Received: from X13.domain.sensetime.com (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBHirCJVGhp+fTaLA--.16632S2;
	Thu, 15 Jan 2026 10:44:28 +0800 (CST)
From: junan <junan76@163.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	junan76@163.com,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] arm64: kconfig: Make STRICT_KERNEL_RWX visable.
Date: Thu, 15 Jan 2026 10:34:18 +0800
Message-ID: <20260115023456.621586-2-junan76@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgBHirCJVGhp+fTaLA--.16632S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KrW8uFW3JF17JF18Zr4UXFb_yoW8CrW7pw
	n3uwnrJFW7Grn3JaykK3y3uF45Zan5Jay3WFW5C34jyrnrA34DuF9YvwnIvFWDX34Uu3yf
	ua4Sv3W2qw18XwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRVyxZUUUUU=
X-Originating-IP: [182.148.52.15]
X-CM-SenderInfo: pmxqt0ixw6il2tof0z/xtbC1A2sXmloVI0FzgAA34
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_184456_922996_22A9FD13 
X-CRM114-Status: GOOD (  10.32  )
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

Breakpoints can not be set when using kgdb/kdb if "STRICT_KERNEL_RWX"
equals to "y", but it has a default value "y" and is not visable in
menuconfig on arm64.

Link to kgdb/kdb doc: https://docs.kernel.org/process/debugging/kgdb.html

Changes in v2:
	- Fix link error of "rodata_enabled" when allnoconfig is set
	- link to v1: https://lore.kernel.org/linux-arm-kernel/20260114013859.498148-2-junan76@163.com/

Signed-off-by: junan <junan76@163.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601141630.sCPCgSYw-lkp@intel.com/
---
 arch/arm64/Kconfig  | 2 ++
 arch/arm64/mm/mmu.c | 4 ++++
 2 files changed, 6 insertions(+)

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
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 8e1d80a7033e..4770204d9e22 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1314,7 +1314,11 @@ void __init kpti_install_ng_mappings(void)
 
 static pgprot_t __init kernel_exec_prot(void)
 {
+#if defined(CONFIG_STRICT_KERNEL_RWX) || defined(CONFIG_STRICT_MODULE_RWX)
 	return rodata_enabled ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
+#else
+	return PAGE_KERNEL_EXEC;
+#endif
 }
 
 static int __init map_entry_trampoline(void)
-- 
2.43.0



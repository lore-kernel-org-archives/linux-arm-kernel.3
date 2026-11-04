Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C0A606C907
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 21:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vL64KMsj;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JrpNWi5X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ruozjXyxrvhquDkTskA5Dem/TzG82g54ZkQaElWYNOo=; b=vL64KMsjtWaxhN
	AgNSEokWYJWCzOBAkRn7fwo69W8/4EH7ewFL/ECSeH2GpyWRA377A/lKdy78oU1vypt3+HpIGv/rb
	iuJOdm0tRRV7fW8+0QFoyynu3LVn4h862ZIMFJ6TgWCVt41is1Ume3QH9hlQLvZMM09Kvx4d126Oh
	cRMGN3MWYMhlR5sRrHg2i1rj3z7QfegHOyr33FmPpP5sLsH72IohzVP9ICLgScp7YcX1ykC1AfpTM
	ROQb4nG21Xkea/U57HkSwOIp/1QJWI98lYXJ4Ll1ecMmmSR5FXTv+xZdquXgHPxzPg9/twNSehpl7
	aMmnUcRYB5fPM+sVweiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOiaw-000000072Uu-2c54;
	Wed, 04 Nov 2026 21:32:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOiar-000000072R2-0C07
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 21:32:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7EF5760EF3;
	Wed,  4 Nov 2026 21:32:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91E1C1F000C1;
	Wed,  4 Nov 2026 21:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793827948;
	bh=ruozjXyxrvhquDkTskA5Dem/TzG82g54ZkQaElWYNOo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JrpNWi5X3qe9lAWioh+GvTyJqOOegrZ3nV6cfeXTXUUuyGyQY1BWPKfcjdIGjDs5l
	 JzHK774746ORj/e7/UUpYOokcl2TkKS1ZqclKGBsFXpMkvTgk5NwxlNLj973aXnnZd
	 XKXV3mkfb+hG/Dr0orkcweEwwjIxvKfo8vZtAJHohGXm/UpW0Dkcxc1a8EBMGsZhx/
	 ddlbXTS/gxFn45F46tCZkLel2PH/Jhv5n83vjsTKlUWQ8iTInHtNRmFTwkLwf6hMtO
	 dcIWjznYzuOdWToC+pXXQ3Yncc89O8v8jtYDQ7TdHyZFU9epnceWn9NOeen5XqKNqV
	 OyAq0YPFVLrUg==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 04 Nov 2026 22:32:20 +0100
Subject: [PATCH 04/16] ARM: configs: u8500: Update boot and memory
 configuration
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-ux500-defconfig-update-v1-4-451d0537d49b@kernel.org>
References: <20261104-ux500-defconfig-update-v1-0-451d0537d49b@kernel.org>
In-Reply-To: <20261104-ux500-defconfig-update-v1-0-451d0537d49b@kernel.org>
To: Stefan Hansson <newbyte@postmarketos.org>, 
 linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Remove the initramfs root from the built-in command line, disable ARM
PAN explicitly, and enable the XZ decoder and CMA DMA support needed
by the target configuration.

Keep initramfs support available for distribution boot and encrypted
root filesystems. Enable multi-generation LRU by default for memory
reclaim under pressure.

An LLM coding assistant was used to prepare these additions.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/u8500_defconfig | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index 82941a423868..c815fc5c0157 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -25,14 +25,14 @@ CONFIG_USER_NS=y
 CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_SCHED_AUTOGROUP=y
 CONFIG_BLK_DEV_INITRD=y
-CONFIG_KALLSYMS_ALL=y
 CONFIG_ARCH_U8500=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=2
 CONFIG_HIGHMEM=y
+# CONFIG_ARM_PAN is not set
 CONFIG_ARM_APPENDED_DTB=y
 CONFIG_ARM_ATAG_DTB_COMPAT=y
-CONFIG_CMDLINE="root=/dev/ram0 console=ttyAMA2,115200n8"
+CONFIG_CMDLINE="console=ttyAMA2,115200n8"
 CONFIG_CPU_FREQ=y
 CONFIG_CPUFREQ_DT=y
 CONFIG_CPU_IDLE=y
@@ -46,6 +46,8 @@ CONFIG_PARTITION_ADVANCED=y
 CONFIG_BLK_DEV_THROTTLING=y
 # CONFIG_SWAP is not set
 CONFIG_CMA=y
+CONFIG_LRU_GEN=y
+CONFIG_LRU_GEN_ENABLED=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -202,6 +204,8 @@ CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_CRYPTO_DEV_STM32_HASH=y
 CONFIG_CRYPTO_DEV_STM32_CRYP=y
+CONFIG_XZ_DEC=y
+CONFIG_DMA_CMA=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_MAGIC_SYSRQ=y

-- 
2.56.0



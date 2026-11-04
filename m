Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD933606C599
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 21:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LJs8vl6e;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aN1xY1sZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QsDteqm9zFt4hYUkEoAP6JmHTle9ERmZBFmXTQMiCWs=; b=LJs8vl6eE221J1
	P+W4TO3mbfDanKJ0ut22N0Cmer0Y7IpDeR0ei9RHtxhGKpYBoVgrDDtEXh03nUsy2/C6CwD6bG15e
	3F9rG8o4l2kQTU+FGi2RoAjzgijIMGGqEdg1/woHNmUX/5Yb5Fd3RgZfDKrKLeBuVwivqezEky9Dq
	r8oFTWkNWOs7qA2uy2EkdcqRQ+4IHdd9LlqEH9K8f28xn7oeS9AEbBpRzEk46tWX98FnSTbYaDCvu
	ZQ/r/S3nXwIGAXep3toX8xfx49t7za2457UAUPhvKAwozhyhVGc9sw7NsPaZ3qsneoH5LRKMnyyre
	ZNrKiaW4HKEhjxBDNV3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOiaw-000000072VI-3LvD;
	Wed, 04 Nov 2026 21:32:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOias-000000072Rk-0UAZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 21:32:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8EEC760EF3;
	Wed,  4 Nov 2026 21:32:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A14DE1F000C1;
	Wed,  4 Nov 2026 21:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793827949;
	bh=QsDteqm9zFt4hYUkEoAP6JmHTle9ERmZBFmXTQMiCWs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=aN1xY1sZUFf/agqGk5PSteQtSJRISoeR5GnP7wbghPP2WH7JPmxAOpjWsEXqA4bKN
	 ecO58gdL38GCBmYx5L9VVrz0s1TsowkOB+Jm5/9SI2K16C0iJxTZO3xj9in6FuqY5f
	 4z4j1EG00qvv0tZIpvUzhnRzdhukzBfiHkVA2U8K523XMBC5bWEMb9blFVnJABwGQg
	 0YD+kfaDjlek3E5XNlEarSrVq0iTWLBufa8oUqwk5iyImed7fNjbY1Ll2h4gH4EKuA
	 bla6PhAnSrgHqhwHNfj6bSh/WBuyqNxgNjhV6kbOUIe4SjVZrN8K2lZYNmgsmoQWUE
	 XqUxAo2gKnH8g==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 04 Nov 2026 22:32:21 +0100
Subject: [PATCH 05/16] ARM: configs: u8500: Enable storage support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-ux500-defconfig-update-v1-5-451d0537d49b@kernel.org>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable SCSI generic, device mapper, encrypted volumes, block integrity
and swap support. Disable the unused Kyber and BFQ I/O schedulers.

Add zram with its default lzo-rle compressor and loop devices. Build
FUSE, overlayfs and Squashfs as modules, with Squashfs extended attributes
and XZ decompression for compressed filesystem images.

An LLM coding assistant was used to prepare these additions.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/u8500_defconfig | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index c815fc5c0157..04e6a89b040e 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -42,9 +42,12 @@ CONFIG_VFP=y
 CONFIG_NEON=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
+CONFIG_BLK_DEV_BSGLIB=y
+CONFIG_BLK_DEV_INTEGRITY=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_BLK_DEV_THROTTLING=y
-# CONFIG_SWAP is not set
+# CONFIG_MQ_IOSCHED_KYBER is not set
+# CONFIG_IOSCHED_BFQ is not set
 CONFIG_CMA=y
 CONFIG_LRU_GEN=y
 CONFIG_LRU_GEN_ENABLED=y
@@ -71,8 +74,16 @@ CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_GNSS=y
 CONFIG_GNSS_SIRF_SERIAL=y
+CONFIG_ZRAM=y
+CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_BLK_DEV_RAM_SIZE=65536
+CONFIG_SCSI=y
+CONFIG_CHR_DEV_SG=y
+CONFIG_MD=y
+CONFIG_BLK_DEV_DM=y
+CONFIG_DM_CRYPT=y
+CONFIG_DM_UEVENT=y
 CONFIG_NETDEVICES=y
 CONFIG_SMSC911X=y
 CONFIG_SMSC_PHY=y
@@ -194,10 +205,15 @@ CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT2_FS_POSIX_ACL=y
 CONFIG_EXT2_FS_SECURITY=y
 CONFIG_EXT4_FS=y
+CONFIG_FUSE_FS=m
+CONFIG_OVERLAY_FS=m
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
-# CONFIG_MISC_FILESYSTEMS is not set
+CONFIG_MISC_FILESYSTEMS=y
+CONFIG_SQUASHFS=m
+CONFIG_SQUASHFS_XATTR=y
+CONFIG_SQUASHFS_XZ=y
 CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
 CONFIG_NLS_CODEPAGE_437=y

-- 
2.56.0



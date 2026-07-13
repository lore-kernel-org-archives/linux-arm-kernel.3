Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C158CC44507
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 14:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hrWmk776oESUEsQioPTzXcFQ2IdNzgMCGceqsLeJHeQ=; b=zQjFCg49/CaiR2g4oTkdoBQ0rr
	t9tm8X+YoRmgyLHHpsZdGlLWRr61nAfr8q2CEMILOwaHWcmXBtuzpLKClTbIuDfJv7apqxexyDLDf
	hd7EdyIUjEmHlP/SvhS8Q8NsS8SrLnmO3xum4F5G/vRLH121eAoAzdqPcNILLavt8s/KoW/IqN59s
	3uBIXZnzwnL+VsDMMgYeShMKNR6a/YrsvPaF2mCd9Xo7P3NDfCCGgtL3RxYzjKkWfOz2hjNHaVIo0
	x80d4xt6Qday/WXvAAgX/if9JscNBZSWfXb0K52Rl1SjzH1cr5VO13YRt56qbM86Mb6Jb4j+C9zKi
	w0i3r0Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHqu-00000009cvU-1snh;
	Mon, 13 Jul 2026 14:41:48 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjHqq-00000009csO-2p63;
	Mon, 13 Jul 2026 14:41:47 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gzQ9s3gXmzKm5r;
	Mon, 13 Jul 2026 16:41:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mavick.dev; s=MBO0001;
	t=1783953697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hrWmk776oESUEsQioPTzXcFQ2IdNzgMCGceqsLeJHeQ=;
	b=OzGXM3Kh57bn2zBdFrS3jRL9eNtUSFcliK+5wPeIe+X49PN33uvrWx1rQ5iRT8QBOJI44O
	hqYS17MHVSU9DLmrKcOluiaYCLV5LzRMzo0kIa8Q4bvTmx1UBbf2/yfVARN6Dr1ZhBKRBa
	9E03HX6zo38dsqvco3OFewq9FoILjocExubivpIrnSfQRqH7S/8VQCPrqOkosGotEyNsRZ
	2vh/HjTUqt9bdRZB0InFuDfwpHSHol++AIVWncNR+fPJokv4p7e/OkWApfX3eiMobY5h9d
	aqbOja3P2ECtkfAr/u44RzRkFUJQf4dqfFR9awoA58edav5QpJylhoknjB2Phg==
From: Eugene Mavick <m@mavick.dev>
Date: Mon, 13 Jul 2026 22:41:06 +0800
Subject: [PATCH] MAINTAINERS: fix stale file entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-fix-maintainers-entries-v1-1-800c6ad14201@mavick.dev>
X-B4-Tracking: v=1; b=H4sIAAH5VGoC/x2MQQqAIBBFrxKzbkBNCrtKtJCcahZZaEQg3b2px
 V88+O8VyJSYMvRVgUQXZ96jgK4rmFYfF0IOwmCUaVWnG5z5xs1zPGWUMlI8vwDamawKXjsTHIh
 9JJLrXx7G53kBe2njW2kAAAA=
X-Change-ID: 20260713-fix-maintainers-entries-4fe40da192d9
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Eugene Mavick <m@mavick.dev>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3878; i=m@mavick.dev;
 h=from:subject:message-id; bh=stq7W8uHONdsqMrB0hfJn0vxpzHny9ZEmO4mAvarUPY=;
 b=owGbwMvMwCU2V/5U3e1aE3/G02pJDFkhP9nuWj+e8s707gN31unuz+d85zhqxDxJgG/huUPpV
 wx/9eg7dZSyMIhxMciKKbLUZCW4Z6yclWh8dFIPzBxWJpAhDFycAjCRHBVGhk8ixUv36+a9s5Wd
 /6R0g4df8p6mmadja3lLFBdcXHbjxDtGhoVMX1ZU/tluxPfH+Pad434xT68ukld8etv2WJBve3Z
 iIBcA
X-Developer-Key: i=m@mavick.dev; a=openpgp;
 fpr=7C6A604768A99A6133C5928C9D1FCA7EDB7D344F
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_074145_485193_CDE41BFB 
X-CRM114-Status: UNSURE (   9.43  )
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

Fix file entry references to nonexistent files, by either changing them
to the new renamed file or removing them if they were removed or never
existed.

Info on each entry change('R:' means removed):

arch/arm/mach-ep93xx/ts72xx.c
-R: commit e5ef574dda70 ("ARM: ep93xx: delete all boardfiles")
include/linux/dma-buf/
-R: commit 25bd73562941 ("dma: contiguous:
 Turn heap registration logic around")
include/linux/fs_types.h:
-commit 0485a18d9141 ("fs: rename fs_types.h to fs_dirent.h")
arch/powerpc/crypto/aes.c
-R: commit 7cf2082e74ce ("lib/crypto: powerpc/aes: Migrate POWER8
optimized code into library")
drivers/gpu/drm/ci/xfails/powervr*
-Never existed, entry added in:
 commit d7683c49638c
 ("drm/ci: mediatek: add tests for powervr gpu driver")
Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
-commit 74459b0dacce ("dt-bindings: display: bridge:
 convert megachips-stdpxxxx-ge-b850v3-fw.txt to yaml")
 include/dt-bindings/media/*qcom*
-Never existed, entry added in commit bfdfbdf469b4
 ("MAINTAINERS: Add a media/platform/qcom MAINTAINERS entry")

---
Signed-off-by: Eugene Mavick <m@mavick.dev>
---
 MAINTAINERS | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e035a3be797c..143f28a38c97 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2684,7 +2684,6 @@ ARM/CIRRUS LOGIC BK3 MACHINE SUPPORT
 M:	Lukasz Majewski <lukma@denx.de>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-F:	arch/arm/mach-ep93xx/ts72xx.c
 
 ARM/CIRRUS LOGIC EP93XX ARM ARCHITECTURE
 M:	Hartley Sweeten <hsweeten@visionengravers.com>
@@ -7546,7 +7545,6 @@ F:	Documentation/userspace-api/dma-buf-alloc-exchange.rst
 F:	drivers/dma-buf/
 F:	include/linux/*fence.h
 F:	include/linux/dma-buf.h
-F:	include/linux/dma-buf/
 F:	include/linux/dma-resv.h
 F:	rust/helpers/dma-resv.c
 K:	\bdma_(?:buf|fence|resv)\b
@@ -9895,7 +9893,7 @@ S:	Maintained
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
 F:	fs/*
 F:	include/linux/fs.h
-F:	include/linux/fs_types.h
+F:	include/linux/fs_dirent.h
 F:	include/uapi/linux/fs.h
 F:	include/uapi/linux/openat2.h
 F:	rust/kernel/fs.rs
@@ -12350,7 +12348,6 @@ L:	linux-crypto@vger.kernel.org
 S:	Supported
 F:	arch/powerpc/crypto/Kconfig
 F:	arch/powerpc/crypto/Makefile
-F:	arch/powerpc/crypto/aes.c
 F:	arch/powerpc/crypto/aes_cbc.c
 F:	arch/powerpc/crypto/aes_ctr.c
 F:	arch/powerpc/crypto/aes_xts.c
@@ -12560,7 +12557,6 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
 F:	Documentation/devicetree/bindings/gpu/img,powervr-sgx.yaml
 F:	Documentation/gpu/imagination/
-F:	drivers/gpu/drm/ci/xfails/powervr*
 F:	drivers/gpu/drm/imagination/
 F:	include/uapi/drm/pvr_drm.h
 
@@ -16510,7 +16506,7 @@ M:	Peter Senna Tschudin <peter.senna@gmail.com>
 M:	Ian Ray <ian.ray@gehealthcare.com>
 M:	Martyn Welch <martyn.welch@collabora.co.uk>
 S:	Maintained
-F:	Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
+F:	Documentation/devicetree/bindings/display/bridge/megachips,stdp2690-ge-b850v3-fw.yaml
 F:	drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
 
 MEGARAID SCSI/SAS DRIVERS
@@ -22055,7 +22051,6 @@ Q:	https://patchwork.linuxtv.org/project/linux-media/list
 T:	git https://gitlab.freedesktop.org/linux-media/media-committers.git
 F:	Documentation/devicetree/bindings/media/*qcom*
 F:	drivers/media/platform/qcom
-F:	include/dt-bindings/media/*qcom*
 
 QUALCOMM SMB CHARGER DRIVER
 M:	Casey Connolly <casey.connolly@linaro.org>

---
base-commit: 979c294509f9248fe1e7c358d582fb37dd5ca12d
change-id: 20260713-fix-maintainers-entries-4fe40da192d9

Best regards,
-- 
Eugene Mavick <m@mavick.dev>



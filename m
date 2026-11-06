Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0452606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 14:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Kx6zVTMY;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MW2O4YCv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4m1A02l9fBqeaT4qBdXhPAjM2BemeLPvn8bESL+dSEk=; b=Kx6zVTMYRhM6rLR9lyttxnJyjF
	JVa+MtXM2gAiZIEBiq0EkQGFsZqhT9eksLQZ5q282gaKWjdGt3MkU8s54lazz+p41pcu7IVuuy/cr
	cBBZlWgZMJq6D3h+sJ/FMEApKHlsUj1WdhJd+1lzWpZhMN39XJqrmNT6vwsJx9/9yoKACiXkHUHCK
	AWjzkSHforidkzriaP/KUYpdPYnLfPfkbyfw3Fbc6HiMPCFlnRIWvMkMiW4QLNl7VAuyRO3xUHCpD
	Wu/6okLMNBnCGaR/Xy26CpdiPavFjGtXB4kgNtx1rEH1NSGXuXYLvQz7v22P3+v5hnt8SPRfliZa/
	9xicPL4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKnR-0000000CcrI-0TRb;
	Fri, 06 Nov 2026 14:20:01 +0000
Received: from mail-wr1-x446.google.com ([2a00:1450:4864:20::446])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKnM-0000000Cckq-3SIU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 14:19:58 +0000
Received: by mail-wr1-x446.google.com with SMTP id ffacd0b85a97d-492e3189fc9so653450f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 06:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793974794; x=1794579594; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4m1A02l9fBqeaT4qBdXhPAjM2BemeLPvn8bESL+dSEk=;
        b=MW2O4YCvj25k0mNsUBqJ4pKQooHo5hwesXdDN1kKbLUm1r9lL8cTy8EbnonpMcHPQG
         vm+8m8HdOxz9/DuYGx2YoGcJGAor76DXXpzJJ+0DgNzICGtNdYTES3yQGtoxbTtaqLQn
         wrgZkEz7hpTEiBfSHTUcb+tc0UJ9ekZsMUInLJg/2Uo1GqV++YvCjvCpHQ1J+QdS1DsJ
         vS1q4517e+u6DgBLJvmo9YB2dOyzu+jeO26SuBhPtXXh8Ax9LvEyGM521CRZL5NlpE1f
         qgqozL2NlI52X3mcfR+tI+ibsY304ighMiFalbqYK4enYyqfkYWUomvAReKkxiJHxT/U
         FqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793974794; x=1794579594;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4m1A02l9fBqeaT4qBdXhPAjM2BemeLPvn8bESL+dSEk=;
        b=m5KnsBzhfuAJC/KzGDQbn/rC7OHJvEJQVToo+JiNIpPgEUhACYDyv+LO7fMkuI0nMf
         MNAS69y/+XudlL0TLxobMEcYxnooKU+DeFES0l5bRMA0JJdwMBBzxYOiW5JbqeOwBQTS
         c/FWWmRJwb+M+MfUr9s+BsFMb1TzC9Ku0cvC0iV9AVIK37SSFSVOrkgAEmxlL9FXn7Fb
         LEqQGSndnfG/OREG680ZSxarT2XTn9Fvfk9EvxUrlqUIANnf5cWAqP1TzFj9oHvgRYUg
         vLxh1Nw+o8QM8nJVvPcsm6Y2Bwiiv26KFjdL6A49t8bCZSD8EVZBdfGd/jhg8rerchQQ
         V9wA==
X-Gm-Message-State: APuU4Z/hca5fNaQKDKiA9BqGehHlBSTGvV3p75vTmlnnFhjF4lbiCqnh
	FQ9Fe3AMj/MmsgBlkJndtyf7Zs9uNR3pCnWEvX9X28n6a1qsv2mnHYawu5364Hzvh0WmCgTXGg=
	=
X-Received: from wruw16.prod.google.com ([2002:a5d:6810:0:b0:48d:ee5b:2791])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:603:b0:490:9fe2:6a37
 with SMTP id ffacd0b85a97d-49275373b29mr5936762f8f.17.1793974794467; Fri, 06
 Nov 2026 06:19:54 -0800 (PST)
Date: Fri,  6 Nov 2026 15:19:41 +0100
In-Reply-To: <20261106141936.2744481-7-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261106141936.2744481-7-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106141936.2744481-11-ardb+git@google.com>
Subject: [PATCH 4/5] efi/arm64: Expose struct efi_image_info via the image header
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, 
	will@kernel.org, catalin.marinas@arm.com, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_061956_931033_D6683B41 
X-CRM114-Status: GOOD (  18.47  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

The zboot compressed kernel and the uncompressed Image both contain a
copy of the EFI stub, and both are tightly coupled to the kernel image.

However, the zboot stub is not linked into vmlinux like the ordinary EFI
stub is, and so it does not have direct access to its symbols. This is
needed today for things like image size and code size, but there are
more cases coming (DRTM) where both stubs need to have a consistent view
of these things.

So add a struct efi_image_info that is built into vmlinux and exposed
via the image header, so that zboot can access it easily.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 Documentation/arch/arm64/booting.rst      |  3 ++-
 arch/arm64/include/asm/efi.h              |  3 +++
 arch/arm64/include/asm/image.h            |  4 +++-
 arch/arm64/kernel/efi-header.S            |  6 ++++++
 arch/arm64/kernel/head.S                  |  3 ++-
 drivers/firmware/efi/libstub/arm64-stub.c | 14 ++++++++++++++
 drivers/firmware/efi/libstub/arm64.c      |  7 +++++++
 7 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index dae5ff9fae26..2389558bd389 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -84,7 +84,8 @@ The decompressed kernel image contains a 64-byte header as follows::
   u64 flags;			/* kernel flags, little endian */
   u64 res2	= 0;		/* reserved */
   u64 res3	= 0;		/* reserved */
-  u64 res4	= 0;		/* reserved */
+  u32 res4	= 0;		/* reserved */
+  u32 efi_image_info_offset;	/* Offset to struct efi_image_info */
   u32 magic	= 0x644d5241;	/* Magic number, little endian, "ARM\x64" */
   u32 res5;			/* reserved (used for PE COFF offset) */
 
diff --git a/arch/arm64/include/asm/efi.h b/arch/arm64/include/asm/efi.h
index da6afd4a7a27..b0c9120b9741 100644
--- a/arch/arm64/include/asm/efi.h
+++ b/arch/arm64/include/asm/efi.h
@@ -154,4 +154,7 @@ void efi_icache_sync(unsigned long start, unsigned long end);
 // temporary resolution for efistub_get_code_size()
 #define efistub_get_code_size(image_info) ({ extern u32 code_size; code_size; })
 
+struct efi_image_info {
+};
+
 #endif /* _ASM_EFI_H */
diff --git a/arch/arm64/include/asm/image.h b/arch/arm64/include/asm/image.h
index 9ba85173f857..10b35521cf28 100644
--- a/arch/arm64/include/asm/image.h
+++ b/arch/arm64/include/asm/image.h
@@ -36,6 +36,7 @@
  * @image_size:		Effective Image size
  * @flags:		kernel flags
  * @reserved:		reserved
+ * @efi_image_offset:	Offset to struct efi_image_info
  * @magic:		Magic number
  * @reserved5:		reserved, or
  *   @pe_header:	  alternatively used for PE COFF offset
@@ -49,7 +50,8 @@ struct arm64_image_header {
 	__le64 flags;
 	__le64 res2;
 	__le64 res3;
-	__le64 res4;
+	__le32 res4;
+	__le32 efi_image_info_offset;
 	__le32 magic;
 	__le32 res5;
 };
diff --git a/arch/arm64/kernel/efi-header.S b/arch/arm64/kernel/efi-header.S
index 329e8df9215f..62061cb0bf21 100644
--- a/arch/arm64/kernel/efi-header.S
+++ b/arch/arm64/kernel/efi-header.S
@@ -7,6 +7,12 @@
 #include <linux/pe.h>
 #include <linux/sizes.h>
 
+#ifdef CONFIG_EFI
+#define EFI_IMAGE_INFO_OFFSET  __efistub_efi_image_info - .L_head
+#else
+#define EFI_IMAGE_INFO_OFFSET	0
+#endif
+
 	.macro	efi_signature_nop
 #ifdef CONFIG_EFI
 .L_head:
diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
index d6ba3c0af811..f1827e32b0e5 100644
--- a/arch/arm64/kernel/head.S
+++ b/arch/arm64/kernel/head.S
@@ -65,7 +65,8 @@
 	le64sym	_kernel_flags_le		// Informative flags, little-endian
 	.quad	0				// reserved
 	.quad	0				// reserved
-	.quad	0				// reserved
+       .long   0                               // reserved
+       .long   EFI_IMAGE_INFO_OFFSET           // Offset to struct efi_image_info
 	.ascii	ARM64_IMAGE_MAGIC		// Magic number
 	.long	.Lpe_header_offset		// Offset to the PE header.
 
diff --git a/drivers/firmware/efi/libstub/arm64-stub.c b/drivers/firmware/efi/libstub/arm64-stub.c
index 2c3869356147..8daed681f97d 100644
--- a/drivers/firmware/efi/libstub/arm64-stub.c
+++ b/drivers/firmware/efi/libstub/arm64-stub.c
@@ -61,3 +61,17 @@ void efi_icache_sync(unsigned long start, unsigned long end)
 {
 	caches_clean_inval_pou(start, end);
 }
+
+extern const struct efi_image_info efi_image_info;
+
+asm("	.section \".rodata\", \"a\", %progbits;			" \
+    "	.align	3;						" \
+    "	.globl	efi_image_info;					" \
+    "efi_image_info:						" \
+    "	.previous						");
+
+
+const struct efi_image_info *efistub_get_image_info(void)
+{
+	return &efi_image_info;
+}
diff --git a/drivers/firmware/efi/libstub/arm64.c b/drivers/firmware/efi/libstub/arm64.c
index 7ab634e37cf1..190cf180bb23 100644
--- a/drivers/firmware/efi/libstub/arm64.c
+++ b/drivers/firmware/efi/libstub/arm64.c
@@ -135,3 +135,10 @@ void __noreturn efi_enter_kernel(unsigned long entrypoint,
 	enter_kernel = (void *)entrypoint + primary_entry_offset();
 	enter_kernel(fdt_addr, 0, 0, 0);
 }
+
+const struct efi_image_info *zboot_get_image_info(unsigned long image_base)
+{
+	auto header = (const struct arm64_image_header *)image_base;
+
+	return (void *)image_base + header->efi_image_info_offset;
+}
-- 
2.56.0.455.g6c5a503b38-goog



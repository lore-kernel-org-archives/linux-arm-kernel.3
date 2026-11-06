Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4F4606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 14:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YOH1kjC4;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KsnDGo++
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Q87JkWe4IOxAaj+S1cTCBpK2mbAExz1BAJFg9wuG6Mc=; b=YOH1kjC4EWsD6o1YOMMVV5LYB1
	BkwtO17lIqh5DiIfLV8zCNFftc7GdYU5cdfYvr58fuQNhD8GEhCB4WAYeO1s5BdNhqdA2WTbkJod0
	V+qGbK31LNexlYacpYG/dY0JsQ3SXq+kSCfYEKoFMfqXtaglRLrwqRvCf7E46WRUhzCRuJIBH983w
	LqIjmTMHKSTHGJA9pPo9Dn5c5klsR4cA62HFyBXxZF0Hca91gGVp9U1eh+UCtCjQV98vLfdQJIJYJ
	+KLkbNrMwriSGd6+qfqZGNCO3B9Y8x8ZZUlEIbEoVPfj7POQFysK/KzA/iRg0jJlnkS9RF9z+fvFo
	Taq2EAYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKnR-0000000Ccrn-1BJJ;
	Fri, 06 Nov 2026 14:20:01 +0000
Received: from mail-ej1-x648.google.com ([2a00:1450:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKnO-0000000Ccm9-2X2K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 14:19:59 +0000
Received: by mail-ej1-x648.google.com with SMTP id a640c23a62f3a-c49b95262a5so54403966b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 06:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793974796; x=1794579596; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q87JkWe4IOxAaj+S1cTCBpK2mbAExz1BAJFg9wuG6Mc=;
        b=KsnDGo+++XZYj74m0xi1pQZ9nkNTye3XxJEPD+O8LquSy3yonLFMvJtqFfcpP+JT3/
         bI6Cot8D7HaywG1MhovWPtoXkmQvA41Sa89tzXVUa4kVGRR+plVac5kptdvXKl1gl8WE
         6KRW3J6HxeHbijQxRvgnO15KmftJDkHyGMD0/RCxzG22Yw/Uk0CGb4eUFpVw3bBo51s0
         H1WzD9kn/f501CDHYBVlYQcSsMuWsY1M5yXnFUaC5jWqT0Ho5UT3/D8DdV9dp92qsVz6
         39xTZ7YGDJPV7UPQmuGR2xyrn2tZFDlsZ+QgE/GejjhtZU7GcBBIzM6kavI+8noE0h7H
         uZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793974796; x=1794579596;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q87JkWe4IOxAaj+S1cTCBpK2mbAExz1BAJFg9wuG6Mc=;
        b=dbYFxVOwoD1OlbZXkqqBqWMBBcjnmQDAhtmt8tieVrJKXZ6XszvYzMDB61v9lkEZ0l
         HxQHmL8DXmVgofrO3ffMDodu/GcfkHd2oGSNSo0IVEqRAW229gHTPXOIOzAZDa+aB4O6
         GudSkb6F0StwE1CASNKNlLntIqIPp/+R/kkDX6qUP9RelR63odBh9WT9kD9Gi325U8t6
         7jOu8LC45fYXZVyM3oe4AQGOSYxufGsn1UJG2et+L4IRqLy5hIqqLXJwT3V2wMKvM2dY
         KL5DC/5KbcvOPhL9dGnPwKsxI/5kxfolPSnMmyuhYkqzK9CcpyoWv1WAxtnbzHJKb5un
         1apw==
X-Gm-Message-State: APuU4Z9LLhkBry/YCL1X6MerK9w0ur8EoO3aOTY78ZMrkf1dZ8nvIKgJ
	eNQO289BX0v56YubjDs5KO/kUUIFWM0W8zLebLDGl0zRF8tTNI/Ln21tnvLRChBn3Fw11VLZMA=
	=
X-Received: from ejda5.prod.google.com ([2002:a17:906:2745:b0:c3f:8199:7182])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:99c1:b0:c49:df71:14f5
 with SMTP id a640c23a62f3a-c4d34c5fe59mr235201566b.31.1793974795660; Fri, 06
 Nov 2026 06:19:55 -0800 (PST)
Date: Fri,  6 Nov 2026 15:19:42 +0100
In-Reply-To: <20261106141936.2744481-7-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261106141936.2744481-7-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261106141936.2744481-12-ardb+git@google.com>
Subject: [PATCH 5/5] efi/arm64: Drop build and linker script hacks to obtain
 image code size
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, 
	will@kernel.org, catalin.marinas@arm.com, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_061958_746377_E290BDA7 
X-CRM114-Status: GOOD (  13.99  )
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

Instead of taking vmlinux symbol values at build time and poking them
into the zboot linker script, wire up struct efi_image_info so this
information can be obtained from the code.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/boot/Makefile                  |  3 ---
 arch/arm64/include/asm/efi.h              | 11 ++++++++---
 arch/arm64/kernel/image-vars.h            |  4 ----
 drivers/firmware/efi/libstub/arm64-stub.c |  2 ++
 drivers/firmware/efi/libstub/arm64.c      |  4 +---
 drivers/firmware/efi/libstub/zboot.lds    |  7 -------
 6 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/Makefile b/arch/arm64/boot/Makefile
index d42d07667822..509b59518818 100644
--- a/arch/arm64/boot/Makefile
+++ b/arch/arm64/boot/Makefile
@@ -51,7 +51,4 @@ EFI_ZBOOT_BFD_TARGET	:= elf64-littleaarch64
 EFI_ZBOOT_MACH_TYPE	:= ARM64
 EFI_ZBOOT_FORWARD_CFI	:= $(CONFIG_ARM64_BTI_KERNEL)
 
-EFI_ZBOOT_OBJCOPY_FLAGS	= --add-symbol zboot_code_size=0x$$( \
-				$(NM) vmlinux|grep _kernel_codesize|cut -d' ' -f1)
-
 include $(srctree)/drivers/firmware/efi/libstub/Makefile.zboot
diff --git a/arch/arm64/include/asm/efi.h b/arch/arm64/include/asm/efi.h
index b0c9120b9741..3194e133a4d5 100644
--- a/arch/arm64/include/asm/efi.h
+++ b/arch/arm64/include/asm/efi.h
@@ -151,10 +151,15 @@ efi_status_t efi_handle_corrupted_x18(efi_status_t s, const char *f);
 
 void efi_icache_sync(unsigned long start, unsigned long end);
 
-// temporary resolution for efistub_get_code_size()
-#define efistub_get_code_size(image_info) ({ extern u32 code_size; code_size; })
-
 struct efi_image_info {
+	s32 _text_offset;
+	s32 __inittext_end_offset;
 };
 
+static inline u32 efistub_get_code_size(const struct efi_image_info *info)
+{
+	return info->__inittext_end_offset - info->_text_offset;
+}
+#define efistub_get_code_size efistub_get_code_size
+
 #endif /* _ASM_EFI_H */
diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index 19d602e45523..b02234f080b0 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -150,10 +150,6 @@ KVM_NVHE_ALIAS(kvm_protected_mode_initialized);
 
 #endif /* CONFIG_KVM */
 
-#ifdef CONFIG_EFI_ZBOOT
-_kernel_codesize = ABSOLUTE(__inittext_end - _text);
-#endif
-
 /*
  * LLD will occasionally error out with a '__init_end does not converge' error
  * if INIT_IDMAP_DIR_SIZE is defined in terms of _end, as this results in a
diff --git a/drivers/firmware/efi/libstub/arm64-stub.c b/drivers/firmware/efi/libstub/arm64-stub.c
index 8daed681f97d..754cb2843967 100644
--- a/drivers/firmware/efi/libstub/arm64-stub.c
+++ b/drivers/firmware/efi/libstub/arm64-stub.c
@@ -68,6 +68,8 @@ asm("	.section \".rodata\", \"a\", %progbits;			" \
     "	.align	3;						" \
     "	.globl	efi_image_info;					" \
     "efi_image_info:						" \
+    "	.long	_text - efi_image_info;				" \
+    "	.long	__inittext_end - efi_image_info;		" \
     "	.previous						");
 
 
diff --git a/drivers/firmware/efi/libstub/arm64.c b/drivers/firmware/efi/libstub/arm64.c
index 190cf180bb23..da6fa2f6c821 100644
--- a/drivers/firmware/efi/libstub/arm64.c
+++ b/drivers/firmware/efi/libstub/arm64.c
@@ -88,8 +88,6 @@ efi_status_t check_platform_features(void)
 #define DCTYPE	"cvau"
 #endif
 
-u32 __weak code_size;
-
 void efi_cache_sync_image(unsigned long image_base,
 			  unsigned long alloc_size)
 {
@@ -100,7 +98,7 @@ void efi_cache_sync_image(unsigned long image_base,
 	/* only perform the cache maintenance if needed for I/D coherency */
 	if (!(ctr & BIT(CTR_EL0_IDC_SHIFT))) {
 		unsigned long base = image_base;
-		unsigned long size = code_size;
+		unsigned long size = alloc_size;
 
 		do {
 			asm("dc " DCTYPE ", %0" :: "r"(base));
diff --git a/drivers/firmware/efi/libstub/zboot.lds b/drivers/firmware/efi/libstub/zboot.lds
index 367907eb7d86..61714a151766 100644
--- a/drivers/firmware/efi/libstub/zboot.lds
+++ b/drivers/firmware/efi/libstub/zboot.lds
@@ -2,8 +2,6 @@
 
 ENTRY(__efistub_efi_zboot_header);
 
-PROVIDE(zboot_code_size = ABSOLUTE(0));
-
 SECTIONS
 {
 	.head : ALIGN(4096) {
@@ -20,11 +18,6 @@ SECTIONS
 		__efistub_payload_size = . - 4;
 		__efistub__gzdata_end = .;
 		*(.rodata* .init.rodata* .srodata*)
-
-		. = ALIGN(4);
-		__efistub_code_size = .;
-		LONG(zboot_code_size);
-
 		_etext = ALIGN(4096);
 		. = _etext;
 	}
-- 
2.56.0.455.g6c5a503b38-goog



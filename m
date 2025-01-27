Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC75C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 21:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMhIr+En9Z5bHr+SI41rtrYzgjvtxfxDwtbSrjCCifE=; b=1U/MENxr3dhGJoEuiNej2M1GpI
	rVMI939A0Uhy26OMVecv5mgeWlfQKkBpB0WLRxAaMocB6jbTCoL4THRSLaJi6rQNLDACmXcFVWeSQ
	+fJPhOB44QCZI5kAMz94UR7z/5m8ACkLe201KuyjkfBotMw36FYDOojSyQiJhQS9YQf6iZqJJ+ZIU
	pDNjPmwCdM2lC8DYMVaGydTeRM09hB9HSEW+UCUyFR3/THUmp3SOuC3ci2ixbEuloRH9pgDODZNwn
	ljVs9StD5ZVOfG/pAdC5QbWLxrmzJuodernG2zeEIEj+IVk/HAp9FezsyHQfG46qe2iNMh7z9vDL6
	KDHgGlxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcWmu-00000003Jsj-3kNc;
	Mon, 27 Jan 2025 21:36:56 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcWjV-00000003J7A-2AAR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 21:33:26 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2163dc0f689so144567615ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 13:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738013603; x=1738618403; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pMhIr+En9Z5bHr+SI41rtrYzgjvtxfxDwtbSrjCCifE=;
        b=mAwoFjq9jHo7oD+vzMzjuDQcTHeirGF4vZzUeVIHxZEklaQakiccN40BVaouES6YoC
         agx8mn2qP5w5uLe4WC30s32qaaOvmrGkQ8G6adHAs/6ePrkmp3+3MyQVtxPVOqinkA68
         RSDXJSnoTbb7f2fuYZPsRmGmPSToIZ7jQXS3WncZ/IuXYyW0AVKqhO7hzbynTe/Ge+U9
         KSFEIkL83LznqWjBeyp/Y9zfhbPoGjoWzYkYausCndwnuOpQAMTpOuzHi78sk6Yk3JB3
         633DmJ6A1YWRWRLQ9E35N6IJAd6PYz6Hz80nJxJp7I+eg6rc3fw1HOwp5VPi2bRXuE/X
         FjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738013603; x=1738618403;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pMhIr+En9Z5bHr+SI41rtrYzgjvtxfxDwtbSrjCCifE=;
        b=ROUh8ZlUyqm6YyVk2QQh+Yg2pT9uoDCwAxEjgIkIyMXVLpzOWzVRZzDD+wrxvdC9lx
         IYYRjbTEQ2ewDEJI6CcL1ZQfTpr7JQHkLeje3tEAOCkYYDAnExq19SXv8jsGkWXa/Sn7
         8CZtgkg2znnFbjOee6hRT8o01EafexvlPs5bMQrAXB5tWbTTKRZJxMchv2uX8iu15SVM
         eL3Jl+JMGY56YUbE937uInArvjOgWRCRgy0vWF0ccurGKEaYBv+fTQAdTXuatERIm5io
         8JD18XQdwnJSP7Ldeso1Hgy/i4/6U7SnE2CSUt5AsuE+Tdg7eUEknDuNukVgAyg2C+IU
         SZHw==
X-Forwarded-Encrypted: i=1; AJvYcCW4rsysglwHjqOIF+DcIsMGenYUIYNe9WlpT+oHL6isGn5zfMfwbZ04ulZW1stqneC6jJFr51FyDl/Z5LLuF0He@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc6xbFnQCEvJHB6+HEnZ5J6g0j/z2KJ15HqHFKsIqwsavWUcpy
	UFATlRqfOK1PHb1/nwIIt9tnXJJBxQXfxF4PkJr4JwSQSvvgL71w2VO/rFBARh83oQJrAcbMMA=
	=
X-Google-Smtp-Source: AGHT+IFf6J6rV9/t9kV/JQeXUvSzBEZruRhcKXoKcnyF96aSdB43mkOwhOGscpzW9zOTOb0X7BG/2BEB9g==
X-Received: from pfbjc33.prod.google.com ([2002:a05:6a00:6ca1:b0:728:b3dd:ba8c])
 (user=wnliu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:430d:b0:1e1:aef4:9ce7
 with SMTP id adf61e73a8af0-1eb214a08b6mr60696359637.17.1738013603568; Mon, 27
 Jan 2025 13:33:23 -0800 (PST)
Date: Mon, 27 Jan 2025 21:33:03 +0000
In-Reply-To: <20250127213310.2496133-1-wnliu@google.com>
Mime-Version: 1.0
References: <20250127213310.2496133-1-wnliu@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250127213310.2496133-2-wnliu@google.com>
Subject: [PATCH 1/8] unwind: build kernel with sframe info
From: Weinan Liu <wnliu@google.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Indu Bhagat <indu.bhagat@oracle.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev, 
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	joe.lawrence@redhat.com, linux-arm-kernel@lists.infradead.org, 
	Weinan Liu <wnliu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_133325_552297_71581EA4 
X-CRM114-Status: GOOD (  14.95  )
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

Use the -Wa,--gsframe flags to build the code, so GAS will generate
a new .sframe section for the stack trace information.
Currently, the sframe format only supports arm64 and x86_64
architectures. Add this configuration on arm64 to enable sframe
unwinder in the future.

Signed-off-by: Weinan Liu <wnliu@google.com>
---
 Makefile                          |  6 ++++++
 arch/Kconfig                      |  8 ++++++++
 arch/arm64/Kconfig.debug          | 10 ++++++++++
 include/asm-generic/vmlinux.lds.h | 12 ++++++++++++
 4 files changed, 36 insertions(+)

diff --git a/Makefile b/Makefile
index b9464c88ac72..35200c39b98d 100644
--- a/Makefile
+++ b/Makefile
@@ -1064,6 +1064,12 @@ ifdef CONFIG_CC_IS_GCC
 KBUILD_CFLAGS   += -fconserve-stack
 endif
 
+# build with sframe table
+ifdef CONFIG_SFRAME_UNWIND_TABLE
+KBUILD_CFLAGS	+= -Wa,--gsframe
+KBUILD_AFLAGS	+= -Wa,--gsframe
+endif
+
 # change __FILE__ to the relative path to the source directory
 ifdef building_out_of_srctree
 KBUILD_CPPFLAGS += $(call cc-option,-fmacro-prefix-map=$(srcroot)/=)
diff --git a/arch/Kconfig b/arch/Kconfig
index 6682b2a53e34..ae70f7dbe326 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1736,4 +1736,12 @@ config ARCH_WANTS_PRE_LINK_VMLINUX
 	  An architecture can select this if it provides arch/<arch>/tools/Makefile
 	  with .arch.vmlinux.o target to be linked into vmlinux.
 
+config AS_HAS_SFRAME_SUPPORT
+	# Detect availability of the AS option -Wa,--gsframe for generating
+	# sframe unwind table.
+	def_bool $(cc-option,-Wa$(comma)--gsframe)
+
+config SFRAME_UNWIND_TABLE
+	bool
+
 endmenu
diff --git a/arch/arm64/Kconfig.debug b/arch/arm64/Kconfig.debug
index 265c4461031f..ed619fcb18b3 100644
--- a/arch/arm64/Kconfig.debug
+++ b/arch/arm64/Kconfig.debug
@@ -20,4 +20,14 @@ config ARM64_RELOC_TEST
 	depends on m
 	tristate "Relocation testing module"
 
+config SFRAME_UNWINDER
+	bool "Sframe unwinder"
+	depends on AS_HAS_SFRAME_SUPPORT
+	depends on 64BIT
+	select SFRAME_UNWIND_TABLE
+	help
+	  This option enables the sframe (Simple Frame) unwinder for unwinding
+	  kernel stack traces. It uses unwind table that is direclty generated
+	  by toolchain based on DWARF CFI information
+
 source "drivers/hwtracing/coresight/Kconfig"
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 54504013c749..6a437bd084c7 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -469,6 +469,8 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
 		*(.rodata1)						\
 	}								\
 									\
+	SFRAME								\
+									\
 	/* PCI quirks */						\
 	.pci_fixup        : AT(ADDR(.pci_fixup) - LOAD_OFFSET) {	\
 		BOUNDED_SECTION_PRE_LABEL(.pci_fixup_early,  _pci_fixups_early,  __start, __end) \
@@ -886,6 +888,16 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
 #define TRACEDATA
 #endif
 
+#ifdef CONFIG_SFRAME_UNWIND_TABLE
+#define SFRAME							\
+	/* sframe */						\
+	.sframe        : AT(ADDR(.sframe) - LOAD_OFFSET) {	\
+		BOUNDED_SECTION_BY(.sframe, _sframe_header)	\
+	}
+#else
+#define SFRAME
+#endif
+
 #ifdef CONFIG_PRINTK_INDEX
 #define PRINTK_INDEX							\
 	.printk_index : AT(ADDR(.printk_index) - LOAD_OFFSET) {		\
-- 
2.48.1.262.g85cc9f2d1e-goog



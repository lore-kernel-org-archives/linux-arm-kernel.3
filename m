Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CE060A263D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 15:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q3iMXxqD;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=htJnS9hx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Ny2Hy9Mzlnu/irTWRQwR1/WlJvUQjJeELVkcpKY7pE=; b=Q3iMXxqD1LKu2oeeWXKk8Ez06H
	fNViCRoX4KJS+EirItPpBWWfTnpVeYrCTfpfep4hsZfIy69a9tm8tWK1f10CYmO8boCzEWF5hLGgG
	riSyeLwKM6bUfLcSKkH/JE+b4IFA8K4P7JLQd3EEz9WmlCrE8X64/Y5bJCmLcIvZXv36gXQX+Ly+I
	h/TvppnlFkyWJ8YwdX4r5euJYCpNxiVezUrRM79Bs/Rfzs60IEt8b5q0O54xXYrxAk1bWR1YpkcJR
	9w6/n7L1dAOhJ51q1Ho8c3vkipvJ6HJR/yNbFIfflqYZqXyU7DLktwx4W2fC2AfjuZogORZilSZs3
	6fgE8dTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBuS-0000000A4Lk-3A7Y;
	Tue, 20 Oct 2026 15:37:52 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBuH-0000000A4Gz-0GIr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 15:37:46 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-36681e85e87so986494eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 08:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792510660; x=1793115460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Ny2Hy9Mzlnu/irTWRQwR1/WlJvUQjJeELVkcpKY7pE=;
        b=htJnS9hxtDuIU/i157oiy99s2zYajvtYqG5uTodHw0gUDjaoeMtEZTM4rodi/5zZIc
         6mjRU6NkPBCbxrHEv0ln7Pu0bVlmdWgJZ28IeGiIECrzooJbJkpehyAjCqDd+1TvNepC
         NmQrBLMr9kc6wEd6wi0qeKItefiAX39fMWehM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510660; x=1793115460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Ny2Hy9Mzlnu/irTWRQwR1/WlJvUQjJeELVkcpKY7pE=;
        b=i3OW6wwQG+mXDZfoETxzgDczkSkMea7+5ClF1Mz0CbgDA7h2VSS2v4dVP9/9/NYfvW
         HRH23rZngGYGkk/BUHKkAL4YcU/Tz7FKoklRela3TBfW1YiNVGrSXHSWfkvqVrU+oR50
         8g3qc3tVA8lLNoZkVxhOl2uU+s+wFqXn5Sh6dEju5BEihJGd/rRmQQ5ZUfVaNmpWV4vw
         LWdSwUw56AMagncQs43u2r6D5nDVaes4c2aHxZuccWmYb2U2gMflK3oagxmt6LRHxB7g
         jGcv4xktreENj+JwYm1zP8TAIx7lTuXmXDq3eGDfwhiL5DLTs5lYLd9cNk9BDSIB0b0r
         ar8w==
X-Forwarded-Encrypted: i=1; AKwUvByQMhrMo+mKCsFrKQ3kcwAUxFsPM0vzaCg1feZnXaLKH/LVVqC/yS+e0laI5ipaVDLnEJO9lDBngK92VArjiugz@lists.infradead.org
X-Gm-Message-State: AFq9FYLmkkBROx5PJB7OfOLxIADJKMY8PyHwzNQ7MlYEAgwsivFbq5Hw
	CFU6YiNgtk8kWSsgF+s9PhakuPGgh5MzsrgDMNn2IBp2MkMF7ayxl2s7+gniCHXrMg==
X-Gm-Gg: AYBFou143xq+57M/2NmfBCq/NZgEM65/2e2bBgE30EfVQDQs27BF38Y393WQjuUVnbl
	IAGZuXIGx08NdMNjD3vNdVtJW+K7bCqA34goNDKJ+WLUeWxZ+YW9Z7Q4JiUJslVkBlvTlp0w0fh
	Sj3Khxp2tGxi/2cdagii9ehhXIyTNLZQ31J/RGRoKTod9vOPHOKncEuHKyss80BgydEDc+9Z8jU
	fefjEBwWVBbGBftBuR8OtMuj6CdxeIg+E9TWCIVmJFsFXk1kjjWF2YpW/CgaAWEKWvSyCeEkB3H
	irAlgXeEVQ0IhJ5gfQCNSzZuYo/QrveQMwmFrQa3/Va51dW100JPFgw47SnHanRH9wDz36NUrvf
	Fc6d3hTUAVKOWMcMiiLAPSrLidkDsL2i+AUmdTgpphCVlmiwVem393urtN8JY19F65HcCATSfIn
	leqvszWSL+lvnaIGtTNTMRlrxOjHqjb6/wiqK9mVHS9L1piwp/fKs/AEnV6eiXYIc+K2wZVjvKM
	Qyo99jUDOrprFVv4KLNeDE6FjPYba5UhmXzFq4JzWHuPv4P89ejPbD1SeEP8qw8MHqC2g==
X-Received: by 2002:a05:7301:b0e:b0:367:16cf:4a8d with SMTP id 5a478bee46e88-36716cf4f7amr259864eec.35.1792510659838;
        Tue, 20 Oct 2026 08:37:39 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:1eb1:e432:2cc7:349c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm51324714eec.3.2026.10.20.08.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:37:38 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	Nicolas Schier <nsc@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Devicetree@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Will Deacon <will@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Andrew Jones <andrew.jones@linux.dev>,
	Breno Leitao <leitao@debian.org>,
	David Sterba <dsterba@suse.com>,
	Gary Guo <gary@garyguo.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Luis Augenstein <luis.augenstein@tngtech.com>,
	Marco Elver <elver@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nick Terrell <terrelln@fb.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Rong Xu <xur@google.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 4/7] arm64: boot: Support building image.fit from a specified FIT_ITS script
Date: Tue, 20 Oct 2026 08:35:22 -0700
Message-ID: <20261020083501.RFC.4.I5cd8aab4380bc4cfd302c4e4708af58c43370715@changeid>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261020153652.2907186-1-dianders@chromium.org>
References: <20261020153652.2907186-1-dianders@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_083741_113689_1279D59F 
X-CRM114-Status: GOOD (  22.59  )
X-Spam-Score: -2.4 (--)
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Allow passing `FIT_ITS=<path>` on the make command line (relative to
either `$(srctree)` or `arch/arm64/boot/dts/`) when building `image.fit`
to assemble the FIT image from a checked-in `.its` script via `mkimage`
instead of auto-generating a FIT image with `scripts/make_fit.py`. When
`FIT_ITS` is not specified, `image.fit` continues to be built using
`scripts/make_fit.py` as before.

Supporting a checked-in `.its` script includes:
- Adding `cmd_lz4_frame` (`Image-framed.lz4` and `%.dtb.lz4`) for
  standard LZ4 frame compression (magic `0x184d2204`) expected by FIT
  bootloaders such as U-Boot and depthcharge, plus generic compressed
  DTB rules (`bz2`, `gz`, `lz4`, `lzma`, `lzo`, `zst`, `xz`) in
  `scripts/Makefile.dtbs`.
- Restricting `$(dtb-y)` to the DTBs referenced via `/incbin/(...)` in
  `$(FIT_ITS)` and automatically building the referenced kernel image
  target (e.g. `Image-framed.lz4`) and any compressed `.dtb.<ext>`
  blobs.
- Populating any omitted `compatible` property on
  `/configurations/conf-*` nodes in `cmd_fit_its` from the
  corresponding uncompressed `.dtb`'s root `/compatible` property
  using `fdtget` and `fdtput`. This is useful so we don't have to
  manually keep the .its script in sync with the source. This is extra
  important if compression is used since the bootloader may not be
  able to easily peek into the device trees itself.

The main motivation for checking in an .its script instead of using an
auto-generated one is to be able to manually set the "description"
field of the configurations. This allows us to provide information that
the bootloader can use to figure out which configuration(s) to load.
This idea came from Michal Simek.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Makefile                 |  2 +-
 arch/arm64/Makefile      |  3 ++
 arch/arm64/boot/Makefile |  9 ++++--
 scripts/Makefile.dtbs    | 43 ++++++++++++++++++++++++++++-
 scripts/Makefile.lib     | 59 ++++++++++++++++++++++++++++++++++++++++
 5 files changed, 111 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 0dc1a9f4e63e..8c5500179e2e 100644
--- a/Makefile
+++ b/Makefile
@@ -2239,7 +2239,7 @@ clean: $(clean-dirs)
 		\( -name '*.[aios]' -o -name '*.rsi' -o -name '*.ko' -o -name '.*.cmd' \
 		-o -name '*.ko.*' -o -name '*.o.thinlto.bc' \
 		-o -name '*.dtb' -o -name '*.dtbo' \
-		-o -name '*.dtb.S' -o -name '*.dtbo.S' \
+		-o -name '*.dtb.*' -o -name '*.dtbo.S' \
 		-o -name '*.dt.yaml' -o -name 'dtbs-list' \
 		-o -name '*.dwo' -o -name '*.lst' \
 		-o -name '*.su' -o -name '*.mod' \
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 6b005c8fef70..f9a25db9ae03 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -185,6 +185,9 @@ $(BOOT_TARGETS): vmlinux
 Image.%: Image
 	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
 
+Image-framed.%: Image
+	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
+
 ifeq ($(CONFIG_COMPRESSED_INSTALL),y)
  DEFAULT_KBUILD_IMAGE = $(KBUILD_IMAGE)
 else
diff --git a/arch/arm64/boot/Makefile b/arch/arm64/boot/Makefile
index b5a08333bc57..fe21bace3692 100644
--- a/arch/arm64/boot/Makefile
+++ b/arch/arm64/boot/Makefile
@@ -16,8 +16,8 @@
 
 OBJCOPYFLAGS_Image :=-O binary -R .note -R .note.gnu.build-id -R .comment -S
 
-targets := Image Image.bz2 Image.gz Image.lz4 Image.lzma Image.lzo \
-	Image.zst Image.xz image.fit
+targets := Image Image.bz2 Image.gz Image.lz4 Image-framed.lz4 Image.lzma \
+	Image.lzo Image.zst Image.xz image.fit
 
 $(obj)/Image: vmlinux FORCE
 	$(call if_changed,objcopy)
@@ -31,6 +31,9 @@ $(obj)/Image.gz: $(obj)/Image FORCE
 $(obj)/Image.lz4: $(obj)/Image FORCE
 	$(call if_changed,lz4)
 
+$(obj)/Image-framed.lz4: $(obj)/Image FORCE
+	$(call if_changed,lz4_frame)
+
 $(obj)/Image.lzma: $(obj)/Image FORCE
 	$(call if_changed,lzma)
 
@@ -44,7 +47,7 @@ $(obj)/Image.xz: $(obj)/Image FORCE
 	$(call if_changed,xzkern)
 
 $(obj)/image.fit: $(obj)/Image $(obj)/dts/dtbs-list FORCE
-	$(call if_changed,fit)
+	$(if $(FIT_ITS_FILE),$(call if_changed,fit_its),$(call if_changed,fit))
 
 EFI_ZBOOT_PAYLOAD	:= Image
 EFI_ZBOOT_BFD_TARGET	:= elf64-littleaarch64
diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
index c4e466390284..1bc42b30cc52 100644
--- a/scripts/Makefile.dtbs
+++ b/scripts/Makefile.dtbs
@@ -5,6 +5,26 @@ all-dtb := $(dtb-y) $(dtb-)
 # If CONFIG_OF_ALL_DTBS is enabled, all DT blobs are built
 dtb-$(CONFIG_OF_ALL_DTBS) += $(dtb-)
 
+# If FIT_ITS is specified, restrict $(dtb-y) to only the DTBs referenced via
+# /incbin/(...) in $(FIT_ITS_FILE) and also build any compressed .dtb.<ext>
+# blobs referenced there alongside their base .dtb.
+ifdef FIT_ITS_FILE
+ifneq ($(filter arch/$(SRCARCH)/boot/dts%, $(obj)),)
+its-dtb-files := $(notdir $(shell $(call fit_its_incbin,\.dtb)))
+
+# Strip compression and .dtb suffixes to get stem names (e.g. "foo", "bar"),
+# then intersect with the stems in this directory's $(all-dtb).
+its-dtb-stems := $(patsubst %.dtb, %, \
+	$(filter %.dtb, $(its-dtb-files) $(basename $(its-dtb-files))))
+its-local-stems := $(filter $(patsubst %.dtb, %, $(all-dtb)), $(its-dtb-stems))
+
+# Build only the matching base .dtb files and any compressed .dtb.<ext> variants
+dtb-y := $(addsuffix .dtb, $(its-local-stems))
+its-dtb-comp := $(addprefix $(obj)/, \
+	$(foreach d, $(its-local-stems), $(filter $(d).dtb.%, $(its-dtb-files))))
+endif
+endif
+
 # Composite DTB (i.e. DTB constructed by overlay)
 multi-dtb-y := $(call multi-search, $(dtb-y), .dtb, -dtbs)
 # Primitive DTB compiled from *.dts
@@ -23,7 +43,7 @@ dtb-y           := $(addprefix $(obj)/, $(dtb-y))
 multi-dtb-y     := $(addprefix $(obj)/, $(multi-dtb-y))
 real-dtb-y      := $(addprefix $(obj)/, $(real-dtb-y))
 
-always-y        += $(dtb-y)
+always-y        += $(dtb-y) $(its-dtb-comp)
 targets         += $(real-dtb-y)
 
 # dtbs-list
@@ -142,6 +162,27 @@ $(obj)/%.dtb: $(obj)/%.dts $(DTC) $(DT_TMP_SCHEMA) FORCE
 $(obj)/%.dtbo: $(src)/%.dtso $(DTC) FORCE
 	$(call if_changed_dep,dtc)
 
+$(obj)/%.dtb.bz2: $(obj)/%.dtb FORCE
+	$(call if_changed,bzip2)
+
+$(obj)/%.dtb.gz: $(obj)/%.dtb FORCE
+	$(call if_changed,gzip)
+
+$(obj)/%.dtb.lz4: $(obj)/%.dtb FORCE
+	$(call if_changed,lz4_frame)
+
+$(obj)/%.dtb.lzma: $(obj)/%.dtb FORCE
+	$(call if_changed,lzma)
+
+$(obj)/%.dtb.lzo: $(obj)/%.dtb FORCE
+	$(call if_changed,lzo)
+
+$(obj)/%.dtb.zst: $(obj)/%.dtb FORCE
+	$(call if_changed,zstd)
+
+$(obj)/%.dtb.xz: $(obj)/%.dtb FORCE
+	$(call if_changed,xzmisc)
+
 # targets
 # ---------------------------------------------------------------------------
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 0a4fdd8bd975..91880648fe21 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -383,9 +383,16 @@ quiet_cmd_lzo = LZO     $@
 quiet_cmd_lzo_with_size = LZO     $@
       cmd_lzo_with_size = { cat $(real-prereqs) | $(KLZOP) -9; $(size_append); } > $@
 
+# cmd_lz4 uses -l (legacy format, magic 0x184c2102) required by the kernel's
+# in-tree decompressor (lib/decompress_unlz4.c). Bootloaders that decompress
+# FIT images (such as U-Boot and depthcharge) require the standard LZ4 frame
+# format (magic 0x184d2204, without -l), provided by cmd_lz4_frame.
 quiet_cmd_lz4 = LZ4     $@
       cmd_lz4 = cat $(real-prereqs) | $(LZ4) -l -9 - - > $@
 
+quiet_cmd_lz4_frame = LZ4     $@
+      cmd_lz4_frame = $(LZ4) -12 -z -f -q $< $@
+
 quiet_cmd_lz4_with_size = LZ4     $@
       cmd_lz4_with_size = { cat $(real-prereqs) | $(LZ4) -l -9 - -; \
                   $(size_append); } > $@
@@ -429,6 +436,58 @@ quiet_cmd_fit = FIT     $@
 		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
 		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
 
+# If FIT_ITS is specified on the command line (either relative to $(srctree)
+# or relative to arch/$(SRCARCH)/boot/dts/), locate that .its script and
+# define a helper to extract /incbin/("...") paths from it.
+ifdef FIT_ITS
+FIT_ITS_FILE := $(firstword $(wildcard \
+	$(FIT_ITS) \
+	$(srctree)/$(FIT_ITS) \
+	$(srctree)/arch/$(SRCARCH)/boot/dts/$(FIT_ITS)))
+ifeq ($(FIT_ITS_FILE),)
+$(error FIT_ITS '$(FIT_ITS)' not found)
+endif
+
+# Extract /incbin/("...") path(s) from $(FIT_ITS_FILE).
+# $(1): optional pattern to match inside the /incbin/("...") path
+# $(2): optional image node name to restrict the search to
+fit_its_incbin = sed -n \
+	"$(if $(2),/^[[:space:]]*$(2)[[:space:]]*{/$(comma)/\/incbin\//) \
+	s|.*/incbin/(\"\([^\"]*$(1)[^\"]*\)\").*|\1|p" \
+	$(FIT_ITS_FILE)
+
+ifneq ($(filter image.fit,$(targets)),)
+FIT_ITS_IMAGES := $(addprefix $(obj)/, \
+	$(notdir $(shell $(call fit_its_incbin,Image))))
+FIT_ITS_DTBS := $(addprefix $(objtree)/, \
+	$(shell $(call fit_its_incbin,\.dtb)))
+$(obj)/image.fit: $(FIT_ITS_IMAGES) $(FIT_ITS_DTBS) $(FIT_ITS_FILE)
+endif
+endif
+
+# Build the FIT image from the .its script with mkimage and populate any
+# missing 'compatible' property on /configurations/conf-* nodes from the
+# corresponding uncompressed .dtb's root '/compatible' property using
+# fdtget/fdtput.
+quiet_cmd_fit_its = FIT     $@
+      cmd_fit_its = \
+		PATH="$(abspath $(objtree))/scripts/dtc:$(PATH)"; \
+		$(BASH) $(MKIMAGE) \
+			-D "-I dts -O dtb -i $(objtree) -i $(srctree)" \
+			-f $(FIT_ITS_FILE) $@; \
+		configs=$$(fdtget -l $@ /configurations); \
+		for c in $$configs; do \
+			conf=/configurations/$$c; \
+			if [ -n "$$(fdtget -d '' $@ $$conf compatible)" ]; then \
+				continue; \
+			fi; \
+			fdt=$$(fdtget $@ $$conf fdt); \
+			inc=$$($(call fit_its_incbin,\.dtb,$$fdt)); \
+			dtb="$(objtree)/$${inc%.dtb*}.dtb"; \
+			compat=$$(fdtget -ts "$$dtb" / compatible); \
+			fdtput -ts $@ $$conf compatible $$compat; \
+		done
+
 # XZ
 # ---------------------------------------------------------------------------
 # Use xzkern or xzkern_with_size to compress the kernel image and xzmisc to
-- 
2.56.0.212.g129ede20d9-goog



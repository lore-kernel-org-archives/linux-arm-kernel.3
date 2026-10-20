Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E493D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 15:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4lU+M+fv;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EYeg19Yk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gf3+S05VHu9WM8VhO/IFJLzS95PZV+LAb8RqT/X+Ms4=; b=4lU+M+fv1QbQPHiq/qtUdZrEIn
	cAPL58Tm87OHil8bcc1Dy6hWccf/2Vp1wrbKGTANLqpvQsv6VNmO7yjBIDSRbwf8B7HVXCiM/kcGs
	3uHyhxMdKTPOSf4ZG5nOvuM80xFzhTNd5B5uRgXcCmL0cM3Suj5o0Q0hMbZCQ4rb0b3wGVAPe+WB2
	P+MObdcwT7o+uFTj68QKU9H9JXzcwniT1Op5YZMFHrD+r+yjlKgVoiW8WBc7dlHtMGrzUDpyR86Ut
	kCIhI3+d8/PiYBsduwzasaV/AueeGG9EpOojTlip36yuY4z/xjCosOYB3MmQk1QVnfG5FsF0FzNqZ
	oCWdvuTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBuS-0000000A4Lz-3fZG;
	Tue, 20 Oct 2026 15:37:52 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBuK-0000000A4Hy-17Ru
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 15:37:49 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-366421dc8ebso1152992eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 08:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792510663; x=1793115463; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gf3+S05VHu9WM8VhO/IFJLzS95PZV+LAb8RqT/X+Ms4=;
        b=EYeg19YkXQgOXct1R26ddKre6JIVYSz2guhpod6EiwDI9bLY02yCPa4QkBNqIe6Zbt
         SSQH8W2XctnkalWaZgqSDRRhb4idyLUlsYWYwlNj0J3QClecCvuWYrWDk5PwigcNdQIT
         bB9hzo6YNNoHjwfLb1ELX6wqXvXLpFctXysKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510663; x=1793115463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gf3+S05VHu9WM8VhO/IFJLzS95PZV+LAb8RqT/X+Ms4=;
        b=WblZSJ7JvXG4xnb4hZfI1/CHtFeGE9tI5gDZDu/toDVhchgnngJn2h7GeCfHMrPIem
         6UyPuS5uFF7eeobgKHVXy4Kg1DQRceH+ZjdMWcr/x2Gs8u0M+Wwa8LON4UwFlthS34hJ
         8wd+TgWRN5qOAAfwKs2Yy21Z/2peZaR1RKlPZZShDOhB3QzpCkVUEkUjvvMRxy3qp3Y6
         VQi3a97o39mOnxgCDf/KJ5MSD0wyfpFdR3aIjnWQ7G4nGQEDuZ1RrClHaTiixLqMrS5V
         dZ/sHmnazR7dQ8A8jcXwEESsiAt6XcfNyEAh9MUq6G8pXg/wA8BoSlzVS63cQOWTeGVX
         cWOQ==
X-Forwarded-Encrypted: i=1; AKwUvByxJYd933arDEGVE9Yzxja+oIjbPIPHSJeu/IsWapLY7YVHwPjfhl+xpip+Fd9PnFE2f1BOcqrDQ5PDLgvoM1iG@lists.infradead.org
X-Gm-Message-State: AFq9FYI0Y1Aw92y1CXqcS/oFVKAtClbH7gxhHzGQa0XRmcV/Jkb7c4NS
	Bme8EeP/OjWiFFf3PZx6owfvP72+iMJCaBOM/qkRBT9c1P+pnEwrb8cKRfDxeaRkuQ==
X-Gm-Gg: AYBFou2VpQ1uy0DaY3j69ArmW9p4Z1+6L3XaAss4Ka+y/4X2tjlGbyH+M2rIRkT2ni1
	JAs+segq6LuI90TN6XyEHqX/wAg8NttkPAhsUvyk9POac1fSE32qj6zQwN+6Q+CvXXuPxWhAvOF
	E0WYB3xHfTEvm6BB0RIvNkMUBA6zI0jkZiGcFYmzbap+tH75mGjWSOHA/Q7pqyMmRIJ6NVNvo9/
	TRRY4jKVHvNjgRnfCp7BBmcxGDTjQkkNqm3caKPvN2TjV/U751nqsCQDR8GFR0bS9rG/qUBGVJR
	Sia8bmVRcvpZ2xzQH6M8ergDIMmgih1cAMJbsAckA9RZEctmC4LEo5LH5acKDNdrzPzN00O34IG
	eApUOU2MvQOYYMQqySdLtGVr4IcEPyhGLPZ2g19KsrUXNXOrhja/FanP1+xW2aRzSkQN2XFlR2U
	IyaQ02DPSpGPoX0r1RNHNkqyeHQSQY7xbYMTEiQbZeo6tyiWlg8dFbHJgvbAjJtwbjp9vtcQn0m
	YrLUW+zGBCJ1ej+Jv8Ws1HQRXH2yyFiCq7Xy8sgMX3x+MgucylOvgyIBdRZS7PQXB76Eh2qM8/w
	C7Y0cdVF5Gpf4ZST8yDqmIAryljrVNH1JVFF+vg/
X-Received: by 2002:a05:7301:619b:10b0:361:2a55:b94e with SMTP id 5a478bee46e88-365fb17e9d4mr2922006eec.15.1792510663086;
        Tue, 20 Oct 2026 08:37:43 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:1eb1:e432:2cc7:349c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm51324714eec.3.2026.10.20.08.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:37:41 -0700 (PDT)
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
	Alice Ryhl <aliceryhl@google.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Marco Elver <elver@google.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Rong Xu <xur@google.com>,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 5/7] kbuild: fit: Add opt-in FIT_FACTOR_DTBS support using fdtfactor
Date: Tue, 20 Oct 2026 08:35:23 -0700
Message-ID: <20261020083501.RFC.5.I4a691041bb6d31e5ab2fde8cd4139ca72ee72c5b@changeid>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261020153652.2907186-1-dianders@chromium.org>
References: <20261020153652.2907186-1-dianders@chromium.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_083744_310836_246B920F 
X-CRM114-Status: GOOD (  16.42  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add opt-in support for factoring the DTBs inside a compiled FIT image
into shared base DTBs and per-board overlays using `fdtfactor` when
`FIT_FACTOR_DTBS=1` is passed to make:

- When `FIT_FACTOR_DTBS` is set, pass `-@ -L` to `dtc` for the DTBs
  included in the FIT image so they retain `/__symbols__` and
  `/__local_fixups__` metadata needed for factoring.
- Run `$(FDTFACTOR) $(FDTFACTOR_ARGS) -f $@` (with `FDTFACTOR_ARGS`
  defaulting to `--strip-local-fixups`) at the end of `cmd_fit` and
  `cmd_fit_its` when `FIT_FACTOR_DTBS` is set.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
You can see the fdtfactor post at:
 http://lore.kernel.org/r/20261015182221.2931742-1-dianders@chromium.org

This patch obviously could only land if some form of that series
lands. Presumably we'd also want to import fdtfactor into the local
kernel copy of the devicetree compiler before this patch.

If people hate this patch, we could certainly just run `fdtfactor`
after the kernel build finishes.

 scripts/Makefile.dtbs |  8 ++++++++
 scripts/Makefile.lib  | 18 ++++++++++++------
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
index 1bc42b30cc52..4b8d7039e45d 100644
--- a/scripts/Makefile.dtbs
+++ b/scripts/Makefile.dtbs
@@ -137,6 +137,14 @@ DTC_FLAGS += -Wnode_name_chars_strict \
              -Wunique_unit_address
 endif
 
+# When FIT_FACTOR_DTBS is set, pass -@ -L to dtc so the built DTBs retain the
+# /__symbols__ and /__local_fixups__ nodes required by fdtfactor.
+ifneq ($(FIT_FACTOR_DTBS),)
+ifneq ($(filter arch/$(SRCARCH)/boot/dts%, $(obj)),)
+DTC_FLAGS += -@ -L
+endif
+endif
+
 DTC_FLAGS += $(DTC_FLAGS_$(target-stem))
 
 # Set -@ if the target is a base DTB that overlay is applied onto
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 91880648fe21..bcb2b0e749a3 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -425,6 +425,8 @@ quiet_cmd_uimage = UIMAGE  $@
 # ---------------------------------------------------------------------------
 
 MAKE_FIT := $(srctree)/scripts/make_fit.py
+FDTFACTOR ?= fdtfactor
+FDTFACTOR_ARGS ?= --strip-local-fixups
 
 # Use this to override the compression algorithm
 FIT_COMPRESSION ?= gzip
@@ -434,7 +436,9 @@ quiet_cmd_fit = FIT     $@
 		--name '$(UIMAGE_NAME)' $(FIT_EXTRA_ARGS) \
 		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
 		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
-		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
+		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^) \
+		$(if $(FIT_FACTOR_DTBS),&& $(FDTFACTOR) $(FDTFACTOR_ARGS) \
+			$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) -f $@)
 
 # If FIT_ITS is specified on the command line (either relative to $(srctree)
 # or relative to arch/$(SRCARCH)/boot/dts/), locate that .its script and
@@ -465,10 +469,10 @@ $(obj)/image.fit: $(FIT_ITS_IMAGES) $(FIT_ITS_DTBS) $(FIT_ITS_FILE)
 endif
 endif
 
-# Build the FIT image from the .its script with mkimage and populate any
-# missing 'compatible' property on /configurations/conf-* nodes from the
-# corresponding uncompressed .dtb's root '/compatible' property using
-# fdtget/fdtput.
+# Build the FIT image from the .its script with mkimage, populate any missing
+# 'compatible' property on /configurations/conf-* nodes from the corresponding
+# uncompressed .dtb's root '/compatible' property using fdtget/fdtput, and
+# optionally factor the DTBs with fdtfactor when FIT_FACTOR_DTBS is set.
 quiet_cmd_fit_its = FIT     $@
       cmd_fit_its = \
 		PATH="$(abspath $(objtree))/scripts/dtc:$(PATH)"; \
@@ -486,7 +490,9 @@ quiet_cmd_fit_its = FIT     $@
 			dtb="$(objtree)/$${inc%.dtb*}.dtb"; \
 			compat=$$(fdtget -ts "$$dtb" / compatible); \
 			fdtput -ts $@ $$conf compatible $$compat; \
-		done
+		done \
+		$(if $(FIT_FACTOR_DTBS),; $(FDTFACTOR) $(FDTFACTOR_ARGS) \
+			$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) -f $@)
 
 # XZ
 # ---------------------------------------------------------------------------
-- 
2.56.0.212.g129ede20d9-goog



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957A6606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 15:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IiwwGq/j;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=fmJYHPg1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ldWxVHDgUgQ18jFdtDAJ8jJd2yZcZSUNdb3f55SGTX0=; b=IiwwGq/jglixEMSC4S4m/Rlk0F
	2E01C5MQCFhEsdEZz2fGZvHbPTmoxRDTNPIfGaKpf9NCCXqXYJuwPc6Msdew4YsQCGObhYYJHb2va
	KgULLZIWfjHcIABiZaR7MmBBrprs4OATmbMB+ZcsVbBVtJKikS26Ypr2RGErMCYBsfbFouxz4zxan
	7ihRbbCrZtJIss8XaAJi9BF+dDt7Qd0Oocl9pKFIzoNlvrMf2mkvx9RDUrQwpf3CQgstL8S1jGtcH
	7Jjby+XAGGc3t+wUCfImHdAhV1bUwKhppdsyvwoObSjp+vHObdkGQVQvOd67Q/PeDNOfR6zpQFynH
	Lf4RbIRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBuA-0000000A4EY-0gge;
	Tue, 20 Oct 2026 15:37:34 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBu3-0000000A4D5-3DQq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 15:37:33 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-3550c917fd3so4042686eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 08:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792510646; x=1793115446; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ldWxVHDgUgQ18jFdtDAJ8jJd2yZcZSUNdb3f55SGTX0=;
        b=fmJYHPg14qT6cpECQTNdWjH9ueGtUCVzLvREnNUGtP+zZJyzci3Bak7xococZdmolO
         anhI2995vn3xVbb3apXmnAKaeZJMmA++dQR2Te6pWazPBUTMlE7vxHwZKrnx8MuXB30L
         e3JSu80Z0Ivk7+iEMsOzXl076VsxbtPxZr1+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510646; x=1793115446;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ldWxVHDgUgQ18jFdtDAJ8jJd2yZcZSUNdb3f55SGTX0=;
        b=MFMtVvrzLAH64TAhyPwbnCaSL2msoQXvu14HKBvJdxgyjrV/isMVj7m+N5/klg9w7P
         maVQRp6kZ1OO0OYEEQpSyli92t8HJiXfXng+D8VOhKH7WOzFQDeCQSFAj87KuZA13MIH
         iL/AvHkYn/ghE1ma6fliXJshfvhUSRgl8kKk1VD8ywbClSReJvC43r3MrmxjuCcU3nGW
         lzrUl3ei/UnWxVNFP5ZQ8BNsdBZG+D2bayc22EyR0nBw3scLuaNP6JOHxZDazW8JtBjQ
         YU7ZP3u0qE79BdoDNkPDRf9/HSY7GRZY+cJPtwMn++VBZy8ZjB6OvIqKqxpe9YWAU3Q0
         7R6w==
X-Forwarded-Encrypted: i=1; AKwUvBxbaGfOvXRqGMsk5VRTdNw5gkHkil5G8E66yCazVIaKXRgm9CNFm/bnwKGXj5WY3fFJFqyKVZt31mFPkl7KZV09@lists.infradead.org
X-Gm-Message-State: AFq9FYJpAYll7Y/b9l2zhVsCFieYCVmWKryO2tZx7O3V6XjU/GPyI4Fl
	0jDOgcx+2ZiVQ0n4/l+ZvAIcwA6Q1VgqSOekYgq+R94lE8oIg3Z5/YnqAhXxkn3qmw==
X-Gm-Gg: AYBFou1NtCTeuTXJ44fPAjJCt/nvBvE9BgaBtKrmt0Bi1okzFUZuqHNVrV9YT315q+z
	Pu2NYMpoxrfCbcg041cj8bkF+vQLPpX7iJ3Mp+j0VHrUx2Gn/P6w+aandxxK2dpMDJCAiKGQh62
	MJZ6+ktBhxjPfTAlOcqeTaAVMSWNjcxFFVPD32zm5N6p3/RGmMXLNH0l4ChDumPoSNfssuvx+6e
	ZcNSIR4ma7skIXCRkJlLg8Yb8mze2kz8Dmj/rN+y5a8X1bfjWQJ1DW2bpg2Lv+Ysk+eI5eqI8PD
	amcUXEyXaRIHnZbWv0TsUWdJZ5y9NijdEELIpFucdVQecCghS42RASZZJJEen/4PkdI01pnlKID
	HCHo3yt8ggUxJjR4Cf+scEypMpAYNSrio+xtgkBsJ2qxDq+4XxrbTHE2CE+AL0qegJwMgoDDdj1
	ctWxdt4K22/RjTXZdrpjtADPos96edk8gUrUxGwHtoHOIEjriHjbUzjz4YSUaO8lSqqfvK8v3nL
	mYuo7Vm/sQZfe5ppgLcG/Uhqtuk2L6tiaN7gbpHkNhL515i+rLiBuGzaUY=
X-Received: by 2002:a05:7300:d409:b0:351:1e2e:da4d with SMTP id 5a478bee46e88-361a1f5019bmr16718087eec.23.1792510646054;
        Tue, 20 Oct 2026 08:37:26 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:1eb1:e432:2cc7:349c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm51324714eec.3.2026.10.20.08.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:37:25 -0700 (PDT)
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
	Andrew Jones <andrew.jones@linux.dev>,
	Bjorn Andersson <andersson@kernel.org>,
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
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Rong Xu <xur@google.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	cros-qcom-dts-watchers@chromium.org,
	devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
Date: Tue, 20 Oct 2026 08:35:18 -0700
Message-ID: <20261020153652.2907186-1-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_083727_847813_C85D0E6B 
X-CRM114-Status: GOOD (  22.75  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,T_PDS_OTHER_BAD_TLD,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


The end goal of this series is to move forward on producing a
"universal" Pixel 10 boot image that can boot on a variety of Pixel
10 devices (frankel, blazer, and mustang and eventually multiple
revisions of each). At the moment, this is impossible since the Pixel
10 bootloader:
* Picks the base devicetree based on SoC ID information.
* Picks an overlay devicetree based on Board ID information.
* Needs metadata associated with each overlay to match it up.

Since we don't have per-board overlays and don't have per-board
metadata, that means that today you need to pick exactly one revision
of one board and build a boot image just for that.

How does this series help us?
1. It uses a checked-in .its script to associate metadata with each
   board's devicetree. Other tools can parse this metadata in order to
   craft a package that the Pixel bootloader can understand.
2. It integrates a call to the new `fdtfactor` tool [1], which results
   in a "base dtb + board dtbo" that looks like what the bootloader
   needs, at least as long as all the boards have the same SoC.

What happens if everyone hates this series and it gets dropped on the
floor? Honestly, everything here could just go out of tree and it
would be "fine". IMO it's nice to have the Board ID / SoC ID
information for each devicetree stored in the same repository as the
devicetrees themselves are, but if this has to live somewhere else
then so be it.

NOTE: from reading the above, you might wonder why the sc7180-trogdor
.its script is part of this series. The answer: it's a board I was
previously deeply involved in and it is a convenient way for me to
prove out that the Chromebook use case works well. I did hack up some
changes to the ChromeOS build system to use the provided FIT image and
it worked great, but since I'm not on the ChromeOS team these days
it's not something I personally plan to follow-up with. It sounds
plausible that Chen-Yu may follow-up with it or post a similar change
for some Mediatek Chromebooks.

[1] http://lore.kernel.org/r/20261015182221.2931742-1-dianders@chromium.org


Douglas Anderson (7):
  scripts/dtc: Add fdtget.c and fdtput.c to sync script
  scripts/dtc: Update to upstream version v1.8.1-22-gf3451d12532b
  scripts/dtc: Build fdtget and fdtput host tools
  arm64: boot: Support building image.fit from a specified FIT_ITS
    script
  kbuild: fit: Add opt-in FIT_FACTOR_DTBS support using fdtfactor
  arm64: dts: google: lga: Add lga.its FIT image script
  arm64: dts: qcom: sc7180: Add sc7180-trogdor.its FIT image script

 Makefile                                    |   2 +-
 arch/arm64/Makefile                         |   3 +
 arch/arm64/boot/Makefile                    |   9 +-
 arch/arm64/boot/dts/google/lga.its          |  68 ++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.its | 728 ++++++++++++++++++++
 scripts/Makefile.dtbs                       |  51 +-
 scripts/Makefile.lib                        |  67 +-
 scripts/dtc/.gitignore                      |   2 +
 scripts/dtc/Makefile                        |   6 +-
 scripts/dtc/checks.c                        |   2 +-
 scripts/dtc/fdtget.c                        | 207 +++---
 scripts/dtc/fdtput.c                        | 280 ++++++--
 scripts/dtc/libfdt/fdt_ro.c                 |   2 +
 scripts/dtc/libfdt/fdt_rw.c                 |  41 +-
 scripts/dtc/libfdt/fdt_sw.c                 |   3 +-
 scripts/dtc/libfdt/libfdt.h                 |  70 +-
 scripts/dtc/livetree.c                      |   2 +-
 scripts/dtc/update-dtc-source.sh            |   4 +-
 scripts/dtc/version_gen.h                   |   2 +-
 19 files changed, 1322 insertions(+), 227 deletions(-)
 create mode 100644 arch/arm64/boot/dts/google/lga.its
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor.its

-- 
2.56.0.212.g129ede20d9-goog


